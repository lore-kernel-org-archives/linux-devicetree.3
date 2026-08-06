Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7CA427F99
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011005; cv=none; b=Fbz4+6o3Y6JDu2OGbmnvJCCcrAWgxZ37LgR3xbNaK7zYz2+nVKJ8xwemQQ7Xl82o0N2tPkFAYUbtWPjRQYLEG22Zmmtb81TCDVtFx9dsHDUU3NjafUwpVl+csPp2HMHT5YeiZdNrz3k5rxexnEEhDNl7rDJg3ELp1cfDeD1yiv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011005; c=relaxed/simple;
	bh=IT43uzzCYB0E6fGpG9ywjokmT8wCQcEvG+EIddCiA6M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KJQ3jRKN1fgWzgK26oH3yw2ZSzI8+zFt7kP7MnI/XEmUooq3W+xkbA+xHlYM4bsbxgDZgPcbls/MmyMO7EvY2gGCvN5mBU015nPj8aLgQDmhv4GAKzrUw8fV2lNY/H2/qRu7w7rqMO18cOydHRnd1HcI1wu+OuLCfcZ+Lt4c9iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmPo+s1K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmPo+s1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F84E1F000E9;
	Thu,  6 Aug 2026 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786011002;
	bh=pUq12veuTPyJsQi66EhA+DoOb2B7/CJaliDzL4Knlz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PmPo+s1K827+9+4PxEXwTVc88gZRJNZ33SHkjZjJQEzDkzpCdOcxulD3zk7UBR+gQ
	 gmxZRtM1Q8nLfcG3Ue1ARaeoGCF5FT9GDvfQHll+B0hztUaQ9lls2QpZdBNgTUZm+H
	 xj0LFXdMO0x+nmheDHMtz/iCpyq0ugtyqJloD4bXWPRt8Ww4IuTXvXof0aT0pJkqf3
	 gV+vrnnTQVXWP1BRO+D2BkdWoyhyft7Zi0Yi9KEgX5m6TsDwoj+nWsWiu8b7dhhqtx
	 EO7GEtcBbFtxIPdVs+zbUAOtGIaRZ8sUiu/711TtfuUjMDmKcyFJFW0VlfYYXdrfgW
	 7/LrqFGqiFSTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/8] riscv: build crash_mem ranges from memblock
 instead of resource tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806093519.2907771-6-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-6-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:10:00 +0000
Message-Id: <20260806101002.1F84E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Lockless iteration over memblock regions introduces a Use-After-Fr=
ee against concurrent memory hotplug.
- [Medium] for_each_mem_range() fails to filter MEMBLOCK_NODUMP regions, br=
eaking the patch's core feature.

Pre-existing issues:
- [High] Time-of-Check to Time-of-Use (TOCTOU) race condition during lockle=
ss double-iteration causes an out-of-bounds array write.
--

--- Patch [5]: [PATCH v5 5/8] riscv: build crash_mem ranges from memblock i=
nstead of resource tree ---
commit 6f60d7eb990c57ea1aef75ef70d369b6c9300b5a
Author: Wandun Chen <chenwandun@lixiang.com>

riscv: build crash_mem ranges from memblock instead of resource tree

This commit replaces walk_system_ram_res() with for_each_mem_range() to bui=
ld
crash_mem ranges from memblock. It also updates the ARCH_KEEP_MEMBLOCK
config to keep memblock around when kexec file and crash dump are enabled,
allowing the exclusion of MEMBLOCK_NODUMP regions from the vmcore.

> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 26cd2a8bd0cd3..808e872f40634 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
[ ... ]
>  unsigned int arch_get_system_nr_ranges(void)
>  {
>  	unsigned int nr_ranges =3D 2 + crashk_cma_cnt; /* For exclusion of cras=
hkernel region */
> +	u64 i;
> +	phys_addr_t start, end;
> =20
> -	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> +	for_each_mem_range(i, &start, &end)
> +		nr_ranges++;

[Severity: High]
This isn't a bug introduced by this patch, but by performing a lockless cou=
nt
here and then populating the array in arch_crash_populate_cmem() later,
couldn't a concurrent memory hotplug add regions in between the two calls?

If memblock regions are added after the cmem array is allocated but before =
it
is populated, the second loop will yield more regions than were counted,
leading to an out-of-bounds write in arch_crash_populate_cmem() since there
are no bounds checks on cmem->nr_ranges.

> =20
>  	return nr_ranges;
>  }
> =20
[ ... ]
> -int arch_crash_populate_cmem(struct crash_mem *cmem)
> -{
> -	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callb=
ack);
> -}
> -
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
> +{
> +	u64 i;
> +	phys_addr_t start, end;
> =20
> +	for_each_mem_range(i, &start, &end) {

[Severity: Medium]
The commit message mentions that "only by walking memblock can the
reserved-memory regions marked MEMBLOCK_NODUMP be excluded". Does
for_each_mem_range() actually filter out MEMBLOCK_NODUMP regions?

Looking at for_each_mem_range(), it delegates to should_skip_region(), which
doesn't appear to have any logic to filter MEMBLOCK_NODUMP. Will this loop
end up blindly yielding all regions and failing to exclude the targeted mem=
ory
from the vmcore?

[Severity: High]
Since for_each_mem_range() iterates over memblock.memory.regions locklessly,
is it safe against concurrent memory hotplug?

If a memory hotplug operation runs concurrently and adds new memory regions,
memblock_add_node() might exceed the current region limit and trigger
memblock_double_array(). This allocates a new array and frees the old one,
potentially causing a use-after-free if this lockless iteration is still
accessing the freed array.

> +		cmem->ranges[cmem->nr_ranges].start =3D start;
> +		cmem->ranges[cmem->nr_ranges].end =3D end - 1;
> +		cmem->nr_ranges++;
> +	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806093519.2907=
771-1-chenwandun1@gmail.com?part=3D5
