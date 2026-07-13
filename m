Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3305837189B
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783916006; cv=none; b=uT0U3Sgq65f9Zu91X1gooHkmTrgpfF/mN2Po7orvgygA68X0tQiADMW0YYhHPtvdz/PzQ0EykVVqM/lfTtDUGrgG0beu3ekSB8cXii7TAyvkOzYvgK6WL20cEBQMHOvcLXmAWsGFg7in5uR2cMNxoBq2k1ZFdNFTsmB04ier3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783916006; c=relaxed/simple;
	bh=GtTsqdOr9To/h4CW/axkLr1IKVyCx3N4YBHPsedP1Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9WpV7bRqKZL1h3kHqpwZw18P0fKVv2Y6D4ZWvXLERgqea5I1YKm3swr4EemKGuz++dPEDN/oacv+jWLS0y9BcLWA3H4J3Mn2Y26rLz4Tzgb4nS0u1hAe7y4/PwdzGyf/i18A5hYVf7WHwQUdT4VQWJxA55w5limj8V8g6ADsKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=hOCGJQn0; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="hOCGJQn0"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81e97f3b3efso7568547b3.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 21:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783916001; x=1784520801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=439ZOYrlaCUAeJZ+aD63soMn8aH9d6icmDr23SwquhM=;
        b=hOCGJQn06N5kyeawvrenJIBaNjfhvq8/Jt47wQ6qTXza1h4UpbJwyR5AxNaOOYSJUh
         AiRAA0zsj2MJ/Vj5M6ZzXAC+pioCK/9bRgp5Xd/mV4gDnol/Bydl+EKnQv9UkJtTO3nm
         E4VKisYcqxrT0Q2hbWV+niCMlo0+Lk11k7TQXUC5wMDJKiA0FuG1KueqfeHZll8EYGPY
         VO3HkhK2x9Sw3FFR66EuJU3FQbLuNrkxtHuHkrKLXU9ewL7S1Kl6WILukCiyU5dWQhl8
         iT1UouqfbZNgIZFVmhGl2qqDI16yDMD3oDboojmrZ57ld/L8m8QNZNmK1XJixSR/IOlk
         RBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783916001; x=1784520801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=439ZOYrlaCUAeJZ+aD63soMn8aH9d6icmDr23SwquhM=;
        b=et1RuzcSwwkZ4v3xRO3XY0293auNbnXFnqDvtLAfoBzBfZl8euuZFvPqk4k8Opicb0
         r+lRC3R66p8itn8n7WCIlsOWoNEEGXoAHYcuJyjYcElPn4RG8i2PcsNKskLXuhKrcW5i
         6gjYyWm5RbnWA6egWE6VIGvXBJSjt5ElX6qWPig6GW8tVmH7XJSI69qliRgiMuoIUnbH
         3GX3yamZC2IvItyaMLLkK7nu2z+9zNX0cz/zijBK/hrnJjnZEBJL8NUsdbSuTngGGWmN
         kj1QOkOdY34RJldIFekIvLl+P4wY6spGhXv+eMhYqtQO+UHV7gI2HwHUDAAG7Hxr8BcR
         LLWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqI+J1EvcSnPUzjgs3LMJa11Y7wwjcJk47ekLaUPHTzNV++k4nPpINCEeo8xglkQXAv2U70cEV4jZz@vger.kernel.org
X-Gm-Message-State: AOJu0YwPcJEyxd/WMJmdeOKJjygWYq+zUFdYyKjsNlo1yLznP5iF6jAd
	07HCmKOx06eEUvF+8YsLkgtnq/h7Ou0sI8IKUScdwfmZrNqXGXm7CNFxviMTTQWiSX0=
X-Gm-Gg: AfdE7ck9vRw4JNgQftEnOnin3Wxe3W4SDwjcucZV8lA1e0wXD7R6vvH8hY+fZ2ccYvM
	/nwHHBRn+xzVJx+nXcdALvUnlZ7hRlY4oJ5PbnAwzYvG6UyO7JP1WCQZGi1++pXUE0hAeQSSUjw
	EpghFNRPxmbNoX5UcS3pir1gooq4nX2mHMA04gsQCAAq0k4PnC7tuNrm9se+dp/WidDZWJRcrgb
	xv70x2BasCQfXRK3hGfutSTp1IwuccHF7+g2USv00sMkuX641721WmSnTr5NigSiGPMpSS1SPQ+
	yBypBEZF2eucQMap9QK794TWSB1og8MaRLELKOeByZkJ048uxWyQujPyWUUsW+fenbHvDtx4whH
	G80oafY4Dy4uQ0YZjU2GiJh+AnJi8BZB4lKj+avUbgFt/nFKZRzGYErYgwxgP/XqYGXTDH6AYd9
	N4eNAhgD5h1PPPiKvug5Ohk4y9sZMeoF1jsJF4R+QNh3UIw6zsB2GVSwsLLQ==
X-Received: by 2002:a05:690c:b03:b0:80c:f6bb:5666 with SMTP id 00721157ae682-81e901491a3mr57346417b3.47.1783916001448;
        Sun, 12 Jul 2026 21:13:21 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:55c1:a162:6cca:b98a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be99124sm106251787b3.4.2026.07.12.21.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 21:13:21 -0700 (PDT)
Date: Sun, 12 Jul 2026 23:13:07 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Message-ID: <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>
References: <20260709040415.977784-1-inochiama@gmail.com>
 <20260709040415.977784-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709040415.977784-3-inochiama@gmail.com>

Hi Inochi,

On Thu, Jul 09, 2026 at 12:04:14PM +0800, Inochi Amaoto wrote:
> Add all PCIe device node for Spacemit K3.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++++
>  3 files changed, 266 insertions(+)
> 

