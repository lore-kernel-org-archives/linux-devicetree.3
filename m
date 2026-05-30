Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F131A9F8D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102011; cv=none; b=Zy245zd6o3licvtnuZaP9aEpgCZMTWVLYQ7Nct870V5ZKhvH3beJhudJGVsgxnmWOXbpv1I3N3M6sbaIB0Wc/F4QeznhVgC2THMsVZGRBF5XNeS8sHIhrn1BQRqv1V5VuUN6m8ivVmVFmsl5yNsgdS5BJmxR9yemK/dhJxcwlL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102011; c=relaxed/simple;
	bh=QsLw1GLoFhIL9XsJJXhIfXU6Dgs8ftuXOCTKQmLkfT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L9gpDuxh7yAcBl6tyuLSoKTsbfyu6LicMpMy75KYw921Cgd4N1gE97NFAY6W1yep3vQrnZ8ToZC89pSn2yAbjrDIweD/t49AcpKRshM7cJSutmi3Bb8nCmh0nAJhTDa7ccn2IQteJ2ZaDgn6FzBAv4bx9MuqtoqamebkXrSLxwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDOd+OzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDOd+OzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BB91F00893;
	Sat, 30 May 2026 00:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102010;
	bh=x342A8qCueFDdk1Vju7z9M+MJemn/mNxOpbSdvaHDbc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gDOd+OzVmCgqAhGXBQKOnxXM3vkGKImjkPZ87RnFzHZWYbmhD/jcfgwhppy/Wq1Wu
	 vWVACB9W+womrHYTDdcuekR+S4TtBEguBGZY2xZtXsHy5iMXQskCyR7UnM12yF8JTf
	 JzslQ4TsUj1tK8Puz1t/jXCb6imacOttz3iS4bWQdnk6boCYVZ094bGCisa2HxB7Em
	 Fy8Fol3f/Bg+0QzPxPAR2xWHtMod0AeF5GJnkplo6FRtoRm9m5HFkKFYmxSs7s8hYp
	 Lphz4fjhahNAM4zqUNY4gWhDiNqjdsBPdQD7Pe3yQiVkYdM37e/9brn2ICi9c9NXMF
	 RVLt1LrF6kWkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/5] net: dsa: microchip: Add fallback
 Micrel compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522-ks8995-to-ksz8-v2-1-5712c0dc9e75@kernel.org>
References: <20260522-ks8995-to-ksz8-v2-1-5712c0dc9e75@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:50 +0000
Message-Id: <20260530004650.65BB91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The Kconfig dependency `depends on !NET_DSA_MICROCHIP_KSZ_SPI` fai=
ls to enforce mutual exclusivity for modules and breaks hardware support fo=
r the 'micrel,ks8995' switch.
--

commit 1ffe24d5f8b3fca407e2abb776359fefdaddc523
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Add fallback Micrel compatibles

This commit adds legacy Micrel bindings to the KSZ SPI driver so they
can use the more capable driver. It also attempts to make the KS8995
driver mutually exclusive with the KSZ SPI driver to avoid probe races.

> diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
> index 39fb8ead16b5f..b91b9766ebc28 100644
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
> @@ -98,6 +98,7 @@ config NET_DSA_RZN1_A5PSW
>  config NET_DSA_KS8995
>  	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
>  	depends on SPI
> +	depends on !NET_DSA_MICROCHIP_KSZ_SPI

[Severity: High]
Does this dependency properly enforce mutual exclusivity for modules?

In Kconfig, the ! operator applied to a tristate module (m) evaluates
to m (!m =3D m). If NET_DSA_MICROCHIP_KSZ_SPI is built as a module,
NET_DSA_KS8995 can also be built as a module, allowing both to compile and
potentially leaving the probe race open. Strict mutual exclusion for
tristates typically requires depending on NET_DSA_MICROCHIP_KSZ_SPI =3D n.

Additionally, if NET_DSA_MICROCHIP_KSZ_SPI=3Dy, this forces NET_DSA_KS8995=
=3Dn,
which completely disables the KS8995 driver. Since the new ksz_spi driver
does not yet support the original micrel,ks8995 hardware in this commit,
does this cause a temporary loss of hardware support for ks8995 users that
breaks git bisect?

I see both of these issues are resolved later in the series: the hardware
support is added in commit 3134f79144b9d ("net: dsa: microchip: Support
Microchip KSZ8995XA / KS8995XA"), and the Kconfig logic flaw is removed
when the old driver is deleted entirely in commit 088a820a81246 ("net:
dsa: ks8995: Delete surplus driver").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-ks8995-to-=
ksz8-v2-0-5712c0dc9e75@kernel.org?part=3D1
