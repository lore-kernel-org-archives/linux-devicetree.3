Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729083;
	b=uBo6RqvLNiDvuzkE/9D62l4EJTYrUJNA5grlu8rGKOand6ieWcZ2Jv84YwbDYEmVnAjh
	 vPEa12WYNrq0LURYBGHJqv3F3wlxyhoonb22/7zhlG0m83nCERYlMmzsOaqMe/p1cu60u
	 euiRBysfk6Rn7fau0ZqDlZHz/ffcOw/5YRNEFJTY89kAGkBNqOnf4QJMu9got/BhJvxBG
	 +DHLJUTM4ruvBnF5DKXW+nS55+43o81JKODN9OxqHpH4ompcGrTbAMQXmRnbzRtsVmUIB
	 CpjFRA9g98ChvPe8bo7UgLW5+104CqNl8SqRkIzsdSVK04xUE/FhJl02sq2n/6CgPdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729083;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=6s58Pb4hAe6Hy7/bwQYEC0q1H7BmJZKjEQo1aMto/nU=;
	b=ErG01VzpqZ0im6LQwZUr7s02eNVGdQF8GVDDAumhS7T6GCGAwISunkDpJ8SXVlcUl/03
	 iogcmaH+Xmt02Zb+jiaAhhaqohriatQVxaWA9RSP06aiRPyTBEiPqeVAqUDojEHzHs3m0
	 3F8dYzd1ZRYIwQseaoSzUNe/YnbKuwvFcPLecZM78uHcOqvYBLVfJJswGA8A6eJSjjMFJ
	 HBDEX/6JEaMg2s1J7oPTup6r3Z5N51OLtPQ4WBc6UV8CdNbTD+PSJ3FMd6C2zAdoVyJI0
	 sYRz9lBaHLjNufKSFUihnWuVZLPkJLNDJ3MQj5MTUJnlyGftkgQ5dNAJ/5/lI/qawmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA24606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 18:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA24606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7bec5112765so2945787137.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729082; x=1794333882;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6s58Pb4hAe6Hy7/bwQYEC0q1H7BmJZKjEQo1aMto/nU=;
        b=yKU2QpOJNawZw4NwFrxblFnGGf5Ns1csiospvK4UGSv3/xdV4RkY5LgSwCEIuZYvU3
         VkyNH34Fxkid/MoN4X0cNxAL8pYd6Ofz+TvO0UBIbfdVpd/0hPwVk+tAz84L+Zrmoi1S
         qXOIhHdia5zgEm2V70TVSOsvu2k9In/n1ghEERi1cLW9sPZft7tQdGFD9jW/vLTvVR33
         VuuGb90sqI1OMpTJpbvCoTFyDaYTcKCrZykZdY8dFU95Fgxqm9X03IkIUFxoLKA2FuDI
         3SfrWP6/qV5Iom8YN+ANut5Uhpa7l3+Rt006hs7dOy+KzmabSaF0YAD0xv+WzbVrLg27
         GWWA==
X-Forwarded-Encrypted: i=1; AKwUvBzEDKCHdUyBn40z9pHCHN+IcstU+yNn2Ckvjk+6kBTeHqMZIHiFd78qjVP7D6Yw65Fl7L+lLEYm/NCT@vger.kernel.org
X-Gm-Message-State: APuU4Z/VS8aidVqx8Zoi3I3wYQeyt+eYzlrLuEriFSdS0UcY2YtQCJ1E
	OMyVHgM4TXrf+2PdOVQtQYbrhEIx3q46I+goW5Pv8gTrab/owFalbg1faaFdeAEY
