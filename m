Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289160;
	b=Qjtq1zlah9wDkPealzQ9ROPSfZugl+FbYiOpKD+4V7gw5ZT9+k3b4Dxq3zvEFuLbsBrv
	 TcjcqQV1kBTG7+wUZC8SiUD589pHFboCfiJnBRPEKH6F9oR9k1RwWp4rEzj/dA2eLnlEL
	 Vu8OyX+mn+A/6JW7AYHf1GW8k69jBnuBCiGnq+8jWI/E8QEuBC/WSFsfAWcX0bReTQ+Ff
	 XobO5gpkivh9Up07bGPgb1zapHvhtdUAx3CLzS91NgdyuUxrBPVH+rP/op3+0Ut7qQzqW
	 f1TisAw8BA3cRLLzSIaG0LWMUY0uoY1V5K5tp9GOkiZcB1KeGZ6VQ9h1EYmxHjBLHUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
	b=b3yNf5HROQOQUNpyWLMaBhutfp6RExnHhUNJUKa62h45cFdzMmKB5i2gH4trbtaX3YRZ
	 fBvEUMk7ZfCkDGSHLt0HB46hNjmkj2j8Lc1quM/7siIAVsTDJoehRqNXNllWPo1UAhUow
	 D0rd/a90L8niQgc2vOHlbQefsrZPeg6LPOIYUIFQXu8A4/JqNyv7tdESpVQp5xoXCO1Ci
	 0CYoLi/H8uV5x+Sh7HuDAgdu9nZSa5xkWAM7PCU7GbLnOg3niYNo0sXslTac3o6/EOgHW
	 uTTtUDz4NUTetPO3Q3YDyFsB6KbK4G0+nLAu2MVER8gBuFHHPj2kvld8fVEJ492uSLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvL9YtF9;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A918606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 15:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A918606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvL9YtF9
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so19623805e9.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289158; x=1793893958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
        b=GvL9YtF95NGIqGt0Vp5xf+OuCyFDv28HytnjcnNErhTJmsWHsFkH9YKLlbnBhpV/+J
         7YJZt/Ly+DJPQQCJNzzB7AuQgNzzwmUAMyGf4vOIRq9wZwBo3UWdGaMN+Bf7BOp/7pEc
         ivlFNHqHtv9EWhTXFGQstsgomkLWfOTlfZh/bkp5E0Glbt72i4BzCbWJ06d6rSJB2aKl
         +utLsTbTdzIdG+D6zGR3vefP+xmyMZrdW4ixc0OVvbag2SZ2QStdLBN4FEJY7O+EFEDu
         0XpHfx+ZAAccitu3HIoV4WEmnvbnPh/wRxLvu8tX/hsgwKjtqRvMpjOOSIQLWBCmpxDt
         ArgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289158; x=1793893958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
        b=0CTAfJ8JPoBG3Dl6yNURmhvcWd7Bypnt3nrSL+TJzlrYShPdt8teEx1/9XbRQt+48r
         cLVDtpMQj0ZUO1r1vRGAS2MtYfunhYzYrUuaBERW+yM4lfWyLO/bPA0IXBpGO6NoRp7M
         OBSr17NHtxX8xO9DrEWL4C81EVu7eH7PMpBbRLboTX2HoEIXBT2VuhbddFvZ3n69sZtE
         4B96Z7dyzwNmO4mcvesJae5mespVJ4WVtmCE79x3ong54IwZ1CQ5ofK/iqW3b9Wx8gMP
         SxZ1btB834ua48gl3kqLz2yO3W0BJo/nlNNpanU+2GKHH0pszqB75E6r74fFimcvibzq
         IbxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkRArYtQ+a7xKQWgrlbr2ddWYK4y/n7RRIwxF8ngGnF8iI1Z2diicK58iDdWcOBQpNFS0kcs8z7Uyj@vger.kernel.org
X-Gm-Message-State: AFq9FYKbkFb7OXKABCeZkl0lvrUPzPkJa5NzV5PUuEnY1MJHkDQ/YSiX
	y0hFjC07+VvZ4nkPWyxf1CcinVT2vzdknrHbErpP6NxzXNHWcv/pIa3A
