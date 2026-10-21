Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596568;
	b=NqcXWqUi24FgGtSvxtaJif4WSgCXsvqNTOKoweADKbt7GZkxL/Gp8M8PDyq1+RR0hxlD
	 h7ZdAjIVzRI2B0hT2MS53lDyQJ98G+mlytPbs7zAJG9KWv5zUvVSXrjPZLXDW5MlgdDet
	 WSuwOQEH+r6b2WMxgyItp3cDKuOJiLlosPK/H+IJiizyBp5QWJQdwPXzU8uMkvvSuG9dV
	 /a5M7tqnmvDshsiabM2LTvxe10meZyLzcTWbQSdB3cGsi4IhYaFHrDZomYI47zlQ2ZfBg
	 P8r6xCnYdarcle/AoauhcHbBWvb0Mod0282yI37RDKpP7NiWWJQo9TLV3yzoxZZh/Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596568;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q3wDhvMsY6G1k7RSYnn4mB8ZZLNEZKRjNzijVBWnlHA=;
	b=1ESvO9ktiuHO7MB21ju8C5SBhBLDA72Iwz/iHCrGv9o5AnhdMTcYDANEz16/kOQbSyHq
	 o0N26+tdoUSSeIY+3/FpxHFGP49sSDORxovh63vOpSwcHqZV+FcoS79x4jMLb0kmYVf0l
	 2EqygBjrGRVpRRjf5/VlagodjkMp9pCRHkXO5BDNESTgMy1IGnjKEvtEsNMB940Rqvjc7
	 YMcWO3KWmhfIPihRppZMhhx0sr0Efa/0wN08dtvZI4DzwEK8b/C7SoYJrt7j1oVNoFPKM
	 +Cz+r3eCbipQ+NRH5xOj7EOT9zNzcD9u9wvLG3HgmYnHyAi7IvGrB4oMKoITCuyFDnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lXy2dsCT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424DB606A321
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lXy2dsCT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BB41F000C1;
	Wed, 21 Oct 2026 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792596568;
	bh=Q3wDhvMsY6G1k7RSYnn4mB8ZZLNEZKRjNzijVBWnlHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lXy2dsCTFhjrN2Q+k8tbY/umXRB80U5qBJgCyOiax6ev9ll4RUFcSpny2OO6lKGcb
	 +fhAeH3fdjTQ6WH/Aos9O/ceq/V7Mlwj/wTEGbEr+hEm4Wsj9QRPJBKtgNcW1QZAxk
	 qfk8mhjqHL5L/I2NKCIg7uJsb/0R8jl0YaS0xm+fHN9JUPyN/6gdtDzQYjTKLp5nXz
	 dN/B249FHczNMJ38MmBDLGnWVri9LUfzV0IPYreeVc+6A91vmRC4SS1vU3Fsz19suJ
	 A7aYeHZ7oMjjxImcYUjJWGmLB/C6j76UW4VoxUMSK52DTyueRgqasXUrnrNcTzjcI7
	 HkrLgizeVVetw==
Message-ID: <sashiko-outbox-180435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the
 XG6846B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-3-7c871f1755db@kernel.org>
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-3-7c871f1755db@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 15:29:27 +0000
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

commit 83c5177a7db3728e4dd180472b439b349fdb5f65
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B

This commit disables the inherited PSCI node on the Genexis XG6846B and
configures the CPUs to use the Broadcom BCA CFE SMP bring-up method. It
also removes the no-map property from the secondary-boot@0 reserved-memory
node so the reservation does not fail when overlapping the initial page
tables.

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
Could removing no-map from secondary-boot@0 while leaving no-map on the
immediately adjacent pmc3-firmware@8000 node cause a boot regression in
adjust_lowmem_bounds(), prepare_page_table(), and map_lowmem()?

In arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts, reserved-memory
now has a mapped 32 KiB region followed by a 1 MiB no-map region:

		secondary-boot@0 {
			/* Includes the kernel's initial page tables. */
			reg =3D <0x00000000 0x00008000>;
		};
		pmc3-firmware@8000 {
			no-map;
			reg =3D <0x00008000 0x00100000>;
		};

On multi_v7_defconfig (which enables CONFIG_ARCH_BCMBCA=3Dy alongside
CONFIG_ARCH_MESON=3Dy), arch/arm/Makefile sets TEXT_OFFSET to 0x00208000,
placing swapper_pg_dir at physical [0x00204000, 0x00208000) and
KERNEL_START (_stext) at 0x00208000.

