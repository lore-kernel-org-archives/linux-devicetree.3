Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54715437FC
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703826; cv=none; b=ICzMDnP0cnraFd4t0AeRTQoT6Mq5k1vuL+dK1dn+bgG5PHeZgw+MKlhtZJ6FR+KHF39dlhkrias4BfAZOkPqksLeHzB/9UlBLNoFjGwCc6Bc8xIpaeoPx7sYR7e6Ie0awPcC2xiD6JLg9dVDfX8qLuk3bN8a+1gzM+iL5P1zghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703826; c=relaxed/simple;
	bh=To2pz33WHeqtYIBpo3tdxLVVXHw7FWx2+MU4WwcX1A0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndIY0oBPQb2LvqF4zN7W0O1Z766TxvNxaTlqZtTRNOHkubbpdVwT56ptQ5k6xnMGF+JmlirYVniiNnewkvVIjn2N9v9c4+LxNujmWOoxgMqDqPO+wIiatAVZe5Eo3Bsh740X65DnR2swk4bNpdP2DWqjHmzWI3Cf6VpbbV9/6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-988b74e3071so492351241.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703822; x=1791308622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K3FpjckKknSKtbxyzZ5D1wObsYxIm/YvEg91ak3C6aI=;
        b=lyDpGWgeh8wxw6sF9z+VZZXwvJ4WufG2HgXBXJ9TLSDxMtu9DBd1JtqHlXNeeP2MD/
         saNERGKy+eoYJL+NcE7Z5MKHYoJgPj4bSCRidT+WG3Wjs7qv2iYOBBBrgE/gzp8Omo4S
         /b/6EnvQ2yXQmEajZJAGQINfKeBzIo+SqwS81OM//ZdbGe6f23Gu0+DxWTZPCjGAYp9N
         tJ53qFS8IywRyQCHu4VIZmtoHriKbjxvzStvvQomfAuVwkwuEzbNIogcbVEqftjjK3bU
         41OhZIJvdr16YD9GBIEYnWUqL0KypxWgFgKm18Y/ujb06utHRTtLXfEubSe4WK/sK8NC
         83Jw==
X-Forwarded-Encrypted: i=1; AKwUvBy6aHfL1St8smJ6BuF9S6E5NyEd4b9nF4vl35gxFH2U5st+al8FflWTdUAAIhyArk9xa4D5bgCwBv6N@vger.kernel.org
X-Gm-Message-State: AFq9FYISEETVvMNsufziPTiiAD0UYLLOhbfMpkja1rE6vP13g/RD0KxU
	FDp2t8WhQ5vaLOGm4YJj+ZpZDkY8CsFS2baG0U/fslftl4wksLmCqWkNBmv5BEwD
X-Gm-Gg: AYBFou0OLKw5VRdBxP2QlKGjsj6tU+ubDpyGMEleeOVYS9iUynmai8+7qj2TAaKRyD1
	PawKY3NPKR4ONIZ6q3MJjpnHpye/Dao3IyLvN9K0I9X1H4L/hXEwvPZHQhqL90KQMvKF8fr8OkX
	uMSU4rgz8fHvCXY+jwCI+4RZWemKkhQ6Mw1Ec2aoF6gYMd7KL/dlaMpfeRxFMDwfD/W/PU+OHb7
	ecSLfWKth8kuUL1TSsmJUI+7Df9xVqT17iDQCqwzZ6vPl5FH4uX2m0J/TNgAr4JS4SEeXbtzC+8
	bzRrkmxL+8zzDS9K9F8yzXFftlepc7SopOMINu93S9EdypXCCAPDtOp0yvRTd5pGhqNUG6RbAhO
	eDSq3u1y69iRuEEi1VKiKzbtAtl9X0pmGr/KEAfPFlgKVHahy01QgcfTbjnQhnu1rkA6/zrd44D
	5temSJWWL5W/AXXQ7QFN0tS/0yw+sut/KftS6krRd1GO6/IyxF0fa4TMuh/3vPIj+DN/DWTGq/f
	70k7+iEcqIxycngZ0XOaDHP5cjEzqq6FXMa
X-Received: by 2002:a05:6102:370f:b0:7a1:f9df:e35a with SMTP id ada2fe7eead31-7bc48e06b3emr80632137.33.1790703822476;
        Tue, 29 Sep 2026 10:43:42 -0700 (PDT)
Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com. [74.125.227.39])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7bc7de014a3sm112101137.11.2026.09.29.10.43.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 10:43:41 -0700 (PDT)
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cca96ec1feso1287243e0c.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBtx6lp4SbXext+eH98b5uDwEq/QpW4qPfYOjQ31GJC0CA2QwS8ncnveyUWKkG6P4ibAZuacU8wZu6@vger.kernel.org
X-Received: by 2002:a05:6102:f91:b0:79a:21f6:20fc with SMTP id
 ada2fe7eead31-7bc3b59255fmr83403137.10.1790703820885; Tue, 29 Sep 2026
 10:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928165230.3397664-1-den@valinux.co.jp> <20260928165230.3397664-11-den@valinux.co.jp>
