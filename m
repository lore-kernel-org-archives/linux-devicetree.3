Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2BE370D6E
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 18:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658149; cv=none; b=D1hzAy4ccExnqO49lbJVfvtVWgCFnIQDXgAanFMcHJ2lIf0U9LttJLXon/vrt2MajvntmkeBIDnMWuOvsTzOp+r27DG9gSCoX8vIctPkuKYrXDzPH+TTQWhsom5k11zM5S60sRgx8QrPsIy0MpDq5HsjSD1uKM/s/LKv7G3MOec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658149; c=relaxed/simple;
	bh=ZKmJTZqZQH5DadPQCFzmVltoM8wFzR0ZHhkJfJ7kTU4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gwemJkmp/C7p4DSyigldR0jYq63UqIvOBz1HNqvyilg2WDw7I7pJQFAADnadgDGP2F9i6Tn+d8k0J6szYNHeLozoQb9ng8Wxju4j1TRWggSrZv5u/FxLD23rD9GDxUVTAoHlR+cSbBJna7cr2xXu5gnfqku46lG4sk4GnqUkT2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUcg+xiK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUcg+xiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153F71F00893;
	Sat, 10 Oct 2026 18:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791658148;
	bh=lq9mZSR/pI6gVEr9gEYbBEd4cd6v2T6+p7R4+ktTYuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fUcg+xiKyfHjtv2EKKlM0IuiReqJ4C+KUp5yyUGTJy9i5ohkCKjT1jFRptom3KiNC
	 Z/rd9ProWSOCPsN9oePZnOsShKQwDcpfOq7q+2OvjoIS1Npub227qulx81iPjNqqTv
	 5iCKw08bIgx779pONHQBLTzVS4skmfJse69PoaB0bFYQIge+jUT1A5DvEr1X0BxLzL
	 z3v5e9wq9pcmKx8o91O/b3dku0XlyYjJy2bOrrbR7Cpb2CHkZwI/dmu8gmUcCuY3iq
	 b0HXPKYa62bB8Xnh4q0RfMrvSMDtzGl0Uj7pv7G4RW/KQSBdbWGwvsR7R6nTnCaWvY
	 DIDXzekgHFJhQ==
Message-ID: <sashiko-outbox-166839@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 11/12] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009182836.50631-12-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
 <20261009182836.50631-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:49:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: pcs: airoha: shared PCIe PLLs and resets modified concurrentl=
y without locking/refcounting
- [Medium] net: pcs: airoha: unhandled error return from airoha_pcs_setup_s=
cu
- [Medium] net: pcs: airoha: sticky AN bits not cleared on neg_mode change
--

commit 5c878701dd1e9963dbed8ef216ebecbde4bf9140
Author: Christian Marangi <ansuelsmth@gmail.com>

net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

This patch adds a PCS driver for the Airoha AN7581 SoC for
Ethernet/PON/PCIe/USB SERDES. It supports usage of external PHYs or
connected SFP cages across USXGMII, 10G-BASER, 2500BASE-X, 1000BASE-X,
and SGMII modes.

diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs/a=
iroha/pcs-airoha-common.c
--- a/drivers/net/pcs/airoha/pcs-airoha-common.c
+++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
@@ -131,6 +131,8 @@ static int airoha_pcs_setup_scu(struct airoha_pcs_priv =
*priv,
 		break;
 	}
=20
> 	ret =3D reset_control_bulk_assert(ARRAY_SIZE(priv->rsts),
> 					priv->rsts);

[Severity: High]
Could this unconditionally assert the global MAC and PHY resets during
individual port setup?

The driver supports dual-port PCIe setups (num_port =3D 2) which expose
two separate PCS ports to phylink. Since phylink manages each port
independently, if the first port is already active and passing traffic,
bringing up the second port will trigger airoha_pcs_pre_config(), which
calls airoha_pcs_setup_scu() and physically asserts these shared device-wide
resets. Would this instantly drop the active link on the first port?

[ ... ]

@@ -632,6 +632,9 @@ static int airoha_pcs_config(struct phylink_pcs *pcs, u=
nsigned int neg_mode,
 			AIROHA_PCS_HSGMII_PCS_TX_ENABLE |
 			AIROHA_PCS_HSGMII_PCS_MODE2_EN);
 	}
