Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658000;
	b=SCALeIX258uy0L2ZsJO1kuOGn7nnm5EYLGE0qebOSKcXR5SQ1by9Yj8B5c/wIJeN4opl
	 C+T6s8wSHm127Xf6u4Mc5alKLDi9nswpIoYmbhV7YXUYU8HmXyVYtoxMdCDUeJC/y2TaM
	 FwNTntzjJPr8iSNIksrf+uxsDtlayd220ncxgfyLvls7HswtZZCwDIJljqDY10ZIag0tw
	 +z+97/CRd3R/jfWaLhpp/Pz2Rg11wyxT6r+QjXVoBaZhqzYGvlxs64wwFQL/oj9kXRvhJ
	 TM7tBZGS4ZGAsQeN9xLT4RtzHn7xu0cR+g0XS1w4zvJLrywM5eRiAsh2JeKfZuoU1Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658000;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=flFPZllbaKoBIHFswczsH7CR5as1Rw0sc8rUxUyOmGI=;
	b=u4L1VVwhk6f8TmlOk/g+GZ6FmRZ+enBwH94DNGk33lUp08VvERfWM7Fj5D04xdh9LTX6
	 2DS2DRpO3a2vw2q7375NGHC1f/H0OWo036N0Y3kggP3xiFp97VVwAo2vYyFQmIbnt5Xms
	 7wjym+4id9r+WJsaUMyU/9pnPfTyl/qC8nz3Tfbjs529oC8Fvu6I1cmNsf62yGzSCdCsD
	 CTH4csHnzXbSL+ghxtGDbWD+XfJm0zjQi9/24OE6KP3YrnkXMDw2BVoz9VquSHQYtBHag
	 3thCKdzYkR3pY8nfvZpjMGYgotfv8PADpNxSwm5/7d0CSbbdAzB8Py1iClIVYaSOOhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNN9pxJF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF470606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNN9pxJF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E4B1F000C2;
	Thu, 22 Oct 2026 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657999;
	bh=flFPZllbaKoBIHFswczsH7CR5as1Rw0sc8rUxUyOmGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iNN9pxJF/9PFRFCBOoaXQOn8ujjifNb20yGhbn2HabesYdauaidzpm/MkGmUUFCyy
	 bE80P2WRFeGrj5ltvDXJVQQTy/i0/9MlWgJHD7XtemlXn0qec6E8ETp6L6Ieds9N30
	 1O8kDzFxKbu713xi5/fU0j2Tg1chVMArbx7aOpw+Cwmlb+hr6kRPKnE36QGLhspWoT
	 B7BpQvDA57hXsFMsy1NqMIkqcOsp9NuM+IYIckpuzqKuK7VAZEUZ3DiNl21ZzFLVHO
	 lPEl7wm2qZYg7m0XifQ38ufLdsKeh+BQdnfINwPZjZXB57PkNf9XIYopp1SrVowRjL
	 1xiGL7CycOLRA==
Message-ID: <sashiko-outbox-181183@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 7/8] of: reserved_mem: mark /reserved-memory entries
 with MEMBLOCK_NODUMP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>, robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org, m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org, pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, robin.murphy@arm.com, devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org, conor+dt@kernel.org
In-Reply-To: <20261021083011.2170525-8-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-8-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 08:33:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] of: reserved_mem: unaligned memblock split in fdt_mark_reserve_mem=
_nodump()
- [Medium] of: reserved_mem: fdt_mark_reserve_mem_nodump() marks failed res=
ervations
--

commit a452b9d1fad838de511c25fe48e4541c58357355
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP

