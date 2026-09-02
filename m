Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4047044E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347209; cv=none; b=aYKukGkzUMg3h5/6eUWLt4vsUYlDZKaJjeWkGX7zsitGaVG7C3+q3MBFOUaU0E8Yx0Msk3SZ8MEgVPB7DA4FRp/zXDqPOt2fxQuFxhFcYje4T5o5gdPJsF41djLB4/nZlZuYvaZh2uYKOisbDv7rzz/t/L4/HIeyVFokoY/9hX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347209; c=relaxed/simple;
	bh=htvKw7eQ41AMD0DxvNVnHuoOsifIj4b5iRtOn7+EFtg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uJk5NzFQ34PwDg7Kpos3VFZY3/YOma5AJur170ApDNFgmhsb3YpmoAfZD8JutabeW163Wp7pjFyI5mseHY1pSrcZn45ht+03vn2wHzpR4/Z0CHf/BrHDybwRRGqC+cj7HWSRIvMazuliBEuTFmSU7mfTEwegnsz4906ZV6kmBGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJW7qP4Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJW7qP4Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258B31F000E9;
	Wed,  2 Sep 2026 11:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347207;
	bh=fOgLgMazn/am8LmkkuLIk7kWpdK9uiLvJUoXossXXMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LJW7qP4Z46kS//f5ZzfhxbRE4PQDfFZ/F/6tEBgSRNnb/Y2OBQF6tNYQdmH1W2dEE
	 tKqOgq7WKA25zqKpceHeVoN6PZikJJA8Jmmm+w6aWfrgJra/EKG10qyzJOAUfD8zmM
	 O+k380y5SCs9Xk8kLAW4GHRYeHGwaNE7TX7ejnTyWvQd4GOT5T1COAOOlvdz7cZHZ1
	 XFHt0n+OZ8nI3Zdp0HyRnWnCzXEyG4CDBuqJfGyiPiCuFdnWiLH4TeaCjXRp6OH3lO
	 xMJ+tGpw9nKdJt57kFOknmCKKwY4vH1aNv9NONFF4VygPKf/qIGxgRQnkm/A2jWwrl
	 eN/IxIfRHJlRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/10] arm64: Implement can_set_direct_map_range()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Donnefort" <vdonnefort@google.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902104712.2399797-7-vdonnefort@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-7-vdonnefort@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:06:46 +0000
Message-Id: <20260902110647.258B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Lockless page table walk uses standard offset macros causing naked=
 dereferences and unsafe multiple reads on folded levels.
- [High] The lockless walk loop fails to advance correctly when page-table =
levels are folded, silently skipping range checks.
--

commit de12d2156510af8d2a1f0b0adad3f96ba3b75cda
Author: Vincent Donnefort <vdonnefort@google.com>
Subject: arm64: Implement can_set_direct_map_range()

This commit adds an implementation for can_set_direct_map_range() on ARM64.
For systems where can_set_direct_map() is false, it verifies if a subregion
of the direct map is mapped at the last level by performing a lockless page
table walk.

> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 58898ae53f5d1..c59ef17eb0d06 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
[ ... ]
> +bool can_set_direct_map_range(struct page *page, unsigned long nr_pages)
> +{
[ ... ]
> +	/*
> +	 * If !can_set_direct_map() then no one can split blocks and it is safe
> +	 * to walk the page-table lockless.
> +	 */
> +	while (addr < end) {
> +		pud_t *pudp, pud;
> +		pmd_t *pmdp, pmd;
> +		pgd_t *pgdp;
> +		p4d_t *p4dp;
> +
> +		pgdp =3D pgd_offset_k(addr);
> +		if (pgd_none(READ_ONCE(*pgdp)))
> +			return false;
> +
> +		p4dp =3D p4d_offset(pgdp, addr);
[Severity: High]
Does this standard offset macro perform multiple reads of the same entry wh=
en
page-table levels are folded?

When lockless walk logic assumes all levels are live without checking for
folded levels, blindly applying multi-level READ_ONCE() causes the same
memory location to be read multiple times, risking stale or torn reads.

> +		if (p4d_none(READ_ONCE(*p4dp)))
> +			return false;
> +
> +		pudp =3D pud_offset(p4dp, addr);
> +		pud =3D READ_ONCE(*pudp);
> +		if (pud_none(pud) || pud_leaf(pud))
> +			return false;
> +
> +		pmdp =3D pmd_offset(pudp, addr);
[Severity: High]
Does this generic offset macro dereference the shared page table pointer
without using READ_ONCE()?

The generic pmd_offset() dereferences *pudp internally. This introduces a
naked dereference and data race during a lockless walk.

> +		pmd =3D READ_ONCE(*pmdp);
> +		if (pmd_none(pmd) || pmd_leaf(pmd))
> +			return false;
> +
> +		addr =3D pmd_addr_end(addr, end);
[Severity: High]
Can this fail to advance the loop correctly when page-table levels are
folded?

On a system with 2-level paging (like 64KB pages with 42-bit VA) where PMD
is folded, pmd_addr_end() unconditionally evaluates to the provided end
address.

If this occurs, the loop would only check the first entry and immediately s=
kip
the remainder of the range, falsely returning true. This could allow modify=
ing
direct map regions containing block mappings, subsequently triggering a
WARN_ON_ONCE and -EINVAL failure in pageattr_pmd_entry() because the
modification size won't align with the block size.

> +	}
> +
> +	return true;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902104712.2399=
797-1-vdonnefort@google.com?part=3D6