X-Gm-Gg: AYBFou1p8dxIU+/uE6PhL5Td/DLeY+9NiDi8xK1ji5U6qXdLlRulQ9x+Ni41pl/xF+K
	xK0XG45wZu6uwM5wro7Wb/8qE1uENndZL8yBdGcxYCIX6h6mJM4+B49Jwmn+m+l13MkRHzoijJs
	oe54nh9zGAGOk9ITqRQpKrZXT4AFvw1dVLBI1+eyL+35MJEKZVkXXjevmZINNZdbT3WuCgjpwMf
	4bYo8rmUVmfW2ejY2D5qWWNTmGSwJc95qlUrarViqziMpnuow7VGLidImSk+8x+nsuEQJvsyXEt
	hzWUkrStEinLDjum+85Kz8xjNzuHy3hItAllg7BcwiNNJ4YQ1uJcE4ckc8NQyK8fRvT7JUBUW5W
	AUKhd2iPWgwBB35SvylKRzecfEBwN9rwtGIzRwOjHDYxSlJ1Nj6Le65fkn5XTzm75V9XvujqjqJ
	mVz21XbH/XhVgkXZvtYgewm0GZfkmTaZ4G+q0zs6VKrB1lkex89q8ZWRN4E3gH4LwzW4vgg6p8o
	86Hx1Pu0PGn0/sCTOSEHT0a2BQKZkw0iv9IcNfkcHZr6ybA+PP7NKuRxJBnZShj3XHQVQFc+MdM
	OtOdy0uL+mErMRIb0ost6O+Rp+4U9hFyTsCkndjE1kkj0fawoCE=
X-Received: by 2002:a05:6102:f0a:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d072bb37d1mr6305451137.12.1793729081571;
        Tue, 03 Nov 2026 10:04:41 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec76ec2e49sm10240167e0c.2.2026.11.03.10.04.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:04:40 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-998569550adso251170241.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:04:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwApk3bMbpTRx8qad1gpVnHq3T9vU5se8G/+PlYLtf27IK6tEr4tjoP5Of/hMTL8/D4aBgS9wksPfDx@vger.kernel.org
X-Received: by 2002:a05:6102:14a3:b0:7a1:f951:664f with SMTP id
 ada2fe7eead31-7d072ca34famr5656944137.22.1793729079166; Tue, 03 Nov 2026
 10:04:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6@eucas1p2.samsung.com>
 <20261015082315.56876-1-m.szyprowski@samsung.com> <20261015082315.56876-3-m.szyprowski@samsung.com>
