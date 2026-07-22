Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BE6440A33
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736957; cv=none; b=uRXAmIpzx0CK3QaD3ICEX2A0azZ0kANmkSZ32kHYCOq1ZGhTjb/qOHdwByDBPg0ezcEVJaQDGTsS0HdVXYRAYh7vzMLKFr+uvsdCtarUHE35eBJrcxnNWTksOyzj1Fn+pd2MX2SHS/Udf2e2KGup1LtZGM4jRYZd/5C0oDRhXGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736957; c=relaxed/simple;
	bh=24bg439gGrrRBlP2VrHnaGsYz3H8VEMfuqaUGo9f+2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWMRAsK+TX7TT4E/6qL7TRkKpUlUh9HI5dOrJz4JluaH8MO52bZ/pyGAh7o0SrA+5BuZq/kQT963nEqdP0Snt8D+2P4ubf6VO2/4qib2ZZ6F/Ncz6u6h9sjK0TfYBhm+8YakLj8xjWuyZnxLrg7vfqYt1d86AKkwYlK6cE9Cop8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjZvpy4g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjZvpy4g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495590dde14so37889285e9.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784736953; x=1785341753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdAhWxxku1ExCVmeOf7trOMVycxMJvkpBoDlah5X6ic=;
        b=bjZvpy4g/CH9G+VY7KABt+92kpcbSGkld+evn8Ono00nGogB9sJ+zRLhON1TdTwyGx
         ZbA2ik55kbSFaR+9HzOOudOTRyUGXK2ILqQk/mAWRtYNyY/dI+hdmWkUEBKmCC4z+IZG
         ic9Y1+XlP5BsKnvrJNwkFc9UfbfXYz1jZx+Bc9fbXjIwXRUyUXwUF1u7VGpAQ1Ddvorw
         lOMBi9CFfTFoVu3yyIvrB6emaCgQtT/+4r/nuqYtqyLtFzAAXT0O2rRWNeIdCcdbAreS
         /AJWvyYzT3iyCAwz1n+1SvfrsqI11wvAgRbZEyzBpRpVFv4yp7tCwQ73ZKU+l5Ognvth
         hlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736953; x=1785341753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdAhWxxku1ExCVmeOf7trOMVycxMJvkpBoDlah5X6ic=;
        b=l07ZGAKWHBExiW2oBeOjarSh0eRBMZqF8ALAQ41S3/qfJXKQ+QBQ1FU5VhQnEvRO9o
         AHl0srHcLKdATuyeJ2MZKgZ28XfN11i0UO/h9KUvYkx06uMI1PRTh0AgsWlV1QG/GKn7
         yWvLXdsLsBAmuULpR0uAxu8bq1sv+RbwfaDX7yGObSGAlQ8LOoV3B+WrhSOhG3eBDmkP
         EfbJoXrjInpKdCqPPpkVQ9jUNWoLBJTJ3Au6TKt+E9NXTbBxDXpAFfy1L6yueUekBE2Q
         uk/3IcgpWVRAJX4mZnxknlbUboRY969ay4RuZYM4LdWcOXBUgqbSAuehTkRWoNX25eIi
         v8zg==
X-Forwarded-Encrypted: i=1; AHgh+RpwD/w/0gyQzGiWY1QDyqRyywEAd3p45xaTTJEAcv7hYyLxkwi/4Q3RKIeChAI1W+JHqMwpHA86iISi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh60Lrj17i19hK6AtTCUpkvHFrzo4klcPHSbdAUfEFAMgOZS6z
	bgZs/od/unv4uGcoewOOcxlxjr1/TubYSbBWSSglFiFqwZMTuH3EIvD4
