Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0393B3892
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146922; cv=none; b=jQUJDMBO4AuDHUcqecZhc7bJvQPmqs1ceYVcgasakBg94R10lNGfKzXWzIwJMHn/Bq/vCzaBte4mM/bofGOTVU8hLbhDNltaDtCR+1Fll7oTdZH3m6fJcshZMGSj6p+1Wt9gGXT4rgkIU8hRo+7iqtNAaoEv8LTgqnSgfNFkFds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146922; c=relaxed/simple;
	bh=K1VCjRoLW0QcGM0dhJF4jAnQbIUr+A3+Rl8KKkOY/EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtvctJZN3Fx8Z7gXn5ESLF7XfPJJm2fAO5O4ilrh6iZsBYc1NPcUjYciWH0YxKBDoJLshl7GuqinziQ1hISc/gplTCZetrLNmLzrOnaU5zjACeRVyjyxSJEHlS3h6cVQWJ2UROIvfaVOAxXJ5Hx4jQzEREnJ4YwbEXHPtdLB+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfwUwx01; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfwUwx01"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82748257f5fso1103145b3a.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146921; x=1778751721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUrNwnrnHXKNK1Z+tsaGPk05Wyp59KKsZWMiHJkBCuY=;
        b=RfwUwx011PnAQCww545ZbYX91bbrYk2UfJ57++JfIXMjmyb0Eck3lgYjMPI+u5nH98
         2u48n+FkDwdbdB7nfyOzqOJZ2u2TJeYLZdkNZkuVdWjfzlDIxbPQmui/NJINbfmtI6MQ
         1RARiyUrlslScD7Ar/tQkKlbwAZyEBlDFhYEjslxv7XmtrpO35X/CDzAz8a/4hEMzRkT
         jBp307wJvS62s7mIxC7+j3x+BfggYwwHqcBtRJJyixFDUFgK8cAuK1GSj2cE1CKIqT1m
         5/IXxTTAiV3q0do1TZdCCmh52uNbduY4tH6f9GvRc0bU+CM3ntqJV4tcGr9Jq0x9FnzS
         cvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146921; x=1778751721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUrNwnrnHXKNK1Z+tsaGPk05Wyp59KKsZWMiHJkBCuY=;
        b=NZgeWb5asfSvDQx3ehvoP+X32ceUJWuJHEYupp1g8/JwOQ77sTreNoTpyMaX/4d5Y4
         d6N6z9J3Cxdn92r5yrqUs/1fnKZRBhGxBiq9s725j+ixEt3JhZdIMgjF0xG00xgWv5RM
         ECMm9ONccKd3b6hf2VNkHE8UMsoQZiLYbALNKvsBiJUqaQhRqozrVCuPFBV2ntFPll1+
         S+IUNsNERlO0KHP3W43FXjkbzULTZ13RQQH8pYSeXYa77Jw7GGiclthoFWjomoUQAQu1
         vnYdTTfNPa6jX7VF2F8YetFCzb7cTg7Q2w1/RpyE1XxV6aetXlhGBKYOz0BTyzOquK3h
         D1PA==
X-Forwarded-Encrypted: i=1; AFNElJ+zC3Z1xdBBPQGp3E/mAMqVDjhGZUhvGWbzCr902z9HuITGalyaAX1NZegEHrvOWxJOmJUovh2lRMnk@vger.kernel.org
X-Gm-Message-State: AOJu0YxqWsDCmBLuj0ocFw3yANMhpZiz+PsibWXvb4HKJke5BdAJnQqw
	boo6Uc6acsitEm0zPnpbfMM3s2tRsbcSO00ulSGibw3gphA1efGC6WLC
X-Gm-Gg: AeBDiesc7qjyuUvFH6eNycrn11zik3d64rcjuLS7GgqWk+W9shioYHg2cCK7YBdYzTA
	nzPL2MVpt8NBuAV2rzo53fmfDEi4aBDg1bazJE8mvmLrOT3T4MurgbQusDYhAOEatovQ7LjmKb5
	+6ybvnoyZNV2E1Je8rUn8URBiyBUsOI8nSWUO1RVoC3aa2akPzNqCxHHICPNheoiifarHWgZEZm
	1HF68KJGVCVqZFyfCVLs02q1TSLnA/BRgiRW5R3wtMvph6UiukN/jJGL6O3e6VIsvTC2DYGLZh6
	et0F3pfPa6D0dVw0C9Yvtl9ObvMDufS8nViUcSKvdMi6lKQyuXCWNIGIkaO3s5H2sAjstJD9dRW
	Rw6UMVCp1v+lnMLveS6eHt3wfwLiWQ0IdBTEutfVwr2qSe2AVudjlgYxFNi9OMZYzt1CWFzO17b
	AqSADD2s3gMdlg0a3nReqO52VmdoYtmcR3i/g8x440um1uSVD9wsXh
X-Received: by 2002:a05:6a00:4093:b0:82f:3e9:7bec with SMTP id d2e1a72fcca58-83bb7abceeemr1949432b3a.12.1778146920796;
        Thu, 07 May 2026 02:42:00 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm10264549b3a.21.2026.05.07.02.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:42:00 -0700 (PDT)
Message-ID: <eece7690-634a-43c5-9b20-0afc174a89a0@gmail.com>
Date: Thu, 7 May 2026 17:41:49 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] of: reserved_mem: add linux,no-dump property
 support for reserved memory regions
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
 <20260429065831.1510858-6-chenwandun@lixiang.com>
 <20260506144542.GA2072596-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506144542.GA2072596-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/6/26 22:45, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:25PM +0800, Chen Wandun wrote:
>> Add a 'no_dump' field to struct reserved_mem and parse the
>> 'linux,no-dump' device tree property during reserved memory node
>> initialization. This property allows device tree authors to mark
>> specific reserved memory regions that should be excluded from kdump
>> vmcore dumps.
>>
>> Reserved memory regions used by device firmware (e.g., GPU, DSP, modem)
>> typically contain data that is not useful for kernel crash analysis and
>> can significantly increase vmcore size. The 'linux,no-dump' property
>> provides a declarative way to indicate these regions should be filtered
>> out when constructing the elfcorehdr for kdump.
>>
>> The property is named with a 'linux,' prefix because kdump/vmcore is
>> Linux-specific and the property is an OS hint rather than a hardware
>> description, matching existing properties such as 'linux,cma-default'
>> and 'linux,usable-memory-range'.
>>
>> The 'linux,no-dump' property is only effective when the region:
>>   - Does not have 'no-map': these regions are already excluded from
>>     vmcore since they are removed from the linear mapping (MEMBLOCK_NOMAP).
>>   - Does not have 'reusable': CMA reusable regions are actively used by
>>     the kernel for movable page allocations, and their contents are
>>     valuable for crash analysis.
>>
>> The no-dump status is also printed in the boot log alongside the
>> existing nomap and reusable flags for diagnostic purposes.
> I think this property is the wrong way around and probably not needed.
> The default should be exclude the regions, but if Linux is using the
> regions (like CMA) then it can decide on its own to include them.
>
> With the restructuring that went into 7.1, it should be possible for the
> CMA code (and code for any other regions) to set some flag for the
> region.
Agree that the property direction is wrong. Rework in v2:
   - Default: exclude reserved regions from vmcore
   - CMA (reusable) setup path marks regions as kernel-managed general 
memory → include
   - No DT binding needed; linux,no-dump proposal withdrawn

Thanks.
>
> Rob

