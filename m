Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC7F1C69D
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788698274; cv=none; b=suj09eblf7Vc7VxBNgL0UxJkwlHMA7sFLFZ2Cs2uP5LzKC5E3nh2TapZwK2nM30ugK1Z+noznkVHppSHPDaU8eTC2WNBFgbagw0xq0RxmA7gLp48V0T2wHkajyxcy9ubjM/aaEg46Ay+i642hAhrElyCZkByyTEeueMJsoXnlVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788698274; c=relaxed/simple;
	bh=js80S5dnfeqnyq9Yfz7mpMJOiwBE9LtJqBqW5bosirI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H8OYwlGJcAfpNsCafhC9AIm/Sgl1rBGRWd7pOWdMJwXRDIqSjmHGDFORiyA7QM8Pd68hirWe/1pkH0QZr7y4tITSux661otvWkfIghakwIG/JCYygTM3C1iH4jJBmnd8tqpkEuBSXokHCLgmUg57XBmwKoaRc9mrBEAOACWu7nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjpiJ49S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjpiJ49S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E64D1F00A3A;
	Sun,  6 Sep 2026 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788698273;
	bh=MR4DmRartTQAqbcboPTrzJ/1HIDeFrauVeaZ4Ioa1/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CjpiJ49SnkP7x+srJ9fkuDGpM30vEhh18rUY5F6MdeaGJrgMr9OEHGZXrfCPplrq0
	 VtarcF7zcFtV/cxWIPmBCYvT3Ih+bvMyixNvXJfPa5Vo4LPiH1aO/HM/gCjAaYo1Ol
	 2iTkE/VXzjl98KPX1goR72XgbweBN0wPR66oekfysBe9xkkyfSFKznTgx+VlCWTZ2e
	 PZ66FYMGqUh6cZXnvnKzsE8NiJXf9zQNlbgeTJLNRTJvM/zmx5PdRwTgTCQQGal4p3
	 K+nG3MMzPZb/ba2MsDZTIAedl7YL1hj6iqHgDspzEE0t+99pdjAODYOv5q+RFogR6t
	 dTMdDmS2H5CMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 12:37:52 +0000
Message-Id: <20260906123753.0E64D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Missing deletion of the VADC die temperature channel for the rem=
oved pmc8380_6 PMIC.
- [Medium] Invalid attempt to delete a node using `/delete-property/ port@1=
;`.
- [Medium] Misnamed `perst-gpios` property in `&pcie3_port0` prevents PCIe3=
 reset.
- [Medium] Peripheral device pin controls (touchpad and keyboard interrupts=
) are incorrectly attached to the I2C bus controller.
--

commit 3876cbc8da2512403990a017c13a7d2eb531d04c
Author: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9

Add a common DTSI plus LCD and OLED board files for the Lenovo
IdeaPad Slim 5 14Q8X9 (machine type 83HL) on X1P42100.

> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-ideapad-slim5x.dtsi=
 b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-ideapad-slim5x.dtsi
> new file mode 100644
> index 0000000000000..1f9e048119221
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-ideapad-slim5x.dtsi
> @@ -0,0 +1,1695 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + * Copyright (c) 2024, Linaro Limited
> + * Copyright (c) 2026 Jens Glathe
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "purwa.dtsi"
> +#include "hamoa-pmics.dtsi"
> +
> +/delete-node/ &pmc8380_6;
> +/delete-node/ &pmc8380_6_thermal;

[Severity: Medium]
Should this block also delete the VADC die temperature channel
&pmc8380_6_die_temp? Since the PMIC is unpopulated, leaving
&pmc8380_6_die_temp active can cause the qcom-spmi-adc5 driver to attempt to
read the temperature of a physically absent PMIC.

[ ... ]

> +&i2c0 {
> +	clock-frequency =3D <400000>;
> +
> +	pinctrl-0 =3D <&qup_i2c0_data_clk>, <&tpad_default>, <&kybd_default>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";

[Severity: Medium]
Are the peripheral pinctrl states improperly assigned to the parent I2C bus
controller here? Attaching &tpad_default and &kybd_default to the bus
controller prevents the peripheral devices from independently managing their
interrupt and wake pins during suspend/resume.

[ ... ]

> +&pcie3_port0 {
> +	perst-gpios =3D <&tlmm 143 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 145 GPIO_ACTIVE_LOW>;
> +};

[Severity: Medium]
Should perst-gpios be named reset-gpios since it is placed on the port0 nod=
e?
The generic PCI port handling expects reset-gpios, while perst-gpios is only
parsed when placed on the host controller node (&pcie3). This leaves the
device in reset.

[ ... ]

> +&usb_1_ss2 {
> +	dr_mode =3D "host";
> +	maximum-speed =3D "high-speed";
> +	phys =3D <&usb_1_ss2_hsphy>;
> +	phy-names =3D "usb2-phy";
> +	qcom,select-utmi-as-pipe-clk;
> +	status =3D "okay";
> +	/delete-property/ port@1;
> +};

[Severity: Medium]
Should this use /delete-node/ port@1 instead of /delete-property/ port@1?
In device tree bindings, port@1 is a node representing a Type-C connection,
not a property, so /delete-property/ will leave the node intact in the final
DTB.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-x1-ideapad=
-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz?part=3D3
