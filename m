Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71EB44DB63
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 16:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169838; cv=none; b=cfzyC2IYwsbHcgTZpW5P1PoyqeXelxpov7Q5KKN2Y9ZmJ8jcRqwZNvhaigI2iQuMwj43MY9jTh2dFcACCcUnC30yymoa7k7eWaM4mI1gpDn2WK2+5S/Sjd144aNlfU+DJyB0stryWTjupFGo/UHbyFw93stN/xe6lDIOAK0jefA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169838; c=relaxed/simple;
	bh=nyA8o2NvivXKk37nVK14Jn6/jPyU2MxLgg1j2S3M6kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npP2BPXUbVHbPEuqTY3tNS2iB6eqBWyHAb+2lrF78SHlrQN+3bPkFPHvu2pwXKH4aCxBg1SyXtxkJlNWD1kIMQ+qG8qilwDxX34g+6RxEledqc01/zmhhNb0vTDrT62DjpPV1gejcBjpOU9IHCj0n9pFq02XedtMpbYYlaXOueQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=EOsNiDok; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="EOsNiDok"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso6822955e9.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778169835; x=1778774635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6okPXnC/tZolkk3p3FjZk+KFTlmCOhId/0Ru10JUIvc=;
        b=EOsNiDokbkWqPPukv7hDjK/Jeggr+EjNM4jRuY7YfuAMp6tZyLEK/rn+z5asPdzIYU
         bXR5o5pT8eTMLyTN5k1GnS8E63YAK7Jo/88+h5VnJCvEuH6HPIgZDm8MUmAkG73jMjwV
         TAyTQH8AuMGsF98xqqaUXQygR8MceD2kp17cGj+pdyTIoIjIgA+86hgoUykJ7FuQKl+D
         9vBg9mlJOhyJ2hUySpJt94JpTYk4Bk/aFOs0tPvG4DDkITg9RYYbjiRbbpsxgRFbY3RQ
         Yr0nDY5pwFgj8f70B0fkXHNjnuuRpZYqJd4zz9XzuEbQfdMgvKV4Bbizn+dbLYC59s3L
         Zmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169835; x=1778774635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6okPXnC/tZolkk3p3FjZk+KFTlmCOhId/0Ru10JUIvc=;
        b=m1NoyVEoRCg2nJ9u2oBvR5Hhp4Iqi1NUmp//Gr+eJNyZ/02eAgoAcrLLJ41uyIh75P
         hQb3oO5sM9vtxi5+hHjkntPbAaHZE2uF9TGNwsn8Um0/pzFWSq/gQWnMwAue978CfRfz
         xRAOeDdOAzTjDLtSjaZwerqKsoIb7+tVvPFlPdnG1MWfrpLPxs2AD0o1NmWJIqpGdknj
         13Udm4qdsJDnKJI41DLaQOZS+J6WEGUFknOJ/zapxdWCf2tfoEVqKNZbOhYzvrCvwtBH
         d21oDy9PkjTehDbiiSTR+CafmeUCw+ORcFeakJl33DCYxiTK2lUsL8LMR+kKEqBdMsdT
         ZjEg==
X-Forwarded-Encrypted: i=1; AFNElJ+Qc4QorMf6Af8SkE1dVc9PyuEfsGNy/fG/6zVJ7jw6DM31tiavz2iC6tKXYPmBQGOebNRRLpqOLEkU@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhNfl7r07Z5SC1hvIspH9yMoW6j1j2Jwg1LFuR+bIQzTVHmqp
	R7FqWJ2l+KxlAzovxuJRv1lI6kC5ya+vuMjv+bkE2QYwsUi7GZVC8FEia4KI6REMsfA=
X-Gm-Gg: AeBDiet/xXRY20xXskmyCR6JzWfaefrtXf7zCwpz3cAqUVYnGCDGoO2pRdb6bmnKaMk
	ph4SXyK0qoSn0DCiu7YiuZXp1MhqqXvmIX9kcLdjjcvHHCW+qleL8TsJSyCiQtgb8TXPLMA6nrf
	Ijz+jU1UkJ63PlbSbbhn/FO4chXP/meX/QVQGs/RfgNH68V0jdH6Wu9vlpuZnx4byLnEO32CM6p
	xyS/nx1l2p5hB7vUd9T/E5/1zIxaAgtQdRh00W4RiGu2+46bm1J2PJwRT67cqZDAw6jO2WHaZp3
	hiBoS01oli4kLZbqfchaRqoEreGq9ZtfubkfMvrGEZegb45kfxRVETQdR3NLdCT/RZEBwx10FT+
	E4dW8/Q1mFduy6dZVx5oJ8O/QAkLFE7dcZsCsIdix05k6l976q1L1bIwXUnkboh0YB7y5b7knMb
	CyuEJ49CadZRDptTlyFVMOYiw8TOWjf9njJYbhyzlLFQM6dFKS64myBqg2bWCdkweV42UMwNYWe
	zWMUY3XOPD6+ikw+JASsqCJtE1Fy3zZqoFcscC/C3bwGy2kg65Cg4WZCVUAaLA1SI5BpnNEejBV
	7nLHoFbB
