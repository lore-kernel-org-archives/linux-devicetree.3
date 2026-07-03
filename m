Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1B82E22B5
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783094742; cv=none; b=sKlgkSZ9ohSZy5Gf2b5kpeRn50e79spdx6Lzm5rXP8kxVDsPERzt64hcdo1y3OFxUn4yFGc1/3oM+PaRGE8NS2p0xjjceVhHXd+KmMrBd0Ph6l2/C6gIXxvatqsiSz+Rv+2944lFrTuLCeqeUnqTWwYhMYDrYYrVNrPcOb8d8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783094742; c=relaxed/simple;
	bh=nxkcFikcEeVEtozP6ZBj6n7TjnOotZnihpA5wQ6V/A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egYnm3gbm8vwiP9p/69FcSATwlKhLL3OMA2DnfKrhAR+bllZZCGPOGDNinXXHo6B88u10kdA9dk0Dgbh2Bi4eGwUA0GJlzV5RH/7yNaxVfyQXGeEMrFQEpyndyXp0srp3TaHxnub3kWnUacsobkcwLHL4R5AqstBe4WRredZRco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSVjO4NA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSVjO4NA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47122683cf3so519994f8f.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783094736; x=1783699536; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uoqOq6Ohkp4UDA6vDyVnbIPla9jVgl3DiZga84x8Hms=;
        b=sSVjO4NAjiUSGh3cYeL5dK8KpgFbzmWFpjbB6UcxF7y+hi3RegBusl1G8gdICP4bSC
         3UFVj11L0lpTEuFpyr9A7tG/lGH+eTlcah0vhcLml962VuMCQxpN57DXx+2WzxPPqrwt
         pPW5d6qp36llmWs1FzlYQ4OvcHu14vV1Wzd5cco78mrSCOXMU8KFVYvalXW4zqRiHjFP
         yz1pjd7TYWqwDmvnvuPDTa0HUbQYuRKfwBxT8DtlmIUjbtTHUmP9kP144Pqp4MbLFzIE
         B5X1piInPaPt1884oZ3XRsKSy4nK3cm0X96J0dv3zNbFFlg7bKCOFSzG0QwJ3wW8TtSu
         Ufag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783094736; x=1783699536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uoqOq6Ohkp4UDA6vDyVnbIPla9jVgl3DiZga84x8Hms=;
        b=Z8n9wJ0mCRH7bNVAFGs2mhnyj572Z2TGZ1zFR6xo4idaBxTuAXffG30qYaFRuXwy2I
         yH/KO4SmrKU65hEZjGfAnoHk92SqTMwnTYhzYbINLn1OX2QIj4I6CUgCjMKRfOXyTqKF
         5aEmVOmY5JbIIzCccvZ0T/ycFIB4Y0XLNxHR4Y70I2L9d9rBYkJkmlgWyDo52nR4xIY8
         l6L/1xH+OyomvnR20+RTxgmWEE61kc2ISnlEcI+5eKMfPbNLHkgb//jonFTjd8IV0Hxu
         WZtNOglwPCYgEwN2gYjM+aUar1vBdaz58Yy1CJLTnSgQV20l8/msAA+6c+1cvne3OPVP
         df4A==
X-Gm-Message-State: AOJu0YxpxmYglAr1LaDrHjrOFMoEb/eIJYsu7I9yomv6d3EnQTL7nTz4
	T1uDhDqyE9fhwD82yqfM8XlCC9gPV2pLBqrBjjhZOtKbTUc4HG9umYSL
X-Gm-Gg: AfdE7cniks4kd5Bgw/4+O8HTLxlMephJkRik7yw6EPkEZ8V1G4P7BNP/s19GM3fST2E
	WsSSPNbD7dRTRmzf/htlrI+w0dHXCXnfenMcdwwfrXkX/YE7IyRnxdLULCZCJ//WlGCshv08KN1
	eoot/M2fsrjiXEGmmgyJYzBm5mUhH4HWjChI3bIWbQHP9g60VxB1DkjUjMxfbimFzfHsgQjhuWF
	n2c4SKxgGSW2ldXwt8yClvrXSp8zBEBgkQzgb1YdheglSKwq1R+kerAzz0pQELGIQ+qLxrDj//+
	vix6V2i2d43khknlWDk91YaSsiDdgjslq9SJl2pLj8w1OHEBEpVO8ZO4E8A06MXC/yO2nSSTF92
	kh2B/Xfm1lzQCBLUhj8NzWEVR+IrZyH2Ae7lPLXIEOSy66UOIIWDQQqd/H3emkQWDiGJHsL1/MM
	cXTMHelzCivZR4CVAzWjOdc925yf8GIYMFTawx4V5AhM73RpXbGamfFXx7f26gNiMw9XPGPuEAk
	0AwovkASh6HEvsxAOyrvvBwpB510mNYl58nNToaMe/8
