Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099CA3DA5A5
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281026; cv=none; b=a+1XDGbz5XWhsYzqF5IJTeBmgaV0u21Oejq+TlpYcfR5jjWB7MQnZNELY8yVtNI1SmzoM4dGqKCA8+Ge7DvTaN4ifqEz3vlEJ0IXULxFyES7s2BgsXOqZcfEY96AM6w+DyiZzNNon3DmD+uQ/pFsdEWjdmPq8oMWYpJuwfrwHu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281026; c=relaxed/simple;
	bh=U35kK2+CyiEfJWnEZ2WH1CNIgcy4e2WfF+ZqEXgVE4A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RiMHyxL9lNR8IXhCNGI89V1ljaSlJq0Byz8ShSQ31h7SBttDMHFUcMOZg4KlzBMJfvVUkGDwQw5RYXnxGyzFE/GmaEdRLBsROwhLPHg3jMDRAYHVv9YkKwfgMsj/owNSCcwe/MQjs9zMkawkLYQWqEmcRItIN1LSB7oH1jwW3oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2YjLimU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2YjLimU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22C91F00893;
	Wed, 20 May 2026 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779281024;
	bh=OreroQIPgWFMksVjLSE26/+LH/L8gk1WSk4EoNNqkYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S2YjLimUD1xpMmbNCi0REXp1zvMRdPvLJPVTq9y+qFgZGkrlmtroDbYCaU8NiIitF
	 tlFbCUULKsXgwcDiWbYBoRvrzkGWqiWF8M611Ud8RbvVaZx9tY1u7MHGntUeGXsLac
	 PjNRmDVTo9xZZ6FCuNuwbbv3Sv8dzPiFUXZVNqXqwVGXD4BFfPHA282fzFwL+WscBJ
	 ycF72IcwcZSk1jqr8lM/ngwUqS8h//re+uWU4/ZP49Wqx5wCev3wCP3dhlp6WroOun
	 KK9oLXLM6mUcw57QoG/mI6NCTDhfHjp7HAFZ7jyD+3RKHKr1f9Zi+dQAC4Q67ZXHSX
	 aF7AE5sL78HRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] media: i2c: add imx576 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Himanshu Bhavani" <himanshu.bhavani@siliconsignals.io>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520115641.11729-3-himanshu.bhavani@siliconsignals.io>
References: <20260520115641.11729-3-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:43:44 +0000
Message-Id: <20260520124344.B22C91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect check of pm_runtime_get_if_active() return value allows =
usage count underflow and unprotected hardware access.
- [High] The sensor's HOLD register is not released if a control write fail=
s, permanently freezing parameter updates.
- [High] The calculation of `pixel_rate` suffers from a 32-bit unsigned int=
eger overflow, resulting in severely incorrect pixel rate reporting on 32-b=
it architectures.
- [Low] The dev_pm_ops structure is assigned unconditionally to the driver,=
 producing dead code when CONFIG_PM is disabled.
--

commit 59203a6d78786f12f9149e145b22e86d70893eef
Author: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Date:   Wed May 20 11:56:34 2026 +0000

media: i2c: add imx576 image sensor driver

Add a v4l2 subdevice driver for the Sony imx576 sensor. The driver includes
support for manual exposure, analog gain, and vblank/hblank controls.

> diff --git a/drivers/media/i2c/imx576.c b/drivers/media/i2c/imx576.c
> new file mode 100644
> index 0000000000000..910cbcfb6031f
> --- /dev/null
> +++ b/drivers/media/i2c/imx576.c
[ ... ]
> +static int imx576_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx576 *imx576 =3D container_of_const(ctrl->handler,
> +						   struct imx576, handler);
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret =3D 0;
> +
> +	state =3D v4l2_subdev_get_locked_active_state(&imx576->sd);
> +	fmt =3D v4l2_subdev_state_get_format(state, 0);
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		/* Honour the VBLANK limits when setting exposure */
> +		ret =3D __v4l2_ctrl_modify_range(imx576->exposure,
> +					       IMX576_EXPOSURE_MIN,
> +					       fmt->height + ctrl->val -
> +					       IMX576_EXPOSURE_OFFSET,
> +					       1, IMX576_EXPOSURE_DEFAULT);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (pm_runtime_get_if_active(imx576->dev) =3D=3D 0)
> +		return 0;