X-Received: by 2002:a05:600c:a404:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-48e51f3e0f8mr128948435e9.22.1778169830360;
        Thu, 07 May 2026 09:03:50 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53907e8asm130198325e9.13.2026.05.07.09.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 09:03:49 -0700 (PDT)
Date: Thu, 7 May 2026 17:03:46 +0100
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
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <afy34kj2hPxIlArO@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>

On Fri, May 01, 2026 at 09:04:58PM +0200, Andrew Lunn wrote:
> > +static struct tc956x_mac_speed mac_speed[] = {
> > +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M, },
>
> That looks odd. Some vendors implemented 2500BaseX using SGMII
> overclocked. But that is not strictly 2500BaseX. Having the 2500BASEX
> entry suggests you have real 2500BASEX, so why have an SGMII entry
> with SPEED_2500?

This is a consequence of the code that uses this lookup table being
called both during initialization and from the fix_mac_speed() callback.

During initialization we only have the value in plat->phy_interface to
go on so we run the lookup table using plat->phy_interface (which is
typically PHY_INTERFACE_MODE_SGMII) and with the maximum permitted
speed.

I haven't got detailed enough notes to allow me to double check but I
think there were problems completing the initial MAC reset if we didn't
write something sensible to the hardware during initialization.

During fix_max_speed() we get told to adopt 2500base-x. Reviewing the
code I can see we don't propagate that and just use
plat->phy_interface for fix_mac_speed(). I will fix the code to that
the requested interface propagates properly to the lookup table but I
think we would still rely on the SGMII entry to get sane initial values
to write to the hardware.


> > +/* We have one IRQ chip instance with 25 IRQs in its domain */
>
> One per MAC, or one overall?

One per MAC.


> > +static struct irq_domain *
> > +tc956x_msigen_irq_domain_instantiate(struct tc956x_data *td)
> > +{
> > +	struct irq_domain_chip_generic_info dgc_info;
> > +	struct irq_domain_info info;
> > +
> > +	dgc_info.name = "tc956x-msigen";
>
> If it is one per MAC, maybe this name should indicate which instance
> of the MAC this is.

Will do.


> > +static int tc956x_mac_setup(void *apriv, struct mac_device_info *mac)
> > +{
> > +	struct stmmac_priv *priv = apriv;
> > +	struct stmmac_desc_ops *desc;
> > +	struct stmmac_dma_ops *dma;
> > +	struct tc956x_data *td;
> > +
> > +	td = priv->plat->bsp_priv;
> > +
> > +	/* dwxgmac301_dma_ops needs extending to provide DMA address translation */
> > +	dma = &td->dma;
> > +	*dma = dwxgmac301_dma_ops;
> > +	dma->init_rx_chan = tc956x_dma_init_rx_chan;
> > +	dma->init_tx_chan = tc956x_dma_init_tx_chan;
> > +	mac->dma = dma;
>
> I could be reading this wrong....
>
> dma points to the global dwxgmac301_dma_ops, which you added a few
> patches back.
>
> You then modify it, changing two values in it.
>
> Doesn't that break any other dwxgmac301 in the system? Shouldn't you
> be making a copy of the global structure, and then making
> modifications to your copy? mac->dma then points to your copy?

That's exactly what this code does.

`*dma = dwxgmac301_dma_ops` is a structure copy, we never take a pointer
to dwxgmac301_dma_ops (and if we did, dwxgmac301_dma_ops is const so I
think we'd get a kernel oops if we tried to write to rodata).

Would to code be easier to read if we dropped the local `dma` variable
since that would make it clearer that td->dma is not a pointer? More
like:

+       /* dwxgmac301_dma_ops needs extending to provide DMA address translation */
+       td->dma = dwxgmac301_dma_ops;
+       td->dma.init_rx_chan = tc956x_dma_init_rx_chan;
+       td->dma.init_tx_chan = tc956x_dma_init_tx_chan;
+       mac->dma = &dma;


>
> > +	/* dwxgmac210_desc_ops also needs extending for the same reason */
> > +	desc = &td->desc;
> > +	*desc = dwxgmac210_desc_ops;
> > +	desc->set_addr = tc956x_desc_set_addr;
> > +	desc->set_sec_addr = tc956x_desc_set_sec_addr;
> > +	mac->desc = desc;
>
> And the same problem here?
>
> > +/* Called by tc956x_dwmac_probe(); return errors with dev_err_probe() */
> > +static int tc956x_dwmac_parse_dt(struct tc956x_data *td)
> > +{
> > +	struct device_node *mdio_node;
> > +	struct device *dev = td->dev;
> > +	struct device_node *np;
> > +
> > +	np = dev_of_node(dev);
> > +	if (!np)
> > +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> > +
> > +	/* Find the MDIO bus */
> > +	for_each_child_of_node(np, mdio_node) {
> > +		if (of_device_is_compatible(mdio_node,
> > +					    "snps,dwmac-mdio"))
> > +			break;
> > +	}
>
> It looks like if you put the ethernet properties into an ethernet node
> in DT, this might go away? Or at least allow you to use
> stmmac_of_get_mdio().

Alex has started looking into adding an ethernet node.


Daniel.
