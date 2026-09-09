Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B073E44ED
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966736; cv=none; b=iffFVVUxrY3ieIfiEoLbq1YDXjE59vZnwJQAot1z2uPFnA4cCRVV8uMjzaLPPZgDbf/5wqXbcYRQoIDU3YedAKFgoYeMWKUA0rWd5wwiRKdyDM0vzUIaLqI2M21eOclJWnzXzWy1cNi0oapTs9wWKWh8r9G6bAucOV4dff1RlVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966736; c=relaxed/simple;
	bh=3wEI4R5v8XkdPny7EualEEJqyPYbwu0sPVlFajXpQ/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JGanhPV8/kBo+5tWr+Qn/u3vSyQy3rxmfH7DgsXZW009mfsT+YEPMMkuFSLj99yfvfleJPxmC7NTBjssPimjlWqyRt+drKa/1KqYRlvzRInYUXRX681NlooCjPecKqieAOME7+O9JNXhbOK2lTa6kJNdMMw1HDI2+ajPGSFB6hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TslYQJ3Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TslYQJ3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7330C1F00A3A;
	Wed,  9 Sep 2026 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966734;
	bh=Q0sPrvLwYPBfvyUQkR0231C31/SRIVQrjjARGXRjkoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TslYQJ3Y4z6C3TSO3FcV1nCmEpq+5uB0tsLbiKk5FCgSu5HhkSYrRaY1A9PNLPXUB
	 GGNb4Xf2VWi/AEF2sN7gZ/4Yoim6jiCX5f0zfSBG/8ldAPlD+OZRF5p0YjKebsdUlY
	 Mo5y7zaz3bKCaMre/Q+eIensyOrK3C4aGQ278b42DzudDIWV8RsLpT4dTfjFQPvEH3
	 ATv0IE10JZiVMvYpmLPEYlPVN0i6FAIil3cV5CD13kGcHRdXGX5V1E/+Whhk4TrBS4
	 Pz6S0R7iFuYqGDHVcAtXge4fl1bo+FsrthuVVaizKo8+/bTyGApIeh+qCMdTkp8h5B
	 75EfnLGCj0BEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/13] iommu: of_iommu: Add support for
 "iommu-ranges" on a device node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-4-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-4-2fe43ae45495@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 15:12:14 +0000
Message-Id: <20260909151214.7330C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Integer overflow when computing `pos->end + 1` causes incorrect ov=
erlapping reserved regions or zero-length reservations.
- [High] Breaks backward compatibility for `iommu-addresses` nodes without =
a `reg` property or with pure IOVA reservations.
- [Medium] Error paths fail-open and silently grant the device unrestricted=
 IOVA access instead of restricting it.

Pre-existing issues:
- [High] Desynced DT property parsing when a phandle does not match `dev->o=
f_node` causes missing reservations.
- [High] Missing check for NULL return from `of_translate_dma_region` cause=
s NULL pointer dereference on the next iteration.
--

commit f881f2df9648f21e02230f5cfd4a02463cb42a63
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

iommu: of_iommu: Add support for "iommu-ranges" on a device node

This commit introduces support for the iommu-ranges property to allow
devices to specify their IOVA ranges without a backing reg property. It
derives implicit reserved regions for anything outside these ranges and
restricts iommu-addresses to only be used when paired with a reg property.

Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kern=
el.org
Link: https://github.com/devicetree-org/dt-schema/pull/207

> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index a18bb60f6f3df..1b014666d6b8e 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -190,6 +190,90 @@ iommu_resv_region_get_type(struct device *dev,
>  	return IOMMU_RESV_RESERVED;
>  }
> =20
> +/**
> + * of_iommu_derive_resv_regions - derive reserved regions which
> + *                                are outside of iommu-ranges

[ ... ]

> +	maps =3D of_get_property(dev->of_node, "iommu-ranges", &size);
> +	if (!maps)
> +		return;
> +
> +	end =3D maps + size / sizeof(__be32);
> +
> +	while (maps < end) {
> +		phys_addr_t iova;
> +		size_t length;
> +
> +		maps =3D of_translate_dma_region(dev->of_node, maps, &iova, &length);
> +		if (!maps) {
> +			dev_err(dev, "failed to parse iommu-ranges\n");
> +			break;
> +		}

[ ... ]

> +	}
> +
> +	if (list_empty(&ranges))
> +		return;

[Severity: Medium]
If parsing fails and the loop breaks early, or if the ranges evaluate to
0 length, the ranges list will be empty and this path returns early without
deriving any reserved regions. Does this silently fail-open and grant the
device unrestricted IOVA access instead of restricting it?

> +
> +	if (of_dma_is_coherent(dev->of_node))
> +		prot |=3D IOMMU_CACHE;
> +
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		if (pos->start > next) {
> +			region =3D iommu_alloc_resv_region(next, pos->start - next, prot,
> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
> +			if (region)
> +				list_add_tail(&region->list, list);
> +		}
> +		if (pos->end + 1 > next)
> +			next =3D pos->end + 1;

[Severity: High]
If an explicitly allowed iommu-ranges entry extends to the end of the
physical address space (for example, 0xFFFFFFFF on a 32-bit system), could
pos->end + 1 wrap around to 0?

If it wraps to 0, the condition (0 > next) evaluates to false, leaving
the next variable stale.

> +
> +		list_del(&pos->node);
> +		kfree(pos);
> +	}
> +
> +	region =3D iommu_alloc_resv_region(next, ~(phys_addr_t)0 - next + 1,
> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);

[Severity: High]
If next is left stale due to the wrap-around above, will this final
allocation use the stale next value to reserve the remainder of the address
space, erroneously covering the explicitly allowed IOVA space?

> +	if (region)
> +		list_add_tail(&region->list, list);
> +}
> +
>  /**
>   * of_iommu_get_resv_regions - reserved region driver helper for device =
tree

[ ... ]

> @@ -214,10 +298,14 @@ void of_iommu_get_resv_regions(struct device *dev, =
struct list_head *list)
> =20
>  		memset(&phys, 0, sizeof(phys));
> =20
> +		maps =3D of_get_property(it.node, "iommu-addresses", &size);
> +		if (!maps)
> +			continue;
> +
>  		/*
> -		 * The "reg" property is optional and can be omitted by reserved-memor=
y regions
> -		 * that represent reservations in the IOVA space, which are regions th=
at should
> -		 * not be mapped.
> +		 * "iommu-addresses" must be used in combination with a "reg" that pro=
vides
> +		 * the physical address and size of this memory region, for an identit=
y 1:1
> +		 * IOVA mapping to that physical memory.
>  		 */
>  		if (of_property_present(it.node, "reg")) {
>  			err =3D of_address_to_resource(it.node, 0, &phys);
> @@ -226,11 +314,11 @@ void of_iommu_get_resv_regions(struct device *dev, =
struct list_head *list)
>  					it.node, err);
>  				continue;
>  			}
> -		}
> -
> -		maps =3D of_get_property(it.node, "iommu-addresses", &size);
> -		if (!maps)
> +		} else {
> +			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
> +				it.node);
>  			continue;
> +		}

[Severity: High]
Does this explicitly reject legacy Device Tree nodes that lack a reg proper=
ty?
Existing Device Trees using iommu-addresses to describe pure IOVA reservati=
ons
without a reg property might fail to parse here, leaving the IOVA space
unreserved. Could this break backward compatibility and violate the DT stab=
le
ABI guarantee?

>  		end =3D maps + size / sizeof(__be32);
> =20
>  		while (maps < end) {
>  			struct device_node *np;
>  			u32 phandle;
> =20
>  			phandle =3D be32_to_cpup(maps++);

[Severity: High]
This is a pre-existing issue, but if of_translate_dma_region() returns NULL
during the previous iteration, does this dereference a NULL pointer?

>  			np =3D of_find_node_by_phandle(phandle);
> =20
>  			if (np =3D=3D dev->of_node) {
>  				int prot =3D IOMMU_READ | IOMMU_WRITE;
>  				struct iommu_resv_region *region;
>  				enum iommu_resv_type type;
>  				phys_addr_t iova;
>  				size_t length;
> =20
>  				if (of_dma_is_coherent(dev->of_node))
>  					prot |=3D IOMMU_CACHE;
> =20
>  				maps =3D of_translate_dma_region(np, maps, &iova, &length);

[Severity: High]
This is a pre-existing issue, but does this overwrite the loop iterator maps
with a potentially NULL return value without validation? If it returns NULL
due to a parsing error, the next iteration will evaluate maps < end as true
since NULL is less than the end pointer boundary.

[Severity: High]
Also a pre-existing issue, but if np does not match dev->of_node, the code
skips processing the region. Is there a missing else block here to advance =
the
maps pointer over the iova and length cells?

Without it, the next iteration will read the first cell of the ignored iova
as the next phandle, throwing the parser out of sync and causing subsequent
reservations to be silently ignored.

> @@ -258,6 +346,9 @@ void of_iommu_get_resv_regions(struct device *dev, st=
ruct list_head *list)
>  				}
>  				type =3D iommu_resv_region_get_type(dev, &phys, iova, length);
> =20
> +				if (type !=3D IOMMU_RESV_DIRECT)
> +					continue;

[Severity: High]
Does this drop any pure IOMMU_RESV_RESERVED regions that were previously
supported and parseable before this patch?

> +
>  				region =3D iommu_alloc_resv_region(iova, length, prot, type,
>  								 GFP_KERNEL);
>  				if (region)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-vpu_iommu_=
iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com?part=3D4
