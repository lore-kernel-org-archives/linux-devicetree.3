Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640432;
	b=FHB80NmzWEOZgQf/YpN0fKJ/+oBlEpR6UJl31VoQts5M3WoQxWT2KSGg4/8GM28iZ3Ps
	 BuzF9CUxf6ABB00Sr85Sdj7FbrDWgyVgig2zD7w1LUwHfBSMS6tgRNosuSvsIkfySL4UI
	 Y/0Pl0IGmvlPDmaK8LEBsedGTr0yz8243uvY/Px+5DWnbdfUhlditAtiPQ9ABHqR6KO+7
	 p/wiixxbCmu/L5lGNGaI2PGszJiaa0fzEsmZg42P/g+gKupJJvYjwE2zI00qC2F687MZC
	 vKTNNEsCALzNEjlgprWu6SBgebLkfQcFrYDYKP277Ba1G9YUlXJxzyqgA0el9qpmKrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640432;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qlCgdw1FzWVxqLEptyoj+bZOGe9LHNmAy3XOjufRRVY=;
	b=q4n3LG1Jbjo018drpZJ7/ToTsx3vlV66qQbCNpRKWg+EEHIuaUPxjR5Z7F3a12gpi2yO
	 OqHqJ4HNexf/jEHlCk9CLNfxZcPTb3nlT7xsZDG2BnQcD4WFZV+K1Vv0riizd4OqoptXu
	 sX7nMIHmbAsMbjJZt3S3GTE8OJNijA2xw4VHUDM6wf7TZWtjpLNhraxC02ywreIZNh7FF
	 a40LqrMj2OeEdJbI6PjxKQa+P5/b9gNxK4dIKogxjMlHpLHqjHftiHfkXwDR/y4aTA1Dk
	 dFW+OnEFVgBzfUmQ+1QCHWwWPsSqraYhRB8kqa/h63MhEzB3xihQijE0g8+rV/5furg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODtf7BCP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8560606D805
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODtf7BCP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A381F00A16;
	Mon,  2 Nov 2026 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793640431;
	bh=qlCgdw1FzWVxqLEptyoj+bZOGe9LHNmAy3XOjufRRVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ODtf7BCPfv6nk1LR1MeyoDw9FDA065Ak1zdmKwRQ71mFb+5Xr9+VnNPVr/il8dpRx
	 jhz+rUsrXKqtUYVRcBZDOiggRROqTwoyUVWLwao/KLR61wjh3ZvACnW8mGtscuFAe2
	 h+YYXFXuzUyjQhfjr4U5vd0GwCK1lODNtg4o+HipFwhzToW8mirxzQbwt0mh1GBBlH
	 848KmKt9RH0cJPCUOUGVC82NBW1JpEfsiuAA8n+Q/7BpG+nfWqKNeiOzp2T5riFP6B
	 sDWQgFglDCQ2PxxwKd96rYIqa39uXUKvgpo5GJugUToGmqnVEbOlBc7o+AD4hAksmi
	 J8gH0r5q0cF/w==
Message-ID: <sashiko-outbox-193833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: rockchip: fix USB OTG power on
 Photonicat in battery mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102171838.2958552-6-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
 <20261102171838.2958552-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:27:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: rockchip: unequal min/max microvolt on fixed regulator=
 vbat
- [Medium] arm64: dts: rockchip: vcc5v0_usb30_otg0 bypasses unused regulato=
r_5v_out
--

commit cf017fdefcec389cc0bb2c84974cfce9207e4762
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode

This commit adds fixed regulator nodes for the VBAT supply, the 5V boost
converter, and the 5V_OUT rail on the Ariaboard Photonicat RK3568, and
updates the USB OTG VBUS regulator input supply so USB host power works on
battery.

Link: https://github.com/immortalwrt/immortalwrt/issues/1534
Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonica=
t_rk3568_sch_20221116.pdf (Page 15,18)

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-photonicat.dts
> index e69f5e28e9e64..4d362f665031c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> @@ -51,6 +51,47 @@ hdmi_con_in: endpoint {
>  		};
>  	};
> =20
> +	regulator_5v_boost: regulator-5v-boost {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&boost_en>;
> +		regulator-name =3D "5v_boost";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vbat>;
> +	};
> +
> +	/*
> +	 * 5V_OUT is the OR-ed combination of the VBAT boost (via D5002)
> +	 * and VCCIN_5V (via D16).
> +	 * It has no enable pin of its own.
> +	 * Model it as a fixed regulator depending on the boost converter,
> +	 * so that VBAT is boosted when running on battery.
> +	 *
> +	 * 5V_OUT supplies:
> +	 * - VCC5V0_USB30_OTG0 (USB VBUS via U12 load switch)
> +	 * - VCC5V_HDMI (HDMI 5V via D5000)
> +	 * - J53 expansion header (Pin 1)
> +	 */
> +	regulator_5v_out: regulator-5v-out {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "5v_out";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&regulator_5v_boost>;
> +	};
> +
> +	vbat: regulator-vbat {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vbat";
> +		regulator-min-microvolt =3D <3400000>;
> +		regulator-max-microvolt =3D <4200000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};

[Severity: High]
Will the vbat regulator fail to probe here because regulator-min-microvolt
and regulator-max-microvolt do not match?

In drivers/regulator/fixed.c, reg_fixed_voltage_probe() calls
of_get_fixed_voltage_config(), which requires min_uV and max_uV to be equal
for a fixed regulator:

	if (init_data->constraints.min_uV =3D=3D init_data->constraints.max_uV) {
		config->microvolts =3D init_data->constraints.min_uV;
	} else {
		dev_err(dev,
			 "Fixed regulator specified with variable voltages\n");
		return ERR_PTR(-EINVAL);
	}

When vbat fails with -EINVAL, regulator_resolve_supply() ->
of_regulator_dev_lookup() sees the regulator-vbat node present in the Device
Tree without a registered regulator device and permanently returns
-EPROBE_DEFER when resolving vin-supply =3D <&vbat> on regulator_5v_boost,
which cascades to vcc5v0_usb30_otg0 and the USB2 OTG PHYs (usb2phy0_otg and
usb2phy1_otg).

> +
>  	vcc_1v8: regulator-vcc-1v8 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_1v8";
> @@ -140,7 +181,7 @@ vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
>  		regulator-name =3D "vcc5v0_usb30_otg0";
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
> -		vin-supply =3D <&vccin_5v>;
> +		vin-supply =3D <&regulator_5v_boost>;
>  	};

[Severity: Medium]
Should vcc5v0_usb30_otg0 reference <&regulator_5v_out> for its vin-supply
instead of <&regulator_5v_boost>, or is regulator_5v_out unnecessary?

Both the commit message and the comment above regulator_5v_out state that
5V_OUT supplies vcc5v0_usb30_otg0, but vcc5v0_usb30_otg0 points directly to
regulator_5v_boost, leaving regulator_5v_out without any consumers in
rk3568-photonicat.dts. (The commit message also refers to the nodes as
v5v_boost and v5v_out rather than regulator_5v_boost and regulator_5v_out.)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102171838.2958=
552-1-coiaprant@gmail.com?part=3D5
