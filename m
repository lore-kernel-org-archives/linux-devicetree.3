Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FDF331EB2
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696604; cv=none; b=ACARVID9ThlqpMlBk7SykBFVIN4UcsHk+QXQD+vPauAAIQzmVZUi+xnZBdzhKWhAHjbrq0NxtA7jEf8/q2oiDG8Z01t5xjiRV91v3fVRkJn2EVz/zZe04emXFOAt2BZAYetmiL44GAcZt65lnzdlYiJBiQD+zIxzcboB51rJ4I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696604; c=relaxed/simple;
	bh=acK8Y0TTqcQgT4g3TDQyyoCVMyHayTv2gi2QdwHNa1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b29QqpasyptzrvDF0sJKZQ4GI4OWi6D16aJXETy6laG8qp73BpfvzqxPVgkuBbM+nZB3XQPRkoPAE0m6Q0fHqwvW2gUZGhiEBhG/NIYdBNwMYDNwubFIx74g+reKbuJJtwJb6nq6Bxuo2CGt8f4d72XD+ehlPgMTbqqh+KHJk6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+81h5yj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+81h5yj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98861F00A3F;
	Fri, 14 Aug 2026 08:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786696597;
	bh=nfIwmpbwdRHFH0k6WHw4ciDfPFLD0l7FwXDQKKFq0p8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C+81h5yjdPOKwxzczxW12y6BkwFPqiiT4xxNNJRue4QLBXBZ16itEDPw9AsAxJ/6/
	 fLyYmxSbNO6IHPWy10MdqRjMH3c8XDt6jDJ8co9G/xgf8eoKFVPtpvEx7ttEi8tvlE
	 vo5VDbquSlE/R1DcE5rNm3dT6ZiVgac0HY291wH7i2xbTFvM9lMJROGAPRIrNs2hXJ
	 ylgp+Pbl2tAWE9V/8/YzOo+Xo7augbUDg0jNIeTOaJaIvZenBJc2s+ra3QA3Qr48JW
	 cyFFFvVeDtJxZn9QZ6laSbzdjnR4qmX9aBV7C+qmEdcL+NFZHh9gqlI598neG1bZRD
	 3s1iOkwz+Jiog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 11/12] net: pcs: airoha: add PCS driver for Airoha
 AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813083536.970196-12-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
 <20260813083536.970196-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:36:36 +0000
Message-Id: <20260814083636.A98861F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unprotected re-initialization of shared resources (PLLs and global=
 resets) during per-port bringup disrupts active ports.
- [Medium] State retention across dynamic interface switching due to asymme=
tric register configuration.
- [Medium] Read-modify-write on write-1-to-clear (W1C) interrupt status reg=
isters inadvertently clears unintended pending interrupts.
- [Medium] Missing delay between asserting and deasserting reset controls.
- [Medium] Tight hardware polling loop for RX signal detection lacks a dela=
y, risking false negatives.
- [Low] Unresolved FIXME comments and typographical errors indicate incompl=
ete validation.
--

--- Patch [11]: [PATCH v14 11/12] net: pcs: airoha: add PCS driver for Airo=
ha AN7581 SoC ---
commit 3d0ad7799a7613a55a29a2070766d339f6c58307
Author: Christian Marangi <ansuelsmth@gmail.com>

    net: pcs: airoha: add PCS driver for Airoha AN7581 SoC

This commit adds a PCS driver for the Airoha AN7581 SoC for Ethernet, PON,
PCIe, and USB SERDES. It registers the needed registers and acts as a PCS
provider for phylink usage.

> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> new file mode 100644
> index 0000000000000..d9ec0e97b746a
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
> @@ -131,10 +131,10 @@ static int airoha_pcs_setup_scu(struct airoha_pcs_p=
riv *priv,
>  		break;
>  	}
> =20
>  	ret =3D reset_control_bulk_assert(ARRAY_SIZE(priv->rsts),
>  					priv->rsts);
>  	if (ret)
>  		return ret;
> =20
>  	ret =3D reset_control_bulk_deassert(ARRAY_SIZE(priv->rsts),
>  					  priv->rsts);

[Severity: High]
Since this function is called per-port during airoha_pcs_pre_config(), will
asserting these global bulk resets disrupt an already active port (like the
other port on the 2-port PCIe SerDes)?

[Severity: Medium]
Does this sequence need a delay between asserting and deasserting the reset
controls?

Hardware blocks often require a minimum reset hold time to cleanly reset th=
eir
state machines.

[ ... ]

