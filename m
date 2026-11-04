Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780387;
	b=QWapUqCX8jRhNUlqf3mAoefYdjlLEPgrVgfKZbn+akrq0Y7+hvAFBVDZBOCXaKEaN/d5
	 oFZkNCO8QTDzmDOrvnEJVNCz06Ibn7lzLoUqGTyG62NtvwDexUZVWCF+8ZO5sRyaiRJrz
	 +Yz36OF/nrNUpKF0X4XJPYzybWimLAxw7dN9Gj7hFOuEE+4z7nXgbAj8rAW4+S+ek2glY
	 SQojDry6yhbuLYGnarto26k+AzeJ1VcFHX0Tv4Ri+qx6TxiK9rFCEriCIcRd6Uhdk6lnb
	 MWc+Yrf7zTBs8RoNXgdhCysvNonkhChUrL08YL+Kf8pZTGLP1q0R8Gswtf4Vui3nakg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780387;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=42r2UWM+27wxK3ur3WfunLpFTMSv5s5Q7SbgpgMkzU0=;
	b=SrfPbywQFceuaIXdaa/NDFoR8Sk+TkU+5Kz53rSP7gHZqkD0vE4bUmYcFGooxlZFfPYX
	 JKoTXkixytrMFPvSuHwiLoG0d8I0ojfrauy307vaBWl2x62+gE8saMVPKC+WxOW21Hd4y
	 exa9pJ1NVlUkGLrnTAW+SIEW2CTWH/htmxj7fQAITU494UmOe8o/4MdFDFd2bCY0xKnMB
	 It7A2/TkfUoA2hfKpjcgCjCNStSpY02Zz3s/V8bjYVSCmynw+N4zi71HG3u3w5xOdLVop
	 EpRb2VFCd89h6J8S9D+09PO/MigHMvUoqhE9hjcqWgOnCMPzuHh9BAu7jeMZgWvEfpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62B606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB62B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eabf243d05so124887e0c.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780386; x=1794385186;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=42r2UWM+27wxK3ur3WfunLpFTMSv5s5Q7SbgpgMkzU0=;
        b=2ToUrk114oLik8dRxfeg0Mdq+kvZrLnkeZdUSrRrirXEwVxvJ57ZT8swpsn96slbLL
         pcEfh3Wd42PblTVt8VU/PFjIXkdgjOep546wSOgsgTt0tTD3XURrpDmHhoYuUHpU1B45
         U2z0GDW24pXQdzq1SVbc89nD4UxbBslR3zDefa3z/es/UlMfb4TQWxLi7+WqfS4xGdzd
         3q5OnT9DOTCOsXG0xi05NEmjuVEo6X+NEHznX2f6IXbbehXzl5AJJxNh2rz9aAuICa+m
         0tLHFJ0qilXiKBKdZSGQ5Zl+mND4IlJnfvjBJ17afgxN6IyKyz5ATPT0ohttOhLpOoP2
         CilQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNXQ4unJCCYPAwp94JpJltm3OTqANEhw2GyUxyV0irFnsh42nHHAejchROQmSKRiQhOLvCa3m4H69V@vger.kernel.org
X-Gm-Message-State: APuU4Z/1EpxPjv+poTE0LLCearJmRVKyXoY6HYau7VNXfpakovkiZanJ
	5Wn7UKokqtaJsOuVuCZOfnygArmAAmxUcW5zawpZOEvx9FvUzKIunzA28BS1hHXf
X-Gm-Gg: AYBFou0zrLbyR5k5D9Du67Rt9hYrdIwBQ5jD9c4waZbZe1vV7Rf9kvy1hRC0ZfxLBsB
	gg2tsqQyeBSlQB7zzXx5q9E1V/AinuQsb+dXZYhj/77jpqCnO7A0hfx9+MMdWakmGkzUFU45Kc5
	2ozhPcQjoDjGkVPpk8TVpri6cijjMvf2mVEKFeiLoeyYMDNtopBRZB486CgO9LMKC9uoze+rRuQ
	MYzpwj5H/aFh+AAwDIUuD96VtrRmoqgLC2A+lCQhgrHqOhXGavulQtJX3OCxNlKdYVZBveJkijJ
	7GPtugJ0H1gDqwNo7cyqX7KAsvJuj+GmaMnURf5vBV5oBJwfS714WVOO7k856bTYt7IXZ6qr+Kp
	x1u5mjsOq7x2FC7OQv6ohm8bIF/uQCuO1StyVBWkC7w8aPgmnQviSDsCeE/H1aLQgXP+i+T/zzP
	Y6Gfm/+/TUsJgiFDU+b4+z/Nx8BwrBIU66fTdBMe3eHhR4h7tC42Etti11W+g4ZGZL8Q+KniJDG
	My8yr3cBSnWBy1YfAh1gmYfIkVt/9SLjc0c0iWGWq+Gl8FE4cIh6Ia6xKk0mm4RVpHry6MurtCH
	Pmr6AI30vM6ge+i90nOPoj3MIz9SnMi9bEg7fq+6a7R41kBWHdy3JSuk/tClIyzn8A==
