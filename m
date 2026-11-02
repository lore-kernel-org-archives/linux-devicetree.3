Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600396;
	b=MnZpCICw37gadDqbaJaW2MJZCxvNsGpNruSyCcRMP0kSt7Aak+vEZJh8GSPAZmQvUMp9
	 KjwrdhlqKjbuB0xdmykDmNqK8tAGiu8Cs80yA6eRFQmjicu4/71nKXKjtBJArQM3rS/48
	 k0ZFNXdfptY8ekZEHN1nQEAeX3Fl5RFVEjiSuhq7S3NjezvgDRV9zrZedpdIy16jc8vDo
	 PCdIIbs6g9PNL/tDiWxhhyhTx12gnzHcPfx5Nnca2uV3Z/woz80Ujr1fxi6cfWMM4rq4m
	 pvied49QjGoKZ1QtUWT4ZCHM9u/TnrhI/cKnjWNL0ffHh791TxMUL9kBzlPY4q7P0EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600396;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ob6vUEf/hO7i9kTlFIOxCsDT2lOSQdX4na8C6dHFkRM=;
	b=RaMtiYwTs3ocNLB1CfSFdadIANhySH4HbNdYaiSkNb8NfYxCuWu4yqJV6zY1g3jCuZD+
	 whZgMfT+DAsSPGzK9CL8A2Gfa9h99YSlNBSP5+LlE7E86qHnJ2DwyzCNTj4fZdGWK3evr
	 fYxvUogj4gj2DDKLeZjp3/iSwA4wFQ4spVoRtVTPft6lqIjRDp7I6LlffKNzLogauSvT5
	 RG1fP8SI2qNX6Jz8cn4jtAJBEJ8PsBQnBKCC/wClZx2IknTyQv2vnm3mpPpxqLcKn+pZR
	 qDjlgfdEmFUgqDPmKBvMLCSA9u2mYJe0T/CXuEgBa9tOAaS/YRL+VVKnjNNykcDD7AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EZ3Iw/tC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88338606A333
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZ3Iw/tC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB881F000C1;
	Mon,  2 Nov 2026 06:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793600396;
	bh=ob6vUEf/hO7i9kTlFIOxCsDT2lOSQdX4na8C6dHFkRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EZ3Iw/tCqsIekaQNsYuIRZKVX5hlo2M177TgZVruwiZSvenjVf6wNHJCpEMx6pDoQ
	 RqqqJRBzATqnCQiYThMJFrWcRnChy7x9g+cn+WRvspV3pdOURHHGGIaY9dtP/fmWNm
	 pmyMycMwSxs0Zs0cT3WQRT+w2ajps94DbVrQlJv/oiOGWAqWSyaygV459mPDBnZs4D
	 YbD2EJlXdNK9jG6CyEaT/tIz1O6LKMtp+F2dqpiBzhoYPIJj+e744yMekSrurjbnUH
	 BrdKqpTI6vZL1yb7+7FREz8PK4IoXoWC6of8U2iYigxXhpY87CljneXcDBgPWAnF2R
	 JmVUeN05grCiQ==
Message-ID: <sashiko-outbox-192949@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sm8750-lenovo-elden: describe
 the WL2868C regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102060458.461372-5-xiaqinghuan@mail.ustc.edu.cn>
References: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102060458.461372-5-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 06:19:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: undocumented camera/lens compatibles and unlin=
ked endpoint
- [Medium] arm64: dts: qcom: new sm8750-lenovo-elden board DT lacks boot in=
frastructure
- [Low] arm64: dts: qcom: mix of DT binding schema change and board DTS in =
one commit
--

commit 247a3e361ec98ef920ebf8c9ec415c99b8590dce
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators

This commit adds the lenovo,elden compatible to the Qualcomm ARM board
bindings and introduces a device tree for the Lenovo Legion Y700 Gen4
(SM8750) describing its board clocks, WL2868C camera PMIC regulators, and
rear camera sensor and lens.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862d..41d5e65c4eea5 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1168,6 +1168,7 @@ properties:
> =20
>        - items:
>            - enum:
> +              - lenovo,elden
>                - qcom,sm8750-mtp
>                - qcom,sm8750-qrd
>            - const: qcom,sm8750
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 1c86e7e98f55d..a18fea7bebaf7 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -406,6 +406,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8650-hdk-rear-camera-c=
ard.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8650-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8650-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8650-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8750-lenovo-elden.dtb

