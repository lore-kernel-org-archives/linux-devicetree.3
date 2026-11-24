Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518218;
	b=5X9iBu37j4A89u4a2UltnpzwSqlhOoBkmaINGO3nQWuSpSaz3UgPxhzVPCHguns43Zs7
	 iVc0KnslGp0ErM+W3ZAXoLj4TOBpJdAk1stqGJI3P1Ogy+Tfrc+kbsAhxsI58VQNIpe1i
	 s+annofHkoNNzxW3Sgdau+yYBBEKbNoX2P3xcCbeTijJvnxp9whZxKuPnKsrjqmZ+Aeou
	 o/G+7VL7JJJh0gs8oDQYeRZwmvTzQogwlsOqAJvdi4qDceVZASCbB/KWLvwtGGON7qynZ
	 LwQuWZYOVOhIlU2oCsuX2GaX4jlee9j4Nw7pXaHPsH1hzs2lai5QOPKe9IR8zdz7KPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518218;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BXeCz3GUcg4MW549eO+mPj/zshtxxmPacaom862S6rI=;
	b=4jCM/Eou4zA120XWYhrSy9T3gRj9lEo0SgoKAwc5A486O4YIJzlICfg+BCev+/5s/Mfg
	 jege2XuLxWDFRHfjjNZa0NbANjiLE2BsEoULvLmDNTP/aKuBLQhx0oQr0FZyVY12kflbj
	 JRLYgL6+pBkcR1wsoy9C/m1Gm/s0wdxwa+hzkrdyFfXFOmYfx890CmV/H6xuP47PK7suB
	 qxJRLiCLqU3a3oGp9CINWSnVqu9qBdi7fRTCAw7RuQX1n+XI4DC1UvM5QLvGZl16/9k5+
	 3oS4ikbJ9AxqLniHdqZs3J3w03sAEB91fKzevVZwJIsIZaSJfp4Z9tLyu82wvNNnQ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cORH0G5D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF7B606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cORH0G5D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941AA1F000C0;
	Tue, 24 Nov 2026 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518217;
	bh=BXeCz3GUcg4MW549eO+mPj/zshtxxmPacaom862S6rI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cORH0G5DT0Dqci66EU3rIBwstPQJNUwprm5g+S4fr1fASokgfCY2yku00eEow+FVV
	 zbX2BHIggwN9fPM25SC3KpnEKOj3ll96m/RsPcjjuNVL8mN9Le5mmF3n1EyvYW5gqw
	 aH2ZRoysEztilyt6VtKOqeOb19VPLsGxFoPelZGXPv/n4pbBqnxrMNeqN6vEPoJFJl
	 kEQZd3zEk/Timjkc3lnav9pE2LNf/3E/QxV/DJIwy2HM2HJwck8Yx7pPtooTbIqM/K
	 e184Os+96KD2nGjSc9V5On46dmGa5O12HZcqovdw9XFv71ZdrflGmvNI5FTS6z99FF
	 jUMtHoUcRp4Ag==
Message-ID: <sashiko-outbox-231015@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add PM6450 LDO support
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-netrani-pm6450-v1-v1-2-1914da758d3d@krgm.moe>
References: <20261124-netrani-pm6450-v1-v1-0-1914da758d3d@krgm.moe>
 <20261124-netrani-pm6450-v1-v1-2-1914da758d3d@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:03:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] regulator: qcom-rpmh: ldo24 n_voltages=3D0 breaks UFS load voting
  and DT uV
--

commit 9fd0e1480b4f40cc51922b0274d428fec8c1448a
Author: SignKirigami <prcups@krgm.moe>

regulator: qcom-rpmh: Add PM6450 LDO support

This commit adds RPMh regulator definitions for the PM6450 PMIC LDOs,
using a no-voltage VRM configuration for LDO24 to preserve its power-on
voltage.

> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/=
qcom-rpmh-regulator.c
> index da4764ffa6325..c397717dc0d6d 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -475,6 +475,15 @@ static const struct regulator_ops rpmh_regulator_vrm=
_bypass_ops =3D {
>  	.get_bypass		=3D rpmh_regulator_vrm_get_bypass,
>  };
> =20
> +static const struct regulator_ops rpmh_regulator_vrm_no_voltage_ops =3D {
> +	.enable			=3D rpmh_regulator_enable,
> +	.disable		=3D rpmh_regulator_disable,
> +	.is_enabled		=3D rpmh_regulator_is_enabled,
> +	.set_mode		=3D rpmh_regulator_vrm_set_mode,
> +	.get_mode		=3D rpmh_regulator_vrm_get_mode,
> +	.get_optimum_mode	=3D rpmh_regulator_vrm_get_optimum_mode,
> +};
> +
>  static const struct regulator_ops rpmh_regulator_xob_ops =3D {
>  	.enable			=3D rpmh_regulator_enable,
>  	.disable		=3D rpmh_regulator_disable,
> @@ -1588,6 +1597,31 @@ static const struct rpmh_vreg_init_data pm6150l_vr=
eg_data[] =3D {
>  	{}
>  };
> =20
> +static const struct rpmh_vreg_hw_data pm6450_ldo_10ma_no_voltage =3D {
> +	.regulator_type =3D VRM,
> +	.ops =3D &rpmh_regulator_vrm_no_voltage_ops,
> +	.hpm_min_load_uA =3D 10000,
> +	.pmic_mode_map =3D pmic_mode_map_pmic5_ldo,
> +	.of_map_mode =3D rpmh_regulator_pmic4_ldo_of_map_mode,
> +};
> +
> +static const struct rpmh_vreg_init_data pm6450_vreg_data[] =3D {
> +	RPMH_VREG("ldo5", LDO, 5, &pmic5_nldo, NULL),
> +	RPMH_VREG("ldo7", LDO, 7, &pmic5_nldo, NULL),
> +	RPMH_VREG("ldo13", LDO, 13, &pmic5_nldo, NULL),
> +	RPMH_VREG("ldo16", LDO, 16, &pmic5_nldo, NULL),
> +	RPMH_VREG("ldo19", LDO, 19, &pmic5_pldo, NULL),
> +	RPMH_VREG("ldo23", LDO, 23, &pmic5_pldo, NULL),
> +	/*
> +	 * UFS VCC is selected at power-on (2.4 V or 2.96 V) according to
> +	 * the storage configuration. Preserve that selection and only vote
> +	 * enable and mode.
> +	 */
> +	RPMH_VREG("ldo24", LDO, 24, &pm6450_ldo_10ma_no_voltage, NULL),

[Severity: High]
Does leaving n_voltages unset on pm6450_ldo_10ma_no_voltage break UFS VCC
load-based mode switching and regulator registration when DT voltage
constraints are present?

pm6450_ldo_10ma_no_voltage sets hpm_min_load_uA and get_optimum_mode for
UFS load voting, but because n_voltages is 0, regulator_count_voltages()
returns -EINVAL and ufshcd_config_vreg() skips regulator_set_load():

drivers/ufs/core/ufshcd.c:ufshcd_config_vreg() {
	...
	if (regulator_count_voltages(vreg->reg) <=3D 0)
		return 0;

	return ufshcd_config_vreg_load(dev, vreg, on ? vreg->max_uA : 0);
}

In addition, rpmh_regulator_init_vreg() only populates rdesc.fixed_uV and
rdesc.n_voltages =3D 1 from DT constraints when regulator_type is XOB.  If a
DT node for ldo24 specifies regulator-min-microvolt and
regulator-max-microvolt, machine_constraints_voltage() calls
regulator_get_voltage_rdev(), which returns -EINVAL because
rpmh_regulator_vrm_no_voltage_ops has no voltage callbacks and fixed_uV is
0, failing rpmh_regulator_probe().

Using pmic5_pldo for ldo24 avoids both issues while still preserving the
power-on voltage read back by _rpmh_regulator_vrm_get_voltage() when the
DT node either omits microvolt constraints or specifies a range covering
2.4 V to 2.96 V.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-netrani-pm=
6450-v1-v1-0-1914da758d3d@krgm.moe?part=3D2
