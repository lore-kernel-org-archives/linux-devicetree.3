Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E7647B425
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355660; cv=none; b=oTUPZBRE5oz+yxLWDRuBoYPLdUl8IpKo4BIbZRz3gyfUUvNQVTCwtvs58chz2Ciy26RYmBXJtGoVJOnlvJm6muBsP9xyd7m7zsx1wJ6xg1eKkYvlg+BfJLjfSp3nNJAXyFMaS92HyycAjqOmbSksCOSQr1yzzQeJGxbtQNvr+9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355660; c=relaxed/simple;
	bh=46EGZ5pqfojB4SEknL4ghE/O+NrgMIaCGgz/FeaouIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zfx7hYXUEEQiQ6gaIZw6a4O3ofXaDmK7bPs5fEkKQNQmHH1Ta2fjuRZ+yw1LCwkjg27Clnp517UTedtHguYNVo8lZKwoJ3rlKncnGqXA2/ftYyHhrkjyfTn7AYcLZ22I12Lx8nlD+vQD3am1VxRHHyO9nggvGS/x/D0xb2DwfEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ofKbxAXN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ofKbxAXN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c255c58156bso169823366b.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788355654; x=1788960454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zt5M13bJdXW7K7qyVlwwml2r+oge4XhKrpcO5BXQh9I=;
        b=ofKbxAXNtAzivtKRsGVB85Itd0b0Oy6YbN2Xs1wGHxV1lwAt7HTvTH1RijoRYa+i2S
         OTq0/h0iG1g2O+uUMTLrNZFaZ6TqdffnophWz4XsJFiGwxk590vdQP7bTJ+sR0Hpfto/
         bsUvooe6hGjrjx/fuGKOSW+A5WViz58TiJ82burSvpfe0YbXBemHpsa9fH7skW/yeufl
         Od+iJYl6k1nsXG0VWrpFotkdJdaaPkJdmEipfwDGIEzGdWTWhFqcFsZAtNSKCuoxwPy1
         rAzaCVN9OlEtzj69O5uDQn8vUMSVw9PqHdUS83jxxFvj6l8wZqS4AxX8ZgIDuWsxWdRZ
         SApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355654; x=1788960454;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zt5M13bJdXW7K7qyVlwwml2r+oge4XhKrpcO5BXQh9I=;
        b=JJCWD0ycnPe1MAB3WAScMtg4ivjMDvgffEKoigoKVQRv8W/kwQNXSDSz97bH3aIDLV
         8aWDO0sH+eK+B6X6A7b++htdzKUnexNuTAAGBZkyRGUMhGN9LxhUcBo/FxmW85ABMt+u
         A2YZeFhswJjJRRoxm63mMM3BT7xNaykYwU9PPk1YEDdA6TvwR3qqiBDYcdcv1BL4xFSt
         uwtXn1mSqqCDHgKijEOIHIs7/be6ugtM+vUxW99ejZ+8+ffjRMDM0aQ6xbxeMQbepR52
         mahOe/RBAKbYJtxHOjFGR2L3CtKXKaQKwG7F1Kh0bI1VZc6cxaXQ5oV7Aoe/Jb1LGpZz
         xfDw==
X-Forwarded-Encrypted: i=1; AKwUvBzqx7iT6tvJmdgImmmkz3i4Ht6I/y0t0Cu6e2mNT9rKWr7Nlp00RIHkeSUqgtJxzvFnbRcs98s7lnw9@vger.kernel.org
X-Gm-Message-State: AFuF++mWI/p7fj+vCEqv98jaU+wqXpdYIyWkrx9bN+RCab4fZ/PQzec4
	XAscGRywNQV9tBx5uh2CGbtbu4vQuiUEAqrsDCx3/u8JsPlNAEQ7UnV6QT3Gl9MOCg==
