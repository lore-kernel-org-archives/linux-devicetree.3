Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91238C2D1
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722700; cv=none; b=HO0+r/Sflt0X+PWJ5cyZ7qXizK9cSff/xnY0/q0u/qA/V5Oigtv8fkkWRQSURuYCM29MsltlJUyLBSkHd8YFNg5JH+0bET7Lzy91MLZOexObkaEL68sr+U8AS7cC/jiZepLuzDRrDgNtDXX82rnyZtBV5smZ8NqdYC0EX+i5FBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722700; c=relaxed/simple;
	bh=wa2VVwYvmEAHjLcEm4I5S038wSA5uAIWRYUE1E05kfc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ldDWNK0KBoSEX/+PhGz0QHfu2MX80E+EXMuSRhMUgZ1h2U426PJlNHH8D9TT8BDV4SVeFsoKlDezFr7VK1S2fQkon9HsWmkEmWyw4JHOSAPwSiza2kJu/aVs4dm7CZZxooXK5n8rJmmOejHboyAxebjR260oBZvtT9YyuaqmI0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSMwrq/d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSMwrq/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397DF1F000FF;
	Tue, 29 Sep 2026 22:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722698;
	bh=TIEPeS279TqG40Bf+JgmQEghBdE+7y3rw+JZZwMIKvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lSMwrq/dtU2lCFbcZDf/iL3RMPECLhuj8g1uj8kS87+F33fHzcbfuSVP1hMTriQhp
	 hNl1gkJXJhf3vDupT14cKxU1SwDTYSw5voWLzb05G1qr9zuwq7X97AtnY8/j0/EVWy
	 ojweS0XScVUgSHePBhILl9wyI6LnXaaxsjFRc5QBQ40ibmMczP23VLq6SVEhTGapze
	 iYpMuv5520WYeZWH0+UuLJAc58yBjfIXOOAFhu3W8uCCiPPmmbDvi74jDtIeVs2vaG
	 OOf6+w5J5C81/RGwdzLoGoIP3VPwHaC6muJPR5y8Cgj5j7PmkoC+sVq3fQIWXFTZwN
	 TR26oLe6ItytQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 16/23] media: i2c: add Maxim GMSL2/3 deserializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260930-gmsl2-3_serdes-v18-16-43117818f499@analog.com>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
 <20260930-gmsl2-3_serdes-v18-16-43117818f499@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:58:17 +0000
Message-Id: <20260929225818.397DF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [Critical] media: stack buffer overflow in max_des_get_frame_desc_state d=
ue to unbounded routes
- [High] media: misidentification of unrelated I2C clients binding synchron=
ously
- [High] media: TOCTOU and OOB array access when querying remote subdevice =
VC ID
- [High] media: conditional overwrites valid PHY ID in PIXEL mode
- [High] media: missing locking around shared I2C link selection
- [High] media: hardcoded link-to-pipe mapping prevents multi-stream routing
- [High] i2c: recursive deadlock via I2C_MUX_LOCKED and locked transfers
- [High] media: UAF of source->sd due to unprotected asynchronous unbind
- [Medium] media: data race in concurrent serializer attachment
- [Medium] media: devres performance degradation in operational fast paths
- [Medium] media: test pattern control cached but ignored without format ch=
ange
- [Medium] media: valid MIPI CSI-2 physical data lane mapping incorrectly r=
ejected
- [Medium] media: undefined behavior via out-of-bounds BIT_ULL shift for st=
ream IDs
- [Low] i2c: framework abuse in ATR by altering remote physical address
--

commit f6e4a48e41fc254f86a10e4dd0da76da0550bb7e
Author: Cosmin Tanislav <demonsingur@gmail.com>

    media: i2c: add Maxim GMSL2/3 deserializer framework
   =20
    These drivers are meant to be used as a common framework for Maxim
    GMSL2/3 deserializer.

> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c=
/maxim-serdes/max_des.c
> index 0000000000000..1cbe4c3a32337
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_des.c

[ ... ]

> +static struct max_des_pipe *
> +max_des_find_link_pipe(struct max_des *des, struct max_des_link *link)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < des->info->num_pipes; i++) {
> +		struct max_des_pipe *pipe =3D &des->pipes[i];
> +
> +		if (pipe->link_id =3D=3D link->index)
> +			return pipe;

[Severity: High]
Does returning the first pipe associated with a link force a 1-to-1 link-to=
-pipe
mapping? It seems this structural choice collapses all user-defined routes =
onto
a single pipe, preventing multi-stream routing and breaking multi-stream de=
muxing.

> +	}
> +
> +	return NULL;
> +}

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
Could this dereference of hw->source->sd trigger a Use-After-Free or a NULL
pointer dereference? Since max_des_notify_unbind() sets source->sd =3D NULL
asynchronously without any locking, concurrent operations (like enable_stre=
ams)
that evaluate hw->source->sd here might race with the unbind.

