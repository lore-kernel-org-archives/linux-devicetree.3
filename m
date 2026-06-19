Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA54223E320
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781861179; cv=none; b=TPgwE+B5EIgLetZvBIpm1k7wC+ok5YmkpSRpaoO1o7E1gLtdJ30jiGlPAzJ1gNnFLhHNCloteRnynUjsT1iMWI64UKP0F4LwyRgIjC+GqSaYFJiUZBod8RmMFtfQJdRBM9eYcLT8mBV/io17Y7Z7F/uhxReN0qz05R1FBQdckOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781861179; c=relaxed/simple;
	bh=ZRwOxmLghH+92+bH+15sYinnHRNf/pc7l9zM/e9bNDg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T/PDSAv4FwLlnYNdJgDf1aRUcBSHAnBVUWkCIkOo4P/XNEvE6/+IpXIjauv3QEafhGR/yNyaxd9BgFCNYcr+O3fDxDQVULWNcAWOaBTt1isVYUPBFRwmmXPCoLTzOjMFnBRpdj90+ydZ9szPlWgw9nBfTQUa3fPu3RABGPXWf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNdSu98C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNdSu98C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084AF1F000E9;
	Fri, 19 Jun 2026 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781861178;
	bh=+P5p9k72S8q+YTzkrLgiEcs+pVCG5sNbfVoh3h/B56c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jNdSu98C1x0HvIJSeJ26o++JVVgWwxLIgJTZg1NnFWadxjNEBeE0AR+F11T39sdIl
	 OM1OEXkEknmql6qQIsm4CzlJ3S7zH1a98+CyG0dbBFphYIagF0VoyY2XpNsHMLwvaW
	 +JhigQ3+JwUyQF2/hGhzTnLctLCp4CbeK728MjU339js2Pk4vnIYXJDk1bxwljYCFv
	 tZwUf80VJeZKRfvmOFN1JF6iTSVo/emNmVBmq0PEnPWX8wMLWwkeNr6ztpCkiW5gaX
	 FVJ4p2pxfbWPp7ue+BmLjNb6nn5gAI+nz+KmEVEntvHrbAm1Gng0mUqn3pl3n3Czba
	 pBn5CP59M/7yQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] phy: rockchip: phy-rockchip-inno-csidphy: add
 clock lane phase tuning
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gerald Loacker" <gerald.loacker@wolfvision.net>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260619-feature-mipi-csi-dphy-4k60-v2-3-323356c2cc2e@wolfvision.net>
References: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
 <20260619-feature-mipi-csi-dphy-4k60-v2-3-323356c2cc2e@wolfvision.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 09:26:17 +0000
Message-Id: <20260619092618.084AF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The macro `CSIDPHY_CLK_PHASE_DEFAULT` is defined but never used.
--

commit 47571c2082c0165537db96312865f3a9805e768d
Author: Gerald Loacker <gerald.loacker@wolfvision.net>

phy: rockchip: phy-rockchip-inno-csidphy: add clock lane phase tuning

This commit adds support for parsing the 'rockchip,clk-lane-phase' device
tree property to adjust the clock lane sampling phase. It enables
board-specific tuning to optimize link stability at high data rates, falling
back to hardware defaults if the property is absent.

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
Is this macro intended to be used somewhere?=20

It appears to be defined but never used, since the driver falls back to the
hardware default by initializing priv->clk_phase to -1 in
rockchip_inno_csidphy_probe() and conditionally skipping the register write=
 in
rockchip_inno_csidphy_power_on():

	if (priv->clk_phase >=3D 0) {
		val =3D readl(priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
		...
	}

Can CSIDPHY_CLK_PHASE_DEFAULT be safely removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-feature-mi=
pi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net?part=3D3
