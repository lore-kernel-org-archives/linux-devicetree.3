Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FD43D47A0
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009876; cv=none; b=tKOzKH192AJD6QCzd6gHSOW//W9iFhEWZdSMvWmwJMYWE1LfRTfDiaA8lGcFQKWfH6ubhknz+QYPjZYq3mOGYvhwO63mvJOtQY+B6R/L3PYBNsEkqqvsORJbqKEkyggVAh4q0ubZJKVWLpFOWtJ0/SxA2SHbrRsgFOQlb9MpoP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009876; c=relaxed/simple;
	bh=S4W765n/cNXLKQ/VbAdGL+mig+vd/7EHt7ULoWxtUuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tK2zfCIX2x7EhfJHksjTtV3QzkSkYXqlv0OQJUTUGs/Q5kucbqvD0I87YBgHITRy1M6JiSMoV1erJQmzwu9jgQUY+bcT1zofvX5xLEeTcr1a1YPgD430znTpZo4vq82rnG7Clm8c9h9rJmtRvFb75DgOd3soIEqCGw32JF1UX1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7l1P5/t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7l1P5/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC81E1F000E9;
	Thu,  6 Aug 2026 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009873;
	bh=/dmikU0414nEAOKaUXnesKMdftvZMb5SrgE7POdgU20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P7l1P5/tMD5QvZMGG0rlgztFMrL8m6ROZUNx8Th8U2fZ89JYLDiNixHQQ03p2edBx
	 Xono/NMWy2s9tg/RFa60CSfNG3ksGPHA+kbn5p06kckk3uwtU8iCLRvXucLsI5T75S
	 7VxaJInstczZtIZuujlkiXL41PHC7OEhOTXazXRj9gKtaWcL9BJZ6PhIC2IUzBMfZP
	 3GZprx6XRF//6/H+i8nJvGPKMAIIbt0csPp69qAx9DZh6zhDKqkEWfJHAVwIL8LgE9
	 ZppsLkGT5/JFMtNb46l1YzGJhXh73YfnL2NU8Y8xdlUH1wBZedW1eYj2Q7cZRL3SCI
	 b7iAE5Bb4WDxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/8] memblock: introduce MEMBLOCK_NODUMP flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806093519.2907771-2-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-2-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:51:12 +0000
Message-Id: <20260806095112.DC81E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch completely omits the filtering logic required to exclude=
 MEMBLOCK_NODUMP regions from kdump vmcores.
- [Medium] The MEMBLOCK_NODUMP flag extends the flagname array but leaves a=
n uninitialized hole for MEMBLOCK_RSRV_HUGETLB, leading to a NULL format ar=
gument.
--

--- Patch [1]: [PATCH v5 1/8] memblock: introduce MEMBLOCK_NODUMP flag ---
commit b30a0bfd2a4e00657ccc3f49bdfa4a7ca5fdfa1d
Author: Wandun Chen <chenwandun@lixiang.com>

memblock: introduce MEMBLOCK_NODUMP flag

Add MEMBLOCK_NODUMP to mark regions that should be excluded from kdump vmco=
res.
The flag is meant for reserved memory that carries no data useful for crash
analysis. Subsequent patches wire this up for /reserved-memory and
/memreserve/ entries.

> diff --git a/mm/memblock.c b/mm/memblock.c
> index 9ce86349a29fa..79231634c25b0 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_scratch(phys_addr_t =
base, phys_addr_t size)
>  				    MEMBLOCK_KHO_SCRATCH);
>  }
> =20
> +/**
> + * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
> + * @base: the base phys addr of the region
> + * @size: the size of the region
> + *
> + * Mark the region as not to be included in crash dumps.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t s=
ize)
> +{
> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
> +				    MEMBLOCK_NODUMP);
> +}
> +

[Severity: High]
Is it intentional that the filtering logic for this new flag was omitted?

Without updating should_skip_region() in this file to filter out regions
marked with MEMBLOCK_NODUMP, the flag appears to have no functional effect.

When architecture kdump setup iterates over memory ranges (e.g., using
for_each_mem_range()) to build the crash dump list, these regions will still
be included because should_skip_region() does not know to skip them.

[ ... ]

> @@ -2886,6 +2901,7 @@ static const char * const flagname[] =3D {
>  	[ilog2(MEMBLOCK_RSRV_NOINIT)] =3D "RSV_NIT",
>  	[ilog2(MEMBLOCK_RSRV_KERN)] =3D "RSV_KERN",
>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] =3D "KHO_SCRATCH",
> +	[ilog2(MEMBLOCK_NODUMP)] =3D "NODUMP",
>  };
> =20
>  static int memblock_debug_show(struct seq_file *m, void *private)

[Severity: Medium]
Will this expansion of the array leave a NULL pointer hole for the
MEMBLOCK_RSRV_HUGETLB flag?

Prior to this patch, the max index was 6. MEMBLOCK_RSRV_HUGETLB is bit 7,
which safely fell back to printing "UNKNOWN".=20

Adding MEMBLOCK_NODUMP (bit 8) expands the array size to 9. Due to designat=
ed
initialization, index 7 becomes NULL.

When memblock_debug_show() prints a region with MEMBLOCK_RSRV_HUGETLB set,
it will read the NULL pointer and pass it to seq_printf():

    if (reg->flags & (1U << j)) {
        seq_printf(m, "%s\n", flagname[j]);
        break;
    }

While seq_printf() will safely print "(null)", this will break out of the
printing loop early and omit any other flags. Could MEMBLOCK_RSRV_HUGETLB
be added to the array as well to avoid this hole?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806093519.2907=
771-1-chenwandun1@gmail.com?part=3D1
