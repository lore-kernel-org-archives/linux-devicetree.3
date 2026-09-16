Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB83948424E
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550642; cv=none; b=e6zYCqI8AROmu6DmNjxWWqot1FT8MzNZyy0dcfbFy+usJTKAXmQ2sw+E0498yu+vZIxjlePv2oS7PbO2ImQ7YmpDPWOl50Sd/0ovt+zURQvwovA5f110LoWMDr0UfnM9R6BTZ7YD0/fBMBbArNvMlUn38bs17lDla3DGzgE0ke8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550642; c=relaxed/simple;
	bh=pS/tgicH03XqLaNslX+BGWvqZxiu5+ORHezZ7RGsXlE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=At7q6bvAioajm4XYYB2GW3+THy0ePQ8ax/t8nJGFbr1s2lnkB9GkdKHIimPUt7F2RjCYlYZ5aKLEJe4tcgxP+tOL47BF+wWPtCYtcEM5C9t6IIuBUZZRA4FMrP5anIQL3aZIzg81PazFdgLUoyqVOfgDYbGpDvty9sh8FUlOTxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzJ7Sv/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzJ7Sv/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF721F000FF;
	Wed, 16 Sep 2026 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789550626;
	bh=gNZoWaHFW1go3sS19Kd/qH5XjsbUMWAO2WXSK04JdUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lzJ7Sv/8ulHHgioubYSAyd8Vg6uV5L7RwZHY7cNahMolxeT0bFRqbpUZfOvBJbiaX
	 CxQdvVsNArNVf1pXt/j+u3pGm4u7x2VMTDmEL4XujtAuFc5GXw14zyWdq4T9E/Wzsj
	 GSwezi+Lxaezp7ewTCRqtEx00CTg8L7uslE/XfNY629fvn1zYcxU26mx/ZDCv8jPUY
	 Uy5bReVrPVoXx8FIZHMrxDLHoxBdP9tF+8Lmo3G7TBD8UML08uNgtym5ve5d0v7Ujt
	 HCJwf592LF7JEzEdgRlrW5C4a3tLregnYXK95VEn7AnHB+PupivuJhq9rAobnSsU/Z
	 VFi1wsg3hHcwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916-shikra-dt-changes-v4-2-d5d5c3ffe070@oss.qualcomm.com>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-2-d5d5c3ffe070@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 09:23:45 +0000
Message-Id: <20260916092345.EAF721F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: backlight left on during screen blanking due to stati=
c pinctrl
--

commit 720635a18d3694cb65f6d9de1eaf9550b30b64e1
Author: Arpit Saini <arpit.saini@oss.qualcomm.com>

arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
   =20
Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqs-evk.dts
> index e62ba5aef71ff..a9067b710a224 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts

[ ... ]

> +&mdss_dsi0 {
> +	vdda-supply =3D <&pm4125_l5>;
> +
> +	status =3D "okay";
> +
> +	panel@0 {
> +		compatible =3D "dlc,dlc0697", "ilitek,ili7807s";
> +		reg =3D <0>;
> +
> +		reset-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply =3D <&pm4125_l15>;
> +		avdd-supply =3D <&vreg_disp_p>;
> +		avee-supply =3D <&vreg_disp_n>;
> +
> +		pinctrl-0 =3D <&panel_rst_n &panel_te_pin &panel_bl_en>;
> +		pinctrl-1 =3D <&panel_rst_n_suspend &panel_bl_en_suspend>;
> +		pinctrl-names =3D "default", "sleep";

[Severity: Medium]
Will this configuration leave the backlight on when the screen is blanked?

Since the default pinctrl state is applied unconditionally during device
probe, the backlight enable pin is statically driven high by the
panel_bl_en node.

The DRM framework does not transition a device's pinctrl to the sleep
state when a display is blanked at runtime, such as during a screen timeout.
It typically only engages sleep states during a full system suspend.

This means when the screen is logically blanked, the backlight will remain
actively driven high, even though the panel's data pipeline may be cut.

Could the backlight enable be modeled as a dynamic gpio-backlight device
node and linked to the panel via a backlight property, or handled via a
dedicated GPIO property in the panel driver, instead of bypassing DRM
runtime power management with static pinctrl?

[ ... ]

> +&tlmm {

[ ... ]

> +	panel_bl_en: panel-bl-en-state {
> +		pins =3D "gpio91";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
> +		pins =3D "gpio91";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +		output-low;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-shikra-dt-=
changes-v4-0-d5d5c3ffe070@oss.qualcomm.com?part=3D2
