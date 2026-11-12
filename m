Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481731;
	b=pjmNmDfwjCoT39W0GM88hvp54EdQP2Us7NDlbwoqN2snVpMNoAqssqtCUNDQc4DqkXQg
	 Wm5tEnG6I78hVCWG3SKO8X5/f01CNY7s42bOSBV1usEae6LSs46yfiDS4lYszadZDHcZr
	 mBcwp4XpzXLwi/oM9/fuRVySmnyFep0DffBLJmdLHjrM9Q3jya9UdbcntG+emAbnygxmi
	 Nl91zvt9nrzkjDdK/XNfcA0pBA85Lq7oruH2hNdm5H5XMVd4JzYaV9fQIGkdemQ3eEqIX
	 Bujzbek+xXKKWPtX2BVM+3oMsTrZwbyiyal4PLoAWDttG0QJAOHxj9SpWSXj3v3DZ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481731;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x7/yo1OPdWR339CVYUNb7xk1ugkvuCHgmsFdu8cHfQw=;
	b=0wH1S4851f3ifgQCt0gplnzVwSAZTquO0JJ5WYD/8nJUvhTTuNImFC/6TxyQJc4wb/Zs
	 8hYTW6Fy27ye2KXcbI7XgzMrRpBguM/Gkcjcmf1wx3kxMPwqy/YCa1XhcnKdGq8u64bmb
	 luSeaCagHJ8/7mOoLKlX7YaHA6tQSyx6eR3DfiHBCXX0Am2wbTlfkJmPpHWtiUlIVK8hY
	 Qg2GwPe8cqf5eYOBru9LyDeBcTuk2GGxIhQAPbjBuOb+z+rR/QnDr1TLrq4fLeuwGx3LY
	 dDmxrt4tNs82PJHrE4kNND12XkEYJHJt0Ys9sVl4VzoJ7tSabFL0e0L/rs0mHG4xbdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gybSGp1G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB577606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gybSGp1G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0D01F00A08;
	Thu, 12 Nov 2026 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481730;
	bh=x7/yo1OPdWR339CVYUNb7xk1ugkvuCHgmsFdu8cHfQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gybSGp1GQVcSoAD0/nMnlL4xCkjDD/owJ0OT/ZXq36W4QzTVudl98Da2U5XkVpaUT
	 Dyg80nmewRXnWJoDApapHFnH50KAz8uOy5BOkYFXBtTWbnfKYPYoT0zt2WexL/+lIH
	 xpTO3A24lM5QcqLnEwRVCJ86dX08yZ5YbheZEIh9XWCZGJrBwYatUAwzToGu48W5dO
	 YVtTUAlimwKFl4+chCr4l/2q8XKa8hh77lbZuQTee2G6z0FnvXyJj2/4tkh2t9UMxS
	 2yxUE1KPGQ7a3gI7zbRsa7Xa0nrkoz8q1deganigCT36hZjs1TpGWDoBN+KHJOoP1f
	 7O8zkh6l6gM+w==
Message-ID: <sashiko-outbox-210994@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] dma-mapping: Introduce lendable-dma-pool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Donnefort" <vdonnefort@google.com>, catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, linux-mm@kvack.org, op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
In-Reply-To: <20261111110738.872947-6-vdonnefort@google.com>
References: <20261111110738.872947-1-vdonnefort@google.com>
 <20261111110738.872947-6-vdonnefort@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 11:08:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dma-mapping: linux,cma-default lendable pool bypassed in
  dma_alloc_contiguous()
--

commit b8e3981ec38ba68b29bb5ed6b932c6f83a300db4
Author: Vincent Donnefort <vdonnefort@google.com>

dma-mapping: Introduce lendable-dma-pool

This commit introduces the "lendable-dma-pool" reserved-memory CMA driver
along with dma_zap_direct_map() and dma_restore_direct_map() to unmap DMA
pages from the kernel direct map before lending them to a secure world and
restore them upon reclaim.

> diff --git a/kernel/dma/lendable.c b/kernel/dma/lendable.c
> new file mode 100644
> index 0000000000000..85ac3ad10df03
> --- /dev/null
> +++ b/kernel/dma/lendable.c
> @@ -0,0 +1,243 @@

[ ... ]

> +int dma_zap_direct_map(struct device *dev, struct page *page, size_t siz=
e)
> +{
> +	unsigned int nr_pages =3D size >> PAGE_SHIFT;
> +	bool from_lendable, has_lendable;
> +	struct cma *cma;
> +	int ret;
> +
> +	if (!size || !PAGE_ALIGNED(size))
> +		return -EINVAL;
> +
> +	cma =3D dev_get_cma_area(dev);
> +	has_lendable =3D cma_is_lendable(cma);
> +	from_lendable =3D has_lendable && cma_has_range(cma, page, nr_pages);
> +
> +	if (!from_lendable && !can_set_direct_map())
> +		return has_lendable ? -EFAULT : -ENODEV;

[Severity: Medium]
Can dma_zap_direct_map() fail with -EFAULT for pages allocated via
dma_alloc_pages() or dma_alloc_coherent() when a lendable pool is
configured as "linux,cma-default" without a per-device memory-region?

When dev->cma_area is NULL, dev_get_cma_area(dev) returns
dma_contiguous_default_area, so has_lendable is true.  However,
dma_alloc_contiguous() skips dma_contiguous_default_area for single-page
allocations (returning NULL so the caller falls back to the buddy
allocator) and prefers dma_contiguous_numa_area[nid] when
CONFIG_DMA_NUMA_CMA is enabled:

kernel/dma/contiguous.c:dma_alloc_contiguous() {
    ...
	if (dev->cma_area)
		return cma_alloc_aligned(dev->cma_area, size, gfp);
	if (size <=3D PAGE_SIZE)
		return NULL;

#ifdef CONFIG_DMA_NUMA_CMA
	if (nid !=3D NUMA_NO_NODE && !(gfp & (GFP_DMA | GFP_DMA32))) {
		struct cma *cma =3D dma_contiguous_numa_area[nid];
    ...
}

As a result, those pages do not come from dma_contiguous_default_area,
cma_has_range() returns false, and dma_zap_direct_map() returns -EFAULT
whenever can_set_direct_map() is false.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111110738.8729=
47-1-vdonnefort@google.com?part=3D5
