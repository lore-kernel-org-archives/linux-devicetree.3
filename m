Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218664;
	b=nddLfQDXAscXNU8lxYRnRSFGIKNnMwNf9MI6K07p+6jT1p1i6fCwa76lvwjOI7LvTl9w
	 TLbnf+JdPmnCrE9ZQk0PQC4PToqKQK+w6DHod8EOI47jk1hKzw4vAVwJi84G+lKP52b3H
	 xB0UoIRlmZH4iINm19M5/PChjKJyZHkkJG7nApmDr7mXDBa1imLj2Gc12OcLehmCts/LE
	 5SftyGcdYj1DXA6+NeGQNsbnYjUa192w4L9eAie+YIv58aCfm1hWbVTNrM3syJ60wMNbR
	 VxMLPUb3MCVWxODn5zphYHyMYnA2Ll6n7BIDVzRZtNF9STZm269Pr9estalpU8VaZJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218664;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aJGfPysZ9S/UdVqmEeAotDQuK0OHg+ibrgCuvRPmeiI=;
	b=Q6XI2Nru16SlHWQ/khHR8Hn/WQPa5lOhLXifvyDfA0noKqOaFdIchQ/9mX0F5+cf08zG
	 VwxNN9Pb/scE94sghebBqXlJfGd+dSbCvEOczur9zC8UF18DfSAXD94Xo7ktRrOK+mqUZ
	 D60e4bC+tve5QAdu7TUOYRwqrl2izVXxPyalNJ06rq26oMo3i2XwtHx/Hi281M/YbPmQ8
	 4jJNqbn2bORqApMlDUQ/NQmrB3bjAUBGGYMVst4w5gO//3aDxFD+lmC+Yx24DC4Z19fMl
	 R656iRiRu/wXhtefS1aMJM9Q4DBqGheoqy9pvbAOvyxdpkylFo1NzvOm7GEtWWimkBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGbloZew;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE67606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 20:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGbloZew
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687641F01825;
	Wed, 28 Oct 2026 20:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793218663;
	bh=aJGfPysZ9S/UdVqmEeAotDQuK0OHg+ibrgCuvRPmeiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bGbloZewCNmyltlP+O7g+aHjYQoI8BoDJutWtRK6wkRIHflZ0pdtd2SXRbEIbusXQ
	 f6JIC9/m/Z/Y09L0D/sRiFZBHAv0xzaK5HMF/ky/PRUq+pXI/c4OGK8TqOHtoB4RAs
	 vUp/Ii8qe97FW0T7LiQTTtVGTzELbGW9NqMHlLKVg46ROhcAcBm8NiurbzaJED9sSY
	 1pudcY4WSaRkuMnx4QUVZRcZR37gtiGSPPTXIABTWr1hJ06ofHShQ6WUJBjW3lnccR
	 d9P/Q2j7usZ5QcPxOV3fcaUlbYd724Nt5TOBnusBbxwu6hcT4Tp8bbRBK/gXk++35J
	 ODSRCB0NECsRA==
Message-ID: <sashiko-outbox-188374@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Consolidate Glymur CoB power grid
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028-topic-sip_cob-v1-2-80ab6704aca3@oss.qualcomm.com>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261028-topic-sip_cob-v1-2-80ab6704aca3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 20:17:42 +0000
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
- [High] arm64: dts: qcom: invalid step voltages on vreg_l7b0 and vreg_s9f0
- [Medium] arm64: dts: qcom: yoga-slim7x retains swapped USB QMP PHY suppli=
es
- [Medium] arm64: dts: qcom: mahua-tcsr QREF fixups missing from mahua.dtsi
--

commit e05c2da4bef582e863ac9bb6fa079eb8effdd101
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: Consolidate Glymur CoB power grid

