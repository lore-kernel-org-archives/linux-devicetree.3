Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0C93DAACE
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796930; cv=none; b=ckXuDbwi+xVxSkBOatlYJj2rqcJuHghoD3D/FWL2lByhuQXUs45A3NppmlNe9vpxMnjtpQm+L+otLtMIn2CIONu5KOvTUAR6j7VO77rDLJ3a4Ie2R7G2EslDI3q9L8kiTMj+/SXRkBgB3bmadrPxR9s1DNb4MiqBucFqFEmuT1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796930; c=relaxed/simple;
	bh=Wh+dUJV52gOIup9EYXqAwEFL6p5OjiX4Lns4kuHpM+A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jR2uHC6PJLPr+/qJu87KArqSrYvvefiV/nb/LHxuxGmQxOkmQf4tiIhvuumnVKsQc6Wa0VNG+sbvmOsw7MiAJXqs/Oy8bdf38JtmlEiv3wH8xh6iHzMNUjUAUQnc3WFB18VoQnfeNbC6FZtSRRNuct+eH6r3v0hnQKdccsw11qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrdR/mMI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrdR/mMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB5A1F000E9;
	Thu, 23 Jul 2026 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784796928;
	bh=zelCR9f91wMcWIs4UFZu3rdExrv6PFvk+rFRVkhuQ4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mrdR/mMIUW6jp/49rZtpdwO4szZLDkgx4+2eDz0V+xiP3B1wfSaxDK3/QFhD9dki6
	 rX715DvDEpht0wdy4Wpq/LyABFjwNz5lOmRzhIwxOnzsb5iaBDNGdyAP1niH3+oyAa
	 FD27cvmcI4LEPYLQvyy/ZcwzujCP7bCM/Ctg63NZ0aQu16vvUwf1REx2ysKkckLLB5
	 Ixk0XbXZAeb/UQQbKA+nCjtlFPT5/88RuyCV4XExkziuY2mmr/KTzJjj2ocA8qVkmI
	 sY9REcJw6NCFcC+aYif5q7bmBkT1bI9wjh7O1zr29dmRdKdxqVnIx7bmz1ul4dCSju
	 fbzDBkUfMb4sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] phy: add a driver for T-Head TH1520 USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, vkoul@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723084316.3573714-3-zhengxingda@iscas.ac.cn>
References: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
 <20260723084316.3573714-3-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 08:55:27 +0000
Message-Id: <20260723085527.BDB5A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing explicit inclusion of `<linux/delay.h>` for `udelay()`.
--

--- Patch [2]: [PATCH v2 2/2] phy: add a driver for T-Head TH1520 USB PHY -=
--
commit 0212e7cbab21327c62c749f25a7e96aa29c7d1a3
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

phy: add a driver for T-Head TH1520 USB PHY
   =20
The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
some PHY parameters exported as another system controller along with it.
This commit adds a driver configuring these parameters before letting the
PHY run, in addition to clock/reset/regulator management.

> diff --git a/drivers/phy/thead/phy-th1520-usb.c b/drivers/phy/thead/phy-t=
h1520-usb.c
> new file mode 100644
> index 0000000000000..802af72353a11
> --- /dev/null
> +++ b/drivers/phy/thead/phy-th1520-usb.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Institute of Software, Chinese Academy of Sciences=
 (ISCAS)
> + *
> + * Authors:
> + * Icenowy Zheng <zhengxingda@iscas.ac.cn>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>

[ ... ]

> +static int th1520_usb_phy_init(struct phy *phy)
> +{
> +	struct th1520_usb_phy *th1520_phy =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(th1520_phy->ref_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_assert(th1520_phy->phy_reset);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	/*
> +	 * Do some initial PHY setup:
> +	 * - Set COMMONONN to allow the PHY to automatically power down.
> +	 * - Set REF_SSP_EN to enable feeding reference clock to SuperSpeed
> +	 *   PHY clock PLL.
> +	 */
> +	regmap_set_bits(th1520_phy->regmap, USB_SYS, USB_SYS_COMMONONN);
> +	regmap_set_bits(th1520_phy->regmap, USB_SSP_EN, USB_SSP_EN_REF_SSP_EN);
> +
> +	ret =3D reset_control_deassert(th1520_phy->phy_reset);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	udelay(10);

[Severity: Low]
This isn't a bug, but this code uses udelay() without explicitly including
<linux/delay.h>.

While it currently compiles due to indirect inclusions, should the header be
explicitly included to prevent build failures if the include chain is later
refactored?

> +
> +	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084316.3573=
714-1-zhengxingda@iscas.ac.cn?part=3D2
