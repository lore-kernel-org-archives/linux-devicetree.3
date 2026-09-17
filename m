Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C9037E5D4
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610577; cv=none; b=qQjTZ6KIKYdmSj/01gIBYwenuD3Fwn+hHt6Y02tGwRqi8rXCwt+1mmeDOWFszMQS1A9oD7t19JoZ+CgPT+ZyCvyo5FPFnYOVXykcGHMCmGELpnGYxCbUaxw2PjGfqOk0rwRKzjwNXYx5BrvVMhIstZFjdu7spXe9MFITCmQoVTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610577; c=relaxed/simple;
	bh=b6wjZQ1RX/T/S/dEijbGBQbbX4WRTC8hJhLEfqq2hAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3iibWu2mTqHdpwp6xuzXt0B5nkd7YATeKZZ7KKCUCr5YoZpBd0VABgQqJHbs4UdKm1sVk9TjzG120vuvabLla4oT8xDylt0ydKdBpdU6PA49vxp58VKSvwzn9OGMLlngaELbtbU1+Uzk2Toc6gy4BWzIpT9OGEgXtKC6fTXDGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iatyy7Ia; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iatyy7Ia"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc515bef69dso146627a12.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 19:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789610575; x=1790215375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXMeRLzLYKk1dOekGjdx+ZqUH1z0s4dOYL9Yud176Xg=;
        b=iatyy7IagoJHp+93+mPMInbGpjmt78n0ou+hzbzuGb3mhO5m61sP2rrF1ZCt7M+7Uk
         nOGw33CScClXkTGIMc3026b7F8irTmQwFuxUP/lZ5gwnlwRS8MdMV/Rgk8y+0DYwP5uU
         nkI+llN4/qI4lWUbIvrZ7GRNqtXJtVZo+jKaNfNaGP1Rx2rfKWLwvbLpdTLkrSHdF5JF
         9I41wfFSc3tAt/PnCZpq0915am3gX8dtkxiK4WGG3jTZRc3ubpaOA2EQl1jL4u1o/cyF
         q/WUy2lFGrcA50eFuTi2FaibZr5lkYCEX9GFWehuhmD2XWDb12vG8HjMfL1VnuKTOPcD
         hHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610575; x=1790215375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXMeRLzLYKk1dOekGjdx+ZqUH1z0s4dOYL9Yud176Xg=;
        b=Axn81Zj6J9Rqv+YcHiMvRYPI3CGMeiGZB8sDv30lpj8nG2JMOByb6v7OaIGJhbr1nA
         /O8Lfgm3ZBZ4mMxD/ITIcVxZmwSR+6Fg4iwwpP5EJDS30cQ5Oahk+pwcAojEvFBSMSie
         MYlH9cOB1qSm9+dlXltmqs6+D6CvPaOsK8nW++unMG/6p/VXK77mC+1UlhWRFLTPGCmK
         mQAP6Y5meatgR/Nx0bhYA7TeguXnckzP+VV7lizWDK2sVffUouU08nFdJYF1SMug5TQh
         FNarNuJW1nWeQvz+5DZMzxhywaH8X1WXOVSV2e0yFuylLkcmqtHbLIEqEii2x3IAwVaS
         FYmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdywNbltxT0dNZsurcEZzOOPDffFrFrWhicXVehBbwrWU3iwLVeLPhkNmU6Hj6ErHtf1tzteE8HK/i@vger.kernel.org
X-Gm-Message-State: AFuF++kwy7w3WDI3Bo0+Vy5er6/D1Pvh2+tyqknM1HxRNJXxGT9WMKsU
	jPls+4xUoUNNMaog1nMLu5c4rNI2Iow80IDBIuA4CafLbY97l378jBLO
X-Gm-Gg: AYBFou1XGcCAyIKiJknA6BliBehCE/cF1SryNgtrNrqt0RM6voGBNz3QN45PEIo8Bzn
	OZDZtyIh0oODxyt/RwhetBWNvAgr3FhV2Hhy1vt1TaFLY+TXPy6Nen2XjsRyMNWZSM3WrZYucNO
	YkxdNlbDrroLH1CVgGswIodj5HimdG5aX4uidAQMRITlVgGnqngCegS/wbuHRO4TECkrR8BWcA0
	TvADWQ1PulqkO+vcOFdwm3A2oR8VykuRtlJspJEaF7l3R6YlBL9Bk4uy7dph/MFrxRuAX2FRRkt
	7w5gLAw+5MsOZcTIZv5IQ+ot6AduxDJU7fHD2C2yXYNAP0n2rohxqnPu8XkkMAmZ8jGyHeFopce
	MT+9bAk2esipowm7ezQwxEFZBMYlQ5eiNBTmaxhE4kPtlbVN/UVbegiGthH48sWVb33Nq5TRpyq
	yCMP/9C2TBON6Qw51ErigFk2YSktyScbaI06b4QRdtyr7KfTtpUzLFP6K75UlHf5MBmby85AWTV
	dFV90j2
X-Received: by 2002:a17:90b:1641:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39e1e4d99d4mr10807662a91.18.1789610574914;
        Wed, 16 Sep 2026 19:02:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35dab2e9sm2345861a91.1.2026.09.16.19.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:02:54 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:02:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
Message-ID: <aqtKAuoVSCxcts52@inochi.infowork>
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
 <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>

On Wed, Sep 16, 2026 at 12:10:23PM -0500, Samuel Holland wrote:
> Hi Andrei,
> 
> On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
> > The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
> > Reserve this region to prevent Linux from using it.
> 
> If the FSBL wants to reserve some RAM, it should modify the devicetree at
> runtime to add that reservation. Adding the reservation here creates an
> unnecessary ABI surface between the FSBL and all consumers of the devicetree.
> 
> Regards,
> Samuel
> 

This is fair, and the fact is that the current fsbl can disable
coprocessor in its configuration. So I will not take this patch
and maybe do a cleanup for existed devicetree if I have enough
time for it.

Regards,
Inohci

> > Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > index 78a257839f6f..693c9fd7b771 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > @@ -22,6 +22,17 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  
> > +	reserved-memory {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		coprocessor_rtos: region@9fe00000 {
> > +			reg = <0x9fe00000 0x200000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> >  	wifi_pwrseq: wifi-pwrseq {
> >  		compatible = "mmc-pwrseq-simple";
> >  		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
> > 
> > ---
> > base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> > change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
> > 
> > Best regards,
> > --  
> > Andrei Lalaev <andrey.lalaev@gmail.com>
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