X-Received: by 2002:adf:e00b:0:20b0:477:47c6:36e5 with SMTP id ffacd0b85a97d-47758cbf3c6mr11636302f8f.25.1783094735669;
        Fri, 03 Jul 2026 09:05:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm316945f8f.32.2026.07.03.09.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:05:35 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:05:32 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org,
	robh@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx9-var-dart-sonata: fix
 Ethernet PHY configuration
Message-ID: <akfdzMdw56G0A3UU@Lord-Beerus.station>
References: <20260703152731.236793-1-stefano.r@variscite.com>
 <20260703154139.8AF511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703154139.8AF511F000E9@smtp.kernel.org>

Hi,

On Fri, Jul 03, 2026 at 03:41:38PM +0000, sashiko-bot@kernel.org wrote:

> > +		regulator-always-on;
> > +	};
> [ ... ]
> > @@ -139,9 +150,6 @@ mdio {
> >  		ethphy1: ethernet-phy@1 {
> >  			compatible = "ethernet-phy-ieee802.3-c22";
> >  			reg = <1>;
> 
> [Severity: High]
> Since the explicitly linked reset-gpios property was removed below, shouldn't
> there be a corresponding phy-supply = <&reg_phy1_supply>; link here to maintain
> the device link dependency?
> 
> Without this link, fw_devlink no longer sees any dependency between the
> Ethernet subsystem and the GPIO expander. Could the MAC driver probe and scan
> the MDIO bus before the I2C GPIO expander (pca6408_2) and the new always-on
> regulator are initialized, resulting in get_phy_device() failing with -ENODEV?

I did try modelling this GPIO as a PHY supply using phy-supply, but
that configuration does not work correctly on these boards.
The PHY is still not detected reliably during boot.

> [Severity: Medium]
> Does this same reduction to a 10ms startup delay also risk initialization
> failure here?
> 

the startup-delay-us value is intentionally set to 10 ms.
This delay reflects the enable timing of the board-level signal and is
not intended to match the previous reset-deassert-us delay, as the
signal is no longer being used as a reset.

> > +		regulator-always-on;
> > +	};
> [ ... ]
> > @@ -180,9 +191,6 @@ mdio {
> >  		ethphy1: ethernet-phy@1 {
> >  			compatible = "ethernet-phy-ieee802.3-c22";
> >  			reg = <1>;
> 
> [Severity: High]
> Does this node also need a phy-supply = <&reg_phy1_supply>; property to prevent
> the probe race condition described above?

I did try modelling this GPIO as a PHY supply using phy-supply, but
that configuration does not work correctly on these boards.
The PHY is still not detected reliably during boot.

> 
> > -			reset-assert-us = <15000>;
> > -			reset-deassert-us = <100000>;
> > -			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> >  
> >  			leds {
> >  				#address-cells = <1>;
> [ ... ]
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> > index 7a58ad38ffb46..ccf7e77016e48 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> [ ... ]
> > @@ -346,9 +346,6 @@ &netc_emdio {
> >  	ethphy1: ethernet-phy@1 {
> >  		compatible = "ethernet-phy-ieee802.3-c22";
> >  		reg = <1>;
> 
> [Severity: High]
> Does this PHY node also require a phy-supply property to maintain its
> dependency ordering after the reset-gpios removal?
> 

I did try modelling this GPIO as a PHY supply using phy-supply, but
that configuration does not work correctly on these boards.
The PHY is still not detected reliably during boot.

> > -		reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> > -		reset-assert-us = <10000>;
> > -		reset-deassert-us = <100000>;
> >  
> >  		leds {
> >  			#address-cells = <1>;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260703152731.236793-1-stefano.r@variscite.com?part=1
