Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A192AD00
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 01:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003200; cv=none; b=TTx5xtifsCNRNUsxOmQ6u9oGlVBz8DKHsRFyqRmA6GDzzvJvYUq4/dwugEWUDY73RjjMsdsv4BzWhhyokrvIfpR08739BWyJQY8tftkHs+TrvNtNC6euR3I6UlHOiTrtlYh5vQ8F0Sz9h3zmPqeoKwlhrdURmzMQG/YHOVb0Pb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003200; c=relaxed/simple;
	bh=QuUYlC5hY3BMWzQF/egI5+YocFgfIpBJFcSO94Ke3B4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HSEiXLsZWLvwXeHDIqlSNknpcaNiOW/l6113YYU1mGqIMDMHZRKxg9DAhcVusQ795WsbUhB4d6uQSSaSBrBSoqD/iJ6fQwj27g3X+dnj4Q//sDCnIJ+tFN1ahECwNp3zbzM37pmz4in2NpuykVWDQp3ZbU2XMBlyKq/zWmC70kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avSAzUYq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avSAzUYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5457A1F000FF;
	Thu, 10 Sep 2026 01:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789003198;
	bh=oDipNlYNcyStzZVHxUhUgXSc/OJ0oYal8I6WDM6baF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=avSAzUYqIBPP1T45yqG5dN09Ccq2x7PtmKq7tY9k83/hN7h1dXkL26xOzPgN4DDvE
	 BsEwc5neMRLVukQSIJIYB/77ze3GOJgCwQXWAR22bqF7oT2pPwb1yKeAFm9yO29sD4
	 R7WM+KwM/F74/nDxE2q6TSXDmEtGl3mQT80Wo9h8iIU4j4jPQ08sFHhT9dCaw/Yl6t
	 633jn0m8TXqUwni1HWARcLxuc4qVH7fozPvqDB9DfzDtUDmoIwIci2szpNYCSsuPB5
	 HGiPMHKPttUzu4uvgD7hJLa+jvQdDMXNCgQnjZJ780CVwk53+DhEMtDrNU4vu9lKR+
	 TBXynxhYVjgww==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 3/6] tee: optee: teach the memory type check
 about RISC-V page attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: marouene.boubakri@oss.nxp.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910012057.106966-4-marouene.boubakri@oss.nxp.com>
References: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
 <20260910012057.106966-4-marouene.boubakri@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 01:19:57 +0000
Message-Id: <20260910011958.5457A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting bug: `pte_pgprot()` produces corrupted memory types fo=
r non-PMA (e.g., I/O) memory on RISC-V T-Head systems, which can lead to in=
valid memory attributes being installed.
- [High] `__check_mem_type` does not verify VMA coverage, allowing a TOCTOU=
 race to completely bypass the `is_normal_memory` check.
--

commit a7e70918fe97729d4caaa4509f60ba6abde233e2
Author: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

tee: optee: teach the memory type check about RISC-V page attributes

This commit updates optee_check_mem_type() to verify memory types on RISC-V.
It ensures that registered memory is normal cacheable memory by checking if
the Svpbmt (or T-Head equivalent) bits encoded in the page attributes are
cleared.

> diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
> index e046aff618286..c29bff2248485 100644
> --- a/drivers/tee/optee/call.c
> +++ b/drivers/tee/optee/call.c
> @@ -604,6 +604,14 @@ static bool is_normal_memory(pgprot_t p)
>  #elif defined(CONFIG_ARM64)
>  	return ((pgprot_val(p) & PTE_ATTRINDX_MASK) =3D=3D PTE_ATTRINDX(MT_NORM=
AL)) ||
>  	       ((pgprot_val(p) & PTE_ATTRINDX_MASK) =3D=3D PTE_ATTRINDX(MT_NORM=
AL_TAGGED));
> +#elif defined(CONFIG_RISCV)
> +	/*
> +	 * Svpbmt, or the T-Head equivalent, encodes non-cacheable and I/O
> +	 * memory in the memory type bits of the PTE, normal cacheable memory
> +	 * (PMA) has them cleared. Without Svpbmt the memory type only comes
> +	 * from the PMAs, the mask is empty and all mappings pass the check.
> +	 */
> +	return !(pgprot_val(p) & _PAGE_MTMASK);

[Severity: High]
This isn't a bug introduced by this patch, but on RISC-V T-Head systems, can
pte_pgprot() produce corrupted memory types for non-PMA (e.g., I/O) memory?

Looking at pte_pgprot() in arch/riscv/include/asm/pgtable.h:

	return __pgprot(pte_val(pfn_pte(pfn, __pgprot(0))) ^ pte_val(pte));

The pte_pgprot() function XORs pte_val(pfn_pte(pfn, __pgprot(0))) with
pte_val(pte).

For T-Head systems, pfn_pte() implicitly sets _PAGE_PMA_THEAD via
ALT_THEAD_PMA if no memory type is present in the pgprot.

XORing this implicitly-added _PAGE_PMA_THEAD with an I/O mapping's
_PAGE_NOCACHE_THEAD yields a corrupted, invalid memory type mask (neither
valid PMA nor NOCACHE). Any path reusing or modifying page protection of an
existing I/O or device mapping on T-Head systems could expose the system to
architectural instability and data corruption due to invalid memory attribu=
tes
being installed.

Since this code relies on the memory type bits in pgprot_t p via
_PAGE_MTMASK, would this corruption affect the check here?

>  #else
>  #error "Unsupported architecture"
>  #endif

[Severity: High]
This is a pre-existing issue, but does __check_mem_type() fail to verify VMA
coverage, allowing a Time-of-Check to Time-of-Use (TOCTOU) race?

Looking at __check_mem_type() below in drivers/tee/optee/call.c:

	for_each_vma_range(vmi, vma, end) {
		if (!is_normal_memory(vma->vm_page_prot))
			return -EINVAL;
	}

If userspace maps non-normal memory (e.g., write-combined or device memory)
and invokes registration, could it concurrently unmap the region after the
pages are pinned (e.g., in tee_shm_register_user_buf()) but before
__check_mem_type() is called?

Because for_each_vma_range() silently skips holes, if the region is
completely unmapped, the loop wouldn't execute, and the function would retu=
rn 0
(success).

This bypasses the memory type check and allows malicious userspace to regis=
ter
non-normal memory with OP-TEE. OP-TEE would map it as Normal Cacheable memo=
ry,
causing a memory attribute mismatch that can trigger asynchronous external
aborts, system hangs, or cache coherency issues.

Are there missing VMA coverage checks to prevent unmapped regions with
still-pinned pages from passing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910012057.1069=
66-1-marouene.boubakri@oss.nxp.com?part=3D3
