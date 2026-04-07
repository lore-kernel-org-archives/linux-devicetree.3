Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1880363C61
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575179; cv=none; b=UyrLApKz9QFv5m8v3g6xe8xKcgOGQtyMq78XJd0jVI0q6WyhIHAh0z+63GtHirbpRuwVudL/ekG5x6a3+0R0Lc6Bp2wll5NAyaVNaXwbacQxDF7hJb6CegDtAEu+1U9aqA+BzZF2Yk6IMrPfMuvKStTeX51034m8p+3gdKSYcHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575179; c=relaxed/simple;
	bh=Esr4m/CWzlzGxIEXM4jv9Iy3Hrt7tqhgId2RGV+BjP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rz81w6tNBjjwc6nrLwmFHFU+LruolWd2ojz4bByMS4/6svtAD/MbxCYXn493L2RvrQj/w8VssQ4/fLXhD3xIitAnG91eh5dIvDK20rIiLdIFzpNr7J0b/fZ3AHivxcEjyi9vVVya/jiTJqEX+PzWudk3DfZzVAQVm0SAdeCfmsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6cdDzB7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6cdDzB7"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82418b0178cso2351090b3a.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775575178; x=1776179978; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=px+aTSO680+yUdTUoCh2tkBc+4urCGyGCdnmZi+tHi8=;
        b=K6cdDzB7ua+XmUA45Lin2VIetbvOKK/wffm12AUzyrjYmXFM7xFiV/uSKyfro+dRGI
         LvOmiOJV7FGxpHyU6Qqgw4m6wNQpOYsAmIDUGtVsqSUf0JOPvZxq1HdtJCD0zvjC4amt
         EJHElZY0TavY/qe0hyynWCUYg1LJoD1dirDPUG/cenqb/huHbhPe8qIFIKHpDjHNHiMn
         ldzB/5QgnWWAEWaWJW718D4B357YF2H//3LSJwybmqoWrnFyJu05+MubTS6iMVdOjHSv
         GQDi/1WTw7OD/Wr8w+PdFxf65c8jGRRsFZYNworRYp/sUl0/9uwCSsg+vMvNmMDJqES5
         yJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575178; x=1776179978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=px+aTSO680+yUdTUoCh2tkBc+4urCGyGCdnmZi+tHi8=;
        b=ME9TvwOlQ4so5+KzvvxDKoUckI+4DloiG6MXjrgIH/+ygDWVX1yszl48RbXf21DVZC
         SHAFi6dYBbwODkQ9+nbjeewnqvGr3g6IBn8WMPjMEcpfqr6NHJTMqZqAvkFz6GawxoF6
         AObt1f8gSLQerSthwcX73ir99CpJXpNjAcafXSsWtDO8JyLepV6h3tUc4UkBU0PLaTsY
         u2Pz40hPy6HeIInd/XRboKE7o135uNMM8MJkIGjVmd2frq5hfYqgwXkI5XsxcUHCHjQI
         d0ov5bBClH9cLOTZQqFDNlCm+RxAJY6uWvxLc4F4oAh06uJnIpMVtNSI637iCGXdllW2
         V7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRrYtjrsMzObKssjXWPAw0HfEi6QMTRN9GXjPX1X0XInf5euNj3lxJt/QtOumPiX2uoGrGY1AQvyDx@vger.kernel.org
X-Gm-Message-State: AOJu0YwpBY6wpK+KguxgHqceN1jRpPh9F66Zr86/W9Y0yb2hFS9DfPAi
	5H/jNVWjOY4G0J9AvCtgtVIkzdOWehMrjrMIEUAh5CoCa1W50uf9HpJYGqCtw35kam8=
