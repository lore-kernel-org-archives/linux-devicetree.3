Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886953;
	b=JqQXiyE6xgGE2bW14dq7QeNB/6R2lWqYdBEwguWNbVARe3T7aDyK7oabUeMms1JWl7Dd
	 0CpI+FDL8aiuvzfhLCeMc0NbzlW5ylKO0LtAmrWmeERPDq1UMnIthh/JV7nGHhuB4qmR0
	 14yr4bqX+xU7i+qVvtr+nzNlYHiGtUCoTrn/XqLcxOc6KQMgOllCY1MtKO+GmoNL55eD7
	 Ae+MYrKgXbq9yVnm0Vzmk0jG2sfIRSCeDjugs8mXE9l023Uxtv2uKISRjEBw4ub5DH0Ma
	 fGL++pp0LOjE6vQT7IYByw8C+b4ZfGHgQT/+ICVlOau7MrKCg5NMPU5oOBMh7UQ6swg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886953;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qKUd6EjLpHcXUrNvXO+ZwKaNS+U+wzwD2sx40H3WfWY=;
	b=UAaE7+WVEWbN/OJcmVaIMQUwfbUpArhxet7O6u4kiAKSvfUb6JZnUewgdvkhXqs5mrvg
	 MsnIeF9tNs/DjibFLDJW2IPB5kv8sYiqc4cEBVmh6KzFA/b+j7oFICImG0Yb6vtIGwkA8
	 qNGFGn7IzxjxnS0Yoi81gGB5Uc/b0Pc27n6p2UnWaSuH6ABaQLTl8ys5nT97DxGHRWAtk
	 Z8dEPTv1dvtO8eqaCUdroo48glVs3BSYkkbuDETBmg9lnrPfMoxwRGeCaOskh9kHVN6wS
	 ne09wCaiTBD4dSTjfSWNoGgx+ekg/JqTyf9Zmm/Ov0xaFfbkbP+y7WN4YKjqngzbyHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkfWrImF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC52606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkfWrImF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095E81F0093A;
	Thu,  5 Nov 2026 13:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886953;
	bh=qKUd6EjLpHcXUrNvXO+ZwKaNS+U+wzwD2sx40H3WfWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MkfWrImFOHJ5wJoZfqjDL9flKCmOk5Szlu0HOskgAZKCVy49JRxtXI3YHQpiQFv1N
	 z+nieAb4d5RvSEEBhHG/AwOgwNHkigLYDYFxixCki9rv4I6Gxem/7x1zYuAiUqsx4a
	 WqlHP95UEL9HySht6SZ8Gg+Qxpfkj9ZuSw4nAkZtutCuJhmFx9eoPrGjkLv+S4Mr6w
	 Us0B+WNm1mmxYcnlIfrBWyRaowEckCPdFLc9yNNpvs8ZkM/o1+nKE83nt7DIp4qC03
	 0Z8N/sQB4gUVm0VJ9nuN8sw8hmb2GXzsv7s3yDgrtW5Ci1MeaHAXYgWjD8/iouf5Zh
	 PmPyOIXv1X3Ow==
Message-ID: <sashiko-outbox-199178@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the
 XG6846B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-3-7477b2b4675d@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
 <20261105-genexis-xg6846-smp-v7-3-rc1-v5-3-7477b2b4675d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 13:55:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ARM: dts: broadcom: xg6846b partial no-map removal breaks lowmem s=
etup
--

commit 59829f1abd4c733fd749211767c1df938a47fd66
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B

This commit disables the inherited PSCI node on the XG6846B board and
configures the CPUs to use the brcm,bca-smp enable-method with CFE's
holding pen release address on CPU1. It also removes no-map from the
secondary-boot reserved-memory node so the reservation does not fail
when overlapping the kernel's initial page tables.

> diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arc=
h/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> index a3616fb7b3a8d..45d4df5231109 100644
> --- a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> @@ -34,7 +34,7 @@ reserved-memory {
>  		ranges;
> =20
>  		secondary-boot@0 {
> -			no-map;
> +			/* Includes the kernel's initial page tables. */
>  			reg =3D <0x00000000 0x00008000>;
>  		};
>  		pmc3-firmware@8000 {

[Severity: High]
As reported by Sashiko on v3 [1], does removing no-map from secondary-boot@0
while leaving no-map on the adjacent pmc3-firmware@8000 node cause an early
boot crash when booting a multiplatform kernel where TEXT_OFFSET is above
0x00108000 (such as multi_v7_defconfig, where CONFIG_ARCH_BCMBCA=3Dy and
CONFIG_ARCH_MESON=3Dy set TEXT_OFFSET to 0x00208000)?

On bcm6846_defconfig (TEXT_OFFSET =3D 0x00008000), arm_memblock_init() rese=
rves
[KERNEL_START, KERNEL_END) starting at physical 0x00008000 before scanning
reserved-memory. When early_init_dt_reserve_memory() processes
pmc3-firmware@8000 with nomap set, memblock_is_region_reserved(0x8000,
0x100000) is true, so the reservation is rejected with -EBUSY and
memblock_mark_nomap() is never called.

However, when TEXT_OFFSET is 0x00208000, the kernel image and initial page
tables sit at physical 0x00204000 and above. During
early_init_fdt_scan_reserved_mem(), secondary-boot@0 ([0x00000000, 0x000080=
00))
is reserved without MEMBLOCK_NOMAP, while pmc3-firmware@8000 ([0x00008000,
0x00108000)) does not overlap the kernel reservation and succeeds in calling
memblock_mark_nomap(). This leaves [0x00000000, 0x00008000) as the first
mappable memblock.memory region ahead of the MEMBLOCK_NOMAP region at
[0x00008000, 0x00108000).

In arch/arm/mm/mmu.c:adjust_lowmem_bounds(), the second loop then checks
whether the end of that first usable range is aligned to PMD_SIZE:

	for_each_mem_range(i, &block_start, &block_end) {
		if (block_start < lowmem_limit) {
			if (!memblock_limit) {
				if (!IS_ALIGNED(block_start, PMD_SIZE))
					memblock_limit =3D block_start;
				else if (!IS_ALIGNED(block_end, PMD_SIZE))
					memblock_limit =3D lowmem_limit;
			}

Because block_end is 0x8000, memblock_limit is set to 0x8000, rounded down =
to
PMD_SIZE (0), and passed to memblock_set_current_limit(0).

Subsequently, in paging_init(), prepare_page_table() computes end from
memblock.memory.regions[0]:

	end =3D memblock.memory.regions[0].base + memblock.memory.regions[0].size;
	if (end >=3D arm_lowmem_limit)
		end =3D arm_lowmem_limit;

	for (addr =3D __phys_to_virt(end);
	     addr < VMALLOC_START; addr +=3D PMD_SIZE)
		pmd_clear(pmd_off_k(addr));

With end =3D=3D 0x8000, prepare_page_table() clears all kernel PMDs from
__phys_to_virt(0x8000) up to VMALLOC_START, unmapping the running kernel, a=
nd
map_lowmem() then underflows map.length =3D end - start when advancing star=
t to
kernel_sec_end while end remains 0x8000.

[1] https://lore.kernel.org/r/sashiko-outbox-180435@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-genexis-xg=
6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org?part=3D3
