Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920EE4ACC8A
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184046; cv=none; b=sqlXOxwcVnvf0jE1i77HJVhql/jdAXpGHqbQVgzRhDyBunuedhFbajUv7nV30YS1l6vMHAEnAEK38ig2xCzKBlnyfct/kSeZAvuynhBGq4WJOnGB0WAJZEWfDR5F4kIyultaE4l8McN88Qa5BSIx2UnSHFG59wiHcGGDsQ53jgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184046; c=relaxed/simple;
	bh=t9lA8ziRvqpmmCvLFMrfrTIBNZy1zv7LxbPEYc+pUCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XlHAA9jwhoGxOZdfVpXAM08VI8vD18L6HNgEw9I/0eEEsgscX6jlw9NYqwzSnOWJtPfDSZEMnCb7MJ8zXzk5ZnUm6JfirEyFaa/1YmIn9hv8AtzzwQ8IERsHBBh9QO4UsObtRal2VIBo6HSSti0+uaW/Mchok//fymQWttrnkm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkXtKBAp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkXtKBAp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED811F00A3F;
	Mon, 31 Aug 2026 13:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184043;
	bh=7oNjPyKccURqGUxR4yBDuRK6K9tq2TSxnO78WfdEhWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NkXtKBAprUKDYU7JCGvr8vUy5+PjWD3TvFzTHfJbBE4S7hZsyFnsGK04TZM4WmH+i
	 tx0rgMrVe/SE/bWWUzQBORXUo1CmyoY1Fd8lS90HNVXAl85X1Wxo96LU+r3qJaY5n5
	 MdTyJ58t6WnR4VTvkAVr7DVUoKUzM5nuf1M0X0KyVWPv7GS4n3L8Bz2x+i5Cgo2QVf
	 2PlJbkFXa9dY2aiLBfgYBxOXGFy7ia/u4C7uoryrWzqE8yVw6gBCx5+eWhz9HlSswL
	 iD2QUlE0VwnAXcSn0G8AH77dcENJgcDdTCGA2L/3bru0vhFcD7mGLN9BClx+8aUeuy
	 MiBP9/IaUzrmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 14/22] media: i2c: add Maxim GMSL2/3 serializer
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260831-gmsl2-3_serdes-v16-14-4fa6e08bb514@analog.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831-gmsl2-3_serdes-v16-14-4fa6e08bb514@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:47:22 +0000
Message-Id: <20260831134722.BED811F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] Calling i2c_atr_del_adapter() after i2c_atr_add_adapter() fail=
s causes a Use-After-Free and Double Free.
- [High] max_ser_set_fmt returns -EINVAL for unrouted streams, blocking for=
mat configuration.
- [High] max_ser_get_pipe_mode does not filter out disabled streams, causin=
g disable_streams to fail.
- [High] Error rollback logic in max_ser_update_phys fails to revert the ha=
rdware PHY state due to a tautological condition.
- [High] I2C partial transfer success can result in returning bogus data in=
 max_ser_read_reg.
- [High] Writing 7-bit I2C address directly to hardware registers that expe=
ct an 8-bit shifted address.
- [Medium] V4L2_CID_TEST_PATTERN control does not immediately update the ha=
rdware if changed while streaming.
- [Medium] set_fmt and set_frame_interval return -EINVAL for unsupported fo=
rmats/intervals instead of adjusting them.
- [Medium] Public configuration functions modify shared device and hardware=
 state without synchronization.
- [Medium] Missing NULL pointer check before calling reg_read and reg_write=
 ops.
- [Medium] Misplaced msleep inside the inner polling loop causes unnecessar=
y and compounded boot delays.
--

commit 84b2d87ccaabb6540ea9079c058c69ab7bc76022
Author: Cosmin Tanislav <demonsingur@gmail.com>
Subject: media: i2c: add Maxim GMSL2/3 serializer framework

This commit introduces a common driver framework for Maxim GMSL2/3=20
serializers. It supports features like the full Streams API, automatic VC=20
remapping, I2C ATR, and PHY mode configurations.

> diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c=
/maxim-serdes/max_ser.c
> new file mode 100644
> index 0000000000000..9f4d0b57bdf8d
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_ser.c
[ ... ]
> +static void max_ser_i2c_atr_deinit(struct max_ser_priv *priv)
> +{
> +	/* Deleting adapters that haven't been added does no harm. */
> +	i2c_atr_del_adapter(priv->atr, 0);
> +
> +	i2c_atr_delete(priv->atr);
> +	priv->atr =3D NULL;
> +}
> +
> +static int max_ser_i2c_atr_init(struct max_ser_priv *priv)
> +{
> +	struct i2c_atr_adap_desc desc =3D {
> +		.chan_id =3D 0,
> +	};
> +	int ret;
[ ... ]
> +	ret =3D i2c_atr_add_adapter(priv->atr, &desc);
> +	if (ret)
> +		max_ser_i2c_atr_deinit(priv);
> +
> +	return ret;
> +}

