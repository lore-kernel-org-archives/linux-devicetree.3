Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47453372EF5
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776703561; cv=none; b=VTM4rtIqJwd5npLIZ+fxzBgZnP/4cXBUHJU98gPB+il6Makz1+m0R0YbPdYEWjT5DhePahewmRCtF89UdZmSjqEKMPEpSlRTCZ2hL98PrvKuM58cq0W0Z1iNw0CxbL1bCVkKmxVv/j6hi+69Z03LtNY9LGS3AjocNZC2iMzj6jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776703561; c=relaxed/simple;
	bh=8FNY7MbtkgjbsRoI1I6nx/707r+HF/T/RNrqqCg5fjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REMzBCsNyTvY88VB09z4sL+I5wk0UU5tFDfEqapZPL80KMIerDAc6s02YZlASHnLpH5PzAjR6QY35NJ2cjOuBRKdrzJZ+Ks0VnYLcviycGCN0fw5Z9GStgt6K9Oqrgv+cRMyfbHtbh8A63m7DY/+53h0vA5gj/h1bHOtq+cgcuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=na9xfB9j; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="na9xfB9j"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfbd17589so2518915f8f.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776703559; x=1777308359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5E+UKYZ+gXk3KKDw9hC2HFOEQBrHQpFIVrnj4wNYvlY=;
        b=na9xfB9jpuFmJCc52HHYeE622o7SbJJRZ28mr/+yN1E3II021zrVR7B8EIIRf98THp
         dtnJRY6CB4tHq5uVirkx2KSPii/nD1tCAi2KpyHCOfa/46xPwMT2UQo+c1F1JGVRVaBx
         VAUFIeHFEOsOGkZ2B/8rtqByBqX4LCu3cWdyrSfFaYd2ouAgyy2Ho21ulFUy3/cnsa1r
         dWJXBh9V8IXRNxXppP06aDB7rBhVxSuAezrbY2CcWSqVWbmLOHERo9cpvPnNnfCabiS8
         GninTvkORT/UGZEMwE1BYzGEJEg1kmp3Q86ugdQ0L4xBEKK5bW2z/wyBmnz5tDMyuHvP
         7QCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776703559; x=1777308359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5E+UKYZ+gXk3KKDw9hC2HFOEQBrHQpFIVrnj4wNYvlY=;
        b=MI40XSaiQCXFq5ECdiCeiqgctnV+F9j67WdA67lcyRtqPRZfv1dLPh5oP3G0pNVgAg
         XXRV9ZJKkVgv/NlV3Z7fGO+Ch6kA67DSajP+VN0fCw6ob5R7M32X4jHFWp3yemfRS7RM
         Rqz6wshK63TeumTLBDl7sNKAOvP1KAkef99rPZprpIbzRD2CgFJFViHNOTYu4/jRh5aT
         922Z+bT9wjd+RVVdgKwZfEkHmLSHYd1MasYgojxvMxhR2NVR01gDPueuBx+i3Sda5dNp
         HTa4wLlVHjvs16M5cp6FedpuxrM1o2cTlIMUkP9WLkAn0mIelCU6PYCIH3mT0+2NCxu2
         FSGw==
X-Forwarded-Encrypted: i=1; AFNElJ+A9SUKsGjM3DKoQQx8xTW85915LgD8ipl1B853usAtBR0QUcjLbzTy5CJSn7v+x5xyk22IXTMCBKtB@vger.kernel.org
X-Gm-Message-State: AOJu0YzsSSayyX4pSrZCkIafFlLilN+71H5q96bQMQOiutIZEZaLGBA4
	xogheKWKXmYPoYr6fLHMsuv08mw1KBOxsINBqTrAXetHnBy8Tg71FaKN
X-Gm-Gg: AeBDievfwDiBT7NkCB4aWwnkEUj9sitrRdOZY4UumFkzHN59YTgCxgc5T64svkuSqdP
	9E+/7TZl/qiYQA414eAIHK3L9uAlbTHHysLyWYwxquKNPU999TGmTCrE9b6OJ9l2gP8ME2vYJSA
	QZfzOB0TCxylUsAh98hrQyDfhl0lv44qGBxXDyfCvFZ3TYoj2nJe3y5Lre1akBalN5ekgmrFuE8
	HGYf02tVeNQcuAGoE6sjaNRqVE2T+Bk1BIrX3QGSdkW83rDSf4GfDSy3wkb8Or0k/T6CvJzzd13
	FNM8fM0V2WhwNU3V6qxVOdEvxwkIi4FNO37wd3HG3R+ZL9wDZY0aPDynQJWzRdfJP2kMG6upGBo
	F6WKOlVFOu9feIWJ94VJz0aklunWK8UbICZgR5KGMQz1LjK/e8AIZwb71bDL/uHT33DBJGgtW2F
	dNP5WIQ7YuGzE2UXsO5a4JZJJE5KE/LMa0UMRoG+aD