During setup_arch() -> arm_memblock_init() ->
early_init_fdt_scan_reserved_mem(), secondary-boot@0 is reserved via
memblock_reserve(0x0, 0x8000) and remains mapped in memblock.memory, while
pmc3-firmware@8000 does not overlap the kernel at 0x00208000 and is marked
MEMBLOCK_NOMAP via memblock_mark_nomap(0x8000, 0x100000). This splits
memblock.memory into:

  regions[0] =3D [0x00000000, 0x00008000) (MEMBLOCK_NONE)
  regions[1] =3D [0x00008000, 0x00108000) (MEMBLOCK_NOMAP)
  regions[2] =3D [0x00108000, 0x10000000) (MEMBLOCK_NONE)

In arch/arm/mm/mmu.c:adjust_lowmem_bounds(), the first loop checks whether
block_start of the first usable range [0x0, 0x8000) is aligned to PMD_SIZE
(which succeeds because 0x0 is aligned) and breaks without aligning
regions[2] (0x00108000). The second loop then checks block_end on
[0x0, 0x8000):

	for_each_mem_range(i, &block_start, &block_end) {
		if (block_start < vmalloc_limit) {
			if (block_end > lowmem_limit)
				lowmem_limit =3D min_t(u64,
							 vmalloc_limit,
							 block_end);

			if (!memblock_limit) {
				if (!IS_ALIGNED(block_start, PMD_SIZE))
					memblock_limit =3D block_start;
				else if (!IS_ALIGNED(block_end, PMD_SIZE))
					memblock_limit =3D lowmem_limit;
			}

		}
	}

Because block_end is 0x8000 (!IS_ALIGNED(block_end, PMD_SIZE)),
memblock_limit is set to 0x8000, which round_down(memblock_limit, PMD_SIZE)
rounds down to 0, calling memblock_set_current_limit(0).

Next, in paging_init() -> prepare_page_table(), end is computed from
memblock.memory.regions[0] as 0x8000:

	end =3D memblock.memory.regions[0].base + memblock.memory.regions[0].size;
	if (end >=3D arm_lowmem_limit)
		end =3D arm_lowmem_limit;

	for (addr =3D __phys_to_virt(end);
	     addr < VMALLOC_START; addr +=3D PMD_SIZE)
		pmd_clear(pmd_off_k(addr));

This clears all kernel PMDs from __phys_to_virt(0x8000) up to
VMALLOC_START, unmapping the running kernel at 0xc0208000. Immediately
afterward in paging_init() -> map_lowmem(), processing regions[0]
([0x0, 0x8000)) with kernel_sec_start =3D=3D 0 =3D=3D start and end (0x8000=
) <
kernel_sec_end hits Case 1:

			if (kernel_sec_start =3D=3D start)
				start =3D kernel_sec_end;
			if (kernel_sec_end =3D=3D end)
				end =3D kernel_sec_start;
		...
		map.pfn =3D __phys_to_pfn(start);
		map.virtual =3D __phys_to_virt(start);
		map.length =3D end - start;
		map.type =3D MT_MEMORY_RW;
		create_mapping(&map);

which sets start =3D kernel_sec_end while end remains 0x8000, underflowing
map.length =3D end - start while memblock.current_limit is 0.

Conversely, on configs where TEXT_OFFSET =3D=3D 0x00008000 (such as
bcm6846_defconfig), KERNEL_START is at physical 0x00008000 and is already
reserved by arm_memblock_init() before early_init_fdt_scan_reserved_mem()
runs, so pmc3-firmware@8000 with no-map overlaps the kernel image and fails
in early_init_dt_reserve_memory() with -EBUSY (which is the only reason
memblock.memory is not split at 0x8000 on bcm6846_defconfig).

Should no-map also be removed from pmc3-firmware@8000, or how is
pmc3-firmware@8000 intended to coexist with the kernel image at physical
0x00008000 and 32-bit ARM's PMD_SIZE lowmem alignment requirements?

[ ... ]

>
>base-commit: 6356fd3dd29d8b5620507a0ce037c644e052b5dd
>--=20
>2.51.2
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-genexis-xg=
6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org?part=3D3