[Severity: Critical]
Is it safe to unconditionally call i2c_atr_del_adapter() when=20
i2c_atr_add_adapter() fails? If i2c_atr_add_adapter() fails internally=20
(for example, inside i2c_add_adapter), it cleans up the channel structure=20
but leaves a dangling pointer in atr->adapter[chan_id]. Calling=20
i2c_atr_del_adapter() afterward can dereference that pointer and cause=20
a use-after-free or double-free.

[ ... ]
> +static int max_ser_set_tpg_fmt(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	entry =3D max_ser_find_tpg_entry(ser, 0, fmt->width, fmt->height,
> +				       fmt->code, 0, 0);
> +	if (!entry)
> +		return -EINVAL;

[Severity: Medium]
Should this adjust the format to a supported one instead of returning
-EINVAL? The V4L2 specification usually requires format negotiation APIs
like VIDIOC_SUBDEV_S_FMT to fall back to the closest supported configuration
rather than returning an error when an unsupported format is requested.

[ ... ]
> +static int max_ser_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state,
> +			   struct v4l2_subdev_format *format)
> +{
[ ... ]
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;

[Severity: High]
Will this block format configuration for streams that are not routed yet?
If userspace tools, such as media-ctl, attempt to configure formats prior
to establishing routes, v4l2_subdev_state_get_opposite_stream_format()
will return NULL and cause this to return -EINVAL.

[ ... ]
> +static int max_ser_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct max_ser_priv *priv =3D ctrl_to_priv(ctrl->handler);
> +	struct max_ser *ser =3D priv->ser;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		ser->tpg_pattern =3D ctrl->val;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}

[Severity: Medium]
Does this properly apply the test pattern to the hardware if the device
is already streaming? It appears the new pattern is stored in the
software state, but the hardware won't be updated until the next stream
start. V4L2 expects active controls to apply immediately.

