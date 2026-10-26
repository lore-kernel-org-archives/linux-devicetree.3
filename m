Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017532;
	b=pyb0sYl98mUo1G6ZJ/irAn5r8BTQAgdW2joMBtdgdF6hiMNHIMaV+czHOLX6PoYgTv5R
	 S4dT+vqaITnphJxtWL/1FX6uaLurvgr+9okRwNTPBpzl/rUFBax0c3BhWtzhxIjBcVT8d
	 FgcnDSsAN26450u2/1Ik/kIsyCtmv1za0lMDAP3bYXd2exlgiVqtPfV3KXVwiZITrjuUl
	 fhnc6ts4XHjyvm2SmGU+NZf62h0h6U5DbaslJbrdvfklt+8xZ5GhaTu8Hj/7dPYUF29oU
	 5GOxOAG+ANbpt+1O9mNmnN/gOYH8VsCSc0yORg7un5WJ0VBScm6IaEqkwaKBwmLk6Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
	b=M6GsgHIG1hXNLAj8yPl/l2nSWrMaZ/QEDBxJstRUga0wYtRpt6ts8kUCledEL7u/9XqI
	 nMA9VWZ9syHIDe7blQysqxJ2XcTCnTktm1ah5EkL48brwUA7LfH0bAsK+Wq3R2U9rQRVQ
	 UwfbyD5L77/FiWCNy1NMSLF3Uy7qAXre79jaS3zVb0z+6hUVlUy2lkHrG+Euah+Kogcdg
	 xVtZyMN/eJX55lZ3RqW7Ngw3MQuvh+x39hFF9EX5Kn1rkwKDHbaTeQK2fir/aLNAj1ks8
	 BOIeCIE4Fm0l3Hop5gPbI0bMJEKnUF/uQNs7vd3gX2zaC5bclxFUrvZ5djydrieI+5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WPjPMV2G;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298A606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0298A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WPjPMV2G
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so2138151241.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017531; x=1793622331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
        b=WPjPMV2GzhWEE5rB6rxz833ehsMAXDta3sOoZVRktCEdyknFwVsUHRtDGVizYRxiUF
         A5aK+EQBPpgFkVgArRFSWn0A95GZvt2FzhgPqRdIUp2Ox1s9tJ6wVnGUjO0+IR3STb2G
         oWcriSEJAIOUIoGa6UWmJJ5waV1c8RQ/ha7agfcknGH2LM2FJoa0fmpQaY8nNAVRystk
         rECssJkyILd7Ze4hFYVNaD/uWDd0YbGMulbZN3CyIH+BWXWfaQcSpG2HtD6Huw7A14dP
         u3Tp8g7XGn6Nhr3GiaXIhcrwkJttjeVmjSJxCITht07b4nxh9VScxAO/mbTQmLpJKGx+
         z0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017531; x=1793622331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
        b=RPec1QGGvMgIgUW6ZPSMX9pWXp1VmzZzGEnqZsBGAWvr2R1GGGqzgv5o3IjXq/1HeH
         RECJJuhZK+azvNSWlrGXZPlif5O8kYOOnat5yu6bW+iq5UEsFUz1BYWoC2Vvdjo18LDI
         3ajNRB9GZkOADvtw0yiaCqAl+qei3xmJvKBeCMJWusReAtPrQ8BftFFfLNzskSC1bYWd
         lwFn6Alz2zLqDEpFQjFw6J3ZJWIVLDsdhqlFMIGj22MOmem6vdn1GpGNryl2yb1YkPWy
         /aI97WcmQdlYl4hJxFZFZG3CP1FysyVTXcpkzRHc6VmsiKyfth4MXUQS+x9XvY+jRaQS
         EI9g==
X-Forwarded-Encrypted: i=1; AKwUvBzqwRTw+ZUuODZLviiazDZdu1qcCjF8j3Rq8U3PX8AJtLH0pm9rXkQrgkO6nSIBjbbIiQbpZOlqVDS5@vger.kernel.org
X-Gm-Message-State: AFq9FYJp3LeeidgaJAfQbTxG7hJejS+BcLTA2w5/cp4iGIydsIzY9Kfa
	lD8HDG5Jzz32+D85j/Cj26srhb5KB1ta26OtmehviM5yq7F2qTgNYpFX
