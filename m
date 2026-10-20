Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492400;
	b=f8kLK7PMnssz6tFFf/UNfAj3l8R/8JYUrZtehsHMXPa//+OSFN9J+bhd08j//n7axXlD
	 NW3DWCLGLmCAmns97sIndccuE8OHs2JqlHlG2DBai/5BOnGoN92rLByDrKEdY9ptMe6QV
	 0tJQSR1TBGayrKCInDs6ih5DGSXjyDRvr6RqQxeidfR3dH4he3hu2R8rM+40NUuEg4JHR
	 IPipvzGoy1Jy/3qGjxaM8NYjE9kStMzbSQ0l9bGjzjNkIdPxLtLGO6CZdb/vWpcKVAqk1
	 xOlUXf1dYQNARXXD/3aWZV9mWiW+ISvg9r+ShVE1AOCfsoPM7SBLRSTPYWSA9c9bLuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
	b=qqcr15NM4aYcUpiDVEn0yxvjwlinx4XZzNkmirINeboTGuqpkSo8pkRSVQigpufiPnvy
	 zaApnL2OXd3e/h533aF7T6OwqdfQSTPcemqs/FJYj32ckCcjUksO1WhHPC/tpYPyXcUWG
	 TxERQ2peyry92L9zSwAcTdmf6/NmAdSbbCFfs6RA3AkLCx1SBXVuGgAVlyyRD7dVvSTqb
	 4BlcD+cS9cP34VQrhkEueY5bkmnFixMppcWQSq9Iwn3F8+hFlmLU21OPUg6T98wpbJ2y8
	 qDzdSjH+b2UYt+CWMCFcG5SpnjiElgh5zovjWPLQzte+JgazEiQqI+6fjYkZloQzrYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fC9GZjUE;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A52606A326
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A52606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fC9GZjUE
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15354aa70e8so198905c88.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492399; x=1793097199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
        b=fC9GZjUEOmYIv+aaLMdcv5eL/hIbg/oG6svqLSHKOzRIqNw8UJ0uX4u7TLxJ+8G7wE
         TC0sjxIAzJCZopM2fJd6xJVJiTeuEIAeHwXPP0cmlCFxdF0TrJFb9OBeDjt5DZDMErsM
         7MJHCgOS3f3tYB4U1ICzDh3CZ2HUQuQZca8udKAeDZJ1iSr5GVTttuMpa8vCe9G96N+L
         6BZ1opy8OSh6TCb2JNce7ObgWN4j+doWPWHo2ubP2E2E1Gx2hwbhRJ/dxR48tPOEdzs7
         2dXggms9K7qzZilw4RtRBDS9OUJz6ghXbbnDwvErJ/pLXlgRSV/p35Hu96x8FWSTKy8Y
         NJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492399; x=1793097199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
        b=qRfQJA1MdvyH0KlTSQRkOadPx7td8u6JG79IiDRcW55aWNq5PXNz4risE505vkE2be
         YTf+9TsSB2KqSVWtCGb8pzSaigVUsMpxdYpBl0x2ZmPd4oy32CfBkhKsHVSyH1ACvSCq
         dNz4Z06Q8dW3piCxJESfmcZGXrHmxx9QP26zCbYAqqVboltGuc3yzsoxaa9zQB6Qz51b
         8e+QQii++vC69VbyldG5b0mLCfpAr64LdBfH3R/KgoOU9r57P0SWw/nUXlb3sBYQf+X5
         opI5npoJBK92vTxKRdS3B3kNdwwBUJum9tYAzu+PZ4Sjw5yskZOCyEmFJEWiCZtDemki
         b/zg==
X-Forwarded-Encrypted: i=1; AKwUvByZECxznnaFCJQ0hAKGPb8gIWLo6bXGNKT2ramMXo67EdgGb1oCpYpV9b1B/Ug4JcL/oZlibKv28dak@vger.kernel.org
X-Gm-Message-State: AFq9FYLb4GQ9jT+iplkvJ2LwxC1bRuPPSbiZ7wNbGjO6U6k/D2T9S7M1
	4MrPdR7U4Y/tgqw0qI7ZYXjrU2LvFbmz8hkmVFhpYjaM4g/VAVyVmAdt
X-Gm-Gg: AYBFou2Ta7nBn7yYtsRMDtlt4CSKyqe61krb2l2SR1JjrXY2eVuSKTT21LTqlFDZp1h
	39LiXqC7AVNGXc9hFB0a2GScmxjAxqcHpt3CR9JQxtPAL46Qf2mgUYUPrlQm9dGkNUq9fCkB+3Z
	9nZHDXLvbubvOrqa0tJEgiwylN3r5QvllHdCTZMlAtbAKtL3SKeyswadPeZGfMdwloBA5GKHdHV
	YVY/7FzszCyGNviYw49tzlHSgGt5VFt4hZqLL57P1lgp/UNxGhwOSN0ZZIIxlG1TgQAfU0Zgk+L
	L6WQSYW84916n122w8A00RGpq+dss1vdDl66oekdHyyjmT+cMXhQuf/8S/YYSXa9TbocWhC1azo
	PUEvkW8h5I8H/DS3vqPqJENzP55ztL4uPccxTCBZidPB1HBbgscCspxdCiNNNRls19hFRK3j1tf
	fvRH196WEGNmjRkTU3/9mSaElfAm/ay10BVv0uFxp+jsE5P69dwDlEITyuTa7xQGyqe1FfrQC+H
	yfR
X-Received: by 2002:a05:7022:1001:b0:14c:be8e:69fe with SMTP id a92af1059eb24-1850c8da80emr20220476c88.5.1792492398134;
        Tue, 20 Oct 2026 03:33:18 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm35068908c88.21.2026.10.20.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:33:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 07:33:10 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Message-ID: <lozimedmt3h7v6odvp4svvmatvk7726a4ztn3j7ft44oto7p5p@dmrudrmzyz3s>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <atZxhWaUWthEHkti@SMW015318>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atZxhWaUWthEHkti@SMW015318>

On Mon, Oct 19, 2026 at 02:37:41PM -0500, Frank Li wrote:
> On Mon, Oct 19, 2026 at 07:17:16AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add a device tree overlay for the VGA output available on the Apalis
> > Evaluation Board, which is driven from a parallel RGB interface passing
> > through a non-programmable video DAC to a VGA connector, without VESA
> > DDC I2C signals.
> >
> > The non-programmable video DAC consists of a simple resistor ladder that
> > converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
> > an active-low data-enable signal.
> >
> > The overlay is also combined with the various Apalis Evaluation Board
> > device trees to provide ready-to-use DTBs.
> >
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
> 
> what's difference with
> 
> https://lore.kernel.org/imx/20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com/T/#u
> 
> Is it possible share one dtso also?
> 
> Frank

Hi Frank,

The Apalis iMX6 one needs to set up the connection between the IPU the
LCD interface (endpoints ipu2_di0_disp0 and vga_display_in), and the
Colibri iMX6 one uses a DVI connector instead of a VGA one. Most of all,
the bridge on the Colibri iMX6 doesn't have any control signals, while
this one on the Apalis iMX6 has an active-low data-enable signal
specified on the input endpoint. Because of all of these, the overlay
needs to be different between these modules.

Best regards,
Leonardo
