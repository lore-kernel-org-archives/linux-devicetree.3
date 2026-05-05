Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF70048B364
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998336; cv=none; b=U+4ra0aQFP2mZBtTP9GpBSJXEhf0Y6YU3GU4PyjMjmDy0YFIddYaKUAKLeQ+M20UEPCtPKbQ4aVuQ+zA7AP1vwfFm/yneDEwdtbQ7hpA/18nqqTRIbMJTDQ9FwIMmOdTj4PfzodTVR5tKjBJ9DVO1UM57GsmsZ6GWH3DF9/HZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998336; c=relaxed/simple;
	bh=10ad65O0ps7iM6dei8qNX30QY3FkTiMh2oPpwbtxSn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzUjyC6CZhDzya46W2lS55VUJa7gKwwfxYsMoNgZR32BZCM80KgMfHB0Pk0H1HTo/54Pvjg22jriJvcBtwMy8BO6HUJEl33y23vF+6jRNNi3AERjttmVlt8HJ4ljXHSesRKBjLhLZSM2wQmXE94Je9a/RlKUI5bPocWExzjOF4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=BOLA12n2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="BOLA12n2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso48558385e9.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777998332; x=1778603132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dvgEgjFlnhgVavTSLAwA8kue6OnY1fSQmcbYOk/Oxj8=;
        b=BOLA12n2zlvmTn6BetXu2cIMwXhJbX+fAz/gLq6do6zp3kF4K8bysb/R3kx6QmU/sL
         sy3LWQoP4bi8cfnuP560JUjb7CQJze1XckvA6zXP0cQCyFX4ek6Ex+BhPLyNPHbkcKvi
         mi3Mf1XGJcV9KZdHYB4NPiQe4Be5mJyy0DlMvUJcGYrNtvX/tmmSESSG8uRanKtf6QrH
         +jXCiqbm1qvvfa3oR65MrApVGLhfnE5RhpdCkSitxFVUhnKXbOyeOYf85Na4ivlYhRxp
         29xl5m38ckNZuCyrfLY9/TP0RzuQ/yCbLpPNfD20ghiwdgtgdjyIoXBIwXneCGn1k6w7
         F+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998332; x=1778603132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvgEgjFlnhgVavTSLAwA8kue6OnY1fSQmcbYOk/Oxj8=;
        b=WqPDxkYMvNwhU8/zGl9sPozk8YKO6AJ3+6xD1v4bhdX19HLuaP47ynPXmBye4kR7IR
         y/NdIkazWPCUEt7npU7kTnq6L4jz8XRFzBIPbZ9AEXyDAF9Aw69aR2EBXKsPWo+/UN9I
         kshLW8RyuVeuiaBVSNXpFV1T0Z/15rJwgXFWp3ed+4aO5fgam7KC4Q4uskXNNOyx2xDO
         ec5aaO8sFTzlcyIe8Ydds4RvVABn5QOXgMwPN9k1mZJii1cJbw8bpLLoTfp1EsG+rpYD
         ftIdfNoQ8cHzjiLUUi9tIcnAcYgjUc9z75pD1RlbptwrMoaNj3j0oQmZNY5ptGbH+v0g
         TMpw==
X-Forwarded-Encrypted: i=1; AFNElJ82/+MjB/IlCWcQsPJjsSh0n4uVOIBtoMU4+vW6uVSJYPvp71/lSudsDA9+2WuM4kKz2IivHfjuwTd3@vger.kernel.org
X-Gm-Message-State: AOJu0YwhK8Sg1233OHPkqcjlHFHe7RNnq3aK4OyJwBiPM7J+CAcGcwd3
	9Qp85R9iwFL8WLXaYbMOWJMZUzNafS9oUu9hOMkyHgW8DdRxlMqSnTxb97bF3MFi2hY=
X-Gm-Gg: AeBDietf1lLW9fxFd7TUsvwNUJ4HRO/mNlx9oogFVFfFhu2LEa2RDyXB234on7YIgeI
	FyXKjSprkD8u17ughdl+uaxM2W/gVDfzFoJGEWDsyPGW2P//CdyOeRB1zZLrUZbFyOUbg6/jQ/x
	iDnwDwgt7DqCZk5X3++2lc+HatTXAQl0cUQ3VOAWf0dihpVseYGpmAGmod6ttWJtc8CzNR+3jYo
	lyFJjAzmYnR1sp4hsaArtrGc5KKMzMG8cA0kcHB7wHWUcZLHc14cEIiErXLT7enzKjf4kgTge5e
	N8u2SxEkkoftB1Cn47EYHfugxd9U87pmN7OtPFgYASpYZGjFP/EsKXu6GEg5Btk9efV/4z0+y4g
	0bgQfiDiia6uuWa5oLhXB3m60t5liLjSl+wX+6Gr0F1+ehSHvOA3Ya7GYmUSFAVOythPPg5k7ca
	osZJK9DsQxecZl5rIl9c4CXLWolnmg+F88FTns3/+h8sKVQKJA2J6uglgZQeh6s9JXUhizG14Fu
	68tJt75l/7Qq6XUTb2aGEtHBLlHf9ynfgxRS6jh44IKuiFqpv57lfPLR/WlqPB2N6qDcQRIJrDN
	tmELG+uaOO259OyY+Pw=
X-Received: by 2002:a05:600c:3e05:b0:489:1ff1:74df with SMTP id 5b1f17b1804b1-48a9852fbcfmr256956845e9.1.1777998332149;
        Tue, 05 May 2026 09:25:32 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm737620655e9.2.2026.05.05.09.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:25:31 -0700 (PDT)
Date: Tue, 5 May 2026 17:25:28 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
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
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
Message-ID: <afoZ-LuVRaX6ixs4@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <d29621c3-07fc-4720-abff-d8901a0d791c@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d29621c3-07fc-4720-abff-d8901a0d791c@lunn.ch>

On Fri, May 01, 2026 at 11:09:42PM +0200, Andrew Lunn wrote:
> > +					tc956x_emac1_phy: ethernet-phy@1c {
> > +						compatible = "ethernet-phy-id004d.d101";
> > +						reg = <0x1c>;
> > +						reset-gpios = <&tc956x_emac0 1 GPIO_ACTIVE_LOW>;
> > +						reset-assert-us = <20>;
> > +						reset-deassert-us = <20>;
> > +
> > +						pinctrl-names = "default";
> > +						pinctrl-0 = <&qep_irq_pin>;
> > +						interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
>
> What is probably wrong. PHY interrupts are level, not edge.

Thanks (and agree). Will fix.


Daniel.
