Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491783DD523
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011752; cv=none; b=Y1xkUoh52T5MR5h1ZdgWvvtTFYpGgBsxfl81SLfjhV3pgWx133lTa0pv72Uf+53jkN6cChHs1/OyYwlOe3kl8cankUG0hTLmDKhv+r/wwajZKCojs9L4VzfyvovB49mdruZb6KKrw3ongS3wudgXf4CWmdsKZbAqRDHX25K720A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011752; c=relaxed/simple;
	bh=zUgyu1PPcq8zGbhy/enfIp6unX2fRNPURswqi0UFfOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WPCj1tIFZ1K7Rw6X8BL31/peDFz05TEJf2YRxsCzvyCFkxUVADUi8MKP5kuNiFUiMSFIhx+9N40Ane+e6pmz9ZUma21Fm/iJ755vV7Ip3D+6JXMD98mOHMkKwMnzfCaDx7WveoLtXfsVCe61QTOPnLHzcpLS8BGAQ8EGlfZsaFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grF5yu4Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grF5yu4Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CB11F000E9;
	Tue, 14 Jul 2026 06:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784011751;
	bh=e2vrEhUN78zzgXo+gMbi4YwjjemjNnEjirBlOXP0sss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=grF5yu4ZHT3y5/IMCXqGdq11CepUixV/c7zdbPE7gwDXU+PRXLzRLpMmaXZifgyZR
	 n+fK3YHp6Cm5FGqD4tIPuHwAQ8eFiCrh6EyBlhb7MryWmSJ+/gDePmc/wHzpYdT5Cm
	 orc/hd/hgIuzNjwRdHP9K0brm474aRYLV8ZX5tn2MTCcmH6M0b0QtdW0iu5awOgcib
	 v/7FZcR2qYiI/tkpe6B0zpoqhwbDh5m6YFeWe4+b9u6DDH4BS/0K7KwdaSrtGDbQvv
	 92ZK3WcPymHozY/acMjBpsEEp+TT+v7Tyl32aOx0gDNuQZUjv4nV1/4nw8rM/baHkB
	 iFMZosARVZMCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] phy: qcom: qmp-combo: Add serdes and
 RBR/HBR/HBR2/HBR3 tables for v1 DP PLLs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-sm8475-bup-v1-5-b2871be2b4ec@proton.me>
References: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
 <20260714-sm8475-bup-v1-5-b2871be2b4ec@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 06:49:10 +0000
Message-Id: <20260714064910.A9CB11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly introduced v1 DP PLL configuration tables are declared as=
 static const but never referenced, leading to compiler warnings and breaki=
ng strict builds (-Werror).
--

--- Patch [5]: [PATCH 5/6] phy: qcom: qmp-combo: Add serdes and RBR/HBR/HBR=
2/HBR3 tables for v1 DP PLLs ---
commit e4414eef7407c61ff8a26f53b835396525b0a343
Author: Esteban Urrutia <esteuwu@proton.me>

phy: qcom: qmp-combo: Add serdes and RBR/HBR/HBR2/HBR3 tables for v1 DP PLLs

This commit introduces serdes and rate-specific tables for v1 DP PLLs to
support SM8475. It also renames existing v1.1 tables and updates several
PHY configurations to use them.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index cdcfad2e86b1d..8c09d4c1594d0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -1337,7 +1337,30 @@ static const struct qmp_phy_init_tbl qmp_v5_5nm_dp=
_tx_tbl[] =3D {
>  	QMP_PHY_INIT_CFG(QSERDES_V5_5NM_TX_TX_BAND, 0x01),
>  };
> =20
> -static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl[] =3D {
> +static const struct qmp_phy_init_tbl qmp_v6_dp_v1_serdes_tbl[] =3D {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SVS_MODE_CLK_SEL, 0x15),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x3b),

[Severity: Low]
Are these new v1 tables referenced anywhere in this patch?

They are declared as static const, but appear to be unreferenced. Could this
regression cause -Wunused-const-variable compiler warnings and break builds
that use CONFIG_WERROR=3Dy?

[ ... ]

> @@ -1471,7 +1494,55 @@ static const struct qmp_phy_init_tbl qmp_v8_n3p_dp=
_tx_tbl[] =3D {
>  	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_POST_CAL_OFFSET, 0x10),
>  };
> =20
> -static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_rbr[] =3D {
> +static const struct qmp_phy_init_tbl qmp_v6_dp_v1_serdes_tbl_rbr[] =3D {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x69),

[Severity: Low]
Does this rate-specific v1 table for RBR also need a reference to avoid
the unused variable warning?

[ ... ]

> +static const struct qmp_phy_init_tbl qmp_v6_dp_v1_serdes_tbl_hbr[] =3D {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x69),

[Severity: Low]
Is this HBR table missing a reference in the configurations below?

[ ... ]

> +static const struct qmp_phy_init_tbl qmp_v6_dp_v1_serdes_tbl_hbr2[] =3D {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x8c),

[Severity: Low]
Would leaving this HBR2 table unreferenced trigger the same compiler
warning?

[ ... ]

> +static const struct qmp_phy_init_tbl qmp_v6_dp_v1_serdes_tbl_hbr3[] =3D {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x69),

[Severity: Low]
Should this HBR3 table be hooked up to the PHY config struct so the compiler
doesn't complain about unused variables?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-sm8475-bup=
-v1-0-b2871be2b4ec@proton.me?part=3D5
