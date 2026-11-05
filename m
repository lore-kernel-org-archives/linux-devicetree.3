Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863369;
	b=gl3hPdaQkgkALCN74xo+AdF3cz2WlggPejoI3/QUNMyphiZxZlzWhBnpJSVmeoIN3wvZ
	 6Wkt9nusfrrCjH6Y8q79tu1x3jsBBC4vzOsFuZE4crQLEH2KpMWDMMNIw6tmBgBe0mYN6
	 vIVgc6bMRIhRLQX1YXUaygpO3pHWYQrD8KoWdJixZsqG9gVa0B5BTlBLNVfkRhpzMOpAc
	 GMHKkwjb2knlF6t61EfOOFJ2Vh0uW3etDjP13lYzleD/+IxZLplUjiM1yAr4FY+/uzWqN
	 db+cUbewenmmCRRMjCIVjy+yQg73rmtVGGSOKl5UHNuRvOU9pkAN6fRk5/m5kfQYsJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SHdRrrzzfk3KzxcEypxJwhTq5vxTGZWRotf454ZhvV8=;
	b=jSxhxYEl/8MYZbAO7zn/iwuBxAG22QugvVmFLA455E9QQCDRcis3g11xkWQf7Dn6wL80
	 0AeIUQ45yEDQyofHDurAAFr0DM5pwDmfqlE9QMdLRp3qAGcxC4sC37kmZBKbUA6j8+HF2
	 ew/SPw64Mxt4ml3bpYRsv4pQbplkTdoE50lOZEXw1mv+wKOMCO+S62aILEeo4SKOWzOq+
	 QH7PBcsyKS0Yfy6Z4MscbW8b9jy3qxAm5zc3I36XdGXVKSJDHqkv9U5pXKOAAe/dcK/7T
	 uvyf7btJJNUDZpN+rXqVXpv4rd5HmbBwJH+QKxqcvvFLPP6WMnz6r74ZO8zobxLri0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZdPS8an;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18711606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZdPS8an
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF7E1F000C1;
	Thu,  5 Nov 2026 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863368;
	bh=SHdRrrzzfk3KzxcEypxJwhTq5vxTGZWRotf454ZhvV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZdPS8anr/1XsnaGCDU73MioDW9D/otpofWCXd8bxdwDZXkkdfxKSpequSbkMHjzI
	 1n+nr3Q1QwV3edK8XP5HPtq3dXRlXZrctA/4UgeH4EK5cgMd54UAeTeWecjr3TdAcl
	 ye0bwqGcgr1j29xPMDENCaUohgKXvW1oV8/CedDwf703FqmhN0ohRFU8d1tGFrH+nt
	 e+0qYQL09VtLCd2HX+F4kVbEq2F7qWe64DBxIIL59JiXsXwtghMTX8yzR9cTjbnolN
	 q0PfBcma/yInJt8hZosoTFCHeIZVHe/AapeW9P6CsgMm2zI1Y+mn3HOHA1OjC+bVHc
	 aTKNrW3L3Q5zg==
Message-ID: <sashiko-outbox-198661@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev>
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 07:22:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: stmmac: DWMAC_SF19A2890 depends on undefined Kconfig symbol=
 MACH_SIFLOWER_MIPS
--

commit 525b363248f5ebf2554b1d2d37b10b76ddf73d26
Author: Joseph Telaak <joseph@telaak.dev>

net: stmmac: Add Siflower SF19A2890 glue

This commit adds the stmmac platform glue driver for the DesignWare GMAC on
the Siflower SF19A2890 SoC, configuring the PHY interface mode and RGMII
internal clock delays.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index c6559e749c0ce..78efe78590220 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -201,6 +201,17 @@ config DWMAC_S32
>  	  SOCs GMAC ethernet controller, ie. S32G2xx, S32G3xx and
>  	  S32R45.
> =20
> +config DWMAC_SF19A2890
> +	tristate "Siflower SF19A2890 GMAC support"
> +	default MACH_SIFLOWER_MIPS
> +	depends on OF && (MACH_SIFLOWER_MIPS || COMPILE_TEST)

[Severity: Medium]
In drivers/net/ethernet/stmicro/stmmac/Kconfig, the DWMAC_SF19A2890 entry
references MACH_SIFLOWER_MIPS in both its default and depends on lines.

However, MACH_SIFLOWER_MIPS is not defined in any Kconfig file in the tree.
Because undefined Kconfig symbols always evaluate to n, the default never
activates and DWMAC_SF19A2890 cannot be selected unless COMPILE_TEST is
enabled.

Is there a missing architecture Kconfig patch defining MACH_SIFLOWER_MIPS, =
or
should this depend on a different symbol?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sf19a2890-=
gmac-v1-0-a15965a49574@telaak.dev?part=3D2
