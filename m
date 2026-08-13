Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FB131ED83
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786606364; cv=none; b=fwX3bSqGwXKnXFCgxfTE96t2L4tH3sovOy/8SlOC4PGvsMT1jrlEZkTXVzh6YyR8S2xACrKVCWFjjG4m8yh0p6ExZ/9qOZzmsHmJNSFou74Ad27LNSU5uTxrc0iQOKrwfZ/kOGjBS6oYj2uEf2JUho2lJZTH7upiP6FRAeCQ8Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786606364; c=relaxed/simple;
	bh=2JxwGsUeyOCRINJroJy9txnAYiN1EEJ/v2L8M1yz894=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ee8p2M7lLbjb/dqrqdA2Qpyo5xFDRUDzeT4+tCR3+/Xnv9hkgAq3pmMDy8eOshxeqiumZK3Vfx5+t0tXTr6M9Lev++gIQlNWP3R/0dP1QoDwvrPOZRnvlJTukJzY5bW8ru7vAmybR6kpLmdY+AeIhmoqxdx5cjzZr94aSn7auno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZC556CoE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZC556CoE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124641F00A3A;
	Thu, 13 Aug 2026 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786606363;
	bh=GZpnPOnmfNEEq9Rd/1A4nN5bSZjUByDo+URA+b+0K80=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZC556CoEDXwduHPXEYVdqsFdvhvRtYlbEi1Ol5aFjHY5dg9Z7TiurEKKcF/FL1d7A
	 gqg/KBRLotCVE3NIBCgj0mAqwiSuv5IUNJ+oq2DQoARt1qT4zH5Cr1oAoc62INLXr6
	 rjPx8jt9ZUwZBQWDrzr1/iToNUexWIKyP/YXrGHmpu1YyPQw/UCIAS0ySANym0+k7r
	 wuHJPS35Dh6Au2Kd7+Tk4rWgSJqlkrhcbRjq3Uh6EsAsTFaXcg5izVIHjAypejPknl
	 D/p/T++lohXkXRjGdJc4fxhMN7dhIak0PZijZP/ECK5GfjJZ99D9CPgU8YQoE8auep
	 peKWgMTlSz9Xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: nuvoton: Add NuMaker board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813-perso-ma35d1-upstream-dts-v1-2-bb237fd7c3c2@bootlin.com>
References: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
 <20260813-perso-ma35d1-upstream-dts-v1-2-bb237fd7c3c2@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 07:32:42 +0000
Message-Id: <20260813073243.124641F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The NuMaker carrier board device tree fails to define its own `m=
odel` and `compatible` properties, incorrectly inheriting them from the inc=
luded SoM device tree.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: nuvoton: Add NuMaker board ---
commit ebe82dc4f8c0ba0308823c13c0ed25751cfbed16
Author: Miquel Raynal <miquel.raynal@bootlin.com>

arm64: dts: nuvoton: Add NuMaker board

This patch adds device tree support for the NuMaker carrier board, which
uses the Nuvoton MA35D SoC on the NuMaker SoM. It creates a new DTS file
that includes the SoM description and adds a node for the SPI NAND connected
to the Quad SPI controller.

[ ... ]

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts b/arch/arm64/=
boot/dts/nuvoton/ma35d1-numaker.dts
> new file mode 100644
> index 0000000000000..01f1f800aef8d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2025 Bootlin
> + * Author: Miquel Raynal <miquel.raynal@bootlin.com>
> + */
> +
> +/dts-v1/;
> +#include "ma35d1-som-256m.dts"
> +

[Severity: Medium]
Should this file define its own root node with model and compatible propert=
ies?

Without an overriding root node here, this compiled DTB inherits the
identity strings of the included SoM device tree. Can this cause the
bootloader or kernel to misidentify the NuMaker carrier board as the bare
SoM?

> +&pinctrl {
> +	spi-grp {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-perso-ma35=
d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com?part=3D2
