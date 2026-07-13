Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852131E5714
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783916382; cv=none; b=BWWe3XbkL/Qw0GE69tGFmEZt+ztSZEJs9IQpWp9Z3vgLb4N40+Y8Elj6aXEq/mkYW5tJRf+AXM1Me9LNHizrpFHhBM/eu0sMfK8+hIFzb/atab36mY88VtfOMeHS0tZGqW2tQ628XtCqPXZkCPiyi63P5WGOOC/lWPEzhsU24GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783916382; c=relaxed/simple;
	bh=IxfDQyfKPrGzX5OCPSzHwmJBzwrnlzrD4tLJ1tiunh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZK8fbJagsZgldiVQ6BQvKk/BkLge2N+sEPRLNo/7NJhtmSjg7+CKCTEPqnnhGSLtpkedVTPkMJGFAMwGc2FI2A0s8bMrTBonAJ4L/qxUkyPhjX9CpJqEe0sOBF09Hob7dWKlYl1HTeIQ5Bp9lC8Eli5NcveHwLEvm7Y0Rjlpv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFVA6XR9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFVA6XR9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so108524a91.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 21:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783916379; x=1784521179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgv4FYkRaN7PLX5rljI9fT7G1HxI9jDppUCYHF4loYE=;
        b=AFVA6XR9hZWl2w03arw/Eq87PFxNmG4/2Fo6pjISQExx22ULnpTj5XXJjcoqxsllkf
         oOBxyWRzpnE+T7JjfIziJrdDfy5s0wXH3aAokI0O7ZrCetLglGwOchMT5K4EFn6Wq95t
         Ur/6MMsUSzNY7/+i4jnyr86fLrDz2WNTVxzM62qulzDw8p9XWeLY5Vh+5ux8Ew7iG/5s
         t9DlEhz3SXaZN1l8p+iu+ftG68U/HPlIfW/h0O2KMQVKVW4tvrsuQefKCeJ1O7SUb1MF
         Hzs0vGs/ew73vdL6wLs96+Tv9q7FzyYeE6NXIO9tuKZnu2dptnr46j1vva4Hz1ot7o3Y
         kWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783916379; x=1784521179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgv4FYkRaN7PLX5rljI9fT7G1HxI9jDppUCYHF4loYE=;
        b=BL1JgRILjpGNX/eljCc5RkQFuFavdGLnOsmIcCC4WpUVlwdf42VKPPSp/FX2C4glJg
         K31ZDqZ3zT2f0R8l+TFNQFNDi3xRBMG4LGet4bpOWqLyWgTESIWpfB24Q95BLSEYwm3D
         e/sgi3zkPFyT0qiSyon6dpERihm+qYS8I/OTxEm/YFyUBwCL1/2fjwkr3BDRDzWqjXV4
         0dy0IyHhaX437tbLPGLs0HDOYkfckleG5TGNPQECKg3QcBBczw0kelyQqbf8Vvv/F9xx
         3DMdMXV0VzGQZQ/i1VnhmFywMPyMinuGchnwcB1r2Zm2ZhuQRFoJlXZr3dMRb4l3skd1
         j8BA==
X-Forwarded-Encrypted: i=1; AHgh+RoiJuec6fBuLKvCP8Yv2mkgOkevVUvIxnkterf5ZDYbx0yw3mUcKR2lU58McsYePCVjexhoXqYQW3Ww@vger.kernel.org
X-Gm-Message-State: AOJu0YzPPJ9KVCqv6ubQ37EEBk2bYJmRx+rSXS8VCuXZG7zTxC0VJ2Ml
	Vky0MrzNYfBzueHPf7AnO/KozT2a7aK3rrJHBuK9vDHFI0X5iK40mK6o
