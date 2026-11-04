Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809792;
	b=JXHbn9wSO1GP5aeGFyoEd5MYvTCpPsed0yFQlBgyNKPtJ9hDOjrF1GnEIJE6Svge+EZA
	 xo4RgEpQzrkaCALdIlTxvOLObNq1SOvkurbHri3vc+dj0yyHeaZhSRwqIandR6I5vSFSN
	 zq5y+5/K30XGM3y1gSQNP6W29tfGXZD1uMiOvv3TyZ+hU8f7sNvlTe+knXiq3v3sZ4bkv
	 5e7iHYCaw4F05WJwOVEKnVIhCAP3jck/h7MJnNkGHF53ZVwbh7N9g1/zGKH6RjE0Z1phW
	 KDHuGxKS9viOUUVA57oYZR7uGJt79xbaDhYfcMANk2F8GRkM5B4GKLqQLdoDZFeUd/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809792;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=atDiQ1jLywCaP3AyVEImB+gZltQy0V8BagrbxL0rfyY=;
	b=Dcs4JGv3oOFgM0QCl96LzJl58Xl4xlgOnSGVQSzPIQvfFVTfUfVriK4xG9m+AjyWetN7
	 8CVArta1e/qIPpJgGPYkRAkSpmbqxHvGqISbuTSw99s+fKM2FixAlANYzlDkux4A+dn0N
	 cPdvllqst7iVGz1QZlAPvTkaLRZ7+muNTyA2TdPrpNURBOZwv4eta4ytGGW+9YOgHy2bI
	 gS9Cy1xBLKWun2KLw9KUiUJMc0rJfiBj/zTeJ7rfj5jKmKoZdGmJbsP19tMdsPDiK2Prf
	 4B6xDCxP/MDiwaojjvLyoKZ6RdsNGUUiZCO9LYFAJqyvEpqd0W/8dFsEq56E7GhRtFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b47bOC/3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032F4606A339
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b47bOC/3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E471F000C1;
	Wed,  4 Nov 2026 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809791;
	bh=atDiQ1jLywCaP3AyVEImB+gZltQy0V8BagrbxL0rfyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b47bOC/3A0RxnUdzrGef+aXOt5L92xLNPUSE5A24szrut0A3kwfnv5GWFo0Rmw85F
	 5Tdc/bfgkA1gTlKdM81tunrILY6eokjbGK+/nznxio0+VmOHSS6yWR/K4pch4WGfao
	 X2DC1SLRl6EPej/gADIMREih6WMk3VAUk1SsSnmcGdsSUZUeYeijaW8I5LxE64siT8
	 WKftT+EeRQuUm7+D6LB06kaL/XBI+8Rm8ri7O6/5letBBW2NOtTNrGUsp40RnchhhW
	 pjkd+4ixoPoxzTj4L9EZ3vouC5W4EmnsmzbuEWe1yrwmAZZnqWDTtJ310ri2gkvA1J
	 g0SZpdQQQjhYg==
Message-ID: <sashiko-outbox-197614@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] mm/cma: reject CMA areas that overlap the kernel
 image
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>, robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, m.szyprowski@samsung.com, robin.murphy@arm.com, baoquan.he@linux.dev, pasha.tatashin@soleen.com, pratyush@kernel.org
Cc: devicetree@vger.kernel.org, linux-mm@kvack.org, kexec@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20261103162429.2053989-4-radhey.shyam.pandey@amd.com>
References: <20261103162429.2053989-1-radhey.shyam.pandey@amd.com>
 <20261103162429.2053989-4-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:29:50 +0000
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
- [High] mm/cma: __pa_symbol(_text) triggers BUG() on arm32 DEBUG_VIRTUAL
--

commit efca63a89d010b4bf63ea1571c8931374f2ec14d
Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

mm/cma: reject CMA areas that overlap the kernel image