X-Gm-Gg: AYBFou3vqcOaqZKp9YBIi7NL4MpdxuvpDsxs0g3orkZaHY6vNG85TNLtH23QPibyb2n
	GnIjjSNM0pEAJtS8UtSsayZuU2iPrVO1RA0n+qpDcHBPrk1EgqHpUAHPzs+hPIHon+Lj7tgbA/y
	7amirBpiBW0A7MsjnQIBDYKK8et3I180KrSxFFmlbLTFNiMIJB8QA5w5HboUs6+pW2vOy7IGQyc
	NZt9Pe6nUpum6lidvkKfzgpOX0O0Zuc/6uRNSlDd6SdS6NYsduqrkUMSf8V69W+thmz/XNZmptl
	7DRWKnXTV+cUxLb8uBVQhi/tgqdjUq3U6hdYqK+o3mQ1qYo1m0hYWTl2zE9gG+/IF4YrxE9O8+G
	bKVQsoWokYNsI7wbFs37t15CU8IeQuDK3LHSQJSO7nMacphaeuHePhWzeKltdfKJWZZxz2r6At6
	IyruW2bS+FGhzaY9qCFQhwkZkscIf5ZKaQD0BvQ+42GOiTOYFG1ZjW3Vm95/i71Wh7TbyXRUVBD
	o2AC4yvVAPHStA+TW1YAPEqgiqmFo74MYh6QXxeyAnYUYscRErbdPWYFyge4hz4Ozf/MCh9NXxC
	mKy+3xaow6uCCN+wQmXN9LS0NrRysy96IS6uQz+gG08wcvUXMDigGF0xSCBcsNYaPWahn3mYEQO
	ZwkbFPw/0/dtOqd86tBkrlquRqxzM+gNIfR852tcGK238QDf6Tm5Qurk=
X-Received: by 2002:a05:600c:154d:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4a96720266bmr144690445e9.12.1793289158295;
        Thu, 29 Oct 2026 08:52:38 -0700 (PDT)
Received: from ernest.hoecke-nb (static-2a02-1368-6200-2fbc-d3e8-e0a5-7e8a-a15c.cust.swissbackbone.net. [2a02:1368:6200:2fbc:d3e8:e0a5:7e8a:a15c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm36538183f8f.36.2026.10.29.08.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:52:37 -0700 (PDT)
Date: Thu, 29 Oct 2026 16:52:36 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: imx8mp-verdin: Add
 mezzanine OV5640 overlays
Message-ID: <dmtpajvbw7cfrda4msnjvorjt67tycvu7qbsio4irvdydsbxny@mxxqqwht7mzu>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
 <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
 <atvCMGUsLXImGhxZ@SMW015318>
 <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>
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
In-Reply-To: <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>

On Sun, Oct 25, 2026 at 12:43:20PM +0100, Ernest Van Hoecke wrote:
> Hi Frank,
> 
> On Fri, Oct 23, 2026 at 03:23:12PM -0500, Frank Li wrote:
> > On Fri, Oct 23, 2026 at 03:51:17PM +0200, Ernest Van Hoecke wrote:
> > > On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> > > > On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > >
> > > > > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > > > > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > > > > on this interface.
> > > > >
> > > > > The mezzanine can route the camera control signals through two jumper
> > > > > configurations. Describe each configuration as a GPIO nexus mapping so the
> > > > > camera description remains independent of the physical routing.
> > > > >
> > > > > The default positions share the native CSI_1 GPIOs and are intended for a
> > > > > single camera. The alternate positions permit simultaneous native and
> > > > > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> > > > >
> > > > > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > > > > module uses 24 MHz, so provide variants for both.
> > > > >
> > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> > > > >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> > > > >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> > > > >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> > > > >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> > > > >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> > > >
> > > > why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> > > >
> > > > Frank
> > >
> > > Hi Frank,
> > >
> > > Both camera modules have their own oscillator, and the native and
> > > Mezzanine connectors have their own supply, so each overlay describes its
> > > own clock and regulator nodes. They also use a different I2C bus, CSI
> > > receiver and connector. Both overlays are applied together for two
> > > cameras (imx8mp-verdin-wifi-dev-dual-ov5640),
> > 
> > Okay, I see share one imx8m-verdin-ov5640.dtso
> > 
> > > so their node names and
> > > labels must be unique, and a single .dtsi cannot be included twice.
> > 
> > mezzanine actually connect by another connectors ? so it need new one files
> > because current nexus node's limitation.
> >
> 
> Yes, the Mezzanine has its own camera connector, wired to the second
> MIPI CSI-2 receiver of the i.MX8M Plus. Its GPIOs already go through a
> connector nexus of their own, defined in the Mezzanine overlays.
>  
> > Can you make imx8mp-verdin-mezzanine-ov5640.dtsi also standardize, like
> > use unified camera_i2c_2, camera_connector2, compre to imx8m-verdin-ov5640.dtso
> >
> 
> This is possible, but the labels used by imx8m-verdin-ov5640.dtso exist
> because that overlay is shared by Verdin iMX8M Mini and Verdin iMX8M Plus.
> The Mezzanine is specific to the Verdin iMX8M Plus and connects to its
> module-specific pins, which another module could wire differently. New
> labels in the SoM dtsi would become ABI with these overlays as their only
> user, so I would rather not add them. If a future Verdin module shares
> this connector, I will add the labels then.
>  
> > And avoid dtso include dtso file.  Now perfer only include dtsi file.
> > 
> > Frank
> 
> Okay I will go back to only including dtsi in v4 of this series, and
> also for the next SMARC series. Thanks.
> 
> Kind regards,
> Ernest

Hi Frank,

Just a heads-up that I'll be off in November so you can expect these
changes in December, together with v3 of SMARC iMX8MP camera series.

Thanks,
Ernest