> +	if (ret)
> +		return ret;

[ ... ]

> +static int max_des_set_pipes_phy(struct max_des_priv *priv,
> +				 struct max_des_remap_context *context)
> +{

[ ... ]

> +		phy_id =3D find_first_bit(&context->pipe_phy_masks[pipe->index],
> +					des->info->num_phys);
> +
> +		if (priv->unused_phy &&
> +		    (context->mode !=3D MAX_SERDES_GMSL_TUNNEL_MODE ||
> +		     phy_id =3D=3D des->info->num_phys))
> +			phy_id =3D priv->unused_phy->index;

[Severity: High]
Does this logic inadvertently overwrite a valid PHY ID in PIXEL mode? Becau=
se
context->mode !=3D MAX_SERDES_GMSL_TUNNEL_MODE evaluates to true in PIXEL m=
ode, it
seems this unconditionally routes all streams to the unused (disabled) PHY,
which breaks video data routing.

> +
> +		if (phy_id !=3D des->info->num_phys) {

[ ... ]

> +static int max_des_get_pipe_vc_remaps(struct max_des_priv *priv,
> +				      struct max_des_remap_context *context,
> +				      struct max_des_pipe *pipe,
> +				      struct max_serdes_vc_remap *vc_remaps,
> +				      unsigned int *num_vc_remaps,
> +				      struct v4l2_subdev_state *state,
> +				      u64 *streams_masks, bool with_tpg)
> +{

[ ... ]

> +	for_each_active_route(&state->routing, route) {
> +		unsigned int src_vc_id, dst_vc_id;
> +		struct max_des_route_hw hw;
> +
> +		if (!(BIT_ULL(route->sink_stream) & streams_masks[route->sink_pad]))

[Severity: Medium]
Could this BIT_ULL() shift lead to undefined behavior? Since the stream ID
comes from userspace routing configurations, a value >=3D 64 would result i=
n an
out-of-bounds shift.

> +			continue;

[ ... ]

> +static int max_des_get_pipe_remaps(struct max_des_priv *priv,
> +				   struct max_des_remap_context *context,
> +				   struct max_des_pipe *pipe,
> +				   struct max_des_remap *remaps,
> +				   unsigned int *num_remaps,
> +				   struct v4l2_subdev_state *state,
> +				   u64 *streams_masks)
> +{

[ ... ]

> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +		unsigned int src_vc_id, dst_vc_id;

[ ... ]

> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;

[ ... ]

> +		src_vc_id =3D hw.entry.bus.csi2.vc;
> +
> +		ret =3D max_des_get_src_dst_vc_id(context, pipe->index, hw.phy->index,
> +						src_vc_id, &dst_vc_id);

[Severity: High]
Can this query of the remote subdevice's VC ID lead to an out-of-bounds acc=
ess
due to a TOCTOU race? The remote frame descriptor is queried here and earli=
er in
max_des_populate_remap_context without locking. If the VC ID changes between
calls, the unvalidated src_vc_id might lead to an out-of-bounds indexing in
context->vc_ids_map inside max_des_get_src_dst_vc_id().

> +		if (ret)
> +			return ret;

[ ... ]

> +static int max_des_update_pipe_remaps(struct max_des_priv *priv,
> +				      struct max_des_remap_context *context,
> +				      struct max_des_pipe *pipe,
> +				      struct v4l2_subdev_state *state,
> +				      u64 *streams_masks)
> +{

[ ... ]

> +	if (pipe->remaps)
> +		devm_kfree(priv->dev, pipe->remaps);

[Severity: Medium]
Is it suitable to use devm_kfree() and devm_kcalloc() here? Because this pa=
th is
executed during stream updates (e.g., via the enable_streams callback), the=
 O(N)
spinlock-protected list traversals involved in devres functions will degrade
performance and scale poorly during operational fast paths.

> +
> +	pipe->remaps =3D remaps;
> +	pipe->num_remaps =3D num_remaps;

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

[Severity: High]
Is the missing locking around this hardware mux state modification intentio=
nal?
The select_links callback modifies hardware configuration and is called here
asynchronously (and without locks), which could race with the locked
max_des_i2c_mux_select path and corrupt shared mux hardware state.

> +		if (ret)
> +			return ret;
> +	}

[ ... ]

> +	ret =3D max_ser_change_address(adapter, power_up_addr, new_addr);

[Severity: Low]
Does this bypass the ATR framework by directly altering the physical device
address? Rather than programming the Address Translator to map an alias to =
the
physical address, this uses I2C commands to change the remote physical addr=
ess
itself.

> +	if (ret) {
> +		dev_err(priv->dev,

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

[Severity: Medium]
Could evaluating and modifying the link->ser_xlate.en flag without a lock r=
esult
in a data race? During asynchronous device binding, concurrent probes might
interleave I2C hardware configuration and cause unpredictable device states.

> +
> +	for (i =3D max; i >=3D min; i--) {

[ ... ]

> +static int max_des_i2c_mux_bus_notifier_call(struct notifier_block *nb,
> +					     unsigned long event, void *device)
> +{

[ ... ]

> +	/*
> +	 * i2c_mux_add_adapter() only publishes the adapter once it has been
> +	 * registered, but registering it already probes the children declared
> +	 * under it. Such a child binds synchronously, from this same task, and
> +	 * lands here before link->adapter has been assigned. Match it against
> +	 * the link whose adapter is being added.
> +	 */
> +	if (i =3D=3D des->info->num_links && priv->pending_task =3D=3D current)
> +		i =3D priv->pending_link->index;

[Severity: High]
Does checking if the binding task is current risk misidentifying unrelated =
I2C
clients? If fw_devlink triggers synchronous probes of unrelated I2C devices
while the MUX is being registered, this check would falsely identify them a=
s the
serializer, potentially sending configuration payloads to random bus hardwa=
re.

> +
> +	if (i =3D=3D des->info->num_links)
> +		return NOTIFY_DONE;

[ ... ]

> +static int max_des_i2c_mux_init(struct max_des_priv *priv)
> +{
> +	struct max_des *des =3D priv->des;
> +	u32 flags =3D I2C_MUX_LOCKED;
> +	unsigned int i;
> +	int ret;
> +
> +	if (des->info->num_links =3D=3D 1)
> +		flags |=3D I2C_MUX_GATE;
> +
> +	priv->mux =3D i2c_mux_alloc(priv->client->adapter, priv->dev,
> +				  des->info->num_links, 0, flags,
> +				  max_des_i2c_mux_select, NULL);

[Severity: High]
Does using I2C_MUX_LOCKED here risk a recursive deadlock? With this flag, t=
he
I2C core holds the parent adapter's lock during select_links. If select_lin=
ks
subsequently performs standard I2C operations, it will try to re-acquire the
adapter lock, causing a deadlock on the I2C bus.

> +	if (!priv->mux)
> +		return -ENOMEM;

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
Since V4L2_CID_TEST_PATTERN only caches the pattern value without triggerin=
g a
hardware update, will the control be ignored? Without a callback to invoke
set_tpg, the hardware isn't updated unless the format changes, which makes
this control ineffective.

> +
> +	return -EINVAL;
> +}

[ ... ]

> +static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					struct v4l2_mbus_frame_desc *fd,
> +					unsigned int pad)
> +{

[ ... ]

> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +		unsigned int dst_vc_id;

[ ... ]

> +		hw.entry.bus.csi2.vc =3D dst_vc_id;
> +		hw.entry.stream =3D route->source_stream;
> +
> +		fd->entry[fd->num_entries++] =3D hw.entry;

[Severity: Critical]
Does this loop lack bounds checking when adding entries to fd->entry? Since
userspace can supply a routing table with up to 256 routes, iterating over =
all
active routes and appending them to the 8-element V4L2_MBUS_FRAME_DESC_MAX =
stack
array can deterministically cause a stack buffer overflow.

> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int max_des_parse_src_dt_endpoint(struct max_des_priv *priv,
> +					 struct max_des_phy *phy,
> +					 struct fwnode_handle *fwnode)
> +{

[ ... ]

> +	for (i =3D 0; i < mipi->num_data_lanes; i++) {
> +		if (mipi->data_lanes[i] > mipi->num_data_lanes) {
> +			dev_err(priv->dev, "Invalid data lane %u on port %u\n",
> +				mipi->data_lanes[i], pad);
> +			return -EINVAL;
> +		}
> +	}

[Severity: Medium]
Does this boundary validation incorrectly reject valid MIPI CSI-2 physical =
data
lane mappings? Comparing the physical lane index against the total number of
active lanes (mipi->num_data_lanes) causes valid non-sequential hardware pin
configurations (like using physical lanes 2 and 3 when the active lane coun=
t is
2) to be rejected.

> +
> +	phy->bus_type =3D bus_type;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-gmsl2-3_se=
rdes-v18-0-43117818f499@analog.com?part=3D16