This commit updates cma_init_reserved_mem() to reject CMA regions that
overlap the kernel image range [_text, _end) so that cma_activate_area()
cannot free kernel image pages into MIGRATE_CMA.

> diff --git a/mm/cma.c b/mm/cma.c
> index 9c53b2b70dc8f..3231a53161cda 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -31,6 +31,8 @@
>  #include <linux/kmemleak.h>
>  #include <trace/events/cma.h>
> =20
> +#include <asm/sections.h>
> +
>  #include "internal.h"
>  #include "cma.h"
>  #include "mm_init.h"
> @@ -68,6 +70,16 @@ bool cma_has_dynamic_base(const struct cma *cma)
>  	return test_bit(CMA_DYNAMIC_BASE, &cma->flags);
>  }
> =20
> +static bool cma_overlaps_kernel_image(phys_addr_t base, phys_addr_t size)
> +{
> +	phys_addr_t end;
> +
> +	if (check_add_overflow(base, size, &end))
> +		return true;
> +
> +	return base < __pa_symbol(_end) && __pa_symbol(_text) < end;
> +}
> +
>  static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
>  					     unsigned int align_order)
>  {
> @@ -295,6 +307,15 @@ int __init cma_init_reserved_mem(phys_addr_t base, p=
hys_addr_t size,
>  	if (!size || !memblock_is_region_reserved(base, size))
>  		return -EINVAL;
> =20
> +	if (cma_overlaps_kernel_image(base, size)) {
> +		phys_addr_t text =3D __pa_symbol(_text);
> +		phys_addr_t end =3D __pa_symbol(_end);
> +
> +		pr_err("area %s (%pa, size %pa) overlaps kernel image [%pa-%pa]\n",
> +		       name ?: "(unnamed)", &base, &size, &text, &end);
> +		return -EBUSY;
> +	}

[Severity: High]
Is __pa_symbol(_text) safe to call in architecture-independent CMA code?

In include/asm-generic/sections.h, _text is noted as architecture-specific:

    * _text, _data: architecture specific, don't use them in arch-independe=
nt code

On 32-bit ARM, arch/arm/kernel/vmlinux.lds.S places _text at the start of
.head.text before _stext:

    .head.text : {
        _text =3D .;
        HEAD_TEXT
    }

while arch/arm/include/asm/memory.h defines KERNEL_START starting at _stext
(or _sdata on CONFIG_XIP_KERNEL):

    #ifdef CONFIG_XIP_KERNEL
    #define KERNEL_START		_sdata
    #else
    #define KERNEL_START		_stext
    #endif
    #define KERNEL_END		_end

When CONFIG_DEBUG_VIRTUAL=3Dy is enabled on 32-bit ARM, __pa_symbol(_text)
calls __phys_addr_symbol() in arch/arm/mm/physaddr.c:

    phys_addr_t __phys_addr_symbol(unsigned long x)
    {
        /* This is bounds checking against the kernel image only.
         * __pa_symbol should only be used on kernel symbol addresses.
         */
        VIRTUAL_BUG_ON(x < (unsigned long)KERNEL_START ||
                       x > (unsigned long)KERNEL_END);
        return __pa_symbol_nodebug(x);
    }

Because _text is below KERNEL_START on 32-bit ARM, won't calling
cma_init_reserved_mem() -> cma_overlaps_kernel_image() with
base < __pa_symbol(_end) trigger VIRTUAL_BUG_ON() during early boot?

In addition, on 32-bit ARM with CONFIG_XIP_KERNEL=3Dy (where _text is linked
in ROM below PAGE_OFFSET while only [_sdata, _end) is in RAM) and on sparc64
(where [_text, _end) is linked at KERNBASE rather than in the PAGE_OFFSET
linear map), won't __pa_symbol(_text) also compute bogus physical addresses
for the kernel image?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103162429.2053=
989-1-radhey.shyam.pandey@amd.com?part=3D3