X-Gm-Gg: AfdE7cmSJakYqEZo/5GNvs2eOKvGmUm80MHjGSUukGfyEL0uvKcdjKXn/d+5hGlrfCr
	uHd24xSny8TFyUZykKQbOZJiAuD9a7cYXL0FrsF7lwbMlUHnBieK9awoWOvTB+sTeDoOwDxJcJ+
	o+bwnbBa2RxXQFeF1xFEKF4ritAcn+VnWuEsRppKIZ3z+rGsaP3uV9c9H9tHixqcqvFjlP1BAvT
	ItGECDCccjleGYvvAtAOtwMyjwkncPdyh/vQoeeskuz2mmlaT1OOMTL69bH62EEnYOokY9O0m34
	UeRLMDA43Pu7wOTN5IWsCK73fTt/0PCpN2Zds6LG5+xGaakuP4kJcmNUinsxDGzeMkx1E2sAzAZ
	7DqgPKWpYZrjdItm0saQC2+b+WEMuzww+N3nV6/EQ7rl/LsCtrDVYAZZtZihbQeBf
X-Received: by 2002:a17:90b:560f:b0:389:8f6c:4d59 with SMTP id 98e67ed59e1d1-38dc7779d1bmr7680081a91.24.1783916378749;
        Sun, 12 Jul 2026 21:19:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11280409sm2565175a91.0.2026.07.12.21.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 21:19:38 -0700 (PDT)
Date: Mon, 13 Jul 2026 12:18:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Message-ID: <alRmA-X4xbQ9zPFn@inochi.infowork>
References: <20260709040415.977784-1-inochiama@gmail.com>
 <20260709040415.977784-3-inochiama@gmail.com>
 <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>

