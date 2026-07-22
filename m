Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9423B4E8F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712457; cv=none; b=BPg4QzaU7+kTL1yrtgALAgsZZW4FemRzxTDesrHssEPNtVNF6U2kIzYg91ZxVZZcrylc1HY0I333Dg5fu72YVFH4hnobT4OzQ7t+K2V0Jyr1SfC9vmKLWTsxmpxAHv9qydRqhLcMeSQ09B3gXbw1Icc+70K9zkcSWSTEF2g/9yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712457; c=relaxed/simple;
	bh=aR/8udB1OlDt7n9BzDaDVl6vLg49c0i4wm7eL+Txmw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSG7yZCWIdSrF/pr0UXToggfdIWewzDyJnJBXXcH9mT5QS799AeAhEr5LuLB4EKjIPrbqPc/43/GCRMv+ZirUA+sisBomizTObVElFxWle8bOcM5PNwLvvUH5QTZ/4IfPOybS8TbuVFQgMVzrsy2oxvqn13tIZghxk/zUWEwrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCUmDAf8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCUmDAf8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954aff6088so33688885e9.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784712454; x=1785317254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UxNgVJhMvwFWg/2Me6o/CdOE7h6LMTECv+bVDJcfX3U=;
        b=fCUmDAf8lExaKoK68YORZFAXsw2gpv1lk2aJsXNxOxETwImeXZUPCVPIpJFpJqHx8t
         FazabtDRMU2Zcd9nDeoyd0UuuOyDLLJMCJsGD1nfEx2cIbFkxaSXezyxnLTxuxGdo1z8
         vxunulo2S7WGL6Q0YhIYsN6xdyebols7U5ETMgn9oD7krv7/+F2lMv3c/n3QTxwzaoIY
         tiWSfGubMnA49g712CFnZtGeFtAHuO7nTAE01FJs9EGj2r3mi5cfitRlPy1+RM4fzATA
         niLIM4p8Zz788nQmlsQOtEarq5uEvpqQ+02apTG31L3et3pqyp7ZR/BtRB4nmWxxpZRi
         eCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712454; x=1785317254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxNgVJhMvwFWg/2Me6o/CdOE7h6LMTECv+bVDJcfX3U=;
        b=PPt3TiUg2AjSozk8Lp2efm3IdcFaxouyFTwdp30Ex+B7y12MF3qRXJJTvDNf0IHzaG
         Ls0qhYxyqXKSBfwwCKvgZLAwxX8lS9GvSqyC5X8kqLR0Z9vrQeURcQ6kGrJCCnTul8l4
         vEs7T2VC3wj6FA0BHuw21zg09z+dtY7mkRCB8CJKu2aNtNjnptUhPPjgEABjsBP/iQ6x
         9YUAY1Y7J/MXPoP9KJtefE+9R7qpiBawXfR7f9W3JjyEB1o+Lv+D5T65XuUqjj+a8ovg
         t2pz+7H+XWhLiFuZkaTYT25IpY2Wom2h76wXva9t46RNdUzjel4XzBFB13tk0XxkerA2
         fdPA==
X-Forwarded-Encrypted: i=1; AHgh+RrIteku9vtiYWnkClgpWTF9LYNZOKaIn0mTz7sUY0R3GeG1174EZVZreYMGTMra2r/hsK5YLF/qlMCM@vger.kernel.org
X-Gm-Message-State: AOJu0YygPBOPEB8fVG+DotVQt6MtG19y8R5xH8hF8m+kLnI0HS8e7sNm
	OjHOs4oUjZn8RLYIvukht7eA93LZK664HNa5N1M+KIVLq8/J5UAOve4A
X-Gm-Gg: AR+sD104zvnW9DIeMapB0yHtTHwr7jwLp2DpsPqW6bSX7xiqe9OLyThgqXkWTrPekYs
	x0eeqZ+LENMKBdu1x7m2jvlgyc6BhOKCHmgkN+Ck63Uk58Rr0+VoCy+gFQOsQ51QSicbRLlqWLK
	dwu7admzpPHvy6WrY3PA93TMD25wkqOnzI6ZkkR6YjPDyj6J2nLmW1zyONR11nsJnFxr5jfLxNM
	DORuwFAWFEl0ELeHB4cnqH4TGUyro+yVHu91Jw0VzSZCG/sVXcFLJeOqT91H1UvMklpPmoiWi8B
	9Ze6unuoUSBML98vN1nzqYQZXHTcsNfRw/DWZ5n3dHxczH15I32rO70g4xhD/IsxiMtK12EMka8
	iAgKR0jzQJp1Hsvtf7JHe/AakNfSy2xkCctRdhmSEr1uBPUiZjwwUNaiKyD1GldAgeYuoTT6cwW
	I9NzcDxYRGZsgriK67EFJ0PGE5pHtUmVl5Abr96swgWvZX8LnT4d2r3EdWk3oZEOx1tKTyb2T71
	s585g==
X-Received: by 2002:a05:600c:350f:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4954a3db7e8mr245764085e9.11.1784712453569;
        Wed, 22 Jul 2026 02:27:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4f2453sm59985695e9.3.2026.07.22.02.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:27:33 -0700 (PDT)
Date: Wed, 22 Jul 2026 11:27:32 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>

On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> >
> > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > camera module.
> >
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> >  4 files changed, 119 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index c465aa19e526..ed3d678e7c5e 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -189,6 +189,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640-24mhz.dtbo
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640.dtbo
> 
> Need not add dtbo here,
> 
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb can
> auto dtbo build dtbo.
> 
> check other dtbo.
> 
> Frank
> 

Hi Frank,

Thanks for the review.

Our desire is that these dtbo's are standalone targets that are shipped
for runtime overlay application. Users might, on dev boards especially,
want to enable or disable any combination of these overlays, and change
the combination between boots.

The combined dtb targets validate the overlay and in some listed cases,
provide a ready-to-use combo. They are not intended to cover all
possible use-cases.

My understanding is that indeed a dtb-y targeting a combined DTB will
build the prerequisite dtbo, but it would not be an install target.

Kind regards,
Ernest

