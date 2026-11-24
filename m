Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512665;
	b=ns8VGlG2G8IrJ6s/zF3KIkTAAPdAhZdd7JA6VIQ5dirUfTJKSxeecBXw5HemcOaF1qRF
	 8OO3AuU9sicKtyamgm0nOODElcB1m6DsXD+80ISQodYoidEMFXoO0ZNkUol+tRB+/1y3Q
	 GG7Nep/z4EfUWA26FgRdwsvwt9A2jAeLr7ZRSPpmdCELtw60RbpWrqjXhNdF1GMiI4nI/
	 e8G+jDp1b4oY0wqeKOQ5s9oELGwCTkzwQGOiKyOTK3jW0nPIjOJ1+QhDXk9CEeOrnv5Rj
	 V+EB9wWz7QpC6+k91zRux0FlIbJsD0g8f/doyqFTuAMe75FfHp2O6KPWxhpdD330Z3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512665;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=imyZFS08/kI8TMFYUNmHJ21/sEomX2lbtjI8H1u7w74=;
	b=uNB1+wKSkddgHv7ZD0XMhtMrt1NFc480Gol/hYFBI3WN+PkxZ/roSZDClG6C1wMLDYoE
	 zOBWDE/L0HVEoodpBBJ9Mu9a+oBj8TuvyXx75RLtogzVP0r39DBfVuRqpgkA37Y1pfWZ/
	 l7jZjVNUoYXToEn+fcUSilgUMoqHYt9JZGYdlAVqlL5YslTE6rGsevy0Z2gCBIvAl4VNV
	 h2BVtTPeBC1OhE7WwpRp1FvOADY74ElGhDk7C2yOVMfMSgxcyJ4McEUdamh1OTCwKgQhE
	 +5nPMERtSZu9gTUgQ28OKXgyAs8b1fRI970NEugMoDfX8njYsXTrUU6A/rxs/5xnKRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=e5DycNuL;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDDE606A336;
	Tue, 24 Nov 2026 09:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BDDE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=e5DycNuL
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D01B10D89A;
	Tue, 24 Nov 2026 10:30:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795512652;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=imyZFS08/kI8TMFYUNmHJ21/sEomX2lbtjI8H1u7w74=;
	b=e5DycNuLi9zgkTT8fyyvQKpKBxIJ7O6F9LCKyKKF+K5pL1AeJH6S4Uvl6VWKi/Rf2TN9J3
	RfNo3q0PfD6biAHbrXIVXAB01hFUjQ1P5AOedFxNB8clAIzuRYl9H4pNoVTVy9gq2+Spjn
	rwgRJNTabNzLX+xx/V6YefwQq1fxAGqcAceY/HRb2K5o2BIox7hRUccM0385M7CN2Yogfv
	R/ztALu/KSsGevhng+Gp3iHQvyCMpMTzB5M52gjzHTU/UukFv0bVH8zsO0E9MSDNLsqjJK
	KLjHJ7qhLsIDtyEzc2cu0zLGKLsowBP5KGzN4K94FzXKIt7ls8092u5CyOhvBA==
Date: Tue, 24 Nov 2026 10:30:47 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Daniel Baluta
 <daniel.baluta@nxp.com>, Jonathan Cameron
 <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: imx8mm: Add Cloos CBASE support
Message-ID: <20261124103047.5dc56f82@wsk>
In-Reply-To: <awR-Al7YQMSSqt5J@SMW015318>
References: <20261120094211.1742416-1-lukma@nabladev.com>
	<20261120094211.1742416-3-lukma@nabladev.com>
	<awR-Al7YQMSSqt5J@SMW015318>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Frank,

> On Fri, Nov 20, 2026 at 10:42:11AM +0100, Lukasz Majewski wrote:
> > Add support for CBASE board, which incorporates the TQMa8MQML
> > module.
> >
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> > Changes for v2:
> > - Fix the DTS according to the sashiko bot review
> > (gemini/gemini-4-argon) Changes for v3:
> > - None
> > Changes for v4:
> > - Use hex values for switch reg property
> > - Change subject and commit message according to community feedback
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 581
> > ++++++++++++++++++ 2 files changed, 582 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile index
> > a80cccf34eb5..c14e5ae2e4a0 100644 ---
> > a/arch/arm64/boot/dts/freescale/Makefile +++
> > b/arch/arm64/boot/dts/freescale/Makefile @@ -121,6 +121,7 @@
> > dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
> > dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
> > dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
> > dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-cbase.dtb
> >
> >  imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
> >  	imx8mm-data-modul-edm-sbc.dtb \
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> > b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts new file mode
> > 100644 index 000000000000..fdfa2ef9a065
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> > @@ -0,0 +1,581 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2022 Fabio Estevam <festevam@denx.de>
> > + * Copyright 2026 Lukasz Majewski <lukma@nabladev.com>
> > + */
> > +
> > +/dts-v1/;
> > +  
> ...
> > +
> > +/* SPI-NOR memory is not mounted on the used SoM */
> > +/delete-node/ &flash0;  
> 
> Use status = disabled.

As pointed out earlier - the 

+&flexspi {
+	status = "disabled";
+};

is disabled.

So we do not enable the FLEXSPI subsystem and also clearly indicate
that the flash0 is NOT mounted (and will not be as we don't use it at
this project).

Is this OK? Or shall I do something more?

> 
> Frank
> 
> > --
> > 2.39.5
> >
> >  



-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
