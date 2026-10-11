Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30FA369D6A
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791754937; cv=none; b=GWsNbu/Sgz3og001TDCT5NmfsRpeQXKd5fu9tLKN8+G78A8pPrYr91f7bx+wuXDW1j7UI8PoD12F+c0T9fBS0OgCI5z9JSBrZ1OIOhb6eNprY0N0wksRD0Zekvh7jRE5NkJ87kOi9DcFcjp/BxlsCEBW9zm9svLSiQGB98rr5Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791754937; c=relaxed/simple;
	bh=k43IbaF6TdU+8O/x/tfa/3tzN+/gA6OynfUGsXVIY2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPN8HcnJ8evK0SZ715TaDdH8oiRdOC8tftzTqEPeKcdy1OToPjzeDq2cp0LGJ1uhsno65wwxwU1rLueysT7xew7N9/fbfd/Nm/6APr4QIDCRcuatQA2jdEuDTjfcVbgWy6XAvM0MLQgQiX66h2ay4KF2VzWoJSFLcIkR82mVW74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDTsRQJ1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDTsRQJ1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b060ec084so687885f8f.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791754933; x=1792359733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5CIZCQrM8vHqdGBQkpWsSJmLyDFs444j3c0Qt3YBk8=;
        b=SDTsRQJ1gzYJtVm0T+tbopbJ1Xn8mnat0z71N3dJnDn+SjKujqqK5G9rZ9ZSt3KZSO
         vspPsMBH2Akrb2Dh8Ggrm4kbPGFYgOujRAvMIUatOaApJxpEGrqvYbjA3K7PrCFaoYWg
         aMLv5giOphfRIimt5cL3/EQoSL403APGJ7IA/PPZD1vDxkcY5yFiHZFZ/iXRgLTtRJPg
         uEe0kKo0QW3tyrGFtxvgL16eGsCpVxFkXVLEFdwJ8Qq8w2O2c1lqdeC6Ch19qI6aV8YN
         pYi6NR5Sm+X+VL80lqQKJ0l7D9yKNVjn6HXzNqwQFd3tZts2F4gT/jzqIsn8gnc2xvfM
         +Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791754933; x=1792359733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5CIZCQrM8vHqdGBQkpWsSJmLyDFs444j3c0Qt3YBk8=;
        b=P9xik4oiweGZmX3QgtVWe4d+cXrOOgCFAVQrTDmZd+2kyB+7lkzH81YFsJrmf/+8eD
         MkgoZnU3WPw8Acc3YX6cR24gbvw2XgGe5avpRIXFwBELicHyKYx499CJEKhmS+GOcbxU
         wk3l3QROjx5e0JCOpNgJNG7tybD7ZZKd2QCW8PkAaz3aoS+n7S4GkR03xJw049zRceYK
         DPcxU4iCw9F6Hy6JP53ZlTs4GBlMWjhbt9cP8TZVvghpyXmlL49yHw0yS+bJr6/Ff+yA
         4BCrsC7HTisIconohkUZ9ocMIqrnqF8X/ZVP1dmZfGnDxNpX8EgePDZQtE9m5FYTw83U
         orGQ==
X-Gm-Message-State: AFq9FYL3CpGHSb0Rukcbk4TRdYMIaNWGWGFjA4xYNUTs3B6KLz1KhjPn
	Iwwqo3nf2BgzIfPX7nCPq7NxL42RktaYqbVLbBYo82chrOwruYcT7O8HqQMVfw==
