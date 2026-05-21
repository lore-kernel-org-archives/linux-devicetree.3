Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95273D522C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369821; cv=none; b=dGnayyFKe5NhTVLEfvaSOzATcgXyeU+OyDLKcq8vdbN1SSWo9ar7eBD9OtXeg3vGw1k5Hhf+5O/5FSytsZ7iRETvRHTGIZXL1x6NIyEFqEP0PX1dyvHIYxI7Qhs8LPWgnEUitsvzGhbSP8az78AUuoo3RQd0P7UdrMC76ZJWW0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369821; c=relaxed/simple;
	bh=goLoQ4GGfFTQUCwwvh0vd0n+JivKbpwUlyFPKKseYBk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o2Suudin/Ays6xY6FTClrsyH9qw+Woyd/crPPSqVclsvdKoCcpP4QNR4kc4aEAb/KAif04kpwgArIxs96GournXF3YXYZrX94GxOJnLKDhMdnqEIW46tOu5E8IgJ1kaUQs3ta8AYseqloIChuj0X6cdfZRqp4bOF/9lzMfQQmxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=em14dsCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="em14dsCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5914C1F000E9;
	Thu, 21 May 2026 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779369819;
	bh=LZBqCJ0uJjE5NLbjrweLAKRXUqka8WqFUw/N5oKMx7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=em14dsCegylrBFg0s0l9Vtv4BNLLFDmWEdPT14HixxzwVFS/nt+tcB2Fwy9+SBhJR
	 6QC7sQWEzkIgqzDDQUq6ubBispMotgbXzT4QY9nT3UHB1V7sHRZev6Wu+cQj7SBumJ
	 rJ0FDxcB+RfF/XbCihi2TgbcJQ9EANvQS87F5AD42HbGBibf84ah1cKDSwHZ6X7ojM
	 OdkDLP5CuospRBHZhCR1698u4/3XAHixtff+crt13tgJVvFR5epMlLUKFk3Q6PB3zJ
	 gZin/qEnL1NFheYhQJ8lytLbQ2U2u/SE7Pl7QQK/Hlp2YZ/uCg2r63kKnsEmN2k+wb
	 Xo2II/nkMD1Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 14/22] media: i2c: add Maxim GMSL2/3 serializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-14-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-14-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:23:39 +0000
Message-Id: <20260521132339.5914C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] Uninitialized stack memory usage and stack buffer overflow wit=
h `v4l2_mbus_frame_desc`.
- [High] Heap buffer overflow in `max_ser_get_pipe_vcs_dts()` when storing =
unique Data Types.
- [High] Array out-of-bounds write in `max_ser_i2c_atr_detach_addr()`.
- [High] Use of uninitialized stack variable and Undefined Behavior via `__=
ffs(0)` / `__fls(0)`.
- [High] Lockless iteration in `max_ser_log_status` leads to Use-After-Free.
- [High] Error rollback paths rely on infallible dynamic memory allocations.
- [High] Use of stack-allocated buffers for `i2c_transfer()` violates DMA s=
afety.
- [Medium] Multiple fwnode reference count leaks.
- [Medium] V4L2 control handler memory is leaked upon driver unregistration.
- [Medium] Memory leak of the I2C ATR structure on adapter initialization f=
ailure.
- [Medium] Missing `.get_mbus_config()` API implementation despite commit m=
essage claims.
- [Medium] Inappropriate use of devres functions in runtime hot paths.
--

commit 210e31826495bb37471b675b425310f6af76310b
Author: Cosmin Tanislav <demonsingur@gmail.com>
Date:   Thu May 21 12:44:20 2026 +0000

    media: i2c: add Maxim GMSL2/3 serializer framework
   =20
    These drivers are meant to be used as a common framework for Maxim
    GMSL2/3 serializers.
   =20
    This framework enables support for the following new features across
    all the chips:
     * Full Streams API support
     * .get_frame_desc()
     * .get_mbus_config()
     * I2C ATR

[Severity: Medium]
The commit message states that .get_mbus_config() is supported. However, it
does not appear to be implemented or linked in the max_ser_pad_ops structur=
e.
Was this feature intentionally removed during development, or did it get mi=
ssed?

[ ... ]

diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c/m=
axim-serdes/max_ser.c
new file mode 100644
index 0000000000000..9eb33cf83c076
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_ser.c
@@ -0,0 +1,2155 @@

[ ... ]

> +static int max_ser_route_to_hw(struct max_ser_priv *priv,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_route *route,
> +			       struct max_ser_route_hw *hw)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_mbus_frame_desc fd;
> +	struct max_ser_phy *phy;

