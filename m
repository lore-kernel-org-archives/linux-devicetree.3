Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F70148850
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790405277; cv=none; b=anHu6wOtudgF/8MsN8gfPx67RgGckZNny+DA8v3n8bEQCTHTq+16tR/pbwbCXK6olKOjk/dcbRVm9Qx1KcIdpG5F7odJ7Ye2AEgVVYY73da2CjyvaqWsA7c+/daGg7MXwZfXu/djFGU2XVRta7W8e7jsjBIAadXnHEdm40ZhH5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790405277; c=relaxed/simple;
	bh=nCr45ujc3tlaXr3n8GbfEgtLZj3s5yohd/q59hPWbcs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g7MiKvIgYQsOb1d7S9s2WXV60yqQr0p+2FqoI2ow/x7M5TEJLNNRsT/Uzcyw3dpgx2Tzlok4ypMk0Kd4au4bhn9qR8tNgr/jQSV9363gg2AIWyBLzbwSYH7T3xUtu7TGJCrtiionh4ErhW/P1GnRTGDRJxqS3BeqZbF82g1xfMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D30zbaSl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D30zbaSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC931F00893;
	Sat, 26 Sep 2026 06:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790405275;
	bh=G+CqOY6DiE9n6WdgOEFQLFJa0JmcSfRUlrEwjZ63ApM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D30zbaSlg2TkZcI+qQ0JEIeDLpjRKS2oBwXO7Z+2VBy4WPVtPI5x1KIGMo01o22CS
	 Em0SWxIjrclyZqjG+gS8yO8nqOSajgahN835+u7LkpOp6betD7ikbed+NPy+58y+W3
	 zcMmEYAi9QXvUiNnwvfpGf5mTeXDPX3Afi+6WfPq/mm1gr1XgKpbXEo+cWUYu9eifx
	 8tE3tFTSUaTz7TdHPeSXkg3036vj/E2OXwkqJ5zm0KCKfaxd/V2sMnlUi2XINd3lkT
	 4HGncGmkueAGgEFEVGe1QYBkacEQ+NS+ih0oxocBCkeNED/FHYPyT0/riffIJbJiyy
	 ymWWrbA9EpU7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for
 "iommu-ranges" on a device node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 06:47:54 +0000
Message-Id: <20260926064755.4AC931F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] iommu: size_t truncation of derived reserved region length on 32-b=
it systems
- [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
- [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing mal=
formed iommu-ranges
--

commit 08a09989ffefcbf5d38171159dcc911ca993ff18
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

iommu: of_iommu: Add support for "iommu-ranges" on a device node

Add support for "iommu-ranges" on device nodes to specify usable IOVA
ranges directly when there is no backing "reg". Introduce logic to derive
reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
to be paired with a "reg" property.

Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kern=
el.org

> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index a18bb60f6f3df..9766a6944d0e1 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
[ ... ]
> +static void of_iommu_derive_resv_regions(struct device *dev, struct list=
_head *list)
> +{
[ ... ]
> +	maps =3D of_get_property(dev->of_node, "iommu-ranges", &size);
> +	if (!maps)
> +		return;
> +
> +	end =3D maps + size / sizeof(__be32);
> +
> +	while (maps < end) {
> +		phys_addr_t iova, iova_end;
> +		size_t length;
> +
> +		maps =3D of_translate_dma_region(dev->of_node, maps, &iova, &length);

[Severity: Medium]
Could this result in an out-of-bounds read if the "iommu-ranges" property is
malformed?

The loop condition checks `maps < end`, but of_translate_dma_region()
implicitly reads `na + ns` cells from the maps array.

Does this loop need to ensure there are at least `na + ns` cells remaining
before calling the translation function to prevent reading past the buffer?

[ ... ]
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		if (pos->start > next) {
> +			region =3D iommu_alloc_resv_region(next, pos->start - next, prot,
> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);

[Severity: High]
Can the length argument overflow on 32-bit systems?

On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.

Will this truncation result in a reservation of at most 4GB, leaving the
IOVA address space above that unprotected?

[ ... ]
> +	region =3D iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);

[Severity: High]
Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
to its lower 32 bits on 32-bit systems?

If the remaining address space exceeds 4GB, this truncation could leave high
IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserv=
ed
IOVAs.

[ ... ]
> @@ -214,10 +319,14 @@ void of_iommu_get_resv_regions(struct device *dev, =
struct list_head *list)
[ ... ]
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
[ ... ]
> -		}
> -
> -		maps =3D of_get_property(it.node, "iommu-addresses", &size);
> -		if (!maps)
> +		} else {
> +			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
> +				it.node);
>  			continue;
> +		}

[Severity: Medium]
Will this break existing device trees?

This explicitly rejects the previously valid 'no reg' device tree
configurations. Existing device trees that validly relied on
"iommu-addresses" without a "reg" property to create IOVA reservations will
now have their reservations silently ignored.

Could this lead to the IOMMU allocating IOVAs in reserved spaces, causing
DMA faults?

[ ... ]
> @@ -258,6 +367,9 @@ void of_iommu_get_resv_regions(struct device *dev, st=
ruct list_head *list)
>  				}
>  				type =3D iommu_resv_region_get_type(dev, &phys, iova, length);
> =20
> +				if (type !=3D IOMMU_RESV_DIRECT)
> +					continue;
> +
>  				region =3D iommu_alloc_resv_region(iova, length, prot, type,
>  								 GFP_KERNEL);

[Severity: Medium]
Does this newly added check actively block pure reservations?

By enforcing that only identity mappings are honored, does this violate
backward compatibility for device trees that used pure reservations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-vpu_iommu_=
iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com?part=3D4
