Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26601A6807
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 02:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783045171; cv=none; b=BkR0itjmv7WXozAviOXT1nTvl0NX9DRtXynzPb4QEaBZ6sIVEZCjBzKrDJQsZU+6OdkEQv+Xvi3cg5g0qf+UZ3fqBLqP8N/qitJ4K0YDHbKt/Phd1V2Mw3FqCziJe+nnvO4KuCsQyIIA3i/VY8zo41BO6aCUJdRupniHKy+zfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783045171; c=relaxed/simple;
	bh=A5UB+zfJpqoFIlFiOxNT5HHJGE0vApDU4cQWun9zmxU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KE26eUOJUuerKOG4BsYeuS0WdTKDlPSNYOqIndbePVA7GI7LdxJlQbR+3FjO0N7WnHjNJEKflrr2tF3HRrD+1+d+M9+fMt4vI2WRMjz4d+0JBpcVb3gAHbOLduyalzJmK2C5+WCrJtiP3Pf/uFZyGQwsNxJBAlnkiQAhw/El58g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4HDhLZ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4HDhLZ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FDE1F000E9;
	Fri,  3 Jul 2026 02:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783045169;
	bh=e/2DwmU/5HSO+Y894+CZGCYgyJVpUbj2IYV0rU5OwIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4HDhLZ0S9CX2E6w3ZMv95IT+bnFNZOCwifhQIwZfFOZ9E0e/oTS7i+KtWOO5IDWL
	 VT48OLV7h+wtiqvgnMOSTKd3K2Am3YJ4dzZLuUqIHLoyeulyBrsnK0Xa6cpYYqBtUL
	 nk3gGQkLZWvugrIwQLZuTcGd56vRFVyjEGyRQu0kIOtHpfj1+fCXMUkEot8WVDM7US
	 bjssmNScg0u/FZfCPaxgn2Wj84tdqwp4u0siz8CdjVkSldqjdGD6nK7T6t69q4PWXP
	 E0JkK6U234PnxRrTdbFL+e30k3s4TA974MkW+vFRDAwb1iVUfeARdq5PjeWcwRodV2
	 zpchN2lkvfRNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] phy: spacemit: Add USB3/PCIe comb PHY driver for
 Spacemit K3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703021024.495433-3-inochiama@gmail.com>
References: <20260703021024.495433-1-inochiama@gmail.com>
 <20260703021024.495433-3-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 02:19:28 +0000
Message-Id: <20260703021929.15FDE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware register clobbering due to missing read-modify-write oper=
ations in PHY initialization.
--

commit c71cb5c4ebfcb4fc5aff5c18a7769949e15dae55
Author: Inochi Amaoto <inochiama@gmail.com>

phy: spacemit: Add USB3/PCIe comb PHY driver for Spacemit K3

Adds a USB3/PCIe comb PHY driver for Spacemit K3. The comb PHY requires
configuring a syscon device for the correct mux configuration and needs
calibration before usage.

> diff --git a/drivers/phy/spacemit/phy-k3-common.c b/drivers/phy/spacemit/=
phy-k3-common.c
> new file mode 100644
> index 0000000000000..0b289e63db999
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k3-common.c

[ ... ]

> +	/* Power down 100MHz refclk buffer */
> +	val =3D readl(base + PHY_PU_CK_REG);
> +	val =3D u32_replace_bits(val, 0, PHY_PU_REFCLK_100);
> +	writel(val, base + PHY_PU_CK_REG);
> +
> +	/* Program PLL REG1 configure the SSC */
> +	val =3D FIELD_PREP(PHY_PLL_SSC_MODE, PHY_PLL_SSC_MODE_DOWN_SPREAD1) |
> +	      FIELD_PREP(PHY_PLL_SSC_DEP_SEL, PHY_PLL_SSC_5000PPM) |
> +	      FIELD_PREP(PHY_PLL_FREF_SEL, PHY_PLL_FREF_24M);
> +	writel(val, base + PHY_PLL_REG1);

[Severity: High]
Does this completely overwrite PHY_PLL_REG1 and zero out unspecified bits?

Unlike the PCIe initialization path which uses a read-modify-write for this
register, this direct writel() in k3_usb3phy_init_single() clobbers the
entire register. Could this cause important default settings or calibration
values to be lost?

[ ... ]

> +	for (i =3D 0; i < lg->data->lanes; i++) {
> +		void __iomem *lane_base =3D lg->base + lg->data->offsets[i];
> +
> +		val =3D readl(lane_base + PCIE_RX_REG1);
> +		val =3D u32_replace_bits(val, 0, 0x3);
> +		writel(val, lane_base + PCIE_RX_REG1);
> +	}
> +
> +	val =3D readl(phy_base + PHY_PLL_REG2);
> +	val |=3D BIT(20);
> +	writel(val, phy_base + PHY_PLL_REG2);
> +
> +	/* The write is needed as clock requires renegotiation */
> +	val =3D FIELD_PREP(PCIE_RX_REFCLK_MODE, PCIE_RX_REFCLK_MODE_DRIVER) |
> +	      PCIE_RX_SEL_TRI_CODE |
> +	      FIELD_PREP(PCIE_RX_LEGACY, PCIE_RX_LEGACY_DEFAULT);
> +	writel(val, phy_base + PCIE_RX_REG1);

[Severity: High]
Does this clobber the entire PCIE_RX_REG1 register for lane 0?

The preceding loop performs a read-modify-write on PCIE_RX_REG1 for all lan=
es,
but this direct writel() on phy_base (which points to lane 0) invalidates
that previous work and zeroes out any bits not explicitly set here.

Should this also use a read-modify-write operation to preserve the register
state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703021024.4954=
33-1-inochiama@gmail.com?part=3D2
