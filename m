Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FFC22D4C3
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101826; cv=none; b=pDN4CxoAaR7R6ldUvuwlLiJdd1IHzcnKT9vYCoCbsLNNIFIR6sYLxK8iwRVl19twfSrcX9/6CcYPPiT+7euhtHawP9fzxru2j9+pAcggHcjCZudEexlJBZ+7x3epHYTDE2T/2hNxXZAjkDb4hZokiHwMihQgIup8IfQO0ZJCUnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101826; c=relaxed/simple;
	bh=5qDBXej+iNq48Gfd7TeZ8qpad3PRmrWJUeHJS68aU/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fSPIiZ/h/dxClKgq5mlP4eXHFDpqfUefDsv6VItkPHUfxBrJ1EoelxzLI4VyZ7uB35jDCxRELvj9khyT/OxyYhpxFkJ72B4KPHrrNJuKW5UW3btHZN5q9El6a4IWbAbFmq+lsIRx0812Bu1Us+sGNuoc2q0ifubIAfrl71Ikv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU1KscPW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU1KscPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F69F1F00898;
	Sat, 30 May 2026 00:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101825;
	bh=mBsIL4UzBvtHduJunnTjOZToHBtDUBi2Sl4txPuKlCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eU1KscPWe5shXh6+K/fRRlirSUCDCl1BE3xShsYSWqR5vttg3Af2uhNC41msEOL7n
	 SXjUvsDacjlrK29xhRLfckr1NgxZgxiJXzXT96axZNMZQh40UqcTDHm2xdGJwgJB7K
	 Ez+cHR2BAwI2koM5kFHoA3hT6L6aHMZVRzdblkY2xlkB+VI9N50GFgJWv03RVVGugq
	 tDI3gUZJ15P0YZxQQ0KFxsr8mA6awWbnzecbi70Yf53oON21vbHOYml54yJYQ9uQYp
	 lulXxd40Z0WP49nqjANJuX+P/sMqPe3id3Iz8wWnKhAhc6ly0M3HG5N0T0bJtP1eK0
	 fw/licLFtpWcg==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v4 3/5] dt-bindings: net: starfive,jh7110-dwmac: Add
 jhb100 sgmii rx clk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519101436.111476-4-minda.chen@starfivetech.com>
References: <20260519101436.111476-4-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:43:44 +0000
Message-Id: <20260530004345.1F69F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Relaxed dt-binding schema for older generations allows invalid c=
onfigurations to pass validation.
--

commit f6b7d4c26e8b69a59239f5f0ceb9244961ac4979
Author: Minda Chen <minda.chen@starfivetech.com>

dt-bindings: net: starfive,jh7110-dwmac: Add jhb100 sgmii rx clk

This commit adds a 6th clock, the SGMII RX clock, to the starfive,jh7110-dw=
mac
binding for the jhb100 SGMII interface. It updates the global clocks and
clock-names properties to allow up to 6 items.

> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.=
yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> index 06aeaa0f6f009..fdcc61c65f87d 100644
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
[ ... ]
> @@ -39,20 +39,24 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> +    minItems: 5
>      items:
>        - description: GMAC main clock
>        - description: GMAC AHB clock
>        - description: PTP clock
>        - description: TX clock
>        - description: GTX clock
> +      - description: SGMII RX clock
> =20
>    clock-names:
> +    minItems: 5
>      items:
>        - const: stmmaceth
>        - const: pclk
>        - const: ptp_ref
>        - const: tx
>        - const: gtx
> +      - const: sgmii_rx

Should the schema restrict older generations to a maximum of 5 clocks using
an allOf block?

Since the global list now contains 6 items, the schema implicitly allows up=
 to
6 clocks for all compatible strings. If prior hardware generations or stand=
ard
RMII/RGMII variants only support 5 clocks, they could silently pass validat=
ion
even if an invalid 6th clock is mistakenly specified in their device tree n=
ode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519101436.1114=
76-1-minda.chen@starfivetech.com?part=3D3
