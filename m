Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893647;
	b=ClrVzKs5oxe9Xe0CFg7QqCdhqpfZJkxHoeIP+VTxdA430x1jndNCHSRQbW1ddbWdNmMw
	 Os+77fOZArzDSpq+xJ5aZxTnUSKTqX3PgQNaVN7ByumkLa9c6RQZ2WnF2vG2/tHZopmZo
	 OaqbfWg/hXb2vHa6EQrPzKADZVuw/U29jljW9KQ1O1XuvfY+zavGLdJQlzPaN3m3MXDtc
	 QQApZA3VDFXP1YBGTBnBqOtYM+Ba+KU5Dx03NvQPUtQmPnegila1P9JEx9faJsHAQlHt7
	 DFt3iLo8KtAD3L90MIsN6mQTTQo6mdDHc1CIiOBg2Htl3ajVerj5AqiTR517bJ1jDvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893647;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k6zzrnTBiQlFJzi0A5bMRklqdT38Fw3HcXLjgOgdN54=;
	b=zYfi8unCA7IXhJOYTdNB5IsKFiaTbE+rzZS2MegX9Th1BnFJ07s68Hepadv4jXCKM1aA
	 ZhJuIDKBnu+iDj+uhJkYXh+4luoziYKLROEd7LAjl0Hfvdz7P3cUPqkDHAaZbzkAgFnf7
	 bBHlKiAhjJdpSUKKwAjLtMgah9XvGY3M5R+3KtQVogER2bxs9CO9MFVQ/wcwzkeqYyL2D
	 1K2yPi67ns8M7ZWDHe2CjhZXBVpO1HRiX/oghovH3I124SP8MTpwnFMySvqfEJ34U68Jh
	 akHQ2/bSr3U7/Ht3IMnzqTlMtp+GK/BQFKocS2d1/ewtdIQ3NZb6ddGsRiX1iIhTv3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7lR7Wmt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB03606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7lR7Wmt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC921F000C4;
	Tue, 17 Nov 2026 05:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794893647;
	bh=k6zzrnTBiQlFJzi0A5bMRklqdT38Fw3HcXLjgOgdN54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G7lR7Wmt2TDxfYxDgNi+Z2dbDTqrkoX1sbJbyq+saXGPQVbN5STlNKQLhBYrMsv5b
	 oudYlDset6FS6WTkohU4jl+YucgS+s0ar8a57UOiCnvrr9gZ0q9n5aKOOYUQlT73Z0
	 tXrDohnMp5EoZcIP/yB3DggOZbfwX3ZYZeDJDGQf/JO62Y1pMGv02ygFvjLGNrT2Py
	 IgyYSQWg3qt48iO5mKMSFZkayaJJj8i5xNLo6Q+MXL1w/CxFRL7FYWIub1tcmGz1DJ
	 YaaJl1NsW16MDAvr8JoCIhKueHbpeTWBn6bRi/aHjg29ScZnruiLZp3ZN9bs05Axxk
	 WCTXtUpaw8/bg==
Message-ID: <sashiko-outbox-218214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7] arm64: dts: qcom: sm8750-lenovo-elden: add Lenovo
 Legion Y700 Gen4, a Qualcomm SM8750-based tablet
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117052029.31900-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052029.31900-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 05:34:06 +0000
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
- [Medium] arm64: dts: qcom: undocumented lenovo,elden board compatible
  in sm8750-lenovo-elden.dts
- [Medium] arm64: dts: qcom: undocumented willsemi,wl2868c compatible
  and missing driver for pmic@2f
- [Medium] arm64: dts: qcom: sm8750-lenovo-elden.dts lacks core boot
  infrastructure and regulator consumers
- [Low] arm64: dts: qcom: non-alphabetical phandle node ordering in
  sm8750-lenovo-elden.dts
--

commit a64b24438a9a6e099bff47eb441ee5126bd53503
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750-lenovo-elden: add Lenovo Legion Y700 Gen4, a Qualc=
omm SM8750-based tablet

This commit adds a devicetree for the Qualcomm SM8750-based Lenovo Legion
Y700 Gen4 tablet with board clocks, reserved GPIOs, and a Willsemi WL2868C
camera PMIC on i2c10.

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

[Severity: Medium]
Is the "lenovo,elden" board compatible documented in
Documentation/devicetree/bindings/arm/qcom.yaml?  The qcom,sm8750 board
entry currently lists only qcom,sm8750-mtp and qcom,sm8750-qrd, so make
dtbs_check fails schema validation on sm8750-lenovo-elden.dtb.

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
> +
> +&gpi_dma2 {
> +	status =3D "okay";
> +};
> +
> +&qupv3_2 {
> +	status =3D "okay";
> +};
> +
> +&i2c10 {
> +	status =3D "okay";

[Severity: Low]
This isn't a bug, but phandle node overrides in Qualcomm board devicetrees
are kept in alphabetical order, so &i2c10 should come before &qupv3_2.

> +
> +	pmic@2f {
> +		compatible =3D "willsemi,wl2868c";
> +		reg =3D <0x2f>;
> +		reset-gpios =3D <&tlmm 126 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&camera_pmic_default>;
> +		vsys-supply =3D <&wl2868c_vsys>;

[Severity: Medium]
Is there a devicetree binding schema or in-tree driver for
"willsemi,wl2868c"?  Without a binding under
Documentation/devicetree/bindings/, make dtbs_check fails on pmic@2f, and
without a matching driver in the tree, the PMIC and its child regulators
never bind at runtime.

> +
> +		regulators {
> +			/* Voltages include the offsets programmed by stock firmware. */
> +			camera_ldo1: ldo1 {
> +				regulator-name =3D "camera_ldo1";
> +				regulator-min-microvolt =3D <1128000>;
> +				regulator-max-microvolt =3D <1128000>;
> +			};
> +
> +			camera_ldo2: ldo2 {
> +				regulator-name =3D "camera_ldo2";
> +				regulator-min-microvolt =3D <1288000>;
> +				regulator-max-microvolt =3D <1288000>;
> +			};
> +
> +			camera_ldo3: ldo3 {
> +				regulator-name =3D "camera_ldo3";
> +				regulator-min-microvolt =3D <2816000>;
> +				regulator-max-microvolt =3D <2816000>;
> +			};
> +
> +			camera_ldo4: ldo4 {
> +				regulator-name =3D "camera_ldo4";
> +				regulator-min-microvolt =3D <2824000>;
> +				regulator-max-microvolt =3D <2824000>;
> +			};
> +
> +			camera_ldo5: ldo5 {
> +				regulator-name =3D "camera_ldo5";
> +				regulator-min-microvolt =3D <2808000>;
> +				regulator-max-microvolt =3D <2808000>;
> +			};
> +
> +			/* LDO6 is not wired out on this board. */
> +			camera_ldo7: ldo7 {
> +				regulator-name =3D "camera_ldo7";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +			};
> +		};
> +	};
> +};

[Severity: Medium]
Can sm8750-lenovo-elden.dts boot to a usable system without core platform
infrastructure such as the SPMI PMICs, apps_rsc RPMh regulators, console, or
storage?  As added, the board devicetree omits the base platform nodes need=
ed
to boot and instead only describes the camera PMIC, feeding its vsys-supply
from a voltage-less placeholder fixed regulator (wl2868c_vsys) while leaving
camera_ldo1 through camera_ldo7 without any consumers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117052029.3190=
0-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
