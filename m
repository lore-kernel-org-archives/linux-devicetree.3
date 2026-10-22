Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659237;
	b=Bk7rTEU8MQkEl+ayG+BNm63dxc41OFcy06QJ9MNVBSbio9Z03BB79Hlms064KWUZzGVU
	 gMM2MN1evXKzir86b6rQaRrbdwnCbhYosvshgod8WTBF4B3lhRSu1jXOOcUEcDGgLjg4o
	 0OvHBxHwULTsroMjJQFTkEh77zDXqqBRmiy0bbuGhAqTM3w+f511sPQ/TFEZF/HJJsuYB
	 KVHoRiArblyoeab1GdYlB+5BnUSuzzSlHWtjl0PJ3d9N36IHtIK4HpszJzfKBOtCYsLlB
	 gBXLigRoXCfxkWOBn4j2IvZk83mjfMVyFgk5q/F75rZOpmRa4S+/q7tt6CAsypGWD5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659237;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j7WsEDzukp7GUPxAqgJzyeUUBxFx0uBhlxKr0nu1FRs=;
	b=JYjl33Bl73yraQQ2VtuGNJTegj4J24nINaS5cNUSKl751HT+FjIjiHUhZstlV5zV5LQC
	 vl8nXzPMhFr9VSEcCf7JBWxOPmctWyQN4cMISU9DwncNDes1IGDehhvKoWRZhreAoAK9l
	 ZfkaKx91rzg0lOyuZUW2asAFpt3LGhRIT4B5o2b0oLgCUTqdxaMtugZGQSouL14jgfyzH
	 Kc2TmRqK+85PuQj9giJK/1JXvhuB/yfW40pZXiZCFnIi2CWqkMAycm3YarFj+Ymvz14wc
	 Ml7Z7E3ul1gozZ7lYwFSLQo2s/fD+2WlmvLoHYLM4Imru3iXIRzYn+66l1H7nwrD0Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=maLLRNHz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A3606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=maLLRNHz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844A81F000C5;
	Thu, 22 Oct 2026 08:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792659236;
	bh=j7WsEDzukp7GUPxAqgJzyeUUBxFx0uBhlxKr0nu1FRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=maLLRNHzLdq1z+L+gUNIfQyie7aHxroGA3FyjTmE6JIppL6NaGPBexv5eRv6VmXze
	 A0xxELGxCSa+pzutCeiKnxmvyjM5c+NS3X6YYLkWVXGKJ8H97HhvrnL/Jo9WeregAh
	 uNuAzGx8BxFwzl+NsmCFeEGPKbACdM6asmbp3hBqU5/i9myJR5uxO3XjHZYnjUHTYB
	 okKxEbOd0DnrdtvNNs3i9sT38jxzGJzla0ScoWiplxmKDHgRuLp1wmLFLOTj1v/Ne5
	 PxPBFNoQIdI1L9dM1uBmb33H1j8DN263+mc52xndzbg5r0Ii8yUO/XdrQoOoEjOKBa
	 bqN78PvnBFbIQ==
Message-ID: <sashiko-outbox-181212@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] media: i2c: mira016: Add driver for Mira016
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261022-mira016-v8-2-a7adc039e938@ideasonboard.com>
References: <20261022-mira016-v8-0-a7adc039e938@ideasonboard.com>
 <20261022-mira016-v8-2-a7adc039e938@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 08:53:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] media: i2c: mira016: UAF in mira016_remove() from early ctrl_handl=
er free
- [Medium] media: i2c: mira016: mira016_configure_pll() ignores cci_read() =
errors
- [Medium] media: i2c: mira016: inconsistent gain/exposure control ranges a=
nd clamping
- [Medium] media: i2c: mira016: mira016_parse_endpoint() requires clock-non=
continuous
--

commit d341d9824bc6e71d0d0cd055cabaa4ddefd594bc
Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

media: i2c: mira016: Add driver for Mira016

This commit adds a V4L2 subdevice sensor driver for the ams OSRAM Mira016
global shutter image sensor over I2C and MIPI CSI-2.

> diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
> new file mode 100644
> index 0000000000000..082442ffad28b
> --- /dev/null
> +++ b/drivers/media/i2c/mira016.c
> @@ -0,0 +1,2361 @@

[ ... ]

