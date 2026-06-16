Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7149A314A98
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642278; cv=none; b=IfD65MfAGMzbJ+NjYQBhYmSzMshAq/k40rOE0/0vdXy0t6YT/LnGsGisaXHi2150ojOP/bLHGyCLAc4FIG3mjEnEwN4lnPid9ld3fPywfC5SqfMgBy8XEoOo6QZJRQdX6O5ByI/sVoGiD4xO+IUu4RQ13Ci04c5IdqXnfVTVGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642278; c=relaxed/simple;
	bh=0zuvFhhUzO3LfKr4Y5FApvUJSHNCCAKV/iQny22nn9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EUQC8yuKO7GtZJIHlYTAmSq1WGc0V9nUJGQHEfaeZE3s0f+TYkrAzRn9n/bEuiiDMfPtca+TASsAS9W/wn1yo3vlIS6bmrvysdgTH0ZSZCRvXPZeXzS+QkCj1QTSvUJLRxu/vyWzHWP1b0eUj5TGDBlr3nYaHH1Oyr6pZQWuk9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXDNlZa7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXDNlZa7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C671F000E9;
	Tue, 16 Jun 2026 20:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781642277;
	bh=Nypy9wMDonsNLaXKcg1tgO26HHtWwPqJpguZU0c8DHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GXDNlZa7dv7cISs3jTJBN5+sTyKlfUHeflinTvSWiy6ZsaCfcz2m7Up0npLXQrims
	 7gp/4L1+5N+5QzAKv+momi9mqPmzVWhNjdPFTjGGzkIV+3WZ/xTWHbrW1LhqrErCpO
	 Mafj4hkFZcno6bA6lSYDs7gTwg9M3LcY44hneaUVnbHg1ayzfrXwJ1/ItSUfIY/CeV
	 ToO9jAoa05gGdia8YsbIr+YNiO8eU9Czh42P1PBVQDGidGv9wn9qEMWswaFne2h+ns
	 LGvF6UIE2CswEf2G4C16hqVL2hkNC83BHfbze9VXl1lh1XpJpDrD3lHGRBL8DJtTyy
	 WFKvOHm07gFEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 08/12] clk: zte: Introduce a driver for
 zx297520v3 matrix clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616-zx29clk-v4-8-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-8-ca994bd22e9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 20:37:56 +0000
Message-Id: <20260616203756.D9C671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect case used for parent clock name "AHB_wclk" for the "gm=
ac_ahb" gate.
--

commit cf4f2a13a47e51fe8fab640925ef1ac3aa154e9d
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 matrix clocks

This commit introduces the clock driver for the ZTE zx297520v3 matrix
clocks, covering high-speed devices like CPU, DMA, RAM, SDIO, and Ethernet.
It maps out the multiplexers and gate clocks consumed by these devices
based on the available PLL inputs.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index 50263bca6e087..d90aadf180269 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> +static const struct zx_gate_desc zx297520v3_matrix_gates[] =3D {
[ ... ]
> +	GATE(ZX297520V3_GMAC_WCLK,         "gmac_wclk",      clk_main[0],     0=
x110,  0, 0),
> +	GATE(ZX297520V3_GMAC_PCLK,         "gmac_pclk",      clk_main[0],     0=
x110,  1, 0),
> +	GATE(ZX297520V3_GMAC_AHB,          "gmac_ahb",       "AHB_wclk",      0=
x110,  2, 0),

[Severity: Medium]
Will this string mismatch result in gmac_ahb becoming an orphaned clock?

The Common Clock Framework resolves clock parents using exact case-sensitive
string matching. If the actual clock registered in zx297520v3_top_gates
is named "ahb_wclk", using "AHB_wclk" here will fail to link.

Even if an immediate system crash is averted because the parent clock is
marked with CLK_IS_CRITICAL and permanently enabled by the framework,
does this incorrect parent name break the clock tree topology and tracking
for the GMAC driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-zx29clk-v4=
-0-ca994bd22e9d@gmail.com?part=3D8
