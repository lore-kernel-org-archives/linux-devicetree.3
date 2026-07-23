Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B3747127B
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806484; cv=none; b=ghGnNtjoGbLhN/aEjv6/0opFK5ROOGvRRCgEm4FUqso0Lhu3t0h6DwO8DVC0to95XlwImFnS16WZYNDqf7nGTX25byBfK5aEekD1fAAoi8yCREmk2wjbmL1Gh5Gl5niMN6YZm8cKjTN/5KWZ/CkRBBdoHTDCkTK1FlrHqxph3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806484; c=relaxed/simple;
	bh=2caQtpCG9incWeSH3peJTg6kkdTrYK8SLG29eOAmRcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XaxriZT4yAdoDSb8xkKuqjUB6PcIfwaT6HLhHZpKZc4vRTjs6uc8abQBuZHGAwEpu/uv+ACv2jcM5JxjqZMpsdH2WJf/A9MKeoAUwoWK09rj8E0EpS1kZrhDGVy7mP2/hVvoo+MRrKZJ2kIGuRBSevXR3Ik75B18jHap9AjKSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+kiMadd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+kiMadd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C2D1F000E9;
	Thu, 23 Jul 2026 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784806483;
	bh=/ufjupLi98C9sI5ryUwadU3JhprUIgdQrW4Dme9ZlUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T+kiMaddQX/Zx1Hj0Z/5818m+S1d0TuKIEWIwZ3Njs82P4JUKabOJPwir8owOzwEy
	 mnvJ72BJkou1SfstUKadaYt0Sx1DmVx+TwBTleWrsUGQlnfhNkmDSjQUlpdpTjhvZJ
	 bh4WvtTTnvo4sFQ7u/C1MGCXDWAW5T0lyZ1ZCVh5LMWH5gej69EOgfhjhPSmKHLSDS
	 2NSQ9oSNOAyv0E/JR4WK5KNCsCqeJlwThh8cHk5OSG4sxdBwMy8l5itUuOUAuTlf20
	 wjeh+DjfOPW0pjSd+CN0ukS03Tlh+4zroT4rWbRaGZ8a0Kxc1pYl+TlXmlUuPCioHl
	 KpdL5NxLtASOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/17] spi: spi-mem: teach spi_mem_adjust_op_freq()
 about post-config ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Michael Walle" <mwalle@kernel.org>, devicetree@vger.kernel.org, "Pratyush
 Yadav" <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, conor+dt@kernel.org, robh@kernel.org, "Richard
 Weinberger" <richard@nod.at>
In-Reply-To: <20260723110219.3180747-5-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-5-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:34:42 +0000
Message-Id: <20260723113443.06C2D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Using strict equality `op->max_freq =3D=3D post_config_max_speed_h=
z` as a sentinel is brittle, breaks high-speed modes, and can inappropriate=
ly elevate frequencies of un-tuned operations.
- [High] Ops running at the post-configuration frequency bypass the `per_op=
_freq` capability check, potentially causing unsupported controller behavio=
r.
--

--- Patch [4]: [PATCH v6 04/17] spi: spi-mem: teach spi_mem_adjust_op_freq(=
) about post-config ops ---
commit 929442442d981a80e44b25e60b6fa3ecd9dc8a62
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops

This commit extends spi_mem_adjust_op_freq() with a bypass for post-config=
=20
operations. If an operation's maximum frequency matches the configured
post-configuration maximum speed, it remains uncapped, while all other
operations are capped to the base maximum speed.

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index a88b9f0383564..e20eca1b82457 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -591,9 +591,18 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
[ ... ]
>  void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op)
>  {
> +	if (mem->spi->post_config_max_speed_hz &&
> +	    op->max_freq =3D=3D mem->spi->post_config_max_speed_hz)
> +		return;

[Severity: High]
Does this strict equality check reliably identify post-configuration ops?

If a hardware-defined operation limit exceeds the board's tuned rate, the
exact equality check will fail, demoting the operation to the untuned base
rate and wasting the PHY tuning.

Conversely, if an untuned operation happens to have a datasheet limit that
is identical to the tuned board limit, could it bypass the base rate cap
and execute at an unsafe elevated frequency?

[Severity: High]
Additionally, does bypassing the cap for post-configuration speeds break the
frequency capability check in spi_mem_default_supports_op()?

In spi_mem_default_supports_op(), the capability check is guarded by:

	if (op->max_freq &&
	    op->max_freq < mem->spi->max_speed_hz) {
		if (!spi_mem_controller_is_capable(ctlr, per_op_freq))
			return false;
	}

Because post-config speeds are typically greater than max_speed_hz, the che=
ck
op->max_freq < mem->spi->max_speed_hz evaluates to false.

Does this cause controllers that lack per-operation frequency switching to =
skip
the verification entirely and incorrectly accept operations requiring dynam=
ic
clock rates?

> +
>  	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
>  		op->max_freq =3D mem->spi->max_speed_hz;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723110219.3180=
747-1-s-k6@ti.com?part=3D4