[Severity: Critical]
Does this leave the num_entries field of fd uninitialized?=20

Since fd is declared on the stack, it may contain random garbage. When pass=
ed
to the source subdev's get_frame_desc pad op, the target function frequently
executes fd->entry[fd->num_entries++] =3D hw.entry; which could result in
out-of-bounds writes on the stack buffer. Would it be better to
zero-initialize it here?

> +	unsigned int i;
> +	int ret;
> +
> +	memset(hw, 0, sizeof(*hw));

[ ... ]

> +static void max_ser_i2c_atr_detach_addr(struct i2c_atr *atr, u32 chan_id=
, u16 addr)
> +{
> +	struct max_ser_priv *priv =3D i2c_atr_get_driver_data(atr);
> +	struct max_ser *ser =3D priv->ser;
> +	struct max_serdes_i2c_xlate xlate =3D { 0 };
> +	unsigned int i;
> +
> +	/* Find index of matching I2C translation. */
> +	for (i =3D 0; i < ser->ops->num_i2c_xlates; i++)
> +		if (ser->i2c_xlates[i].dst =3D=3D addr)
> +			break;
> +
> +	WARN_ON(i =3D=3D ser->ops->num_i2c_xlates);
> +
> +	ser->ops->set_i2c_xlate(ser, i, &xlate);
> +	ser->i2c_xlates[i] =3D xlate;
> +}

[Severity: High]
If the loop finishes without finding a match, i will be exactly equal to
ser->ops->num_i2c_xlates. While the WARN_ON flags this case, execution cont=
inues
and accesses ser->i2c_xlates[i]. Can this cause an out-of-bounds write past
the end of the i2c_xlates array? Should the function return early if the
address is not found?

[ ... ]