In-Reply-To: <20261015082315.56876-3-m.szyprowski@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Nov 2026 19:04:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcM9yvwLBSi-aYRinG3omhu5aoeNVYynfFQsnDDWR-Hw@mail.gmail.com>
X-Gm-Features: AclHuK_SLyopQmsKezfvIJp8vgdHBUR6jbYkiTzIVRA3K3sJMZtG6ZwxF0OVemw
Message-ID: <CAMuHMdXcM9yvwLBSi-aYRinG3omhu5aoeNVYynfFQsnDDWR-Hw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>, Wandun <chenwandun1@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 15 Oct 2026 at 10:29, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Get rid of the static, limited-size reserved_mem array and replace it
> with array allocated by memblock_alloc_raw() and accessed directly or
> through a temporary early_memremap() mapping (depending on the
> architecture support). Such mapping is needed for some architectures
> (like ARM64), where linear map is not yet available during early boot
> scan. The array is allocated from the bottom of RAM to avoid placing it
> in highmem area, because some architectures (e.g. Xtensa, C-SKY, MIPS32)
> set the memblock limit to the end of lowmem only after the early scan.
> The early mapping is not used on PPC64, where the scan is done before
> early_ioremap_setup(), but the memory allocated by memblock is already
> accessible at that point.
>
> Having a single, writeable array with all reserved regions removes the
> need to perform two step initialization introduced by commit
> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
> regions are processed"), so all regions can be processed during the
> early scan again.
>
> The reserved_mem array is allocated only after all static (defined by
> the 'reg' property) regions are marked as reserved or no-map, so it
> cannot be placed in any of them. Errors of the early reservations are
> not recorded per region, only the fact that some of them failed is
> stored and a message asking to fix the device-tree is printed. The
> region specific init functions for the static regions are then called
> in a separate pass, once the array is available. Then all dynamically
> allocated reserved regions are processed.
>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for your patch, which is now commit aa05faf815836c47 ("of:
reserved_mem: allocate and map the reserved_mem array early")
in dt-rh/for-next.

This causes an early crash on BeagleV Starlight Beta:

 [...]
 earlycon: uart0 MMIO32:0x0000000012440000 (options '115200n8')
 printk: legacy bootconsole [uart0] enabled
 printk: debug: skip boot console de-registration.
 efi: UEFI not found.
-OF: reserved mem: 0x00000000fb000000..0x00000000fcffffff (32768 KiB)
map non-reusable framebuffer@fb000000
-OF: reserved mem: 0x00000000f9000000..0x00000000f9ffffff (16384 KiB)
map non-reusable framebuffer@f9000000
-OF: reserved mem: 0x00000000d0000000..0x00000000f7ffffff (655360 KiB)
map non-reusable framebuffer@d0000000
-OF: reserved mem: 0x00000000c9000000..0x00000000ccffffff (65536 KiB)
map non-reusable framebuffer@c9000000
-OF: reserved mem: 0x00000000fa000000..0x00000000faffffff (16384 KiB)
nomap non-reusable dma-reserved@fa000000
-Reserved memory: created DMA memory pool at 0x000000107a000000, size 16384 KiB
-OF: reserved mem: initialized node linux,dma@107a000000, compatible
id shared-dma-pool
-OF: reserved mem: 0x000000107a000000..0x000000107affffff (16384 KiB)
nomap non-reusable linux,dma@107a000000
-SBI HSM extension detected
-[...]
+Oops - store (or AMO) access fault [#1]
+Modules linked in:
+CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted
7.4.0-rc1-starlight-00002-gaa05faf81583 #411 PREEMPT
+Hardware name: BeagleV Starlight Beta (DT)
+epc : __memset+0x68/0xfe
+ ra : fdt_scan_reserved_mem+0x3a4/0x80a
+epc : ffffffff8087fd88 ra : ffffffff80a313c8 sp : ffffffff81403c20
+ gp : ffffffff814dc6c0 tp : ffffffff8140cf80 t0 : ffffffc4fea38ff0
+ t1 : 0000000080200000 t2 : ffffffc4fec03008 s0 : ffffffff81403d10
+ s1 : ffffffffffffffff a0 : ffffffc4fea39000 a1 : 0000000000000000
+ a2 : 00000000000000f0 a3 : ffffffc4fea390f0 a4 : 0000000000000008
+ a5 : ffffffff8087fd88 a6 : 00000000000000f0 a7 : 0000000000001000
+ s2 : ffffffc4fec00000 s3 : 00000000000000f0 s4 : 0000000000000000
+ s5 : 0000000000002de0 s6 : 0000000000000006 s7 : fffffffffefefefe
+ s8 : ffffffc4fec02fd4 s9 : ffffffff8148e318 s10: fffffffffefefeff
+ s11: ffffffc4fea39000 t3 : ffffffff8150df00 t4 : ffffffff8150df00
+ t5 : ffffffff8150df00 t6 : ffffffff8150df78 ssp : 0000000000000000
+status: 0000000200000100 badaddr: ffffffc4fea39000 cause: 0000000000000007
+[<ffffffff8087fd88>] __memset+0x68/0xfe
+[<ffffffff80a2f63a>] early_init_fdt_scan_reserved_mem+0xa4/0x110
+[<ffffffff80a06c8e>] paging_init+0x17c/0x46a
+[<ffffffff80a046dc>] setup_arch+0xdc/0x584
+[<ffffffff80a009b8>] start_kernel+0x98/0x940
+Code: 0000 8793 00e7 8305 97ba 8782 b023 00b2 b423 00b2 (b823) 00b2
+---[ end trace 0000000000000000 ]---
+Kernel panic - not syncing: Fatal exception in interrupt
+---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

Reverting the commit fixes the issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
