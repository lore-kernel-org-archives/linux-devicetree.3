Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2535175A7E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783472020; cv=none; b=UEY/ET30qrPQuIYkbMWYn5Hj1i3IoGs1us/T/Xd8pxV04KYnwXqaRg5G5R7LJ4EjEDqM6L7tfmQ2DTo6hDgeH45MtdHImIVWvg73JwiewzenJicmlPDAn3KA4ibmIxFvbmGsshMNEHQ7wnQAF2b19q/4hP4rD/MOT3Ar/OPjz0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783472020; c=relaxed/simple;
	bh=m40uEJpMN9x+Vxvb0d+C+QT6CIonRN3IKfNAYvmo1Ik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fGS2n4lOchJi4/nC70WJF1litC2dEqs84y/FKWLD1PVbMtnN+ZFeCZ3tmn6s9u9rLX5Ev84mO7BYsAta82/smqi3CH2IkHa97B1CjwKgCHnEE5DTxqh5H+QqAh/cAif3yCy4AEuecD4ZthzrbmObNqZID9caFFDQ9SiPPz/N5Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1LskKuk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1LskKuk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DAA1F000E9;
	Wed,  8 Jul 2026 00:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783472019;
	bh=ZdnTVxZytiKNWyii21O+epR9CSVkO7FyiWQlA7tIVUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j1LskKuk5VlBBAOqnTy9jH5tK/efZ1Kq6Sqhgtm+pywCe9fA3M1A0Ck6V9lia4r79
	 IQnnVjIbDvItlelsj0+o2VKh4H9+cOAq6B2qJjCzLtOBxPSOvdwKmlh8v3CI3GFGSS
	 VW6l5qmfG3IYSV1xk9pabSNm0rcZbyULlxwjsPeI77RU+s8lWuCWDSsCMXypTRH7rs
	 YzKYm8FTZsq1DJMbEfQRQiJEjjVQrovLbaZr51P9x0aSiNKTCcNBFd/hN6haHD50c7
	 SvoPDCJO2GhcZTV6d5tz1bsiUZO8GzuI7ye4qeLdmskAnV9ObxOmtze1I8+t6Xzidh
	 o9alqPryl6oAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-4-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
 <20260708-x1e-camss-csi2-phy-dtsi-v4-4-572348ad1b2a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 00:53:38 +0000
Message-Id: <20260708005339.11DAA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `pm8010_vreg_data` array in the RPMh regulator driver lacks a =
terminating empty `{}` sentinel.
--

--- Patch [4]: [PATCH v4 04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 =
CRD pmic,id=3Dm regulators ---
commit 047315d3629a65ebc6a0299afcf53675ba20171b
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=3Dm regulators

This patch adds rpmh regulator definitions for the pm8010 CRD pmic. This
regulator set provides vreg_l3m_1p8, the regulator for the ov08x40 RGB
sensor on the CRD.

> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/q=
com/x1-crd.dtsi
> index a9c5c523575ee..7b9a40a7b9a95 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -897,6 +897,36 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible =3D "qcom,pm8010-rpmh-regulators";

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential problem
in the rpmh regulator driver when looking at the pm8010 regulators.

The pm8010_vreg_data array in drivers/regulator/qcom-rpmh-regulator.c lacks=
 a
terminating empty {} sentinel:

drivers/regulator/qcom-rpmh-regulator.c:
static const struct rpmh_vreg_init_data pm8010_vreg_data[] =3D {
	RPMH_VREG("ldo1",  LDO,  1, &pmic5_nldo502,   "vdd-l1-l2"),
	RPMH_VREG("ldo2",  LDO,  2, &pmic5_nldo502,   "vdd-l1-l2"),
	RPMH_VREG("ldo3",  LDO,  3, &pmic5_pldo502ln, "vdd-l3-l4"),
	RPMH_VREG("ldo4",  LDO,  4, &pmic5_pldo502ln, "vdd-l3-l4"),
	RPMH_VREG("ldo5",  LDO,  5, &pmic5_pldo502,   "vdd-l5"),
	RPMH_VREG("ldo6",  LDO,  6, &pmic5_pldo502ln, "vdd-l6"),
	RPMH_VREG("ldo7",  LDO,  7, &pmic5_pldo502,   "vdd-l7"),
};

Because rpmh_regulator_init_vreg() iterates over this array using
rpmh_data->name as the loop condition, if a device tree specifies a regulat=
or
name not present in this array, the loop will read past the end of the arra=
y.

Could this out-of-bounds read cause the PMIC to misconfigure a regulator if=
 a
name happens to match adjacent memory, or lead to a kernel panic if it
reaches unmapped memory before encountering a NULL pointer?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-x1e-camss-=
csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org?part=3D4