X-Gm-Gg: AYBFou0AXVtRuad0zv4YXpr8G4UavraxAPB1DvIlawBGL/h0Z3MpomoWjLkxcaLB14O
	2x55DMARk/oMvwyms1SlWJFlGqbLI/zqbJ6108gwt5vj5mCr/RllCZ2OEqG+kuhZw+Y7RNfzF5+
	8gUS0PwR+k1wUSUv/+kMSSXygpjcSOpTo6n/g49n7JThOdTcz1Nj9j+MDQ+paOwSIdYMtBvjhU6
	PUs43UNO4gxzAQl8amOuWvQqAoyMRGj6VJRnTMin39ILhsJZSfFWYA9xJZiKd+w83fOe8ai4L+j
	M/GKbAzkRcYJHhwNSFbloj7KvUN1jJw5NlTgthDxHpIw3pueaNRnmGuK0P8MBmR+9MPKnO5enWU
	o+vvTt4daTPd9PlWsfKu2KDjz85iMk4oIBb2ucKxXcSeGerQSv1xg9zR8G50aHXDztc2Lw0lw8y
	Bf7f3UwnicUsFgvYWTjiNb0v9X9w1E03torJVWJ4un2eZErFSMMFYSYrWTI06yNluJEoiKsTmcz
	tEJWLdKYWbYp1OuCSPkfaTcdcRGBb5bsn7NeqC0IoYrpUR+peH/P4tbsWohI3ugDOeKjYRHbGmL
	dD4FPm1LDxBewpZar/FRcM8pK7WN
X-Received: by 2002:a05:600c:8184:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a18e4d854cmr109941355e9.31.1791754932570;
        Sun, 11 Oct 2026 14:42:12 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm451871005e9.9.2026.10.11.14.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 14:42:09 -0700 (PDT)
Date: Sun, 11 Oct 2026 23:42:06 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH v5 06/13] ARM: dts: imx6ul: Extend VAR-SOM-6UL and add
 DART-6UL files
Message-ID: <aswCrsVs4Z7n864c@Lord-Beerus.station>
References: <cover.1791487179.git.stefano.r@variscite.com>
 <e11cdc950e41b502e5449830d5f6a82568fc043a.1791487179.git.stefano.r@variscite.com>
 <sashiko-outbox-166012@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-166012@kernel.org>

On Fri, Oct 09, 2026 at 07:49:24PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: net: micrel: boolean property assigned integer value <1>
> --
> 
> commit 7e70ac71fa47849af4ee0ecb85b6da2be68dfac5
> Author: Stefano Radaelli <stefano.r@variscite.com>
> 
> ARM: dts: imx6ul: Extend VAR-SOM-6UL and add DART-6UL files
> 
> Add the DART-6UL module description and wrappers for i.MX6UL,
> i.MX6ULL and i.MX6ULZ, plus an i.MX6ULZ wrapper for VAR-SOM-6UL.
> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
> > new file mode 100644
> > index 0000000000000..f7190f6d50b59
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
> 
> [ ... ]
> 
> > +&fec1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_mdio>;
> > +	phy-mode = "rmii";
> > +	phy-handle = <&ethphy0>;
> > +	status = "okay";
> > +
> > +	mdio {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethphy0: ethernet-phy@1 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <1>;
> > +			clocks = <&rmii_ref_clk>;
> > +			clock-names = "rmii-ref";
> > +			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <10000>;
> > +			reset-deassert-us = <100000>;
> > +			micrel,rmii-reference-clock-select-25-mhz = <1>;
> 
> [Severity: Low]
> Does this assignment cause a dtbs_check schema violation?
> 
> The micrel,rmii-reference-clock-select-25-mhz property is defined as a boolean
> in the dt-binding schema. Assigning it an integer value like <1> will trigger
> a warning during Device Tree compile validation.
> 
> Could this be specified simply by its presence without an assigned value,
> such as: micrel,rmii-reference-clock-select-25-mhz; ?

This is addressed by the preceding patches in this series.
Patch 05/13 changes this property from a boolean to enum: [1]
to satisfy the dt-schema unit checks for the -mhz suffix.
Patch 04/13 updates the driver to use of_property_present(),
accepting both the existing empty form and the numeric form
without changing the clock selection.

The <1> assignment here is intentional and matches the updated
binding.

Stefano
