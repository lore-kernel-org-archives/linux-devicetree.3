Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5A525783C
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961850; cv=none; b=QojSKoroReDZODyi05ZRSmjh3FvmJ40ObQqXL9wYFpqdTs8miX/0LTSsc/9GSBzjlifPgBHNrwQoMy42vlQkBUwKqhfBiKm0211K6udf54eZJdSABOqd39FglEp+7Vy/lfCOoKmyweVALsqSsQz/NHFOW+FyZu3h1w1zCoIUME8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961850; c=relaxed/simple;
	bh=vACJ/gl/8Q6HRAFIM2844Bhq7UuNKtN8H/RPEjWv6NI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=chZVraY4QBrfUcsBB5+yd+UYxqkmHK6eBNzrzer68/TDDqgOCKcqE8vAP33KndbbLmYtAkwnlP/y6FO01TG+Ctt8geJh8jR0s1dX760PNEmG86gNqGqoi3hf52XOZW4ijApFuh6mSDuzd7I+zukqgX6IMARGDpOhHptM09gSl3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cP+pfvwG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cP+pfvwG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4083F1F00A3E;
	Wed,  9 Sep 2026 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788961848;
	bh=OcXokXBt6ZLas5hiN8/nCNN+AQDDgAJXDv9OxpAHUiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cP+pfvwGMByMUymQdq3Yg/+p0xEtfaFSrwKj7rGbGaWjL0Z/8bKg22PYauel450P8
	 la+jT3B2RRilv1F0rN43clNjzD2Spoiq9zpghbeBiwr39OUu5DiK5/gMOgEEj3TxBA
	 MF1NGdrSi7cd+rS4MP1b+hNTHTOVl/o/hepYP6JXaFRv+g8d9UE0c5qhBFclbR2Hgq
	 1BEH+F3VAHe3/++fplSKTPG7WtfgttfhIHqQlpkX8uMlm7dVmXl68ffBhlkD4Ph04T
	 1eCXWeAguEuk0oWvFTtrZDS1l5Roh2GPwGvwi5+ThiJwP+xdsYMQhg+ULvXrRUB0F/
	 hXsbD5uzxmwQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 15/22] media: i2c: add Maxim GMSL2/3 deserializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260909-gmsl2-3_serdes-v17-15-002499e534e8@analog.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
 <20260909-gmsl2-3_serdes-v17-15-002499e534e8@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 13:50:47 +0000
Message-Id: <20260909135048.4083F1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Stack buffer overflow in max_des_get_frame_desc_state when populat=
ing fd->entry
- [High] Architectural flaw in max_des_ser_attach_addr assumes any newly bo=
und I2C client is the serializer
- [High] NULL pointer dereference due to missing checks for optional callba=
ck operations in max_des_ops
- [High] I2C multiplexer link selection is hijacked during multi-step initi=
alization due to bypassed bus locking
- [High] TOCTOU Use-After-Free race on source->sd pointer when a subdevice =
is unbound
- [Medium] V4L2_CID_TEST_PATTERN change is ignored during active streaming
- [Medium] Dynamic devm allocations (devm_kcalloc/devm_kfree) during stream=
 lifecycle cause performance overhead
- [Medium] S_FMT and S_FRAME_INTERVAL ioctls violate V4L2 API by returning =
-EINVAL for unsupported formats
--

commit fc804e354d0f9ac0df0a4a5df41adb7edd9b1620
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: add Maxim GMSL2/3 deserializer framework

These drivers are meant to be used as a common framework for Maxim GMSL2/3
deserializer. This framework enables support for the following new features
across all the chips.

> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c=
/maxim-serdes/max_des.c
> new file mode 100644
> index 0000000000000..8b6bed6e05f6a
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
> @@ -0,0 +1,3346 @@
[ ... ]
> +static int max_des_route_to_hw(struct max_des_priv *priv,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_route *route,
> +			       struct max_des_route_hw *hw)
> +{
[ ... ]
> +	hw->source =3D max_des_get_link_source(priv, link);
> +	if (!hw->source->sd)
> +		return 0;
> +
> +	ret =3D v4l2_subdev_call(hw->source->sd, pad, get_frame_desc,
> +			       hw->source->pad, &fd);

[Severity: High]
Is there a race condition between reading the `hw->source->sd` pointer here
and the `max_des_notify_unbind` callback?

If `max_des_notify_unbind` asynchronously clears `source->sd =3D NULL` after
the NULL check above but before `v4l2_subdev_call` executes, this could
result in a use-after-free.

[ ... ]
> +static int max_des_set_pipes_stream_id(struct max_des_priv *priv)
> +{
> +	bool stream_id_usage[MAX_SERDES_STREAMS_NUM] =3D { 0 };
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < des->info->num_links; i++) {
> +		struct max_des_link_hw hw;
> +		unsigned int stream_id;
[ ... ]
> +		ret =3D des->ops->set_pipe_stream_id(des, hw.pipe, stream_id);

[Severity: High]
Is it possible that `des->ops->set_pipe_stream_id` is unassigned?

The `log_status` callback correctly checks `if (des->ops->set_pipe_stream_i=
d)`
before printing it, but this execution path calls the callback
unconditionally. If a chip driver does not implement it, this will result
in a NULL pointer dereference.

[ ... ]
> +static int max_des_update_pipe_remaps(struct max_des_priv *priv,
> +				      struct max_des_remap_context *context,
> +				      struct max_des_pipe *pipe,
> +				      struct v4l2_subdev_state *state,
> +				      u64 *streams_masks)
> +{
> +	struct max_des *des =3D priv->des;
> +	struct max_des_remap *remaps;
> +	unsigned int num_remaps;
> +	int ret;
> +
> +	if (!des->ops->set_pipe_remap)
> +		return 0;
> +
> +	remaps =3D devm_kcalloc(priv->dev, des->info->num_remaps_per_pipe,
> +			      sizeof(*remaps), GFP_KERNEL);

[Severity: Medium]
Could this dynamic allocation with `devm_kcalloc()` during stream start/stop
cause performance overhead?

Because devres operations traverse a linked list when freeing memory
with `devm_kfree()`, allocating and freeing device-managed memory during
the stream lifecycle hotpath introduces overhead compared to standard
`kcalloc()`.

[ ... ]
> +static int max_des_init_link_ser_xlate(struct max_des_priv *priv,
> +				       struct max_des_link *link,
> +				       struct i2c_adapter *adapter,
> +				       u8 power_up_addr, u8 new_addr)
> +{
> +	struct max_des *des =3D priv->des;
> +	u8 addrs[] =3D { power_up_addr, new_addr };
> +	u8 current_addr;
> +	int ret;
> +
> +	if (des->ops->select_links) {
> +		ret =3D des->ops->select_links(des, BIT(link->index));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D max_ser_wait_for_multiple(adapter, addrs, ARRAY_SIZE(addrs),
> +					&current_addr);

[Severity: High]
Can concurrent I2C accesses to another MUX channel hijack the active link
here?

The parent I2C bus lock is acquired and released internally by each
distinct transaction. Since it is released between `select_links()` and
`max_ser_wait_for_multiple()`, another thread might trigger the MUX select
callback and redirect the initialization commands to the wrong link.

[ ... ]
> +static int max_des_ser_attach_addr(struct max_des_priv *priv, u32 chan_i=
d,
> +				   u16 addr, u16 alias)
> +{
> +	struct max_des *des =3D priv->des;
> +	struct max_des_link *link =3D &des->links[chan_id];
> +	unsigned int mask;
> +	int i, min, max;
> +	int ret =3D -ENOENT;
> +	int err;
> +
> +	max_des_ser_find_version_range(des, &min, &max);
> +
> +	if (link->ser_xlate.en) {
> +		dev_err(priv->dev, "Serializer for link %u already bound\n",
> +			link->index);
> +		return -EINVAL;
> +	}
> +
> +	for (i =3D max; i >=3D min; i--) {
> +		if (!(des->info->versions & BIT(i)))
> +			continue;
> +
> +		if (des->ops->set_link_version) {
> +			ret =3D des->ops->set_link_version(des, link, i);
> +			if (ret)
> +				goto out_select_links;
> +		}
> +
> +		ret =3D max_des_init_link_ser_xlate(priv, link, priv->client->adapter,
> +						  addr, alias);

[Severity: High]
Does this code verify the identity of the device before sending GMSL
reset sequences?

`max_des_i2c_mux_bus_notifier_call()` unconditionally passes the address of
any newly bound I2C client to this function. If another device, such as a
sensor, binds to the adapter before the actual serializer, it might receive
these proprietary reset commands instead.

[ ... ]
> +static int max_des_set_tpg_fmt(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt =3D &format->format;
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des *des =3D priv->des;
> +	const struct max_serdes_tpg_entry *entry;
> +	struct v4l2_fract *in;
> +
> +	if (format->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -EINVAL;
> +
> +	entry =3D max_des_find_tpg_entry(des, 0, fmt->width, fmt->height,
> +				       fmt->code, 0, 0);
> +	if (!entry)
> +		return -EINVAL;

[Severity: Medium]
Should this function adjust the requested format to the closest supported
match rather than returning `-EINVAL`?

The V4L2 specification typically requires drivers to modify the requested
format to a supported one and return success during `VIDIOC_SUBDEV_S_FMT`,
so userspace can negotiate formats correctly.

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

[Severity: Medium]
Are we dropping valid user requests to dynamically change the test pattern
while streaming?

When the user updates the test pattern, it modifies the software state
`des->tpg_pattern` but does not trigger a hardware update.

[ ... ]
> +static int max_des_update_tpg(struct max_des_priv *priv,
> +			      struct v4l2_subdev_state *state,
> +			      u64 *streams_masks)
> +{
[ ... ]
> +	if (entry =3D=3D des->tpg_entry)
> +		return 0;

Because `des->tpg_entry` is evaluated solely on format dimensions and
intervals, this check will bypass `des->ops->set_tpg` if only the test
pattern index was changed.

[ ... ]
> +static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					struct v4l2_mbus_frame_desc *fd,
> +					unsigned int pad)
> +{
> +	struct max_des_remap_context context =3D { 0 };
> +	struct max_des_priv *priv =3D sd_to_priv(sd);
> +	struct v4l2_subdev_route *route;
> +	int ret;
> +
> +	fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries =3D 0;
> +
> +	ret =3D max_des_populate_remap_context(priv, &context, state);
> +	if (ret)
> +		return ret;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +		unsigned int dst_vc_id;
> +
> +		if (pad !=3D route->source_pad)
> +			continue;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D max_des_get_src_dst_vc_id(&context, hw.pipe->index, hw.phy->in=
dex,
> +						hw.entry.bus.csi2.vc, &dst_vc_id);
> +		if (ret)
> +			return ret;
> +
> +		hw.entry.bus.csi2.vc =3D dst_vc_id;
> +		hw.entry.stream =3D route->source_stream;
> +
> +		fd->entry[fd->num_entries++] =3D hw.entry;

[Severity: High]
Does this code overflow `fd->entry` if `num_entries` exceeds the array size?

If user-space configures more routes mapping distinct sink streams to the
same source pad than the size of the `entry` array allows, it seems
`num_entries` can overflow without an explicit bounds check here.

[ ... ]
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +static int max_des_g_register(struct v4l2_subdev *sd,
> +			      struct v4l2_dbg_register *reg)
> +{
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des *des =3D priv->des;
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D des->ops->reg_read(des, reg->reg, &val);

[Severity: High]
Can `des->ops->reg_read` be unassigned here?

If a chip driver omits the implementation of this optional callback,
this unconditional dereference will cause a kernel panic when accessed
via debugfs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-gmsl2-3_se=
rdes-v17-0-002499e534e8@analog.com?part=3D15
