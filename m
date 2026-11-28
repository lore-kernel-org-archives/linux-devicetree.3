Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795831412;
	b=u1ywDYQK1XV67LSd1xrFnkifpNqFtIRe/4GBPC2YKKqbfqx0wKtlXMYJ8bq/Psz3eq/H
	 zT5jQoWUK8FC/t77rP4Cuk4Z2vSVM82fb6/sUifj7Tk1juveQh8XCTGZEjitIdZI5HDd4
	 QtyzxjKBh6ze4BLYPHoSm9MsCPfpIdWQCpew9/vWUagZmHQ2TRsxDjrdbJiBKSjk2AmEx
	 X6MrjUlWeZwjutLU7k7+rhYhvJmPN8msPAsaOzuYuciQP0OkPwYBnA8Z4UtKhT13ohS9q
	 VMJUxKWgAADpX0ZJTsLmNN7+xBCfPNc10CJ1FMlNytq73LA8lOsv5iXIY6Qcf3CiWdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795831412;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Bb02QMbPzYGMZl2XBsuZPs04tkTOlgjVE/NIsauxzp4=;
	b=B9Ezd83sSjd6U/336CY8pc74Cm45FshmQiCfsVS29IFm88uyDVrrfrMzLX5209BRYEz6
	 CXMUw2b50x4Ne95Sxg1F5WUnVR0UBnyFvZmiZItvnakd+sYxLBLsRQr0g3tRCy+pVEHir
	 KRT3o/1MW8GL+O0mnXl2PcNjn5B2UWISAGnxDv/yJlNR9OWKGXbEifSxGjji+habZDp+u
	 MT7J7RsWQxPidEP00McLGDKvcB7zaeTUOIkKMyEejvS12NE129qaD002zfTS4e+bWjFdv
	 bgOpvxR2CA5JhdZ3BmXbV5e0oR52vT5L7G6frbVExDgUsy9NvN3bvS1d6OZDvgojanQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5dAoixTz;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D54606A31C;
	Sat, 28 Nov 2026 02:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D54606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5dAoixTz
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Bb02QMbPzYGMZl2XBsuZPs04tkTOlgjVE/NIsauxzp4=;
	b=5dAoixTzdi5Pva3FlAw+4G4gvuRSbcuNIp9u6jt4z68aplPRUSy8CmEDY1bii9n7+mU75QUxP
	s5A0vr9IzCzDScYnVJHNow//t6iWbrZ46GCsHh9kMtlyDcQkW7OdSxett+AHYn6ZaJFvgQk+BOj
	M3+5IMQ/nsRWxs/EB7JtCUI=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jbtpt197czKm6c;
	Sat, 28 Nov 2026 10:03:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8271540563;
	Sat, 28 Nov 2026 10:03:22 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 28 Nov
 2026 10:03:21 +0800
Message-ID: <6448a512-9c1a-441b-a8b8-7bf654e8b2a5@huawei.com>
Date: Sat, 28 Nov 2026 10:03:20 +0800
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
Subject: Re: [PATCH v10 3/8] crash_core: serialize crash header preparation
 against hotplug
To: Wandun Chen <chenwandun1@gmail.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<robh@kernel.org>, <baoquan.he@linux.dev>, <rppt@kernel.org>,
	<m.szyprowski@samsung.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <ruirui.yang@linux.dev>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-mm@kvack.org>, <iommu@lists.linux.dev>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
 <20261127090723.741253-4-chenwandun1@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261127090723.741253-4-chenwandun1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/27 17:07, Wandun Chen 写道:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> crash_prepare_headers() counts memory ranges before populating the
> allocated crash_mem array. The weak implementation used by ARM64,
> RISC-V and LoongArch walks memblock.memory, while x86 performs the
> same two-pass operation over system RAM resources. Concurrent memory
> hotplug can change range source between the two walks and make the
> populate pass overflow cmem->ranges.
> 
> Take device_hotplug_lock when preparing crash headers during
> kexec_file_load(). The x86/riscv memory hotplug path already takes
> device_hotplug_lock, so call __crash_prepare_headers() directly
> to avoid recursive locking.
> 
> Sashiko reported this issue in [1].
> 
> Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
> Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
> Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
> Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> ---
>  arch/riscv/kernel/crash.c  |  2 +-
>  arch/x86/kernel/crash.c    |  2 +-
>  include/linux/crash_core.h |  2 ++
>  kernel/crash_core.c        | 17 +++++++++++++++--
>  4 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
> index fe5a4b306aae..ac8df2edf2a7 100644
> --- a/arch/riscv/kernel/crash.c
> +++ b/arch/riscv/kernel/crash.c
> @@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>  	 * memory resources.
>  	 */
> -	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
> +	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
>  		pr_err("unable to create new elfcorehdr");
>  		goto out;
>  	}
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index e6f23933a6df..bef008a0cb22 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>  	 * memory resources.
>  	 */
> -	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
> +	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
>  		pr_err("unable to create new elfcorehdr");
>  		goto out;
>  	}
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index bc087124cd78..28e7a81cf263 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
>  				       void **addr, unsigned long *sz);
>  extern int crash_prepare_headers(int need_kernel_map, void **addr,
>  				 unsigned long *sz, unsigned long *nr_mem_ranges);
> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
> +			    unsigned long *nr_mem_ranges);
>  extern int crash_exclude_core_ranges(struct crash_mem **cmem);
>  
>  struct kimage;
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index faa0f22dbb41..8a861a946e26 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -16,6 +16,7 @@
>  #include <linux/mm.h>
>  #include <linux/cpuhotplug.h>
>  #include <linux/memblock.h>
> +#include <linux/device.h>
>  #include <linux/kmemleak.h>
>  #include <linux/crash_core.h>
>  #include <linux/reboot.h>

The order of the header files is completely messed up now.

> @@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
>  	return 0;
>  }
>  
> -int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
> -			  unsigned long *nr_mem_ranges)
> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
> +			    unsigned long *nr_mem_ranges)
>  {
>  	unsigned int max_nr_ranges;
>  	struct crash_mem *cmem;
> @@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>  	return ret;
>  }
>  
> +int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
> +			  unsigned long *nr_mem_ranges)
> +{
> +	int ret;
> +
> +	lock_device_hotplug();
> +	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
> +	unlock_device_hotplug();
> +
> +	return ret;

otherwise, LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +}
> +
>  /**
>   * crash_exclude_mem_range - exclude a mem range for existing ranges
>   * @mem: mem->range contains an array of ranges sorted in ascending order

