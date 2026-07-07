Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281CF3EDAA2
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430964; cv=none; b=UAndJtt+CoZyFud7v8oyv0AcM1xBzl5/3JFcF2hD+H8Flkh3UI5BvPWJmcGBBSw49509zeqYxT2GBPEQ1oN/l0wStdb5VCTy0+zwxebjrU2A4VpmBwVnTcC6XQpG8q9t9mP7VQcGgheYZyZLgLfSoyvXQHf0Q1E2SHXqW/kF1eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430964; c=relaxed/simple;
	bh=dSWgcEVqn96YNXIDhps5X6Ob0cQ6Yr4ZQ8+nRr7zu7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U25CsyRtP/948Z0ybsAJdTJUPGBk4tWCFzze+QPOoK0QmDo9B8Jb9tY+dtiZ8JHv3iMgpMCfW/SzAfdSOH8PpmLikmFYegPdtSJLkB++LrYaknPP8WkhQ0ig2gpNA4MnLhBO9uG7aUVK8Lug/TuaJq3Y4TAotfjp4pDMxbTPfJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ygja7vV6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ygja7vV6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4758bd3731bso562832f8f.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783430961; x=1784035761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4adAtmWIIeDRmlqxSvfydtiZtPinCJztXXi755Yp48=;
        b=Ygja7vV6t4IUrpOdDmQ62Ut5J/HjQexCf2+UpUHrKUu5VBpidcnFDwkEciwN0L5MNs
         Bbcck38ZgrouAjzm7yOmzDqv5xcnvg8jjf875xoCIF9x6wm/9aOrBpfMPVi2AwL3CKg6
         QZo1OT3y/USShbm3mMLBGhPqMF2iWcl1+rd/l68dhjVxf7oxQB6vIVzLT2zOEbFwYvqg
         S1+qGw0NZDWGVh4hFQVPCIjcELnuoTybV5k7kznS6Q91kCGLxf7IISdeyQx1onJq1gkD
         YtjiaxZc6yMkv1CDxbT+JCAd+tIKPLCMIdeTPL9bkjQkRspQRVMFy8FicNIKPIpHEtXL
         PSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430961; x=1784035761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4adAtmWIIeDRmlqxSvfydtiZtPinCJztXXi755Yp48=;
        b=iSXgyumj7uPEMfA1ZrVD/x58qbIBfQpTM7C4P818HgymVVI6WR3RgdsEoS13PscTej
         ZI7iWygFdGU4vBP+PXYvdnAyVs+xEgED1Y5j4l0r2Czt5jMj6RXpbVxS8MEllBvlkbhv
         b0hS07NyXfN1em/m+4BeYLfGCXft/cev6lu4f4mytAAUUsWDvM0Mznwl49E/pEEzz6Px
         jP2MpFDGvzTFBidC2qzOrwTlwhSEVJTbDQCNyf21s8keZ+KJKPhH9XhJCQ8wvcXCDmYW
         a2swFsqxGtILdPllbVSXnupN7tXP6l3nc+qVFNhA/1/vPPz+lkJI0URtq0+K+9yV5P5P
         joTg==
X-Forwarded-Encrypted: i=1; AHgh+RqN7Ntr6PCRWAc5So1GOB5WoQQBsi0J3giSkALk8I9ucIUmBFAxR0BGwtAivpVUJWHGijTlujoOnSj2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl3OZ+ibYZKPI13NaP5cMXDXerzTeSHANY9W+f1lFVT9LRgknC
	QubYZhEOpviUeWEYzRMEw8zNzTieSu1BxQZX4NFz0UPOM64a0M7/h9r9
X-Gm-Gg: AfdE7cn5UVFfoq5aYYiJB1r4URFwMAADPqdpnJau4IKEDpoyeZ9O5xoXaJZpt0LSq87
	NNknuRJz3w7Qz2SkUN+Crykb04TodZWdse0H+Hx0SRFTpqH27eIDqR3RCg4NJVZPIWSKXULyWyZ
	TNotw33hRX4NeHksqt1My1XTgNc+EuKvBWb6lA7soyqQruGBk2jio4K3G5Z1oDTwKXdlgRDHcrf
	YgdWAr+oVGyMpT6pBm0hJqG1ZRNE/bk/DCKoRr6/hf8W9LOaYX+JOlvXkcHvdYlJtSvG9pMjet5
	1XyurhTEemfiycCaT4trobX6aI/c6WOuylc5kEDqcCo+aGq9hpPLxw4cyMS1Ulz2L5re00eitMS
	RzQHOzjmHWYJlgJkIVgBModCV4hGLgtmQ6boSWGJFVgvN7m14Esai5KGIfXeATApEX6JCcULJMR
	3Sy+MeBzY4x1JratAHNJqVA0sA/j/Xc8bJAkIq4OZbjcPiCzePyl/zDCy6j7g7qaZCjy2emxnfe
	XzIXnerXGbuKHONrrQAB7FS5y/g+aOjRw==
