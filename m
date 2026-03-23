Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0123733FE02
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307010; cv=none; b=qkjnVTF938W1fGWWeZZN+3VElTk342d1VHQBz61RnVGG9xBRGXRf2j83HR9JRsIn/cmUkR8hPtwiEyNz8OnAGQayD+i726WcT70yjONTg6WEcL2zAgBlkOCKvGo99bC9lj4xPNEQS7tCdD6ZUOdB+fL/Vb610WJHfPbANgyHtw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307010; c=relaxed/simple;
	bh=PTgkNOGVn0B+M9WSyeKtUsSehsmzk5JtLlTeVfzqQf0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kEeZr0qrCWjVCYxuGMH+W1zM/5WisJvHKriiDDoRo1Ap5zACBocdO36X7bVjK1RM2UpBOm1znx9U5ieasT2Hme29e9NRdzjCzJlo19JFnzTnLo4r5CTWpB8QSD9duGCuH+KiOc2FWILjdUlbpm6Psxxoe/egcb9SCEhMjdAIkpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+TqNv/3; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+TqNv/3"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3120544eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774307008; x=1774911808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BZztsE1r2FiTb70Dm21KViQxBIeEVdaH74oQDXwWhlo=;
        b=M+TqNv/3aYwOno/uua0mLCGtzPo/QxJWwGV3ySmOm2L8b7FUMZ2NKHFK4eGDs9vZka
         CczgrAqnFYMCSFMhf5sM6leCUzKcYL9RvLgafwpr7QcZdvcSRC9E0Ar7XU9F3MWr67jD
         0YP+j2gDeBPE5OK1rvM0puuhl539HLx/rhmOQHPTxnX1429wb7HZwmA6V2lhO4Pho16L
         kTr8XbEJMMfNh/YmiPCtgfLhEhSIry9rGAqXUW3TqX2dEuga6r9UtPQ+PwnL448VTACJ
         B+/4MVJ++uA7/XBV33/Zq80/s9y8VHCyrxi0MUmuctMSeE7dXmHLCkN/RRyaahZ5yNHB
         7IDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307008; x=1774911808;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZztsE1r2FiTb70Dm21KViQxBIeEVdaH74oQDXwWhlo=;
        b=CpnOG0/Y7PTDJe7HB5ieqYsqrKDkKviJHDTw8PmyLKacFOKNtVojB7ub8I8qFeGCfK
         QHcehNR5Eoe+4aZXw6kKQQKtvN5ZagZ1vR6aCxX5xp2ZoNWQP1+aUd83KXD2z/FmB0rZ
         ZuCTEDwA56EQmfGQhl4nq1iskDsXyaWJWjnUXjDj9s6xtFOmPHosEBAVno+kpgLCtj5W
         ShRSsSPxB3wPmdUSBBQ3d1qHqX8cL37HIOM1HUFbfUxeaNMUc8QNyNiUrzcz4gGVzF0S
         LS4aCGt8E6k7WlklnLlp+qpZoGQyt/uLode+gFKPyWxT8+RKKrR/2wrIrfHrNhsRc22k
         6SdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvjbPSj3jtFei0Fm8fhRD91XUEcmsrU/xC1vwWx/dgz9XVQwbNLRc+w6DdNFiOhKhOxvU2mqjw+Fd6@vger.kernel.org
X-Gm-Message-State: AOJu0YyvIFMdu5I76NiOUmVOeiH3e63ZSc+piYlZ0wUVhdy3cs80Vdgi
	I+/JkP3zab7XgjmVgSVVK/L2SKJT+258rCUXnhodH9+ebaIQVLbF68tp