X-Gm-Gg: AYBFou1MVzMAdVsiMTtFgplyjBnfZR8h5+cVauR+4mXxLrXzoMuyITJXbZKHgZhJwGN
	jHb4OBArrv83+5E8MgTHiFXVaCSgiq4Z/eeP+HkCXtzEhmno4k85RrZcEa1+Q3Duqy23fS2EHX1
	6mbJ5Ek4AEA8AKP61kAND9BUGlPQTCkTeYpVHlPf9EnSTmAhlWCG1eOD3LuNw9mar3rdpDptSJA
	mGgkfyJOR9Z7OWQV3WdL1+aNlCtDNSiC7ZQoWzqeVgNHDKAcaC+F9HF583fFBjaao+mtVHjAvyy
	SOuWtRguSQ0+RcGoQUmCe580Tf6n92xXlJ6YiNXs1hS3MI0J4BwmRwhObIsUMY37PZajDyaL3vD
	pUohUZl/xA15uYifed9T5qhUZZWBb83zfgLceqFnBtwTQvpdGqR3dbZ+CVdxl/vOrJGfDmB7jcc
	RonYY7X3JNImNHeTR2KkevF12VRc31Jo4WW6KuqTDtO44SomYum5gCOouguR8USQx4eVhXfubM5
	OKNu4FhN4wI3nT9DHBiaUUuEYrGNrW4
X-Received: by 2002:a17:906:f58e:b0:c25:c954:faf2 with SMTP id a640c23a62f3a-c25d563a41cmr291059666b.21.1788355652676;
        Wed, 02 Sep 2026 06:27:32 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d796sm138037066b.40.2026.09.02.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:27:32 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:27:28 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/10] arm64: Unmap FF-A lent memory from direct map
Message-ID: <apgkQJai-2pjI75-@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>

This is of course v1, not v9...