X-Gm-Gg: AR+sD12y7pBrB7G4obxjS88sp0RJerx76bi7tZqzxOpYamyWCGWRmDHHUUvXDy9J+r4
	Ji5xz6dG+oFLa8eazlw6001k7obMPK9uSuNvXGwG4+/0EvP0eaPqUv9V8HMnsiul9o4Y5slACj7
	IavPPXQmB5QXlI9p1cF7cyt1Lnkw1kJf2PANmx/JN81kH0HWa7ZlXrXfTTXcqhf0x9+9ZzcA1kx
	f/9felSfNKGn7nk+3Jmsd29n4Ns3p4zTT7LmZM8zAbhmCfH3monm0JyiX+jeaXzKVllb6jmwqTD
	q2fyD7P8N8fx7WH0UpYN1FDu8hrBqvuh90Asxv73Q6q0BYt7WtAdyovktouxq1VMi/UDingFLn8
	+5FCTME2Jz4kb6ltndAD0Z7s8qWqCXff/3ddZjSK+krY8WZdhftiFLhGvpqyIq8yr9n6UAk6+VM
	Jc9mgbxjUPASbIx/c/LL1a0omxL4gqik1EKRSr/EuNZckeuL1U66+0SdpIq3TTbXvRR8DfWw16F
	QLNmw==
X-Received: by 2002:a05:600c:4685:b0:495:3f99:849c with SMTP id 5b1f17b1804b1-4954a3f48ebmr309531885e9.15.1784736952504;
        Wed, 22 Jul 2026 09:15:52 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565304aefsm146049575e9.0.2026.07.22.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:15:52 -0700 (PDT)
Date: Wed, 22 Jul 2026 18:15:50 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
 <amDXGRT80HfyJwCt@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amDXGRT80HfyJwCt@SMW015318>

On Wed, Jul 22, 2026 at 09:43:37AM -0500, Frank Li wrote:
> On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> > Hello Kieran,
> >
> > On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > >
> > > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > > >
> > > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > > camera module.
> > > > > >
> > > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > > >  4 files changed, 119 insertions(+)
> > ...
> > > I think with the Toradex ecosystem there would be some value in
> > > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > > so that we can abstract the hardware which is being 'added'.
> > >
> > > I think it's important that we tackle the problem of combinatorial
> > > explosions of overlays when we can add a component to multiple
> > > platforms.
> > >
> > > For example, your OV5640 camera could be added to many different boards
> > > - and each board could have many different cameras - in different ports.
> > >
> > > We should not be copy/pasting overlays for each combination, or we'll
> > > have 'thousands' of identical overlays.
> >
> > I see your point, and I agree that it would be valuable to move this
> > topic forward. I will raise it internally at Toradex and see how we can
> > contribute.
> >
> > At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
> >
> >  | DT connectors have been discussed for the last 10 or so years and three
> >  | is still no real progress.
> >  |
> >  | I would be happy to send a follow up patchset which would convert the
> >  | DTOs to whatever connector implementation format lands in the future,
> >  | but I am concerned that waiting for DT connectors will block this
> >  | patchset from landing for a long time.
> >
> 
> I do quick check for ov5640, we can use partial connectors, which already
> in kernel tree.
> 
> use duplicate label like
> 
> in mainboard
> csi_io_i2c: &i2c3 {
> 	...
> }
> 
> csi_io_regualotor_3v3: ....
> 
> 
> csi_io: connector_csi {
> 	compatible = "...";
> 	gpio-map = <0 0 &gpio1 3 3>;
> 	...
> 	irq-map =<0 &gpio1 4 1>;
> 	...
> }
> 
> in 5640 overlay
> 
> &csi_io_i2c {
> 	camera@xx {
> 
> 		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
> 	}
> }
> 
> https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/
> 
> Only clock part have dependence. other parts. I am working mipi dsi for
> display, almost work except panel show have some problem, which is not
> related with connector.
> 
> Frank

This is very interesting and I agree with both you and Kieran that it
would be great to abstract these connections away and kill the need for
so many variations.

Certainly I will read up on this and spread it internally as well.

That said, since there are still unresolved dependencies, I am not
convinced that we should already head this way with this series. It
supports hardware that exists today in the currently standard and clean
way.

Can we consider moving to this once these patches are merged and we see
benefit?

Kind regards,
Ernest

