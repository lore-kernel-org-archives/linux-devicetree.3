Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792928604;
	b=egEAsMM4ff/LATdl8g+wPNOEHg9kMrkG3YublyOm0bmbpr5d7wPTNCcyeWtELZ1ByCNX
	 2qCPqPdhCnao+gnuim/zgwfu1KoT1bgbJfTz+v7E8f3q/SDiPVMzeFRN1gOh+ysSsR52m
	 zFi5Zhd6dVD6gQyHH4nujgt7WPNGlDMe0/+uHelQt+MPS9PXnGs3Hh4assoIhsfsaGZ5g
	 iNhI4JrukIAOJ2TRxjTZi9n2IVkFBohpQRmYDRCA+aSswtej9RS2pS/zGLbxNlhQv+R/I
	 t/gIhdm2IuviEJfVN9ftoyIKHl9VWL/XM3MZEuVs8CXP9enxzc2M/kEWJdmK2jvXTvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792928604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
	b=t1q1NBXWxtBR7PjYx5rJhiDS+J3L7Bd+VdGTbZjBD34gqM1XjfhI3n3tWl75o+Baigxm
	 EBcio8lKzM2NTzQF45xev/06wdUAmEmLd3Au/i3dgQ8sKJcBpFug6d9o4ZALky0IkMlco
	 73noOLP6e5x0kzVDX/aWxX/Ay7tOX6l9F4baaUOJmY1qjUrZHCzF3zAaKPw0gg24cnXbx
	 WsJ555JYuxkDH66hujllW2JNtcS0m9BNISzjxvr79I/g5TiivAmEXX9JD6OEwIQc51iS5
	 2Xs9lHyIz7kEgz/M99j7TRAow1xNOKph92bHr/IjNtN5ozFxZ2Jfpxn+WdaCNd3FEUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHLZvwEe;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA9E606A328
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 11:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA9E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHLZvwEe
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so14284325e9.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792928603; x=1793533403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
        b=EHLZvwEeO7vX0aMXE+MoAif2qB+Fvrg5EMeXd9VCq7881nIFb0YtlinenDe4Lp67Zy
         DJUqfpSmX5GnTF08iUgrVDbsP3aLbUC+7JrY+FI2zy6bATNmgixdS9OqFmCk6w5KOCMB
         xD8ODbJpWkB11K9sdNMer3yUNWsuaD2gZ090Oo4HrxOIC2XC6D1DOJCaFwetnXHdLaS3
         em/Wafk8xWjGH1SpeeFz2n/CHs6u/9q0LbUVfsP4Za0Rk29aiPLb9mrTk3yfOU4zNXGP
         vm7Lud85M0r8nMFnrM5GV1/bIZ0/lW5vzunjzYJ78PmNHsWyQSe/AcaEI8tdmzxtJJFL
         VHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928603; x=1793533403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
        b=ssz3nAPhZGS4qibahq+YVJ/ZBRtCWA2N/OLhxtyqamZGL3vPHlJUIy5wn0CJyL1FJC
         8he2UCbLbSqxyfRjSBjPZStX1C3jDfNrv2OWOgD9OQea0IOxLqwhb4BCodhDTc4KzboR
         cMwWFjhFJbFCtzCPrYGksjJn1Se2lEiu7KZE17z6EJ0bPoYl87AzGk6wQNh+2jeBiRDr
         3HZe1qf9IkKRt0QIXTq05mBCJPfdGW+bLreALX35vAxG81ZbmH5oqJS2f01sO8E2V0nX
         w589r07ELLF7RLfxSxFBC9nxsdqm+oNER6B0lqiL8MUiNsVul+bm3S92VOSNCUgL1iVt
         IMuw==
X-Forwarded-Encrypted: i=1; AKwUvBz1e3fLzOorUdRFm/7DXzNMUrIuYe5Q/EQ6HGeo0BAwJTnuq3Owae1jXK6g6t29D41iOcdriPveoOOm@vger.kernel.org
X-Gm-Message-State: AFq9FYLw3Ad6ETRhmujADrMY2ZLvKvhgegrYGuEIQ6h2OsOwHZDWnmwT
	Tt3ua74BX3WF810NPaS89V0jMyzq0CdLKgza9O8A9H2aOeDOvxSRDnMS
