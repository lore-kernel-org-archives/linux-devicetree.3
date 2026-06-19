Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A8A381AE3
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872965; cv=none; b=HGGdV8+F3aCqiHgbeaealh1l+Bq5vpgeMDDuYIC7pbvsgCSLz5cc/lxn4Nh8SB7ht1b1Ig4Ss2avrVskYpvp5DF7HqSWlP9OchFgN+zsnHq1T0sGxwoNQ64gF0zJSuaI3m7U/thkImdHZakzP9jZfdcBp+3JixhDnBy8KBzOslU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872965; c=relaxed/simple;
	bh=BVC393h53K+K/8rti33EWGKS/8wi1NM8xOiURR9GR8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rQbKWf/qtbHHSE9oy53HJaLJk0Qj8ewTLdHMg1dzycsKg6HCh/wFJvHyabsmrBVOlrf56Ojs6fvKqSZL4EBGiPY6u2QXOnqV/F5zOLKMx/WuOsMz8Rw/kTON0v0tqYJZfGFWXQGwwpSMU0oYHuiSJrlg7RnYKk8kUb7ou4bUkRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkaZ07nI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkaZ07nI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EF21F000E9;
	Fri, 19 Jun 2026 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872964;
	bh=jOAc0/OVYILccrI452HSYcTFclGfWMuaoIDIS8GpUm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fkaZ07nIG8zxuC/wtVjCvnWlBdloCXgSDWO0OOBXp40LO0Qbup5SB6GAv+HTt+ahA
	 AgrHrhumhLVdnHZQfy7y72oyAHmvoWOsoqHfTHaKSItsJuhzXh8e5orFDZT/d2DV+B
	 05aIx/7oqYL0y/LmIprZvk0o/Nl2aOHquuxAh/fk15KM0hqg8R7HUOimtTcKZG4mGh
	 uTjS+E89ljGoie7IaVQYhBY3DGvHVFZca8guwvZVprSNQMDr6jZ+n7vBOgFFOZAJFu
	 bwK4ZWb1jJMwyVlwIfUuFer3R9/PRDitNafxjdn0qZJlChGVzLRHrnHZxX2f7bFFzb
	 Z8IQj3CeI6nXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] media: i2c: add Himax HM1246 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matthias Fend" <matthias.fend@emfend.at>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260619-hm1246-v10-2-d88e431a6c11@emfend.at>
References: <20260619-hm1246-v10-0-d88e431a6c11@emfend.at>
 <20260619-hm1246-v10-2-d88e431a6c11@emfend.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 12:42:43 +0000
Message-Id: <20260619124243.E7EF21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect validation of `pm_runtime_get_if_active()` return value =
allows unpowered hardware access and causes an unbalanced `pm_runtime_put()=
` decrement.
- [High] The driver fails to update the active subdev state format when fli=
p controls change the Bayer layout.
- [High] Integer overflow in 32-bit PLL VCO computation results in erroneou=
sly validating broken hardware configurations.
- [Medium] Flawed nested loops in PLL calculation prevent finding valid div=
iders by breaking prematurely.
- [Medium] Logic error in PLL multiplier calculation skips valid configurat=
ions.
- [Medium] Unprotected concurrent access to clustered control values during=
 TRY pad operations.
--

commit a1e846fd762489ac057abc081793eb13dea90d9f
Author: Matthias Fend <matthias.fend@emfend.at>

media: i2c: add Himax HM1246 image sensor driver

This commit adds a V4L2 sub-device driver for the Himax HM1246-AWD image
sensor. It operates the sensor in raw mode and bypasses the internal ISP.

> diff --git a/drivers/media/i2c/hm1246.c b/drivers/media/i2c/hm1246.c
> new file mode 100644
> index 0000000000000..ba120967814f3
> --- /dev/null
> +++ b/drivers/media/i2c/hm1246.c

[ ... ]

> +/* Get the format code of the mode considering current flip setting. */
> +static u32 hm1246_get_format_code(struct hm1246 *hm1246,
> +				  const struct hm1246_mode *hm1246_mode)
> +{
> +	return hm1246_mode->codes[FLIP_FORMAT_INDEX(hm1246->vflip_ctrl->val,
> +						    hm1246->hflip_ctrl->val)];
> +}

[Severity: Medium]
Could this result in unprotected concurrent access to clustered control val=
ues?

When invoked during pad operations (like VIDIOC_SUBDEV_ENUM_MBUS_CODE) acti=
ng
on the V4L2_SUBDEV_FORMAT_TRY state, the lock held is the file handle's TRY
state lock, not the control handler lock.

Accessing hm1246->vflip_ctrl->val and hm1246->hflip_ctrl->val directly
without holding v4l2_ctrl_lock(hm1246->ctrls.lock) allows a data race with
concurrent VIDIOC_S_CTRL calls, potentially resulting in reading a
torn/inconsistent set of flip values and exposing incorrect Bayer patterns.

[ ... ]

