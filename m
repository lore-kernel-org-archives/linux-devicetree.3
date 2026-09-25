Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92671FECBA
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343877; cv=none; b=OJhzAJc8IBoIDCiGoAkfLNT/cE7dH6SRKxJ6RxdnSgkZHFSiahO05R7iO9LfTIaPJtPXwE+UgGNMDgL/YyGQROf2wzdRCnE+5qE6AwPzkDzRsPhMcVG93KjZ+I2aNkFELlwOtSModVmrwni7/it8E/IHfmEuLp/QE3cIdY8lWnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343877; c=relaxed/simple;
	bh=tAAMDNCpIFdoDRQXD84OR199xByyxpiwJ8kbYrjnP4I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FoS+jU/808hMwLQ660DK2Nr/KcjBKHqCq5a/8YekwI9t1ZYX52+VQ8A5lJCGujfIa4RzEwa3Vk6RrfcKY07ZagGmNTFKB8auielQfQwrPGn6cUjlohptJtJIIwiT2IqvwTFX7QMU/IiheIa+3QnqYJ8vX1v5PE6GnQMBGIg7kvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wk8UGYCL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wk8UGYCL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9F11F000FF;
	Fri, 25 Sep 2026 13:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343875;
	bh=8x1qfz6Sfo+YH98vsVzuZupl0itqCCIB5tHsH50COIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wk8UGYCLg5cJ992u1IS8XotXhf5OFtvlvuJcr0Ya5bW/0RwwSXNUHB3/+gkgMzLFX
	 OpFcRKdbooi05rDN8GCzwXciS8Q6HsgfCQt3V8Ccu7kL7Tn7JuoxvTtu5jTC8Tt0ha
	 tFk3a+CWsC1jeIohclVIVBBAp8QR+Adw2FugGyWrtQiD54IS6jtx19VdyPsX4MVg/t
	 wWtrYRUT7N3IcInpsMNhbDpwYgNugwBsXV7LX/b1pJGg/ft9loe76bodz9u++9n/1k
	 Ivw8xnAYCnZhYU6/Sg7Lvrg6OHwg73p2Lg1F1EEtH8jCqMt4Y6sL0Au4pTmDveb6au
	 zKpLMUwEV2fEA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260925133001.2780868-7-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-7-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 13:44:34 +0000
Message-Id: <20260925134435.5C9F11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [High] media: ov2312: pm_runtime usage counter underflow on stream disabl=
e error
- [High] media: ov2312: hardware clock and power leaked in probe
- [High] media: ov2312: reading stale p_new values from unclustered multi c=
ontrols
- [High] media: ov2312: incorrect endianness conversions break big-endian p=
latforms
- [High] media: ov2312: valid control value of 0 aborts hardware updates
- [High] media: ov2312: lockless enable_count check causes PM runtime usage=
 leak
- [High] media: ov2312: unprotected I2C hardware access on suspended device=
 via s_ctrl
- [Medium] media: ov2312: set_fmt explicitly rejects valid stream 1 configu=
ration
- [Medium] media: ov2312: set_frame_interval rejects unsupported framerates=
 instead of adjusting
- [Medium] media: ov2312: single-capture V4L2 controls always fail with -EI=
NVAL
- [Medium] media: ov2312: TOCTOU race in set_fmt allows format changes whil=
e streaming
- [Low] media: ov2312: dead code and compiler warnings from unconditional P=
M callbacks
- [Low] media: ov2312: mixing scope-based guard() with goto-based error han=
dling
- [Low] media: ov2312: I2C device ID table uses positional initializers
--

commit 0c2ea846b3d892b1fe5473cabeacb68b8c969d79
Author: Jai Luthra <jai.luthra@linux.dev>

media: i2c: ov2312: add Omnivison OV2312 driver

Omnivision OV2312 is an RGB-IR sensor, i.e. it uses a 4x4 R,G,B,Ir bayer
pattern to capture both visible and near-infrared light. Every alternate
frame, the sensor changes the exposure and IR flash strobe registers to
stream an -
A. IR-dominant frame on CSI-2 virtual channel 0
B. RGB-dominant frame on CSI-2 virtual channel 1