X-Gm-Gg: AYBFou3HShiYdjGuoIW913mC1J8/QRpuBxEpPKOC16veYupab4JmDObNhs5hiJqwCVE
	KAbKRDQkcDCQggjDiaCkxjrVOZfODZS2zBpBGO0SbParjFTJr2cWl+ZHcuBU79/By+nV5Otk3QL
	XyhtjfkARfREfem9zVDvjTXygYOpb88Hrhddikx1QhOFFVjBxIFHmZT1+LEKfnILqAmI8XOY2D5
	HFSq+8UezShbhP2DqRuW0TwuETnhvgAswz7w85u3glTr5+1MpoylXkOQs6yr/1dCAIEit55OjXZ
	AiA6sKGpdAwjkD77ZZesoeiWTtEG+LqSHZxBijz3E6MxMCwerwMTL5hLUvZSrRosrrVYKbQNnDy
	GKgnwx6Tg/EhoR55uhtGEbTjbM5mahVoC48VWzZWx0YAFBelDwD5w/4ij2qSZLj8n7mX8NWfgH+
	UOZBgqu1mkKsosVJ6V6izQnYuf3wsYAyC1yJsCFnd2YYfG/XCJkU7r+DYqZ9AqIh9gaDaqHRx0Y
	4eYhGqQNgd4dHBWOEPsPv93gE8J9oMndQ/NYb24GdwV2GwOHx9r9RVrCWFi4A==
X-Received: by 2002:a05:6102:604e:b0:7cc:1b19:9258 with SMTP id ada2fe7eead31-7ce5ca1e48fmr1995133137.3.1793017530653;
        Mon, 26 Oct 2026 05:25:30 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b7069sm8121766241.3.2026.10.26.05.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:25:30 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:25:20 -0300
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
Message-ID: <wancrsxcem5uep5oy5pnw5prewefqah7drmhiu5wrq3ctykltl@akwvtqbebblb>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <atZxhWaUWthEHkti@SMW015318>
 <lozimedmt3h7v6odvp4svvmatvk7726a4ztn3j7ft44oto7p5p@dmrudrmzyz3s>
 <ateQWqoTtXSBSBvm@SMW015318>
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
In-Reply-To: <ateQWqoTtXSBSBvm@SMW015318>

Hi Frank,

On Tue, Oct 20, 2026 at 11:01:30AM -0500, Frank Li wrote:
> On Tue, Oct 20, 2026 at 07:33:10AM -0300, Leonardo Costa wrote:
> > On Mon, Oct 19, 2026 at 02:37:41PM -0500, Frank Li wrote:
> > > On Mon, Oct 19, 2026 at 07:17:16AM -0300, Leonardo Costa wrote:
> > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > >
> > > > Add a device tree overlay for the VGA output available on the Apalis
> > > > Evaluation Board, which is driven from a parallel RGB interface passing
> > > > through a non-programmable video DAC to a VGA connector, without VESA
> > > > DDC I2C signals.
> > > >
> > > > The non-programmable video DAC consists of a simple resistor ladder that
> > > > converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
> > > > an active-low data-enable signal.
> > > >
> > > > The overlay is also combined with the various Apalis Evaluation Board
> > > > device trees to provide ready-to-use DTBs.
> > > >
> > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > ---
> > > >  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
> > > >  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
> > >
> > > what's difference with
> > >
> > > https://lore.kernel.org/imx/20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com/T/#u
> > >
> > > Is it possible share one dtso also?
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > The Apalis iMX6 one needs to set up the connection between the IPU the
> > LCD interface (endpoints ipu2_di0_disp0 and vga_display_in), and the
> > Colibri iMX6 one uses a DVI connector instead of a VGA one. Most of all,
> > the bridge on the Colibri iMX6 doesn't have any control signals, while
> > this one on the Apalis iMX6 has an active-low data-enable signal
> 
> This make sense to use difference dtso to cover it. Is it use name
> imx6q-ipu-di0-vga.dtso, because this dtso have not boards specific part,
> which can reuse for other similar hardware? Or we can rename it when reuse
> happen.

I think the overlay should be kept as imx6q-apalis-eval-vga.dtso. As it
currently is, it's easy to identify the hardware it may be used with. If
another board is added which uses the same interface in this same way,
we can evaluate if it's adequate to change names for reusability.

Best regards,
Leonardo
