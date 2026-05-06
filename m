Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309D23ED5D4
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081960; cv=none; b=joEtv37HX2YxyQCrKvAv6j6WAaOWWukNijlW9vlNZJ2yNyy+5PFgbEAkST5RLLXzec4Nuzx/f4r8oFMkxlf1z11VCTuqE1JYf3pB0EOH92g3vJm/qYLqhHVp/6SeTEVgvJpbnMkUzUEIKWckKLbD5t9AoEXKriNJkFQy6oL8rpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081960; c=relaxed/simple;
	bh=xv+hOIA+jYDagu8VhuQJ1WD+q0s4/2y05KQyVhdDIbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuFh9v/X2sTuMloYNPPPyixO/qQCRGfFt/K/sLUzsDPzoO7yHy1pD/g5h/HbkzZlfqzEP+qJ/HhLCdOJpvd4I8vj3RWEQiqYEh3XWgb8LuAPxEhzxpsbP8nptbBQin4EIWm8zRHRbb1B3ZKIT+HMuMOOZi9bP4szRZqfUgk40IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=rJFOKZw/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="rJFOKZw/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso77916485e9.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778081958; x=1778686758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+RE97dD5fWvLcGBYDBhe9zTaH8AQpDWyp4x6oWJE49c=;
        b=rJFOKZw/70mTgSsbLc54CxHCxw73Br0bANCa2N3+BYqCc91sJvLd7jlmpCRppSuHHU
         UTTSz16Pe3NF7661pFc/DPfuuAHzjBxm9mdIItXuKcyNjocJbvgHxMRdrP7KzDXVjnV5
         jhzbx1Flts8IMgTqUpB7NU16AcD09JdRAOMtb6Mju6/MG3zSa3vHLR+qKGfIHMDVPbpG
         3AhhnuUvLAR0kmwzL1PEL02NXreHkhOoI9buMvzRL3xAtdDfx2g0dH74JnZkM0mCTNYO
         YRO/CUypc4p9+aBxqwoH5Onbje2METCqDFVnCeApiBq+lsk8c5EgYYwmxniFH91gIwZm
         tTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081958; x=1778686758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RE97dD5fWvLcGBYDBhe9zTaH8AQpDWyp4x6oWJE49c=;
        b=hYiJbSyhEwagdCoFbJXE2Lr4d4knQb10AiSwQStaEG3yWcG0ove2+zOG+MH9M0DqQo
         xJnNP2pAyOTJRr+rtRoiTIM9SiFaosZMnDSp8gyjr2TpPMTZSNuIKMKeO8zJQUClgTcT
         BgDT73lieXUOhlPs8FN1nPZyOSfR3aCumRaljPXbjhQGEjk1b2tZJhdzxHbPz2U+2x1C
         P34PdcaGXoWv1sWrTtFUki3jnbSfyDVrg9h/36UfZi/bnk/Vu4rVnZSSpRKWkZg8Z+J0
         LRPrUXC+/525HpVh0YHVkFLy899hFBVdJ3bvTRq227fq7tHF9nUowhqWC6beycxCp0UQ
         NKhw==
X-Forwarded-Encrypted: i=1; AFNElJ9LCxDPKQyXdhlyPzB3nWB2t0Jp2xmAxfQDRm1Owh96YdCAuXdO4i7IAoL0SABu/5nuPW93nQ3zGDFs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwr9SQvAByND6NAixiRepyKI+FIp1j8vFpHRjAwME6usKMW1Pb
	RfPDPyR2oCrqFdUMut/gB5uUpiTtX9TZKRERNe6fQkqlq3lmud2uYLCm2BgYN7NOga8=