> diff --git a/drivers/media/i2c/ov2312.c b/drivers/media/i2c/ov2312.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/ov2312.c
> @@ -0,0 +1,939 @@
[ ... ]
> +static int ov2312_read(struct ov2312 *ov2312, u16 addr, u32 *val, size_t=
 nbytes)
> +{
> +	int ret;
> +	__le32 val_le =3D 0;
> +
> +	ret =3D regmap_bulk_read(ov2312->regmap, addr, &val_le, nbytes);
> +	if (ret < 0) {
> +		dev_err(ov2312->dev, "%s: failed to read reg 0x%04x: %d\n",
> +			__func__, addr, ret);
> +		return ret;
> +	}
> +
> +	*val =3D le32_to_cpu(val_le);

[Severity: High]
Does this endianness conversion work correctly on big-endian architectures?
Since regmap_bulk_read reads an array of bytes into a little-endian 32-bit
variable, le32_to_cpu will swap the bytes on big-endian platforms, which
might corrupt the read value.

> +	return 0;
> +}
[ ... ]
> +static int ov2312_set_fmt(struct v4l2_subdev *sd,
> +			  const struct v4l2_subdev_client_info *ci,
> +			  struct v4l2_subdev_state *state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct ov2312 *ov2312 =3D to_ov2312(sd);
> +	struct v4l2_mbus_framefmt *format;
> +	const struct v4l2_area *fsize;
> +	u32 code;
> +	int ret =3D 0;
> +
> +	if (fmt->pad !=3D 0)
> +		return -EINVAL;
> +
> +	if (fmt->stream !=3D 0)
> +		return -EINVAL;

[Severity: Medium]
Will this break standard V4L2 tooling that attempts to configure the format
for stream 1? Userspace will receive -EINVAL when trying to configure the
RGB stream on virtual channel 1.

> +
> +	/* Sensor only supports a single format. */
> +	code =3D ov2312_mbus_formats[0];
> +
> +	/* Find the nearest supported frame size. */
> +	fsize =3D v4l2_find_nearest_size(ov2312_framesizes,
> +				       ARRAY_SIZE(ov2312_framesizes), width,
> +				       height, fmt->format.width,
> +				       fmt->format.height);
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	/* Update the stored format and return it. */
> +	format =3D v4l2_subdev_state_get_format(state, fmt->pad, fmt->stream);
> +
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && ov2312->enable_count=
) {

[Severity: Medium]
Is it safe to read ov2312->enable_count here without holding the lock
(ov2312->lock)? If a concurrent VIDIOC_STREAMON starts the stream right
after this check, the active format might be overwritten while the device
is streaming, causing a pipeline state mismatch.

> +		ret =3D -EBUSY;
> +		goto done;
> +	}
[ ... ]
> +static int ov2312_set_frame_interval(struct v4l2_subdev *sd,
> +					 struct v4l2_subdev_state *state,
> +				     struct v4l2_subdev_frame_interval *fi)
> +{
> +	struct ov2312 *ov2312 =3D to_ov2312(sd);
> +
> +	if (!fi->interval.numerator)
> +		return -EINVAL;
> +
> +	dev_dbg(ov2312->dev, "%s: Set framerate %dfps\n", __func__,
> +		fi->interval.denominator / fi->interval.numerator);
> +
> +	if ((fi->interval.denominator / fi->interval.numerator) !=3D ov2312->fp=
s / 2) {
> +		dev_err(ov2312->dev, "%s: Framerate can only be %dfps\n",
> +			__func__, ov2312->fps / 2);
> +		return -EINVAL;

[Severity: Medium]
Is returning -EINVAL here correct for V4L2 negotiation? Standard behavior
usually involves adjusting or clipping unsupported frame intervals to the
closest supported one, rather than rejecting them with an error.

> +	}
> +
> +	return 0;
> +}
> +
> +static int ov2312_detect(struct ov2312 *ov2312)
> +{
> +	int ret;
> +	u32 id;
> +
> +	ret =3D ov2312_read(ov2312, OV2312_SC_CHIP_ID_HI, &id, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	id =3D cpu_to_be16(id);

[Severity: High]
Does this patch the endianness flaw correctly? Since id is a 32-bit variabl=
e,
cpu_to_be16 will only convert the lower 16 bits. On big-endian platforms,
this combined with the previous le32_to_cpu conversion might result in
the wrong chip ID being detected, causing probe failure.

> +
> +	if (id !=3D OV2312_CHIP_ID) {
[ ... ]
> +static int ov2312_set_AB_mode(struct ov2312 *ov2312)
> +{
> +	bool ir_ready  =3D ov2312->exposure_multi->p_new.p_u32[1] &&
> +			 ov2312->again_multi->p_new.p_u32[1] &&
> +			 ov2312->dgain_multi->p_new.p_u32[1];
> +	bool rgb_ready =3D ov2312->exposure_multi->p_new.p_u32[0] &&
> +			 ov2312->again_multi->p_new.p_u32[0] &&
> +			 ov2312->dgain_multi->p_new.p_u32[0];

[Severity: High]
Can these p_new values be stale? Because these controls are not bound
together via v4l2_ctrl_cluster(), setting one of them won't automatically
synchronize the p_new values of the others. This could lead to unpredictable
hardware register states when updating the controls.

[Severity: High]
Also, does a control value of 0 incorrectly abort hardware updates here?
Since analog and digital gains can legitimately be set to 0, using the
logical AND (&&) might evaluate to false, meaning valid configuration
requests could be silently ignored.

> +	int ret;
> +
> +	if (ir_ready) {
[ ... ]
> +static int ov2312_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov2312 *ov2312 =3D container_of(ctrl->handler,
> +					     struct ov2312, ctrls);
> +	int ret;
> +
> +	/*
> +	 * If the device is not powered up by the host driver do
> +	 * not apply any controls to H/W at this time. Instead
> +	 * the controls will be restored right after power-up.
> +	 */
> +	if (pm_runtime_suspended(ov2312->dev))
> +		return 0;

[Severity: High]
Is it possible for the device to suspend asynchronously right after this
check? Accessing the I2C bus locklessly without pinning the power state
with a reference (e.g., pm_runtime_get_if_in_use) could lead to hanging
the bus or crashing when writing to powered-off hardware.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE_MULTI:
> +	case V4L2_CID_AGAIN_MULTI:
> +	case V4L2_CID_DGAIN_MULTI:
> +		dev_dbg(ov2312->dev, "debug: %s: %s =3D [%u, %u]\n", __func__,
> +				ctrl->name, ctrl->p_new.p_u32[0], ctrl->p_new.p_u32[1]);
> +
> +		ret =3D ov2312_set_AB_mode(ov2312);
> +		break;
> +
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		ret =3D ov2312_set_orientation(ov2312);
> +		break;
> +
> +	default:
> +		ret =3D -EINVAL;

[Severity: Medium]
Will this return -EINVAL for the single-capture backward-compatibility
controls like V4L2_CID_EXPOSURE? The driver registers them, but they
are not handled in this switch statement, which will cause standard userspa=
ce
apps to fail when setting them.

> +	}
> +
> +	return ret;
> +}
[ ... ]
> +static int ov2312_sd_enable_streams(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *state,
> +				       u32 pad, u64 streams_mask)
> +{
> +	struct ov2312 *ov2312 =3D to_ov2312(sd);
> +	int ret;
> +
> +	guard(mutex)(&ov2312->lock);
> +
> +	if (!ov2312->enable_count) {
> +		ret =3D pm_runtime_resume_and_get(ov2312->dev);
> +		if (ret < 0)
> +			goto err;

[Severity: Low]
Is it intended to mix scope-based guard() with goto-based error handling
here? Subsystem guidelines recommend avoiding this combination within the
same function, as it creates confusing ownership and cleanup semantics.

> +
> +		ret =3D ov2312_start_stream(ov2312);
> +		if (ret < 0) {
> +			pm_runtime_put(ov2312->dev);
> +			goto err;
> +		}
> +	}
> +
> +	ov2312->enable_count++;
> +
> +	return 0;
> +
> +err:
> +	dev_err(ov2312->dev,
> +		"%s: failed to enable streams %d\n", __func__, ret);
> +	return ret;
> +}
> +
> +static int ov2312_sd_disable_streams(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					u32 pad, u64 streams_mask)
> +{
> +	struct ov2312 *ov2312 =3D to_ov2312(sd);
> +	int ret;
> +
> +	mutex_lock(&ov2312->lock);
> +
> +	if (ov2312->enable_count =3D=3D 1) {
> +		ret =3D ov2312_stop_stream(ov2312);
> +		if (ret < 0)
> +			goto err_runtime_put;
> +	}
> +
> +	ov2312->enable_count--;
> +	mutex_unlock(&ov2312->lock);
> +
> +	if (!ov2312->enable_count)

[Severity: High]
Could checking enable_count without the lock here cause a PM runtime
usage leak? If a concurrent stream enable happens right after unlocking,
the condition evaluates to false and the pm_runtime_put() call is skipped,
preventing the device from ever suspending.

> +		pm_runtime_put(ov2312->dev);
> +
> +	return 0;
> +
> +err_runtime_put:
> +	mutex_unlock(&ov2312->lock);
> +	pm_runtime_put(ov2312->dev);

[Severity: High]
Should ov2312->enable_count be decremented on this error path? Dropping
the PM runtime reference without reducing the enable count desynchronizes
the power state, which could lead to PM underflows or hardware access
on a powered-off device later.

> +	return ret;
> +}
[ ... ]
> +static int ov2312_probe(struct i2c_client *client)
> +{
[ ... ]
> +	/* PM Runtime */
> +	pm_runtime_enable(ov2312->dev);
> +	pm_runtime_set_suspended(ov2312->dev);

[Severity: High]
Is it correct to set the PM runtime state to suspended here? The hardware
was turned on earlier in the probe with ov2312_power_on(), and
ov2312_power_off() hasn't been called.

> +
> +	ret =3D v4l2_subdev_init_finalize(sd);
> +	if (ret < 0)
> +		goto err_pm_disable;
> +
> +	/* Finally, register the subdev. */
> +	ret =3D v4l2_async_register_subdev(sd);
> +	if (ret < 0) {
> +		ret =3D dev_err_probe(ov2312->dev, ret,
> +				    "v4l2 subdev register failed\n");
> +		goto err_subdev_cleanup;
> +	}
> +
> +	dev_info(ov2312->dev, "ov2312 probed\n");
> +	return 0;

[Severity: High]
Does returning success here leak the hardware clock and power? The PM core
believes the device is suspended, but it is actually powered on, leading
to a permanent power drain and potential double-enable on the next resume.

> +
> +err_subdev_cleanup:
> +	v4l2_subdev_cleanup(&ov2312->sd);
[ ... ]
> +static const struct i2c_device_id ov2312_id[] =3D {
> +	{ "ov2312", 0 },

[Severity: Low]
Does this violate the I2C subsystem rules? Initialized arrays of type
struct i2c_device_id are required to use named initializers instead of
positional ones.

> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i2c, ov2312_id);
[ ... ]
> +static struct i2c_driver ov2312_i2c_driver =3D {
> +	.driver =3D {
> +		.name	=3D "ov2312",
> +		.pm	=3D &ov2312_pm_ops,

[Severity: Low]
Should this use the pm_ptr() wrapper? Assigning the PM operations structure
unconditionally will cause compiler warnings about unused static functions
when CONFIG_PM is disabled.

> +		.of_match_table =3D of_match_ptr(ov2312_of_match),
> +	},
> +	.probe		=3D ov2312_probe,
> +	.remove		=3D ov2312_remove,
> +	.id_table	=3D ov2312_id,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925133001.2780=
868-1-r-donadkar@ti.com?part=3D6
