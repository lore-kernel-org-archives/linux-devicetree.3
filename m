Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905223EE1D3
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339734; cv=none; b=eqgrl7EWO3xsbRhukoFAeCG0SMH+lP1tAZ6Cf7GcCDBp2IFu1Q8e3uhIRrNnhtLmITgTakcciaaCZkBt4jAn6VWaWM+qKijHEIS/tCN4Lok90kcq9yFdbDpn2/tsQe+sTm+PwTHwr6D1+hL2s7Mg4OVs2mqXsZjpdpsCBIzh2bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339734; c=relaxed/simple;
	bh=NvsBvyM8cm1SgoOi9zkXGHA/jkbO1ZIPuomwrECSr3s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mIJKiP+7XfrsLuPwLDkJgROfjSauDpAC0RUZ5J7UBBRBwYwAFy4zZzmU/X+olOGbqu8uNvmXJMwzH8iNQyP+5oNrijUMtLEUuOF+/CdvyfQiyG+yjhS6y1tYSGe7bCtswff2S7jVQHWuM3RExJ4DYbqHvnZWYsxkDl0fx7qfmvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfDD1VJl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfDD1VJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA891F000E9;
	Wed,  2 Sep 2026 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788339732;
	bh=9e+Pln2cbdT+hMZvDDSsymz+YfXm1sRShGo/lfYkieM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AfDD1VJl2gYYNuC3zmi3i/g2rx03e5Exc13lovE5yFfWmI03Frl/mXZmJ+AW5LaJA
	 xO0s4oIa3dY8Nv5Z+GQ9eBg/IcgVpXyFj4ZS2hZopO163eGN2bnXsm2MkfLJ9Kx/k1
	 Xnlrz8cDBT+FO9xzMtACgeIZYoluR2mXIAdoqfMlDTgtVEkQOLbqiMiarwSqm6WH7a
	 ZtbMakEx7hTtWQfQeYN+rbMpIk9mukoANWgMpz8EK80i14s5sCy3BZn1jVxXBA1UQH
	 rGPSuE05sOeyFUlejK2T8WHnXyg0MdOXLnBOO1QpyaVHd7XLCxS1vSI8DsSrzSm+LX
	 q2rqtmypTxcTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/10] of: reserved_mem: mark /memreserve/ entries as
 MEMBLOCK_NODUMP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902073116.802752-10-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-10-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 09:02:11 +0000
Message-Id: <20260902090211.9DA891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] FDT /memreserve/ entries marked as MEMBLOCK_NODUMP can be later fr=
eed to the buddy allocator, causing active kernel memory to be silently omi=
tted from crash dumps.
- [Medium] 64-bit FDT reserve entries are checked for overlap in 64-bit spa=
ce but implicitly truncated to phys_addr_t when marked as NODUMP, potential=
ly corrupting dumpable regions on 32-bit systems.
--

commit f6e6bcd14fb6f4946f258fc34089bbbdcd52f624
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP

This patch marks /memreserve/ entries in the device tree as MEMBLOCK_NODUMP
so they are excluded from kernel crash dumps. It explicitly leaves regions
that overlap with a dumpable region unmarked.

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index f29a07e8fb23e..a42cf6eac55b5 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
[ ... ]
> @@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
>  	}
>  }
> =20
> +void __init fdt_mark_memreserve_nodump(void)
> +{
> +	u64 base, size;
> +	int n;
> +	const void *fdt =3D initial_boot_params;
> +
> +	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
> +		return;
> +
> +	if (!fdt)
> +		return;
> +
> +	for (n =3D 0; ; n++) {
> +		int i;
> +
> +		if (fdt_get_mem_rsv(fdt, n, &base, &size))
> +			break;
> +		if (!size)
> +			break;
> +
> +		for (i =3D 0; i < reserved_mem_count; i++) {
> +			struct reserved_mem *rmem =3D &reserved_mem[i];
> +
> +			if (rmem->dumpable &&
> +			    base < (u64)rmem->base + (u64)rmem->size &&
> +			    (u64)rmem->base < base + size)
> +				break;
> +		}
> +		if (i =3D=3D reserved_mem_count)
> +			memblock_mark_nodump(base, size);

[Severity: Medium]
Will this corrupt dumpable regions on 32-bit systems?

base and size are u64, so the overlap check evaluates safely in 64-bit
space. However, memblock_mark_nodump() takes phys_addr_t. On 32-bit
systems, could a 64-bit FDT reserve entry > 4GB correctly pass the overlap
check above, but then get implicitly truncated to a 32-bit address when
passed to memblock_mark_nodump(), incorrectly marking a lower 32-bit
physical address as NODUMP without having checked it for overlap?

[Severity: High]
Can this cause active kernel memory to be silently omitted from crash dumps?

If the bootloader specifies a /memreserve/ entry for memory that the kernel
later frees (such as the initrd), this memory is returned to the buddy
allocator.

Since the MEMBLOCK_NODUMP flag is never cleared, will this cause reused
pages to be incorrectly skipped and omitted from the crash dump later on?

> +	}
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902073116.8027=
52-1-chenwandun1@gmail.com?part=3D9
