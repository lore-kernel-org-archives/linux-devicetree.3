Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68422744F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783472063; cv=none; b=Xr6YtA1vo2Vlfoh5L0fHP1sylWrlw7RnCc4Q4QWqc0Zyrpcg69/zEv7Zn4c1iW0HoDUVoY3Aw/UBgZxIBq5v8S0TNaUflBqm8TZabPK9zgoPzfQ5etRxmGEhmSuNceEMfhO/deDWVhXCwinnw9dzrlFu7ccJc1u4y6OODJk55jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783472063; c=relaxed/simple;
	bh=GJiZGjCJtcvBSo+dPZI6EQ0SJ4w+ZX2nuX2zT8POgWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AJIY4VaXpXv+PspcrDv/SUZyH8+uBpWW9kbCiQEw3/K98V/qcsc4CCfg6vDXZhyVlly5N0r126yd378i+vbWxPH0k/IJhCHgg5D5mVM3rBvyEZiHKinU57DJkz7fRZV2WovlQ9riadNAyaeKx3U76+yG6o0cNEfovDzkEQQ7+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgZUiKA3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgZUiKA3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E581F00A3A;
	Wed,  8 Jul 2026 00:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783472062;
	bh=N6MMgXGwoul6RUzx+NGN2p9RxeYgYRYVQ2dvVvUgPE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JgZUiKA3mExrTiKeGjB48xnkmvSqrdq+CYLiUIV1pXXm00ATMjEb34IYgO35NeFLY
	 Olim6mngZM/dkY2KtFfdXpJN5V5AdL+p136PvOzPuARPggIE6MTL3iytZNvpTsnGnk
	 v4RAU4SsSQzUe97/o7argAIo1yvgamDU8LfacRFw23Ie9KekUMowwihjRPLXMgKf0B
	 21cESjXvEES1dHHGSnOuysDxc1VNwZbpsdX911AQLMnWXjQoDDvmEx+5pRA1BCX+k3
	 HNOQ1nheUplfcQftV8n6Tj7MenFpox0SXHHa+MF31jMMQ1P7MxWggwwZB7wt3ixQp4
	 NgMZCrCV86xgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-6-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
 <20260708-x1e-camss-csi2-phy-dtsi-v4-6-572348ad1b2a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 00:54:21 +0000
Message-Id: <20260708005422.19E581F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing `vdd-l5-supply` property for `vreg_l5m_2p8` (`ldo5`) in th=
e PM8010 PMIC node.
- [Medium] Undocumented addition of `vreg_l7b_2p8` (`ldo7`) to the PM8550 P=
MIC block.
- [Low] Regulator names in the commit message do not match the implemented =
names in the device tree.
--

--- Patch [6]: [PATCH v4 06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010=
 camera PMIC with voltage levels for IR and RGB camera ---
commit 40ce9f41fc6767cc89c087d96f0381849341a04a
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels=
 for IR and RGB camera

This commit adds the PM8010 PMIC node and its associated regulator voltage
rails for the IR and RGB sensors on the ThinkPad T14s.

> arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage leve=
ls for IR and RGB camera
>=20
> Add the PM8010 PMIC providing the following voltage rails:
>=20
> vreg_l1m_r @ 1v2 IR sensor
> vreg_l2m_r @ 1v2 RGB sensor
> vreg_l3m_r @ 1v8 IR sensor
> vreg_l4m_r @ 1v8 RGB sensor
> vreg_l5m_r @ 2v8 IR sensor
> vreg_l7m_r @ 2v8 RGB sensor

[Severity: Low]
This isn't a bug, but the regulator names listed in the commit message use a
_r suffix (e.g., vreg_l1m_r), whereas the actual implemented names in the
device tree use voltage-based suffixes (e.g., vreg_l1m_1p2).

Should the commit message be updated to match the device tree names?

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
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
Is this addition intentional for this patch?

The commit message only mentions adding the PM8010 camera PMIC voltage rail=
s,
but this block adds a regulator to the entirely different PM8550 PMIC block.
Could the commit message be updated to document this, or does this belong in
a separate patch?

[ ... ]

> +	regulators-8 {
> +		compatible =3D "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id =3D "m";
> +
> +		vdd-l1-l2-supply =3D <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply =3D <&vreg_s4c_1p8>;
> +		vdd-l7-supply =3D <&vreg_bob1>;

[Severity: High]
Is the vdd-l5-supply property missing from this list?

Looking at vreg_l5m_2p8 (ldo5) introduced below, it lacks a parent supply
linkage. If the parent supply is turned off by other consumers, will
vreg_l5m_2p8 silently lose power and cause the connected IR sensor to fail?

> +
> +		vreg_l1m_1p2: ldo1 {
> +			regulator-name =3D "vreg_l1m_1p2";
> +			regulator-min-microvolt =3D <1200000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-x1e-camss-=
csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org?part=3D6