X-Gm-Gg: AeBDieuwH2TfSyIUoA+CwsfneBTjekqBqNEmJytr4rzHICf+12HthDnFH4kAmxZbQRF
	0uhSrYR/3jw6w1VPS53pUPD4M9ipTCLd5TlnJM6qglUdzAaAoF0FaZ3U0WHLi7olOIWMLKwHe5o
	Nt986NNvV38JSyjCMBNnZHWUw6CjjLzEqSuxYOO2o86IgLVK+0iqf2TPHtd0KytVZw9KF3kVMdp
	IY+VBlKujksWLaMKE5o3VU03NbTbh+NSesHM5/yO/Rg2f1Nqpn1/lJ10G9fcB+Yg9pa8WDcn+ww
	UDyYyczuxarWHvROuIodYGjUreQ4YBPFV4NjN60VyIkjIhLwMxI0s1Sj5GmiSORtbR0aU301/Tj
	e+vdBu0FhdskpSPc0LzgBsydlaDhGJQ7/3C7kQ31I1OWw08ZUxQl80Lw0nZCPuf7eTeKCll5Zbq
	zMWcRM4xvLhhncF5VT8Od4UqxpjPA=
X-Received: by 2002:a05:6a00:3926:b0:7f7:2f82:9904 with SMTP id d2e1a72fcca58-82d0da2c50cmr17909669b3a.5.1775575177733;
        Tue, 07 Apr 2026 08:19:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:97a2:befd:d439:79fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm18101364b3a.45.2026.04.07.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:19:37 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:19:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <adUghiyZbe3fmcNX@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acs2PAZq2k3zjmDW@shlinux89>

On Tue, Mar 31, 2026 at 10:49:32AM +0800, Peng Fan wrote:
> On Mon, Mar 30, 2026 at 10:22:35AM -0600, Mathieu Poirier wrote:
> >On Fri, Mar 27, 2026 at 10:42:03AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Cortex-M[7,33] processors use a fixed reset vector table format:
> >> 
> >>   0x00  Initial SP value
> >>   0x04  Reset vector
> >>   0x08  NMI
> >>   0x0C  ...
> >>   ...
> >>   IRQ[n]
> >> 
> >> In ELF images, the corresponding layout is:
> >> 
> >> reset_vectors:  --> hardware reset address
> >>         .word __stack_end__
> >>         .word Reset_Handler
> >>         .word NMI_Handler
> >>         .word HardFault_Handler
> >>         ...
> >>         .word UART_IRQHandler
> >>         .word SPI_IRQHandler
> >>         ...
> >> 
> >> Reset_Handler:  --> ELF entry point address
> >>         ...
> >> 
> >> The hardware fetches the first two words from reset_vectors and populates
> >> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> >> Reset_Handler.
> >> 
> >> However, the ELF entry point does not always match the hardware reset
> >> address. For example, on i.MX94 CM33S:
> >> 
> >>   ELF entry point:     0x0ffc211d
> >>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
> >>
> >
> >But why?  Why can't the ELF image be set to the right reset base?
> 
> Per zephyr general link script[1]:
> ENTRY(CONFIG_KERNEL_ENTRY)
> 
> CONFIG_KERNEL_ENTRY(_start) is the first instruction that Cortex-M starts to
> execute.
> 
> config KERNEL_ENTRY
>         string "Kernel entry symbol"
>         default "__start"
>         help
>           Code entry symbol, to be set at linking phase.
> 
> The hardware reset base is different: it is the address where the hardware
> fetches the initial MSP and PC values from the vector table. Hardware uses
> this base to initialize the stack pointer and program counter, and only then
> does the Cortex‑M begin execution at the reset handler.

That part is clear.

> 
> Aligning the ELF entry point with the hardware reset base on Cortex‑M systems
> is possible, but it comes with several risks.

I'm not asking to align the ELF entry point with the hardware reset base.  All I
want is to have the correct start address embedded in the ELF file to avoid
having to use a mask.

> 1, Semantic mismatch (ELF vs. hardware behavior)
> 2, Debuggers may attempt to set breakpoints or start execution at the entry symbol
> 
> [1] https://elixir.bootlin.com/zephyr/v4.4.0-rc1/source/include/zephyr/arch/arm/cortex_m/scripts/linker.ld#L103
> 
> Regards
> Peng.
> > 
