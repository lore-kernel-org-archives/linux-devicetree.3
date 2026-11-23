Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419636;
	b=nRAWjWV2FEwg13D+lPnGqcgogDNKcC9U+/0S+QptnQ1v5eV2tde3JjmvIH0AGAW+ME2W
	 i9X1YNdKVGuWuNT/2IkcCw7WYq1ZBkSB9Xc55rc1eH1KViT2WJSWdJqlpAH1zlgm3htOB
	 BnLy5ScGK1mpGPJyH1RZFqBJs3Cz9WpkT05x2ZvZ81YdGME5k++Te1dNYrF81qyE8gYEL
	 3AGDAUsYPWUx248weqhVB8T1ndnnai0hXcZhyFoiHSj7O2raXHOuXGo/hN3zppSyfyc3x
	 Dk7UtCeIirpkwYBGnCu6Z+6Ouh3Lo9jB6ZQqjA0d2iYU5cLWvpKCKaDsy2dZGDpFu2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0OSpOlJ5QU7jjdI5ogSU6KcCruhdHca3yQivXfMqClg=;
	b=5KU6L8rYSPvnwm1PlFmuZLwQUf6w8F6t5Rn53IdnGhTBzsVe0mmZcjcKrQJOGFN0hc7H
	 k5L9GBewIWi1LoIi0beTPcCjpe/LoBRWgcZvNgnoaSucpUO9C208MdVZ/6KQ9KOlDrmmJ
	 x5XsXHMFgcQAX3XNQ2XMM2ws0llrsa12po/FRfZ19efTtkaztP01QikiQU1L5nYMC9ePk
	 AVAe6N4xn6jtaJ79lv8drrbu/8hVLd/svEiP6m2ZdlZfnTX5pxUAesnO9grCAOifuyE7H
	 on5Mopbde0/miZ6C5/kCb3X/MRB/0H2FRlDk2csS9rwpMOCDC59yQEf96NcGr9RxmpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q49cmi4v;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85336606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85336606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q49cmi4v
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so604078a91.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 23:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795419635; x=1796024435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0OSpOlJ5QU7jjdI5ogSU6KcCruhdHca3yQivXfMqClg=;
        b=Q49cmi4vugsVNUTGmPetabr03sslo8eARVBGjoS8x5vCtM62A79skCcIK7pMMgV8Or
         PK5x7jkYAtco/0fj7DhWFUpmqMBnlSnUAtJoH82f9Gq/hNwdzLp0yJOCP69waTHVXudn
         o6e4Bh9fKXRRtbRKloY1MzAyxgZYHfCVv0a3wLNqVYuNrPXrNymAKt4mAAJnhDsZQ9DG
         h5qZ8mxW+K3ST4ADdr7jLqESvA2t4tZHfVFSUOdFgcPaKvmdMm0Tkh2kSALS16/bJdzv
         2FyUKU6bvghLA8iLdDXQD52NUNu9BWTDWldCZeJ8IjHd6Nul0/rYhcAqBM7au/+l0njL
         UngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419635; x=1796024435;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OSpOlJ5QU7jjdI5ogSU6KcCruhdHca3yQivXfMqClg=;
        b=PQu/48xfHddW9njP4B0P2w0mBOJtceMAETp0lnxY7SdQmY9GvcE5A7Sqeys+SVsCmT
         6FJBSOWLu/6kU0Fxy2HBGCSYntQ3UxFkZHGMPoSW5Yp1T8r9wONpdRVq0/cSbfXgKkag
         Mbu3wG5eydZYvs0kJ7BznrXn2F1rhBe1lAUMnq5RoLWkQLs0i1MAtpjoeHMneaEbeLC1
         Q0Vduxk1c+ldtaWSYZaUGx4OdQK1FvJD7KyJU5KobARdJ4Sy2Zcu3qErYVGsSNS014Mx
         mWVzcLh3b5KPsYK0mCBy0hXswtnvGMaiaA9VLT7/GFXXhRC4pG+9iz0X4Uy23mcUB6Zv
         JaUw==
X-Forwarded-Encrypted: i=1; AL+hErGFjzygeUI0HzyK9gmUM4dc9HmEOwIhDKbBcsDKu1/GhNXvoiMrytEwRb2V9bsziWxMksKudcjTSJX/@vger.kernel.org
X-Gm-Message-State: APuU4Z+tgRJibEbC1mkRn9Z+vCIL169Ms4NAiGuDU8qhdk3heE2l68QV
	MsMefHJYhmZpC6AWzOOwpFE4hfMaB4ZJaMAOk+qEIq04VTkK1mB8G2MM
