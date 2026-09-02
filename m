Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AD947206A
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347219; cv=none; b=czl6GbM5TmeHmil0vy0HPYd1PPE2tQ5s3+gc82Ij8Kh65strbv8BfFgj9MHtzu9NNBVVPvN4ieL529qez6EIsEbE32qSNrUQ67/v9O3N2WmJ2/RWPUqfJI6pG886uDO10aYdBYXjidOUAY3xnYewiuF5LBtQ5tvRXv8BsVEDikA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347219; c=relaxed/simple;
	bh=/5f5D55jfN4rhyP0EHoJJOv0BFZ/yZKfvyoD72Fi37c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VvLA57PHtCbPhRGnhcw0qy8ibuDOd9C86lrPLSQ9Am+44e572mnOw2U6hzOTja66XfRuvqKXbqkvJFiXfcDgdUsbeD/MpanJ4s+QE5IVpvBa5unIqCHbCfXvee+QsdjZPdIRio2fi7oaLPaNT3wowk8ojIWqNOW0/wgqEc4RT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3tfwvMp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3tfwvMp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E4D1F000E9;
	Wed,  2 Sep 2026 11:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347218;
	bh=vU3cSPtC+p8jCrA5hM8vCWpFOeGC1Kh+zGgDKjXLRYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G3tfwvMpbFBtzlo1wgVSWsKdD88Z82H8IavH+Lq2hk4EKqn3lAqEh3NzOpBw9g/bR
	 OCXyi/kqmxLEeE3U2Is/4ooRWhgo1zqJJN6wlB4hYCxBncyr+vtKuTgbENTmqSv3sS
	 zbng8umtKKjR/IjgvTmOXrZqg4/TCf5bY9AqUqVG9+jTXJCWOc6CIWtTxcgsihtK1f
	 yf5hNtl+lattbYA2mBQj0kp6i4rBW0aH11hJTtvsXoHvnAb+Y04VNVwx1VZIAKVEfa
	 vMZIbeZZ7jZOcR9EE+10i40tB4S+HSp969bM9lKm3CuC6dzXDH9ebfCYQB6g67NlLc
	 5ZHBNdl/qMqEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 09/10] firmware: arm_ffa: Introduce ffa-lend-pool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Donnefort" <vdonnefort@google.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902104712.2399797-10-vdonnefort@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-10-vdonnefort@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:06:57 +0000
Message-Id: <20260902110657.F0E4D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing TLB flush after invalidating direct map PTEs allows specul=
ative reads.
- [High] Lockless TOCTOU data race on `dev->cma_area` leading to potential =
NULL pointer dereference.
- [High] Unsafe struct page pointer arithmetic across sparse memory section=
 boundaries.
--

commit 8e8290aac241785be21b825c484422d3877b1940
Author: Vincent Donnefort <vdonnefort@google.com>

firmware: arm_ffa: Introduce ffa-lend-pool

This commit introduces the arm,ffa-lend-pool reserved-memory CMA driver
to prevent fatal CPU speculative reads from Non-Secure memory by unmapping
pages before lending and restoring them upon reclaim.

> diff --git a/drivers/firmware/arm_ffa/lend_pool.c b/drivers/firmware/arm_=
ffa/lend_pool.c
> new file mode 100644
> index 0000000000000..67a36f5d5aa68
> --- /dev/null
> +++ b/drivers/firmware/arm_ffa/lend_pool.c
[ ... ]
> +static bool ffa_lend_pool_contains(struct device *dev, phys_addr_t addr,=
 size_t size)