[Severity: Low]
Should the Documentation/devicetree/bindings/arm/qcom.yaml schema change be
split into a separate prerequisite patch with a dt-bindings: subject prefix
rather than combined in the same commit as the arch/arm64/boot/dts/qcom/
changes, per Documentation/devicetree/bindings/submitting-patches.rst?

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm6=
4/boot/dts/qcom/sm8750-lenovo-elden.dts
> new file mode 100644
> index 0000000000000..de186b447725d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> @@ -0,0 +1,175 @@
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

> +&cci0_i2c0 {
> +	clock-frequency =3D <400000>;
> +
> +	rear_lens: lens@c {
> +		compatible =3D "giantec,gt9764";
> +		reg =3D <0x0c>;
> +		vddio-supply =3D <&camera_ldo7>;
> +		vdd-supply =3D <&camera_ldo5>;
> +		giantec,aac-mode =3D <0x40>;
> +		giantec,aac-timing =3D <0x7c>;
> +		settling-time-us =3D <7000>;
> +	};
> +
> +	rear_camera: camera@56 {
> +		compatible =3D "samsung,s5kjns";
> +		reg =3D <0x56>;
> +		clocks =3D <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
> +		assigned-clocks =3D <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +		reset-gpios =3D <&tlmm 11 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&rear_camera_default>;
> +		dovdd-supply =3D <&camera_ldo7>;
> +		dvdd-supply =3D <&camera_ldo1>;
> +		avdd-supply =3D <&camera_ldo4>;
> +		lens-focus =3D <&rear_lens>;
> +		orientation =3D <1>;
> +		rotation =3D <90>;
> +
> +		port {
> +			rear_camera_ep: endpoint {
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <672000000>;
> +			};
> +		};
> +	};
> +};

[Severity: Medium]
As reported by Sashiko on v4 [1], does adding rear_lens (lens@c) and
rear_camera (camera@56) under &cci0_i2c0 in
arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts cause make dtbs_check and
scripts/checkpatch.pl regressions because their bindings are not in the tre=
e?

Specifically, rear_lens uses compatible =3D "giantec,gt9764" with properties
vddio-supply, giantec,aac-mode, giantec,aac-timing, and settling-time-us,
while Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml only
documents dongwoon,dw9768 and giantec,gt9769 with vin-supply, vdd-supply,
dongwoon,aac-mode, and dongwoon,aac-timing.

Similarly, rear_camera uses compatible =3D "samsung,s5kjns" with dovdd-supp=
ly,
dvdd-supply, and avdd-supply, which are not documented in any in-tree schema
(Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml only
documents samsung,s5kjn1 with vdda-supply, vddd-supply, vddio-supply, and
afvdd-supply).

In addition, rear_camera_ep defines a port endpoint without a remote-endpoi=
nt
property because sm8750.dtsi does not yet have a CAMSS or CSIPHY receiver
node. Should rear_lens and rear_camera be deferred until their DT bindings
and the SM8750 CAMSS receiver nodes are present in the tree, just as was do=
ne
for the front sensor?

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
> +
> +	pmic@2f {
> +		compatible =3D "willsemi,wl2868c";
> +		reg =3D <0x2f>;
> +		reset-gpios =3D <&tlmm 126 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&camera_pmic_default>;

[Severity: Medium]
As reported by Sashiko on v4 [2], is it expected to introduce
arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts as a new top-level board D=
TB
containing only clocks and camera I2C/PMIC nodes without the foundational
board infrastructure?

Unlike sm8750-mtp.dts and sm8750-qrd.dts, this file omits the SPMI PMICs,
RPMh regulators (&apps_rsc, including the vin12-supply, vin34-supply,
vin5-supply, and vin7-supply parent supplies for pmic@2f itself), chosen
stdout-path console, and boot storage peripherals, leaving a non-bootable
board DTB where the WL2868C regulator driver binds against dummy parent
supplies.

Also, in sm8750-lenovo-elden.dts, &qupv3_2 is placed before &i2c10 rather
than in alphabetical label order, and rear_lens places the standard property
settling-time-us after the vendor-specific giantec,aac-mode and
giantec,aac-timing properties. Should this patch wait for the base board
enablement series and follow the ordering rules in
Documentation/devicetree/bindings/dts-coding-style.rst?

[1] https://lore.kernel.org/r/9ef48d26aa4480b2dc1e20ad7af55f51aa22fec7.1793=
427041.git.xiaqinghuan@mail.ustc.edu.cn
[2] https://lore.kernel.org/r/9ef48d26aa4480b2dc1e20ad7af55f51aa22fec7.1793=
427041.git.xiaqinghuan@mail.ustc.edu.cn

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102060458.4613=
72-1-xiaqinghuan@mail.ustc.edu.cn?part=3D4
