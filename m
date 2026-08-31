Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7274ACC77
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184046; cv=none; b=PI98dZwvWTV0ObX0PNpN66RHyr63BWwqpJ+EOvEkjIXCYXsAsrRdcDHj1xEUU7KmSG79Y9bajSBVMrPM3LLT+fynoXS8IZPrwA05nzWTvMXMV6ctkp03fO/5mHR+waqreoi22+6BzJRvLPFDCI7iIaLSy2YhAvbvOmNrrxjUG7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184046; c=relaxed/simple;
	bh=N4mNKFuYaOhlHlGhbYtjqkLaTvMIyWLuSgW16mqrbCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eeUZaEjbcPBKdNppZNFrt1pHTcwxqsLk0fSYypLknLbgkr477i4polouAyqJ8ssgivg26p8WekwxQMGrWizKkex7nz/NP/RZSUx7NM+ScsGO0SuNBpsNqKvG8FwgmPDK+IdhYSXn8wshEOP1u6FcWivPk8n1NbP2Kg2tFPVP/uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5UNkYIb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5UNkYIb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91361F00A3E;
	Mon, 31 Aug 2026 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184042;
	bh=0wnuQhDq0b7YL8+X8HbxBpzpj6BpsR3jJcw2EcxH1mw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P5UNkYIbssnEOopio20ZSSiCwgzr3dLOx+LwhzL6HFVC7FmhyR41o7nooj1apcn5J
	 66uL2C1T3d9vla52c/lVgSMLClRpFx91gbG9mQBfhxRPJqfQd7FBpUoUva9m0kLZnW
	 W1ceKw0u7vQQ04F0xnkTR31EkBv/9Z4+WdbW63kDMMakhSjw6QFhEH+eVorY+4tSnX
	 p52LoohuUXBQphrHFREoUvQeG84j9a63gzT99DFuQ8ocbOy8FW8gDvIAN2KtQj+mB2
	 6s9pAbAFUD11OqBrNUaFZp7Qn8uTRP+FlzGoQr7SmaBuFykjfHKuYRQzDt9o8q+PkT
	 jcQXcdWNFR81Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 15/22] media: i2c: add Maxim GMSL2/3 deserializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260831-gmsl2-3_serdes-v16-15-4fa6e08bb514@analog.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831-gmsl2-3_serdes-v16-15-4fa6e08bb514@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:47:21 +0000
Message-Id: <20260831134721.E91361F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] The I2C bus notifier erroneously assumes ANY I2C device binding on=
 the downstream bus is the Serializer, corrupting non-serializer devices.
- [High] Unsafe state rollback and runtime `devm_kcalloc` during stream ena=
ble can permanently corrupt state.
- [High] Stack buffer overflow in `max_des_get_frame_desc_state` when writi=
ng to `fd->entry` with more than `V4L2_MBUS_FRAME_DESC_MAX` active routes.
- [High] Serializer initialization bypasses the I2C mux lock, corrupting co=
ncurrent I2C bus transfers.
- [High] Asynchronous child device probing can miss serializer initializati=
on due to delayed assignment of `link->adapter`.
- [High] Lockless access to the unbound child subdevice pointer (`source->s=
d`) leads to use-after-free.
- [High] A double-fetch of the frame descriptor from the remote subdevice a=
llows bypassing virtual channel bounds checks, leading to an out-of-bounds =
stack read.
- [Medium] Potential NULL pointer dereference in `max_des_phy_hw_data_lanes=
` when `num_configs` is 0.
- [Medium] `max_des_set_fmt` incorrectly returns `-EINVAL` if a stream is n=
ot yet routed.
- [Medium] `set_fmt` and `set_frame_interval` incorrectly return `-EINVAL` =
for unsupported format and interval values on the TPG pad.
- [Medium] Changes to the V4L2 test pattern control do not dynamically upda=
te the hardware.
- [Medium] TOCTOU race on `link->ser_xlate.en` allows multiple concurrent i=
nitializations of the same serializer.
--

commit 4d2eca915c5faea8efb64fb2a7fdbf043fb5a369
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: add Maxim GMSL2/3 deserializer framework