X-Received: by 2002:a05:6000:41ea:b0:475:f0c2:75b3 with SMTP id ffacd0b85a97d-47de9a415e6mr3180060f8f.30.1783430961279;
        Tue, 07 Jul 2026 06:29:21 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm33030923f8f.14.2026.07.07.06.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:29:20 -0700 (PDT)
Date: Tue, 7 Jul 2026 15:29:18 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add
 support for WM8904 audio codec
Message-ID: <akz_Lr1bRSEE5rhC@Lord-Beerus.station>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
 <20260706100948.DDA391F000E9@smtp.kernel.org>
 <akvC8UV5N6Tpk0_h@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akvC8UV5N6Tpk0_h@SMW015318>

Hi Frank,

On Mon, Jul 06, 2026 at 10:00:01AM -0500, Frank Li wrote:
> On Mon, Jul 06, 2026 at 10:09:47AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The `simple-audio-card,routing` property maps `Microphone Jack` to `IN1L` and `IN1R` but omits the connection to the `MICBIAS` supply, which will leave standard electret microphones unpowered.
> > --
> >
> > commit 78e4da0f71f2e53ae4312cbe5ceecb0f6f2345db
> > Author: Stefano Radaelli <stefano.r@variscite.com>
> >
> > arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
> >
> > This commit adds support for the WM8904 audio codec on the VAR-SOM-MX8MN board.
> > It configures the device on the I2C bus, enables the SAI peripheral, and adds a
> > simple-audio-card sound node to expose the sound card to the system.
> >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> > > index 09146ab763858..e2e04ad2fbb65 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> >
> > [ ... ]
> >
> > > @@ -42,6 +50,34 @@ reg_phy_vddio: regulator-phy-vddio {
> > >  		regulator-min-microvolt = <1800000>;
> > >  		regulator-max-microvolt = <1800000>;
> > >  	};
> > > +
> > > +	sound {
> > > +		compatible = "simple-audio-card";
> > > +		simple-audio-card,bitclock-master = <&codec_dai>;
> > > +		simple-audio-card,format = "i2s";
> > > +		simple-audio-card,frame-master = <&codec_dai>;
> > > +		simple-audio-card,mclk-fs = <256>;
> > > +		simple-audio-card,name = "wm8904-audio";
> > > +		simple-audio-card,routing =
> > > +			"Headphone Jack", "HPOUTL",
> > > +			"Headphone Jack", "HPOUTR",
> > > +			"IN2L", "Line In Jack",
> > > +			"IN2R", "Line In Jack",
> > > +			"IN1L", "Microphone Jack",
> > > +			"IN1R", "Microphone Jack";
> > [Severity: Medium]
> > Will standard electret microphones remain unpowered with this routing?
> >
> > The routing maps "Microphone Jack" to "IN1L" and "IN1R", but omits a link to
> > the "MICBIAS" supply (e.g., "Microphone Jack", "MICBIAS"). Because "MICBIAS"
> > is defined as a DAPM supply widget in the codec driver, DAPM will not enable
> > it unless it has an explicit routing link connecting it to the active audio
> > path. This could leave the microphone without its required bias voltage when
> > recording.
> 
> Is this true?
> 
> Frank
> 

Thanks for pointing this out.

This audio routing is not new for this board. It follows the same WM8904
routing that we have been using on our other platforms for quite some
time, and we are not aware of any reported issues related to the
analogue microphone path.

If adding an explicit route to MICBIAS is indeed required by the
codec driver, then this would not be specific to this board but would
potentially apply to all of our WM8904-based platforms.

I'd prefer not to introduce this functional change as part of this DTS
alignment series without validating it across all affected platforms.
If needed, we can investigate the MICBIAS routing separately and
submit a dedicated fix covering all WM8904-based boards.

Thanks,
Stefano