X-Received: by 2002:a5d:588f:0:b0:43d:2be:e54 with SMTP id ffacd0b85a97d-43fe3dfd4aemr21673354f8f.39.1776703558306;
        Mon, 20 Apr 2026 09:45:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a79esm32560450f8f.17.2026.04.20.09.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:45:57 -0700 (PDT)
Date: Mon, 20 Apr 2026 19:45:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jared Kangas <jkangas@redhat.com>
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
Message-ID: <aeZYQp9b5aoV7Ihv@stanley.mountain>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
 <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
 <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>

On Mon, Apr 20, 2026 at 09:04:00AM -0700, Jared Kangas wrote:
> Fixing Dan's address based on mailmap update, sorry for the noise.
> 
> On Fri, Apr 17, 2026 at 02:36:25PM -0700, Jared Kangas wrote:
> > Hi Dan,
> > 
> > On Fri, Jan 30, 2026 at 04:19:52PM +0300, Dan Carpenter wrote:
> > > Add the GPR syscon region for the s32 chipset.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >
> > > [snip]
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > > index e314f3c7d61d..be03db737384 100644
> > > --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > > @@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
> > >  			};
> > >  		};
> > >  
> > > +		gpr: syscon@4007c000 {
> > > +			compatible = "nxp,s32g3-gpr", "syscon";
> > > +			reg = <0x4007c000 0x3000>;
> > > +		};
> > > +
> > >  		ocotp: nvmem@400a4000 {
> > >  			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
> > >  			reg = <0x400a4000 0x400>;
> > > @@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
> > >  			compatible = "nxp,s32g2-dwmac";
> > >  			reg = <0x4033c000 0x2000>, /* gmac IP */
> > >  			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > > +			nxp,phy-sel = <&gpr 0x4>;
> > >  			interrupt-parent = <&gic>;
> > >  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > >  			interrupt-names = "macirq";
> > 
> > I gave this a test on an S32G-VNP-RDB3 and didn't see any issues on the
> > dwmac-s32 side, but this appears to trigger a panic when reading the new
> > debugfs regmap/*/registers file for the syscon node:
> > 
> >     # grep 4007c000 /proc/vmallocinfo
> >     0xffff800083da8000-0xffff800083dac000   16384 ioremap_prot+0x74/0xe0 phys=0x000000004007c000 ioremap
> >     # cat /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers
> >     Internal error: synchronous external abort: 0000000096000210 [#1]  SMP
> >     [...]
> >     CPU: 0 UID: 0 PID: 4344 Comm: cat Tainted: G   M        E  X   ------  ---  6.12.0+ #226 PREEMPT_RT
> >     Tainted: [M]=MACHINE_CHECK, [E]=UNSIGNED_MODULE, [X]=AUX
> >     [...]
> >     pc : regmap_mmio_read32le+0x44/0xa0
> >     lr : regmap_mmio_read32le+0x44/0xa0
> >     [...]
> >     x23: ffff00080c080000 x22: ffff000802ac4c00 x21: ffff800087b13c9c
> >     x20: ffff800080a46494 x19: ffff800083da810c x18: 0000000000000004
> >     [...]
> >     x5 : ffff800080a46448 x4 : ffff800083da8000 x3 : ffff800080a46494
> >     x2 : ffff800080a47230 x1 : ffff800083da810c x0 : 0000000000000020
> >     Call trace:
> >      regmap_mmio_read32le+0x44/0xa0 (P)
> >      regmap_mmio_read+0x4c/0x80
> >      [...]
> >     Code: 52800400 8b214093 aa1303e1 97f4caf0 (b9400275)
> >     ---[ end trace 0000000000000000 ]---
> >     Kernel panic - not syncing: synchronous external abort: Fatal exception
> > 
> > Running this through decodecode gives:
> > 
> >     All code
> >     ========
> >        0:   52800400        mov     w0, #0x20                       // #32
> >        4:   8b214093        add     x19, x4, w1, uxtw
> >        8:   aa1303e1        mov     x1, x19
> >        c:   97f4caf0        bl      0xffffffffffd32bcc
> >       10:*  b9400275        ldr     w21, [x19]              <-- trapping instruction
> > 
> >     Code starting with the faulting instruction
> >     ===========================================
> >        0:   b9400275        ldr     w21, [x19]
> > 
> > x19's offset from the base address in /proc/vmallocinfo is 0x10c, which
> > points to a bad read at physical address 0x4007c10c; I also confirmed
> > that the preceding memory reads back without issues:

Oh, ugh...  I didn't realize that this wasn't merged.  I don't have a
way to test this any more.  The simplest fix would be to do change the
0x3000 to 0x100.  The GPR63 register is at 0xFC.

		reg = <0x4007c000 0x100>;

That's probably the best fix as well.  The later register areas would
be their own syscons.

regards,
dan carpenter

