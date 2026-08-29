Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A84D31F9A4
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788005775; cv=none; b=YZX1G5mEvNh5Wg2Mk8F6CJEuXl50f/5bn8wY39CJ9aHEZ1EvHBts8TkXaHTGEwdrprAnAi6CPKNbtpoaJPtCd21rUaclsXHZtLQ4QrfTE1rQjv6f5peprTdH3whsix0s9wpO45Cupc22xs/uZJbi63a0lM9lgYEj4UVSHjbPMBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788005775; c=relaxed/simple;
	bh=rwIRBv0NnWuQkgTP078Njm6tr/qTk96vt9+K6u72/28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=axiUW1rsT9pHPsBnhMWcyHDZjte/GuZQvuq8nt3KUHfD/+t9gACwiMHkkAYy8sbKFEhhwfD7nM4/eg5Kh8SMUufaEDfzyxcy02XWhyrPntv+c9OthcKn+2B3jXLSPDeZSqPO9T5xjtu/QVe5DNI3ghCYMJgWig4+bzGOXvhqoxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYycL3fZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYycL3fZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686D41F000E9;
	Sat, 29 Aug 2026 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788005773;
	bh=18g4W52KtGoPaaR6cUnZm1cMUwAngOHJzbnckdwT8pY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WYycL3fZ8Dvaz7s3suU8zUpZZ3jQ97/ZZhKcJlARgo42btRszleeHoQLAtsHWOX7O
	 6tBPF6QZWu84YFh8rRfQoUa1jyl8dtbVvDgFmfgeJc0rQdrYT48CLhii/9vfecYPHY
	 m0ghVR/WrrVQ5HSMlWJ8LijOvdFMjar2mDtCHKYFuQlcsEht4CeH7K7S3B23vTn8Pt
	 TZ98gaug0fl7Uz2u6ArEZMRqjjy7DWKdb5ZLGazxR+qWSZ8VlzARgX6X0DXPC8mDTk
	 tKBgRZsT2uaOAnAc4mx/ak6kbkx/0OTMYEmgDJr5OzFWPfLwtfI6AGVors+zJ9py6e
	 ZzzZDDZN18hAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] media: i2c: Add driver for OmniVision OV32C4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Bozik" <robertbozik@gmail.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260829115832.8749-3-robertbozik@gmail.com>
References: <20260829115832.8749-1-robertbozik@gmail.com>
 <20260829115832.8749-3-robertbozik@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 12:16:13 +0000
Message-Id: <20260829121613.686D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect error handling of pm_runtime_get_if_active() leads to PM=
 usage counter underflow.
- [Medium] Missing colorspace and format field initializations in ov32c4_up=
date_pad_format().
- [Low] Missing stubs for ACPI resource functions when CONFIG_ACPI is disab=
led causes build errors.
--

commit cc0f9470db4c3422b5043e7cf05c1cf8e2c925dd
Author: Robert Bozik <robertbozik@gmail.com>
Date:   Sat Aug 29 11:58:31 2026 +0000

media: i2c: Add driver for OmniVision OV32C4

This commit adds a Video4Linux2 driver for the OmniVision OV32C4 CMOS image=
=20
sensor, connected over MIPI CSI-2. It supports 3264x1840 at 30 fps=20
enumerated through ACPI and paired with an Intel IPU.

> diff --git a/drivers/media/i2c/ov32c4.c b/drivers/media/i2c/ov32c4.c
> new file mode 100644
> index 0000000000000..cfeeafcfbc56f
> --- /dev/null
> +++ b/drivers/media/i2c/ov32c4.c
[ ... ]
> +static u16 ov32c4_acpi_i2c_addr(struct device *dev, int index)
> +{
> +	struct ov32c4_i2c_res_ctx ctx =3D { .want =3D index };
> +	struct acpi_device *adev =3D ACPI_COMPANION(dev);
> +	LIST_HEAD(resources);
> +	int ret;
> +
> +	if (!adev)
> +		return 0;
> +
> +	ret =3D acpi_dev_get_resources(adev, &resources, ov32c4_i2c_res_cb, &ct=
x);
> +	acpi_dev_free_resource_list(&resources);

[Severity: Low]
When CONFIG_ACPI is disabled, are acpi_dev_get_resources() and
acpi_dev_free_resource_list() available?

Since the depends on ACPI constraint was dropped from Kconfig, this might
cause build failures on non-ACPI configurations where these functions lack
empty stub implementations.

[ ... ]
> +static int ov32c4_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov32c4 *ov32c4 =3D container_of(ctrl->handler,
> +					     struct ov32c4, ctrl_handler);
> +	const u32 height =3D supported_modes[0].height;
> +	s64 exposure_max;
> +	int ret =3D 0;
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
[ ... ]
> +	}
> +
> +	if (!pm_runtime_get_if_active(ov32c4->dev))
> +		return 0;

[Severity: High]
Does this properly handle the case where Runtime PM is disabled?

If pm_runtime_get_if_active() returns -EINVAL (which occurs when Runtime PM
is disabled), the !-EINVAL condition evaluates to false. This bypasses
the early return and allows execution to continue down to pm_runtime_put(),
leading to a usage counter underflow.

[ ... ]
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put(ov32c4->dev);
> +
> +	return ret;
> +}
[ ... ]
> +static void ov32c4_update_pad_format(const struct ov32c4_mode *mode,
> +				     struct v4l2_mbus_framefmt *fmt)
> +{
> +	fmt->width =3D mode->width;
> +	fmt->height =3D mode->height;
> +	fmt->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->field =3D V4L2_FIELD_NONE;
> +}

[Severity: Medium]
Are the remaining format fields intentionally left uninitialized here?

Fields like colorspace, ycbcr_enc, quantization, and xfer_func are not
set. If a user application calls VIDIOC_SUBDEV_S_FMT with arbitrary values
for these fields, they will bypass this function and be stored in the
subdev state, leading to incorrect colorspace reporting to userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829115832.8749=
-1-robertbozik@gmail.com?part=3D2
