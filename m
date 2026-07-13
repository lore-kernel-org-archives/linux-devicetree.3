Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F28E17C203
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783904250; cv=none; b=LziDQi7ONSixHpLZ3OspgPTBh+CDB5dh9jGfJaL1wkiKqwtNcY8jp4D9o1ZDQx2RWPHcy+ZaNwbiqKhQxzoH/vsFU6l/DVDVLccHlNj09oCWZXU3x7h8L0vaRZywkqyUdLUPrzvuzR8ESQ+7RIp0a8NCI/7h14fWrYJUtnCG89U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783904250; c=relaxed/simple;
	bh=Xo6EyzqNrckhHCa4x6TirXmUCwy921YsGGy25SBUVdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S66+TOeQKdYnXc9WhUEvIf1NdN4ci5LUnrha/duLim9Rs8BxFOXQLzoRT2U0fmHPKHyNdBExNikePJUrzNjXKromtOePpUmECja2xZySl6ydQBmEClAqrqOfwWYiA6LSFCMZWdhxoNweyNamM5VSjzidFkL10aDZPmgZrnh8yzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKGDhHek; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKGDhHek"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad8076b01so30513875ad.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 17:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904247; x=1784509047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcAmTvO8VZf1EU8sxDKdiXNrU6FxGa8pq7WzxSsB/Lc=;
        b=XKGDhHekwxUZktoTz9KMZ50//hoS4zdPy+pxvVTov6A3jI4ne+s++zRR/Oqao51at0
         8u5y9+GGFcGWXjYyfW2UpO9ahbeSmTnd11uc5BTmD1I2XGLGHMEdpaVtCVwU7LTPJHwp
         c1SC/Ozs5+38Q3SCo4mtMWOEzEReKJ17CDSrxXJV6WS6paRMtUt4sFfPV02WOmshJYYJ
         cyOUEDSLkLk9lXeXp8/eMpX10kg3Zhq0+kh0KuwKTWeZPjp+nzp2nVJl2m7GaiHwkVPF
         9zcd3Yg4xu+Of28pLJb+1AdmZmJ6T28aKBKzJ8UetncGowvmhUnPc4XZWfLS3SHph7V/
         WFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904247; x=1784509047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcAmTvO8VZf1EU8sxDKdiXNrU6FxGa8pq7WzxSsB/Lc=;
        b=LCwr0tafc/hk/5O/7+XHzv1swDWTGJ66zylC/gPIcgz+yQu5yBRGKQ+FEpBziCU5Zl
         BbX/1U/wjrZ0m3lynKehy16iugh8MQ/NkkekCdvH3KtrMunJoeV7CCUb7Z31Yamqyue7
         PM5q9JxjiBuz0gW4yI0hce/bbKCkxiiBIPRP8MtWNMzeAscpVEBREZaPc0PWzCh0n2Ht
         M0h+4OhNK6JvmwacqreMC9pAy00IrqAuhg/86hOGZvOYP35SKCWa6liwGLSnn7Crwd7k
         yrceRBRRurKTAZGfG4tMKWF1EPPEWToC9kXZ8GWxNb1YCoCAknyfCH52t/+dCNDO85OC
         oqPw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1YSAMbNSEFWkSeAOwDSxaeElrVGtmg79/TYFEi/816ZK04HaFrjLlzStUPWQDJ88UkLkYqDZ2rbyb@vger.kernel.org
X-Gm-Message-State: AOJu0YwYV9aWjzl02a7tssO6LMMSEiYh/GEUThq459rwQhMKpO5G23FP
	2W9vQbxCCi/ByU0SZKGFcrg78Ot6E+R8a4XtfkCDA6qe45EPyBjydyTYqZD5ciM7JEc=
X-Gm-Gg: AfdE7cmqCZENPDDwiDKn/H1ycyGgHMc7ca0wfpOCXG6GZgpYEiF3X7JYnkGzXgebg7a
	u2xGaqH7SFcPdGSvwC+pVKAr2JCwtz8+fNbPq3po4joVQbSYjVyL0vj/WWd3vm2238y6JpMfOhG
	IVKU977RJgvymy0A+jUZCFTB6nyPZijVCDRvtx9NoZ+RG/yNCFuWdQE+7rBPP0Nqdw8Azocmvu3
	VSokQ0FgP5Weh5P1PqTA9Ul/iqMQbXYeIUu6f6dt+quuJlDo0Qi5WDTbkyVjaR/YQOk9FEIkLwr
	I8GFZQn0Pqqbnm1tkD9VP+GUofSAWOBjFK0t4g2jSPmMTIxeRgpnRLPnyXm54c9LK1HcXlgh1sS
	dfFIs8YwNWBhvgPJt4a3xgHwRT/D7gmW8RPD7mtdR71gmJzfgY/LsFv3ELaUrfZKn
X-Received: by 2002:a17:902:d2c8:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2ce9ead153emr69863775ad.20.1783904246723;
        Sun, 12 Jul 2026 17:57:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf92bfsm90539215ad.28.2026.07.12.17.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:57:26 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:56:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO
 controller
Message-ID: <alQ3mqUPItCP2CVT@inochi.infowork>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
 <20260710075917.159969-3-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710075917.159969-3-chenyou910331@gmail.com>

On Fri, Jul 10, 2026 at 03:59:16PM +0800, Chen-Yu Yeh wrote:
> The CV180x/CV181x family has an additional DesignWare APB GPIO
> controller (PWR_GPIO) located in the always-on power domain at
> 0x5021000. Add the node so that boards can reference GPIOs in this
> bank, such as status LEDs.
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> The base address and interrupt number match the vendor SDK device
> tree (cv181x_base_riscv.dtsi: gpio@05021000, PLIC interrupt 70,
> i.e. SOC_PERIPHERAL_IRQ(54)). Verified on Milk-V Duo 256M hardware
> via the onboard status LED on porte 2.
> 
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index 06b0ce5a2db7..25ad2bd265d7 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -160,6 +160,24 @@ portd: gpio-controller@0 {
>  			};
>  		};
>  
> +		gpio4: gpio@5021000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0x5021000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			porte: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +

You should follow the device address order. not by the device name.

>  		saradc: adc@30f0000 {
>  			compatible = "sophgo,cv1800b-saradc";
>  			reg = <0x030f0000 0x1000>;
> -- 
> 2.43.0
> 