X-Gm-Gg: AeBDievY13LTatmDY494pDSueESHK6ORtxaEE8PEdDZB4s8Lg2sbcK6hpOq0txvdlmr
	vhkgNLh7oOsmDFbL6dJNWc6T44XG4hmFuBN8rNRovZwTCimyYpqg2uxysA4n5mhIHjdwqA/rU4J
	6h1utOlPjMsxnYwqHirp4yp7/LOKxwgq8gbvkwsQlG4DQuzNivn3qtS6m/16KnFiP3Q1z1mJOtB
	7xBnp9NI3UbnDLTUK0b7cszy2Ly4UVUsRu0i/V0CVZxn8WV/t2mQseiePdBn6A2UvF/aFBkU2XV
	BaPZOL8i6NESNr3UVjeZ0nGMFUe7yEKt/WwsyXESgh3u4/CTATQ7SA8Lz4T+cfhpKIMcc3mHfNl
	yIGHVdNlaozZrRtr0kVc7/mH1sUOMHd+nwOyGhRuokp+4DXaumv4ZolFZilN9SyylEpcDQHygoF
	0wDIvqIc/JzYRLFslWA8jK3bx9jMcZ49AuYloF09TafsLH8jBHdih5Ci0drV09QL1mCvgv2AHkf
	xpv61/5NRplEPqNl2ZVOVsijKy6ja7q7clg1LtxIggrSiugLf5dyZFRQOeTYO6nTNLZ0kGXpYZp
	BV2SGyvWWUJIbu6FDEk=
X-Received: by 2002:a05:600c:6209:b0:48a:525b:e157 with SMTP id 5b1f17b1804b1-48e51f2e660mr64800835e9.13.1778081957492;
        Wed, 06 May 2026 08:39:17 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538fb19csm52241905e9.11.2026.05.06.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:39:16 -0700 (PDT)
Date: Wed, 6 May 2026 16:39:14 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alex Elder <elder@riscstar.com>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <aftgorkah-Hjrvq2@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
 <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
 <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>

On Wed, May 06, 2026 at 10:35:18PM +0800, Xilin Wu wrote:
> On 5/6/2026 10:19 PM, Andrew Lunn wrote:
> > On Wed, May 06, 2026 at 08:59:01PM +0800, Xilin Wu wrote:
> > > On 5/1/2026 11:54 PM, Alex Elder wrote:
> > > > +	/* AXI Configuration */
> > > > +	axi = &td->axi;
> > > > +	axi->axi_lpi_en = 1;
> > > > +	axi->axi_wr_osr_lmt = 31;
> > > > +	axi->axi_rd_osr_lmt = 31;
> > > > +	/* All sizes (2^2..2^8) are supported */
> > > > +	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
> > > > +	plat->axi = axi;
> > > > +
> > > > +	plat->mac_port_sel_speed = speed;
> > > > +	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
> > >
> > > I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I guess
> > > it's required, since the driver clocks down the MAC/PMA/XPCS in its suspend
> > > hook?
> >
> > Nice to see somebody testing WoL.
> >
> > In your testing, is it the PHY doing the WoL, or the MAC? I assume
> > PHY.
> >
> > If i remember the DT correctly, the PHY interrupt is connected to a
> > SoC GPIO, not a GPIO of this chip. So for your board, it is the SoCs
> > GPIO controllers ability to perform the wake which is
> > important. However, where the PHY interrupt is connected is a board
> > design issue. Could the PHY interrupt be connected to the chip? Would
> > the chip be able to wake the system? Should STMMAC_FLAG_USE_PHY_WOL be
> > conditional?
>
> Yes, the PHY is doing the WoL. And I guess this makes sense as it allows the
> MAC to power down during suspend to save power.
>
> The INTN pin of QCA8081 is connected to the ETH_0_INT_N of QPS615. And the
> INTN_WOL pin is connected to a SoC GPIO.

Interesting. That is different to RB3gen2 where INTN is routed to both
(although there is a do-not-fit 0ohm resistor option that could change
that).

Does that mean you don't get phy interrupts reported in /proc/interrupts
before any suspend happens?


> Without this change, I can't get WoL to work. I have a working branch for
> our board here:
> https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.2-8280-wip/

I took a quick look at the DT and I noticed you have an SGMII PHY
attached to both eMAC0 and eMAC1 on your board. This is something we
think should work but were unable to test. Are you able to use both
eMACs concurrently? Would be great to see that confirmed!


Daniel.
