Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F54390C95
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143295; cv=none; b=TVmxkLb3TNOqg8T96McUNyrM/IRVrZPPR+IvhAwRrrry6Dxg7nh3keUmlFLk9PJciQ4595pAy0yzthIz66wJCrTXZI0uqjAgGHS8rumvgkxmKdv0mwjd3oWwRFaO1g6ThLPTufvSl2ys+57tuc/iMu34gKawh3vCOK7AEV0xKe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143295; c=relaxed/simple;
	bh=pJgf/8K6i1UqZ4sD9tXxKWjDKHpurXxLzcy/xPBEzko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDuzne5s1boo+LwwtWKYr/ZrbaRbda/PfAYcZxqDERzm6NERiahbcUYc2FstCtc6SBlSqcVhqxjbwJDwV4pzFyobxSmf+gcMZM7B1rgHStX2v9YPaNDcyGeCONKOHZ3w8pVaw5/WNGAqQ69/02AJB/CpztD5qXzxptpWVH0Xb88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RixGzQws; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RixGzQws"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c822652f82aso377265a12.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143288; x=1778748088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=;
        b=RixGzQws8d+j4qzEoyL1OKGvUSuKJcEwt5/0lxIHDNkjjg/yenbcA61X/zXZZMqaJe
         srvuBPdEm2xzE6kC6B7aqk/etSF28FCOT1GRV1gk1Eheujf43eZ5RpMe6hbL81pA0euI
         QMG1kOxaP3vF3SB48yAnEZj2K5guDzHV68eAGO3UA8My0l+7KeV2Jrh/dgT/ZeFaYxED
         oBQjGPTFVOWHZkxMEBZYWqaZQSZJY5lj8pTHguPA5YF8qU9q4BNGt+cDZRkQldu41lC4
         TMZUGkrsgKItuKXsxkVfhnzbd8vhDjGMcNZbCCFwxjzLJBph8tC0B2uui1WX8BYblCmK
         SQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143288; x=1778748088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=;
        b=dRoNcCCZk1Du5AO56K+6RfhhlfxiV1uX6r9QHnIIv9riBwK6wIRlp5cOJS4Xtk6KtB
         gElY4ZGCk2XI4YeRQllzHS48IaJCoe18ZlovMQFXOXTyk/u3cmPv+U0z6KWC50Q/50Ay
         3jexTicBfpIrADF3EGM73dl0LEzfmDPMFeHian3vZHrM+werRVagTZ+x/JGjvXhsBIZ2
         wFkyOs8bO33vw4L38qNq4JaEy6goltuIHnjZaWSltFOvBOU+AvkxGPXB2gmQLvSbLclU
         JDbpKoM9JGnWEWqyNzJ7DAaBDki7vYRsVIr+moLbFNt0vYxgzGJv/9ZJpGaH8wJyvxOu
         /RQg==
X-Forwarded-Encrypted: i=1; AFNElJ/ezeBskOQJHexyJzjT+BUyDCWqEp2D2pxFXhuhRrWN61Ik9Q5pFaXmOWm2LzdCpfjrNe/W2JqJufNh@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyxpIlmzn5jbzRL3WRRzMjVf073G5ZX4iQ3t+I8jV7dKfImd6
	B2wWSbbEJOUvy8tUG8sy1OO8B4bFXl+bw4tJEAtY0QRVy+Nza6hxuY/+uGbSWx0fLHc=
X-Gm-Gg: AeBDieuLitfSlfHcFXRoqDwORkmS5SnCp7KEUKJkm9pktOvtFArbQrTjTHSv/DblRDM
	MpmNrqdGFU8wTiKY+ssSjJhietrXZzGSu/LMNS8ZZPvncvsTjYL8tDMFXclHkpyOncafkl66sai
	c3BBNB7K+MRfDv4s9g+ozyomzg/x6kJUOnCBQnIZk3k1wYcYl9/BGuP9cIffvXnHvGdL4eVZ9An
	iBm8Bu/gh4LSD8b9XD6mi/zDktTAStfWGyGSZ/pl4ZdT7BqYSRMjvlM3eF/cQo2GqryUZftyJLS
	7xPqVQVkcI+5WxBZXlp3oipOuA4KSSLJL45w8D/Tij3xApYabSDjsm8tIsERUM8GrOUHzw6L8ds
	qmcBAKxqSMQ0ayUXORazRPgNhomrHN3GtEilwRrP6Tw/PKHxFqZDbEP7X0uJD/DQ/n0RDZo5TsD
	jyXyhyVmhPv3cWLreWNH3doAwHc/zNq4AHxtZSp2tlPg==
X-Received: by 2002:a05:6a20:a106:b0:3a2:dc51:445 with SMTP id adf61e73a8af0-3aa5ab6853cmr7732684637.36.1778143287552;
        Thu, 07 May 2026 01:41:27 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253586c6asm1305583a12.4.2026.05.07.01.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:41:26 -0700 (PDT)
Message-ID: <126f4fd0-0a1c-41e0-8746-fa7ab85d6773@gmail.com>
Date: Thu, 7 May 2026 16:41:15 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] of: reserved_mem: fix region count for nodes with
 multiple reg entries
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-2-chenwandun@lixiang.com>
 <20260506014752.GA280279-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506014752.GA280279-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/5/6 09:47, Rob Herring 写道:
> On Wed, Apr 29, 2026 at 02:58:21PM +0800, Chen Wandun wrote:
>> When a reserved-memory node contains multiple reg entries (e.g.,
>> reg = <base1 size1>, <base2 size2>), the count used for
>> total_reserved_mem_cnt is wrong in two places:
>>
>> 1) __reserved_mem_reserve_reg() returns 0 on success regardless of how
>>     many regions it reserved in memblock. The caller in
>>     fdt_scan_reserved_mem() then increments count by just 1.
> Just to make sure, more than 1 worked before the referenced commits? It
> would be easier to just define we only expect/support 1 entry.
Looking at the pre-8a6e02d0c00e code, __reserved_mem_reserve_reg()
reserved memblock memory for all reg entries, but only called
fdt_reserved_mem_save_node() for the first one (guarded by an 'if 
(first)' flag).

So multiple reg entries were never fully supported: subsequent entries
got their memory reserved in memblock, but their metadata was lost
and driver-specific init callbacks were never invoked for them.

The referenced commits made this worse by also breaking the count
tracking, but the root limitation predates them.

I support documenting "only 1 entry supported" based on the
following reasons:

   - of_reserved_mem_lookup() does a name-based linear scan and returns
     the *first* matching entry. A node with N reg entries would create
     N entries with identical names; entries [1..N-1] are permanently
     unreachable via lookup.

   - Drivers like CMA and DMA coherent are designed to initialize a
     single contiguous pool per node_init call. Calling node_init
     multiple times with the same FDT node is not a supported usage.


>
>> 2) fdt_scan_reserved_mem_late() uses of_flat_dt_get_addr_size() which
>>     only reads the first reg entry. Subsequent entries are never
>>     initialized via fdt_init_reserved_mem_node(), so their metadata is
>>     lost.
>>
>> Fix both issues:
>>   - Make __reserved_mem_reserve_reg() return the actual number of
>>     regions successfully reserved. Update the caller to accumulate
>>     the returned count.
>>   - Rewrite fdt_scan_reserved_mem_late() to use
>>     of_flat_dt_get_addr_size_prop() and iterate all reg entries,
>>     initializing each one via fdt_init_reserved_mem_node().
>>
>> Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
>> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