This adds a common framework for Maxim GMSL2/3 deserializers. It provides
support for the full Streams API, test pattern generation (TPG), I2C ATR,
automatic stream ID selection, and automatic PHY/mode negotiation across
the supported chips.

> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c=
/maxim-serdes/max_des.c
> index 0000000000000..4046a62e716b9
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
[ ... ]
> +static int max_des_get_src_dst_vc_id(struct max_des_remap_context *conte=
xt,
> +				     unsigned int pipe_id, unsigned int phy_id,
> +				     unsigned int src_vc_id, unsigned int *dst_vc_id)
> +{
> +	if (!(context->vc_ids_masks[pipe_id][phy_id] & BIT(src_vc_id)))
> +		return -ENOENT;
> +
> +	*dst_vc_id =3D context->vc_ids_map[pipe_id][phy_id][src_vc_id];

[Severity: High]
Could a double-fetch of the frame descriptor bypass the virtual channel
bounds checks?

Functions like max_des_update_streams() iterate over active routes multiple
times, calling max_des_route_to_hw() which fetches the frame descriptor via
v4l2_subdev_call(get_frame_desc). In the first pass
(max_des_populate_remap_context), the virtual channel ID is checked against
bounds.

In the second pass, the descriptor is fetched again. If a concurrent ioctl =
on
the remote subdevice alters the virtual channel to an unvalidated value, the
new value is passed here as src_vc_id.

This would perform an out-of-bounds read on the local stack struct, leaking
kernel memory into the stream configuration.

[ ... ]
> +static int max_des_set_tunnel(struct max_des_priv *priv,
> +			      struct max_des_remap_context *context)
> +{
[ ... ]
> +		if (!hw.source->sd)
> +			continue;
> +
> +		if (!context->pipe_in_use[hw.pipe->index])
> +			continue;
> +
> +		ret =3D max_ser_set_mode(hw.source->sd, context->mode);

[Severity: High]
Is it possible for hw.source->sd to be freed between the check and its use?

The pointer hw.source->sd is verified here, but in max_des_notify_unbind()
it is cleared to NULL without any locking against this path. Since this isn=
't
serialized against the V4L2 async framework's unbind callback, the subdevice
could be unbound and freed immediately after the NULL check, resulting in a
use-after-free when passed to max_ser_set_mode().

[ ... ]
> +static int max_des_update_pipe_remaps(struct max_des_priv *priv,
> +				      struct max_des_remap_context *context,
> +				      struct max_des_pipe *pipe,
> +				      struct v4l2_subdev_state *state,
> +				      u64 *streams_masks)
> +{
[ ... ]
> +	remaps =3D devm_kcalloc(priv->dev, des->info->num_remaps_per_pipe,
> +			      sizeof(*remaps), GFP_KERNEL);

[Severity: High]
Are runtime allocations during stream enable safe here?

The functions max_des_update_pipe_remaps() and max_des_update_pipe_vc_remap=
s()
use devm_kcalloc() during stream enablement, which can fail.

[ ... ]
> +static int max_des_update_pipe(struct max_des_priv *priv,
> +			       struct max_des_remap_context *context,
> +			       struct max_des_pipe *pipe,
> +			       struct v4l2_subdev_state *state,
> +			       u64 *streams_masks)
> +{
[ ... ]
> +err_revert_update_pipe_vc_remaps:
> +	max_des_update_pipe_vc_remaps(priv, context, pipe, state,
> +				      priv->streams_masks);
> +
> +err_revert_update_pipe_remaps:
> +	max_des_update_pipe_remaps(priv, context, pipe, state,
> +				   priv->streams_masks);

[Severity: High]
Could a failure during this rollback permanently corrupt the system state?

Because max_des_update_pipe_remaps() relies on memory allocation, if the
allocation fails during this error rollback path, the failure is ignored.
This would leave the software state and hardware registers permanently out
of sync.

[ ... ]
> +static int max_des_init_link_ser_xlate(struct max_des_priv *priv,
> +				       struct max_des_link *link,
> +				       struct i2c_adapter *adapter,
> +				       u8 power_up_addr, u8 new_addr)
> +{
[ ... ]
> +	if (des->ops->select_links) {
> +		ret =3D des->ops->select_links(des, BIT(link->index));
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Does this bypass the I2C mux lock?

When use_atr =3D=3D false, the driver uses I2C_MUX_LOCKED so normal I2C chi=
ld
transfers hold the mux lock while routing is changed via select_links().
However, this function is called directly from the bus notifier when child
devices bind.

Calling select_links() here alters the hardware I2C routing without acquiri=
ng
the mux lock, which might hijack the routing while another child adapter is
in the middle of a transfer.

[ ... ]
> +static int max_des_ser_attach_addr(struct max_des_priv *priv, u32 chan_i=
d,
> +				   u16 addr, u16 alias)
> +{
[ ... ]
> +	if (link->ser_xlate.en) {
> +		dev_err(priv->dev, "Serializer for link %u already bound\n",
> +			link->index);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Is this check susceptible to a time-of-check to time-of-use race?

This is called from the I2C bus notifier, which can be invoked concurrently=
 on
multiple CPUs if multiple devices on the same link probe simultaneously.
Without a lock protecting the check-and-update sequence, multiple threads
could bypass this check and concurrently initialize the same serializer.

[ ... ]
> +out_select_links:
> +	if (!des->ops->select_links)
> +		return ret;
> +
> +	mask =3D max_des_enabled_links_mask(des);
> +	err =3D des->ops->select_links(des, mask);

[Severity: High]
Does this locklessly restore the link state, potentially trampling concurre=
nt
mux selections?

As with the earlier select_links() call, this modifies the hardware state
without holding the I2C mux lock.

[ ... ]
> +static int max_des_i2c_mux_bus_notifier_call(struct notifier_block *nb,
> +					     unsigned long event, void *device)
> +{
[ ... ]
> +	if (i =3D=3D des->info->num_links)
> +		return NOTIFY_DONE;
> +
> +	max_des_ser_attach_addr(priv, i, client->addr, client->addr);

[Severity: High]
Will this incorrectly initialize non-serializer devices?

The notifier intercepts BUS_NOTIFY_BIND_DRIVER on child I2C adapters and
blindly passes the newly bound client's address to max_des_ser_attach_addr(=
),
assuming it is the serializer.

If a non-serializer device (e.g., an EEPROM or image sensor) binds first, it
will be sent GMSL-specific I2C writes, which might corrupt its state. This
also marks link->ser_xlate.en as true, preventing the actual serializer from
binding successfully.

[ ... ]
> +static int max_des_i2c_mux_init(struct max_des_priv *priv)
> +{
[ ... ]
> +		ret =3D i2c_mux_add_adapter(priv->mux, 0, i);
> +		priv->pending_task =3D NULL;
> +		priv->pending_link =3D NULL;
> +		if (ret)
> +			goto err_add_adapters;
> +
> +		link->adapter =3D priv->mux->adapter[priv->mux->num_adapters - 1];

[Severity: High]
Could asynchronous child device probing miss the serializer initialization?

i2c_mux_add_adapter() registers the child I2C adapter, which triggers device
addition and can immediately spawn asynchronous probes in worker threads.
link->adapter is only assigned AFTER this returns.

If an asynchronous probe binds the child driver before the assignment occur=
s,
the BUS_NOTIFY_BIND_DRIVER notifier will fail to match=20
client->adapter =3D=3D des->links[i].adapter because link->adapter is still=
 NULL.
The device would be ignored, leaving the serializer uninitialized.

[ ... ]
> +static int max_des_set_tpg_fmt(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	entry =3D max_des_find_tpg_entry(des, 0, fmt->width, fmt->height,
> +				       fmt->code, 0, 0);
> +	if (!entry)
> +		return -EINVAL;

[Severity: Medium]
Should this adjust the parameters instead of returning -EINVAL?

According to the V4L2 subdevice specification, VIDIOC_SUBDEV_S_FMT must not
fail with -EINVAL when the requested dimensions or codes are unsupported.
Instead, drivers must adjust the requested values to a supported configurat=
ion.

[ ... ]
> +static int max_des_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state,
> +			   struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;

[Severity: Medium]
Does returning -EINVAL here break userspace applications that set pad forma=
ts
before establishing routing?

If the stream does not have an active route yet,=20
v4l2_subdev_state_get_opposite_stream_format() returns NULL. Failing the
ioctl violates the V4L2 spec, which allows configuring pad formats before
active routing is established.

[ ... ]
> +static int max_des_set_frame_interval(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      struct v4l2_subdev_frame_interval *fi)
> +{
[ ... ]
> +	entry =3D max_des_find_tpg_entry(des, 0, fmt->width, fmt->height,
> +				       fmt->code, fi->interval.numerator,
> +				       fi->interval.denominator);
> +	if (!entry)
> +		return -EINVAL;

[Severity: Medium]
As with set_fmt, shouldn't this adjust the frame interval to a supported
value rather than returning -EINVAL?

[ ... ]
> +static int max_des_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct max_des_priv *priv =3D ctrl_to_priv(ctrl->handler);
> +	struct max_des *des =3D priv->des;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		des->tpg_pattern =3D ctrl->val;
> +		return 0;
> +	}

[Severity: Medium]
Does this omit dynamically updating the hardware with the new test pattern?

This records the new value in des->tpg_pattern, but because
max_des_update_tpg() only checks if entry =3D=3D des->tpg_entry (which trac=
ks
format and interval, not the chosen pattern), the hardware will not apply
the new pattern even if the stream is toggled.

[ ... ]
> +static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					struct v4l2_mbus_frame_desc *fd,
> +					unsigned int pad)
> +{
[ ... ]
> +	for_each_active_route(&state->routing, route) {
[ ... ]
> +		hw.entry.bus.csi2.vc =3D dst_vc_id;
> +		hw.entry.stream =3D route->source_stream;
> +
> +		fd->entry[fd->num_entries++] =3D hw.entry;
> +	}

[Severity: High]
Could this cause a stack buffer overflow?

The V4L2 Streams API allows up to 256 routes (V4L2_SUBDEV_MAX_ROUTING_ENTRI=
ES).
This loop blindly appends to fd->entry[fd->num_entries++] for every active
route. Since fd->entry is a fixed-size array (V4L2_MBUS_FRAME_DESC_MAX,
typically 8) inside struct v4l2_mbus_frame_desc, supplying more than 8 rout=
es
will overflow the array and corrupt the stack.

[ ... ]
> +static void max_des_notify_unbind(struct v4l2_async_notifier *nf,
> +				  struct v4l2_subdev *subdev,
> +				  struct v4l2_async_connection *base_asc)
> +{
> +	struct max_serdes_asc *asc =3D asc_to_max(base_asc);
> +	struct max_serdes_source *source =3D asc->source;
> +
> +	source->sd =3D NULL;
> +}

[Severity: High]
As noted above in max_des_set_tunnel(), clearing source->sd locklessly here
opens a race condition that can lead to a use-after-free.

[ ... ]
> +int max_des_phy_hw_data_lanes(struct max_des *des, struct max_des_phy *p=
hy)
> +{
> +	const struct max_serdes_phys_configs *configs =3D &des->info->phys_conf=
igs;
> +	const struct max_serdes_phys_config *config =3D
> +		&configs->configs[des->phys_config];
> +
> +	return config->lanes[phy->index];
> +}

[Severity: Medium]
Will this dereference a NULL pointer if configs->num_configs is 0?

[ ... ]
> +static int max_des_parse_dt(struct max_des_priv *priv)
> +{
[ ... ]
> +	/*
> +	 * Find an unused PHY to send unmapped data to.
> +	 *
> +	 * Skip PHYs that have no hardware data lanes of their own: those are
> +	 * absorbed into another PHY by the selected configuration, so sending
> +	 * unmapped data to them would corrupt the PHY they are merged with.
> +	 */
> +	for (i =3D 0; i < des->info->num_phys; i++) {
> +		phy =3D &des->phys[i];
> +
> +		if (!phy->enabled && max_des_phy_hw_data_lanes(des, phy)) {

[Severity: Medium]
If a driver defines max_des_info with phys_configs.num_configs as 0, the
framework correctly skips it in max_des_find_phys_config(). However, this
loop unconditionally calls max_des_phy_hw_data_lanes() during probe, which
unconditionally dereferences configs->configs (as asked above).

This would crash if configs->configs is uninitialized or NULL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-gmsl2-3_se=
rdes-v16-0-4fa6e08bb514@analog.com?part=3D15
