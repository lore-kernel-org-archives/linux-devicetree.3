Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763481;
	b=vqUCoH9ZlBgTG2MBFUYarVI3dhhx6KuCmuJalkxa91IRg6OZN28i9F8e/RVoSyOKrzaz
	 1Fg3w+gfx1huJlfYn6wIT73qTO6zBFgm3PDY7pl9Q59CgBTRO3fsE//RYsvyf3wRzMZU1
	 IVoMBLY/TRJ92hb3ngqutZaWEvfiY1WSuFEA96OKIYqsST1pHNL+ybiVmi8rGrd2ncBS1
	 LHVFB8du8IqW/LzsuED6BcfJ0MIaktrCpmZb2ff4Rl0UcQ5u9OiqJ9mtHB6u95/xBvNS/
	 HI66VdcmQsbN+B/pyIPjMZEeEa7NpKnY/cMh1hjrRg1UWYc2u+xZJhUO3G//+Av3wSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
	b=qqkHO0G+pMfccJAwf+Jts6SiDUqVPXgmWLlH2yS4m5CyP1ZVkBY3ws41pJVF5IMPZ5Rd
	 3Vz6DghdQe+XbOz3xTS1IVs8y7BEf+lYRzf1rr+HjNJfFXrMnWURVC71mjscwdCGfi/7e
	 fvNPB+D9DPQafF0edzsr7Uds57P22RgEC0c9mw2iav6v19kMJhjzQJwsyTLYghpGV8qqv
	 R4s6osRYPW5hrboMTJT9cSuI2+I1FxS+YaW51QVONVCRM91V1Os2Sa3XQ+wt26P6u6o8+
	 ulm0SGxCS8kdwBi08RsemHYf1h0ZYmjZk2ato0iue/XWzUtKRVYY0SIOdH0PC90Wt9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s0JrTTqI;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C3A606A31E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 13:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C3A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s0JrTTqI
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e0d1da913so726410f8f.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792763479; x=1793368279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
        b=s0JrTTqId1Thjd23iKIcCer9vAWQqO29zSHJFmzVIlcS3td5Smq27zDqDudRMU1B+5
         BRxPmaNtu3WgLmqtGNu/NcUNq4BT1BYywzIN8AmiumwJrsoBHM5H/3SHWVivQJb2t55X
         A17w347Dx0WcOqiOGu4txLR6Fgi6cwEUU2IUYoRcize7YmSWEApxbpGrn/ImfyP0fZpH
         Wz/V9PVmuD6w3yhe3Axs0mn3KI4cdH0DJwYe6vrgaEZ4arJbE4HEh814XJMVCsbJA0Ya
         l9NR8zhYxp8yATtsrplpJTqPbLSH1Z83trWQNizrIuUeVcmCfSXWUZu3TUVZAYylQXM4
         mAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763479; x=1793368279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
        b=hUFIcoYk0hFxiAovufdgr0klHVh5C/XdlE/J0xODRZVcPUqCwco4wM2mSg6o0f6VLe
         dyH4AGdzGKGGmqT7UeDWFuQoqkVcyS1dXJZ5NsaXRZGHWO+1ILEJjtC2Oq+MSnX6YFZ2
         d/i0RaQKwSX/ypLTvUE6N30V/av0lNuXHmuMo2a9IKvETlV4VqZQ9TWipFT7P3yI8XQ6
         ZJ9+F2GUaB9eOQzKBvNJBJyaFgPI7q1sW2LICz/d93wE1be8AHfk4aTUuzIWjU4wwfDB
         EpSTMkgCarH+OxwAf8ARx1IkX+CcfQVUwJslVnqzrEznE3cPw/XTeS6WCbOhaJwa+7Xf
         8DTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH1eBSpNPSK0GSrz9/+mPuQGsXnvHOhOawH12OWO5h8y6qG0gBIkjedkEM15TFWwnlg1SYg3hFt0VX@vger.kernel.org
X-Gm-Message-State: AFq9FYIhldyC7fOka5ceKw3HUbBvfu3FmgABpKxi+50ho6FmZVp8/Bhx
	iBRSeymUrFj5ZjxxM1zQze2CweyiYx0cSGwBaI3qQS5FQpXFMOuyBYfSNKcJAXbe
X-Gm-Gg: AYBFou3ymwX83GYIR45IB6I3JZ4e2UCpFBuWSv6v1aouVyzCer/MkLmP6gyYFq/3sec
	x8ifn0YcwIu3GxsKeuvoxyPFh6u5fIHUrsCcwz2knwe3mmdCMNub+RTKZuawQsKhM5lcD/VTZ/d
	ru8TxES2XpGSSKNa1OG/4JDdDD3XKbEOFd4DMmwdMYXwRB53kgrZGdCAfqSdneNUt0JvROa7nQO
	HExDHIAVwZodPCpVza7dhgXbUPDtXwlrJRq7a2mbA5VYbmMCQ9mJYpAgaxnV+0GInO/D27JxhYe
	h76l6FtPfn9n8cLetQMbWbjx738jQI3fRzNz3Sbpp95Yr1IrWkVl6BTV6q9YD81XeT/fHe5kz18
	ZlkoV9R9i4AfSukK5KnedWHNdub+I5vFtkY7Uuy+9ysSKvbdckM14FU0W+8HPrl2/ZQhbKQMiB0
	1odqpCQTdK8lCOhGrG1p7XtDTEupSbU7zmbUXiLO39x0H7/SlxOtE0e3dZ1t5lLlWvXazd6eF28
	EseBnRSDYaBX3luZrk5iMpaeAzwGJVrHtYzTgkW0KlbiNdAhwu0LYA9dQ2uItd7yvM8t/6mHCEM
	nMLYN4wvbe0SerN8ffwwRsDXBRhyC7UUmJD4hkYaDUQF7S5g97iIaFA=
X-Received: by 2002:a05:6000:46c8:b0:48d:f3ec:e818 with SMTP id ffacd0b85a97d-48e2d1430d7mr7952493f8f.7.1792763479100;
        Fri, 23 Oct 2026 06:51:19 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380314a3sm4401217f8f.27.2026.10.23.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:51:18 -0700 (PDT)
Date: Fri, 23 Oct 2026 15:51:17 +0200
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
Message-ID: <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
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
In-Reply-To: <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>

On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > on this interface.
> >
> > The mezzanine can route the camera control signals through two jumper
> > configurations. Describe each configuration as a GPIO nexus mapping so the
> > camera description remains independent of the physical routing.
> >
> > The default positions share the native CSI_1 GPIOs and are intended for a
> > single camera. The alternate positions permit simultaneous native and
> > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> >
> > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > module uses 24 MHz, so provide variants for both.
> >
> > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> 
> why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> 
> Frank

Hi Frank,

Both camera modules have their own oscillator, and the native and
Mezzanine connectors have their own supply, so each overlay describes its
own clock and regulator nodes. They also use a different I2C bus, CSI
receiver and connector. Both overlays are applied together for two
cameras (imx8mp-verdin-wifi-dev-dual-ov5640), so their node names and
labels must be unique, and a single .dtsi cannot be included twice.

The connector nexus makes the GPIOs independent of the routing, but an
overlay still has to name the connector, bus and receiver it uses. One
overlay for either connector would need the target to be chosen when it
is applied, which is what the DT connector/addon work is about, so sadly
we have to wait for that to make things more generic.

What is left in common is a few constant sensor properties, so I would
like to keep the two files.

Thanks for your input and best regards,
Ernest