> +static int mira016_set_pad_format(struct v4l2_subdev *sd,
> +				  const struct v4l2_subdev_client_info *ci,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_format *fmt)
> +{
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +	struct v4l2_rect *crop;
> +	u32 pixel_rate;
> +	u32 min_vblank;
> +	u32 gain_max;
> +	int ret;
> +
> +	/*
> +	 * Changing the active image format implies updating the row_length
> +	 * parameter, which changes the line duration and the pixel rate
> +	 * consequentially. Also, changing the image format changes the analogue
> +	 * gain limits.
> +	 *
> +	 * Do not allow to change image format while the subdevice is streaming.
> +	 *
> +	 * TODO: row length depends on binning, update it also in the
> +	 * implementation of set_selection.
> +	 */
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> +	    v4l2_subdev_is_streaming(sd))
> +		return -EBUSY;
> +
> +	mira016_update_pad_format(mira016, &fmt->format);
> +	*v4l2_subdev_state_get_format(state, 0) =3D fmt->format;
> +
> +	crop =3D v4l2_subdev_state_get_crop(state, 0);
> +	crop->width =3D fmt->format.width;
> +	crop->height =3D fmt->format.height;
> +	crop->left =3D MIRA016_PIXEL_ARRAY_LEFT;
> +	crop->top =3D MIRA016_PIXEL_ARRAY_TOP;
> +
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	switch (fmt->format.code) {
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +		gain_max =3D ARRAY_SIZE(mira016_gain_lut_8bit);
> +		break;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +		gain_max =3D ARRAY_SIZE(mira016_gain_lut_10bit);
> +		break;
> +	case MEDIA_BUS_FMT_Y12_1X12:
> +	default:
> +		/*
> +		 * TODO: Clarify how to handle 12 bit 2x fixed gain which
> +		 * changes the line timings while streaming. Only allow 1x
> +		 * for the time being.
> +		 */
> +		gain_max =3D 1;
> +		break;
> +	}
> +
> +	ret =3D __v4l2_ctrl_modify_range(mira016->gain, 1, gain_max, 1, 1);
> +	if (ret)
> +		return ret;
> +
> +	mira016_calc_row_length(mira016, state);
> +
> +	min_vblank =3D mira016_calc_min_vblank(mira016, crop->height);
> +	ret =3D __v4l2_ctrl_modify_range(mira016->vblank, min_vblank,
> +				       MIRA016_MAX_VBLANK, 1, min_vblank);
> +	if (ret)
> +		return ret;
> +
> +	pixel_rate =3D mira016_calc_prate(mira016, crop->width);
> +
> +	return __v4l2_ctrl_modify_range(mira016->prate, pixel_rate, pixel_rate,
> +					1, pixel_rate);
> +}

[ ... ]

> +static int mira016_configure_pll(struct mira016 *mira016)
> +{
> +	int ret =3D 0;
> +	u64 val;
> +
> +	/* Configure the PLL clock tree. */
> +
> +	cci_write(mira016->regmap, MIRA016_BANK_SEL_REG, 0, &ret);
> +
> +	cci_write(mira016->regmap, MIRA016_PLL_DIV_N_REG, mira016->pll.n, &ret);
> +	cci_write(mira016->regmap, MIRA016_PLL_DIV_M_REG, mira016->pll.m, &ret);
> +	cci_write(mira016->regmap, MIRA016_CLKGEN_CP_DIV_REG,
> +		  mira016->pll.cp_div, &ret);
> +	cci_write(mira016->regmap, MIRA016_OTP_GRANULARITY_REG,
> +		  mira016->pll.otp_gran, &ret);
> +	cci_write(mira016->regmap, MIRA016_GRAN_TG_REG, mira016->pll.gran_tg, &=
ret);
> +	cci_write(mira016->regmap, MIRA016_LUT_DEL008_REG,
> +		  mira016->pll.lut_del, &ret);
> +	cci_write(mira016->regmap, MIRA016_CLKGEN_TX_ESC_H_REG,
> +		  mira016->pll.esc_h, &ret);
> +	cci_write(mira016->regmap, MIRA016_CLKGEN_TX_ESC_L_REG,
> +		  mira016->pll.esc_l, &ret);
> +	cci_write(mira016->regmap, MIRA016_PLL_PD_REG, 0, &ret);
> +	if (ret)
> +		return ret;
> +
> +	return read_poll_timeout(cci_read, ret,
> +				 (ret < 0 || (val & MIRA016_PLL_LOCKED)),
> +				 500, 10000, false, mira016->regmap,
> +				 MIRA016_PLL_LOCK_REG, &val, NULL);
> +}

[Severity: Medium]
In drivers/media/i2c/mira016.c, when mira016_power_on() calls
mira016_configure_pll() during mira016_probe() or runtime PM resume in
mira016_enable_streams(), does returning the result of read_poll_timeout()
directly drop I2C read errors from cci_read()?

