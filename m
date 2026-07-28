Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630393B895F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221146; cv=none; b=JioOkpquch5DyLO+oBQ5av4rWdQuQk1cDsQ6NCrkMFI4AQjPKrkKvAbEBKg2OKDccCBMPqVAxGstXyLZnBkYlIs0hb92teOulQ+gyFMZb2ZXTg1vkgWZeY6FGodnq2zh0GZudexQgAxZ4mZRJWDqwD8EzSc/lw9r7CIIh/q6fxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221146; c=relaxed/simple;
	bh=NFjJoarwjTziHpeWxF34h9ZK4G+OfT3+3OqIgq8m+MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzQFiQsnjcRgWYR3u+jMhm7Ke/qnupW8qHek3e+HYAwIe2VpXgvbgOPco7ZmO1Xe09naczq1QvdkpUw1alLFPrfvDaXzWynRy8shZ1etTFTXYv0J7WXzgwo484KAJUTcFq+2eD8Hmjexyz4HpGOIgNoy2fhLtHtKYPrGIUP6XC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLrZmBnL; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLrZmBnL"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2cf49dc298bso33652185ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785221145; x=1785825945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9PHCPemx3I5IiaOZkfCpXgJjCP/3isLoWalQDvmgro=;
        b=bLrZmBnLlQBnUt5PkSsuMdOvKTdeaSJGKvsQ/SOHDg4mTyGEYRHFCZVELpEgRGXR/c
         rwZIjbG/pHeQeN3ty9Lxrlw0DnPMjh4dmuVbz/pQjthB0yLIbs9P9zegGSDRhNvYBmMn
         jdMk61tpsy1FPNo6v1IRbzwfUsOU4x9cKgz9mMfXqKN/9FhA4RsGp8wVv1Ee21kfR4KI
         04DKoHC74rBwCKvVM/wrcF3h6o83vtivUevfqnva+2smptYHd19wWMWuTbMbaY83xOyv
         arSWOOs8v95F3VfMUjPp90pA9JwUMJHiZz3Gqdo0jZSh3/jkqVx+SsIFkTBdmjojKxh8
         NnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221145; x=1785825945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9PHCPemx3I5IiaOZkfCpXgJjCP/3isLoWalQDvmgro=;
        b=pu6Kci2ZVcVOZKNg1OU1fZYt2JaQbCZYuqK+ZecmMGO6qg1XAAIn2TiQZdAlRK3tnf
         rRc4xGJUhKCcf42v0SAN/OLr5wI92bFG7w5ySKhidg5H1Wm+/TpZ9vp9nZXx+ipGD5K2
         2href7i7/sXAWgIFSwWWCL5xTWBI3KgPIN8Y4C6YPcRKtccrLtuSn+uBASTwPN7ENISL
         Amc51eEGGwYoaKYq0Nj7jCIjbx0w6KQ8tkDeemjjVskb8GBaGB/VEvGculy4lYpRumf4
         ccsUNe41FpNRS4r88ZOjv2LtXqnYJ8HL3FcXsS363yCXlzfT9NDjkKO4sLFKDsU7Omc8
         ppIg==
X-Forwarded-Encrypted: i=1; AHgh+Roi6Lqlc9P2ms/7M1dgx4L+EbGNqxW+xZjjcQpSL0xJuxfNIHpe01lsCvKvtQVomwS/Ew9qjw1l/5jp@vger.kernel.org
X-Gm-Message-State: AOJu0YzCSxECht4ZuJ+MHZCMWnvH8qVODG7elos7itTFL7XJ3YAwBrta
	LcPWvfUp0lQ9jIY0h7wq3OPXLgswCVj2Vl22umdMEY+Xtu7wm7fXP29e
