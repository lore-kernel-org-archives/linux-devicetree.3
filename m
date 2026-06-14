Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005119995E
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781440369; cv=none; b=nUuudRDAapo1rLNqFSBgU6Z/5pk5YOvOC06c2wssrrOqIKtfaI1JL6aduk2gqykHvBRUwCEIPJ/EAgx9Hfh+eiqrvYoPkGIVdVA91FV6m0VAN+SWMUgIS1FH2h8jneSMNOMrP9c9vq5uJ5uicnLBD6i0UaTGsPWwXJn/n/ssXi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781440369; c=relaxed/simple;
	bh=VMU4Ttp51Nsmx9NDXe7zWjv3J+0ig0i+UCxu7ZbIvPY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VTiTaBuA35LT13Bx/8Rk3oewlaUZdC3dWcnxWezy9euOq+kwRsc1PiD7TJoxUAmtf0twmAeM6OCi2GWsBPZbbTo5dGXQ+jOH/EyLTk6A4WyvcOsiMyQ8OnUko/Onho84ubSFU0q8UMmTTB2S7OSayFlO/iKyr5qqLK8b9W7QewA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7ernpWz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7ernpWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928FB1F000E9;
	Sun, 14 Jun 2026 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781440367;
	bh=zIIg6TNE6V9fc/udBy2eSiEJmOC3GMFYwugcRrUPf+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K7ernpWzPZXMwBvRaOW6lurvqcrmQ38DFpVjdycSgmmcn05lWRkNsRluBdOH0xzPc
	 D984TIeeAstTkR36fmaK3YSUpOssSjsMOWrchp1TBAgZkIjdX7152cAQaNOUSlo8oZ
	 SVBDaICa60jjEWPeyBbvmU0DgFcNumTIn2fTxE8caHV1PrCi5bpjuWlD0tk+YvY/u4
	 5w2lojnzeqLYWi4mGNJPY29VgXkhHZSSrQrBkJYwDkeA+JyxvotJHWj9NPVeNjNeSE
	 zfPRaEUTvsLaccDvNUIDqqD1p23VzvXi34nJjclebZpp3CYUphFKhNnIESRIqFLIUh
	 K9aiS/XCDKmqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Heider" <a.heider@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260614122812.2287506-1-a.heider@gmail.com>
References: <20260614122812.2287506-1-a.heider@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 12:32:47 +0000
Message-Id: <20260614123247.928FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The devicetree file includes 'k1-opp.dtsi', but this file is missin=
g from the tree.
--

commit dbb35bd6325bb2f268c9e7237e65d5c614a6f755
Author: Andre Heider <a.heider@gmail.com>

riscv: dts: spacemit: k1-musepi-pro: add cpu scaling

This commit enables CPU DVFS for the SpacemiT MusePi Pro board by including
an OPP table and wiring the CPU nodes to the buck1_0v9 regulator supply.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/=
boot/dts/spacemit/k1-musepi-pro.dts
> index 0d809e4ad3b1f..1b425011f1231 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -9,6 +9,7 @@
> =20
>  #include "k1.dtsi"
>  #include "k1-pinctrl.dtsi"
> +#include "k1-opp.dtsi"

[Severity: Low]
Is the k1-opp.dtsi file missing from this series?

It appears this include will cause a devicetree compilation failure because
the file does not exist in the tree.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614122812.2287=
506-1-a.heider@gmail.com?part=3D1
