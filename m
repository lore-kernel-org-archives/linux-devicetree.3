Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F0E4EBAD1
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452564; cv=none; b=kY2gBoY4b+oyCR7xE/KCrjF/EklXiW37ePHTaucPH711jjv4xB1kPN97d/CVaHU2h4ORs6Spx3PCiwfBNiix3II0NndwAIHlt+LtAiC7UamwvSWx/8f239eBbA6aGw8JmS7TitlEuYUsYHbKe14Y8/HyVCeFlySyWO0VQp1G4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452564; c=relaxed/simple;
	bh=3XggkU1o03ysU4nezevLZDbtm2BbkFAs7cgJg9nFcPI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6vTXFE3TM+jynSSsj5pFjs2z2p7lw57FGkU8I3zzW0TlbuC648yDXcDEnu8jt9VTj1ek1tA9QrY1F7XgQKQWDgjYKZqPMljoX/JTXy65FAUJKWbp7iEFRNAlVTp2htOSuMPLiVu4F57KnURvcTG+f0GVXsQxEPHAgh+4zbbtrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AcfzbWys; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AcfzbWys"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so670915e9.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788452561; x=1789057361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NbQ9UdREJ/WWisdiQ1Got7ahhLovVEcdSUeHC5P/jK8=;
        b=AcfzbWyseWTKtzilxUnHmGGh2WdrbK25F6/b9aR6WF39v/5s7j+fkBrG91wSoiQ2vs
         NUcAosTNkOQKpbMt6+jd8ZUDZKAeco8eyu6wYmVktox1CPtnSMCu8HEF6TZwQL0CWiKn
         i9z8W5WUXDzoO9e7VU5nEkKljlN4IUK5OFwzXgMEFp74sSzGzqjOdmyVD+/HtfINzz+O
         gTCfS/QxZgNdnN2+rOXGVxCt1EwZ8p94Pc34VFnIyzvmyL2Jj+AItllwrKVUX/VH58Vd
         HqwISUxnaGTgSf4rRPZoARL/9DdaQRm/TwCRQnIthrtIqRqwuEL+bWd19agFf/xU/Q3h
         +7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452561; x=1789057361;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbQ9UdREJ/WWisdiQ1Got7ahhLovVEcdSUeHC5P/jK8=;
        b=TOmOvqSc/J6ER8pgSghb07i/ygjOEli961ykXsrm8f8izqzmxpQxcSXpMDclH289V7
         /cSIk4d+uWvx7AaoWNLCao0b0b4jcPixJzJwGktQOD/v4ox83CpWsf384nZXwtcG1siA
         bNnq/ETroKXhI7rk/S4FFWFShvRpV0XyLSkFS2XI+9njOntaUTYoffKAvbdikspg0vFQ
         tIdrRjLhSR77vANJeaw4h+xagYPSOU+Vjse5ib8Fyk4xWVt9NyR6Ylwi7kTL31sH27Gb
         Rx+wxgGaUXTXHiCvFP2uZsx0TbNpXU7+zl24djfUna7Je2r2tMgz/MtrZqfRDNWRpzB/
         ZBtw==
X-Forwarded-Encrypted: i=1; AKwUvBxAOJIeWKMfTfjBuNvx7fJTdJ5dvP9duGHd3+bo2hnPSxS+Eho0u5mZ5W2qJUyILBn6aW6pZ0rOJ/jv@vger.kernel.org
X-Gm-Message-State: AFuF++kyNY6xO6yF7iKKxLZ8kzds9nPgMSfFSNngyVS1ySSuxqj2jlmD
	zdqp9qf8vT5GdhvrI/2SI1C0u0OqHgVlLwz0lTF9Jma3hH1/kvnObyqBvpl1Cp1oOSc=
X-Gm-Gg: AYBFou0AHibiVXLT3YqIrK6fAf6hzijuVCaG2J5YVoiaWoNJQp6gw1WnUM7r3g0qJ+X
	eymTne8gQLFr9n65h5T7IBnHktBIupt9rzKcV6k9WmSGBL+pXhAGFG2B7VnU19y6xheVvxYJGsB
	LX13IKwE5KqJufuYH/HyfXy09IBpUGiXzJPSTzo9jm9ABoAfySr+/Dnd5Mnuv/VrhIqsjFcJJrc
	5btJ2Hv6a9NdjgvJxJH6lo9e1ME+eQKp7p3qwqz+ncreUTHII1i0mWCKmcYTBoHRrHmXxxNmbzL
	PpqtOCmc+vDb7GnDbBZEj9bEYXvuuYXAhT6KK/JFgdx/I/tUdSCHj52sGNM/UoAbGSBqTq9ALHX
	gq5Jz/Cv4u3A1R6m5bmS8q+VXBIQiKDkLP3OfUL7ep2RTiYT18bEhDvw7tn5hHH4jKOGdj1CTkg
	Wy2m5QN4dHRGfi6Ty5O1bJg6dwaejS1mLAbypLjbPTovn5wujxeFsBoWP0zHZqH/+eRbWp
X-Received: by 2002:a05:600c:5309:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf5bd3418mr25301905e9.10.1788452560717;
        Thu, 03 Sep 2026 09:22:40 -0700 (PDT)
Received: from localhost ([194.183.24.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm110440525e9.4.2026.09.03.09.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:22:40 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 3 Sep 2026 18:26:19 +0200
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
Message-ID: <apmfqyeWahoR0wab@apocalypse>
References: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
 <20260811-bcm2712-spi-v1-2-4c1708d354bb@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-bcm2712-spi-v1-2-4c1708d354bb@linutronix.de>

Hi Gregor,

On 18:04 Tue 11 Aug     , Gregor Herburger wrote:
> The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
> Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
> the spi interface.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 0fc57e72632ed..81aec81c5ce12 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -69,6 +69,14 @@ usb_vbus_default_state: usb-vbus-default-state {
>  		groups = "vbus1";
>  	};
>  
> +	rp1_spi0_default_state: rp1-spi0-default-state {
> +		function = "spi0";
> +		groups = "spi0";
> +		bias-disable;
> +		drive-strength = <12>;
> +		slew-rate = <1>;
> +	};
> +
>  	rp1_i2c4_default_state: rp1-i2c4-default-state {
>  		function = "i2c4";
>  		groups = "i2c4_2";
> @@ -94,6 +102,14 @@ &rp1_i2c6 {
>  	pinctrl-names = "default";
>  };
>  
> +&rp1_spi0 {
> +	pinctrl-0 = <&rp1_spi0_default_state>;

Is there any reason to avoid defining the CS pins as pulled-up gpios
in the rp1_gpio node and then referencing it in pinctrl-0?
Something like thie following:

rp1_spi0_cs_default_state: rp1-spi0-cs-default-state {
	function = "gpio";
	pins = "gpio7", "gpio8";
	bias-pull-up;
};

&rp1_spi0 {
	...
	pinctrl-0 = <&rp1_spi0_default_state &rp1_spi0_cs_default_state>;
	...
};


Many thanks,
Andrea

> +	pinctrl-names = "default";
> +
> +	num-cs = <2>;
> +	cs-gpios = <&rp1_gpio 8 GPIO_ACTIVE_LOW &rp1_gpio 7 GPIO_ACTIVE_LOW>;
> +};
> +
>  &rp1_usb0 {
>  	pinctrl-0 = <&usb_vbus_default_state>;
>  	pinctrl-names = "default";
> 
> -- 
> 2.47.3
> 
