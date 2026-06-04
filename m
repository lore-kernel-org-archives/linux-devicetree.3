Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3447DD6F
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580180; cv=none; b=izpvAddxc2JrPnP5SaRDPl5Y0roWezwnROVDoUdEknZlikVBAZeFgeobHyNxlr776GOSMxvq9Y0CvbXtOitJJdi/XcvvYzzUYRqwj9ZJ1KDYVOkxV550gnEjjf2BaRstVvZe8QtJI2pgMM/XzIitqrxZdLf0tS/B01unX8fyrIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580180; c=relaxed/simple;
	bh=2RJMnE1ETA7SWgaFInwNfc0aXxj+1cwrRmUdIZ60Y3Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bVMkyHZRdo2050ReYFWgzDf7RAC3KNJMV6gfGqTK6PFcHGzbS4v96xROxLtuYQjwhi2RJRL997nnoIP38Tki9YhkcD/KtyzYpOnA6J/tySRUj/K/rlDevrQalx9ZKxYmySE5UHJRsNlPnC6n4AHxfkq4eivJ3FYNKfjz7gibXGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lR9HVUdB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lR9HVUdB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C5D1F00893;
	Thu,  4 Jun 2026 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780580175;
	bh=5FoksGRft1STwQBiyc58tWnhxHixCdo8qTSG2S9Utlw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lR9HVUdBvD5DI78VC77yGzo4Izuie/AWLByk3PukLJbfSWbBm+KShLZ3/AZlUEpjr
	 bprYROsSA0nSANzOi3HI1rygkW7FFZuJWDt4pYIh3w0DYtMmRXvG5aUGoeYXGacycB
	 btfZ+6gMP6/J38l5hgSHye5oEXxlraN+mLjpgDURwHa5ZQEQ+UduJL9MAoJLPBriVp
	 P3LfuXWWxZYgQjwp79J8zcaHOXWJaaYqdADLiMsyePylpLF350dA+ZIMN5Y/1ow5Bi
	 oOhZ66WoAmCiWsKakgmUp9aFHnPX3P1sJ7M4Jyulm7GiQ1O7UM+2R/ANJE6Vli6STo
	 ps2Ctdcc/Y12A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/9] clk: eyeq: Prefix the PLL registers with the PLL
 type
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-clk-eyeq7-v8-5-53f618174cf6@bootlin.com>
References: <20260604-clk-eyeq7-v8-5-53f618174cf6@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 13:36:13 +0000
Message-Id: <20260604133615.56C5D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Using readq() on addresses that are not 8-byte aligned will trigge=
r hardware alignment faults on 64-bit architectures.
--

commit bf5bd431a86c5690b223e75ad314eb6d7388384c
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

clk: eyeq: Prefix the PLL registers with the PLL type

This commit renames the PLL registers to make room for other PLL types
present in the eyeQ7H. It also moves the register access inside the
parsing function to deduplicate code across call sites.

> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c

[ ... ]

> @@ -162,34 +162,40 @@ static void eqc_pll_downshift_factors(unsigned long=
 *mult, unsigned long *div)
>  	*div >>=3D shift;
>  }
> =20
> -static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
> -				   unsigned long *div, unsigned long *acc)
> +static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
> +			       unsigned long *div, unsigned long *acc)
>  {
>  	unsigned long spread;
> +	u32 r0, r1;
> +	u64 val;
> =20
> -	if (r0 & PCSR0_BYPASS) {
> +	val =3D readq(base);

[Severity: High]
This is a pre-existing issue, but will this readq() trigger a hardware
alignment fault on ARM64?

The PLL registers passed as the base address (such as 0x02C, 0x034, 0x03C,
and 0x044) are 4-byte aligned, but not 8-byte aligned. On ARM64 platforms
like EyeQ6, performing a 64-bit load instruction via readq() on unaligned
device memory violates architectural rules and typically causes a
synchronous external abort.

Would it be safer to replace this with two readl() calls to avoid
alignment issues?

> +	r0 =3D val;
> +	r1 =3D val >> 32;
> =20
> -	if (!(r0 & PCSR0_PLL_LOCKED))
> +	if (r0 & FRACG_PCSR0_BYPASS) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-clk-eyeq7-=
v8-0-53f618174cf6@bootlin.com?part=3D5