> @@ -272,4 +272,4 @@ static void airoha_pcs_interrupt_init_usxgmii(struct =
airoha_pcs_priv *priv,
>  	/* Interrupt saddly seems to be not weel supported for Link Down.
>  	 * PCS Poll is a must to correctly read and react on Cable Deatch

[Severity: Low]
There are a few typos in this comment ("saddly", "weel", "Deatch"). Could
they be fixed for clarity?

[ ... ]

> @@ -278,9 +278,9 @@ static void airoha_pcs_interrupt_init_usxgmii(struct =
airoha_pcs_priv *priv,
>  	regmap_clear_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_CTRL_4,
>  			  AIROHA_PCS_USXGMII_LINK_DOWN_ST_INT_EN);
> =20
>  	/* Clear any pending interrupt */
>  	regmap_set_bits(maps->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_INT_STA_2,
>  			AIROHA_PCS_USXGMII_RPCS_FSM_DEC_ERR_INT |
>  			AIROHA_PCS_USXGMII_R_TYPE_E_INT |
>  			AIROHA_PCS_USXGMII_R_TYPE_T_INT |
>  			AIROHA_PCS_USXGMII_R_TYPE_D_INT);

[Severity: Medium]
Are these interrupt status registers write-1-to-clear (W1C)?

If so, using regmap_set_bits() performs a read-modify-write. Any currently
pending interrupts read as 1s will be written back as 1s, which could
unintentionally clear all pending interrupts rather than just the ones
specified in the mask.

[ ... ]

> @@ -568,6 +568,6 @@ static int airoha_pcs_config(struct phylink_pcs *pcs,=
 unsigned int neg_mode,
>  	if (interface =3D=3D PHY_INTERFACE_MODE_1000BASEX &&
>  	    neg_mode !=3D PHYLINK_PCS_NEG_INBAND_ENABLED) {
>  		regmap_set_bits(maps->hsgmii_pcs, AIROHA_PCS_HSGMII_PCS_CTROL_1,
>  				AIROHA_PCS_SGMII_SEND_AN_ERR_EN);
> =20
>  		regmap_set_bits(maps->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_FOR=
CE_CL37,
>  				AIROHA_PCS_HSGMII_AN_FORCE_AN_DONE);
>  	}

[Severity: Medium]
Will these bits remain set if the port is later dynamically reconfigured to
a different interface mode (e.g. switching to SGMII or 1000BASEX with
inband negotiation enabled)?

It appears there is no logic to clear these bits if they were previously
set, which could break the link upon changing modes.

> diff --git a/drivers/net/pcs/airoha/pcs-an7581.c b/drivers/net/pcs/airoha=
/pcs-an7581.c
> new file mode 100644
> index 0000000000000..bba4a5164a4e2
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-an7581.c
> @@ -255,5 +255,5 @@ static void an7581_pcs_jcpll_bringup(struct airoha_pc=
s_priv *priv,
>  	/* This comment only apply to Serdes PCIe that expose
>  	 * 2 PCS.
>  	 *
>  	 * The Serdes PCIe expose 2 PCS but always require
>  	 * the PMA for the first PCS to be configured
>  	 * for correct functionality for JCPLL.
>  	 */
>  	pcs_pma =3D priv->pcs_pma[0];

[Severity: High]
Since pcs_pma[0] is hardcoded here and the JCPLL is shared, will bringing
up a secondary port dynamically disable and restart the shared JCPLL,
causing a disruption on the active first port?

[ ... ]

> @@ -643,2 +643,2 @@ static void an7581_pcs_rx_bringup(struct airoha_pcs_p=
riv *priv,
> =20
>  	/* FIXME: Warn and Ask Airoha about typo in air_eth_xsgmii.c line 1391 =
*/
>  	/* AIROHA_PCS_ANA_REV_1_FE_BUF1_BIAS_CTRL is set 0x0 in SDK but seems a=
 typo */

[Severity: Low]
Is this FIXME intended to be resolved before merging?

It might be best to verify this hardware assumption with the vendor to
ensure it won't hide any bugs.

[ ... ]

> @@ -2072,6 +2072,6 @@ static bool an7581_pcs_have_rx_signal(struct airoha=
_pcs_priv *priv, int index)
>  	regmap_write(pcs_pma, AIROHA_PCS_PMA_DIG_RESERVE_0,
>  		     AIROHA_PCS_TRIGGER_RX_SIDGET_SCAN);
> =20
>  	/* Scan 6 times for RX sigdet module to detect RX signal */
>  	for (i =3D 0; i < AIROHA_PCS_MAX_RX_SIGDET_TRY; i++) {
>  		regmap_read(pcs_pma, AIROHA_PCS_PMA_DIG_RO_RESERVE_2,
>  			    &val);
>  		if (val & AIROHA_PCS_RX_SIGDET)
>  			count++;
>  	}

[Severity: Medium]
Does this tight polling loop need a delay (such as usleep_range())?

Currently, the CPU will execute these reads across the MMIO bus very rapidl=
y.
Since analog circuitry typically requires settling time to assert signal
detection, might this lead to false negatives?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813083536.9701=
96-1-ansuelsmth@gmail.com?part=3D11
