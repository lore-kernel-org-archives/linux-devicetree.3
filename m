Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593205;
	b=19w1n8Tf9qXLrYaGOwemtOSuU+owB5gFxG52ab5YEdxH+bQrmYIHbyDqTIVvv/TMlQlC
	 7ovUpWKicZckA5NtxXnmFYJXMv9Rr/gTA5TT9VqIY+8r9c6W5nejvQF33uXrHjtdvJ8nF
	 63cI6gF3foQPo4Fz9rK9d3U0GXAhiVwbqWiCNG8TNh5+KcAyb/m1UaUFNfUADu4TU/Ccg
	 QzQ7bhHlO9yYLHRuyzc85Bv3d9eVoxM7xYOx66UrK6DwiJGwilJD1s2tYcrHilI7pjRcr
	 VVLRUs1TiGvnFlL3SrAvDhxza+e4z2sy25aRNyov6+7dPb/0/diXekDvB9U887gMZ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593205;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MAuajnr4yMvAbManenC21DjP/IwrRAc+3gtHtOQ46d8=;
	b=b98fxrW7R4tAgFm7DDgsshCJhlFl3089Ojcr87mkHrJeVqvEKOOuADD8CjFcL88CwGGf
	 D+Q9a7FTyBgdFm3WuPIL1CWdbMFjyTLLxsPqKvMfAIKWpUfbmDotBU4Bt0xuX8aj4DiIy
	 pHxF24nXM8zlYtmAQXAu0gpkwJ8xevQaEv67xJrb6lJD6Sn9eXIj0lUNgErKyeyI+dwt9
	 oyAzPDuqeoFeqK/b104o07idHf9GVP990zyWOXccNCd4ehnFYHKGgEAxz1hMjsKcRxjr1
	 96OOzJhu31Qg33aHSO6WUis/MeITUrIb8Xxvo0CrwyOtW2JnJLT7OCd22HXkBGnVZCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gJM/mxoL";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD4F606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gJM/mxoL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BA21F000C4;
	Wed, 21 Oct 2026 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593204;
	bh=MAuajnr4yMvAbManenC21DjP/IwrRAc+3gtHtOQ46d8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gJM/mxoLeRv1vY5OGPomhZXzL0fwH6FIGlkD4WhCUXW8FgTXHGJN15+Tj8OnRC7br
	 S33KFZwK0MWxItMY3pFZMwFbKnVYskvjcZ0ScIa2l4p5NXbDmtMvxEAyczdW4tz/9K
	 UJsYSZIpCeKWsHI+dYgjwwab5p8GpV3JRABgTbXANwG7MiQqM3z/unfUgZZ8KoJ3aB
	 mqNg1v/TxYo6304D6I9loAjUYyToCJPU9b1GWjYOX7l7HKZPMIkI0wyuBX2wdJH+vv
	 Up7kQtZwhj3ymB0t65dE2Ma9Es1sKEOJovdZlJ78/DR4E4X/rtrY9+AGqeg9SuH3pG
	 t7R6ir/Y3rSoA==
Message-ID: <sashiko-outbox-180380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01
 LVDS panel overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: vishnu.saini@oss.qualcomm.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-shikra_display_overlays-v1-3-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-3-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:33:23 +0000
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
- [High] arm64: dts: qcom: missing status okay on i2c3 node in lvds overlay
- [Medium] arm64: dts: qcom: missing backlight property in panel-lvds node
--

commit b4b78d829d507a91f08f278892b57ecc12f421d2
Author: Anand Tiwari <anand.tiwari@oss.qualcomm.com>

arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01 LVDS panel overlay

This commit adds a device tree overlay for shikra-iqs-evk to support the
auo,g133han01 panel connected through a ti,sn65dsi84 bridge on i2c3, while
disabling the default hdmi bridge and connector.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.d=
tso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
> new file mode 100644
> index 0000000000000..80b9dcc920612
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
> @@ -0,0 +1,127 @@

[ ... ]

> +&{/} {
> +	backlight {
> +		compatible =3D "gpio-backlight";
> +		gpios =3D <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +		pinctrl-0 =3D <&backlight_pwm>;
> +		pinctrl-names =3D "default";
> +	};
> +
> +	panel-lvds {
> +		compatible =3D "auo,g133han01";
> +		power-supply =3D <&vreg_lvds_3p3>;

[Severity: Medium]
In arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso, the
backlight node is defined without a phandle label, and panel-lvds does not
have a backlight property referencing it.

When panel_simple_probe() in drivers/gpu/drm/panel/panel-simple.c probes
auo,g133han01, it looks up the panel backlight via drm_panel_of_backlight():

	err =3D drm_panel_of_backlight(&panel->base);
	if (err) {
		dev_err_probe(dev, err, "Could not find backlight\n");
		goto disable_pm_runtime;
	}

Because the backlight property is missing on panel-lvds,
panel->base.backlight remains unset, so drm_panel_enable() and
drm_panel_disable() will not control the gpio-backlight device during
display blanking or system suspend and resume.

Should the backlight node be given a label and referenced from panel-lvds
with backlight =3D <&backlight>;?

[ ... ]

> +&i2c3 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	bridge@2c {
> +		compatible =3D "ti,sn65dsi84";
> +		reg =3D <0x2c>;

[Severity: High]
In arch/arm64/boot/dts/qcom/shikra.dtsi, i2c3 is disabled by default:

	i2c3: i2c@4a8c000 {
		compatible =3D "qcom,geni-i2c";
		...
		status =3D "disabled";
	};

Neither shikra-iqs-som.dtsi, shikra-evk.dtsi, nor shikra-iqs-evk.dts
enables i2c3. In
arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso, &i2c3
populates the bridge@2c child node and &mdss_dsi0_out is redirected to
&sn65dsi84_in, but &i2c3 does not set status =3D "okay";.

When this overlay is applied, i2c3 stays disabled, the ti,sn65dsi84 bridge
at bridge@2c is never instantiated, and
msm_dsi_modeset_init() -> drm_of_find_panel_or_bridge() defers probe
indefinitely waiting for sn65dsi84_in.

Does &i2c3 need status =3D "okay"; here so that the parent controller and
bridge@2c can probe?

[ ... ]

> +&mdss_dsi0_out {
> +	remote-endpoint =3D <&sn65dsi84_in>;
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-shikra_dis=
play_overlays-v1-0-adaea735999f@oss.qualcomm.com?part=3D3
