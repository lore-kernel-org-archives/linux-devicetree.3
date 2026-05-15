Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E5F368D53
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883037; cv=none; b=taC5M2jiwb2sRcO9wyrkAZ5ATpfrbV6trzf35/Hmm2NndelMk8bktwvvZplsW7Tozmm+awWVLVCmJ/M151bBh5hi5MozbKPo+86kdVhbs1eFOK7ogmKH7GpIdjAWPdGWe4zFeKGkT58c1zMDHlXRDwk4ZdTOlOtPgkR0V6eCkfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883037; c=relaxed/simple;
	bh=OrNEz044O2bUUb4tZSehVWC7aL8/xnmz5C6jZSuKz6Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SxD7tCfuzwdehP4/kI/bIFiuPV5T7JlzssTvHHOwKPiA55rIrqz+wYRuJ54mT7S3nwg3Cit479svBXEAWdfbqfKVpX0ldIXfuxB98wMaQK6Eaa7cHahzCmBLe7p4ijmH4+YI3dV3TAlBaeFu6kU7/+0ysckd0fJDin5vFbG9gFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ohbko1oq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ohbko1oq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D5CC2BCB7;
	Fri, 15 May 2026 22:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778883037;
	bh=OrNEz044O2bUUb4tZSehVWC7aL8/xnmz5C6jZSuKz6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ohbko1oqS015FDFoex+qopenXBI8DmQjaM0lB1vfGxba90r9Yqzowq8Sn93hY7WYJ
	 DHJhsFClgeC8ld+6QWRJRK63U2l7YVraVsmQh56iobTxFPulm1ruYXAHuvuPOivdHg
	 5lIEyMuW/NsErZqxYEzSkZKOQlenoEa6Op2vdzo0AHfv0FwVeFeihS9C38iBx4OCTX
	 E3snG2iTE9/vEZAcrtm5W3nMZphAuJeMOfEISqtjDZrgAQzvZl7BkcdzVcKi3Bc4AZ
	 LB6VmMVbBY0iL5EENAHRSIuW20M/Z6phcOMW3Qhc9g917qi3qjUFXrS+z1367904BR
	 +h9PM8Hyk5ksg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/10] leds: rgb: add support for Samsung S2M series
 PMIC RGB LED device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516-s2mu005-pmic-v7-7-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-7-73f9702fb461@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:10:36 +0000
Message-Id: <20260515221037.03D5CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] The driver uses the `abs()` macro on unsigned integer subtractions=
, causing a build failure and integer underflow.
- [High] Unconditional dereference of `dev->parent` without validation caus=
es a kernel panic if instantiated via a standalone DT node.
- [High] Setting a solid brightness does not clear previously configured ha=
rdware pattern timings, causing the LED to continue blinking.
- [High] Missing Kconfig dependency on `LEDS_CLASS_MULTICOLOR`.
- [Medium] The driver silently aggregates complex multi-pulse patterns and =
forcibly alters blink semantics instead of rejecting unsupported patterns.
- [Medium] Software and hardware pattern states become desynchronized on er=
ror paths.
- [Medium] The driver incorrectly uses the array loop index instead of the =
`channel` field for hardware register offsets.
- [Low] The `of_match_table` is exported but not assigned to the platform d=
river.
--

commit d2d65a1923271678db5e8b3090e9b23768e600c4
Author: Kaustabh Chakraborty <kauschluss@disroot.org>
leds: rgb: add support for Samsung S2M series PMIC RGB LED device

This commit adds support for the RGB LEDs found in Samsung S2M series PMICs,
starting with the S2MU005. It controls three LED channels as a single
device, providing 8-bit brightness control for each channel.

> diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> index 28ef4c487367c..b16144b48b8f8 100644
> --- a/drivers/leds/rgb/Kconfig
> +++ b/drivers/leds/rgb/Kconfig
> @@ -75,6 +75,16 @@ config LEDS_QCOM_LPG
> =20
>  	  If compiled as a module, the module will be named leds-qcom-lpg.
> =20
> +config LEDS_S2M_RGB
> +	tristate "Samsung S2M series PMICs RGB LED support"
> +	depends on LEDS_CLASS
> +	depends on MFD_SEC_CORE

Should this also depend on LEDS_CLASS_MULTICOLOR?

The driver uses multicolor LED APIs like led_mc_calc_color_components and
devm_led_classdev_multicolor_register_ext. Without a Kconfig dependency on
CONFIG_LEDS_CLASS_MULTICOLOR, building the kernel with the multicolor class
disabled could result in silent functional failures or link errors.