> +	/* Find suitable PCLK and SYSCLK dividers. */
> +	for (pclk_div_index =3D 0; pclk_div_index < ARRAY_SIZE(pclk_div_table);
> +	     pclk_div_index++) {
> +		for (sysclk_div_index =3D 0;
> +		     sysclk_div_index < ARRAY_SIZE(sysclk_div_table);
> +		     sysclk_div_index++) {
> +			if (sysclk_div_table[sysclk_div_index] *
> +				    sysclk_pclk_ratio =3D=3D
> +			    pclk_div_table[pclk_div_index]) {
> +				sysclk_pclk_ratio_found =3D true;
> +				break;
> +			}
> +		}
> +		if (sysclk_pclk_ratio_found)
> +			break;

[Severity: Medium]
Will this break prematurely without checking other valid combinations?

Breaking immediately upon finding the first valid sysclk_pclk_ratio locks
pclk_div to the first match. If this specific divider cannot satisfy the
subsequent VCO constraint limits (vco_out between 360M and 680M), the
function returns -EINVAL instead of trying other valid pclk_div combination=
s.

> +	}
> +
> +	if (!sysclk_pclk_ratio_found)
> +		return -EINVAL;
> +
> +	/* Determine an appropriate post divider. */
> +	for (post_div_index =3D 0; post_div_index < ARRAY_SIZE(post_div_table);
> +	     post_div_index++) {
> +		vco_out =3D pclk * pclk_div_table[pclk_div_index] *
> +			  post_div_table[post_div_index];

[Severity: High]
Can this overflow the 32-bit vco_out variable?

For higher link frequencies (e.g., link_freq =3D 96M giving pclk =3D 192M),
combined with a pclk_div of 6 and a post_div of 8, the mathematical product
is 9,216,000,000. This exceeds the 32-bit limit and overflows to 626,065,40=
8.

Because 626M happens to fall within the valid VCO constraints [360M, 680M],
the driver improperly accepts this completely invalid setup.

> +
> +		if (vco_out >=3D HM1246_PLL_VCO_MIN &&
> +		    vco_out <=3D HM1246_PLL_VCO_MAX)
> +			break;
> +	}
> +	if (post_div_index >=3D ARRAY_SIZE(post_div_table))
> +		return -EINVAL;
> +
> +	/* Find pre-divider and multiplier values. */
> +	for (u32 div =3D DIV_ROUND_UP(xclk, HM1246_PLL_INCLK_MAX);
> +	     div <=3D xclk / HM1246_PLL_INCLK_MIN; div++) {
> +		u32 multi, multi_h, multi_l, vco;
> +
> +		multi =3D DIV_ROUND_CLOSEST_ULL((u64)vco_out * div, xclk);
> +		if (multi < HM1246_PLL_MULTI_MIN ||
> +		    multi > HM1246_PLL_MULTI_MAX)
> +			continue;
> +
> +		multi_h =3D multi / (HM1246_PLL_MULTI_H_MIN *
> +				   HM1246_PLL_MULTI_L_MAX) +
> +			  2;
> +		multi_l =3D multi / multi_h;

[Severity: Medium]
Does this logic mistakenly skip valid configurations when multi is exactly =
512?

If the required overall multiplier multi is exactly 512, this formula
calculates multi_h as 512 / 512 + 2 =3D 3. It then sets multi_l =3D 512 / 3=
 =3D 170.
The product is 3 * 170 =3D 510, which triggers the if (vco !=3D vco_out)
rejection.

However, a multiplier of exactly 512 is valid and achievable with multi_h =
=3D 2
and multi_l =3D 256.

[ ... ]

> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		s64 exposure_max;
> +
> +		exposure_max =3D
> +			format->height + ctrl->val - HM1246_COARSE_INTG_MARGIN;
> +		ret =3D __v4l2_ctrl_modify_range(hm1246->exposure_ctrl,
> +					       hm1246->exposure_ctrl->minimum,
> +					       exposure_max,
> +					       hm1246->exposure_ctrl->step,
> +					       exposure_max);
> +
> +		if (ret) {
> +			dev_err(hm1246->dev, "exposure ctrl range update failed\n");
> +			return ret;
> +		}
> +	}
> +
> +	if (!pm_runtime_get_if_active(hm1246->dev))
> +		return 0;

[Severity: High]
Does this check allow execution to continue on negative error codes?

pm_runtime_get_if_active() returns 1 if the device is active, 0 if it is not
active, and a negative error code (e.g., -EINVAL) if Runtime PM is disabled.

Because of the logical NOT, negative error codes evaluate to false, allowing
execution to bypass the return 0 check. This allows the driver to proceed
with hardware accesses while the device may be unpowered, and leads to an
unmatched pm_runtime_put() at the end of the function.

> +
> +	ret =3D 0;
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(hm1246->regmap, HM1246_COARSE_INTG_REG, ctrl->val,
> +			  &ret);
> +		break;
> +
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		cci_write(hm1246->regmap, HM1246_ANALOG_GLOBAL_GAIN_REG,
> +			  ctrl->val, &ret);
> +		break;
> +
> +	case V4L2_CID_VBLANK:
> +		val =3D format->height + ctrl->val;
> +		cci_write(hm1246->regmap, HM1246_FRAME_LENGTH_LINES_REG, val,
> +			  &ret);
> +		break;
> +
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:

[Severity: High]
Does this omission break format negotiation and video pipeline link validat=
ion?

The driver registers the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls with the
V4L2_CTRL_FLAG_MODIFY_LAYOUT flag. While the hardware orientation registers
are updated, the format code in the subdevice's active state is not updated
to reflect the new Bayer pattern.

Subsequent calls to the VIDIOC_SUBDEV_G_FMT ioctl will return the stale
Bayer format preserved in the state.

> +		val =3D 0;
> +		if (hm1246->hflip_ctrl->val)
> +			val |=3D HM1246_IMAGE_ORIENTATION_HFLIP;
> +		if (hm1246->vflip_ctrl->val)
> +			val |=3D HM1246_IMAGE_ORIENTATION_VFLIP;
> +
> +		cci_write(hm1246->regmap, HM1246_IMAGE_ORIENTATION_REG, val,
> +			  &ret);
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-hm1246-v10=
-0-d88e431a6c11@emfend.at?part=3D2
