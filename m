Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70D943550B
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900524; cv=none; b=ET98050xJS5pfssX3CwLYWf5h4EVe90LIJ/tZa098mINQ5J25PZd6SSGNqBDRxDJXsnK76NIs7JXHopYgwrFxw02RwTUP7rLVE5CzUsNaebgvOYETJDBkVLbbzNasw5Af2CAjv6PUFYq0P6phTKS5ApDJWUn+44I1dyTl43+N/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900524; c=relaxed/simple;
	bh=5+b24SGzoRwdE3mntMzGKQSgwrd+rZZA3y+3/WxHods=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQpHLq71V/qJtAGnixt/qKWwUWU9VXGWOgtJ8FdC5JVN+thvKI8WNi5N1FgPqKUh5NKKiqra91rhNewK2jBQkwOm6yWJQuSDFbmsU2pvWaiqWWgr/NSuVtUzS5g4R+Oxfs6ijUgxkaeW2mmLDZ5qfBF8KACwBGIJ6UCYafoxB0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeYhXTB4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeYhXTB4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso361476f8f.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784900521; x=1785505321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kkz4nyMnu+p0MmuXqpH9H0qUrj19YSj8Cq+qczGuex8=;
        b=WeYhXTB4ZYx2JB9a3bY5iKUgEXJziCYVbkHgWxp8E0Gsuq1RNvOtV6uHhLGrDfWTGR
         BR2wMqRIU0OeFAw0U9qloiRoqeGTHjKK+tw1CSHiudlzwpWdAhok9SuSBIz6Ax3RKlJM
         uKr/v76ZMT47Qcf/ZkZSFUtGCwDsBs6SIFbSzu76zx2CG0IwtNwVOTuxRobnm3r3xwtO
         aAgFPkWIiwtjviUcuOVOsj25krilR2HNZYO70LAMPls5SqhU2YRHg1hOuQD1adJQLtb8
         4af3HFCv/cItYTLlJPS2ezjS8nnD29iN7m0cRxh4LdYgPWJm8wplBzB358/YRZ8iPIAO
         z8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784900521; x=1785505321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkz4nyMnu+p0MmuXqpH9H0qUrj19YSj8Cq+qczGuex8=;
        b=pk1FCiUzYQUhpg8CQZXw3jidhzUHcJtLSHLLQV7W8gbdPRN1F5R+glso0jy5VihBQd
         xR+pmiqTQTT9tN9BI6dHOVGjX+5AvWZGdHclrIZfEblwS2owyTX0DcefxHSLfevnkZpT
         FWa414SX2+aw4Fru5hbndwZO7Nts8/P3zxBL2hUcfiRC4cjGCp1+XGmKEzHZJ2OxD0PU
         Ok3mg9eagiZFhmLHJejk+s+EAgOs6/yYwkOkLgnB4YEXWORrxT6fFlwT+KCSA1fChKon
         V3jc683e45CLSKrY4XhW76jxcQkxd7XL94tfSNlJbT4u10EQVp0RnFB4e0Li6e8p7bXU
         IGvA==
X-Forwarded-Encrypted: i=1; AHgh+RoKJ4qwmfPcbXjgWiJoL+94Sy1tNFl9oYfXhcla0AkpVS2fhg2+Nwn+5RS79wVk4LeLLBSgVRK9hPFY@vger.kernel.org
X-Gm-Message-State: AOJu0YyBg74AR06En/POJyFDZAndJO5qMGigMQrhIYzXzdx7KQ25fB3q
	ASoO5ed5rif1JxZa/lANWhBnG9OChGrXgPzlGY/xyoLXx+pnJB5Ys//a
X-Gm-Gg: AR+sD115CzJUrVPuokZCxNh3cNJdZ2SKmsmGeA5N35vemJ7zt8nhiVAhoNIf/u0jS7s
	K2UBITh4X7IAwbAh4/LNf9Zrx1B+uvqz00A+QSRSvhP/g0r0GGUsoS11ms4ibhHNXHnEDS0WpNq
	FfNlrXRdEXUEJIi6Fpt7INRu9wXgL9UVxBcOyq9VxtcTUxvdtXKInMoJgdGCt7ddyDdhdE0JXW1
	6QbDLzdUgP3POLgwaRgNuNjis8PRzEhd5Rq1IAtNponnIxA7z6vyKdPm2gTDn4G1jjknMt4mvgp
	iJTAwEEfM7REKujZcyhNuLXCuIenK8gt1YIIUIdpGgQ17GEQom+bc7ngWzM2qmiMsSNQaXHOJUH
	ITMcskn/KTAXXCv2lXKwrlwmDJ5seVUFE3l+aod6y7dgyzd4oVLZ/6aRcxJamS6bLl+TlA56b8X
	71kkrioJzEc90tBZcK+Wkw7hqYfHsnZJPrhrfnH8tejh8vgYEUE42GL9R8ymumd1IYszN99Hr43
	PdMjg==
