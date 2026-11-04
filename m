Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763721;
	b=Lw0jWf1Ozuqr3YcYqlr5Sh1Ufs208f/NVEIw5h8N3Co96/GIooAxawVHErBwzjW8Gg3s
	 xRP8AzUvCc3n5boE4f1C9wO5GUL5xI3sRK2nfLUQPv61gJETIdRrmNHTJem4Hy1+yh4Ez
	 lU4wZ+G7BxOmbns/ON1oNkb+6EWbDI5s4/NqnIrPQpMo/oIMDaIuS8uXlT73coy8mBdVP
	 /i/EZ/q/tZKZ+nh8mqCZ6zxZX5ZBUR7438R4+aUGHgfaJTZKXY22rwEkAhgRYOr81gczg
	 4nEb2xvXzmZFyW67HAvoc63E+UBPuUk6nsuDNLKj9DvcTASab0B5pp+7dk08W1U0HWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763721;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MpQSlEuCqgSpTiaTvFc80QC3rvg/qymfbvDiFyQwvSA=;
	b=TXMximByxUGPe9F+cL61KDtbdhiz6Hf6kVTWpWWDOb/WHkdttwkwOJ/fBzIZKBBIQc+5
	 sjR7pTpZzibJ0Hy90EqwuKrIox22A2acARAPprlthJ0iw1k8ANdEtlespIAz1xaATNzKh
	 QBvM92O4bdRfUsF7OmkfmcJic/2MPs8NMEzt6GjVrXNTB4E1cVu1JZwKqfn/AC0o17h3R
	 A+gk4pFSgx1/oKmiNaYO7o3jektklZKXPWL46+JYje54mWsSZNfIutaqQV+LCmkUH3zEM
	 lHNGt1cs+MOKwMf44DYTGAXpv9t6SptMoIUql9JEArYfVzW+EAu4zhyuZNtheEmh9jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=deWgzyni;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBED2606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 03:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=deWgzyni
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AA91F00A02;
	Wed,  4 Nov 2026 03:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763720;
	bh=MpQSlEuCqgSpTiaTvFc80QC3rvg/qymfbvDiFyQwvSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=deWgzyniJw4NGOqnOyg3w5CnqL5KsQbnx7KhhnvzSO1pwLgy75D69rhx25M8R/KD7
	 xjItBFcsSF3utlzJ50f8wpQSyLyvMF+bN5iyRgaaJeAzes1cU42r0ZyWCEHLXa91/h
	 SDScUQ7NmvYHaUoyVJmMNiADM8rg/pwBYvEYzgjqoqmeWx7aM2sO/5JxmMt3T50JM5
	 0oHfPN2vOGVk3WD4sRE5/BPX/FBFGXi/wnxC3gJ11SMTEB2vSegEqZSB1gNhJqV9z+
	 TLYTr5zA75PlTgojgXtl/Sbjcd+yM01hwnmyY0l9+ohWAq1vS+Fyd54lEIj7jAtxH2
	 TrRSKsve23PDQ==
Message-ID: <sashiko-outbox-196621@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8750-lenovo-elden: describe
 the WL2868C regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104032648.209747-6-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261104032648.209747-6-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:42:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: sm8750-lenovo-elden: incomplete WL2868C suppli=
es on stub DT
--

commit 0758c044c3db5c70cf435a167f553582f960cdb2
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators

This commit enables gpi_dma2, qupv3_2, and i2c10 on the Lenovo Legion Y700
Gen4 devicetree and adds the WL2868C camera PMIC node along with its LDO
regulators and a fixed VSYS supply.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm6=
4/boot/dts/qcom/sm8750-lenovo-elden.dts
> index 821950715c8e4..73f4452f46120 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> @@ -5,6 +5,7 @@
> =20
>  /dts-v1/;
> =20
> +#include <dt-bindings/gpio/gpio.h>
>  #include "sm8750.dtsi"
> =20
>  / {
> @@ -43,8 +44,86 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>  			clock-div =3D <2>;
>  		};
>  	};
> +
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
> +
> +	pmic@2f {
> +		compatible =3D "willsemi,wl2868c";
> +		reg =3D <0x2f>;
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
As reported by Konrad Dybcio on v5 [1], does adding the pmic@2f node to
sm8750-lenovo-elden.dts before the board SPMI PMICs, RPMh regulators, and
camera consumers are present provide a complete or usable hardware
description beyond what the DT binding example in
Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml already
covers?

In drivers/regulator/wl2868c-regulator.c, wl2868c_regulators[] defines
supply_name as "vin12" for ldo1 and ldo2, "vin34" for ldo3 and ldo4, "vin5"
for ldo5, and "vin7" for ldo7. When wl2868c_probe() registers each regulator
via devm_regulator_register(), the regulator core resolves those parent inp=
ut
supplies on pmic@2f.

Because sm8750-lenovo-elden.dts does not yet describe the SPMI PMICs or RPMh
regulators (nor the basic board infrastructure to boot), pmic@2f omits
vin12-supply, vin34-supply, vin5-supply, and vin7-supply and only provides a
placeholder regulator-fixed wl2868c_vsys node without voltage constraints,
causing all six registered LDOs to fall back to dummy parent supplies with =
no
consumers attached.

Would it be better to introduce this node together with the board PMICs and
camera consumers once the parent supplies can be properly wired up?

[1] https://lore.kernel.org/r/dddc808a-6407-4db1-aa72-0ebe5652f97c@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104032648.2097=
47-1-xiaqinghuan@mail.ustc.edu.cn?part=3D5
