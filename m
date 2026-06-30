Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EAF409121
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820830; cv=none; b=IRXGvDmF0MbviUTvoiE3wxp1rbSbL7I3mNjbwPJQAc1t+zMm5LqRTXgD11zq065EgQk8dPnkc8EAl4OALSKLAu8zyhYoEUFDYIOXZiQJKeR6PCAQmqjFXontQPqtjoxVm+npmVzIZPaxgPAENmDuRH16nCldnSiXW/hPIYz1n3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820830; c=relaxed/simple;
	bh=w7L5Tp+hZz2TDhwz1Qm9WD2gfKZhpAFFy+VHrf2oVjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLLwUKvfpXf0U5LwAtQ8h+mjWz6Nfl7VXj9PEc2IIezYFvnePmwRjj2wUUuNcybp7VKPiPQzKvZdlcMuPfguPWnO3WEkEdRnXMqhgIUbLRyiqsERSUweXXRNjh4BiJnY77gA6zhCEmoAsGkPOjtBBW8ldz8zVypDuuZWFIhrz+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLn9+zh6; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLn9+zh6"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c85822059d8so2820540a12.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782820828; x=1783425628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQJzhkIkVPlkRxcrVSAS1/qxSmuU/Saa7J0AIvXGGuk=;
        b=ZLn9+zh6g7s09kkYTNvmo1mjC93ewFZ1NNf/pGFLSP8YEcFiLLbKg2y4J36FstXMjN
         zaWlxvV3TCkFcU/TfPZGmtG+oYc7NHPrKTFCeFQd0vVxraGYHNizWL9j8nlTH588v0yW
         snZ+oUffLP323FPkVHlklgoQnS2r8aKlJ7kuoP7iNNK7DcbnApOhNXEfmso0SVTdfJ7W
         Mwfq9XpGvobs6DDBiDXv4kPTMrCBxfE0aEBR9k3LDS/RVtF/f83DiDybAO79FaVj/rIq
         fKyktX3CMqSWEiM6sprJRF0fVsxSOxfugjw3pS9K14QDp5uH/fVByi5/8yKb3iGKPzib
         2PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820828; x=1783425628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQJzhkIkVPlkRxcrVSAS1/qxSmuU/Saa7J0AIvXGGuk=;
        b=IrwIjSG2nPLx2VJXJsSO3i3m3HvQFzwA7q+ths32w1f2Y+x8W+JX2A1yLuN9a3QkSu
         +t2l5mNZwVnmu66hKsqmZOjQP2zCllQ13x5TbEczWHGoaEobduOWk6U8yu4idwqSVVjS
         TElsehcAUeC+tEdbSt23SQtsuJjxc0iCk9VramU5K03vNFxgV5+jJx52YlNey1WX2te3
         hvB5lnRDWOBr3uSTUG7RoIZhFTNen6229dKt2k3he77uOMTJLmfMBjApf7UUJyg3WxUh
         G+ioUZZS0SwCSBHxM8PtigbnOfr/M+Hqe9OZlFm0YKJ3zA/vai09WY7KX6/qV3Q6DRgr
         ks2w==
X-Forwarded-Encrypted: i=1; AHgh+RobU8G861viXvbCicNm8Sx2GGmcVoIPHYV4lNfkiyD6QE+pg21tRmJ9fswpdSexfUxT/efruSVVtZ+V@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl7dyTbW9unGgPQ2BGcJLR11a52MYj4ReG3nCuuptKBdt9Fekv
	muRM7YvC9obU4FeB6BpzdMTZGubmrCw+JbxOzqnftSYOhKUyQnfM1jivGSDykakEjdQ=
X-Gm-Gg: AfdE7cn2JprctDcwqqCoxFvS1WonSLSrR+ysGSxjfwAzdrgVEyuuHU8nsLeDWnMthRD
	ol8cFNjHyM/ghHFj0oPkNvmSC6Mx8gH6ICFNGNxPulF2G8uE48XBzjTpId7gUagyc/Ygx78U0jj
	R5bZ+BmrXmgwY7WGmMg253qg+SmhmoMrE4Ii0N2fLa3y7dQOATEHxiXBkegyvYtOVvIL3zsjiot
	H/qu+AfEVbJs6umfpWGowWDNb76sVH6viBJ7JDDIRjZF0DeSOYbFuTWbCIw+nopsPld0SanvuTP
	Pj5pxuk2UcuGwBCtiKkorCwOOEQeRrd2jQj743h/xHYdbaSPHrlMn7wBA3y7VF2XRputan+a25z
	PAnlmhXG5Fby19JWsyR3WehZP8eqYZuAw0UbdK2ad/gMgUqv7k1YBWFTDcRxZL83EK+zfEfpqUk
	9qAZ8JRMDT3A2eN4T6nmEz
X-Received: by 2002:a05:6a00:1ca1:b0:847:902a:57b5 with SMTP id d2e1a72fcca58-8479f2175cbmr2758259b3a.35.1782820827394;
        Tue, 30 Jun 2026 05:00:27 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd39asm1834294b3a.34.2026.06.30.05.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:00:26 -0700 (PDT)
Message-ID: <e6028d44-781f-4d21-bef9-eba0547df03d@gmail.com>
Date: Tue, 30 Jun 2026 20:00:16 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] riscv: kdump: exclude non-dumpable reserved
 memory regions from vmcore
To: Pratyush Yadav <pratyush@kernel.org>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, robh@kernel.org,
 saravanak@kernel.org, bhe@redhat.com, rppt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, alex@ghiti.fr, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, ruirui.yang@linux.dev, m.szyprowski@samsung.com,
 robin.murphy@arm.com
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
 <20260630074715.4126796-10-chenwandun1@gmail.com>
 <2vxzechoi8o0.fsf@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <2vxzechoi8o0.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/30/26 19:12, Pratyush Yadav wrote:
> On Tue, Jun 30 2026, Wandun Chen wrote:
> 
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> Apply the same non-dumpable reserved memory filtering to RISC-V kdump
>> as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
>> flagged regions from the elfcorehdr PT_LOAD segments, and
>> of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.
>>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>  arch/riscv/kernel/machine_kexec_file.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
>> index 59d4bbc848a8..25359d583bc3 100644
>> --- a/arch/riscv/kernel/machine_kexec_file.c
>> +++ b/arch/riscv/kernel/machine_kexec_file.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/elf.h>
>>  #include <linux/slab.h>
>>  #include <linux/of.h>
>> +#include <linux/of_reserved_mem.h>
>>  #include <linux/libfdt.h>
>>  #include <linux/types.h>
>>  #include <linux/memblock.h>
>> @@ -64,6 +65,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  
>>  	nr_ranges = 1; /* For exclusion of crashkernel region */
>>  	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
>> +	nr_ranges += of_reserved_mem_kdump_nr_ranges();
>>  
>>  	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
>>  	if (!cmem)
>> @@ -77,6 +79,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  
>>  	/* Exclude crashkernel region */
>>  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
>> +	if (!ret)
>> +		ret = of_reserved_mem_kdump_exclude(cmem);
>>  	if (!ret)
>>  		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> 
> Nit: can you do the usual pattern of if (err) goto err; instead?
> 
Sure, will fix in the next version.

Best regards,
Wandun

> So this would look like:
> 
> 	/* Exclude crashkernel region */
> 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> 	if (ret)
> 		goto out;
> 
> 	ret = of_reserved_mem_kdump_exclude(cmem);
> 	if (ret)
> 		goto out;
>         
> 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> out:
> 	...
> 
> With this,
> 
> Acked-by: Pratyush Yadav <pratyush@kernel.org>
> 

