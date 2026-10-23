Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770110;
	b=Rt4hSqniftnFADc8NtB4P0a0348SV4eRsPW6WWAi7+QTuQt8u1DaZ/VORaHIxCALlGb/
	 uOGV/GfkT8R12OuWmfC2PPT5fRwdeMSLPYG9DcDDuSsc0gnYvWI4XniJlcJruh9mBBvYJ
	 3myBbvQ9oSsFUukfrM1HZ9Ecwe7twTFM82fX2ebeXsC13hVmlkwdMt61QCupcnut80RJR
	 ZF0I4tO0xk4NYWVKWi8XnZ2iM5fZBqIShhSMsWAC3XyYdE65Nru7peiNC5Mp2cFzLSztA
	 n9P/q90Of7LTTHraIMFgrEfT/Av9xnKNal00UmSEzvguMNGrXZts1JGqrgrIUqvGnrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=p4zYTNJnmB4RId87xSly9GxhAKztPRW2cESt3l+Nt3I=;
	b=DlfhuacX1fpCQVz86cB2A6KwBMrQInAAnxjpP8dbMCiROkQuUNtJj4Gi05h2+Bml/wBc
	 q/Yq2JFyBHcP1zkwsFniC8epZqUVFinjuwILSOxEKH8fZcPAGlTJ6gCDtJN/4ejY8XWUk
	 kqWRctuOwg83QCU7XA8alK2YkZj+esyY2Kae3kUgTp36nFDxVmezUKhKwC7lVFxZkr0G9
	 GLITpUp5mLrLc8FvZC2xWYbkxFS/Ay+FtOQgHnzxi6SW16sR1yVxtaJ8lBmYeiqZ4vC2A
	 S4lr8ykgsMzsGKXU/CUv0S0xSGIqCW5wkIgZVdpoXL6AR9emwp5ixV0rT+QiPu3RIFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lYDGdzjn;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F81D60A3826
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F81D60A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lYDGdzjn
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso736640f8f.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792770108; x=1793374908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4zYTNJnmB4RId87xSly9GxhAKztPRW2cESt3l+Nt3I=;
        b=lYDGdzjn8pKbo+YhF06SzfnDnRwEEHJoSmKxT76rJHZAROQiABUwV1j1d13KMePWX0
         PaMZbvOu7xKgfKSWKhxwl+GJVcK7sAQU3Oe6PbouioBnfDR9rq6kGFlY1BMJ3w7DStim
         Ig82unhCaPXT+WRxrp7LU9OU1rjCgc2WXAOZdgL8JOW4tVZLK7EI4nYrlY4xtVXFRaD2
         cpBCflm39zzfIW6fd4t4DIgs+71qcxLRU2NO4sFjVPatmy4G4SImlp/IOAH1vO7eGndK
         CcaNIj7jGfza+lqfg1f+fcLTRXbkSck2WE7adfoUVFLaA+L/+3lDOG63cZ1K3+519ZL+
         rcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770108; x=1793374908;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4zYTNJnmB4RId87xSly9GxhAKztPRW2cESt3l+Nt3I=;
        b=qasQIjlHKWHwxO18XAvqJw2lvB2IsJ5e2rcwXGsNlDb6C1l0jd0QKSKwxLXbNP/4Y8
         5RghDXuOvUpPDLbFEQOOZuvtxqOrbqql6m7HK7Rx0rUJ5HDkJJyImMZVBh3JhRyhKQDu
         TWvUNxEt3Dmc3UIdHswsJAvnCBtW3hC9RGwhZJXGoehDz12jagqJ7auDEoHcdzCrun34
         8Ym+kBZ90qOcljWZhP2hH2dl2LLsDlxxV8qbFETpKZW6MvmO0nRYKiag4O3RBJXkECx6
         vedQh+irxdvG9WU4ZlhJk9ESz1yA8i0q8BQBfnjywPoWaWk4loOpaqagW2YwEFDJZkDD
         ciRg==
