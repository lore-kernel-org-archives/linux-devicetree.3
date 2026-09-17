Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD6D5221F7
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651961; cv=none; b=iDQmRv/R4pMsnuEnSFKkR6JO+6B/dLriyQ89IgtQ4BsdsQuS5L+asCGVrPTbDZBD5g8ULIrUe2S5r/c8sjlbXZHaCj9LOjHMKrClLv77uIEATh5pAlWcnxcF8ujJCBh5/CY3eQSaxuu1nrANQL/lcCedPr/eyevphdCkePEyFSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651961; c=relaxed/simple;
	bh=Bj7brDgH7u/BuC4ToI1wbLUwKDX7/v0eyYI1u3qwdhU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mxdWGC6CNN3Y8a0/y1YM1RhXN5/1kiDmEe7osFiX10sg2OX1aPKwPKBErU/41KEoQatzXD8/8C1QN4k5ZCw/vuDZehGO3762p+KSHiSH5OO1MAntAAl+okhEHgG9rKmYWB4jW6xzirWKPNk43Dz8V90o+IZ3qRt/Ni3m7kr8B7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1WnYC45; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1WnYC45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CE81F000FF;
	Thu, 17 Sep 2026 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789651957;
	bh=/w9BklC0TGZb5WcKw07fesR7cOrfGnFITcHAT9q3Sg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z1WnYC45ZOZLoE4FLwQtAdxB1ZP9PGFOG4d+ELdW50qmBeUtLyxFaZUzSdgN5utV6
	 UOvTNs2Lv+Nc2C1umF/hRNW+6Y3XLLSqyWMIFdUNcUm+ruKm3AmK0IXIikhglawI6x
	 SXCAeQzSfl9y25EvTFRY+VvGlqf+Idp7Qk0WY9QE2+hjy83mT9cC5+x56u+9EbdTDa
	 6/gJy8AneyXJTlNlqWpjBhFt+MVaupoUEYrJKQoXi3PxJ/j6lYw7ehyytvCynYkyrT
	 vuDY5vMgivUgbvEC37cTi86m7vPr1POhNM4tHBxCcqkbjtrltPX0nw7P5mZPfLaA8R
	 7C2dNzsGTc4gQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/12] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-7-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
 <20260917-x1e-camss-csi2-phy-dtsi-v7-7-1a63eb35838b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:32:37 +0000
Message-Id: <20260917133237.96CE81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: qcom: missing vdd-l5-supply for PM8010 ldo5
- [Medium] dts: qcom: undocumented and unused regulator vreg_l7b_2p8
--

commit fc35d30463b7ad642cf725c431af83b35de74414
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels=
 for IR and RGB camera

This commit adds the PM8010 PMIC and configures voltage rails for the IR and
RGB sensors on the Lenovo Thinkpad T14s.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 0bee2a3d6e7a9..d2eaabf917f11 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -562,6 +562,13 @@ vreg_l6b_1p8: ldo6 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
> =20
> +		vreg_l7b_2p8: ldo7 {
> +			regulator-name =3D "vreg_l7b_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <2800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +

[Severity: Medium]
Is this regulator intentionally added here?

The commit message enumerates rails only for the new PM8010 PMIC, but this
silently adds vreg_l7b_2p8 to the regulators node.

Furthermore, is vreg_l7b_2p8 used anywhere in the T14s device tree? It
appears this board uses vreg_l7m_2p8 for its camera instead, making this
addition potentially unused dead code for this specific board.

>  		vreg_l8b_3p0: ldo8 {

[ ... ]

> @@ -805,6 +812,58 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible =3D "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id =3D "m";
> +
> +		vdd-l1-l2-supply =3D <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply =3D <&vreg_s4c_1p8>;
> +		vdd-l7-supply =3D <&vreg_bob1>;

[Severity: Medium]
Should vdd-l5-supply be included in this list to provide the parent supply
for ldo5?

Without this, the regulator framework cannot resolve the parent supply when
vreg_l5m_2p8 is enabled. This means it will not properly enable the parent
regulator or vote for its voltage, which could lead to silent power failures
for the IR sensor if the parent is not kept on by other clients.

> +
> +		vreg_l1m_1p2: ldo1 {

[ ... ]

> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name =3D "vreg_l4m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name =3D "vreg_l5m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-x1e-camss-=
csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org?part=3D7