> +{
> +	phys_addr_t base, end;
> +
> +	if (!dev)
> +		return false;
> +
> +	guard(rcu)();
> +
> +	if (xa_load(&ffa_lend_devices, (unsigned long)dev) !=3D dev)
> +		return false;
> +
> +	if (WARN_ON_ONCE(!dev->cma_area))
> +		return false;
> +
> +	base =3D cma_get_base(dev->cma_area);

[Severity: High]
Could there be a time-of-check to time-of-use (TOCTOU) race here?

If ffa_lend_pool_device_release() is called concurrently (e.g., during
device unbind) and clears the pointer without waiting for an RCU grace
period:

ffa_lend_pool_device_release() {
    xa_erase(&ffa_lend_devices, (unsigned long)dev);
    dev->cma_area =3D NULL;
}

The compiler can emit two separate loads for dev->cma_area in
ffa_lend_pool_contains(). If the pointer is cleared between the
WARN_ON_ONCE() check and the cma_get_base() call, cma_get_base() might
dereference a NULL pointer.

> +	end =3D base + cma_get_size(dev->cma_area);
> +
> +	return addr >=3D base && (addr + size) <=3D end;
> +}
[ ... ]
> +int ffa_prepare_lend(struct device *dev, phys_addr_t addr, size_t size)
> +{
> +	unsigned long nr_pages =3D size >> PAGE_SHIFT;
> +	struct page *page;
> +	unsigned long i;
> +	int ret;
> +
> +	if (!ffa_lend_pool_contains(dev, addr, size))
> +		return -ENODEV;
> +
> +	page =3D pfn_to_page(PHYS_PFN(addr));
> +	for (i =3D 0; i < nr_pages; i++) {
> +		ret =3D __set_direct_map_invalid_noflush(page + i);

[Severity: High]
Is it safe to use contiguous pointer arithmetic (page + i) for struct page
iteration here?

On architectures where CONFIG_SPARSEMEM is enabled but
CONFIG_SPARSEMEM_VMEMMAP is not (such as 32-bit ARM, which the FF-A
transport supports), the struct page array is broken up into sections and
is not virtually contiguous.

If the CMA region crosses a memory section boundary (e.g., a 64MB region
crossing a 16MB or 32MB section boundary), would this arithmetic point to
unmapped memory or invalid section metadata?

> +
> +		if (ret) {
> +			while (i--)
> +				__set_direct_map_default_noflush(page + i);
> +
> +			return ret;
> +		}
> +	}
> +
> +	return 0;

[Severity: High]
Does this sequence leave stale unmapped entries in the TLB?

By returning success after __set_direct_map_invalid_noflush() without ever
calling flush_tlb_kernel_range() (or an equivalent TLB flush), can
speculative execution still use the cached TLB entries to read the memory?

If TrustZone transitions the memory to the Secure state while valid
translations remain cached, could these speculative accesses still cause
the fatal exceptions this patch intends to prevent?

> +}
> +EXPORT_SYMBOL_GPL(ffa_prepare_lend);
> +
> +/**
> + * ffa_lend_reclaimed() - Restore a reclaimed FF-A memory region
> + * @dev:	Device attached to the lend pool
> + * @addr:	Physical start address of the memory region
> + * @size:	Size in bytes
> + *
> + * Restores a memory range into the kernel's direct mapping. It must be =
called
> + * after a successful FF-A memory reclaim invocation.
> + */
> +void ffa_lend_reclaimed(struct device *dev, phys_addr_t addr, size_t siz=
e)
> +{
> +	unsigned long nr_pages =3D size >> PAGE_SHIFT;
> +	struct page *page;
> +	unsigned long i;
> +
> +	if (!ffa_lend_pool_contains(dev, addr, size))
> +		return;
> +
> +	page =3D pfn_to_page(PHYS_PFN(addr));
> +	for (i =3D 0; i < nr_pages; i++)
> +		__set_direct_map_default_noflush(page + i);

[Severity: High]
Similar to ffa_prepare_lend() above, does this struct page arithmetic
(page + i) risk crashing across sparse memory section boundaries?

> +}
> +EXPORT_SYMBOL_GPL(ffa_lend_reclaimed);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902104712.2399=
797-1-vdonnefort@google.com?part=3D9
