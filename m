Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653072;
	b=UrpGVGPnQk4cKp3LnpDutgubhHiThCmg1Kvkmcl3np7lGo0xB8jucs+5e69KVaqObZSn
	 hBmBNnrGAz2Au3QZWoQSrPdcc3noYp3hGlw55uzcbIIgvnWf2K3f8EgZ/Ku/njhz1yGzu
	 KAwjX+4FPdEvVDruPwuME2KqsGhyRDxod55ApmRtTpcaE4uPnURWmiv8ASZO5ktMZxCGG
	 rq52snKKrBgLEV9pH6ZeSjha3KPDMePsrgYPJcZvLNWnJHxSEIV7HXren3k++ff1+tjRC
	 Pen88VApn4mIA4iwUkNm6NEKUvUU9VQ1BqW7q3loeWsHPL6OX7hUSo1m7uVKtVJVfxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653072;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wQDL8WIIp6PvD1L/Hye/EL9Q8fGh99rL7Ww2AkCXnDA=;
	b=sP7Pk8pg1BImJAdwtU/TmsiYELkLFMLtDJ7L2eeo7OvCOv9UEC3J70msw5XruXUkm3mL
	 TWvg4FRzcquABpwXx4mlvHOVSmGYk7BLo91ZgRJu5bkNOrWn2Xp22APJ7ZirKCiHD7FIo
	 JFXAUnRetH/MQs5PcxmFzGIkEvT94o79+cB4rXtU5wxZ/Pe22LHWd8z5iFJ4q8dz2eUs1
	 Qwf3XUCT7DKRpET7c5d/p3X+CIW3RcSiBvdetzwOffde0wNhbmAVixF672AAOyxGaje1M
	 jyoG3QNvWIv4WQA8bzvwHal1Ons4dU0V380P4njEeZIrKZaegqYHo4mVHMDDCpm1j3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2RJz0bA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE75606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2RJz0bA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759BE1F000C6;
	Thu, 26 Nov 2026 00:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653071;
	bh=wQDL8WIIp6PvD1L/Hye/EL9Q8fGh99rL7Ww2AkCXnDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G2RJz0bAzcq+oCYspFRJ0z1fsriCS7qhunGrlPMqD6OvYLzsSo9iYi2bSOy4oVSRY
	 8KECExrqtCkPDefxMqgdbNAa0jySmKIdj8F+HxsmKLLdG2rdNan2su5zrf3824h6/r
	 N8OvtU7ue1NHrOpibRFSGHJQgT0r6LK4T9OuMg9LJb62IIbeQAoe/Ey7o4XoTOzXMl
	 xZnO1Ci7DhgkGRN2bLp79hv5VAize7USNokhXH1rN0wo3cGqkkF6/aNX4EQLks5wfK
	 1ZUM0Tx3dQMGqOy5aypfhm/eGr/bfK5OIHIWpbXKtAQD5vDVXTn3GL5XPHNmTvtgLC
	 8ppjFyqVzAtCg==
Message-ID: <sashiko-outbox-234477@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: sm8750-lenovo-elden: add
 Lenovo Legion Y700 Gen4, a Qualcomm SM8750-based tablet
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126002157.1954799-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261126002157.1954799-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261126002157.1954799-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 00:31:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] arm64: dts: qcom: missing willsemi,wl2868c binding schema in
  target tree
- [Medium] arm64: dts: qcom: missing core boot and power nodes in
  sm8750-lenovo-elden.dts
- [Medium] arm64: dts: qcom: missing vin*-supply properties on pmic@2f
  for active LDOs
--

commit f756b32431d85db31160b09abd11c951962794a8
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750-lenovo-elden: add Lenovo Legion Y700 Gen4, a Qualc=
omm SM8750-based tablet

This commit adds the initial devicetree for the Qualcomm SM8750-based Lenovo
Legion Y700 Gen4 tablet, including board clocks, reserved GPIOs, and the
WL2868C camera PMIC on i2c10.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm6=
4/boot/dts/qcom/sm8750-lenovo-elden.dts
> new file mode 100644
> index 0000000000000..73f4452f46120
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "sm8750.dtsi"
> +
> +/ {
> +	model =3D "Lenovo Legion Y700 Gen4";
> +	compatible =3D "lenovo,elden", "qcom,sm8750";
> +	chassis-type =3D "tablet";

[ ... ]

> +	/*
> +	 * VSYS of the camera PMIC is the always-on system rail of the tablet.
> +	 * The SPMI PMICs that generate it are not described yet, so it is
> +	 * modelled as a fixed regulator without a voltage constraint.
> +	 */
> +	wl2868c_vsys: regulator-vsys {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "wl2868c_vsys";
> +		regulator-always-on;
> +	};
> +};

[Severity: Medium]
Can this board devicetree boot or operate meaningfully without the core sys=
tem
PMICs, RPMh regulators, console output, or boot peripherals?

Unlike the sibling SM8750 boards (sm8750-mtp.dts and sm8750-qrd.dts), this =
file
leaves all peripheral controllers disabled except i2c10, omits chosen
stdout-path, SPMI PMICs, RPMh regulators, storage, USB, and input devices,
models wl2868c_vsys as an unconstrained fixed regulator placeholder, and
defines camera_ldo1 through camera_ldo7 with no consumers in the devicetree.

[ ... ]

> +&i2c10 {
> +	status =3D "okay";
> +
> +	pmic@2f {
> +		compatible =3D "willsemi,wl2868c";
> +		reg =3D <0x2f>;

[Severity: Medium]
Does pmic@2f fail make dtbs_check in this tree because
Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml is not
present?

Building and validating sm8750-lenovo-elden.dtb reports a schema match fail=
ure
on compatible "willsemi,wl2868c" until the regulator binding lands in the t=
arget
branch.

> +		reset-gpios =3D <&tlmm 126 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&camera_pmic_default>;
> +		vsys-supply =3D <&wl2868c_vsys>;
> +
> +		regulators {
> +			/* Voltages include the offsets programmed by stock firmware. */
> +			camera_ldo1: ldo1 {
> +				regulator-name =3D "camera_ldo1";
> +				regulator-min-microvolt =3D <1128000>;
> +				regulator-max-microvolt =3D <1128000>;
> +			};

[Severity: Medium]
Should pmic@2f specify vin12-supply, vin34-supply, vin5-supply, and vin7-su=
pply
for the populated LDO regulators?

The willsemi,wl2868c binding and driver map LDO1/LDO2 to vin12-supply,
LDO3/LDO4 to vin34-supply, LDO5 to vin5-supply, and LDO7 to vin7-supply, and
only allow omitting an input supply when the board does not use the outputs=
 it
feeds.  Without those properties on pmic@2f, the regulator core cannot reso=
lve
or enable the parent rails feeding camera_ldo1 through camera_ldo5 and
camera_ldo7 and falls back to dummy supplies.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126002157.1954=
799-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
