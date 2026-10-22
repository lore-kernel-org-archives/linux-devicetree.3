Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662657;
	b=OL4C7PE0BxfvzVsN/B7WdBuJeeZVO92cObBkfy5urDzdenpU5VEx5vKfX63dpsFkN5gQ
	 TAX9sV2QtNwCrYrO7FpMx+qJTubz87c4PwvGGAM4bMGXfySD5moXSQCpB2McWIiDYNnIl
	 FhB4jnTLLka2DU69C71rZ/YgAf0X2e6vch9HnpJmV5J9V18QOSfpEFe3hNM3HvbFZ0DGe
	 H+bLHhSqw0jGbhlf6Qm0YRqZwEr2ksWm1yM13SDFK9NSIPD4ZluDiuEoqIxncDUq4o6SK
	 6mHgMeJ/jRJIHDDPkII0K84atxjuhbt9cGryF0gYcw1L1VtB5I2p0k4PRVrDye3JHaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662657;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=tr3FftCcMBhIemcTq716TbUdyhAloMtdNWic6eVzrxM=;
	b=1GHzhndP4BE23bcVLX5pcfRAPDvoV239EpQDf50oAM4rA+/T0AKCVsPndLbs/6rY3A/3
	 s5015or6+gF06GzOouh0IyaUcJWzo6HDXqSt7zm1tZIC/dZ0cpAFo8N6ODgu5iZvXFxG+
	 0fLpYIFg5AIm4sGO5ahUofW350YsRBb4HsNQznelnrm4MrKynnZkspzgMT9FqdnvaKfUj
	 ASwWl9aLmmChMDUDcVnJQlf2FaId2pE+iCPvSzP5TfsLWBFrmjluxjXRmffDFf1OpfMH/
	 TlIF0O/+1m1sfRHd2SIKhoy+bhGEONTIqVBica5jLBwQiTOuaqYgKM7leNmufqag4dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=jPwa5wNd;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7BF606A330
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7BF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=jPwa5wNd
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261022095048euoutp02d92d9d81a4668476ffe91ac1b45326b6~g0S5FAeBY2199121991euoutp020
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261022095048euoutp02d92d9d81a4668476ffe91ac1b45326b6~g0S5FAeBY2199121991euoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792662648;
	bh=tr3FftCcMBhIemcTq716TbUdyhAloMtdNWic6eVzrxM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=jPwa5wNdfupIhtHqEEKd5efZ2axBV13TGynFbQWBmTVQXpTJhQGvBp76hs5PJ8vaf
	 IzG2Fd28x5pXDX5jbk5F8JBVSA3DbzGGxtQwUJckAsAiL4u1/lrCKPu2TMY0CMl2bu
	 L8sVDeLbKfFUnNKah4j68XA7mzEdGZ3UzqCw0vGY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261022095048eucas1p142a566f537d2dd1a4f91197da72f5274~g0S41U86a1057010570eucas1p1a;
	Thu, 22 Oct 2026 09:50:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261022095047eusmtip183d3cb737b63a139c504fe5d152bf926~g0S4G9ORO0390203902eusmtip1o;
	Thu, 22 Oct 2026 09:50:47 +0000 (GMT)
Message-ID: <9faf09f7-bb04-4d43-b206-6bf5ee4e94d3@samsung.com>
Date: Thu, 22 Oct 2026 11:50:46 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
To: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, Mike Rapoport <rppt@kernel.org>,
	Wandun <chenwandun1@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <sashiko-outbox-172520@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261022095048eucas1p142a566f537d2dd1a4f91197da72f5274
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6
X-EPHeader: CA
X-CMS-RootMailID: 20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6
References: <20261015082315.56876-1-m.szyprowski@samsung.com>
	<CGME20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6@eucas1p2.samsung.com>
	<20261015082315.56876-3-m.szyprowski@samsung.com>
	<sashiko-outbox-172520@kernel.org>