[ ... ]
> +static int max_ser_set_frame_interval(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      struct v4l2_subdev_frame_interval *fi)
> +{
[ ... ]
> +	entry =3D max_ser_find_tpg_entry(ser, 0, fmt->width, fmt->height,
> +				       fmt->code, fi->interval.numerator,
> +				       fi->interval.denominator);
> +	if (!entry)
> +		return -EINVAL;

[Severity: Medium]
Similarly, should this adjust the interval instead of returning -EINVAL
when an exact match isn't found?

[ ... ]
> +static int max_ser_get_pipe_mode(struct max_ser_priv *priv,
> +				 struct v4l2_subdev_state *state,
> +				 struct max_ser_pipe *pipe,
> +				 struct max_ser_pipe_mode *mode)
> +{
> +	struct v4l2_subdev_route *route;
> +	struct max_ser *ser =3D priv->ser;
[ ... ]
> +	for_each_active_route(&state->routing, route) {
> +		struct max_ser_route_hw hw;
> +		unsigned int bpp;
> +
> +		ret =3D max_ser_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;

[Severity: High]
Is a check to filter out disabled streams missing here? In other functions,
disabled streams are skipped by checking if the stream is in streams_masks.
If a route exists with an unbound subdev, max_ser_route_to_hw() could
fail or yield an invalid entry. This can lead to disable_streams() failing=
=20
with -ENOENT and leaking active stream states.

[ ... ]
> +static int max_ser_update_phy(struct max_ser_priv *priv,
> +			      struct v4l2_subdev_state *state,
> +			      struct max_ser_phy *phy, u64 *streams_masks)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	u32 pad =3D max_ser_phy_to_pad(ser, phy);
> +	bool enable_changed =3D !streams_masks[pad] !=3D !priv->streams_masks[p=
ad];
[ ... ]
> +static int max_ser_update_phys(struct max_ser_priv *priv,
> +			       struct v4l2_subdev_state *state,
> +			       u64 *streams_masks)
> +{
[ ... ]
> +err:
> +	for (i =3D 0; i < failed_update_phy_id; i++) {
> +		struct max_ser_phy *phy =3D &ser->phys[i];
> +
> +		max_ser_update_phy(priv, state, phy, priv->streams_masks);
> +	}
> +
> +	return ret;
> +}

[Severity: High]
Can this rollback logic successfully revert the hardware PHY state?
When max_ser_update_phys() calls max_ser_update_phy() in the error path,
it passes priv->streams_masks as the streams_masks argument. Inside
max_ser_update_phy(), the comparison for enable_changed will evaluate
!priv->streams_masks[pad] !=3D !priv->streams_masks[pad], which is always
false, preventing the hardware from being correctly deactivated.

[ ... ]
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +static int max_ser_g_register(struct v4l2_subdev *sd,
> +			      struct v4l2_dbg_register *reg)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D ser->ops->reg_read(ser, reg->reg, &val);

[Severity: Medium]
Could this trigger a NULL pointer dereference if the driver using this
framework doesn't implement the optional reg_read callback?

[ ... ]
> +static int max_ser_s_register(struct v4l2_subdev *sd,
> +			      const struct v4l2_dbg_register *reg)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +
> +	return ser->ops->reg_write(ser, reg->reg, reg->val);
> +}

[Severity: Medium]
Similarly, should there be a check to ensure reg_write is implemented
before calling it here?

[ ... ]
> +int max_ser_set_mode(struct v4l2_subdev *sd, enum max_serdes_gmsl_mode m=
ode)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	int ret;
[ ... ]
> +	ser->mode =3D mode;
> +
> +	return 0;
> +}

[Severity: Medium]
Is synchronization required when modifying the operational mode here? If
userspace tools invoke ioctls concurrently on different subdevices, could
this cause data races when updating the shared device state?

[ ... ]
> +int max_ser_set_vc_remaps(struct v4l2_subdev *sd,
> +			  struct max_serdes_vc_remap *vc_remaps,
> +			  int num_vc_remaps)
> +{
[ ... ]
> +	for (i =3D 0; i < num_vc_remaps; i++)
> +		ser->vc_remaps[i] =3D vc_remaps[i];
> +
> +	ser->num_vc_remaps =3D num_vc_remaps;
> +
> +	return 0;
> +}

[Severity: Medium]
Does writing to this shared array require a driver-level lock to prevent
concurrent modifications from corrupting the internal state?

[ ... ]
> +static int max_ser_read_reg(struct i2c_adapter *adapter, u8 addr,
> +			    u16 reg, u8 *val)
> +{
> +	u8 buf[2] =3D { reg >> 8, reg & 0xff };
> +	struct i2c_msg msg[2] =3D {
[ ... ]
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
If i2c_transfer() returns 1 (meaning a partial transfer success where the
device acknowledged the first message but not the second), ret < 0 is false
and the function succeeds. Could this result in silently returning bogus
data (the MSB of the register address) instead of the actual read value?

[ ... ]
> +int max_ser_wait_for_multiple(struct i2c_adapter *adapter, u8 *addrs,
> +			      unsigned int num_addrs, u8 *current_addr)
> +{
> +	unsigned int i, j;
> +	int ret =3D 0;
> +	u8 val;
> +
> +	for (i =3D 0; i < 10; i++) {
> +		for (j =3D 0; j < num_addrs; j++) {
> +			ret =3D max_ser_read_reg(adapter, addrs[j], MAX_SER_REG0, &val);
> +			if (!ret && val) {
> +				*current_addr =3D addrs[j];
> +				return 0;
> +			}
> +
> +			msleep(100);
> +		}
> +	}
> +
> +	return ret ?: -ETIMEDOUT;
> +}

[Severity: Medium]
Should the msleep(100) be placed in the outer loop instead of the inner
one? If placed here, the driver will needlessly delay 100ms for each
preceding failed address in the candidate list before probing the next,
which can significantly compound boot delays.

[ ... ]
> +int max_ser_fix_tx_ids(struct i2c_adapter *adapter, u8 addr)
> +{
> +	unsigned int addr_regs[] =3D {
> +		MAX_SER_CFGI_INFOFR_TR3,
> +		MAX_SER_CFGL_SPI_TR3,
[ ... ]
> +	};
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(addr_regs); i++) {
> +		ret =3D max_ser_write_reg(adapter, addr, addr_regs[i], addr);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Does this inadvertently write the 7-bit I2C address directly without
shifting it? Other parts of the driver (like max_ser_change_address)
appear to expect the device address to be shifted left by 1 when written
to hardware registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-gmsl2-3_se=
rdes-v16-0-4fa6e08bb514@analog.com?part=3D14