This commit factors out the common PMIC includes, RPMH regulator definition=
s,
and on-SoC peripheral supply properties for Glymur CoB devices into a shared
glymur-cob.dtsi file and updates the board and Mahua device trees to use it.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-cob.dtsi b/arch/arm64/boot/d=
ts/qcom/glymur-cob.dtsi
> new file mode 100644
> index 0000000000000..8b4ba1d384a0d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-cob.dtsi
> @@ -0,0 +1,310 @@
[ ... ]
> +&apps_rsc {
> +	rpmh_vregs_b_e0: regulators-0 {
> +		compatible =3D "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id =3D "B_E0";
> +
> +		vreg_l1b0: ldo1 {
> +			regulator-name =3D "vreg_l1b0";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b0: ldo7 {
> +			regulator-name =3D "vreg_l7b0";
> +			regulator-min-microvolt =3D <3100000>;
> +			regulator-max-microvolt =3D <3100000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
[ ... ]
> +	rpmh_vregs_f_e0: regulators-2 {
> +		compatible =3D "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id =3D "F_E0";
> +
> +		vreg_l2f0: ldo2 {
> +			regulator-name =3D "vreg_l2f0";
> +			regulator-min-microvolt =3D <944000>;
> +			regulator-max-microvolt =3D <944000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3f0: ldo3 {
> +			regulator-name =3D "vreg_l3f0";
> +			regulator-min-microvolt =3D <912000>;
> +			regulator-max-microvolt =3D <912000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* Voltage input for PMCX0104 */
> +		vreg_s9f0: smps9 {
> +			regulator-name =3D "vreg_s9f0";
> +			regulator-min-microvolt =3D <1900000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};

[Severity: High]
Will setting regulator-min-microvolt =3D=3D regulator-max-microvolt to 3100=
000 on
vreg_l7b0 (ldo7 on pmh0101) and 1900000 on vreg_s9f0 (smps9 on pmh0110) cau=
se
rpmh_regulator_probe() to fail with -EINVAL for both the B_E0 and F_E0 PMIC
regulator nodes?

In drivers/regulator/qcom-rpmh-regulator.c, pmh0101_vreg_data maps ldo7 to
pmic5_pldo530_mvp300:

	static const struct rpmh_vreg_hw_data pmic5_pldo530_mvp300 =3D {
		.regulator_type =3D VRM,
		.ops =3D &rpmh_regulator_vrm_drms_ops,
		.voltage_ranges =3D (struct linear_range[]) {
			REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
		},

Because (3100000 - 1504000) / 8000 is 199.5, 3100000 uV lies halfway between
the valid hardware steps 3096000 uV and 3104000 uV.

Similarly, pmh0110_vreg_data maps smps9 to pmic5_ftsmps530:

	static const struct rpmh_vreg_hw_data pmic5_ftsmps530 =3D {
		.regulator_type =3D VRM,
		.ops =3D &rpmh_regulator_vrm_ops,
		.voltage_ranges =3D (struct linear_range[]) {
			REGULATOR_LINEAR_RANGE(252000, 0, 305, 4000),
			REGULATOR_LINEAR_RANGE(1480000, 306, 464, 8000),
		},

Because (1900000 - 1480000) / 8000 is 52.5, 1900000 uV lies halfway between
the valid hardware steps 1896000 uV and 1904000 uV (previously vreg_s9f0 us=
ed
a range of 1900000 to 2000000 uV, which contained valid steps).

When rpmh_regulator_probe() -> rpmh_regulator_init_vreg() ->
devm_regulator_register() -> set_machine_constraints() ->
machine_constraints_voltage() checks a fixed constraint where cmin =3D=3D c=
max is
not an exact hardware step, clamping produces max_uV < min_uV (3096000 <
3104000 for vreg_l7b0, and 1896000 < 1904000 for vreg_s9f0) and returns
-EINVAL, aborting registration of the entire PMIC regulator block in
rpmh_regulator_probe():

	ret =3D rpmh_regulator_init_vreg(vreg, dev, node, pmic_id,
					vreg_data);
	if (ret < 0)
		return ret;

> diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arc=
h/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> index 56c22daab0569..a8580499e7093 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
[ ... ]
> @@ -1142,9 +928,6 @@ &usb_0_dwc3_hs {
>  };
> =20
>  &usb_0_hsphy {
> -	vdd-supply =3D <&vreg_l3f0>;
> -	vdda12-supply =3D <&vreg_l4h0>;
> -
>  	phys =3D <&smb2370_j_e2_eusb2_repeater>;
> =20
>  	status =3D "okay";
> @@ -1171,9 +954,6 @@ &usb_1_dwc3_hs {
>  };
> =20
>  &usb_1_hsphy {
> -	vdd-supply =3D <&vreg_l3f0>;
> -	vdda12-supply =3D <&vreg_l4h0>;
> -
>  	phys =3D <&smb2370_k_e2_eusb2_repeater>;
> =20
>  	status =3D "okay";
> @@ -1200,9 +980,6 @@ &usb_2_dwc3_hs {
>  };
> =20
>  &usb_2_hsphy {
> -	vdd-supply =3D <&vreg_l4c1>;
> -	vdda12-supply =3D <&vreg_l4f1>;
> -
>  	phys =3D <&smb2370_l_e2_eusb2_repeater>;
> =20
>  	status =3D "okay";

[Severity: Medium]
Should the local supply properties on &usb_0_qmpphy, &usb_1_qmpphy, and
&usb_2_qmpphy in arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts also
be removed so they inherit the consolidated definitions from glymur-cob.dts=
i?

Right after each of the hsphy nodes above, glymur-lenovo-yoga-slim7x.dts st=
ill
has:

	&usb_0_qmpphy {
		vdda-phy-supply =3D <&vreg_l4h0>;
		vdda-pll-supply =3D <&vreg_l3f0>;
		refgen-supply =3D <&vreg_l2f0>;

		status =3D "okay";
	};
	...
	&usb_1_qmpphy {
		vdda-phy-supply =3D <&vreg_l4h0>;
		vdda-pll-supply =3D <&vreg_l1h0>;
		refgen-supply =3D <&vreg_l2f0>;

		status =3D "okay";
	};
	...
	&usb_2_qmpphy {
		vdda-phy-supply =3D <&vreg_l4f1>;
		vdda-pll-supply =3D <&vreg_l4c1>;
		refgen-supply =3D <&vreg_l1c1>;

		status =3D "okay";
	};

Those local properties override glymur-cob.dtsi with the 1.2 V rails
(vreg_l4h0, vreg_l4f1) and 0.9 V rails (vreg_l3f0, vreg_l1h0, vreg_l4c1)
swapped between vdda-phy-supply and vdda-pll-supply, and with vreg_l1c1 on
&usb_2_qmpphy refgen-supply.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts=
/qcom/mahua-crd.dts
> index 51708954f17a7..8a36d0caaf9e2 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> @@ -26,17 +26,16 @@ &pcie3b_phy {
>  };
> =20
>  &tcsr {
> -	vdda-qrefrpt0-0p9-supply =3D <&vreg_l2f1>;
> -	vdda-qrefrpt1-0p9-supply =3D <&vreg_l2f1>;
> -	vdda-qrefrpt2-0p9-supply =3D <&vreg_l2f1>;
> +	/delete-property/ vdda-qrefrx4-0p9-supply;
> +	/delete-property/ vdda-qrefrx5-0p9-supply;
> +	/delete-property/ vdda-qreftx0-0p9-supply;
> +	/delete-property/ vdda-qreftx0-1p2-supply;
> +	/delete-property/ vdda-refgen4-0p9-supply;
> +	/delete-property/ vdda-refgen4-1p2-supply;
> +
>  	vdda-qrefrpt3-0p9-supply =3D <&vreg_l1f1>;
> -	vdda-qrefrpt4-0p9-supply =3D <&vreg_l2h0>;
>  	vdda-qrefrpt5-0p9-supply =3D <&vreg_l2h0>;
> -	vdda-qrefrx0-0p9-supply =3D <&vreg_l2f1>;
> -	vdda-qrefrx1-0p9-supply =3D <&vreg_l2f1>;
> -	vdda-qrefrx2-0p9-supply =3D <&vreg_l2f1>;
>  	vdda-qrefrx3-0p9-supply =3D <&vreg_l2h0>;
> -	vdda-qreftx1-0p9-supply =3D <&vreg_l1f1>;
>  	vdda-refgen3-0p9-supply =3D <&vreg_l1f1>;
>  	vdda-refgen3-1p2-supply =3D <&vreg_l4f1>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd=
.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> index 860e9ef01aa6f..a77eb75658047 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
[ ... ]
> @@ -948,36 +751,9 @@ right_spkr: speaker@0,1 {
>  	};
>  };
> =20
> -&smb2370_j_e2_eusb2_repeater {
> -	vdd18-supply =3D <&vreg_l15b0>;
> -	vdd3-supply =3D <&vreg_l7b0>;
> -};
> -
> -&smb2370_k_e2_eusb2_repeater {
> -	vdd18-supply =3D <&vreg_l15b0>;
> -	vdd3-supply =3D <&vreg_l7b0>;
> -};
> -
>  &tcsr {
> -	vdda-qrefrpt0-0p9-supply =3D <&vreg_l2f1>;
> -	vdda-qrefrpt1-0p9-supply =3D <&vreg_l2f1>;
> -	vdda-qrefrpt2-0p9-supply =3D <&vreg_l2f1>;
> -	vdda-qrefrpt3-0p9-supply =3D <&vreg_l2h0>;
> -	vdda-qrefrpt4-0p9-supply =3D <&vreg_l2h0>;
>  	vdda-qrefrpt5-0p9-supply =3D <&vreg_l2h0>;
> -	vdda-qrefrx0-0p9-supply =3D <&vreg_l2f1>;
> -	vdda-qrefrx1-0p9-supply =3D <&vreg_l2f1>;
> -	vdda-qrefrx2-0p9-supply =3D <&vreg_l2f1>;
>  	vdda-qrefrx3-0p9-supply =3D <&vreg_l2h0>;
> -	vdda-qrefrx4-0p9-supply =3D <&vreg_l2h0>;
> -	vdda-qrefrx5-0p9-supply =3D <&vreg_l3f0>;
> -	vdda-qreftx0-0p9-supply =3D <&vreg_l3f0>;
> -	vdda-qreftx0-1p2-supply =3D <&vreg_l4h0>;
> -	vdda-qreftx1-0p9-supply =3D <&vreg_l1f1>;
> -	vdda-refgen3-0p9-supply =3D <&vreg_l2f0>;
> -	vdda-refgen3-1p2-supply =3D <&vreg_l4h0>;
> -	vdda-refgen4-0p9-supply =3D <&vreg_l1f1>;
> -	vdda-refgen4-1p2-supply =3D <&vreg_l4f1>;
>  };
[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qc=
om/mahua.dtsi
> index a59c5ed7b48e7..16f62040aa84b 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
> @@ -5,6 +5,7 @@
> =20
>  /* Mahua is heavily based on Glymur, with some meaningful differences */
>  #include "glymur.dtsi"
> +#include "glymur-cob.dtsi"

[Severity: Medium]
Since mahua.dtsi now includes glymur-cob.dtsi and sets &tcsr compatible to
"qcom,mahua-tcsr", should the Mahua-specific &tcsr property deletions and
supply overrides in mahua-crd.dts live in mahua.dtsi (or a Mahua CoB dtsi)
instead?

With those &tcsr changes placed only in mahua-crd.dts,
mahua-lenovo-thinkpad-t14s-gen7-lcd.dts only overrides vdda-qrefrpt5-0p9-su=
pply
and vdda-qrefrx3-0p9-supply, leaving it with Glymur's refgen3 and qrefrpt3
supplies (vreg_l2f0, vreg_l4h0, vreg_l2h0 instead of vreg_l1f1 and vreg_l4f=
1)
as well as the unused Glymur-only qrefrx4, qrefrx5, qreftx0, and refgen4
properties from glymur-cob.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-topic-sip_=
cob-v1-0-80ab6704aca3@oss.qualcomm.com?part=3D2