> +static int max_ser_i2c_atr_init(struct max_ser_priv *priv)
> +{
> +	struct i2c_atr_adap_desc desc =3D {
> +		.chan_id =3D 0,
> +	};
> +
> +	if (!i2c_check_functionality(priv->client->adapter,
> +				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
> +		return -ENODEV;
> +
> +	priv->atr =3D i2c_atr_new(priv->client->adapter, priv->dev,
> +				&max_ser_i2c_atr_ops, 1, 0);
> +	if (IS_ERR(priv->atr))
> +		return PTR_ERR(priv->atr);
> +
> +	i2c_atr_set_driver_data(priv->atr, priv);
> +
> +	return i2c_atr_add_adapter(priv->atr, &desc);
> +}

[Severity: Medium]
If i2c_atr_add_adapter() fails, does this permanently leak the memory
allocated by i2c_atr_new()?

[ ... ]

> +static int max_ser_i2c_adapter_init(struct max_ser_priv *priv)
> +{
> +	if (device_get_named_child_node(priv->dev, "i2c-gate"))
> +		return max_ser_i2c_mux_init(priv);
> +	else
> +		return max_ser_i2c_atr_init(priv);
> +}

[Severity: Medium]
Does device_get_named_child_node() return a reference-counted fwnode
pointer? It appears the pointer is used here only for a truthiness check and
is immediately discarded without calling fwnode_handle_put(). Can this lead
to a reference count leak during driver probe?

[ ... ]

> +static int max_ser_log_status(struct v4l2_subdev *sd)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int i, j;
> +	int ret;

[ ... ]

> +	for (i =3D 0; i < ser->ops->num_pipes; i++) {
> +		struct max_ser_pipe *pipe =3D &ser->pipes[i];
> +
> +		v4l2_info(sd, "pipe: %u\n", pipe->index);
> +		v4l2_info(sd, "\tenabled: %u\n", pipe->enabled);
> +
> +		if (!pipe->enabled) {
> +			v4l2_info(sd, "\n");
> +			continue;
> +		}
> +
> +		v4l2_info(sd, "\tphy_id: %u\n", pipe->phy_id);
> +		v4l2_info(sd, "\tstream_id: %u\n", pipe->stream_id);
> +		if (ser->ops->set_pipe_phy)
> +			v4l2_info(sd, "\tphy_id: %u\n", pipe->phy_id);
> +		if (ser->ops->set_pipe_dt) {
> +			v4l2_info(sd, "\tdts: %u\n", pipe->num_dts);
> +			for (j =3D 0; j < pipe->num_dts; j++)
> +				v4l2_info(sd, "\t\tdt: 0x%02x\n", pipe->dts[j]);
> +		}

[Severity: High]
Is this iteration over pipe->dts safe from data races?=20

It looks like max_ser_log_status() iterates locklessly here, but=20
max_ser_update_pipe() dynamically frees and reallocates pipe->dts=20
using devm_kfree(priv->dev, pipe->dts) during runtime stream configuration.=
=20
Could concurrent execution of these two code paths trigger a use-after-free?

[ ... ]

> +static int max_ser_get_pipe_vcs_dts(struct max_ser_priv *priv,
> +				    struct v4l2_subdev_state *state,
> +				    struct max_ser_pipe *pipe,
> +				    unsigned int *vcs,
> +				    unsigned int *dts, unsigned int *num_dts,
> +				    u64 *streams_masks)
> +{
> +	struct v4l2_subdev_route *route;
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int i;
> +	int ret;
> +
> +	*vcs =3D 0;
> +	*num_dts =3D 0;

[ ... ]

> +		/* Skip already added DT. */
> +		for (i =3D 0; i < *num_dts; i++)
> +			if (dts[i] =3D=3D dt)
> +				break;
> +
> +		if (i < *num_dts)
> +			continue;
> +
> +		dts[*num_dts] =3D dt;
> +		(*num_dts)++;
> +	}

[Severity: High]
Is there a risk of an out-of-bounds array write here?=20

The dts array is dynamically allocated with a fixed capacity of=20
ser->ops->num_dts_per_pipe. If a userspace-configured routing table supplie=
s=20
more unique streams than this limit, it seems *num_dts could exceed the=20
bounds of the array. Should we add a bounds check?

[ ... ]

> +static int max_ser_get_pipe_mode(struct max_ser_priv *priv,
> +				 struct v4l2_subdev_state *state,
> +				 struct max_ser_pipe *pipe,
> +				 struct max_ser_pipe_mode *mode)
> +{
> +	struct v4l2_subdev_route *route;
> +	struct max_ser *ser =3D priv->ser;
> +	bool force_set_bpp =3D false;
> +	unsigned int doubled_bpp;
> +	unsigned int min_bpp;
> +	unsigned int max_bpp;
> +	u32 bpps =3D 0;
> +	int ret;
> +
> +	if (ser->mode !=3D MAX_SERDES_GMSL_PIXEL_MODE)
> +		return 0;
> +
> +	for_each_active_route(&state->routing, route) {

[ ... ]

> +	}
> +
> +	ret =3D max_serdes_process_bpps(priv->dev, bpps, priv->double_bpps, &do=
ubled_bpp);
> +	if (ret)
> +		return ret;
> +
> +	if (doubled_bpp =3D=3D 8)
> +		mode->dbl8 =3D true;
> +	else if (doubled_bpp =3D=3D 10)
> +		mode->dbl10 =3D true;
> +	else if (doubled_bpp =3D=3D 12)
> +		mode->dbl12 =3D true;
> +
> +	if (doubled_bpp) {
> +		bpps &=3D ~BIT(doubled_bpp);
> +		bpps |=3D BIT(doubled_bpp * 2);
> +	}
> +
> +	min_bpp =3D __ffs(bpps);
> +	max_bpp =3D __fls(bpps);

[Severity: High]
If the pipe has no active routes, bpps will remain 0. Calling=20
max_serdes_process_bpps() with bpps =3D 0 appears to return 0 immediately=20
without setting doubled_bpp, leaving it uninitialized for later use.
       =20
Furthermore, if bpps is 0, does calling __ffs(bpps) and __fls(bpps)=20
result in undefined behavior? These typically map to __builtin_ctzl(), whic=
h=20
may cause faults or unpredictable behavior when called with zero.

[ ... ]

> +static int max_ser_update_pipe(struct max_ser_priv *priv,
> +			       struct max_ser_pipe *pipe,
> +			       struct v4l2_subdev_state *state,
> +			       u64 *streams_masks)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	struct max_ser_pipe_mode mode =3D { 0 };
> +	unsigned int num_dts;
> +	unsigned int *dts;
> +	unsigned int vcs;
> +	int ret;
> +
> +	if (!ser->ops->num_dts_per_pipe)
> +		return 0;
> +
> +	dts =3D devm_kcalloc(priv->dev, ser->ops->num_dts_per_pipe, sizeof(*dts=
),
> +			   GFP_KERNEL);

[Severity: Medium]
Is devm_kcalloc() suitable for use in a runtime hot path like stream=20
enablement/disablement?=20
       =20
Using devres functions here requires taking a spinlock and performing an O(=
N)=20
list traversal for every allocation and free, which can degrade performance=
=20
and fragment the list.

[Severity: High]
Additionally, error rollback paths like max_ser_update_phys() call=20
max_ser_update_pipe() to restore previous states. If this devm_kcalloc()=20
fails during a rollback, the error is ignored, leaving the hardware and=20
software states out of sync. Could this be mitigated by pre-allocating the=
=20
arrays during probe?

[ ... ]

> +static int max_ser_update_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  u32 pad, u64 updated_streams_mask, bool enable)
> +{
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int num_pads =3D max_ser_num_pads(ser);
> +	u64 *streams_masks;
> +	int ret;
> +
> +	ret =3D max_serdes_get_streams_masks(priv->dev, state, pad, updated_str=
eams_mask,
> +					   num_pads, priv->streams_masks, &streams_masks,
> +					   enable);

[ ... ]

> +	devm_kfree(priv->dev, priv->streams_masks);
> +	priv->streams_masks =3D streams_masks;
> +	ser->active =3D !!streams_masks[pad];
> +
> +	return 0;

[Severity: Medium]
Similar to the dts array allocation above, is it acceptable to continually
allocate and free streams_masks via devres APIs during stream start/stop
operations?

[ ... ]

> +static void max_ser_v4l2_unregister(struct max_ser_priv *priv)
> +{
> +	struct v4l2_subdev *sd =3D &priv->sd;
> +
> +	max_ser_v4l2_notifier_unregister(priv);
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +}

[Severity: Medium]
The V4L2 control handler is initialized during probe with=20
v4l2_ctrl_handler_init(), but it doesn't seem to be freed here. Should we=20
call v4l2_ctrl_handler_free(&priv->ctrl_handler) to prevent memory leaks=20
upon module unregistration?

[ ... ]

> +static int max_ser_parse_sink_dt_endpoint(struct max_ser_priv *priv,
> +					  struct max_ser_phy *phy,
> +					  struct max_serdes_source *source,
> +					  struct fwnode_handle *fwnode)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	u32 pad =3D max_ser_phy_to_pad(ser, phy);
> +	struct v4l2_fwnode_endpoint v4l2_ep =3D { .bus_type =3D V4L2_MBUS_CSI2_=
DPHY };
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
> +	if (!ep)
> +		return 0;
> +
> +	source->ep_fwnode =3D fwnode_graph_get_remote_endpoint(ep);
> +	if (!source->ep_fwnode) {
> +		dev_err(priv->dev,
> +			"Failed to get remote endpoint on port %u\n", pad);
> +		return -EINVAL;
> +	}

[Severity: Medium]
If fwnode_graph_get_remote_endpoint() fails, the function returns -EINVAL=20
without putting the ep fwnode pointer. Could this cause a fwnode reference=
=20
count leak?

[ ... ]

> +static int max_ser_read_reg(struct i2c_adapter *adapter, u8 addr,
> +			    u16 reg, u8 *val)
> +{
> +	u8 buf[2] =3D { reg >> 8, reg & 0xff };
> +	struct i2c_msg msg[2] =3D {
> +		{
> +			.addr =3D addr,
> +			.flags =3D 0,
> +			.buf =3D buf,
> +			.len =3D sizeof(buf),
> +		},
> +		{
> +			.addr =3D addr,
> +			.flags =3D I2C_M_RD,
> +			.buf =3D buf,
> +			.len =3D 1,
> +		},
> +	};
> +	int ret;
> +
> +	ret =3D i2c_transfer(adapter, msg, ARRAY_SIZE(msg));
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D buf[0];
> +
> +	return 0;
> +}

[Severity: High]
Is it safe to pass a stack-allocated buffer to i2c_transfer()?=20
       =20
Because many underlying I2C controller drivers utilize DMA for data transfe=
rs,=20
passing stack-allocated memory can be unsafe and trigger panics or data=20
corruption, especially with CONFIG_VMAP_STACK enabled.

> +static int max_ser_write_reg(struct i2c_adapter *adapter, u8 addr,
> +			     u16 reg, u8 val)
> +{
> +	u8 buf[3] =3D { reg >> 8, reg & 0xff, val };
> +	struct i2c_msg msg[1] =3D {
> +		{
> +			.addr =3D addr,
> +			.flags =3D 0,
> +			.buf =3D buf,
> +			.len =3D sizeof(buf),
> +		},
> +	};
> +	int ret;
> +
> +	ret =3D i2c_transfer(adapter, msg, ARRAY_SIZE(msg));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}

[Severity: High]
Similarly, does this stack-allocated buffer face the same DMA safety issues=
=20
when passed to i2c_transfer()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D14
