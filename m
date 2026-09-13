Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1079D36B939
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326422; cv=none; b=LOPj+173fE/nevtu5LUqFYBLfv81b/PFfi3CDEXNPNanQQOYbt8ZGWw/0LfgBEED84ioLGtCMNsmAETPeJsnNg+1YPm9wkmuA1bCxvSy9lie8RnvUCRg5M+6/gJUgJc12+bWMfijTStdZe95BVlckW52fM89+8rt2iDinA7QQiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326422; c=relaxed/simple;
	bh=wDL3rm9PLxv4Z9qc52yagbKE/QE2AJr686rPWje0tII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HRNsFXkInhXITZv/MReu/PdeWHP9Nzoe/myvdmQ47dgI252ngCVrcO4t402sUzGu0tJ78t8LhPr9THMRPmo9E8bUY2vPbL4kVt4DMMaa4bBDCe4D1p/ewSRi8ijtUTmtbptnld49uQvJ9VDJT7+4GJ8MWvHwaNwFsFtoy73rc24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aij4U4it; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aij4U4it"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEA51F000FF;
	Sun, 13 Sep 2026 19:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326420;
	bh=/PuA+OmFBft4qUBGjVAAbw0kGHJwi80Yjwu4O9Z9ORU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aij4U4ith00efFtBRqj1RON8pN7QgUYRmJRDWwQvV09DHpN5iWaEynUbJRgc04xR4
	 QeacJ/glh9AWGjWECx+Cbkcp0i09yuFNcAMyP75BJpmzcmOdY5zfOs44BdqiryZLiC
	 Z3LeyZIzJfkBiT5/O5ByxWQ//qQIGqgjv4gZ05IRO7V5HQCo3ROjt+jI9kLDYkS5Qg
	 7I2vnwvddsayIeJ5wkKWEbVM6LRaZqBUXmJwYIDk5qvke9iknQztIzRkr+svLowule
	 7IG1Op4f/yxujJ99q7imYfqtEObsHpQjK5rxiPi+M7eAnrVXNJwKRW8C4NZgZmjQia
	 K8Rj7p1y/GkPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/13] iommu: of_iommu: Add support for
 "iommu-ranges" on a device node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-4-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
 <20260914-vpu_iommu_iova_handling-v4-4-9b9074a73c41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 19:07:00 +0000
Message-Id: <20260913190700.5DEA51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [High] Breaks backward compatibility for existing Device Trees using iomm=
u-addresses without a reg property.
- [High] Silent fail-open behavior grants full IOVA access if iommu-ranges =
parsing or allocation fails.
- [High] Truncation of the remaining reserved region length on 32-bit syste=
ms with LPAE (64-bit phys_addr_t).
- [High] Mismatched direct mappings are discarded instead of being reserved=
, contradicting the emitted kernel warning.
- [High] of_translate_dma_region is called without validating that the prop=
erty buffer contains enough remaining cells.
- [High] of_translate_dma_region improperly translates IOVAs into CPU physi=
cal addresses, resulting in incorrect IOMMU reservations.
- [High] The overflow check iova + length < iova incorrectly rejects a vali=
d IOVA range that extends exactly to the maximum address.

Pre-existing issues:
- [High] Misparsing of multi-device iommu-addresses property due to incorre=
ct iterator advancement.
- [High] Unchecked return value from of_translate_dma_region leads to a NUL=
L pointer dereference.
--

commit e45b53e829ee68d166cf13e6d742c00ee86c9f4c
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

    iommu: of_iommu: Add support for "iommu-ranges" on a device node
   =20
    Reserving an IOVA address using "iommu-addresses" requires it to be
    placed in the reserved-memory node. But when "iommu-addresses" is the
    only property being described and there is no backing "reg" (i.e. no
    actual reserved system memory), it does not really belong under
    /reserved-memory. A device IOVA range is specific to its own address
    space, and does not describe the system physical memory to make it
    qualify under reserved-memory. Given this, place "iommu-addresses"
    inside reserved-memory only when it is paired with a "reg", otherwise,
    define it within the device own node. It was discussed here:
    https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel=
.org

> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index a18bb60f6f3df..baf74db838d6b 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -190,6 +190,98 @@ iommu_resv_region_get_type(struct device *dev,
>  	return IOMMU_RESV_RESERVED;
>  }
> =20
> +/**
> + * of_iommu_derive_resv_regions - derive reserved regions which
> + *                                are outside of iommu-ranges
> + * @dev: device for which to get reserved regions
> + * @list: reserved region list
> + *
> + * A device can describe its own usable IOVA ranges directly on its node
> + * via "iommu-ranges". Everything not under those ranges is derived
> + * as a reserved region so the IOMMU allocator won't use it. Entries may
> + * appear in any order in the property.
> + */
> +static void of_iommu_derive_resv_regions(struct device *dev, struct list=
_head *list)
> +{
> +	struct of_iommu_range {
> +		struct list_head node;
> +		phys_addr_t start;
> +		phys_addr_t end;
> +	} *pos, *new, *next_range;
> +	int size, prot =3D IOMMU_READ | IOMMU_WRITE;
> +	struct iommu_resv_region *region;
> +	const __be32 *maps, *end;
> +	phys_addr_t next =3D 0;
> +	LIST_HEAD(ranges);
> +
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

[Severity: High]
Does this code validate that the property buffer has enough remaining cells
before reading them? While the loop checks maps < end in
of_iommu_derive_resv_regions(), of_translate_dma_region() blindly reads
na + ns cells without bounds checking. Could a malformed iommu-ranges
property cause an out-of-bounds read of kernel memory?

Also, does this function incorrectly translate IOVAs into CPU physical
addresses? The iommu-ranges property specifies usable device IOVA ranges,
but of_translate_dma_region() translates the address through the parent
bus dma-ranges into a CPU physical address. Since IOMMU reserved regions
operate in the IOVA space, doesn't this corrupt the reservation targets
and leave the actual IOVA space unprotected?

> +		if (!maps) {
> +			dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
> +				dev->of_node);
> +			break;
> +		}
> +
> +		if (!length)
> +			continue;
> +
> +		if (iova + length < iova) {

[Severity: High]
Does this overflow check reject a valid IOVA range that extends exactly to
the maximum physical address? In of_iommu_derive_resv_regions(), if a
valid hardware IOVA mapping spans exactly to the end of the address space
limit, iova + length will wrap around to exactly 0. Since 0 < iova
evaluates to true, wouldn't this falsely reject the valid maximum-address
range as an overflow and leave that IOVA space completely unprotected?

> +			dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
> +				dev->of_node);
> +			continue;
> +		}
> +
> +		list_for_each_entry(pos, &ranges, node)
> +			if (pos->start > iova)
> +				break;
> +
> +		new =3D kmalloc_obj(*new);
> +		if (!new)
> +			continue;
> +
> +		new->start =3D iova;
> +		new->end =3D iova + length;
> +		list_add_tail(&new->node, &pos->node);
> +	}
> +
> +	if (list_empty(&ranges))
> +		return;

