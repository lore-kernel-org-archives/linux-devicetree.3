Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4FE3BED76
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699543; cv=none; b=cZ/bM4lzRDZ4sjvp6d7cUrGtH0hguLklW8C3M9OoP9YamAqPZ+NtkC2/n0toZvuKxGOI68LEBkv1JrpD9gDjDMx+pDg6J2TaC/KtRJFeuBNZ+e80Qt2nMyKk4D+nnnRXxMdTBmthS03iaiJNVqOgn3Ty/v9ZBenuZaUxTv6LPjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699543; c=relaxed/simple;
	bh=tTH8NONTChM82m/DO1zeRlGkqjc0KyAS6AVoZvl/peo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pUHCjEDoA9tULSoIJiSX4y4eBNYERfTaiprinKawju2zadH/KwRyrNe2Wpoj5OQeRdgiRLT8/1UAGrHC8FdNEMP6znS+7NnTmUceVaZohdDfgD+FG5Ze0uWdwCRKUDlD+oO0aWR4f25Q6EDJexQ617/dXwdjPslt1mGm8nKBLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhRCnVWN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhRCnVWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3818E1F000E9;
	Wed, 17 Jun 2026 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781699542;
	bh=cvBZCD+ESZXuE0hqtc7yYxl9khsYkQUqRu69GHQbo9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nhRCnVWNxFW/vIkLzgOoLH8L7JneoCmav2faJv9FLjQZPbzXhFMpXfZ7wT1o8WyUg
	 9CEamXoSD0366pGEfeVf45IEwWd1bi8RKCr0abS8W8EPLeaqBhioldMXSsRJWbW/Fe
	 Hno3RUOEbiUy7MIhy2BHbfEtEv33ecUPl5I6UYX7ieu4CUNe+fYv/vsD9RTT/ErvIR
	 wgigJ3UHBA1HHdHnaX5XfrIoBkxbjTaCwvZqJwXmkKdYWuwBaSMLEHKd96COJPzROb
	 nSCdDBjTIdNpRwNoBmF/csW4zrODnZcQIKPoz4zoLdWvMNPdxZXiZcTQyPsMta96k/
	 UvWFl36qpqMdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] phy: rockchip: phy-rockchip-inno-csidphy: add clock
 lane phase tuning
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gerald Loacker" <gerald.loacker@wolfvision.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260617-feature-mipi-csi-dphy-4k60-v1-3-4611ff00b0ff@wolfvision.net>
References: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
 <20260617-feature-mipi-csi-dphy-4k60-v1-3-4611ff00b0ff@wolfvision.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 12:32:21 +0000
Message-Id: <20260617123222.3818E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The macro `CSIDPHY_CLK_PHASE_DEFAULT` is defined but never used.
--

commit bfbb498bdd0c6aad9c80d6fe31b34f8a03261c76
Author: Gerald Loacker <gerald.loacker@wolfvision.net>

phy: rockchip: phy-rockchip-inno-csidphy: add clock lane phase tuning

This commit adds support for parsing and applying the optional
'rockchip,clk-lane-phase' device tree property. It allows for board-specific
tuning of the clock lane sampling phase. If the property is absent, the dri=
ver
relies on the hardware default without actively writing to the register.

> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/p=
hy/rockchip/phy-rockchip-inno-csidphy.c
> index 5281f8dea0ad3..3a15840e86cad 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -69,6 +69,10 @@
>  #define RK1808_CSIDPHY_CLK_CALIB_EN		0x168
>  #define RK3568_CSIDPHY_CLK_CALIB_EN		0x168
> =20
> +#define CSIDPHY_LANE_CLK_3_PHASE		0x38
> +#define CSIDPHY_CLK_PHASE_MASK			GENMASK(6, 4)
> +#define CSIDPHY_CLK_PHASE_DEFAULT		3

[Severity: Low]
This isn't a bug, but it looks like CSIDPHY_CLK_PHASE_DEFAULT is defined
here but never actually used in the driver code.

Since the fallback logic correctly relies on leaving the hardware at its
default state when the device tree property is missing (by initializing
clk_phase to -1), could this unused macro be removed to avoid keeping
dead code around?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-feature-mi=
pi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net?part=3D3
