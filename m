Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793430377;
	b=oWASfrFuQf98JTUOYpElxD855NR1GuDzF+za0xuoca//fPK/aq6wEcdzlqvHGZy2a+nv
	 1Mf8QMnyk82LR/4s7A9vcIrnDdWEUrmIaHw61gjIYWY/nzQsNlqslx44rNbcBN2L9QK6R
	 zAM1UlLclm0whwvw0GadV2QKyOjM68nhpmWqt+krs1/ZYLfKlky1gpzIEAfX9SNpHr4Rs
	 M3GlUcve6bgVeZV1xaxXwFWIetv8ZxInMkI1YJngBUX2biB/7Xwanjaa1oomqX6rd9APc
	 V/P6o4ogfgcaB4CR0DNXCDRFWAecm/Ook82tMU6T+kiywJc4Pz7g6qv9OldKwQdbR7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430377;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fvYMMKKU+QWfQlU8B2zM6k5ZClI0wiFAPL+PfCSoiJ4=;
	b=CbhOeKpfM169gIzHdnBcR+oiQKm4RC3N8VaJJJKSHjyCeHeXajujdL0BrxMPWWeTtNZa
	 rRhZyXvF0qlsamlJV6AJo3LaQZ5Ysu0MBdp9uQASZfQ/CjdfdrFK/1H6gVGoxu4Lybo0y
	 i/eM1dw5Ieq4DoUp2beD62xJyRaC6BFDVB4FjDJllkDv8xPuoSBvSWK9HEkpDwKRaDMLJ
	 QkYMuh5K3H0Mn6X5LFNZRrefeqpdjupOkea5+sn486DhnZGzeLTR6xHKUlgVFcMaopCfi
	 OffAj6XMxqw4TnJQn9LqfYhSuFo+JDmLs5qlpQ/Tfovnrv44kA30tFA+udzObF4+X8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GOgHHFP4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B9B606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GOgHHFP4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA781F000C1;
	Sat, 31 Oct 2026 07:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793430376;
	bh=fvYMMKKU+QWfQlU8B2zM6k5ZClI0wiFAPL+PfCSoiJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GOgHHFP4PMH7t36HywwAhS0BhgP1tESYdz5S84GNw37RH+UUk/dztf6+tk7XAKwhk
	 UCF2XwtdJtW3Uxp0e8RyFgod7sq6mEbQjc3DG4TXS+dHIXaPUZ1mfIgb+CPtArN7zo
	 56xKXj0c4ya9I9GUs94QuDcBFsnlJidpiaf2kGBGzeR1/sqZQ7kzq8pX17Uupnd6Rb
	 m2gK8M67G/k9vUrIOTGOxT2uY29f/j5TkjsRiIRgaI54tRQ58jxdZzN1Kl7tQTLhK3
	 SekzosrcJtHOyVfOrTdhj0wKhlwLBlPHYqJsV7uvuoFnQqUu3wbjELZ2OD0o2xCHRs
	 XIiEX4x6gEVsQ==
Message-ID: <sashiko-outbox-191792@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sm8750-lenovo-elden: describe
 the WL2868C regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <9ef48d26aa4480b2dc1e20ad7af55f51aa22fec7.1793427041.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
 <9ef48d26aa4480b2dc1e20ad7af55f51aa22fec7.1793427041.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 07:06:16 +0000
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
- [Medium] arm64: dts: qcom: sm8750 cci0_i2c1 and cci1_i2c1 disabled despit=
e bus 1 pinctrl
--

commit 22e373234557a88250e1a13f2288188945ab03f9
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators

This commit introduces the sm8750-lenovo-elden devicetree for the Lenovo
Legion Tab (TB322FC), describing its board clocks, the WL2868C camera PMIC
regulators on i2c10, and the rear camera sensor and lens on cci0_i2c0.

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
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8750-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8750-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D talos-evk.dtb
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