On Wed, Sep 02, 2026 at 11:47:02AM +0100, Vincent Donnefort wrote:
> This series is a follow-up to the discussion that has started here [1].
> While standalone, it also provides primitives reusable for the VPR DMA
> heap.
> 
> When memory is lent to the Secure world via FF-A, CPU speculative
> accesses from NS to the lent pages can still occur as long as it retains
> a cacheable mapping to it.
> 
> Ideally, lent memory would be "no-map" but that would mean giving up
> MiBs of useful memory, so let's try to do better with the help of a CMA
> pool.
> 
> On arm64, modifying the direct map at runtime is generally restricted
> because the linear map defaults to block mapping and splitting blocks at
> runtime may trigger fatal page fault, unless the CPU implements BBML3
> or the entire direct map was mapped at page granularity from boot.
> Forcing last-level mappings system-wide incurs a severe penalty we want
> to avoid. Instead, this series introduces targeted last-level mappings
> for designated memory regions, along with the "arm,ffa-lend-pool" CMA
> driver to manage unmapping and remapping on lend/reclaim transitions:
> 
> 1. memblock & OF reserved memory ("ll-map"):
>    - Introduce MEMBLOCK_LLMAP and the DT "ll-map" property for reserved-memory
>      nodes to force last-level (PTE) mappings only for a specific region.
> 
> 2. set_memory infrastructure:
>    - Introduce can_set_direct_map_range() to check if a specific address
>      range is mapped with last-level entries and can be modified safely.
>    - Introduce __set_direct_map_*() variants that bypass redundant checks
>      when the caller has already validated the range.
> 
> 3. "arm,ffa-lend-pool" driver
>    - Introduce the "arm,ffa-lend-pool" CMA reserved-memory driver, which
>      unmaps pages prior to lending (ffa_prepare_lend()) and restores them
>      when reclaimed (ffa_lend_reclaimed()).
> 
> 4. Optee support
>    - Hook OP-TEE dynamic protected memory pools to "arm,ffa-lend-pool" for
>      both SMC (via DT memory-region phandle) and FF-A (via
>      ffa_lend_pool_attach()) transports.
> 
> Testing:
> ========
> 
> Tested with QEMU v8 using OP-TEE OS (built with CFG_CORE_DYN_PROTMEM=y)
> under both SMC and FF-A transports [2]
> 
> static void dump_direct_map(const char *label)
> {
> 	printf("\n=== %s ===\n", label);
> 	fflush(stdout);
> 	system("sed -n '/Linear Mapping start/,/Linear Mapping end/p' /sys/kernel/debug/kernel_page_tables");
> 	fflush(stdout);
> }
> 
> int main(int argc, char *argv[])
> {
> 	int heap_fd;
> 	int dmabuf_fd;
> 	struct dma_heap_allocation_data data = { 0 };
> 	size_t size = 1024 * 1024; /* 1MB */
> 
> 	if (argc > 1)
> 		size = strtoul(argv[1], NULL, 0);
> 
> 	dump_direct_map("BEFORE ALLOCATION");
> 
> 	heap_fd = open("/dev/dma_heap/protected,secure-video", O_RDWR);
> 	if (heap_fd < 0) {
> 		perror("open /dev/dma_heap/protected,secure-video");
> 		return 1;
> 	}
> 
> 	printf("\nOpened /dev/dma_heap/protected,secure-video\n");
> 	printf("Allocating %zu bytes of protected memory via DMA heap...\n", size);
> 
> 	data.len = size;
> 	data.fd_flags = O_RDWR | O_CLOEXEC;
> 	if (ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &data) < 0) {
> 		perror("ioctl DMA_HEAP_IOCTL_ALLOC");
> 		close(heap_fd);
> 		return 1;
> 	}
> 
> 	dmabuf_fd = data.fd;
> 	printf("Successfully allocated %zu bytes! dmabuf_fd = %d\n", size, dmabuf_fd);
> 
> 	dump_direct_map("DURING LEND (EXPECT HOLE IN DIRECT MAP)");
> 
> 	printf("\nReleasing dmabuf_fd...\n");
> 	close(dmabuf_fd);
> 	close(heap_fd);
> 
> 	dump_direct_map("AFTER RECLAIM (RESTORED DIRECT MAP)");
> 
> 	return 0;
> }
> 
> [1] https://lore.kernel.org/all/20260807-tegra-vpr-v4-7-5510d16af89e@nvidia.com/
> [2] https://optee.readthedocs.io/en/latest/building/gits/build.html#qemu-v8
> 
> Vincent Donnefort (10):
>   memblock: Introduce MEMBLOCK_LLMAP
>   of: reserved_mem: Introduce "ll-map" property
>   set_memory.h: Introduce can_set_direct_map_range()
>   set_memory.h: Introduce __set_direct_map*()
>   arm64: can_set_direct_map() if BBML3
>   arm64: Implement can_set_direct_map_range()
>   arm64: Implement __set_direct_map*()
>   arm64: Add support for MEMBLOCK_LLMAP
>   firmware: arm_ffa: Introduce ffa-lend-pool
>   optee: Add support for arm,ffa-lend-pool
> 
>  arch/arm64/include/asm/set_memory.h  |   7 +
>  arch/arm64/mm/mmu.c                  |  23 ++-
>  arch/arm64/mm/pageattr.c             |  67 +++++++-
>  drivers/firmware/arm_ffa/Kconfig     |   5 +
>  drivers/firmware/arm_ffa/Makefile    |   1 +
>  drivers/firmware/arm_ffa/lend_pool.c | 223 +++++++++++++++++++++++++++
>  drivers/of/of_reserved_mem.c         | 104 ++++++++++---
>  drivers/tee/optee/ffa_abi.c          |  13 +-
>  drivers/tee/optee/protmem.c          |   8 -
>  drivers/tee/optee/smc_abi.c          |  17 +-
>  drivers/tee/tee_shm.c                |  11 +-
>  include/linux/arm_ffa.h              |  21 +++
>  include/linux/memblock.h             |   9 ++
>  include/linux/set_memory.h           |  39 +++++
>  mm/memblock.c                        |  50 ++++++
>  15 files changed, 545 insertions(+), 53 deletions(-)
>  create mode 100644 drivers/firmware/arm_ffa/lend_pool.c
> 
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> -- 
> 2.55.0.970.g62bdec98f9-goog
> 

-- 
Vincent