[Severity: High]
Does this fail-open instead of fail-secure if iommu-ranges parsing or
memory allocation fails? If of_translate_dma_region() returns NULL for a
malformed property or kmalloc_obj() fails in
of_iommu_derive_resv_regions(), the loop breaks or continues, leaving the
ranges list empty. This early return would then exit without adding any
reserved regions, effectively telling the IOMMU that the entire address
space is usable instead of restricting it.

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
> +		if (pos->end > next || !pos->end)
> +			next =3D pos->end;
> +
> +		list_del(&pos->node);
> +		kfree(pos);
> +	}
> +
> +	if (!next)
> +		return;
> +
> +	region =3D iommu_alloc_resv_region(next, ~(phys_addr_t)0 - next + 1,
> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);

[Severity: High]
Can this truncate the length calculation on 32-bit systems with LPAE?
In of_iommu_derive_resv_regions(), the remaining address space length is
calculated as ~(phys_addr_t)0 - next + 1. On 32-bit LPAE systems,
phys_addr_t is 64-bit, but iommu_alloc_resv_region() expects a size_t
for length, which is 32-bit. Wouldn't this cast to size_t silently
truncate the 64-bit length, restricting the reservation up to the 4GB
boundary and leaving the remaining 64-bit IOVA space unreserved?

> +	if (region)
> +		list_add_tail(&region->list, list);
> +}

[ ... ]

> @@ -214,10 +306,14 @@ void of_iommu_get_resv_regions(struct device *dev, =
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
> @@ -226,11 +322,11 @@ void of_iommu_get_resv_regions(struct device *dev, =
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
Does this break backward compatibility for existing Device Trees?
The previous code in of_iommu_get_resv_regions() explicitly documented
and handled the reg property as optional for IOVA reservations. By
introducing a strict requirement and failing if reg is missing, wouldn't
older Device Trees that omitted reg now fail to parse, resulting in an
ABI breakage?

> =20
>  		end =3D maps + size / sizeof(__be32);
> =20
>  		while (maps < end) {
>  			struct device_node *np;
>  			u32 phandle;
> =20
>  			phandle =3D be32_to_cpup(maps++);
>  			np =3D of_find_node_by_phandle(phandle);
> =20
>  			if (np =3D=3D dev->of_node) {

[Severity: High]
This is a pre-existing issue, but does this loop correctly advance the
maps pointer when np !=3D dev->of_node? In of_iommu_get_resv_regions(), if
the current phandle does not match, it skips processing but fails to
advance maps by the size of the unhandled IOVA range (na + ns). Wouldn't
the next iteration then incorrectly read an IOVA cell as a phandle,
causing a parser desync?

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
This isn't a bug introduced by this patch, but does the return value of
of_translate_dma_region() need to be checked for NULL? In
of_iommu_get_resv_regions(), if it fails and returns NULL, it is assigned
to maps. The loop condition maps < end will evaluate to true, and the
next iteration will call be32_to_cpup(maps++), resulting in a NULL
pointer dereference.

>  				if (length =3D=3D 0) {
>  					dev_warn(dev, "Cannot reserve IOVA region of 0 size\n");
>  					continue;
>  				}
>  				type =3D iommu_resv_region_get_type(dev, &phys, iova, length);
> =20
> +				if (type !=3D IOMMU_RESV_DIRECT)
> +					continue;

[Severity: High]
Does this skip creating the reservation when the mapping is not direct?
In of_iommu_get_resv_regions(), the iommu_resv_region_get_type() helper
detects non-direct mappings, warns the user it is treating them as
reservations, and returns IOMMU_RESV_RESERVED. By forcefully skipping
when type is not IOMMU_RESV_DIRECT, doesn't this entirely drop the region
instead of creating the reservation, contradicting the helper's intent
and breaking existing IOVA reservations?

> +
>  				region =3D iommu_alloc_resv_region(iova, length, prot, type,
>  								 GFP_KERNEL);
>  				if (region)
>  					list_add_tail(&region->list, list);
>  			}
>  		}
>  	}
> +
> +	of_iommu_derive_resv_regions(dev, list);
>  #endif
>  }
>  EXPORT_SYMBOL(of_iommu_get_resv_regions);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-vpu_iommu_=
iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com?part=3D4