[Severity: Medium]
The commit subject describes this patch as adding the WL2868C regulators to
sm8750-lenovo-elden, but the patch creates arch/arm64/boot/dts/qcom/sm8750-=
lenovo-elden.dts
from scratch and adds sm8750-lenovo-elden.dtb to arch/arm64/boot/dts/qcom/M=
akefile.

Unlike the existing sm8750-mtp.dts and sm8750-qrd.dts board files, this new
top-level board devicetree only defines the fixed board clocks, cci0,
gpi_dma2/qupv3_2/i2c10, and tlmm camera pins. It does not include any SPMI
PMICs (such as sm8750-pmics.dtsi), RPMh regulators under apps_rsc (including
the parent VIN supplies for the WL2868C PMIC), a chosen stdout-path console,
or any boot/storage peripherals.

Should this patch series include the base board infrastructure needed to bo=
ot
the Lenovo Legion Y700 Gen4, or is a base board patch missing from the seri=
es?

[ ... ]

> +&cci0 {
> +	status =3D "okay";
> +};

[Severity: Medium]
When cci0 is enabled here, cci_probe() in drivers/i2c/busses/i2c-qcom-cci.c
applies the default pinctrl state from arch/arm64/boot/dts/qcom/sm8750.dtsi:

	pinctrl-0 =3D <&cci0_0_default &cci0_1_default>;
	pinctrl-1 =3D <&cci0_0_sleep &cci0_1_sleep>;

which claims and muxes the pins for both bus 0 (gpio113/114) and bus 1
(gpio115/116).

However, commit b3f712e6e2f5 ("arm64: dts: qcom: sm8750: describe two of the
three CCI I2C controllers") in this series defines cci0_i2c1 and cci1_i2c1 =
in
arch/arm64/boot/dts/qcom/sm8750.dtsi with status =3D "disabled":

	cci0_i2c1: i2c-bus@1 {
		status =3D "disabled";
		reg =3D <1>;
		clock-frequency =3D <400000>;
		#address-cells =3D <1>;
		#size-cells =3D <0>;
	};

even though its commit message states that both buses are left available as=
 on
sm8550 and sm8650. Because cci_probe() iterates over child nodes with
for_each_available_child_of_node_scoped(), any board populating cci0_i2c1 or
cci1_i2c1 without also overriding status =3D "okay" on the i2c-bus@1 node w=
ill
have bus 1 skipped while its pins are still muxed by the parent CCI node.

Should status =3D "disabled" be dropped from cci0_i2c1 and cci1_i2c1 in
sm8750.dtsi to match sm8550.dtsi, sm8650.dtsi, and the default pinctrl
configuration?

> +
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
The commit message notes that the front camera node was deferred because its
binding is still pending, but rear_lens (lens@c) and rear_camera (camera@56)
under cci0_i2c0 also use compatibles and properties that are not documented
in Documentation/devicetree/bindings/:

1. In rear_lens, compatible =3D "giantec,gt9764" along with vddio-supply,
   giantec,aac-mode, giantec,aac-timing, and settling-time-us are not
   documented in any binding schema. Documentation/devicetree/bindings/medi=
a/i2c/dongwoon,dw9768.yaml
   only documents dongwoon,dw9768 and giantec,gt9769 with vin-supply,
   vdd-supply, dongwoon,aac-mode, and dongwoon,aac-timing.

2. In rear_camera, compatible =3D "samsung,s5kjns" along with dovdd-supply,
   dvdd-supply, and avdd-supply are not documented in any binding schema.
   Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml only
   documents samsung,s5kjn1 with vdda-supply, vddd-supply, vddio-supply,
   and afvdd-supply.

3. In rear_camera_ep, the endpoint defines data-lanes and link-frequencies
   without a remote-endpoint link because sm8750.dtsi does not yet have the
   CAMSS / CSIPHY nodes.

Will these nodes cause make dtbs_check validation failures until the
corresponding bindings and CSI receiver endpoints are added?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793427040.gi=
t.xiaqinghuan@mail.ustc.edu.cn?part=3D4