In-Reply-To: <20260928165230.3397664-11-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 19:43:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoKFCroL1d6-fLwYR0UkLBL7suKy=rOFavioLd7rC4OA@mail.gmail.com>
X-Gm-Features: AclHuK8JzfDwBbpW5Y3ODVdWtxAiX7XsdrE_LjubbR8Xd7qhHEJIEFJLyf_DRos
Message-ID: <CAMuHMdXoKFCroL1d6-fLwYR0UkLBL7suKy=rOFavioLd7rC4OA@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] PCI: rcar-gen4: Take over the iMSI-RX interrupt
To: Koichiro Den <den@valinux.co.jp>, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Serge Semin <fancer.lancer@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san, Marek,

On Mon, 28 Sept 2026 at 18:53, Koichiro Den <den@valinux.co.jp> wrote:
> On R-Car Gen4, intreq_pcim_sub ("msi") carries more than the integrated
> MSI receiver: the controller's reset requests and the Root Port's PME
> and bandwidth notifications are signalled on the same line, and the
> following patches need to handle them. With the DesignWare core owning
> the line through its chained handler, the driver would have to hook into
> that handler when iMSI-RX is used and request the line itself otherwise.
>
> Instead, request the interrupt in the driver in all configurations and
> set pp->msi_irq[0] to -ENODEV so the core does not install its chained
> handler, as spear13xx, keembay and dra7xx do. The handler demultiplexes
> the MSIs through dw_handle_msi_irq() when the APP block reports
> msi_ctrl_int. With an external MSI controller or pci=nomsi the iMSI-RX
> is not set up, so keep msi_ctrl_int masked rather than enabled, and the
> handler has nothing to do there yet. Request the interrupt before
> enumeration, as endpoint drivers may use MSIs from their probe, with
> IRQF_NO_THREAD so the MSIs are demultiplexed in hard IRQ context like
> the chained handler did. The interrupt is required by the binding.
>
> Release the interrupt in .deinit, before asserting the controller reset
> and disabling its clocks. Disable it around a Root Port reset because
> the handler accesses the MSI status registers through DBI.
>
> The DT routes downstream INTx to the same line, but the driver has never
> supported INTx (no INTx domain, INTx enables never set), so requesting
> the line exclusively takes nothing away.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Thanks for your patch!

FTR, this interacts badly with "[PATCH v2] PCI: rcar-gen4: Add missing
PM ops"[1] during resume from s2idle:

    Unbalanced enable for IRQ 57
    WARNING: kernel/irq/manage.c:775 at __enable_irq+0x38/0x64, CPU#3:
s2idle/686
    Modules linked in:
    CPU: 3 UID: 0 PID: 686 Comm: s2idle Not tainted
7.3.0-rc5-rcar3-09216-ga295839bfe55 #696 PREEMPT
    Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT)
    pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : __enable_irq+0x38/0x64
    lr : __enable_irq+0x38/0x64
    sp : ffffffc08904bab0
    x29: ffffffc08904bab0 x28: ffffff8446a4a880 x27: ffffffc084e64828
    x26: ffffffc084e64838 x25: ffffffc08069e630 x24: ffffff8443ad7cb0
    x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000070
    x20: 0000000000000039 x19: ffffff8443ad7c00 x18: 00000000e630bb27
    x17: 0000000000000000 x16: 0000000000000000 x15: 0720072007200720
    x14: 0720072007200720 x13: 0720072007200720 x12: 0000000000000566
    x11: 0000000000000000 x10: ffffffc08418a038 x9 : ffffffc08158a090
    x8 : ffffffc08904b798 x7 : ffffffc08904b7a0 x6 : 3ffffffffff7ffff
    x5 : fffffffffff7ffff x4 : 0000000000000000 x3 : 0000000000000000
    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff8446a4a880
    Call trace:
     __enable_irq+0x38/0x64 (P)
     resume_irqs+0xf0/0x130
     resume_device_irqs+0x10/0x18
     dpm_resume_noirq+0xe8/0x190
     suspend_devices_and_enter+0x524/0x594
     pm_suspend+0x22c/0x270
     state_store+0xa8/0xe8
     kobj_attr_store+0x14/0x24
     sysfs_kf_write+0x4c/0x64
     kernfs_fop_write_iter+0x13c/0x184
     vfs_write+0x148/0x1b4
     ksys_write+0x78/0xe0
     __arm64_sys_write+0x14/0x1c
     invoke_syscall+0xa0/0x100
     el0_svc_common.constprop.0+0xb0/0xcc
     do_el0_svc+0x18/0x20
     el0_svc+0x3c/0x114
     el0t_64_sync_handler+0x58/0x134
     el0t_64_sync+0x158/0x15c
    irq event stamp: 0
    hardirqs last  enabled at (0): [<0000000000000000>] 0x0
    hardirqs last disabled at (0): [<ffffffc080092a2c>]
copy_process+0x9e0/0x17b8
    softirqs last  enabled at (0): [<ffffffc080092a34>]
copy_process+0x9e8/0x17b8
    softirqs last disabled at (0): [<0000000000000000>] 0x0
    ---[ end trace 0000000000000000 ]---

[1] https://lore.kernel.org/20260907153711.653861-1-marek.vasut+renesas@mailbox.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