I see some warnings printed during probe

[   10.842955] r8169 0002:01:00.0: of_irq_parse_pci: failed with rc=-22

[   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22

I see that all the 3 rc nodes are missing an interrupts node and an
interrupt parent (saplic). The vendor DT seems to have this. Not sure if
this is related.

The 10G ethernet probes fine, but the wifi card fails to probe. Seems
like the card is trying to request 32 bit DMA addresses and we're
failing cause we have 64 bit memory only.
The vendor kernel seems to have a patch to enable 36 bit DMA in
the rtw89 driver. That'll probably fix this.

[   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22
[   10.987983] rtw89_8852be 0004:01:00.0: loaded firmware rtw89/rtw8852b_fw-2.bin
[   10.988151] rtw89_8852be 0004:01:00.0: enabling device (0000 -> 0003)
[   10.988215] (udev-worker): page allocation failure: order:2, mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
[   10.988243] CPU: 5 UID: 0 PID: 503 Comm: (udev-worker) Not tainted 7.2.0-rc1-00034-gc57907b4459d #1 PREEMPT(lazy)
[   10.988249] Hardware name: SpacemiT K3 Pico-ITX (DT)
[   10.988252] Call Trace:
[   10.988255] [<ffffffff8001f2b8>] dump_backtrace+0x28/0x48
[   10.988265] [<ffffffff80002612>] show_stack+0x3a/0x58
[   10.988269] [<ffffffff80016432>] dump_stack_lvl+0x5a/0x88
[   10.988274] [<ffffffff80016478>] dump_stack+0x18/0x22
[   10.988277] [<ffffffff803984da>] warn_alloc+0x102/0x120
[   10.988283] [<ffffffff80398b7a>] __alloc_frozen_pages_noprof+0x682/0x1470 
[   10.988288] [<ffffffff80399980>] __alloc_pages_noprof+0x18/0x38
[   10.988292] [<ffffffff80113494>] __dma_direct_alloc_pages.isra.0+0x26c/0x428
[   10.988298] [<ffffffff801137a8>] dma_direct_alloc+0x78/0x3d0
[   10.988301] [<ffffffff8011282c>] dma_alloc_attrs+0x74/0x240
[   10.988309] [<ffffffff031a6bb6>] rtw89_pci_probe+0x20e/0xc90 [rtw89_pci]
[   10.988375] [<ffffffff8087cd1c>] local_pci_probe+0x3c/0x90
[   10.988381] [<ffffffff8087def6>] pci_device_probe+0xde/0x298
[   10.988385] [<ffffffff80a80f3e>] really_probe+0x9e/0x3e0
[   10.988390] [<ffffffff80a81308>] __driver_probe_device+0x88/0x190
[   10.988393] [<ffffffff80a814f8>] driver_probe_device+0x38/0xc0
[   10.988396] [<ffffffff80a81796>] __driver_attach+0xbe/0x208
[   10.988399] [<ffffffff80a7e22c>] bus_for_each_dev+0x6c/0xd0
[   10.988404] [<ffffffff80a806ce>] driver_attach+0x26/0x40
[   10.988407] [<ffffffff80a7fcac>] bus_add_driver+0x15c/0x298
[   10.988410] [<ffffffff80a82a82>] driver_register+0x52/0x118
[   10.988413] [<ffffffff8087c44c>] __pci_register_driver+0x4c/0x70
[   10.988417] [<ffffffff02fbc038>] rtw89_8852be_driver_init+0x30/0xff8 [rtw89_8852be]
[   10.988422] [<ffffffff80017b2a>] do_one_initcall+0x5a/0x2d0
[   10.988427] [<ffffffff8011d7b6>] do_init_module+0x96/0x2c0
[   10.988430] [<ffffffff8011f6c6>] load_module+0x19a6/0x2078
[   10.988434] [<ffffffff80120046>] init_module_from_file+0xce/0x138
[   10.988437] [<ffffffff801202d0>] __riscv_sys_finit_module+0x220/0x398
[   10.988441] [<ffffffff81010c40>] do_trap_ecall_u+0x108/0x588
[   10.988446] [<ffffffff81022a14>] handle_exception+0x16c/0x178
[   10.988455] Mem-Info:
[   10.988483] active_anon:5773 inactive_anon:0 isolated_anon:0
                active_file:0 inactive_file:30149 isolated_file:0
                unevictable:0 dirty:222 writeback:0
                slab_reclaimable:3461 slab_unreclaimable:8595
                mapped:5588 shmem:115 pagetables:949
                sec_pagetables:0 bounce:0
                kernel_misc_reclaimable:0
                free:4028911 free_pcp:0 free_cma:0
[   10.988493] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
[   10.988497] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=64kB
[   10.988501] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB 
[   10.988505] 30300 total pagecache pages
[   10.988508] 0 pages in swap cache
[   10.988511] Free swap  = 0kB
[   10.988514] Total swap = 0kB
[   10.988516] 4186368 pages RAM
[   10.988519] 0 pages HighMem/MovableOnly
[   10.988522] 86381 pages reserved
[   10.988525] 0 pages cma reserved
[   10.988528] Memory cgroup min protection 0kB -- low protection 0kB
[   10.988532] rtw89_8852be 0004:01:00.0: failed to alloc dma tx rings
[   10.994421] rtw89_8852be 0004:01:00.0: failed to alloc pci trx rings
[   11.000734] rtw89_8852be 0004:01:00.0: failed to setup pci resource
[   11.007088] rtw89_8852be 0004:01:00.0: probe with driver rtw89_8852be failed with error -12

Regards
Anirudh Srinivasan
