Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517152;
	b=jq+M+Dcb+hnt4taPnl7n0FeSQfAOYLHhYWNmxYsFjEW9+1ITKEush1OB7R+POFc0mU/X
	 ntNdC2Lkfwrgh/OFzSpTjW0rCYJGhzIwUOyWyDl5keIU8YnmaOCR+oD4c0G13/gauX6TG
	 f3C5h+bGEeQYb9fYukOCAFFBjQPbBxsFi7M7Gz8Eg6tJp5OC9Ntp+fyQVtxI+ARJFfhSZ
	 MOi0GYvUv7U2nsG6m8Yvs3rZq0wjMd3+snwUUlH8GpjOWYECGFU/hXSFDwpeG0BHUcJKI
	 CIyXnRczwEUphZGLeK87mQPJmXWhpZm6dSU0GpNvZbGhGGZEvvIkeV0VSmKYeG9QJZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517152;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FXp8Z0G2V0kvTM4Mj2HvVxMO1Z6sLcgFfwPzODn/Tic=;
	b=5eXhLCmn8ZxsgFh+jBtvc61KFxlNeYA4YCTOSAkCuiwxrUdwap7SaAcpt6BOYUtqPe5b
	 FX0tGHysKphosU5xBREppwBpCFkRly+cuB8JFkFFWwDe8lZ8j1Fy0HPUG3yAQQATytEi5
	 u4eOq30n2cS+8RnUDTgQ46F5wLoO6BR8w667rZAhWlWQoGwIvkR5U+EzWOal4U9Y+ux1m
	 /X0dmeWld4W1nV7tw6iYVRBH5BTQQX5vaLJACAgrS1v+6/wb4XOJIOBXHM6S9JWkyPs7r
	 SY5u42top7J803VPkY/ptCm3yyAbPKAsae+ZWSCLkLKCcYI2GAae6LSHnRSJjGXMh1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VkzNCjbc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ED2606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VkzNCjbc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4271F000C4;
	Tue, 24 Nov 2026 10:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795517151;
	bh=FXp8Z0G2V0kvTM4Mj2HvVxMO1Z6sLcgFfwPzODn/Tic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VkzNCjbcNw5GP1PzDcEXKSGirwomD55lmA5v5EUOYvHYnvuaX9Jdja5NUnBi3oYoF
	 KLjxO9lQimj/ElZthaNDq/ASQIHMAFCD0sSh8zy+V4Mq8RUJJMfPxSrUW4wJ6JrovB
	 76A57tiHmboY/EEzhN03Gh2L7fV8HbpmnFEKmIUid9Q8Pqw6hFHmO0UEMl0EqSxSHj
	 iVz2SvYiwQSDO34sTrv8vbBBpjC2Y0k7KnMpqmN/oT0bZ1J1uxtIiVln7cVnO83ApL
	 YbUhuZ0mXMLNzEgpKrjFkmvtWvHlVn+MUpE/KkC9X5FiEvcRiLAmjXcalONwIoxuWE
	 qFFBcT9KXDy7w==
Message-ID: <sashiko-outbox-230979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: add Monaco Draco AC SoM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faruque Ansari" <faruque.ansari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-monaco-draco-v2-2-3ee3b2375f16@oss.qualcomm.com>
References: <20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com>
 <20261123-monaco-draco-v2-2-3ee3b2375f16@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:45:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] arm64: dts: qcom: invalid supply properties on pcie0_phy and
  pcie1_phy
- [Low] arm64: dts: qcom: non-generic deprecated node name vreg-s2s
- [Low] arm64: dts: qcom: unused qcom,q6afe.h include in
  monaco-draco-ac-som.dtsi
- [Low] arm64: dts: qcom: carrier-specific nodes and incomplete usb_2 in
  Draco SoM
--

commit d1bc5b3f248fc85ab6c6aeca044fd1cc52fd4aa5
Author: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

arm64: dts: qcom: add Monaco Draco AC SoM