X-Received: by 2002:a05:6102:4a53:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d276b006bamr162776137.9.1793780385709;
        Wed, 04 Nov 2026 00:19:45 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fe8f991sm1087280137.9.2026.11.04.00.19.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:19:41 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-99061e2171cso131252241.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:19:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxkNoN2wFgRT31JT3XFKyKjBqqHOOrUsl72aMxRtUWB5Nl9/EXSAnJRDXxaSFT5bpsjvssXxp/GeOYT@vger.kernel.org
X-Received: by 2002:a05:6102:f0b:b0:7a6:cd7e:72db with SMTP id
 ada2fe7eead31-7d072cbfbd3mr6080742137.26.1793780381117; Wed, 04 Nov 2026
 00:19:41 -0800 (PST)
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
 <CAMuHMdXcM9yvwLBSi-aYRinG3omhu5aoeNVYynfFQsnDDWR-Hw@mail.gmail.com> <b71ac175-fba5-4f61-bbdb-0b98dec9ccee@samsung.com>
In-Reply-To: <b71ac175-fba5-4f61-bbdb-0b98dec9ccee@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 09:19:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2ET0Y_=m3LHmL12VNhqK7tBKod0kph6GdZ7Q8XXhP8A@mail.gmail.com>
X-Gm-Features: AclHuK8Bo6Tf1rmFVBv8cZ2-rN7MQ3PgSfZx0PHZRwoGrMuxFYn-96u56ubwNso
Message-ID: <CAMuHMdV2ET0Y_=m3LHmL12VNhqK7tBKod0kph6GdZ7Q8XXhP8A@mail.gmail.com>
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