=20
> 	if (interface =3D=3D PHY_INTERFACE_MODE_1000BASEX &&
> 	    neg_mode !=3D PHYLINK_PCS_NEG_INBAND_ENABLED) {
> 		regmap_set_bits(maps->hsgmii_pcs, AIROHA_PCS_HSGMII_PCS_CTROL_1,
> 				AIROHA_PCS_SGMII_SEND_AN_ERR_EN);
>=20
> 		regmap_set_bits(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_FORC=
E_CL37,
> 				AIROHA_PCS_HSGMII_AN_FORCE_AN_DONE);
> 	}

[Severity: Medium]
Do these bits remain sticky if the neg_mode dynamically switches back
to inband enabled?

When PHY_INTERFACE_MODE_1000BASEX is active with out-of-band negotiation,
the driver sets AIROHA_PCS_SGMII_SEND_AN_ERR_EN and
AIROHA_PCS_HSGMII_AN_FORCE_AN_DONE. If the neg_mode later changes to
PHYLINK_PCS_NEG_INBAND_ENABLED (e.g., swapping an SFP module that doesn't
support AN with one that does, or changing ethtool settings) while the
interface remains 1000BASE-X, phylink invokes pcs_config directly.

Because there is no else branch to explicitly clear these bits, it seems
they might permanently bypass auto-negotiation and break link establishment
for the newly attached inband module.

[ ... ]

@@ -744,6 +744,8 @@ static void airoha_pcs_pre_config(struct phylink_pcs *p=
cs,
 	maps =3D &priv->maps[port->index];
=20
> 	/* Select HSGMII or USXGMII in SCU regs */
> 	airoha_pcs_setup_scu(priv, port->index, interface);

[Severity: Medium]
Is it intentional to ignore the return value from airoha_pcs_setup_scu() he=
re?

The helper airoha_pcs_setup_scu() successfully identifies and returns
an error code if reset_control_bulk_assert() or deassert() fails. If
the deassert fails, the hardware remains stuck in reset.

By discarding this return value, the initialization continues, which might
lead to bus hangs during subsequent register accesses or silent link failur=
es.
Could we at least log the failure via dev_err() to aid debugging, even
though this callback returns void?

[ ... ]

diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha/p=
cs-an7581.c
--- a/drivers/net/pcs/airoha/pcs-an7581.c
+++ b/drivers/net/pcs/airoha/pcs-an7581.c
@@ -348,6 +348,15 @@ static void an7581_pcs_jcpll_bringup(struct airoha_pcs=
_priv *priv,
 	default:
 		return;
 	}
=20
> 	/* This comment only apply to Serdes PCIe that expose
> 	 * 2 PCS.
> 	 *
> 	 * The Serdes PCIe expose 2 PCS but always require
> 	 * the PMA for the first PCS to be configured
> 	 * for correct functionality for JCPLL.
> 	 */
> 	pcs_pma =3D priv->pcs_pma[0];
>=20
> 	/* Setup LDO */
> 	usleep_range(200, 300);
>=20
> 	regmap_field_set_bits(pcs_ana_fields[AN7581_PCS_JCPLL_SPARE_L],
> 			      AIROHA_PCS_ANA_JCPLL_SPARE_L_LDO);
>=20
> 	/* Setup RSTB */
> 	regmap_field_write(pcs_ana_fields[AN7581_PCS_JCPLL_RST_DLY],
> 			   AIROHA_PCS_ANA_JCPLL_RST_DLY_150_200);
> 	regmap_field_write(pcs_ana_fields[AN7581_PCS_JCPLL_PLL_RSTB], 0x1);
>=20
> 	/* Enable PLL force selection and Force Disable */
> 	regmap_update_bits(pcs_pma, AIROHA_PCS_PMA_PXP_JCPLL_CKOUT_EN,
> 			   AIROHA_PCS_PMA_FORCE_SEL_DA_JCPLL_EN |
> 			   AIROHA_PCS_PMA_FORCE_DA_JCPLL_EN,
> 			   AIROHA_PCS_PMA_FORCE_SEL_DA_JCPLL_EN);

[Severity: High]
Could hardcoding pcs_pma[0] here disrupt the active link on port 0 when
bringing up port 1?

When the second port is dynamically linked up, an7581_pcs_jcpll_bringup()
and an7581_pcs_txpll_bringup() unconditionally disable and reconfigure the
shared PLLs via this hardcoded priv->pcs_pma[0] regmap. Concurrent
configuration lacks cross-port serialization or refcounting.

If port 0 is already active and passing traffic, would this force-disable
the shared PLLs and disrupt the data path on the first port?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009182836.5063=
1-1-ansuelsmth@gmail.com?part=3D11
