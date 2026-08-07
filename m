Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4453C3F3280
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110152; cv=none; b=WfTv1lRTVoUBWt7EtoEfMINIucp+hcro9biIU2vlyQUVzZD7WA3Wo2Ad9F6+xUaJ6f8tKyQbuWTAvG0ecsTpX2wuBqiuFaR0aIOs+eh5I/iZYuxfBGJV7ZtDwPKKDgjVsLCi72Ajyb1PtAwsmaZtpm79KDrbUOt8nz+XH+MagiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110152; c=relaxed/simple;
	bh=fh8NM6zyxMaYP0hAA6qFM5aMrVmcOg95zJeEFrhLIP0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rcElcPZJKUfCFOmWc7t3SwDEazZYBwdpmz/mXl0OyYuTgfpDFJGNRNGmMG/t+29QOJyQ/rjq0eCumYTfdg3fb2LQZtOVOEsUIoTMxZXpo8J4j1HLKU3Qld/0PIRtFSVaIdN0EVyJIGiwM7GQdMuHuz+Vu+bJy9DVFYBdB47EqSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeRcRhVi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeRcRhVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173A51F000E9;
	Fri,  7 Aug 2026 13:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786110140;
	bh=uTUoOSD2JKxRdDvc4+FlKChviS2uOIz0dBiQmvhI6l4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JeRcRhVi5z0eOjfOFbbo7gXsFQn7I3g7ZFzJKi6UL6e08xja7JvzZpchjjOlLQUoM
	 9gtXkcexNjfcnCfxfOGJnhMybcoVI87MLgNFzgfRbhfV1Ne/H+Ii71WOfHYOOqc4v0
	 OKa6JaAAn4yHIg3DgAEvUzkTbCvpdhWL8wa173TtDWmxfiwdvkgTN3O/Gxez93MP59
	 6R69S0yGWXZ96mkXuFPoP5JS2/PgSw1Xd2PJbyuBuUJShLjGz92/iO0jtsiGZihi4E
	 NurddaT7RIs3lVnPhplGbYd1tYrcxpi5pT+6veUVshRSUFq9+LpehZZOrlSKBfNbnS
	 9yFCiVF/ILpWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 15/22] media: i2c: add Maxim GMSL2/3 deserializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260807-gmsl2-3_serdes-v15-15-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-15-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:42:19 +0000
Message-Id: <20260807134220.173A51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] Stack buffer overflow in `max_des_get_frame_desc_state` via un=
bounded route entries
- [High] Race condition in I2C MUX selection and serializer initialization
- [High] Blind assumption of serializer identity leads to hardware corrupti=
on of other I2C devices
- [High] Synchronous driver probing bypasses serializer I2C bus notifier in=
itialization
- [High] NULL pointer dereference in `max_des_phy_hw_data_lanes` when PHY c=
onfigurations are absent
- [High] TOCTOU race in `max_des_route_to_hw` leading to stack out-of-bound=
s access
- [High] Hardware state machine violation due to incorrect stream disable o=
rdering
- [High] NULL pointer dereference when invoking optional `des->ops` functio=
ns
- [Medium] Undefined behavior from `BIT_ULL(route->sink_stream)` with unbou=
nded stream IDs
- [Medium] API violation in `max_des_set_tpg_fmt` and `max_des_set_frame_in=
terval` returning `-EINVAL`
--

--- Patch [15]: [PATCH v15 15/22] media: i2c: add Maxim GMSL2/3 deserialize=
r framework ---
Hi,

Thank you for the patch. I have a few questions and observations regarding
some potential issues I noticed during review.

commit 4eafc7084d0daa6783fda7c82ba0abf24d42f7dd
Author: Cosmin Tanislav <demonsingur@gmail.com>
Subject: media: i2c: add Maxim GMSL2/3 deserializer framework

This patch adds a common framework for Maxim GMSL2/3 deserializer drivers.
It introduces features like the Streams API support, I2C ATR, and automatic
link negotiation.

> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c=
/maxim-serdes/max_des.c
> index 0000000000000..93253068a6ada
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
[ ... ]
> @@ -288,29 +288,29 @@ static int max_des_route_to_hw(struct max_des_priv =
*priv,
> 			       struct v4l2_subdev_state *state,
> 			       struct v4l2_subdev_route *route,
> 			       struct max_des_route_hw *hw)
> {
[ ... ]
> 	ret =3D v4l2_subdev_call(hw->source->sd, pad, get_frame_desc,
> 			       hw->source->pad, &fd);
[ ... ]
> @@ -400,10 +400,10 @@ static int max_des_get_src_dst_vc_id(struct max_des=
_remap_context *context,
> 				     unsigned int pipe_id, unsigned int phy_id,
> 				     unsigned int src_vc_id, unsigned int *dst_vc_id)
> {
> 	if (!(context->vc_ids_masks[pipe_id][phy_id] & BIT(src_vc_id)))
> 		return -ENOENT;
>=20
> 	*dst_vc_id =3D context->vc_ids_map[pipe_id][phy_id][src_vc_id];

[Severity: High]
Are we at risk of a time-of-check to time-of-use race here?

V4L2 locks are per-subdevice, meaning the remote subdevice's frame
descriptor can be reconfigured concurrently. If max_des_route_to_hw() calls
get_frame_desc multiple times across stream updates, a malicious or updated
src_vc_id could bypass bounds checking and lead to an out-of-bounds access
on the stack variable context->vc_ids_map.

[ ... ]
> @@ -641,20 +641,20 @@ static int max_des_get_pipe_vc_remaps(struct max_de=
s_priv *priv,
[ ... ]
> 	for_each_active_route(&state->routing, route) {
> 		unsigned int src_vc_id, dst_vc_id;
> 		struct max_des_route_hw hw;
>=20
> 		if (!(BIT_ULL(route->sink_stream) & streams_masks[route->sink_pad]))
> 			continue;

[Severity: Medium]
Is it possible for route->sink_stream to exceed the bounds of unsigned long
long?

If unprivileged userspace provides a routing table with a sink_stream value
of 64 or greater, this shift will cause undefined behavior.

[ ... ]
> @@ -1054,34 +1054,34 @@ static int max_des_init_link_ser_xlate(struct max=
_des_priv *priv,
> 				       struct max_des_link *link,
> 				       struct i2c_adapter *adapter,
> 				       u8 power_up_addr, u8 new_addr)
> {
> 	struct max_des *des =3D priv->des;
> 	u8 addrs[] =3D { power_up_addr, new_addr };
> 	u8 current_addr;
> 	int ret;
>=20
> 	ret =3D des->ops->select_links(des, BIT(link->index));

[Severity: High]
Does this code guarantee that the select_links operation is implemented?

If a deserializer variant lacks this optional callback, calling it
unconditionally will cause a null pointer dereference and kernel panic.

> 	if (ret)
> 		return ret;
>=20
> 	ret =3D max_ser_wait_for_multiple(adapter, addrs, ARRAY_SIZE(addrs),
> 					&current_addr);

[Severity: High]
Could concurrent traffic on other downstream MUX channels alter the hardware
MUX selection here?

Because the parent I2C bus lock isn't held between the select_links() call
and the subsequent I2C commands on the adapter, other device probing activi=
ty
could misroute these initialization commands to the wrong GMSL link.

[ ... ]
> @@ -1320,17 +1320,17 @@ static int max_des_i2c_mux_bus_notifier_call(stru=
ct notifier_block *nb,
[ ... ]
> 	for (i =3D 0; i < des->info->num_links; i++) {
> 		if (des->links[i].enabled &&
> 		    client->adapter =3D=3D des->links[i].adapter)
> 			break;
> 	}
>=20
> 	if (i =3D=3D des->info->num_links)
> 		return NOTIFY_DONE;

[Severity: High]
Might this synchronous adapter registration fail to match the notifier?

When i2c_mux_add_adapter() probes child devices synchronously in
max_des_i2c_mux_init(), this notifier is triggered before link->adapter is
populated. Since client->adapter won't match the uninitialized link->adapte=
r,
the initialization gets skipped.

>=20
> 	max_des_ser_attach_addr(priv, i, client->addr, client->addr);

[Severity: High]
Can this logic incorrectly match another device probing on the bus?

It assumes any BUS_NOTIFY_BIND_DRIVER event on the downstream adapter
belongs to the serializer. If a camera sensor or PMIC happens to probe firs=
t,
max_des_ser_attach_addr() will execute GMSL initialization sequences on it,
potentially causing hardware corruption.

[ ... ]
> @@ -1357,21 +1357,21 @@ static int max_des_i2c_mux_init(struct max_des_pr=
iv *priv)
> {
[ ... ]
> 	for (i =3D 0; i < des->info->num_links; i++) {
> 		struct max_des_link *link =3D &des->links[i];
>=20
> 		if (!link->enabled)
> 			continue;
>=20
> 		ret =3D i2c_mux_add_adapter(priv->mux, 0, i);
> 		if (ret)
> 			goto err_add_adapters;
>=20
> 		link->adapter =3D priv->mux->adapter[priv->mux->num_adapters - 1];

This isn't a separate bug, but it is related to the previous comment. This =
is
where link->adapter is assigned too late to be matched by synchronous probes
triggered inside i2c_mux_add_adapter().

[ ... ]
> @@ -1379,15 +1379,15 @@ static int max_des_set_tpg_fmt(struct v4l2_subdev=
 *sd,
[ ... ]
> 	entry =3D max_des_find_tpg_entry(des, 0, fmt->width, fmt->height,
> 				       fmt->code, 0, 0);
> 	if (!entry)
> 		return -EINVAL;

[Severity: Medium]
Should this format negotiation return an error instead of adjusting the
parameters?

The V4L2 Subdevice API specification requires set_fmt and set_frame_interval
to adjust requested but unsupported parameters to the closest hardware matc=
h,
rather than returning an error.

[ ... ]
> @@ -1451,15 +1451,15 @@ static int max_des_set_frame_interval(struct v4l2=
_subdev *sd,
[ ... ]
> 	entry =3D max_des_find_tpg_entry(des, 0, fmt->width, fmt->height,
> 				       fmt->code, fi->interval.numerator,
> 				       fi->interval.denominator);
> 	if (!entry)
> 		return -EINVAL;

This isn't a separate bug, but the same API mismatch applies here for
unsupported frame intervals.

[ ... ]
> @@ -1661,16 +1661,16 @@ static int max_des_get_frame_desc_state(struct v4=
l2_subdev *sd,
[ ... ]
> 		hw.entry.bus.csi2.vc =3D dst_vc_id;
> 		hw.entry.stream =3D route->source_stream;
>=20
> 		fd->entry[fd->num_entries++] =3D hw.entry;

[Severity: Critical]
Is there a risk of a stack buffer overflow here if userspace configures
many routes?

The v4l2_mbus_frame_desc structure contains a fixed size array bounded by
V4L2_FRAME_DESC_ENTRY_MAX. If unprivileged userspace multiplexes more active
routes to the same pad than the array can hold, this loop will write out
of bounds on the stack.

[ ... ]
> @@ -1942,9 +1942,9 @@ int max_des_phy_hw_data_lanes(struct max_des *des, =
struct max_des_phy *phy)
> {
> 	const struct max_serdes_phys_configs *configs =3D &des->info->phys_confi=
gs;
> 	const struct max_serdes_phys_config *config =3D
> 		&configs->configs[des->phys_config];
>=20
> 	return config->lanes[phy->index];

[Severity: High]
Could configs->configs be null when evaluated here?

If a deserializer has no explicit PHY configurations
(des->info->phys_configs.num_configs =3D=3D 0), max_des_find_phys_config()
returns early. Accessing the configs array will compute a null-based pointe=
r,
causing a crash when dereferencing config->lanes.

[ ... ]
> @@ -2285,15 +2285,15 @@ static int max_des_update_streams(struct v4l2_sub=
dev *sd,
[ ... ]
> 	ret =3D max_des_set_vc_remaps(priv, &context, state, streams_masks);
> 	if (ret)
> 		goto err_free_streams_masks;
>=20
> 	ret =3D max_des_set_pipes_stream_id(priv);
> 	if (ret)
> 		goto err_free_streams_masks;
>=20
> 	if (!enable) {
> 		ret =3D max_des_enable_disable_streams(priv, state, pad,
> 						     updated_streams_mask, enable);

[Severity: High]
Will stopping the stream in this order cause hardware protocol errors?

The driver removes the VC remap from the serializer's hardware configuration
via max_des_set_vc_remaps() before invoking max_des_enable_disable_streams()
to actually stop the downstream sensor. Altering routing while the sensor is
still actively transmitting data could drop or misroute frames.

[ ... ]
> @@ -2574,9 +2574,9 @@ static int max_des_g_register(struct v4l2_subdev *s=
d,
> 			      struct v4l2_dbg_register *reg)
> {
> 	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> 	struct max_des *des =3D priv->des;
> 	unsigned int val;
> 	int ret;
>=20
> 	ret =3D des->ops->reg_read(des, reg->reg, &val);

[Severity: High]
Are these debugfs callbacks guaranteed to be implemented by all chip varian=
ts?

If des->ops->reg_read or reg_write are not implemented, these unconditional
invocations will trigger a null pointer dereference.

> 	if (ret)
> 		return ret;
[ ... ]
> @@ -2589,7 +2589,7 @@ static int max_des_s_register(struct v4l2_subdev *s=
d,
> 			      const struct v4l2_dbg_register *reg)
> {
> 	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> 	struct max_des *des =3D priv->des;
>=20
> 	return des->ops->reg_write(des, reg->reg, reg->val);
> }

This isn't a separate bug, but the same missing check applies for reg_write
here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gmsl2-3_se=
rdes-v15-0-7212e9e5156a@analog.com?part=3D15
