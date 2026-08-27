Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311EB31B130
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833773; cv=none; b=mgnhRvN/KA2UuaeORR9UHF7kbpOBQIl8cUZEHqI4sRwz8YDfQpgW1p2PEL08+V+xN6bJpSUt19vTfml+9JRcEtj/KqUyQTX6FuIFYHD/73HPsfgXgCoPtn9xR+g43T1VlOLQbH1yPEmM/cHGCyobyTh8DGjKMkDKLKkU+scRC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833773; c=relaxed/simple;
	bh=T95gI0vuJBxRnKpZ+4KGub09s/CFdnEilwrNk1OeCFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f4HP3Ng9U477I8mlqGiIKfbjzPodKdY/4aYKpI7YXd889HkZDbCa13OnGtlFZ0zVBHAZP1BqGizxB+BRr1pCS8MyNS7Wj0y7b9Ekhll+dPWCvKPgJEdbPn4XYxXGaTOxk6eZNesCiWEEuV+VlPQoIIVy+up7+uht9T0UIEuCoI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Djx2ve1H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Djx2ve1H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5157C1F000E9;
	Thu, 27 Aug 2026 12:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833771;
	bh=51+010Zi2JKdaLta5+Xprszys/TaM4GdONMHOU1eXkc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Djx2ve1HwE1IPRqEbzphLy6Fp6H/Ww44ptnCZZup+V/Jm9Wqt3+lSlWEGZnOwsuXQ
	 VzV9dhQVeHOJPGeXX7MsQO5TuYiv6yjuSO2uBVFqPKcVPeH7+7cZ7xRLW3IkNvwBGA
	 pW0GGl77GY9SOu796I3fvimfLpKUI/CbknKvBPm6rcbJF3stwQXGlxCQ0ABsOQVN8Q
	 v8wKBXyxhBDxY1hgJzOFVRjkZ7ogxrBsDRlQUUYwH6cIr6oL0Ml2tP0ttRZVoo74ZF
	 6AJ0AHcInc5cZS4KFEtes+BcwM7mKWRHlM2Pdpu6xMLs08BovCvOOveY7ov19vm0xc
	 h5D5k6QZA9urg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] phy: airoha: add support for AN7583 Gen3 PCIe
 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260827122127.18874-3-ansuelsmth@gmail.com>
References: <20260827122127.18874-1-ansuelsmth@gmail.com>
 <20260827122127.18874-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 12:29:30 +0000
Message-Id: <20260827122931.5157C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing hardware state cleanup on error path in `an7583_pcie_phy=
_init()`.
--

commit 62d7cb2950076a9ff89670b2868f00bd58e5c43e
Author: Christian Marangi <ansuelsmth@gmail.com>

phy: airoha: add support for AN7583 Gen3 PCIe PHY driver
   =20
Add support for AN7583 PCIe PHY driver. This is required to make the
Gen3 PCIe port present on the Airoha AN7583 SoC correctly work.

> diff --git a/drivers/phy/airoha/phy-an7583-pcie.c b/drivers/phy/airoha/ph=
y-an7583-pcie.c
> new file mode 100644
> index 0000000000000..61b5f1dd64c07
> --- /dev/null
> +++ b/drivers/phy/airoha/phy-an7583-pcie.c
[ ... ]
> +static int an7583_pcie_phy_init(struct phy *phy)
> +{
> +	struct an7583_pcie_phy *pcie_phy =3D phy_get_drvdata(phy);
> +	u32 val;
> +	int ret;
> +
> +	/* Setup Tx-Rx detection time */
> +	val =3D FIELD_PREP(PCIE_XTP_RXDET_VCM_OFF_STB_T_SEL, 0x33) |
> +	      FIELD_PREP(PCIE_XTP_RXDET_EN_STB_T_SEL, 0x1) |
> +	      FIELD_PREP(PCIE_XTP_RXDET_FINISH_STB_T_SEL, 0x2) |
> +	      FIELD_PREP(PCIE_XTP_TXPD_TX_DATA_EN_DLY, 0x3) |
> +	      FIELD_PREP(PCIE_XTP_RXDET_LATCH_STB_T_SEL, 0x1);
> +	regmap_write(pcie_phy->xr_dtime, REG_PCIE_PEXTP_DIG_GLB44, val);
[ ... ]
> +	regmap_set_bits(pcie_phy->g3_pma, REG_SS_DA_XPON_PWDB_0,
> +			G3_PMA_DA_XPON_CDR_PR_PWDB);
> +
> +	usleep_range(100, 200);
> +
> +	ret =3D phy_init(pcie_phy->qp_phy);
> +	if (ret) {
> +		dev_err(pcie_phy->dev, "failed to initialize QP phy\n");
> +		return ret;

[Severity: Medium]
Does this error path need to unwind the hardware state changes made earlier=
 in
an7583_pcie_phy_init()?

If phy_init() fails, the PHY framework won't call the .exit callback because
init_count hasn't been incremented. This could leave hardware resources like
PLLs, LDOs, and clocks fully enabled and un-reset. Should there be a cleanup
sequence here or a call to a teardown helper?

> +	}
> +
> +	/* Wait for the PCIe PHY to complete initialization before returning */
> +	msleep(PHY_HW_INIT_TIME_MS);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827122127.1887=
4-1-ansuelsmth@gmail.com?part=3D2