On 15.10.2026 10:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] of: memory corruption due to initializing unreserved memory regions
> - [Medium] of: memory leak on dynamically-placed nomap region init failure
> --
>
> commit cc45d1ed473ae1f1390908145c8217f0d9614ac0
> Author: Marek Szyprowski <m.szyprowski@samsung.com>
>
>     of: reserved_mem: allocate and map the reserved_mem array early
>     
>     Get rid of the static, limited-size reserved_mem array and replace it
>     with array allocated by memblock_alloc_raw() and accessed directly or
>     through a temporary early_memremap() mapping.
>
>     Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 300fb236ab59f..0fd1683cba011 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -381,143 +384,109 @@ static void __init __rmem_check_for_overlap(void)
> [ ... ]
>> +	/* Second pass: initialize the static regions */
>> +	fdt_for_each_subnode(child, fdt, node) {
>>  		if (!of_fdt_device_is_available(fdt, child))
>>  			continue;
>>  
>> -		uname = fdt_get_name(fdt, child, NULL);
>> -
>> -		err = __reserved_mem_reserve_reg(child, uname);
>> -		if (!err)
>> -			count++;
>> +		__reserved_mem_init_reg(child, fdt_get_name(fdt, child, NULL));
>> +	}
> [Severity: High]
> Does this unconditionally initialize memory regions even if they failed
> reservation in the first pass?
>
> If __reserved_mem_reserve_reg() fails for a region, it sets
> reserved_mem_reserve_failed = true but does not exclude the node. When
> __reserved_mem_init_reg() is called here, it will invoke
> fdt_init_reserved_mem_node() for that node anyway.
>
> Could this lead to blindly adding unreserved physical memory to the
> reserved_mem array, allowing drivers to silently overwrite standard memory
> that the page allocator considers free?
>
> Additionally, if the node initialization subsequently fails (e.g. due to a
> missing compatible match), could it execute memblock_phys_free() or
> memblock_clear_nomap() on memory it never successfully owned?


This is preexisting issue, this patch only moves the node initialization calls.
The better error handling has been proposed in the following patchset:

https://lore.kernel.org/all/20260920092852.614973-1-chenwandun1@gmail.com/


If the new memblock flag is not an option, the error handling should use
the simple, best effort approach proposed in:

https://lore.kernel.org/all/72074a49-2963-4f96-b939-79bf95a829cb@samsung.com/
https://lore.kernel.org/all/15f70a45-a754-488c-8ba3-9e63bb956033@samsung.com/

what is still out of scope of this patch.


> drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
>     ...
> 	err = __reserved_mem_init_node(rmem, node);
> 	if (err != 0 && err != -ENODEV) {
> 		pr_info("node %s compatible matching fail\n", rmem->name);
> 		rmem->name = NULL;
>
> 		if (nomap)
> 			memblock_clear_nomap(rmem->base, rmem->size);
> 		else
> 			memblock_phys_free(rmem->base, rmem->size);
> 		return;
>     ...
> }
>
>>  
>> -		/*
>> -		 * Save the nodes for the dynamically-placed regions
>> -		 * into an array which will be used for allocation right
>> -		 * after all the statically-placed regions are reserved
>> -		 * or marked as no-map. This is done to avoid dynamically
>> -		 * allocating from one of the statically-placed regions.
>> -		 */
>> -		if (err != -ENOENT || !of_get_flat_dt_prop(child, "size", NULL))
>> -			continue;
>> +	/*
>> +	 * Allocate the dynamically-placed regions only after all the
>> +	 * statically-placed ones are reserved, to avoid overlapping with them.
>> +	 */
>> +	fdt_for_each_subnode(child, fdt, node) {
>> +		int len;
>>  
>> -		if (dynamic_nodes_cnt == MAX_RESERVED_REGIONS) {
>> -			pr_err("too many defined dynamic regions, skip '%s'\n",
>> -			       uname);
>> +		if (!of_fdt_device_is_available(fdt, child) ||
>> +		    (of_flat_dt_get_addr_size_prop(child, "reg", &len) && len))
>>  			continue;
>> -		}
>>  
>> -		dynamic_nodes[dynamic_nodes_cnt] = child;
>> -		dynamic_nodes_cnt++;
>> -	}
>> -	for (int i = 0; i < dynamic_nodes_cnt; i++) {
>> -		const char *uname;
>> -		int err;
>> -
>> -		child = dynamic_nodes[i];
>> -		uname = fdt_get_name(fdt, child, NULL);
>> -		err = __reserved_mem_alloc_size(child, uname);
>> -		if (!err)
>> -			count++;
>> +		__reserved_mem_alloc_size(child,
>> +					  fdt_get_name(fdt, child, NULL));
>>  	}
> [Severity: Medium]
> If a dynamically-placed 'no-map' reserved memory region fails initialization
> here, does it permanently leak memory from memblock.reserved?
>
> When __reserved_mem_alloc_size() allocates memory via
> memblock_phys_alloc_range(), the memory is added to memblock.reserved. It
> then calls fdt_init_reserved_mem_node(), which has the following error
> handling path:
>
> drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
>     ...
> 	err = __reserved_mem_init_node(rmem, node);
> 	if (err != 0 && err != -ENODEV) {
> 		pr_info("node %s compatible matching fail\n", rmem->name);
> 		rmem->name = NULL;
>
> 		if (nomap)
> 			memblock_clear_nomap(rmem->base, rmem->size);
> 		else
> 			memblock_phys_free(rmem->base, rmem->size);
> 		return;
>     ...
> }
>
> For 'no-map' regions, this clears the nomap flag but appears to omit
> memblock_phys_free(rmem->base, rmem->size), which would leave the dynamically
> allocated region permanently trapped in memblock.reserved.

Again, this is preexisting issue targeted in the mentioned Wandun's patchset.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