This commit adds fdt_mark_reserve_mem_nodump() to mark non-dumpable
reserved-memory regions in memblock.memory so kdump omits them from the
vmcore when crash dump support is enabled.

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 8c9d6395d6a39..db2bf76000d23 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -677,6 +677,24 @@ static void __init fdt_init_reserved_mem_node(unsign=
ed long node, const char *un
>  	reserved_mem_count++;
>  }
> =20
> +void __init fdt_mark_reserve_mem_nodump(void)
> +{
> +	struct reserved_mem *rmem;
> +	int i;
> +
> +	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
> +		return;
> +
> +	if (!IS_ENABLED(CONFIG_KEXEC_FILE) && !IS_ENABLED(CONFIG_CRASH_HOTPLUG))
> +		return;
> +
> +	for (i =3D 0; i < reserved_mem_count; i++) {
> +		rmem =3D &reserved_mem[i];
> +		if (rmem->size && !rmem->dumpable)
> +			memblock_mark_nodump(rmem->base, rmem->size);
> +	}

[Severity: High]
What happens here when rmem->base or rmem->size is not page-aligned, or
when rmem->size is smaller than a page?

Previously, mapped reserved-memory regions were only recorded in
memblock.reserved and did not split memblock.memory. Calling
memblock_mark_nodump() splits memblock.memory at rmem->base and
rmem->base + rmem->size, but reserved-memory regions are not guaranteed to
be page-aligned:

drivers/of/of_reserved_mem.c:early_init_dt_alloc_reserved_memory_arch() {
	end =3D !end ? MEMBLOCK_ALLOC_ANYWHERE : end;
	align =3D !align ? SMP_CACHE_BYTES : align;
	base =3D memblock_phys_alloc_range(size, align, start, end);
}

Static device tree regions without no-map can also be smaller than a page
or unaligned to the page size (for example, cfe-stub@0 in
arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi with a 0x1000 size under
16k or 64k page configurations).

When memblock.memory is split at an unaligned or sub-page boundary,
__next_mem_pfn_range() rounds each region inward to page boundaries and
skips sub-page regions:

mm/memblock.c:__next_mem_pfn_range() {
	while (++*idx < type->cnt) {
		r =3D &type->regions[*idx];
		r_nid =3D memblock_get_region_node(r);

		if (PFN_UP(r->base) >=3D PFN_DOWN(r->base + r->size))
			continue;
}

This drops any page frame straddling an unaligned split boundary from
for_each_mem_pfn_range() and the page allocator.

In addition, request_standard_resources() in arch/arm64/kernel/setup.c and
init_resources() in arch/riscv/kernel/setup.c register each mapped
memblock.memory region using memblock_region_memory_base_pfn() and
memblock_region_memory_end_pfn():

arch/riscv/kernel/setup.c:init_resources() {
		res->start =3D __pfn_to_phys(memblock_region_memory_base_pfn(region));
		res->end =3D __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;

		ret =3D add_resource(&iomem_resource, res);
		if (ret < 0)
			goto error;
}

For a sub-page region where PFN_UP(base) >=3D PFN_DOWN(base + size), res->e=
nd
becomes smaller than res->start (or underflows when end_pfn is 0), causing
add_resource() on riscv to fail and tear down iomem_resource, and producing
an inverted or underflowed resource on arm64.

Splitting memblock.memory also splits hyp_memory[] on arm64 pkvm, where
check_range_allowed_memory() in arch/arm64/kvm/hyp/nvhe/mem_protect.c
requires checked ranges to fall within a single region:

arch/arm64/kvm/hyp/nvhe/mem_protect.c:check_range_allowed_memory() {
	reg =3D find_mem_range(start, &range);
	if (!is_in_mem_range(end - 1, &range))
		return -EINVAL;
}

Could memblock_mark_nodump() corrupt resource registration, drop straddling
pages, or break pkvm range checks when regions are not page-aligned?

[Severity: Medium]
Can fdt_mark_reserve_mem_nodump() also end up marking active kernel memory
as non-dumpable if an early static reservation failed?

During early boot in fdt_scan_reserved_mem(), __reserved_mem_reserve_reg()
logs an error if early_init_dt_reserve_memory() fails (for example, if a
static region overlaps the kernel image or initrd), but still returns 0:

drivers/of/of_reserved_mem.c:__reserved_mem_reserve_reg() {
	if (size && early_init_dt_reserve_memory(base, size, nomap) =3D=3D 0) {
		fdt_fixup_reserved_mem_node(node, base, size);
		pr_debug("Reserved memory: reserved region for node '%s': base %pa, size =
%lu MiB\n",
			 uname, &base, (unsigned long)(size / SZ_1M));
	} else {
		pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa=
, size %lu MiB\n",
		       uname, &base, (unsigned long)(size / SZ_1M));
	}
	return 0;
}

Later, fdt_scan_reserved_mem_late() scans all available static nodes in
/reserved-memory and passes them to fdt_init_reserved_mem_node(), recording
them in reserved_mem[] regardless of whether the early reservation
succeeded:

drivers/of/of_reserved_mem.c:fdt_scan_reserved_mem_late() {
		if (size) {
			uname =3D fdt_get_name(fdt, child, NULL);
			fdt_init_reserved_mem_node(child, uname, base, size);
		}
}

Wouldn't fdt_mark_reserve_mem_nodump() then mark that unreserved range in
memblock.memory, causing kdump to omit memory that is actually in use by
the kernel?

> +}
> +
>  struct rmem_assigned_device {
>  	struct device *dev;
>  	struct reserved_mem *rmem;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021083011.2170=
525-1-chenwandun1@gmail.com?part=3D7