X-Forwarded-Encrypted: i=1; AKwUvBwRfAH60mFrA7uvp3so/GcgIzT1j2K91fOMPsQ5qolK9BrgEN/NMgdwHBFLCCImmjv5B0lmR7qkeymv@vger.kernel.org
X-Gm-Message-State: AFq9FYLevYGS5jlyvxejbK+SwbCUqRVD9xsRl6JojFau1TNowpwscEmj
	lPvev/t5f/ZhmWw4buGHOzwMNsFUits4XxivvgAl7Uq2PjcN4rWsU6jwkhoevA7Fc+U=
X-Gm-Gg: AYBFou0nCWZiDg1oKhK6wH7RsnNL6+jvvA3cilj90zoILNcmrdoyQdqqLXRvLMZYMh9
	fV9WdkMgsGmt/wZOpkyIqrqVuqU7/vSn0V7JzIo7gJeKV0JYxggRduvvDNjnowIKr1Qtmh5itZb
	P1ObIJkUQqQHaddCQh7/oTrOrdyJG+dHsRDB0K83RFaqWjsmkLC4Po+nEFv9pkn2flHSDglFyT3
	DLf1+lPudCh2xY9mlJv5nIefHLHsbCYgXkFcAgZUGUB8MUtJTcYOOPAYjE5qr8xMs9MDhyI0eh5
	jSTcSEDwTLKx7udTH2ec2sg/2qwPGW/z8CSIBwA2bLj8DErQ1Xj7fH1hmLfs0kcoxDCne2EMlRm
	meGZn1+jFqPe/sn702660Tf9ElSHxmCUnPyRIG21dY6KD64DVzhDCLfXSeYOPOwuUxsV3Z7k0SC
	DyyRmR6CfD9VM6C+Jf7R88160CRRXrh6YoWTHiyr0KXHbsuOoIUc9vD2v6teFMwHGSAYSUtsDyX
	ONKmUnr82nPRcwayf7Z1sQjX5VbFUZEldGYo1X4Hhb4NtgwHvJXmhvWaGTNCE92Ac1R
X-Received: by 2002:a05:6000:178a:b0:48d:f58f:c98 with SMTP id ffacd0b85a97d-48e385a5db6mr4346612f8f.40.1792770107560;
        Fri, 23 Oct 2026 08:41:47 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d400365sm532405f8f.25.2026.10.23.08.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:41:46 -0700 (PDT)