In include/linux/iopoll.h, read_poll_timeout() evaluates to 0 whenever the
break condition is true and only returns -ETIMEDOUT if the timeout expires
with the condition false. If cci_read() fails with a negative error code
(ret < 0), the condition (ret < 0 || (val & MIRA016_PLL_LOCKED)) becomes
true, so read_poll_timeout() breaks out of the loop and returns 0.

Because mira016_configure_pll() returns that 0 directly without checking re=
t,
any I2C failure while polling MIRA016_PLL_LOCK_REG is treated as a successf=
ul
PLL lock. Should mira016_configure_pll() check if ret is non-zero before
returning the result of read_poll_timeout()?

[ ... ]

> +static int mira016_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_format fmt =3D {
> +		.which =3D V4L2_SUBDEV_FORMAT_TRY,
> +		.pad =3D 0,
> +		.format =3D {
> +			.code =3D MEDIA_BUS_FMT_Y8_1X8,
> +			.width =3D MIRA016_PIXEL_ARRAY_WIDTH,
> +			.height =3D MIRA016_PIXEL_ARRAY_HEIGHT
> +		},
> +	};
> +
> +	return mira016_set_pad_format(sd, NULL, state, &fmt);
> +}

[ ... ]

> +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mira016 *mira016 =3D
> +		container_of(ctrl->handler, struct mira016, ctrl_handler);
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_rect *crop;
> +	int ret =3D 0;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&mira016->sd);
> +	crop =3D v4l2_subdev_state_get_crop(state, 0);
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		s32 exposure_min =3D
> +			mira016_nsec_to_lines(mira016,
> +					      mira016->timings.min_exposure_time);
> +		s32 exposure_max =3D crop->height + ctrl->val
> +				 - MIRA016_FRAME_INTEGRATION_DIFF;
> +		s32 exposure_def =3D min(exposure_max,
> +				       mira016->exposure->val);
> +
> +		ret =3D __v4l2_ctrl_modify_range(mira016->exposure,
> +					       exposure_min,
> +					       exposure_max,
> +					       mira016->exposure->step,
> +					       exposure_def);
> +		if (ret)
> +			return ret;
> +	}

[ ... ]

> +static int mira016_init_controls(struct mira016 *mira016)
> +{

[ ... ]

> +	min_exposure_lines =3D mira016_nsec_to_lines(mira016,
> +						   mira016->timings.min_exposure_time);
> +	def_exposure =3D mira016_nsec_to_lines(mira016,
> +					     MIRA016_EXPOSURE_DEF_NSEC);
> +	mira016->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &mira016_ctrl_ops,
> +					      V4L2_CID_EXPOSURE,
> +					      min_exposure_lines,
> +					      MIRA016_MAX_EXPOSURE, 1,
> +					      def_exposure);
> +
> +	mira016->gain =3D v4l2_ctrl_new_std(ctrl_hdlr, &mira016_ctrl_ops,
> +					  V4L2_CID_ANALOGUE_GAIN,
> +					  1, 1, 1, 1);

[Severity: Medium]
Are the initial and format-updated control ranges for mira016->gain and
mira016->exposure in drivers/media/i2c/mira016.c consistent with the active
pad format?

1. During mira016_probe(), mira016_init_controls() creates mira016->gain
with a range of [1, 1] and mira016->exposure with a maximum of
MIRA016_MAX_EXPOSURE. Next, v4l2_subdev_init_finalize() invokes
mira016_init_state(), which sets the initial format to MEDIA_BUS_FMT_Y8_1X8
but calls mira016_set_pad_format() with fmt.which =3D V4L2_SUBDEV_FORMAT_TR=
Y.
Because mira016_set_pad_format() returns early for V4L2_SUBDEV_FORMAT_TRY,
the control ranges are never updated for the initial active format. If
streaming starts without an explicit VIDIOC_SUBDEV_S_FMT call, analogue gain
is limited to 1 instead of ARRAY_SIZE(mira016_gain_lut_8bit) and exposure c=
an
be set up to MIRA016_MAX_EXPOSURE rather than MIRA016_PIXEL_ARRAY_HEIGHT +
def_vblank - MIRA016_FRAME_INTEGRATION_DIFF.

2. When mira016_set_pad_format() is called with V4L2_SUBDEV_FORMAT_ACTIVE,
mira016_calc_row_length() updates mira016->timings.row_length (which changes
the line duration and the minimum exposure in lines) and updates the range =
of
mira016->vblank, but it does not update the range of mira016->exposure unle=
ss
the old vblank value falls outside the new [min_vblank, MIRA016_MAX_VBLANK]
range and triggers mira016_set_ctrl().