On Sun, Jul 12, 2026 at 11:13:07PM -0500, Anirudh Srinivasan wrote:
> Hi Inochi,
> 
> On Thu, Jul 09, 2026 at 12:04:14PM +0800, Inochi Amaoto wrote:
> > Add all PCIe device node for Spacemit K3.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
> >  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++++
> >  3 files changed, 266 insertions(+)
> > 
> 
> I see some warnings printed during probe
> 
> [   10.842955] r8169 0002:01:00.0: of_irq_parse_pci: failed with rc=-22
> 
> [   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22
> 

This is an expected error because the driver does not support INTx
but the hardware claims it supports. Since the vendor does not want
to support it, so there is no way for the upstreamer to add this.

> I see that all the 3 rc nodes are missing an interrupts node and an
> interrupt parent (saplic). The vendor DT seems to have this. Not sure if
> this is related.
> 
> The 10G ethernet probes fine, but the wifi card fails to probe. Seems
> like the card is trying to request 32 bit DMA addresses and we're
> failing cause we have 64 bit memory only.
> The vendor kernel seems to have a patch to enable 36 bit DMA in
> the rtw89 driver. That'll probably fix this.
> 

This warning is also found on my test, it is not related to
the PCIe driver, but a lack of the RTL phy driver. :(

You may also noticed a bad performance on this 10G ethernet,
it is caused by the single queue used by the RTL driver.
IIRC, even 9800 X3D can not achieve the max speed.

Regards,
Inochi

> [   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22
> [   10.987983] rtw89_8852be 0004:01:00.0: loaded firmware rtw89/rtw8852b_fw-2.bin
> [   10.988151] rtw89_8852be 0004:01:00.0: enabling device (0000 -> 0003)
> [   10.988215] (udev-worker): page allocation failure: order:2, mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> [   10.988243] CPU: 5 UID: 0 PID: 503 Comm: (udev-worker) Not tainted 7.2.0-rc1-00034-gc57907b4459d #1 PREEMPT(lazy)
> [   10.988249] Hardware name: SpacemiT K3 Pico-ITX (DT)
> [   10.988252] Call Trace:
> [   10.988255] [<ffffffff8001f2b8>] dump_backtrace+0x28/0x48
> [   10.988265] [<ffffffff80002612>] show_stack+0x3a/0x58
> [   10.988269] [<ffffffff80016432>] dump_stack_lvl+0x5a/0x88
> [   10.988274] [<ffffffff80016478>] dump_stack+0x18/0x22
> [   10.988277] [<ffffffff803984da>] warn_alloc+0x102/0x120
> [   10.988283] [<ffffffff80398b7a>] __alloc_frozen_pages_noprof+0x682/0x1470 
> [   10.988288] [<ffffffff80399980>] __alloc_pages_noprof+0x18/0x38
> [   10.988292] [<ffffffff80113494>] __dma_direct_alloc_pages.isra.0+0x26c/0x428
> [   10.988298] [<ffffffff801137a8>] dma_direct_alloc+0x78/0x3d0
> [   10.988301] [<ffffffff8011282c>] dma_alloc_attrs+0x74/0x240
> [   10.988309] [<ffffffff031a6bb6>] rtw89_pci_probe+0x20e/0xc90 [rtw89_pci]
> [   10.988375] [<ffffffff8087cd1c>] local_pci_probe+0x3c/0x90
> [   10.988381] [<ffffffff8087def6>] pci_device_probe+0xde/0x298
> [   10.988385] [<ffffffff80a80f3e>] really_probe+0x9e/0x3e0
> [   10.988390] [<ffffffff80a81308>] __driver_probe_device+0x88/0x190
> [   10.988393] [<ffffffff80a814f8>] driver_probe_device+0x38/0xc0
> [   10.988396] [<ffffffff80a81796>] __driver_attach+0xbe/0x208
> [   10.988399] [<ffffffff80a7e22c>] bus_for_each_dev+0x6c/0xd0
> [   10.988404] [<ffffffff80a806ce>] driver_attach+0x26/0x40
> [   10.988407] [<ffffffff80a7fcac>] bus_add_driver+0x15c/0x298
> [   10.988410] [<ffffffff80a82a82>] driver_register+0x52/0x118
> [   10.988413] [<ffffffff8087c44c>] __pci_register_driver+0x4c/0x70
> [   10.988417] [<ffffffff02fbc038>] rtw89_8852be_driver_init+0x30/0xff8 [rtw89_8852be]
> [   10.988422] [<ffffffff80017b2a>] do_one_initcall+0x5a/0x2d0
> [   10.988427] [<ffffffff8011d7b6>] do_init_module+0x96/0x2c0
> [   10.988430] [<ffffffff8011f6c6>] load_module+0x19a6/0x2078
> [   10.988434] [<ffffffff80120046>] init_module_from_file+0xce/0x138
> [   10.988437] [<ffffffff801202d0>] __riscv_sys_finit_module+0x220/0x398
> [   10.988441] [<ffffffff81010c40>] do_trap_ecall_u+0x108/0x588
> [   10.988446] [<ffffffff81022a14>] handle_exception+0x16c/0x178
> [   10.988455] Mem-Info:
> [   10.988483] active_anon:5773 inactive_anon:0 isolated_anon:0
>                 active_file:0 inactive_file:30149 isolated_file:0
>                 unevictable:0 dirty:222 writeback:0
>                 slab_reclaimable:3461 slab_unreclaimable:8595
>                 mapped:5588 shmem:115 pagetables:949
>                 sec_pagetables:0 bounce:0
>                 kernel_misc_reclaimable:0
>                 free:4028911 free_pcp:0 free_cma:0
> [   10.988493] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
> [   10.988497] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=64kB
> [   10.988501] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB 
> [   10.988505] 30300 total pagecache pages
> [   10.988508] 0 pages in swap cache
> [   10.988511] Free swap  = 0kB
> [   10.988514] Total swap = 0kB
> [   10.988516] 4186368 pages RAM
> [   10.988519] 0 pages HighMem/MovableOnly
> [   10.988522] 86381 pages reserved
> [   10.988525] 0 pages cma reserved
> [   10.988528] Memory cgroup min protection 0kB -- low protection 0kB
> [   10.988532] rtw89_8852be 0004:01:00.0: failed to alloc dma tx rings
> [   10.994421] rtw89_8852be 0004:01:00.0: failed to alloc pci trx rings
> [   11.000734] rtw89_8852be 0004:01:00.0: failed to setup pci resource
> [   11.007088] rtw89_8852be 0004:01:00.0: probe with driver rtw89_8852be failed with error -12
> 
> Regards
> Anirudh Srinivasan
