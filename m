Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899C51E2858
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 18:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781807616; cv=none; b=oqYocUjXjZ71LEQ1hRRzghKQvRo1Xvo77LAvPfeWvufvMpFMN/PtgqoaDFiKD98GcTnwNSqntHyO/OBPKcnJM3CiOT8Po5eEa6UXBrsSCQaE1RtsWEwklBYn0OYiHyDu3dE9x0Y9bqv+JcDcQ7HwyOvVn8ZvDOeP983BDUgG2gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781807616; c=relaxed/simple;
	bh=drSsUqDocWsv0TfF71r0VUWOMqSGfEfSzGflANbZngg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NDts0LXZUgoW57Jexo4VSm1crJIAikN+TvSTEpwgxPR8iUqw4dQ4oIHPlV00eVpYHcJwy8gsvVGbfTbaQ52GrvKMiG8AMUjZticdJd5eLt6gCMDZmmsSrM8s9hXIoKUCXcP0Hlj2ymv4ItQcfivARG7RzAiWP3uxJ0R6B3PZ+lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+bfUKMT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+bfUKMT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10DD1F000E9;
	Thu, 18 Jun 2026 18:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781807615;
	bh=pk1gmJ2CvdiiC7ycwo8XtQpiDy9Ys7RYUDLwaYDobY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D+bfUKMTQZTunKvqZQxP1vJxL+rqxKOED8MEXqz0riO6vD8cqfBbLMdWUTB4Aviq6
	 0SD8yTN7KbqrfEy6pgDPWwPf4G1JKHCMjuTgxE18Til+0REZLmVoj/DCBhZC41rWEN
	 JSH2ir2JMaIXRyLKU9pIzbET0T12lgztt27XmHKzJxMJHPpodRouOnzgF4dqjpzN/5
	 GNMdste9ana3GdBmjVTqaCtNRVKHVuQaO3kkpvo2kpM7GAOuNfDd7PelSQhK8c/ORh
	 wyXkunbpjH3Y+0FaxyJ17PsrhRwZHd+GYhkRubeHmPicOHOsHVYe2QXiryF2evb5om
	 /zUCtUVaJp/Ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL
 reference frequency for calculations
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 18:33:34 +0000
Message-Id: <20260618183334.F10DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Silent 32-bit unsigned integer overflow and zero-extension corrupt=
s PLL calculations when 'p.k' is negative on 32-bit architectures.
--

commit 68e2983ee9a6e8d870b293872442cdc2bc7b3e74
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculatio=
ns

Introduce a per-SoC PLL reference input frequency parameter to avoid
relying on a hardcoded 24MHz constant during PLL configuration math.

> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c
> index e271c04cee34f..fff89f2bdc0b2 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

[ ... ]

> @@ -335,9 +335,9 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits=
 *limits,
>  					continue;
> =20
>  				/* PLL_M component of (output * 65536 * PLL_P) */
> -				output =3D mul_u32_u32(p.m * 65536, RZ_V2H_OSC_CLK_IN_MEGA);
> +				output =3D mul_u32_u32(p.m * 65536, input_fref);
>  				/* PLL_K component of (output * 65536 * PLL_P) */
> -				output +=3D p.k * RZ_V2H_OSC_CLK_IN_MEGA;
> +				output +=3D p.k * input_fref;
[Severity: High]
This is a pre-existing issue, but does this multiplication safely handle
negative values of p.k on 32-bit architectures?

Since p.k is a signed 16-bit integer (with limits->k.min allowed to be -327=
68)
and input_fref is a 32-bit unsigned long, C promotion rules on 32-bit builds
will convert p.k to a 32-bit unsigned integer before the multiplication.

If p.k is negative, the resulting 32-bit unsigned modulo value will be
zero-extended when added to the 64-bit output variable. This would incorrec=
tly
add over 4 billion to the output frequency rather than subtracting the
intended fraction, which could severely break the PLL parameter search.

Could p.k be cast to s64 before the multiplication to prevent this unsigned
overflow and ensure proper sign-extension into the 64-bit output?

>  				/* Make it in mHz */
>  				output *=3D MILLI;
>  				output =3D DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618181949.3036=
280-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