X-Received: by 2002:a05:600c:1f82:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4957426c545mr83063625e9.1.1784900520632;
        Fri, 24 Jul 2026 06:42:00 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531basm24736797f8f.19.2026.07.24.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:42:00 -0700 (PDT)
Date: Fri, 24 Jul 2026 15:41:59 +0200
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
Message-ID: <sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
 <amDXGRT80HfyJwCt@SMW015318>
 <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
 <amJrv2FDbdkbvMKQ@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amJrv2FDbdkbvMKQ@SMW015318>

On Thu, Jul 23, 2026 at 02:30:07PM -0500, Frank Li wrote:
> On Wed, Jul 22, 2026 at 06:15:50PM +0200, Ernest Van Hoecke wrote:
> > On Wed, Jul 22, 2026 at 09:43:37AM -0500, Frank Li wrote:
> > > On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> > > > Hello Kieran,
> > > >
> > > > On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > > > > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > > > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > >
> > > > > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > > > > >
> > > > > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > > > > camera module.
> > > > > > > >
> > > > > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > ---
> > > > > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > > > > >  4 files changed, 119 insertions(+)
> > > > ...
> > > > > I think with the Toradex ecosystem there would be some value in
> > > > > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > > > > so that we can abstract the hardware which is being 'added'.
> > > > >
> > > > > I think it's important that we tackle the problem of combinatorial
> > > > > explosions of overlays when we can add a component to multiple
> > > > > platforms.
> > > > >
> > > > > For example, your OV5640 camera could be added to many different boards
> > > > > - and each board could have many different cameras - in different ports.
> > > > >
> > > > > We should not be copy/pasting overlays for each combination, or we'll
> > > > > have 'thousands' of identical overlays.
> > > >
> > > > I see your point, and I agree that it would be valuable to move this
> > > > topic forward. I will raise it internally at Toradex and see how we can
> > > > contribute.
> > > >
> > > > At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
> > > >
> > > >  | DT connectors have been discussed for the last 10 or so years and three
> > > >  | is still no real progress.
> > > >  |
> > > >  | I would be happy to send a follow up patchset which would convert the
> > > >  | DTOs to whatever connector implementation format lands in the future,
> > > >  | but I am concerned that waiting for DT connectors will block this
> > > >  | patchset from landing for a long time.
> > > >
> > >
> > > I do quick check for ov5640, we can use partial connectors, which already
> > > in kernel tree.
> > >
> > > use duplicate label like
> > >
> > > in mainboard
> > > csi_io_i2c: &i2c3 {
> > > 	...
> > > }
> > >
> > > csi_io_regualotor_3v3: ....
> > >
> > >
> > > csi_io: connector_csi {
> > > 	compatible = "...";
> > > 	gpio-map = <0 0 &gpio1 3 3>;
> > > 	...
> > > 	irq-map =<0 &gpio1 4 1>;
> > > 	...
> > > }
> > >
> > > in 5640 overlay
> > >
> > > &csi_io_i2c {
> > > 	camera@xx {
> > >
> > > 		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
> > > 	}
> > > }
> > >
> > > https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/
> > >
> > > Only clock part have dependence. other parts. I am working mipi dsi for
> > > display, almost work except panel show have some problem, which is not
> > > related with connector.
> > >
> > > Frank
> >
> > This is very interesting and I agree with both you and Kieran that it
> > would be great to abstract these connections away and kill the need for
> > so many variations.
> >
> > Certainly I will read up on this and spread it internally as well.
> >
> > That said, since there are still unresolved dependencies, I am not
> > convinced that we should already head this way with this series. It
> > supports hardware that exists today in the currently standard and clean
> > way.
> 
> Your ov5640 have not such dependence. You can try connector firstly.
> 
> display most like can go through connector, (I remember pwm already
> supported, but not sure).
> 
> others continue go through old method until dependence clear.
> 
> Frank
> 

The ov5640 still requires a clock nexus which is not merged yet.

I have been playing around with it locally now and find the work here
very interesting. Certainly this is also useful for Toradex and I would
like to use it to reduce duplication.

We will repeat this work for the Verdin iMX8MP. So I see real value in
using these new mechanisms to map the GPIOs such that the Verdin ov5640
overlay can be reused. However, this would also require a new binding
for a "verdin_csi" device.

Therefore, I could consider dropping the ov5640 overlays from this
series and sending them as a follow up with the partial connectors
support. But I don't want to block the series from getting merged for
this non-trivial effort.

If we go that way, I wonder where the verdin-ov5640 overlay should go?
We also have Verdin modules with a TI SoC, with the OV5640 overlays
already merged, that could be refactored. Those live in ti/, not
freescale/. Do you have any input on how we should deal with that?

Personally I am still more in favour of merging now and refactoring with
our next series for other SoMs, but I understand the desire to start on
this now so there are more consumers of this new behaviour.

Thanks for your input and kind regards,
Ernest