This commit adds the device tree include for the QCS8300-based Monaco Draco
AC SoM, configuring RPMH regulators, remoteprocs, storage, UART, USB, PCIe
PHYs, and the Adreno 623 GPU.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-ac-som.dtsi b/arch/arm=
64/boot/dts/qcom/monaco-draco-ac-som.dtsi
> new file mode 100644
> index 0000000000000..85ca83ecfc9e6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-draco-ac-som.dtsi
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>

[Severity: Low]
Is the dt-bindings/sound/qcom,q6afe.h include needed here?  This file defin=
es
no sound nodes or audio macros, and monaco.dtsi already includes
dt-bindings/sound/qcom,q6dsp-lpass-ports.h.

> +
> +#include "monaco.dtsi"
> +#include "monaco-pmics.dtsi"
> +
> +/ {
> +	aliases {
> +		serial0 =3D &uart7;
> +		serial2 =3D &uart6;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	/* This comes from a PMIC handled within the SAIL domain */
> +	vreg_s2s: vreg-s2s {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg_s2s";

[Severity: Low]
Should vreg_s2s use a generic regulator-s2s node name instead of vreg-s2s?
Documentation/devicetree/bindings/regulator/fixed-regulator.yaml marks node
names that do not match the regulator-* pattern as deprecated.

[ ... ]

> +&pcie0_phy {
> +	vdda-phy-supply =3D <&vreg_l6a>;
> +	vdda-pll-supply =3D <&vreg_l5a>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply =3D <&vreg_l6a>;
> +	vdda-pll-supply =3D <&vreg_l5a>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Should vdda-qref-supply and vdda-refgen-supply be dropped from pcie0_phy and
pcie1_phy?

In monaco.dtsi, pcie0_phy uses qcom,qcs8300-qmp-gen4x2-pcie-phy and pcie1_p=
hy
uses qcom,sa8775p-qmp-gen4x4-pcie-phy.  Both bindings are defined in
Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml, which
does not permit vdda-refgen-supply and causes dtbs_check to fail on boards
including this SoM dtsi.  In drivers/phy/qualcomm/phy-qcom-qmp-pcie.c, both
qcs8300_qmp_gen4x2_pciephy_cfg and sa8775p_qmp_gen4x4_pciephy_cfg use
qmp_phy_vreg_l, which only requests vdda-phy and vdda-pll, so neither
vdda-qref-supply nor vdda-refgen-supply is consumed at runtime.

[ ... ]

> +&uart6 {
> +	status =3D "okay";
> +};
> +
> +&uart7 {
> +	status =3D "okay";
> +};

[ ... ]

> +&usb_1 {
> +	dr_mode =3D "peripheral";
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +	vdda18-supply =3D <&vreg_l7c>;
> +	vdda33-supply =3D <&vreg_l9a>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l7a>;
> +	vdda-pll-supply =3D <&vreg_l5a>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_2 {
> +	status =3D "okay";
> +};

[Severity: Low]
Is usb_2 intentionally enabled in the SoM dtsi without a dr_mode or connect=
or
endpoint, and should the carrier-specific UART and USB controller settings
live in the carrier board dts instead?

In monaco.dtsi, usb_2 defines usb-role-switch and an unlinked usb_2_dwc3_hs
port endpoint.  Enabling usb_2 here without setting dr_mode or linking
usb_2_dwc3_hs to a connector leaves dwc3_setup_role_switch() defaulting to
device mode with no role-switch provider attached and without the VBUS
override that dwc3_qcom_probe() configures when dr_mode is explicitly
peripheral.  In addition, aliases, chosen stdout-path, uart6, uart7, usb_1
dr_mode, and usb_2 enablement depend on how the carrier board routes those
interfaces, whereas sibling monaco-monza-som.dtsi keeps only the on-SoM USB
PHY supply hookups in the SoM dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-monaco-dra=
co-v2-0-3ee3b2375f16@oss.qualcomm.com?part=3D2