X-Gm-Gg: AR+sD10mi4LJvYRa8YNJkq1A6xQDCfGLpAPImZ6O54ziZvXa4xeilI4ujiN+OXvvZPV
	TyIoVOShD5O9JTioHy0nOEnRDxWQP61GpP6tR2ogRIAmbuFLmak0AElswOPU/9DUYKcszBCAA9v
	ZOT4BGluyn7sOnuZ0xDpTL41MTxx0LKtKUPplSNWfauTMG89P8KHcKb6ZyJcP8WTwyZkbF0SRiv
	fjfy2VphxSkdDzT1ih1tntjMxA5kIk2wA76P3wrGrHTfVMJ7GCTKzEMbB+H4ds+dV0iHplJnBbA
	t/NCwYRN95J5GVApTfQ8PP4LePWUTyvVmKPWSo3MG9qsk7JoLB9zrNsSpJE5bQvDGg5tPj1NSux
	nu/I4MOEIqIpFr4ghrcxEWvC/jdx1aCb7nCoRiwJS6HimMHn1y0Z+pe7LKrkVOjvnJ1XC3sUzVR
	eRiQu9Uq3ugQ==
X-Received: by 2002:a17:903:b90:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d015c9b773mr13766995ad.9.1785221144689;
        Mon, 27 Jul 2026 23:45:44 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e1e26sm46147345ad.22.2026.07.27.23.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:45:43 -0700 (PDT)
Message-ID: <14ae96c1-707c-4999-bc9d-65ec74fbeff2@gmail.com>
Date: Tue, 28 Jul 2026 14:45:32 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] kdump: reduce vmcore size and capture time
To: Rob Herring <robh@kernel.org>, m.szyprowski@samsung.com
Cc: chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, saravanak@kernel.org,
 bhe@redhat.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, iommu@lists.linux.dev, zhaomeijing@lixiang.com,
 catalin.marinas@arm.com, will@kernel.org, alex@ghiti.fr,
 akpm@linux-foundation.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, robin.murphy@arm.com
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
 <20260723234126.GA3253409-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260723234126.GA3253409-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/24/26 07:41, Rob Herring wrote:
> On Tue, Jun 30, 2026 at 03:47:04PM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> On SoCs that carve out large firmware-owned reserved memory (GPU
>> firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
>> those carveouts as part of system RAM even though their contents are
>> firmware state that is not useful for kernel crash analysis.
> 
> What about reserved regions on ACPI based systems?

ACPI based systems already filter out these reserved regions from vmcore.
In the EFI memory map, firmware carveouts are reported with the type
EFI_RESERVED_TYPE. This type of memory gets the nomap flag set in
memblock.memory (is_usable_memory() returns false in reserve_regions()
and mark these regions with nomap flag), during prepare_elf_headers(),
for_each_mem_range() filters out these nomap regions. Therefore, the
memory reserved on ACPI based systems will not be dumped into the vmcore.
> 
>> This series introduces an opt-in 'dumpable' flag [1] on struct
>> reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
>> DT-based architectures (arm64, riscv, loongarch). By default reserved
>> regions are treated as non-dumpable; CMA regions are explicitly opted
>> in because their pages are returned to the buddy allocator and may
>> carry key crash-analysis data.
> 
> I never like seeing the same change being made to each architecture. 
> That's generally a sign of restructuring needed. loongarch and arm64 
> prepare_elf_headers() look about the same. riscv version uses 
> walk_system_ram_res() for some reason. 
> 
> Perhaps the dumpable flag belongs in memblock instead? Then at least we 
> wouldn't need more DT APIs exposed to the arch code, and the code stays 
> independent of the firmware API.

Agreed on both points. Adding the flag to memblock can indeed eliminate
the duplicated code in prepare_elf_headers, and avoid expose APIs to the
arch code.

I will add a dumpability marker to memblock for future extensibility
and to avoid duplicating the same code across different architectures.

I'm inclined to add a nodump flag, similar to nomap, by default all memory
is dumpable, and only the small fraction of memory that carries this flag
would be excluded from the vmcore, What do you think about this approach?

walk_system_ram_res() in riscv could be reworked into the same form as in
the arm64/loongarch architectures, will do in next version.

> 
> I'd really like Marek's review on the reserved memory code changes.

Marek, could you take a look when you have a chance about the reserved
memory code changes, I'm happy to respin and address any feedback.

> 
> Rob

Best regards,
Wandun

