Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56FA3ECBDC
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060768; cv=none; b=Av3HvD83rpc5ykIx2JchLxlJK39TFOkl2M1tj3TP1phabrwIJBlLbJEwV9VByNPrsmwfUwfieLeA39/nFA+sQza5G7GNVJ8lhxl3jzn7OGxXVwY/wp9RJ6L/hu5mfvqI1O22fGn4jq7aiQsb7jOEotiyufVsP1ibW49zAWGq+vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060768; c=relaxed/simple;
	bh=UfLP1tUzO3A3YXd/nCpoke2Vqju/wUSSq/yG/FR+WW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WD3PcdNXp4CCB9KJZAxrT7wlbfuaOrbBaqFZk9fFnP/Q1uFhEOHplTmFZrak9N2W8ejzT3DTCeroAwlPLL634UWX3mRTe0OvwuzVmIEUz2sfkfDkgX5VI8lNDPaDYNbS1cppOAuqwzyEOOR+Eq4Pyjc/9kgQVheLhRKv8ZXkLRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=qf95NCfx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="qf95NCfx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso66539415e9.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778060765; x=1778665565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvO5cR5xwJ6Wruq4xsZ8UnvszQRGf9f2UYLH+AJmPFY=;
        b=qf95NCfx8eT8q+22AmgDAhodGtcSDNymauOoWGWblOztJb5IKvE6NaVvy3K+b+D8i/
         c9Y8lg72wraLqzTH0qEnVPAtIfQOJlUlSZCIq1gMShmOkMHVvMfQ0VQYeFpRAzmQssk9
         vIerJMRrg66l8fQCySh2uxli7IpQszcZahsyJ/8YYthhm6qj1wkLXF1n8R3uCUXWFj5o
         lkJlUgz5frR5fjSYlmyuQV/P96ZyqGmzZsPvfp64RCJ6JdKDd/HpNqBUTb0el0RcvyuW
         Hia7rf2sTxsMoiE2s0SGV20z2+TzaHiSq+H4zCrxtAffDGsZeaO7KtkcgYhqTsNyRvps
         9GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060765; x=1778665565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvO5cR5xwJ6Wruq4xsZ8UnvszQRGf9f2UYLH+AJmPFY=;
        b=CyRIaGfkyxM3xYmDlwrO9Lr1TNUgTtlokii3btdb/mo9JUb7x2cRE/haLaumBEHV4m
         jr1KDXISdmXoBdPiS/xRK8SIzZppUiznCormDljwtTZ4dsvDhtMgrtKVLsfn1yjgUTYJ
         4kzYF7K4I7S9ZnclGycscZFBcQHjE4EAA4++DIgnHwJpIF+5j3OnfywkyKmjpTGw+N7i
         P3LolbB4x+bxIaF1evhMKRXqLlwuTf6dEKm6CDyN3IJZW1irFrOIGjfAMw/UUhGp1SA/
         8y3DyKile1r2Bvvs3o052IecROG89Kqk2LXWb3o3R0Cq8LMZFUFA08h5OuBW9qaLrD3R
         KPaA==
X-Forwarded-Encrypted: i=1; AFNElJ/t22uupPO0lAxVU8JwEUDRNNkvOmA9F42ELiLqQcf0os1NtzCDoS4A+rFBMzveQ4Rrwf+X/haOvadl@vger.kernel.org
X-Gm-Message-State: AOJu0YySN2uf3lps0AOXqCklYD+dzhMuQmYpxAvr1aPZ3q+vihwpdVee
	4YIpkfwb4l8F+HwcNG/SfiCzhzQrQjm0Wrknl0tikclX/+hwh3+tIyyYjYfMBkSdy8o=
X-Gm-Gg: AeBDietM1gIuLfraS4vvXOAvZvLrFEIbbGFyMUaXn3aObFEqmi4S3mJfpe40jLZ18pH
	PNOQjBtyNCTTmfJKJDp12X840bRrauCSB854MnJUiMuWvwHOKU+BQUFkwYDvycSHyRzIDKHzd8W
	HoBXjpNTMRLD8t2JdKZMIWwE3S3DSVYMzDRIv1Y2ZuyY1TwW3GkynSPtZE6VQN8HK7YDzdHSXcj
	P7OJ/80K687AP8UVylZ9IVB2F77mQd+wrxTkdFUdOsOKtR0R9SMrNS0rvMGKVIFS1PFv0950TgW
	Gyxkm//ySeQAooi6z3Pl8eLFh0za2Pecl1Rqi/2w5DPUuDKjTSmn9fMjbwTJ+73lmlbnRI0hdeT
	43ry8GV8IsqStZnpsqv5wJTjteOLDZZIgnADe2PccRrJL0rQArrTSyxpPiuZF6YR6XkqaFnYIOw
	6EtpfOh+VDKVL+dLE8cNbHlLfxslA1eX7hv4dJFrnaBBPvRygUzxUB3xH4TswHPZaS7PiQ+Q2Ed
	3i4Z62fGPpiW17pI3ZYp8CAkKfUKGso/RJzUQBJGcC8qsDJxztP5t89dBqqGQ2AVm3WpJC7M5fE
	oDtx7NtoAGS9nrJn3zo=
X-Received: by 2002:a05:600c:a305:b0:48a:5970:2005 with SMTP id 5b1f17b1804b1-48e51e08362mr31054235e9.2.1778060764831;
        Wed, 06 May 2026 02:46:04 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm19233185e9.5.2026.05.06.02.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:46:04 -0700 (PDT)
Date: Wed, 6 May 2026 10:46:00 +0100
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
Subject: Re: [PATCH net-next 03/12] net: pcs: pcs-xpcs: Preserve BMCR_ANENBLE
 during link up
Message-ID: <afsN2JrKNFw-PV-g@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-4-elder@riscstar.com>
 <91332fc1-11ed-444e-a211-699420cf0108@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91332fc1-11ed-444e-a211-699420cf0108@lunn.ch>

On Fri, May 01, 2026 at 07:06:15PM +0200, Andrew Lunn wrote:
> On Fri, May 01, 2026 at 10:54:11AM -0500, Alex Elder wrote:
> > From: Daniel Thompson <daniel@riscstar.com>
> >
> > Currently the XCPS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
> > is unable to operate at 1000base-X and slower with a PHY connected
> > using SGMII/2500base-X (in our case a Qualcomm QCA8081). The link
> > negotiates speed correctly but the MAC can't get any packets out.
>
> We need to break this down into its components.
>
> I assume you are saying the PHY negotiates the media speed with the
> link partner. That is PHY talking to PHY.
>
> But we also have the PCS talking to the PHY. There can be inband
> signalling here, for SGMII and 2500BaseX. But not for over clocked
> SGMII, which is how some vendors implement 2500BaseX. SGMII signalling
> does not work when overclocked to 2.5G.
>
> > This attracted attention to the ANENABLE bit and we observed that the
> > bit is currently set during config and cleared during link up.
>
> Here we are talking about the PCS ANEBNABLE, not the PHY ANEBNABLE. So
> this is negotiation between the PCS and the PHY.
>
> > Preserving the bit during link up allows the system to work as expected.
>
> >  	int ret;
> >
> >  	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
> >  		return;
>
> Think about this.
>
> >  	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> > -			 mii_bmcr_encode_fixed(speed, duplex));
> > +			 mii_bmcr_encode_fixed(speed, duplex) | an_enable);
>
> And mii_bmcr_encode_fixed().

Thanks for highlighting that... and for being gentle with the clue
stick!

This patch will be gone the next time this patchset is published and
I'll get the phylink configured properly.


Daniel.