X-Gm-Gg: ATEYQzwhyFTu6nY4+qUNlRvU3ReSaiJibubxVDWDnSRzrNjQ9yw7EphsW9A8RaUE2p8
	EJpjkvXqlZ1PCThczFG0vE2HPRcskC03QMIAATDX6UgqN1o+SPofJa8tXyehc5NvtFMGSUnv3v+
	bvnp4xL6OgNRO8SBs5rO/tHH9+zlfkWToTBogX7mUBexF7eUx+0RD9tTpvqWlP/lvKmcc6keiKb
	l/JCMQtNdZEH77ItdzUTDHu9XMITXBbG6abl0fE5cFwr1otZSO+KnaMfFwbSGNnsgu0GWApgZtd
	6fW6QwVwCo3wR9DLtalFzGevfEsDNHEE5UndtrPvV27r1Rmif/XQXUTfVMbeneDzLYZX7xHacRB
	wePS21O/2ze8x+PZjD4PoHcEp9a8VoptTJyTSOYon01+U28roK0kEkmzusOMc9hUnWWlRQ8CPvu
	mZtB89P/hzbhKL4eR1zGMlryU4tAWrJGWtR/pJD0xollUZf9w=
X-Received: by 2002:a05:7300:7fa2:b0:2c0:bd37:a75a with SMTP id 5a478bee46e88-2c1095a4d38mr7277143eec.1.1774307007715;
        Mon, 23 Mar 2026 16:03:27 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b8f2sm18642252eec.9.2026.03.23.16.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 16:03:27 -0700 (PDT)
Message-ID: <ee2b42b0-1489-478d-8c88-ced6b77824b3@gmail.com>
Date: Mon, 23 Mar 2026 16:08:33 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/3] riscv: support EIC770X/JH7110 noncoherent
 devices with XPbmtUC
From: Bo Gan <ganboing@gmail.com>
To: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc
Cc: lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, conor@kernel.org, kernel@esmil.dk,
 devicetree@vger.kernel.org
References: <20260316060328.1173634-1-ganboing@gmail.com>
Content-Language: en-US
In-Reply-To: <20260316060328.1173634-1-ganboing@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

Any suggestions/comments on this?

