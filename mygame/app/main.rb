def tick args
  args.outputs.background_color = [64]*3

  args.state.render_target = args.outputs[:canvas]
  args.state.render_target.width = 720
  args.state.render_target.height = 1280
  args.state.render_target.solids << [0,0,720,1280,0,0,0]

  args.state.scale ||= 0.5625

  args.state.calculated_w ||= 720 * args.state.scale
  args.state.calculated_h ||= 1280 * args.state.scale
  args.state.offset_x ||= args.grid.center_x - args.state.calculated_w / 2

  args.state.mouse_calculated = [
    ((args.inputs.mouse.x - args.state.offset_x) / args.state.scale).clamp(0, 720),
    (args.inputs.mouse.y / args.state.scale)
  ]

  args.state.box_size ||= 100

  args.state.render_target.solids << [
    args.state.mouse_calculated.x - args.state.box_size / 2,
    args.state.mouse_calculated.y - args.state.box_size / 2,
    args.state.box_size,
    args.state.box_size,
    255,
    255,
    255]

  args.outputs.sprites << [args.state.offset_x, 0, args.state.calculated_w, args.state.calculated_h, :canvas]
end