On Tue, 3 Nov 2026 at 20:25, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> On 03.11.2026 19:04, Geert Uytterhoeven wrote:
> > On Thu, 15 Oct 2026 at 10:29, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> Get rid of the static, limited-size reserved_mem array and replace it
> >> with array allocated by memblock_alloc_raw() and accessed directly or
> >> through a temporary early_memremap() mapping (depending on the
> >> architecture support). Such mapping is needed for some architectures
> >> (like ARM64), where linear map is not yet available during early boot
> >> scan. The array is allocated from the bottom of RAM to avoid placing it
> >> in highmem area, because some architectures (e.g. Xtensa, C-SKY, MIPS32)
> >> set the memblock limit to the end of lowmem only after the early scan.
> >> The early mapping is not used on PPC64, where the scan is done before
> >> early_ioremap_setup(), but the memory allocated by memblock is already
> >> accessible at that point.
> >>
> >> Having a single, writeable array with all reserved regions removes the
> >> need to perform two step initialization introduced by commit
> >> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
> >> regions are processed"), so all regions can be processed during the
> >> early scan again.
> >>
> >> The reserved_mem array is allocated only after all static (defined by
> >> the 'reg' property) regions are marked as reserved or no-map, so it
> >> cannot be placed in any of them. Errors of the early reservations are
> >> not recorded per region, only the fact that some of them failed is
> >> stored and a message asking to fix the device-tree is printed. The
> >> region specific init functions for the static regions are then called
> >> in a separate pass, once the array is available. Then all dynamically
> >> allocated reserved regions are processed.
> >>
> >> Suggested-by: Mike Rapoport <rppt@kernel.org>
> >> Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Thanks for your patch, which is now commit aa05faf815836c47 ("of:
> > reserved_mem: allocate and map the reserved_mem array early")
> > in dt-rh/for-next.
> >
> > This causes an early crash on BeagleV Starlight Beta:
> >
> >  [...]
> >  earlycon: uart0 MMIO32:0x0000000012440000 (options '115200n8')
> >  printk: legacy bootconsole [uart0] enabled
> >  printk: debug: skip boot console de-registration.
> >  efi: UEFI not found.
> > -OF: reserved mem: 0x00000000fb000000..0x00000000fcffffff (32768 KiB)
> > map non-reusable framebuffer@fb000000
> > -OF: reserved mem: 0x00000000f9000000..0x00000000f9ffffff (16384 KiB)
> > map non-reusable framebuffer@f9000000
> > -OF: reserved mem: 0x00000000d0000000..0x00000000f7ffffff (655360 KiB)
> > map non-reusable framebuffer@d0000000
> > -OF: reserved mem: 0x00000000c9000000..0x00000000ccffffff (65536 KiB)
> > map non-reusable framebuffer@c9000000
> > -OF: reserved mem: 0x00000000fa000000..0x00000000faffffff (16384 KiB)
> > nomap non-reusable dma-reserved@fa000000
> > -Reserved memory: created DMA memory pool at 0x000000107a000000, size 16384 KiB
> > -OF: reserved mem: initialized node linux,dma@107a000000, compatible
> > id shared-dma-pool
> > -OF: reserved mem: 0x000000107a000000..0x000000107affffff (16384 KiB)
> > nomap non-reusable linux,dma@107a000000
> > -SBI HSM extension detected
> > -[...]
> > +Oops - store (or AMO) access fault [#1]
> > +Modules linked in:
> > +CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted
> > 7.4.0-rc1-starlight-00002-gaa05faf81583 #411 PREEMPT
> > +Hardware name: BeagleV Starlight Beta (DT)
> > +epc : __memset+0x68/0xfe
> > + ra : fdt_scan_reserved_mem+0x3a4/0x80a
> > +epc : ffffffff8087fd88 ra : ffffffff80a313c8 sp : ffffffff81403c20
> > + gp : ffffffff814dc6c0 tp : ffffffff8140cf80 t0 : ffffffc4fea38ff0
> > + t1 : 0000000080200000 t2 : ffffffc4fec03008 s0 : ffffffff81403d10
> > + s1 : ffffffffffffffff a0 : ffffffc4fea39000 a1 : 0000000000000000
> > + a2 : 00000000000000f0 a3 : ffffffc4fea390f0 a4 : 0000000000000008
> > + a5 : ffffffff8087fd88 a6 : 00000000000000f0 a7 : 0000000000001000
> > + s2 : ffffffc4fec00000 s3 : 00000000000000f0 s4 : 0000000000000000
> > + s5 : 0000000000002de0 s6 : 0000000000000006 s7 : fffffffffefefefe
> > + s8 : ffffffc4fec02fd4 s9 : ffffffff8148e318 s10: fffffffffefefeff
> > + s11: ffffffc4fea39000 t3 : ffffffff8150df00 t4 : ffffffff8150df00
> > + t5 : ffffffff8150df00 t6 : ffffffff8150df78 ssp : 0000000000000000
> > +status: 0000000200000100 badaddr: ffffffc4fea39000 cause: 0000000000000007
> > +[<ffffffff8087fd88>] __memset+0x68/0xfe
> > +[<ffffffff80a2f63a>] early_init_fdt_scan_reserved_mem+0xa4/0x110
> > +[<ffffffff80a06c8e>] paging_init+0x17c/0x46a
> > +[<ffffffff80a046dc>] setup_arch+0xdc/0x584
> > +[<ffffffff80a009b8>] start_kernel+0x98/0x940
> > +Code: 0000 8793 00e7 8305 97ba 8782 b023 00b2 b423 00b2 (b823) 00b2
> > +---[ end trace 0000000000000000 ]---
> > +Kernel panic - not syncing: Fatal exception in interrupt
> > +---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
> >
> > Reverting the commit fixes the issue.
>
> Does moving early_init_fdt_scan_reserved_mem() to the end of setup_bootmem()
> in arch/riscv/mm/init.c change anything?

Unfortunately that doesn't make a difference.

> Could You provide a full boot log from the working kernel and /proc/iomem dump?

Sent by personal email.
The relevant part of /proc/iomem is:

    80000000-cfffffff : System RAM
      80200000-80201fff : Reserved
      80202000-81730bf7 : Kernel image
        80202000-80aa7e73 : Kernel code
        81000000-813fffff : Kernel rodata
        81600000-816dd9ff : Kernel data
        816de000-81730bf7 : Kernel bss
      81730bf8-817fffff : Reserved
      88000000-88007fff : Reserved
      9c000000-c7ffffff : Reserved
      c9000000-ccffffff : Reserved
    d0000000-f7ffffff : Reserved
    f8000000-f8ffffff : System RAM
    f9000000-fcffffff : Reserved
    fd000000-27fffffff : System RAM
      2772e1000-2773a0fff : Reserved
      2773a1000-277fa1fff : Reserved
      277fa2000-277fcbfff : Reserved
      277fce000-277fcefff : Reserved
      277fcf000-27ffcffff : Reserved
      27ffd0000-27fff6fff : Reserved
      27fff7000-27fffffff : Reserved

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