On 3/15/26 23:03, Bo Gan wrote:
> SoCs with pre-Svpbmt Sifive cores, e.g., Starfive JH7110 and ESWIN
> EIC770X both have non cache-coherent peripherals. On JH7110[1], video
> subsystem (GPU/VOUT/VPU/ISP) is routed to the sys port, making them not
> cache-coherent. On EIC770X, all peripherals are routed to the sys port,
> and none is cache-coherent. Instead of Svpbmt, these SoCs map system
> memory twice -- the conventional cached region (through front port),
> and the uncached alias (through sys port) at different base addresses.
> The uncached alias implicitly applies the uncacheable PMA. Drivers
> working with noncoherent devices can utilize the uncache alias to map
> DMA buffers, without doing explicit cache flushes.
> 
> This feature is not an ISA standard, and the cache/uncache base can be
> configured by the SoC vendor. To expose it properly, introduce a Sifive
> "errata", namely "XPbmtUC", to model the setup as a customized version
> of Svpbmt. It choses a single, artificial bit in PTE at runtime for
> cache/uncache control, effectively offsetting the PPN by power-of-2.
> On JH7110, it aligns perfectly with the HW: it maps the cached region
> at 0x40000000, and the uncached alias at 0x4_40000000. Chosing bit 32
> (PPN bit 34) as the UC bit matches HW exactly.
> 
> Starfive JH7110 (Sifive U74 core) memory map:
> 
>            [0x0,   0x40000000) Low MMIO
>     [0x40000000, 0x2_40000000) Cached Mem
>   [0x4_40000000, 0x6_40000000) Uncached Mem (UC+)
>   [0x9_00000000, 0x9_d0000000) High MMIO
> 
> On EIC770X, the aliased UC region is put to a offset not power-of-2.
> There can also be 2 NUMA node (dual-die) with 2 separate memory regions
> and their UC alias counterparts are offsetted differently. We detect if
> the firmware has the capability to re-arrange the memory map, using
> G-stage pagetable, making the the offsets power-of-2 again.
> 
>              [0x0,     0x20000000) Core Internal
>       [0x20000000,     0x40000000) Core Internal (Die 1)
>       [0x40000000,     0x60000000) Low MMIO
>       [0x60000000,     0x80000000) Low MMIO (Die 1)
>       [0x80000000,  0x10_80000000) Cached Mem
>    [0x20_00000000,  0x30_00000000) Cached Mem (Die 1)
>    [0x80_00000000,  0xa0_00000000) High MMIO
>    [0xa0_00000000,  0xc0_00000000) High MMIO (Die 1)
>    [0xc0_00000000,  0xd0_00000000) Uncached Mem <----------.
>    [0xe0_00000000,  0xf0_00000000) Uncached Mem (Die 1) <--+--.
> with firmware/hypervisor re-mapping:                      |  |
> ------------------------------------                      |  |
>   [0x100_80000000, 0x110_80000000) Mem UC+ ----------------'  |
>   [0x120_00000000, 0x130_00000000) Mem UC+ (Die 1) -----------'
> 
> The "XPbmtUC" alternative PTE format is the cleanest solution I can
> think of to solve the non-coherent device enablement w/o Svpbmt from
> kernel side. Drivers can do explicit cache flushes to workaround the
> problem, but a. it pushes the burden of cache flushes to driver code,
> and we don't want to complicate them if it's already written with the
> cache coherent assumption in mind. b. complex drivers like GPU could
> allow user-space to mmap DMA pages, but userspace can't flush caches
> due to the lack of Zicbom on these SoCs. I'm aware there's an ongoing
> series[2] that Samuel sent for physical memory aliases, which is
> essentially a superset of my patch. I don't mean to step ahead of him,
> but try to find a middle ground if the community still worries about
> his change touching too many areas. My change is very minimal and
> local. It's fairly easy to remove, too.
> 
> ----------------------------------------
> Notes about PoC firmware implementation on EIC7700X[3]:
> 
> The OpenSBI is augmented to provide a very thin layer hypervisor, where
> it runs the entire host OS in VS-mode, and provide the aforementioned
> remapping. I remap UC+ memory to 2^40+ to make the 2-stage translation
> efficient, where I can utilize Sv39x4 G-stage scheme to map the entire
> physical address space at bottom-half, and the uncache counterparts to
> system memory at top-half. I also make use of the largest page in Sv39
> -- 1GB page, to map everything, keeping the G-stage page-table minimal,
> only 16KB in size, while also minimizing TLB misses. A very slight,
> unavoidable, slow down is with the external interrupt delivery. Due to
> the lack of AIA in EIC770X, all device irq now needs to trap to M mode
> first, before forwarding to VS mode. The overhead of running KVM in
> such setup is yet unknown, and may well be noticeable. All HS-qualified
> instructions will trap to M mode, which is costly. The NACL extension,
> if implemented, will alleviate it, but there's also the extra cost of
> flushing G/VS-stage TLBs. I'm analyzing it in parallel.
> 
> Use [4] if you have a Hifive Premier P550 to try it out.
> 
> [1] https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Cache%20Coherence%20V1.0.pdf
> [2] https://lore.kernel.org/all/20251113014656.2605447-20-samuel.holland@sifive.com/
> [3] https://github.com/ganboing/opensbi/tree/eic77x-vspt-physalias-wip
> [4] https://github.com/ganboing/linux-eic77/tree/ganboing-xpbmt-uc-v2-eic77-clk-v15
> 
> ---
> v2:
>   - Move the core logic to Sifive errata to address Conor's comments
> 
> v1: https://lore.kernel.org/linux-riscv/338f0f79-1eed-4c5c-9966-04a2eaeb3d98@gmail.com
> 
> Bo Gan (3):
>    riscv: alternatives: support auipc+load pair
>    riscv: errata: sifive: support auipc/load pair in patched alternatives
>    riscv: errata: sifive: Add an "errata" to simulate Svpbmt on cores
>      without
> 
>   arch/riscv/Kconfig.errata                    | 13 ++++
>   arch/riscv/errata/sifive/errata.c            | 80 +++++++++++++++++++-
>   arch/riscv/include/asm/errata_list.h         | 19 ++++-
>   arch/riscv/include/asm/errata_list_vendors.h |  3 +-
>   arch/riscv/include/asm/insn.h                |  8 ++
>   arch/riscv/include/asm/pgtable-64.h          |  9 ++-
>   arch/riscv/kernel/alternative.c              | 11 +--
>   7 files changed, 132 insertions(+), 11 deletions(-)
> 

Bo