3. In mira016_set_ctrl() when handling V4L2_CID_VBLANK, exposure_def is
computed as min(exposure_max, mira016->exposure->val), which only bounds
exposure_def above by exposure_max and does not bound it below by
exposure_min with clamp(). If V4L2_CID_EXPOSURE is set to 5 or 6 lines while
the format is MEDIA_BUS_FMT_Y12_1X12 (row_length =3D 1504, exposure_min =3D=
 5)
and the format is then changed to MEDIA_BUS_FMT_Y8_1X8 or
MEDIA_BUS_FMT_Y10_1X10 (row_length =3D 1062, exposure_min =3D 7), a subsequ=
ent
V4L2_CID_VBLANK update or mira016_enable_streams() ->
__v4l2_ctrl_handler_setup() calls __v4l2_ctrl_modify_range() with
exposure_def < exposure_min, which fails in check_range() with -ERANGE.

Should mira016_init_controls(), mira016_set_pad_format(), and
mira016_set_ctrl() initialize and update the gain and exposure ranges
consistently and clamp exposure_def to [exposure_min, exposure_max]?

[ ... ]

> +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mi=
ra016)
> +{

[ ... ]

> +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK))=
 {
> +		dev_err(dev, "Continuous clock is not supported\n");
> +		v4l2_fwnode_endpoint_free(&ep_cfg);
> +		return -EINVAL;
> +	}

[Severity: Medium]
In drivers/media/i2c/mira016.c, mira016_probe() -> mira016_parse_endpoint()=
 ->
v4l2_fwnode_endpoint_alloc_parse() only sets
V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK when the clock-noncontinuous property is
present on the Device Tree endpoint node.

However, Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml does
not list clock-noncontinuous under the endpoint properties or required list,
nor does it include clock-noncontinuous in its Device Tree example:

      endpoint:
        $ref: /schemas/media/video-interfaces.yaml#
        unevaluatedProperties: false

        properties:
          data-lanes:
            items:
              - const: 1

        required:
          - data-lanes
          - link-frequencies

Will mira016_parse_endpoint() reject any Device Tree written according to
ams,mira016.yaml with -EINVAL?

[ ... ]

> +	mira016->sd.state_lock =3D mira016->ctrl_handler.lock;
> +	ret =3D v4l2_subdev_init_finalize(&mira016->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "subdev init error\n");
> +		goto error_media_entity;
> +	}
> +
> +	ret =3D v4l2_async_register_subdev_sensor(&mira016->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret,
> +			      "failed to register sensor sub-device\n");
> +		goto error_subdev_cleanup;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&mira016->sd);
> +error_media_entity:
> +	media_entity_cleanup(&mira016->sd.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);
> +error_power_off:
> +	pm_runtime_disable(dev);
> +	mira016_power_off(dev);
> +	pm_runtime_set_suspended(dev);
> +	return ret;
> +}
> +
> +static void mira016_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct mira016 *mira016 =3D to_mira016(sd);
> +
> +	v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(&mira016->sd);
> +	media_entity_cleanup(&sd->entity);

[Severity: High]
In drivers/media/i2c/mira016.c, can calling v4l2_ctrl_handler_free() at the
start of mira016_remove() cause a use-after-free?

In mira016_probe(), mira016->sd.state_lock is set to
mira016->ctrl_handler.lock before calling v4l2_subdev_init_finalize() and
v4l2_async_register_subdev_sensor().

When mira016_remove() calls v4l2_ctrl_handler_free(mira016->sd.ctrl_handler)
before v4l2_async_unregister_subdev(sd) and v4l2_subdev_cleanup(&mira016->s=
d),
all controls owned by the handler (mira016->gain, mira016->vblank,
mira016->prate, mira016->exposure, mira016->hflip, mira016->vflip) are freed
and mira016->ctrl_handler._lock is destroyed while the subdevice and its
devnode are still registered and accessible.

Any concurrent subdev ioctl or stream operation executing before
v4l2_async_unregister_subdev(sd) completes will acquire the destroyed
state_lock mutex and dereference freed v4l2_ctrl pointers in
mira016_set_pad_format(), mira016_enable_streams(), or
mira016_disable_streams().

Should v4l2_ctrl_handler_free() be called after v4l2_async_unregister_subde=
v()
and v4l2_subdev_cleanup(), matching the error unwind order in mira016_probe=
()?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-mira016-v8=
-0-a7adc039e938@ideasonboard.com?part=3D2
