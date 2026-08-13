Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EED9395243
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642919; cv=none; b=s88EaZ/Ng6jYdaSHboLXZZmVVjeQxUl46/OPo/lUleikws3r0mOXEzOFzvHus/Ga6DQxX0/tytM+zPxUWpY/BOH2NBjr90D6Ul+s4A6onByr6L6YF0tJdARC6ZyNyBWNM42M83hIKp1O0g5WSNVhT4NJ1C/VFiHlrNkJNdTV5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642919; c=relaxed/simple;
	bh=Pg3KynEwnwJT+7MtRmyDxV6NYxi9du83f95Fw9ah80U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n+YnyzqnWjiO6z49InxQoPNPi1UJqMvqPavDrpV02wmVd7acT+N6Tt5dYvw+i7SAr+1MIZWyAPY0E1+a3kCxfe38qdwWjnjJNqEFFeUhtNSJsIA6ealrR9Y2Ivau7dumrzSK63kSHqEMn/LCY5irfwBbFBC+jjGz44TXIZeJ1xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlGBNC4r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlGBNC4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6AE01F000E9;
	Thu, 13 Aug 2026 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786642918;
	bh=LQRXsDZ397x9GcT0Q8NmzRlGt7kNWUZ/RNKpeyNETpQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LlGBNC4rVMkvpp0t96ttvb/BWTVbgLB1QipI82PDbje09GttxJPv0hoGumcqK7LLo
	 hQSWpcyWjko2oEaCJcuHz2I8WwkI++aSkx8GgvQpk/GHDxnE6Mr2MsusFuLmpEzq4r
	 EOYFsu5FTFvEFGaXm4K1lVNeRlWLY7Jj2du07KSc7KypY2fecvxvNHIrLAgLUsEB5o
	 +cM8U0LbKIzrMsOuIZyPIMZ0vgR7eZ1o9M8K7RgY9s9WyCUjBvNU5D/+VfXdPsnNav
	 s3hH5wNOG63iLpYfW85M6fS/DdgbVPJI3EohyxeDNs1cEqjU3fp8ZNzJcYHyUiWcnD
	 4DbzTK/gP0XLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813-lvds-support-v2-2-6b11035e8ab0@oss.qualcomm.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
 <20260813-lvds-support-v2-2-6b11035e8ab0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 17:41:57 +0000
Message-Id: <20260813174157.A6AE01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing driver support for lontium,lt9211c compatible string
- [Medium] Missing driver support for boe,dv215fhm-r01 panel compatible str=
ing
--

--- Patch [2]: [PATCH v2 2/3] arm64: dts: qcom: monaco-evk: Add LVDS displa=
y overlay ---
commit 11e343dd5f10984f8afa017886ae2c19711c5c47
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Add LVDS display overlay

The commit adds a DTBO overlay for the Monaco-EVK mezzanine that supports
LVDS display output using a Lontium LT9211C bridge and a BOE DV215FHM-R01
panel.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dt=
so b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
> new file mode 100644
> index 0000000000000..96a53a294863b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
[ ... ]
> +&{/} {
> +	model =3D "Qualcomm Technologies, Inc. Monaco EVK LVDS";
> +
> +	panel_lvds: panel-lvds {
> +		compatible =3D "boe,dv215fhm-r01";

[Severity: Medium]
Will this compatible string fail to bind?

The commit message claims this panel is matched against the
panel-simple-lvds-dual-ports binding, which supplies size and timing
internally, but "boe,dv215fhm-r01" appears to be missing from the
panel-simple.c driver.=20

Since there is no generic fallback (like "panel-lvds") with inline timings
provided here, won't this leave the display unconfigured?

> +		power-supply =3D <&lcd_disp_bias>;
> +
> +		status =3D "okay";
[ ... ]
> +&i2c8 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&qup_i2c8_data_clk>;
> +
> +	status =3D "okay";
> +
> +	lt9211c_codec: lvds-bridge@2d {
> +		compatible =3D "lontium,lt9211c";

[Severity: Medium]
Is "lontium,lt9211c" supported by any existing driver?

It looks like this compatible string is absent from any driver's OF match
table, and there is no fallback provided (such as "lontium,lt9211").=20

Does this cause the I2C device instantiation for the bridge to fail?

> +		reg =3D <0x2d>;
> +		reset-gpios =3D <&tlmm 66 GPIO_ACTIVE_HIGH>;
> +		vccio-supply =3D <&vreg_l5a>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-lvds-suppo=
rt-v2-0-6b11035e8ab0@oss.qualcomm.com?part=3D2