> diff --git a/drivers/leds/rgb/leds-s2m-rgb.c b/drivers/leds/rgb/leds-s2m-=
rgb.c
> new file mode 100644
> index 0000000000000..d239f54eee901
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-s2m-rgb.c
[ ... ]
> +static int s2mu005_rgb_apply_params(struct s2m_rgb *rgb)
> +{
[ ... ]
> +	for (int i =3D 0; i < rgb->mc.num_colors; i++) {
> +		ret =3D regmap_write(regmap, S2MU005_REG_RGB_CH_CTRL(i),
> +				   rgb->mc.subled_info[i].brightness);

Is it safe to use the loop index i to calculate the hardware channel?

While i currently matches the channel sequentially, any reordering of the
subled_info array might cause the index to map to the wrong physical channe=
l.

Would it be better to extract and use rgb->mc.subled_info[i].channel instea=
d?

[ ... ]
> +static int s2m_rgb_lut_get_closest_duration(const u32 *lut, const size_t=
 len, const u32 duration)
> +{
> +	u32 closest_distance =3D abs(duration - lut[0]);

Can this cause a compile-time error and integer underflow?

Both duration and lut[0] are u32 variables, and subtracting a larger unsign=
ed
integer from a smaller one will wrap around. Additionally, the abs macro in
linux/math.h is designed to reject unsigned types and evaluates to void.

Could abs_diff be used here instead?

[ ... ]
> +static int s2m_rgb_pattern_set(struct led_classdev *cdev, struct led_pat=
tern *pattern, u32 len,
> +			       int repeat)
> +{
[ ... ]
> +	for (int i =3D 0; i < len; i++) {
> +		int brightness =3D pattern[i].brightness;
> +		u32 delta_t =3D pattern[i].delta_t;
> +
> +		if (brightness) {
> +			/*
> +			 * The pattern should define only one non-zero
> +			 * brightness in the HIGH state. The device doesn't
> +			 * have any provisions to handle multiple peak
> +			 * brightness levels.
> +			 */
> +			if (brightness_peak && brightness_peak !=3D brightness)
> +				return -EINVAL;
> +
> +			brightness_peak =3D brightness;
> +			time_hi +=3D delta_t;
> +			ramp_dn_en =3D !!delta_t;
> +		} else {
> +			time_lo +=3D delta_t;
> +			ramp_up_en =3D !!delta_t;
> +		}
> +	}

Instead of accumulating durations to force a breathing effect, should the
driver reject unsupported patterns by returning -EINVAL?

If a sequence with more than two states or sharp step transitions is reques=
ted,
rejecting it would allow the LED core to correctly fall back to
software-driven blinking instead of silently distorting the sequence.

[ ... ]
> +param_fail:
> +	rgb->ramp_up =3D 0;
> +	rgb->ramp_dn =3D 0;
> +	rgb->stay_hi =3D 0;
> +	rgb->stay_lo =3D 0;
> +
> +	mutex_unlock(&rgb->lock);
> +
> +	return ret;
> +}

Could this error path leave the software and hardware pattern states
desynchronized?

Zeroing out the timing state variables without clearing the hardware pattern
means the hardware continues blinking. A subsequent brightness update might
then unintentionally alter the running pattern by writing this zeroed state.

[ ... ]
> +static int s2m_rgb_brightness_set(struct led_classdev *cdev, enum led_br=
ightness value)
> +{
> +	struct s2m_rgb *rgb =3D to_s2m_rgb(to_s2m_mc(cdev));
> +	int ret =3D 0;
> +
> +	if (!value)
> +		return s2m_rgb_pattern_clear(cdev);
> +
> +	mutex_lock(&rgb->lock);
> +
> +	led_mc_calc_color_components(&rgb->mc, value);
> +	/* Apply params with variant-specific implementation. */
> +	ret =3D s2mu005_rgb_apply_params(rgb);

Does this need to clear previously configured hardware pattern timings when
setting a solid brightness?

If a hardware blink pattern was previously active, the old non-zero timings
will be written back to the registers along with the new peak brightness,
causing the LED to continue blinking instead of emitting a solid color.

[ ... ]
> +static int s2m_rgb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sec_pmic_dev *pmic_drvdata =3D dev_get_drvdata(dev->parent);

What happens if this driver is instantiated via a standalone device tree
node rather than as an MFD child?

If dev->parent is NULL, this unconditional dereference will cause a kernel
panic.

Should dev->parent be validated before use?

[ ... ]
> +static struct platform_driver s2m_rgb_driver =3D {
> +	.driver =3D {
> +		.name =3D "s2m-rgb",
> +	},
> +	.probe =3D s2m_rgb_probe,
> +	.id_table =3D s2m_rgb_id_table,
> +};

Is the of_match_table assignment missing from the driver struct?

s2m_rgb_of_match_table is declared earlier in the file to support explicit
device tree matching but is not assigned here, preventing direct Open Firmw=
are
matching.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-s2mu005-pm=
ic-v7-0-73f9702fb461@disroot.org?part=3D7
