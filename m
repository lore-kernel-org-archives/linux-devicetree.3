Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE5637CD3D
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 21:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776461795; cv=none; b=F1F6a+TSVhqKBHPYx+KpiaMFeY5PhJX0EdFIug71TMSDeBsM/dY5V6lBv0ysS6x2QCkSemmTjDGjdvqfrJGxp2WEtS8smiQFEzEuJ35g20RQnL9L/CkQd3oa5AGUNdlme9zqPGImmM7LOP/s5ea6Rqz91OZvz3MO6xhs58lKxF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776461795; c=relaxed/simple;
	bh=45mII1+xcjg6myIsPEEJz+gygn1qFcoTPSB9uHRcm84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/NeyrO6ziO5X/i6CzA+wzPyIbw1Yxqh6NI93DPPRhU0Hs2/oDPwvFMZkqOfeSfywiFhbxmnfCM86FflQpD+Gu5p7tM/JLMIhPe5KGduRdwVTYCkw0PLC/wH8Xde8bYxuNxuySXWGPYCn+6HUr99cGusWPCbCMJeKdXRrsx08H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BwxAj1iG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ETWdsg/H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BwxAj1iG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ETWdsg/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776461792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfbRBXQJE7XBqTPyM/9pBB24pVjmhOJfH/25m2T2XAw=;
	b=BwxAj1iGug6LYyjDz30pn67TiMxIAzHyeqGZQlk14l+seYcGKcb4a3aJgXgHzeZZW/nv26
	XZMrTdsrwXTBnHBlKEf1ghmxSmOScUhH8YjsSWUk02InhpQNZLYxZcQhAaKBRGRV/O9aeW
	6OPTiGD5sEDO/PnB2DK4sTyiA3l3tM4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-o7IFgb7cNMWcOZlUvaxjmg-1; Fri, 17 Apr 2026 17:36:30 -0400
X-MC-Unique: o7IFgb7cNMWcOZlUvaxjmg-1
X-Mimecast-MFC-AGG-ID: o7IFgb7cNMWcOZlUvaxjmg_1776461790
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so24504581cf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776461789; x=1777066589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfbRBXQJE7XBqTPyM/9pBB24pVjmhOJfH/25m2T2XAw=;
        b=ETWdsg/HPQIINF/olpAan/KCvAlxykoJgg+TiQalSBDbWx4R0X7cEwXZUnrWdUX5n/
         p1+N+tK0rP0/G2QhAU+tw7JhyV+rIe/c3FzHz9IanPta5VtnJXRXY8NGqmzGhM/ki9Mz
         9OYYk3BhqrNKklkj3lWBLncqAMooLp7IjOoKc1GbjT/+qS+7i9k6SZcxW8keUZQaVQ+E
         VVRwCrVW6FuYA9Zw/ach94DnyvFdz9LihSu1e7ZTdC0RqR9xvVkpKoFsEtPXaLY2ZSc0
         Nv61SsUt6GCdZvtZvxCjkMExdxtN+xZ9sr2QnkMV1pl9cIvMY5AGCI9vbsZc23DfPbUj
         rv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776461789; x=1777066589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfbRBXQJE7XBqTPyM/9pBB24pVjmhOJfH/25m2T2XAw=;
        b=aohfK9T6ynS8+d+d6ky9DNeHcd8ecOkrn0MScDZMJlf/Yatl6TP9xLSGgdBBLEPIi1
         xzjlaVeb87TjMFIYyxoJQKr4qAzSYTlhwiq4q+A20DVgO23GmpiAWqy5JEGaUd3MCOyY
         wNKWri3u4miNjWdI0RYDTUX4lC1WJ+7RWKLLiNIo+w6O723qmTGLyMHGnJQv9+VYVgTg
         qpzSvNnI+0WD+LxpCuRDGe4FJcW7o/F8Fo4fkVvQnsPixnxJOC+anZd8Ux983Vqg3Cq0
         ZJiKGeXnQ0MbFz1VbeEiuIzDhy5IypZHnkqEPCbHY9TRvoMywl3ps9QYa98DbD3NRCki
         Qpag==
X-Forwarded-Encrypted: i=1; AFNElJ87Ngi9GCcimGiRHubbNJDl6cbt82nOWK33V9eRCNr3NMClKkDNT9d4TpEsKkRteErvw4m+qG9vdEpG@vger.kernel.org
X-Gm-Message-State: AOJu0YxP79AntwJMSCNoFS6DsaxZjCvAK2iCmD3xqI8cscfyKEKNslDh
	AhsVACpke7LOVmi/fdfXAsLwShZKUKSAySUNVmWI+mSMLC6qunYn+s5GvTEeQgGGZLIaj+S+SAA
	Vj4WlUQQrbHZcZyKOsouM5IXUQcdrK1T/MsMPm9EyXhDlFdQVli7QIAu5b3+7M1c=
