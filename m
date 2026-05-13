Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E57083C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778631482; cv=none; b=HMsngHYcEiJNCRQ9qU9WEByGBSdnXA+tzavZson5Mf3NOVdgcayJJuqrd8904bTp/ZQhQ1gd/QrN0gipSAO+FPSI5OZYuKRwUfk5oRP1BuALCatsGu6nAC+ePZh38V+K8koquYF00XNGPjB+xM3/Ujk0ufJpvOmLk3kSXTZUUBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778631482; c=relaxed/simple;
	bh=+edAyhqsvl4oXuyGKIzM79C9lUsVgM3l5W3kjADqZus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PlNWdtVZAvyJEe27CYmYuAH2HSTVlOvaXJ+HNAlggxeQvt4RZdziXpohHMJiQKFzSyW9Pt8vR3jqqC4IblYym1hXIsbskI/hcXG9/6BYPscLnSIrTB+yW5n7+pA7ZzbQqTVxnueEn/7yayeRsyJRgq2eolIdAGwDAnJ5w0fXbqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZXaF9Lh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZXaF9Lh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36483C2BCB0;
	Wed, 13 May 2026 00:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778631482;
	bh=+edAyhqsvl4oXuyGKIzM79C9lUsVgM3l5W3kjADqZus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mZXaF9LhyzQNDjdN36Ig+tlvoRr7R07m/A3FLh0byjmAAmp3HDrp650f1PzvAghUd
	 qAJ9+Lpzxbfyc6/vPe8uqOIAdXJDATziDzQ45Z93vEROm/6n3SkHy4UGbm1Ydq2n6l
	 XuaTro1p8ZvqnpMBK++Awcm8mUK2mrILhDngHNAV/t8xvqLK7UK8NaH9hhX/CZi3ld
	 e1f/cmCNYIn2iKYZAX1htXaBCLJJNkgAIshhsCbgqmU15P6f9X+P/EKC4Am1t912Cr
	 0QOCtolvgW2RE+fiDJsGD3UJKfNRdeffml1z/EW58hj/MGjfv3mz3/Gh4c1xgPVPtV
	 Aa51h30WPUwPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] clk: renesas: cpg-mssr: Add table-driven MSTP
 dummy-read delay for LCDC on RZ/T2H
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511191910.1945705-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511191910.1945705-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:18:01 +0000
Message-Id: <20260513001802.36483C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Integer division truncation in RZT2H_MSTP_READS_TO_US causes insuf=
ficient dummy-read delays, violating hardware requirements.
- [Medium] The table-driven MSTP delay lookup logic contradicts its documen=
tation and is structurally brittle, failing to support register-level wildc=
ards or multiple IP blocks per register safely.
--

commit 45819a6f54fdfd758c7050cb72ae4d08ec929f51
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk: renesas: cpg-mssr: Add table-driven MSTP dummy-read delay for LCDC on =
RZ/T2H

This commit introduces a table-driven mechanism to apply MSTP dummy-read
delays per-IP block on RZ/T2H. It replaces the hardcoded udelay(10) with
a computed delay based on the hardware manual's minimum dummy-read
requirements.

> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas=
/renesas-cpg-mssr.c
> index 26ea85cfaa027..19a96ca17d73a 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -96,6 +96,24 @@ static const u16 mstpcr_for_gen4[] =3D {
>  #define RZT2H_MSTPCR_BLOCK(x)		((x) >> RZT2H_MSTPCR_BLOCK_SHIFT)
>  #define RZT2H_MSTPCR_OFFSET(x)		((x) & RZT2H_MSTPCR_OFFSET_MASK)
> =20
> +/* Dummy read counts as specified by the RZ/T2H hardware manual */
> +#define RZT2H_MSTP_DEFAULT_DUMMY_READS	7
> +#define RZT2H_MSTP_LCDC_DUMMY_READS	100
> +
> +/*
> + * Time per dummy read in nanoseconds, derived from the original udelay(=
10)
> + * which was used to satisfy the 7 dummy-read requirement:
> + * 10000 ns / 7 reads =3D 1429 ns per read.
> + */
> +#define RZT2H_MSTP_DUMMY_READ_NS	1429
> +#define RZT2H_MSTP_READS_TO_US(n)	(((n) * RZT2H_MSTP_DUMMY_READ_NS) / 10=
00)

Does this macro truncate the division, resulting in an insufficient delay?

For the LCDC requirement of 100 reads, n =3D 100 evaluates to
142,900 / 1000 =3D 142 microseconds.

However, 142 us only covers 99.37 reads at 1429 ns per read.

This falls short of the hardware manual requirement of "at least 100 times"
mentioned in the commit message.

Should this use DIV_ROUND_UP to ensure the minimum delay is always met?

> +#define RZT2H_MSTP_DEFAULT_DELAY_US	RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_DE=
FAULT_DUMMY_READS)
> +
> +#define RZT2H_MSTPCRM_INDEX		12
> +#define RZT2H_MSTPCRM04_LCDC		4
> +
> +#define RZT2H_MSTP_ANY_BIT		U32_MAX

[ ... ]

> +/**
> + * struct rzt2h_mstp_delay_entry - MSTP dummy-read requirement for RZ/T2H
> + *
> + * @reg: Index into control_regs[]. Exact match.
> + * @bit: MSTP bit position, or RZT2H_MSTP_ANY_BIT for register-level mat=
ch.
> + * @delay_us: Computed delay in microseconds to satisfy the dummy read r=
equirement.
> + */
> +struct rzt2h_mstp_delay_entry {
> +	u32 reg;
> +	u32 bit;
> +	u32 delay_us;
> +};

[ ... ]

> @@ -253,6 +300,20 @@ static void cpg_rzt2h_mstp_write(struct cpg_mssr_pri=
v *priv, u16 offset, u32 val
>  	writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
>  }
> =20
> +static unsigned int cpg_rzt2h_mstp_get_delay_us(u32 reg, u32 bit)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(rzt2h_mstp_delay_table); i++) {
> +		const struct rzt2h_mstp_delay_entry *e =3D &rzt2h_mstp_delay_table[i];
> +
> +		if (e->reg =3D=3D reg && (e->bit =3D=3D bit || bit =3D=3D RZT2H_MSTP_A=
NY_BIT))
> +			return e->delay_us;
> +	}
> +
> +	return RZT2H_MSTP_DEFAULT_DELAY_US;
> +}

Is the register-level match fully supported by this logic?

The struct documentation above states e->bit can be RZT2H_MSTP_ANY_BIT for a
register-level match.

However, the condition here checks if the passed bit argument is
RZT2H_MSTP_ANY_BIT, but does not check if e->bit is RZT2H_MSTP_ANY_BIT.

If the table contained an entry with e->bit set to RZT2H_MSTP_ANY_BIT,
it seems it would be ignored when querying for a specific bit.

Additionally, in cpg_mssr_resume_noirq(), the driver queries the delay by
passing RZT2H_MSTP_ANY_BIT.

Because this loop returns on the very first match, if multiple IPs in the
same register have custom requirements in the future, will it return the
delay of the first entry instead of the maximum required delay for the
entire register?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511191910.1945=
705-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