X-Gm-Gg: AYBFou2hTZWQt9JOpuoGHK5vLnMTFA5rKks+FJd3QHfUi4bLPUCirvrbA0/6R2i1Ny9
	UBibiIAHC2omzCkb52jTS48yz+BeIfFcQlcUF9MZxDIFGY1SUFevIythbypiVmIl8Ifi/Izu4px
	+yOgXGg3yYFjPHGrF1eAEnG/VrPTcXDXREiIcE4PgQVoby1+M51+qCqnWep0j9pJqnSbru/t0HT
	AH7gWLjQXz0SvevfiiryORlOdscBhzVzn+jCos/ZfUr6pBj/QXSaYzdaiyw6Fknxo8Ff5J/yx92
	S08nJDWPqEJh9TUVSI8RrCfWi933gUyVU7SQgX2znBkp1e76eTxgsC5hFnXO2aYB5NedvigrR4i
	JPj2r61UuYgZKY8876iP7jN3itonC5Dicb/sYvgG54DILF0ZZtQGdBAZdIorX4h6fZgMHtQSpnE
	MHzYAWeqY38D2eAL6/4IWfJaSFA379apRBN2NTbmU9BpwIiSUg1W8tc190lbXX15peM6MR9dGKc
	Vmh3a7IcOLFWIpMBX8jF1COI1UWdTlXvizj4vvCAQU+Rnq7zLDOb4sXCfhNM3F2g6kF0/hbub5O
	l8kLgMitnCXestGgUB4K3iq1eECERxGG3ndzCe3YlxEE2eJXNuKz1xkq9cjnBHhPcA5pyJ8ywuG
	1lZOH5w==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr75332735e9.0.1792928602528;
        Sun, 25 Oct 2026 04:43:22 -0700 (PDT)
Received: from ernest.hoecke-nb (static-2a02-1368-6200-2fbc-a24b-7223-aeca-a4a6.cust.swissbackbone.net. [2a02:1368:6200:2fbc:a24b:7223:aeca:a4a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a4cb7bece3sm63901465e9.10.2026.10.25.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 04:43:21 -0700 (PDT)
Date: Sun, 25 Oct 2026 12:43:20 +0100
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
Message-ID: <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
 <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
 <atvCMGUsLXImGhxZ@SMW015318>
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
In-Reply-To: <atvCMGUsLXImGhxZ@SMW015318>

Hi Frank,

On Fri, Oct 23, 2026 at 03:23:12PM -0500, Frank Li wrote:
> On Fri, Oct 23, 2026 at 03:51:17PM +0200, Ernest Van Hoecke wrote:
> > On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> > > On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > >
> > > > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > > > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > > > on this interface.
> > > >
> > > > The mezzanine can route the camera control signals through two jumper
> > > > configurations. Describe each configuration as a GPIO nexus mapping so the
> > > > camera description remains independent of the physical routing.
> > > >
> > > > The default positions share the native CSI_1 GPIOs and are intended for a
> > > > single camera. The alternate positions permit simultaneous native and
> > > > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> > > >
> > > > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > > > module uses 24 MHz, so provide variants for both.
> > > >
> > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> > > >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> > > >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> > > >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> > > >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> > > >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> > >
> > > why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > Both camera modules have their own oscillator, and the native and
> > Mezzanine connectors have their own supply, so each overlay describes its
> > own clock and regulator nodes. They also use a different I2C bus, CSI
> > receiver and connector. Both overlays are applied together for two
> > cameras (imx8mp-verdin-wifi-dev-dual-ov5640),
> 
> Okay, I see share one imx8m-verdin-ov5640.dtso
> 
> > so their node names and
> > labels must be unique, and a single .dtsi cannot be included twice.
> 
> mezzanine actually connect by another connectors ? so it need new one files
> because current nexus node's limitation.
>

Yes, the Mezzanine has its own camera connector, wired to the second
MIPI CSI-2 receiver of the i.MX8M Plus. Its GPIOs already go through a
connector nexus of their own, defined in the Mezzanine overlays.
 
> Can you make imx8mp-verdin-mezzanine-ov5640.dtsi also standardize, like
> use unified camera_i2c_2, camera_connector2, compre to imx8m-verdin-ov5640.dtso
>

This is possible, but the labels used by imx8m-verdin-ov5640.dtso exist
because that overlay is shared by Verdin iMX8M Mini and Verdin iMX8M Plus.
The Mezzanine is specific to the Verdin iMX8M Plus and connects to its
module-specific pins, which another module could wire differently. New
labels in the SoM dtsi would become ABI with these overlays as their only
user, so I would rather not add them. If a future Verdin module shares
this connector, I will add the labels then.
 
> And avoid dtso include dtso file.  Now perfer only include dtsi file.
> 
> Frank

Okay I will go back to only including dtsi in v4 of this series, and
also for the next SMARC series. Thanks.

Kind regards,
Ernest