[Severity: High]
Could this lead to an unbalanced usage counter and invalid hardware access =
if
Runtime PM is disabled? pm_runtime_get_if_active() can return a negative er=
ror
code (like -EINVAL). If it returns less than zero, this check evaluates to
false, which would allow the function to continue accessing hardware and
eventually call pm_runtime_put() without a prior successful get. Should this
check be <=3D 0 instead?

> +
> +	cci_write(imx576->regmap, IMX576_REG_HOLD, 1, &ret);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK: {
> +		u64 vmax =3D fmt->height + ctrl->val;
> +
> +		ret =3D cci_write(imx576->regmap, IMX576_REG_VTS, vmax, &ret);
> +		break;
> +	}
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D cci_write(imx576->regmap, IMX576_REG_EXPOSURE, ctrl->val, &ret=
);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret =3D cci_write(imx576->regmap, IMX576_REG_ANALOG_GAIN,
> +				ctrl->val, &ret);
> +		break;
> +	default:
> +		dev_err(imx576->dev, "Invalid control %d\n", ctrl->id);
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	cci_write(imx576->regmap, IMX576_REG_HOLD, 0, &ret);

[Severity: High]
Does this leave the sensor permanently stuck in HOLD mode if any of the
preceding control writes fail?

Since cci_write() acts as a no-op when the passed error pointer holds a
non-zero value, a failure in updating exposure or gain would cause this fin=
al
write to be skipped.

Should this final write use a separate error variable or pass NULL to
guarantee the HOLD register is released?

> +
> +	pm_runtime_put(imx576->dev);
> +
> +	return ret;
> +}
[ ... ]
> +static int imx576_init_controls(struct imx576 *imx576)
> +{
> +	const struct imx576_mode *mode =3D &supported_modes_10bit[0];
> +	struct v4l2_fwnode_device_properties props;
> +	u64 vblank_def, hblank_def, pixel_rate;
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	u32 lpfr;
> +	int ret;
[ ... ]
> +	imx576->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,
> +					   V4L2_CID_VBLANK, vblank_def,
> +					   IMX576_VBLANK_MAX, 1,
> +					   vblank_def);
> +
> +	/* pixel_rate =3D link_frequency * 2 * nr_of_lanes / bits_per_sample */
> +	pixel_rate =3D div_u64(IMX576_LINK_FREQ_600MHZ * 2 * IMX576_NUM_DATA_LA=
NES, 10);

[Severity: High]
Can this multiplication overflow on 32-bit architectures?

IMX576_LINK_FREQ_600MHZ expands to (600 * HZ_PER_MHZ), which evaluates as a
32-bit unsigned long. Multiplying this by 2 and then by 4 (the number of
data lanes) yields 4,800,000,000, which exceeds the maximum 32-bit unsigned
value and will wrap around before it is implicitly promoted to u64 for
div_u64().

Would it be safer to explicitly cast IMX576_LINK_FREQ_600MHZ to u64 before
the multiplication?

> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops, V4L2_CID_PIXEL_RATE,
> +			  pixel_rate, pixel_rate, 1, pixel_rate);
[ ... ]
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx576_pm_ops,
> +				 imx576_power_off, imx576_power_on, NULL);
> +
> +static const struct of_device_id imx576_of_match[] =3D {
> +	{ .compatible =3D "sony,imx576" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx576_of_match);
> +
> +static struct i2c_driver imx576_driver =3D {
> +	.driver =3D {
> +		.name =3D "imx576",
> +		.pm =3D &imx576_pm_ops,

[Severity: Low]
Will this cause dead code to be compiled into the kernel when CONFIG_PM
is disabled? According to the Power Management subsystem guidelines,
the dev_pm_ops structure pointer should be assigned using the pm_ptr()
wrapper to allow the compiler to eliminate the unused structure and its
callbacks.

> +		.of_match_table =3D imx576_of_match,
> +	},
> +	.probe =3D imx576_probe,
> +	.remove =3D imx576_remove,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520115641.1172=
9-1-himanshu.bhavani@siliconsignals.io?part=3D2
