Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE053ACEF9
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459579; cv=none; b=cSUsqjpQI2AEUcXInEm3T3T06bYVvbo5LVoM841U5V1y6Irgdf5PRy2nd/gTV4fINGbdQLhkHpb1E1syohDSHjL/kRHfRZhDyKvpeQGc5lTpt426DMopNmXd8WBEM9dKm4aArZkFBMGkkIwHZSNZt62FnDBFpoYYye7W0CLsDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459579; c=relaxed/simple;
	bh=ZBS/b90L0keqYfOnhlmEu2C4o4EF6lGnq1y/3O5sTNM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mcWocdXShCkp531nCwjLUv7PVF3HX+LVuHp+Pozg+s3AbgGqH6PytwalQFLizte6u0TkzayWMbjp9eGpUpf7ZVa4rK+IQ/FSG6Hk00LnfaqKOlK71aydnfQeEeiqNj6kCegnSJ6NiJ7I2E7zYY6SarNGCNiSA60xrlvUmiJ7ZBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWD0ha+I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWD0ha+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09E21F000FF;
	Thu,  8 Oct 2026 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791459578;
	bh=MEQ/WGt30g3uE836dXb/ot0HcFGDv/bs7yWpwc7rEow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HWD0ha+IegfdYhFmuy2rzUEqcaXQXf5QiBo0iEwLisVoLqlOKCnPbiBAK/Rzw8oT/
	 dNoZGg4IXe1NxUV4oCuwES1tL1D8MSQfaWJTT+DjKpYetAn6zp94LNnYmfekJx1u3d
	 ZkNsq2ofestTRkMVsXdDo5W627xn8ZXkTGJYNOpec8e3T/E3X0RarggocaojA0fwkg
	 eOGJ/6RaDXGxJQM+7sSGroZECyoZrF/TgNatNR81C1s8MhV9LX2N6qWO/3v3hJNQgY
	 esITsreCOD8k4K19DIrZ79g1YyRJ100Cj3JFU5DRjX4aYVyT7DYc3xUqXCk/Q++lse
	 AU6t7A1G7w3vg==
Message-ID: <sashiko-outbox-164098@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] phy: aspeed: Add ASPEED PCIe PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261008-aspeed_pcie_phy-v1-2-96764937aef0@aspeedtech.com>
References: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
 <20261008-aspeed_pcie_phy-v1-2-96764937aef0@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 11:39:37 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] phy: aspeed: Destructive overwrite of PEHR_GLOBAL and PEHR_MISC_=
5C registers
- [Low] build: missing <linux/bitfield.h> and <linux/io.h> causes COMPILE_T=
EST failures
--

commit d6c687af08f52ce8c5106883a0ada373528fe1b8
Author: Jacky Chou <jacky_chou@aspeedtech.com>

phy: aspeed: Add ASPEED PCIe PHY driver

This commit introduces the Aspeed PCIe PHY controller driver for
AST2600/2700 platforms. It adds Kconfig and Makefile changes alongside
the main driver code implementing PHY operations.

> diff --git a/drivers/phy/aspeed/phy-aspeed-pcie.c b/drivers/phy/aspeed/ph=
y-aspeed-pcie.c
> new file mode 100644
> index 0000000000000..eb300887b6441
> --- /dev/null
> +++ b/drivers/phy/aspeed/phy-aspeed-pcie.c
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 Aspeed Technology Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/phy/pcie.h>
> +#include <linux/phy/phy.h>

[Severity: Low]
Can this cause build failures when COMPILE_TEST is enabled on architectures
that do not implicitly include <linux/bitfield.h> and <linux/io.h>?

The FIELD_PREP, FIELD_MODIFY, readl, and writel macros and functions are
used throughout this file, but their headers are not explicitly included.

[ ... ]
> +static int ast2600_phy_set_mode(struct phy *phy, enum phy_mode mode,
> +				int submode)
> +{
> +	struct aspeed_pcie_phy *pcie_phy =3D phy_get_drvdata(phy);
> +
> +	switch (submode) {
> +	case PHY_MODE_PCIE_RC:
> +		writel(AST2600_PORT_TYPE(0x3), pcie_phy->reg + PEHR_GLOBAL);

[Severity: Medium]
Could this write unintentionally clear other configuration bits in PEHR_GLO=
BAL?
It overwrites the entire register instead of performing a read-modify-write
operation.

> +		break;
> +	default:
> +		dev_err(&phy->dev, "Unsupported submode %d\n", submode);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

[ ... ]
> +static int ast2700_phy_set_mode(struct phy *phy, enum phy_mode mode,
> +				int submode)
> +{
> +	struct aspeed_pcie_phy *pcie_phy =3D phy_get_drvdata(phy);
> +	u32 cfg_val;
> +
> +	switch (submode) {
> +	case PHY_MODE_PCIE_RC:
> +		writel(0, pcie_phy->reg + PEHR_MISC_278);
> +		writel(SEL_INTERNAL_RESET, pcie_phy->reg + PEHR_MISC_280);
> +		writel(POSTED_DATA_CREDITS(0xc0) | POSTED_HEADER_CREDITS(0xa),
> +		       pcie_phy->reg + PEHR_MISC_70);
> +		writel(COMPLETION_DATA_CREDITS(0x30) | COMPLETION_HEADER_CREDITS(0x8),
> +		       pcie_phy->reg + PEHR_MISC_78);
> +		writel(LOCAL_SCALE_SUP, pcie_phy->reg + PEHR_MISC_58);
> +		writel(CONFIG_RC_DEVICE, pcie_phy->reg + PEHR_MISC_5C);

[Severity: Medium]
Does writing CONFIG_RC_DEVICE directly to PEHR_MISC_5C risk zeroing out oth=
er
bits in this register?

A read-modify-write pattern might be needed here, similar to how PEHR_MISC_=
60
is handled just below this.

> +		cfg_val =3D readl(pcie_phy->reg + PEHR_MISC_60);
> +		FIELD_MODIFY(AST2700_PORT_TYPE_MASK, &cfg_val,
> +			     PORT_TYPE_ROOT);
> +		writel(cfg_val, pcie_phy->reg + PEHR_MISC_60);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-aspeed_pci=
e_phy-v1-0-96764937aef0@aspeedtech.com?part=3D2
