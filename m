Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780413;
	b=0hFuqj2Zq+59q3EYaLPYNzEcWnvt1d+IQIgS7eKQtMm7awZ7sIpelgXUUiq/NWZx5N8a
	 hUc4U/VCV4tQJc+dAsZL0H1liiMg8hkaVpPD8ZM9i8ktO1fO8mkxCyaulP/Nk/jBMrYC+
	 IXe8r6SsM9+L2pJLbafrNJ5SSMYJUVZc4YGC3Fmq4brkV0twS4PlaClG/LsflNisDjpSP
	 YNt+5yMisvh0KE/Ud+C1W6uDeelwvjXpvdugA7Xi4AP2CPeiag/K0qGD7//R6PB/CRx/7
	 izNeGE5YWBbIU8z9GZ1XjKyPPFpQI2qz+lfMkULz2LQ+XE11E9UV31/szuoe+/R4V/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780413;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=awrU6kmNZ7/EfFFNlcK5Nsg3dVPD0GVQbxEuv/mLd+M=;
	b=vp9/PREZZqNqVFHQYmtI9LEf6VKRhYgY8kXbd9iMD+qs5dk8s0OEK20bhz+SyZrXKEtq
	 rB/8eqlg87hhPcQ3Zw3RRxHVJg2+nMLV+X87X1ZUbkip38GYsVs1wJTjbzQdoYOOWO2W4
	 scAajX7GxTstZuyIbeZwIMrRvU3c5UzEi3wXhA1+oFYNan/h17YTLpxeT2r3kfSBPOFj3
	 RiU37UZcBspHj0vmbSKlaPeYCR55bQu+tpaT8d8hGcWa7t/F4YGp3s1+MShLfUTGZAD6p
	 pIo6maPF0BtRGMMpdskh8Mh7zvl+886dZjdHOHBwS6kyXMxpr9/t5qdGwW8fodHpCIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PGN/una3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7905606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 18:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PGN/una3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09701F01825;
	Fri, 23 Oct 2026 18:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792780412;
	bh=awrU6kmNZ7/EfFFNlcK5Nsg3dVPD0GVQbxEuv/mLd+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PGN/una3f1bNDZa562LtRwOOSIeLoKqrBV6krsI9AuO0A0wIoCbhgrf3AlXN2o6RO
	 ZxDL51UYHPmgyN/sGZkfG3PVghSJ7RFZ2e/R4dNj5aUz1+6Zh+WBrwJDSPpYUO2Tp+
	 goVaaY/fcq6bNwbG+z+G3eHHHXTCUsLYC/9gBUFT9T0uZ3/I9KvYIhyjgi8uVHn64r
	 j/3YjCqZ6ZRPGoOhqfQgRc9g1npQgtBRQyeKcSZ9o3Ouzht1wAtCCJqIj368zX8imz
	 wRZ2Di+9Ot2KVf/G7OOwsryPi7NhZHVzZSzQCpSVXE8SvnUe85UMLoOaCowW2jgNtw
	 McUvYX1BYRPEQ==
Message-ID: <sashiko-outbox-183067@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaipeng Zeng" <kaipeng94@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023180513.36417-3-kaipeng94@gmail.com>
References: <20261023180513.36417-1-kaipeng94@gmail.com>
 <20261023180513.36417-3-kaipeng94@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 18:33:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: x1e78100-acer-sfa14-11: inverted backlight tur=
ns full on at 0
--

commit 66fa11a1de0967d5bc8b8fce1f271477c9fa4b31
Author: Kaipeng Zeng <kaipeng94@gmail.com>

arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)

This commit adds the device tree for the Acer Swift Go Pro AI (SFA14-11)
laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts b/arch/a=
rm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
> new file mode 100644
> index 0000000000000..5814cf3d000ce
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
> @@ -0,0 +1,1541 @@
[ ... ]
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +
> +		pwms =3D <&pm8550_pwm 3 5000000>;
> +
> +		brightness-levels =3D <254 225 200 175 150 125 100 75 65 60 55>;
> +		default-brightness-level =3D <8>;
> +
> +		power-supply =3D <&vreg_edp_bl>;
> +	};
[ ... ]
> +	vreg_edp_bl: regulator-edp-bl {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "VBL9";
> +		regulator-min-microvolt =3D <3600000>;
> +		regulator-max-microvolt =3D <3600000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};

[Severity: Medium]
Does setting the backlight brightness to 0, blanking the display, or
suspending the system cause this active-low backlight to jump to full
brightness instead of turning off?

The backlight node uses descending brightness-levels from 254 (off) down to
55 (maximum brightness) without PWM_POLARITY_INVERTED, has no enable-gpios,
and points power-supply at vreg_edp_bl, which has no GPIO and is marked
regulator-always-on.

In drivers/video/backlight/pwm_bl.c, pwm_backlight_update_status() only
consults pb->levels[brightness] via compute_duty_cycle() when brightness > =
0.
When brightness is 0, it ignores pb->levels[0] and instead disables the
regulator and sets duty_cycle =3D 0:

drivers/video/backlight/pwm_bl.c:pwm_backlight_update_status() {
	if (brightness > 0) {
		pwm_get_state(pb->pwm, &state);
		state.duty_cycle =3D compute_duty_cycle(pb, brightness, &state);
		state.enabled =3D true;
		pwm_apply_might_sleep(pb->pwm, &state);

		pwm_backlight_power_on(pb);
	} else {
		pwm_backlight_power_off(pb);

		pwm_get_state(pb->pwm, &state);
		state.duty_cycle =3D 0;
		state.enabled =3D !pb->power_supply && !pb->enable_gpio;
		pwm_apply_might_sleep(pb->pwm, &state);
	}
}

Because vreg_edp_bl is a GPIO-less fixed regulator with regulator-always-on,
regulator_disable() in pwm_backlight_power_off() does not cut power to the
backlight, while lpg_pwm_apply() in drivers/leds/rgb/leds-qcom-lpg.c disabl=
es
the PWM output channel and drives it to a constant logical 0 (0% duty cycle=
),
which corresponds to full brightness on an active-low backlight.

In addition, having descending values in brightness-levels causes unsigned
integer wraparound in pwm_backlight_is_linear():

drivers/video/backlight/pwm_bl.c:pwm_backlight_is_linear() {
	unsigned int nlevels =3D data->max_brightness + 1;
	unsigned int min_val =3D data->levels[0];
	unsigned int max_val =3D data->levels[nlevels - 1];
	unsigned int slope =3D (128 * (max_val - min_val)) / nlevels;
	unsigned int margin =3D (max_val - min_val) / 20; /* 5% */
	...
}

With min_val =3D 254 and max_val =3D 55, max_val - min_val wraps around in
unsigned arithmetic, inflating margin and misreporting the non-linear table
as BACKLIGHT_SCALE_LINEAR.

Note that pm8550_pwm in hamoa-pmics.dtsi uses #pwm-cells =3D <2>, which does
not accept a third PWM_POLARITY_INVERTED flag cell unless #pwm-cells is
overridden to <3> or the driver/DT handling is adjusted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023180513.3641=
7-1-kaipeng94@gmail.com?part=3D2
