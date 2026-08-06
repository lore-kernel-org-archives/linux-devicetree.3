Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C952841B8F6
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010767; cv=none; b=i546/eOhhVm7BeCOlMRIW20E3f+C18cBv/B0BOb96tfsqC5MRcblzfKz3Ycyrc0a0UQBW4aqWaJHu7AfgnvNjOMu9OV7KHyir2bs4Ra+FFv1+f8tEuBRWRfybLz64KtNqcCUn/pUUbKo4cDbEEp/0Lxe30aWmcefWdhPpkUYxzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010767; c=relaxed/simple;
	bh=72vscGItyzwLrt7SueckNWTF/COkIdste8ATDKZQswQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BaYnTUhfOTaTW+a4wnn2kimwRJt3HCieU/9LG9UUd5dkzqMc3U0robyaDQ1IfkXNIhQymAxGQhpmHuS8LJpIiZSj8WnvfY1Ngdcl2Zxlk/G553c7Kp8zk67pgObXBXvfQYbpbYHULyarZh3g/ZBbDw5bbLMPMrLt1QP/OAFyOqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mP3y++D2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mP3y++D2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2C01F000E9;
	Thu,  6 Aug 2026 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786010765;
	bh=zdewUglQUFHCmxwK2xCVwa0xvc2LAHLXeOXA5tAsgCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mP3y++D2C+NZj2vKijjI+7hCIVcDkz45og+poNyeGFdhC2wyGQLPW8736aZxHd8ur
	 bNo4dnY6xZUhhudVXFBclgcyIHFIKKMURM1AmquEqY1oyCGsyGOPRN4xnZ/IMBkhpn
	 mcru/7LWoINLvZB/cflNMHRzeSgVOm0I5CTTeovhTRKL9ohilcVr1NVajBnRQzSmG5
	 KrBjXA6Mt5YIpfuQK2hv9+pMRXbnknshrMAvYzm2U1rBhOAac0MN9z94Y9/s0A6yjq
	 CUk8f00vUisKsD1U+LXWyXNqQnAXBzpK3JwvZAi0azICsdOXktuccAov1lJvveZmSB
	 Kn6pwnspjbYXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/8] of: reserved_mem: mark /reserved-memory entries
 with MEMBLOCK_NODUMP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806093519.2907771-4-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-4-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:06:04 +0000
Message-Id: <20260806100605.2C2C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] Marking reserved memory as MEMBLOCK_NODUMP causes a kernel pan=
ic by splitting memblock arrays before resizing is permitted.
- [High] The MEMBLOCK_NODUMP flag is inert dead code that fails to exclude =
regions from kdump.

Pre-existing issues:
- [High] Physical memory for dynamically allocated 'no-map' regions is leak=
ed on driver initialization failure.
- [High] Error path unconditionally un-reserves statically placed memory, p=
otentially corrupting overlapping critical reservations.
--

--- Patch [3]: [PATCH v5 3/8] of: reserved_mem: mark /reserved-memory entri=
es with MEMBLOCK_NODUMP ---
commit 2e35731dcf703e597205458fb3ba8ad782294cfa
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP

This commit marks non-dumpable reserved-memory regions with MEMBLOCK_NODUMP
so kdump can omit them from the vmcore. The marking is guarded by
CONFIG_CRASH_DUMP so non-kdump kernels do not pay the cost of splitting
memblock.memory entries at NODUMP boundaries.

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 7b1616b9c6c21..f38d11df6f152 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -674,6 +674,9 @@ static void __init fdt_init_reserved_mem_node(unsigne=
d long node, const char *un
>  			rmem->name ? rmem->name : "unknown");
>  	}
> =20
> +	if (IS_ENABLED(CONFIG_CRASH_DUMP) && !rmem->dumpable)
> +		memblock_mark_nodump(rmem->base, rmem->size);

[Severity: Critical]
Does this memblock_mark_nodump() call trigger a boot-time panic?

fdt_init_reserved_mem_node() runs very early in the boot sequence.
When memblock_mark_nodump() is called, it splits existing memory regions to
isolate the nodump regions.

Since efi and e820 maps already consume many entries of the static 128-entry
memblock array, these new splits can quickly exhaust the array. When
memblock_double_array() is invoked to allocate more slots, it checks
memblock_can_resize, which is still 0 at this early stage.

Will this result in an immediate panic("memblock: cannot resize %s array\n")
for any platform booting with device tree reserved-memory nodes that exceed
the static array limits?

[Severity: High]
Does the MEMBLOCK_NODUMP flag actually exclude regions from kdump?

A full tree search reveals that this flag is never checked by
should_skip_region(), /proc/iomem exporters, or any kdump filtering logic.

Architecture setups like request_standard_resources() in arm64 only check
memblock_is_nomap(), meaning nodump regions are still exported unconditiona=
lly
to /proc/iomem as 'System RAM'.

Since the flag is never read by the kernel, will kexec-tools parse these
regions and include them in the vmcore anyway, defeating the purpose of
the patch?

> +
>  	reserved_mem_count++;
>  }

[Severity: High]
This is a pre-existing issue, but does fdt_init_reserved_mem_node() leak
physical memory for dynamically allocated 'no-map' regions on driver
initialization failure?

If __reserved_mem_init_node() returns an error, the error handling path
attempts to clean up the reservation:

drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
    ...
	if (err !=3D 0 && err !=3D -ENODEV) {
		pr_info("node %s compatible matching fail\n", rmem->name);
		rmem->name =3D NULL;

		if (nomap)
			memblock_clear_nomap(rmem->base, rmem->size);
		else
			memblock_phys_free(rmem->base, rmem->size);
		return;
	}
    ...
}

For regions with the no-map property, it calls memblock_clear_nomap(), which
only removes the flag. It does not call memblock_phys_free().

Since dynamically placed regions were allocated via memblock_phys_alloc_ran=
ge()
and added to memblock.reserved, doesn't this leave the physical memory
permanently in memblock.reserved without returning it to the buddy allocato=
r?

[Severity: High]
This is also a pre-existing issue in the same error path, but does calling
memblock_phys_free() for statically placed memory unconditionally un-reserve
memory, potentially corrupting overlapping critical reservations?

For statically placed reserved-memory nodes, early_init_dt_reserve_memory()
calls memblock_reserve(), which successfully merges the region even if it
overlaps with an existing critical reservation like kernel text.

If __reserved_mem_init_node() later fails for this node, the error path
calls memblock_phys_free():

drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
    ...
		else
			memblock_phys_free(rmem->base, rmem->size);
    ...
}

This translates to memblock_remove_range(&memblock.reserved, ...), which
blindly un-reserves the entire range.

If this overlapping critical memory loses its reservation, won't the buddy
allocator later hand those pages out for general use, corrupting the critic=
al
data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806093519.2907=
771-1-chenwandun1@gmail.com?part=3D3
