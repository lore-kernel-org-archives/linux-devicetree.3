Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9773F184524
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781521463; cv=none; b=Von8OKZmoS7cOmviaTrvvkURptbsL4Mj71qp6oTOyxN0SzM6zzndu60dxaJJx+gZO5/0ec956ggpvPkX4a1xCwOpIoi+JikhxMhanjNsKQ9WPIZQ6dnzOsnFJ3UcEzXj0hVdjkeVSTCmTQO2ruu4kHL3BTXqtpFwOPBiQH7Pl1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781521463; c=relaxed/simple;
	bh=AILJQl8pkL5DVuygJVnfocpf2caEDEby9vDKRWnRSnQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UsGvZzYfG5k8BLIB2+VfYUJLX3nIpVeerpg27z6Jzv9dgCkQy0khTfo4c1OXAlz3aVMChv87U5++YBwuHr2GBDJpm1t0FBqroFdgU+KZr1EMrtZ35pqQShjXBnO8zcYU/qWZFlC4sG+Dx8FsqABL+glfOZKCS5WM8xhcubJYt64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBpqrduc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBpqrduc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0148C1F000E9;
	Mon, 15 Jun 2026 11:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781521462;
	bh=x4EH+FcI2tojvlhghTAKVDHMmM0XY31ccyifYbEYIp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cBpqrduc8u0khqmuq4P676vx9A0SxbaFYhuzS9jKUpksbl/gs+K+0SbfVdbkWF9a4
	 ibS8jGrhOUcy08aYdx5qLL5XUDOPjcFORMXN864NW7alr6xM+M9C3VK/sgWfQyuCmN
	 1JTzU+XcWXky0ouyda4R/GGISnJgGP7+rL/uNhl0bQgCyKKTHz0nKmZcOOMeZLlrZZ
	 SxR9T4qMZWjGRtl4x1aQsYxZNaqnPBEkzdh/fj7oThzJcqKeUMcrPzOXfZ+bR7kil2
	 DociPXCOt5CHeTebMEIkxGHJtrMJzgP+zGWwNukHbyo/DsXPeO0cE9xHunsnKpM2aD
	 1ygvTqvZOLUEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL
 reference frequency for calculations
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 11:04:21 +0000
Message-Id: <20260615110422.0148C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The documentation for `input_fref` explicitly states it should be i=
n MHz, but the implementation assumes and requires Hz.
--

commit bcb3fbb3f1de21bfd1e1a632fe1e124e9c03de3b
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for c=
alculations

This commit introduces a per-SoC PLL reference input frequency parameter to
the rzv2h_pll_limits struct. It updates the PLL calculation logic to use
this dynamically provided reference frequency instead of a hardcoded 24MHz
constant, falling back to 24MHz if the field is not initialized.

> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c
> index f6c47fb89bca5..513f8283c4796 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
[ ... ]
> @@ -237,6 +236,7 @@ struct rzv2h_plldsi_div_clk {
>  bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
>  			struct rzv2h_pll_pars *pars, u64 freq_millihz)
>  {
> +	unsigned long input_fref =3D limits->input_fref ?: (24 * MEGA);

[ ... ]

> diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
> index c360df9fa735c..94ee70b20b44c 100644
> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 div=
ider, int target) { }
>   * various parameters used to configure a PLL. These limits ensure
>   * the PLL operates within valid and stable ranges.
>   *
> + * @input_fref: Reference input frequency to the PLL (in MHz). If set
> + * to 0, a default value of 24MHz is used.

[Severity: Low]
The documentation here states that the frequency should be provided in MHz,
but the implementation in rzv2h_get_pll_pars() expects Hz, as it falls back
to (24 * MEGA) and doesn't scale input_fref.

If a developer configures a new SoC and sets .input_fref =3D 48 as document=
ed,
will it be evaluated as 48 Hz instead of 48 MHz and cause the PLL limit che=
cks
to fail? Should the kernel-doc be updated to request the frequency in Hz?

>   *
>   * @fout: Output frequency range (in MHz)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615104845.4122=
868-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