Message-ID: <99a419c3-81a8-4b37-b9c7-2dd56978162d@linaro.org>
Date: Fri, 23 Oct 2026 16:41:44 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 07:34, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> Introduce a new property, "iommu-ranges", to specify the device
> specific IOVA ranges when there is no backing "reg".
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/iommu/of_iommu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 121 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index a18bb60f6f3dfdba853b6e16dd2a8616f6a731c7..9766a6944d0e11a6cd8b74b1b89428acffe3dfdf 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -190,6 +190,111 @@ iommu_resv_region_get_type(struct device *dev,
>   	return IOMMU_RESV_RESERVED;
>   }
>   
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
> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
> +{
> +	struct of_iommu_range {
> +		struct list_head node;
> +		phys_addr_t start;
> +		phys_addr_t end;
> +	} *pos, *new, *next_range;
> +	int size, prot = IOMMU_READ | IOMMU_WRITE;
> +	struct iommu_resv_region *region;
> +	const __be32 *maps, *end;
> +	struct list_head *prev;
> +	phys_addr_t next = 0;
> +	LIST_HEAD(ranges);
> +
> +	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
> +	if (!maps)
> +		return;
> +
> +	end = maps + size / sizeof(__be32);
> +
> +	while (maps < end) {
> +		phys_addr_t iova, iova_end;
> +		size_t length;
> +
> +		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> +		if (!maps) {
> +			dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
> +				dev->of_node);
> +			break;
> +		}
> +
> +		if (!length)
> +			continue;
> +
> +		iova_end = iova + length - 1;
> +
> +		if (iova_end < iova) {
> +			dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
> +				dev->of_node);
> +			continue;
> +		}
> +
> +		prev = &ranges;
> +		list_for_each_entry(pos, &ranges, node) {
> +			if (pos->start > iova)
> +				break;
> +			prev = &pos->node;
> +		}
> +
> +		new = kmalloc_obj(*new);
> +		if (!new)
> +			continue;
> +
> +		new->start = iova;
> +		new->end = iova_end;
> +		list_add(&new->node, prev);
> +	}
> +
> +	if (list_empty(&ranges))
> +		return;
> +
> +	if (of_dma_is_coherent(dev->of_node))
> +		prot |= IOMMU_CACHE;
> +
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		if (pos->start > next) {
> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,
> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
> +			if (region)
> +				list_add_tail(&region->list, list);
> +		}
> +
> +		if (pos->end == PHYS_ADDR_MAX)
> +			goto exit;
> +
> +		if (pos->end >= next)
> +			next = pos->end + 1;
> +
> +		list_del(&pos->node);
> +		kfree(pos);
> +	}
> +
> +	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> +	if (region)
> +		list_add_tail(&region->list, list);
> +
> +exit:
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		list_del(&pos->node);
> +		kfree(pos);
> +	}
> +}
> +
>   /**
>    * of_iommu_get_resv_regions - reserved region driver helper for device tree
>    * @dev: device for which to get reserved regions
> @@ -214,10 +319,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   
>   		memset(&phys, 0, sizeof(phys));
>   
> +		maps = of_get_property(it.node, "iommu-addresses", &size);
> +		if (!maps)
> +			continue;
> +
>   		/*
> -		 * The "reg" property is optional and can be omitted by reserved-memory regions
> -		 * that represent reservations in the IOVA space, which are regions that should
> -		 * not be mapped.
> +		 * "iommu-addresses" must be used in combination with a "reg" that provides
> +		 * the physical address and size of this memory region, for an identity 1:1
> +		 * IOVA mapping to that physical memory.
>   		 */
>   		if (of_property_present(it.node, "reg")) {
>   			err = of_address_to_resource(it.node, 0, &phys);
> @@ -226,11 +335,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   					it.node, err);
>   				continue;
>   			}
> -		}
> -
> -		maps = of_get_property(it.node, "iommu-addresses", &size);
> -		if (!maps)
> +		} else {
> +			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
> +				it.node);
>   			continue;
> +		}

The if/else doesn't belong in a path entitled 'Add support for 
"iommu-ranges"' as this changes he behaviour of iommu-addresses 
independently of whatever iommu-ranges does.

The reg update part basically has nothing to do with this series at all 
i.e. the code you depend on later in this series doesn't declare 
iommu-addresses so... this is an update to align with a DT schema change.

https://github.com/devicetree-org/dt-schema/pull/207

Perhaps splitting this into two patches as an iommu-series would be best.
>   
>   		end = maps + size / sizeof(__be32);
>   
> @@ -258,6 +367,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   				}
>   				type = iommu_resv_region_get_type(dev, &phys, iova, length);
>   
> +				if (type != IOMMU_RESV_DIRECT)
> +					continue;
> +

If you look in iommu_resv_region_get_type() you can emit

         dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] 
as reservation\n", phys,
                  &start, &end);
         return IOMMU_RESV_RESERVED;

on a mismatch - which is not what the code will do now. Mismatch will 
warn and then not map.

So maybe dev_err() saying you won't map - in the new patch for reg. 
Either way this isn't a change specific to iommu-ranges.

>   				region = iommu_alloc_resv_region(iova, length, prot, type,
>   								 GFP_KERNEL);
>   				if (region)
> @@ -265,6 +377,8 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   			}
>   		}
>   	}
> +
> +	of_iommu_derive_resv_regions(dev, list);
>   #endif
>   }
>   EXPORT_SYMBOL(of_iommu_get_resv_regions);
> 

