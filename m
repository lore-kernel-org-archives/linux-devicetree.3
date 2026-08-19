Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039132D592C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787167352; cv=none; b=lO5kmFl0qSpGyFQxYbzmuyCebe2aNWalNc/D659NIUc70X6j+6IQhxi0CDq9z5TjeU4WKGog97edVMQxQxfUL5PrcmtR+oEjecEgGerMYNJsfYaihJwWaQx+3tgwUDFsSEPVKrUyXOnlBl9EODFbNoorKk3VNVrxbaxrruPJkMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787167352; c=relaxed/simple;
	bh=+wcYJH7HD0CotFwcUL/xmQ62D2MQdzvewGPIAAxmfLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EL+MOUfgpzPTrMRF/SD7GKobp0Nb4e2ud/ZEhYTwhAEDkHH2JoOwdsvjNJ6k8Rr1HDqxWQ1HVqlkO86FYHfICEz0oAU5xiJwOCRneMVbM0MZx1tZ6+tVU07zQiWyiPPlMFlhz+0VyFcmrSC8ucRvbs44xaUws53wR6YHYxcueso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so12311725e9.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787167349; x=1787772149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SmkFPv7x6SaEPIsRjgJHZz2gnZAicBosl7slQRZeBE=;
        b=XWsU0SFD2k5C1jddajv4ZbufWtQEfLum1i7OR/rfRDc5MDrz8WYy3+HGD2GhTRnemi
         1KAEMOlVxtw0u8Eudbj1l4fvodBR0226Bk/nN/V7y05Iu0GwQpe3+5slkYl7fbeVdgpZ
         LHMKrkJ9aXD8HT/ybeCFtemtWUJsYKVUXjJOUPwbS/poUJwD0P+izOTaWa0G1YSYZURY
         wAJZaOQnxEsqG4CzmD4IXVPKIX18sKMRWMRWf8eQNfouGf67XQRkScVB2RrWROBvKS9c
         JKxkxTHxM8RCUd/P5tr8ybU4z0A2ldL7IoJZ9+RCUr0+fG33Uyp1aIEXDPCbCAgunG+R
         uHpg==
X-Forwarded-Encrypted: i=1; AHgh+Ro17y+BPt4juPW7MPcyHGOqDovtKiE2bVNMlP4VpFSeetiB3y+i9fCnH9svSH2a4QEZuo80rOb5B1vE@vger.kernel.org
X-Gm-Message-State: AOJu0YyKw0ktk4XW5GjXEQ0Z89vsutZHr7T1ztZxHwcBAInPSB1WpBoT
	iq7DH4Rhd57VGsrkB5daNlo9TQmLlzgrhPLzR/X9pSBRQupmYLCkRCNT
X-Gm-Gg: AR+sD10Azsx/2NJJhK9ihXp8ccFGlZ1AhO/OC2fH9/zC18pk/1yJM0C8vm3WNahDJY5
	Uw9CEV81Cfq0GZcVJw0CutD+HSFNSWSVdXRqhatcgOk/EvvyXbadj80pbUfsH/XoOd0CBJzdfTG
	ByUvpq9FizNQd0hEL1yr3xnlZp8/aTWZiL9suMFTJMrYJjbobAWbXj2Od80imQS8yKjVx6lXO+n
	a86bDQ85JwdVrtkb/kXmmHMbCQP0iu32dBf04AF+AgOnatZ4Hpes9I1qbfbewKDzf/75QvKw3O1
	TQ1SNQuP8rJqaTlFBlSx2UrQ3MdLeiNmCjKcudb1ZUk4XdkvMeVKXEsOmicHxY90QQHvMVEjPb1
	m9btcsJlfI5r+jPp97yUpcjEVIy75w92nQYN8kP6KGlx4MLZvvFfsB0mYwn6GTzu+KWHf01a2gi
	PiZGqjae21y90axLuH6u+xzvvrOSTr3zbbQeoAmHVvqqD+8BWzvvQ+MSY2icXO1Uu2yfyPOw4W/
	gOM7pAlP2ymxabgVlAwzcwpLzEDyYZDXysccSHIh6CHyYW2pDTdEl6O9EOT9qFcu6aoEpi4gFiv
	yfQ=
X-Received: by 2002:a05:600c:3e0c:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-499aa1a3e87mr144312755e9.6.1787167349071;
        Wed, 19 Aug 2026 12:22:29 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17f202sm75178105e9.13.2026.08.19.12.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 12:22:28 -0700 (PDT)
Message-ID: <45a31ea4-7660-44c6-980e-daec6655629e@reactivated.net>
Date: Wed, 19 Aug 2026 20:22:26 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, florian.fainelli@broadcom.com,
 iommu@lists.linux.dev, jgg@ziepe.ca, joro@8bytes.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 robh@kernel.org, robin.murphy@arm.com, will@kernel.org
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260728225727.148778-1-james.quinlan@broadcom.com>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260728225727.148778-1-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 23:57, Jim Quinlan wrote:
>> +#define MMMU_CTRL_OPERATING_FLAGS (\
>> +	MMMU_CTRL_CAP_EXCEEDED_ABORT_EN    | \
>> +	MMMU_CTRL_PT_INVALID_ABORT_EN      | \
>> +	MMMU_CTRL_PT_INVALID_EN            | \
>> +	MMMU_CTRL_WRITE_VIOLATION_ABORT_EN | \
>> +	MMMU_CTRL_STATS_ENABLE             | \
>> +	MMMU_CTRL_ENABLE)
> 
> Hello,
> 
> Why not request the MMU interrupt and use the "INT_EN" version, e.g.
> MMMU_CTRL_PT_INVALID_INT_EN?  It seems better than "ABORT", as with an
> interrupt you have a fighting chance of the handler printing out something
> helpful and shutting down gracefully.

That could indeed be useful, but the only info I have about this 
hardware is the RPi kernel's bcm2712-iommu driver which also does not 
handle this interrupt, so I don't have the required info to set up an 
interrupt handler.

Could you let me know the interrupt routing details for all of the 
bcm2712 iommu blocks? e.g. which GIC/L2 IRQ lines they connect to.
>> +	/* Shootdown register deals with 4 pages at a time */
>> +	for (page_group = iova >> (IOMMU_PAGE_SHIFT + 2);
>> +	     page_group <= iova_end >> (IOMMU_PAGE_SHIFT + 2); page_group++) {
>> +		MMU_WR(MMMU_SHOOT_DOWN_OFFSET,
>> +		       MMMU_SHOOT_DOWN_SHOOT + (page_group << 2));
>> +		readl_poll_timeout_atomic(
>> +			mmu->reg_base + MMMU_SHOOT_DOWN_OFFSET, val,
>> +			!(val & MMMU_SHOOT_DOWN_SHOOTING), 0, 1000);
> 
> I think it would be prudent to have this function return the
> readl_poll_timeout_atomic() result and then do a dev_{warn,err}() call once
> you are out of the containing spinlock.  Also, why 1ms -- seems a long
> time to have a spinlock.

I'll do that. And yeah, that is way too long. I took some measurements 
and all 3 of the TLB-related cache flush codepaths take around 100ns on 
average. So I'm reducing the timeouts to 50usec.

Thanks!