X-Gm-Gg: AZFdTZfRQM8wWu/HfHKwpj7QQwuTiNVcQ59I2HxwvLPpUQf0aqmL9jNA+mZ2pwsAL8Z
	2FAwQIeIV1/JCr4nU0A5ANsH03OBDEYuOuUvfsC6WFOzJi+jl/4GYmXPJyKls6+LenLsJjUqwdM
	zn8c0X12C9omXka9RY+UEsLChuH2DP2ciw6+Zgr0/sOGDWKAdYiX+pK7iRKtbZQUXdkCfFNdROH
	DMH4tLQ/cKKx7+gMjCufHU6KEzSF7KX4zWphZHcG8IwlW9jKJXDMgtq50swt2W5cpUErdCLpRuI
	RTCeKTfY+5hn6rQtFGHVxJurPdziYuHlTQtwwU9KZFjsMr4tl16QqaLlnOXL1vuE1DaROOc8W6W
	CnghuF3xuWFjWWd5uXdtlxNwMk/kkO7RnAOuBB6H/PiVhU/iemdG0OEd5KZsG8rsNb0uZj1riUK
	8gxJ1q0vPsuzxt33t8Qy+cm1WcTKDtoBNApWmwPDkHepYomCulU/PMEn2HWA2Qa5DbVVeJQuBKW
	hsxWbiKAKmLvmZTGH0zw37gr/lHcipF9DRsoQRwmFthENxGWDtoXDhIFQ9Vu+D8Z9AEOUcZWrjZ
	TkbhYldF6dUsnUR4WMxS6fV9HN7XmSS6uMMX
X-Received: by 2002:a17:90b:2f8c:b0:3b4:1997:3495 with SMTP id 98e67ed59e1d1-3b41c9613bbmr9155015a91.57.1795419634749;
        Sun, 22 Nov 2026 23:40:34 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm17103994a91.12.2026.11.22.23.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:40:34 -0800 (PST)
Message-ID: <a3ebfc1c-9c98-44a1-96e2-4d92daed4ba4@gmail.com>
Date: Mon, 23 Nov 2026 15:40:19 +0800
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
Subject: Re: [PATCH v9 1/8] riscv: build crash_mem ranges from memblock
 instead of resource tree
From: Wandun <chenwandun1@gmail.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org,
 m.szyprowski@samsung.com
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-2-chenwandun1@gmail.com>
Content-Language: en-US
In-Reply-To: <20261021083011.2170525-2-chenwandun1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/21/26 16:30, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> Replace walk_system_ram_res() with for_each_mem_range(). A later patch
> introduces MEMBLOCK_NODUMP in memblock, the reserved-memory regions
> marked with MEMBLOCK_NODUMP can be excluded from the vmcore by walking
> memblock.
> 
> for_each_mem_range() iterates memblock.memory, which is freed after
> init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs ARCH_KEEP_MEMBLOCK
> to filter reserved memory from the vmcore, so extend its condition
> (ACPI || KEXEC) with CRASH_DUMP. arm64 and loongarch already select
> ARCH_KEEP_MEMBLOCK unconditionally.


Hi Paul, Palmer, Albert,

A gentle ping on this patch.

Mike has requested a RISC-V maintainer Ack before taking the revised
series through the kexec tree. Could you please take a look when you
have a chance?

Thanks,
Wandun

> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> ---
>  arch/riscv/Kconfig                     |  2 +-
>  arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
>  2 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e7891a2a89da..e21d0bab77ee 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -58,7 +58,7 @@ config RISCV
>  	select ARCH_HAS_UBSAN
>  	select ARCH_HAS_VDSO_ARCH_DATA
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> -	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
> +	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || CRASH_DUMP
>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
> index 26cd2a8bd0cd..808e872f4063 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
>  }
>  
>  #ifdef CONFIG_CRASH_DUMP
> -static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
> -{
> -	unsigned int *nr_ranges = arg;
> -
> -	(*nr_ranges)++;
> -	return 0;
> -}
> -
>  unsigned int arch_get_system_nr_ranges(void)
>  {
>  	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
> +	u64 i;
> +	phys_addr_t start, end;
>  
> -	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> +	for_each_mem_range(i, &start, &end)
> +		nr_ranges++;
>  
>  	return nr_ranges;
>  }
>  
> -static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
>  {
> -	struct crash_mem *cmem = arg;
> +	u64 i;
> +	phys_addr_t start, end;
>  
> -	cmem->ranges[cmem->nr_ranges].start = res->start;
> -	cmem->ranges[cmem->nr_ranges].end = res->end;
> -	cmem->nr_ranges++;
> +	for_each_mem_range(i, &start, &end) {
> +		cmem->ranges[cmem->nr_ranges].start = start;
> +		cmem->ranges[cmem->nr_ranges].end = end - 1;
> +		cmem->nr_ranges++;
> +	}
>  
>  	return 0;
>  }
>  
> -int arch_crash_populate_cmem(struct crash_mem *cmem)
> -{
> -	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
> -}
> -
>  static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
>  				 unsigned long cmdline_len)
>  {