X-Gm-Gg: AeBDietyD414SYaO3jr5PTod5t5GAc7zlBqY5Y2mfRqIL7fkLgZu3NWslMufQvQYBAP
	qq6va+GcqUjT4++CsXffv73Op7aEB1/xpVwofONME+8/DVlEfwMH0Wk+sAu7ZVCYewUpSvfhJcE
	1sal89etxiveeaVrd4SYcgaN/Jnd1ftJYwHwKhOy9f9m6YrD6RPoxYt4Fi1iY5nDUhC4mR6ykwS
	HJkL6kjl2r7ixNZB1PWqGQivuIoxyVGPpe4sjUF/kzTxugtRKlIXNUuE65Gyfli2+sghpo0IHzs
	cLH8q5O32sKlk0wWRFFA2+JROv/I9FnJ7ZMUu44+4TQFMEWSTMgSTmGjvxZBYpjsbdFqptDhl/q
	VDuR5hFgCKdrAjp9GwOZE+0dZ3cz7/Gi5inevPg/uV1y6XywZsZmqLeAjyCayy6Em
X-Received: by 2002:a05:622a:1650:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50e36effb95mr67588601cf.56.1776461789570;
        Fri, 17 Apr 2026 14:36:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50e36effb95mr67588171cf.56.1776461789124;
        Fri, 17 Apr 2026 14:36:29 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e393ff941sm20825251cf.19.2026.04.17.14.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 14:36:28 -0700 (PDT)
Date: Fri, 17 Apr 2026 14:36:25 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 3/3] dts: s32g: Add GPR syscon region
Message-ID: <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>

Hi Dan,

On Fri, Jan 30, 2026 at 04:19:52PM +0300, Dan Carpenter wrote:
> Add the GPR syscon region for the s32 chipset.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>
> [snip]
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index e314f3c7d61d..be03db737384 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
>  			};
>  		};
>  
> +		gpr: syscon@4007c000 {
> +			compatible = "nxp,s32g3-gpr", "syscon";
> +			reg = <0x4007c000 0x3000>;
> +		};
> +
>  		ocotp: nvmem@400a4000 {
>  			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
>  			reg = <0x400a4000 0x400>;
> @@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
>  			compatible = "nxp,s32g2-dwmac";
>  			reg = <0x4033c000 0x2000>, /* gmac IP */
>  			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> +			nxp,phy-sel = <&gpr 0x4>;
>  			interrupt-parent = <&gic>;
>  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";

I gave this a test on an S32G-VNP-RDB3 and didn't see any issues on the
dwmac-s32 side, but this appears to trigger a panic when reading the new
debugfs regmap/*/registers file for the syscon node:

    # grep 4007c000 /proc/vmallocinfo
    0xffff800083da8000-0xffff800083dac000   16384 ioremap_prot+0x74/0xe0 phys=0x000000004007c000 ioremap
    # cat /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers
    Internal error: synchronous external abort: 0000000096000210 [#1]  SMP
    [...]
    CPU: 0 UID: 0 PID: 4344 Comm: cat Tainted: G   M        E  X   ------  ---  6.12.0+ #226 PREEMPT_RT
    Tainted: [M]=MACHINE_CHECK, [E]=UNSIGNED_MODULE, [X]=AUX
    [...]
    pc : regmap_mmio_read32le+0x44/0xa0
    lr : regmap_mmio_read32le+0x44/0xa0
    [...]
    x23: ffff00080c080000 x22: ffff000802ac4c00 x21: ffff800087b13c9c
    x20: ffff800080a46494 x19: ffff800083da810c x18: 0000000000000004
    [...]
    x5 : ffff800080a46448 x4 : ffff800083da8000 x3 : ffff800080a46494
    x2 : ffff800080a47230 x1 : ffff800083da810c x0 : 0000000000000020
    Call trace:
     regmap_mmio_read32le+0x44/0xa0 (P)
     regmap_mmio_read+0x4c/0x80
     [...]
    Code: 52800400 8b214093 aa1303e1 97f4caf0 (b9400275)
    ---[ end trace 0000000000000000 ]---
    Kernel panic - not syncing: synchronous external abort: Fatal exception

Running this through decodecode gives:

    All code
    ========
       0:   52800400        mov     w0, #0x20                       // #32
       4:   8b214093        add     x19, x4, w1, uxtw
       8:   aa1303e1        mov     x1, x19
       c:   97f4caf0        bl      0xffffffffffd32bcc
      10:*  b9400275        ldr     w21, [x19]              <-- trapping instruction

    Code starting with the faulting instruction
    ===========================================
       0:   b9400275        ldr     w21, [x19]

x19's offset from the base address in /proc/vmallocinfo is 0x10c, which
points to a bad read at physical address 0x4007c10c; I also confirmed
that the preceding memory reads back without issues:

    # head -c 990 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
    0104: 00000000
    # head -c 1005 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
    0108: 00000000
    # head -c 1020 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
    <panic>

Best,
Jared

