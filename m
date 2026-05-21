Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F08312836
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370042; cv=none; b=BbjtpJywpf3iaN9EFRysoPddAHJC7rqLfHd5rWeDZR1nhN+p5xPuUpyZQRylOmJLt633yu/wyISI+adesZ0lW2WEcWBCenZ/pKb0g8EY1yXCgG33RkgyBVHjDzMdmZDj/0xpvoVGe/q1Pxm52l97T3O1/L9vYY44pOtY5ftq7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370042; c=relaxed/simple;
	bh=gTFBdtB/zrij8eO12aV//EuVoHhltjpirFUj+0yxtLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HSowwKJP3pVPE2n0X6nXjg2GrCNfJzc/rrnuR1fcqxTOxEkJrCzV6QFxFFkqEG1txjxr9waPeMmQGoiI7Q37AcyLf8GwDkmtIY8joKFnkYAixGBF15JbW/vHKZ3SrDhV9DAyzA+Vfe0sDUx/1RCKw2/WI7+ymKTCj5p3ojUDxb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MO/j9lVs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MO/j9lVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D530C1F00ADE;
	Thu, 21 May 2026 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779370040;
	bh=af+w1rnQaV3Ro5XzdGIU9wVrpE0b00upQXHJcMv5G9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MO/j9lVs2mSJLoegQPtRXQxAsPbPWr6b4cR9Ol5uQAfzsOZLi1ZsSluo9I7dSmKjY
	 qz55vUgYATWIm7LoisN+R9M7/cYq7WLQ6KDRK2TycI2BGBO0tpq/tAt8qHz+kexvpK
	 sMNs98PqiT8wcSQe3aOMZBLppgrAbos1bIKzdBJKjcdSBdh5zbQ9i6vPVUJTTorZha
	 FbvGjbPScEYmsXxb/bIhhrkgWSvzAZMKv1QdcaahWNJn50Ib+tDBzOw0WRLoh4dh2L
	 JyfAwXHpHaAGyZn3edrFhr7ArRv1JgFrqZuFSTQ4pryCJFtGt32PPa4q8D3uHhBJB9
	 4euQS4qW5E0/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 15/22] media: i2c: add Maxim GMSL2/3 deserializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-15-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-15-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:27:19 +0000
Message-Id: <20260521132719.D530C1F00ADE@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [High] Missing initialization and bounds check for `fd->num_entries` in `=
max_des_get_frame_desc_state`.
- [High] Stack buffer overflow in `max_des_set_pipes_stream_id` via unvalid=
ated `stream_id`.
- [High] Checking `pipe->num_vc_remaps` instead of `pipe->vc_remaps` causes=
 sequential devm memory leaks.
- [High] I2C bus notifier relies on an adapter array that is not yet popula=
ted during synchronous driver binding.
- [High] Uninitialized `struct v4l2_mbus_frame_desc fd` is passed to the se=
rializer subdev.
- [High] Output struct fields are used as search constraints in `max_des_en=
um_frame_interval`.
- [High] Unbalanced POC regulator unwinding causes warnings and halts clean=
up.
- [High] Unprotected access to `source->sd` leads to TOCTOU NULL pointer de=
references and dangling pointers.
- [High] Lockless array iteration in `max_des_log_status` causes a Use-Afte=
r-Free (UAF) vulnerability.
- [High] Hardware state corruption due to an I2C multiplexing race conditio=
n during serializer binding.
- [High] Incorrect `chan_id` mapping in `max_des_i2c_mux_bus_notifier_call`.
- [Medium] Fwnode reference leak in `max_des_parse_sink_dt_endpoint`.
- [Medium] Memory leak of `streams_masks` on the error path in `max_des_upd=
ate_streams`.
- [Medium] I2C ATR instances and adapters are leaked if link selection fail=
s in `max_des_i2c_atr_init`.
--

commit 83b14a77624d98c746a5672b763eea7d8ac99877
Author: Cosmin Tanislav <demonsingur@gmail.com>
Subject: media: i2c: add Maxim GMSL2/3 deserializer framework

This commit introduces a common framework for Maxim GMSL2/3 deserializers.
It adds support for features like the full Streams API, I2C ATR, automatic
GMSL link version negotiation, and automatic stream ID selection.

> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c=
/maxim-serdes/max_des.c
> new file mode 100644
> index 0000000000000..a03101678360f
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
> @@ -0,0 +1,3205 @@
[ ... ]
> +static int max_des_route_to_hw(struct max_des_priv *priv,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_route *route,
> +			       struct max_des_route_hw *hw)
> +{
> +	struct max_des *des =3D priv->des;
> +	struct v4l2_mbus_frame_desc fd;

[Severity: High]
Could the uninitialized fd here lead to issues?

If the subdev expects fd.num_entries to start at 0, or reads other fields,
it might operate on garbage stack data.

> +	struct max_des_link *link;
> +	unsigned int i;
> +	int ret;
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
> +		if (ret =3D=3D -EOPNOTSUPP) {
> +			/*
> +			 * Serializer does not support setting the stream id,
> +			 * retrieve its hardcoded stream id.
> +			 */
> +			ret =3D max_ser_get_stream_id(hw.source->sd, &stream_id);
> +		}
> +
> +		if (ret)
> +			return ret;
> +
> +		if (stream_id_usage[stream_id] && des->info->needs_unique_stream_id) {

[Severity: High]
Is a bounds check needed for stream_id before using it to index the
stream_id_usage stack array?

A malformed or unexpectedly large value from the serializer could cause an
out-of-bounds stack write here.

> +			dev_err(priv->dev, "Duplicate stream id %u\n", stream_id);
> +			return -EINVAL;
> +		}
[ ... ]
> +static int max_des_update_pipe_vc_remaps(struct max_des_priv *priv,
> +					 struct max_des_remap_context *context,
> +					 struct max_des_pipe *pipe,
> +					 struct v4l2_subdev_state *state,
> +					 u64 *streams_masks)
> +{
[ ... ]
> +	ret =3D max_des_set_pipe_vc_remaps(priv, pipe, vc_remaps, num_vc_remaps=
);
> +	if (ret)
> +		goto err_free_new_vc_remaps;
> +
> +	if (pipe->num_vc_remaps)
> +		devm_kfree(priv->dev, pipe->vc_remaps);

[Severity: High]
Is there a potential memory leak if the previous state allocated memory but
populated 0 remaps?

Checking pipe->num_vc_remaps instead of the pointer pipe->vc_remaps might
bypass the free on stream updates, leaving the device-managed memory leaked.

> +
> +	pipe->vc_remaps =3D vc_remaps;
> +	pipe->num_vc_remaps =3D num_vc_remaps;
> +
> +	return 0;
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
> +	ret =3D des->ops->select_links(des, BIT(link->index));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_ser_wait_for_multiple(adapter, addrs, ARRAY_SIZE(addrs),
> +					&current_addr);

[Severity: High]
Can setting the hardware mux directly via select_links and performing I2C
transactions bypass the i2c_mux core locks?

Since the bus notifier can execute concurrently while different clients pro=
be,
this sequence could potentially overwrite the hardware mux state and misdir=
ect
I2C traffic to the wrong serializers.

> +	if (ret) {
> +		dev_err(priv->dev,
[ ... ]
> +static int max_des_i2c_atr_init(struct max_des_priv *priv)
> +{
[ ... ]
> +	for (i =3D 0; i < des->info->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		mask |=3D BIT(link->index);
> +	}
> +
> +	return des->ops->select_links(des, mask);

[Severity: Medium]
If des->ops->select_links(des, mask) fails here, should it clean up the
allocated resources?

Returning the error code immediately bypasses the err_add_adapters label,
which seems like it would leak the ATR object and its adapters.

> +
> +err_add_adapters:
> +	max_des_i2c_atr_deinit(priv);
[ ... ]
> +static int max_des_i2c_mux_bus_notifier_call(struct notifier_block *nb,
> +					     unsigned long event, void *device)
> +{
[ ... ]
> +	client =3D i2c_verify_client(dev);
> +	if (!client)
> +		return NOTIFY_DONE;
> +
> +	for (chan_id =3D 0; chan_id < priv->mux->max_adapters; ++chan_id) {
> +		if (client->adapter =3D=3D priv->mux->adapter[chan_id])
> +			break;
> +	}

[Severity: High]
Is it guaranteed that the priv->mux->adapter array is populated at this
point?

If a serializer binds synchronously during adapter registration, this notif=
ier
might fire before i2c_mux_add_adapter() populates the array, causing it to
silently skip link version negotiation.

> +
> +	if (chan_id =3D=3D priv->mux->max_adapters)
> +		return NOTIFY_DONE;
> +
> +	max_des_ser_attach_addr(priv, chan_id, client->addr, client->addr);

[Severity: High]
Additionally, does this chan_id indexing correctly map to the hardware link=
s?

Because i2c_mux_add_adapter() packs adapters sequentially for enabled links,
if link 0 is disabled, link 1 might sit at array index 0. This could cause
the driver to initialize link 0's data structures for a device connected to
link 1.

> +
> +	return NOTIFY_DONE;
> +}
[ ... ]
> +static int max_des_enum_frame_interval(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *state,
> +				       struct v4l2_subdev_frame_interval_enum *fie)
> +{
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des *des =3D priv->des;
> +	const struct max_serdes_tpg_entry *entry;
> +
> +	if (!max_des_pad_is_tpg(des, fie->pad) ||
> +	    fie->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -ENOTTY;
> +
> +	entry =3D max_des_find_tpg_entry(des, fie->index, fie->width, fie->heig=
ht,
> +				       fie->code, fie->interval.denominator,
> +				       fie->interval.numerator);

[Severity: High]
Is it safe to use fie->interval.numerator and denominator as search
constraints here?

Since interval is an output parameter during
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, userspace might provide uninitialized
memory, which would cause the search to fail with garbage data.

> +	if (!entry)
> +		return -EINVAL;
[ ... ]
> +static int max_des_log_status(struct v4l2_subdev *sd)
> +{
[ ... ]
> +		if (des->ops->set_pipe_remap) {
> +			v4l2_info(sd, "\tremaps: %u\n", pipe->num_remaps);
> +			for (j =3D 0; j < pipe->num_remaps; j++) {
> +				struct max_des_remap *remap =3D &pipe->remaps[j];

[Severity: High]
Does this function need to hold the subdev active state lock while iterating
over pipe->remaps and pipe->vc_remaps?

Concurrent stream updates might free and reallocate these arrays under the
lock, which could lead to a use-after-free here.

> +
> +				v4l2_info(sd, "\t\tremap: from: vc: %u, dt: 0x%02x\n",
> +					  remap->from_vc, remap->from_dt);
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

[Severity: High]
Should fd->num_entries be explicitly initialized to 0 here before appending
new entries?

Since it appears this might be called with an uninitialized stack variable
from other places (like max_des_route_to_hw), it could result in an
out-of-bounds write to the array.

> +
> +	ret =3D max_des_populate_remap_context(priv, &context, state);
> +	if (ret)
[ ... ]
> +static int max_des_update_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  u32 pad, u64 updated_streams_mask, bool enable)
> +{
[ ... ]
> +	ret =3D max_des_set_modes(priv, &mode_context);
> +	if (ret)
> +		goto err_free_streams_masks;
> +
> +	ret =3D max_des_set_vc_remaps(priv, &context, state, streams_masks);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If max_des_set_vc_remaps() fails, should this go to
err_free_streams_masks?

Returning the error code directly seems to skip freeing the dynamically
allocated streams_masks.

> +
> +	ret =3D max_des_set_pipes_stream_id(priv);
[ ... ]
> +static int max_des_notify_bound(struct v4l2_async_notifier *nf,
> +				struct v4l2_subdev *subdev,
> +				struct v4l2_async_connection *base_asc)
> +{
[ ... ]
> +	source->sd =3D subdev;
> +	source->pad =3D ret;
> +
> +	ret =3D media_create_pad_link(&source->sd->entity, source->pad,
> +				    &priv->sd.entity, pad,
> +				    MEDIA_LNK_FL_ENABLED |
> +				    MEDIA_LNK_FL_IMMUTABLE);
> +	if (ret) {
> +		dev_err(priv->dev, "Unable to link %s:%u -> %s:%u\n",
> +			source->sd->name, source->pad, priv->sd.name, pad);

[Severity: High]
If media_create_pad_link() fails here, should source->sd be set back to
NULL?

Leaving it populated on failure might result in a dangling pointer.

> +		return ret;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static void max_des_notify_unbind(struct v4l2_async_notifier *nf,
> +				  struct v4l2_subdev *subdev,
> +				  struct v4l2_async_connection *base_asc)
> +{
> +	struct max_serdes_asc *asc =3D asc_to_max(base_asc);
> +	struct max_serdes_source *source =3D asc->source;
> +
> +	source->sd =3D NULL;

[Severity: High]
Could setting source->sd =3D NULL here without locking race against streami=
ng
paths like max_des_set_tunnel()?

This looks like it could lead to a time-of-check to time-of-use NULL pointer
dereference.

> +}
[ ... ]
> +static int max_des_update_pocs(struct max_des_priv *priv, bool enable)
> +{
[ ... ]
> +		if (enable)
> +			ret =3D regulator_enable(priv->pocs[i]);
> +		else
> +			ret =3D regulator_disable(priv->pocs[i]);
> +
> +		if (ret) {
> +			dev_err(priv->dev,
> +				"Failed to set POC supply to %u: %u\n",
> +				enable, ret);

[Severity: High]
If regulator_enable() fails here, the function returns without disabling
the already-enabled links.

During the error path cleanup, this function is called again with
enable =3D false, which tries to disable the regulator that originally fail=
ed.
Could this trigger a kernel warning and halt further unwinding, leaving
genuine regulators permanently enabled?

> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int max_des_parse_sink_dt_endpoint(struct max_des_priv *priv,
> +					  struct max_des_link *link,
> +					  struct max_serdes_source *source,
> +					  struct fwnode_handle *fwnode)
> +{
[ ... ]
> +	ep =3D fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
> +	if (!ep)
> +		return 0;
> +
> +	source->ep_fwnode =3D fwnode_graph_get_remote_endpoint(ep);
> +	fwnode_handle_put(ep);
> +	if (!source->ep_fwnode) {

[Severity: Medium]
Does this code leak the fwnode handle acquired for source->ep_fwnode?

It doesn't seem to be released via fwnode_handle_put() anywhere in the
driver's teardown path or error cleanup.

> +		dev_err(priv->dev,
> +			"Failed to get remote endpoint on port %u\n", pad);
> +		return -ENODEV;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D15
