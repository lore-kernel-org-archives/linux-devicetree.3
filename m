Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5AF411A0A
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786388886; cv=none; b=nAs/lgpe2OtZPmVC8jTAQFw6M8dCfdB6CNYDwXYgfcabRZqCAVIC90dDFPGbLJTNnWFg9YipPtPTJ0jqY/IOoaOl1nA/5dndIhXIHTOw1hwJYwQ1bG/41kGQnJXGuknyIX9Dc5rqJAQ2uiv8M/jftgQxgI/c7CIFp0df2P78O40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786388886; c=relaxed/simple;
	bh=YCD8HcEbS+FxeNcV5DFf41UK3cMSUjhcxM/ZFXnWEHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQdyXBAmFscdGYlVNGLvx4hNr1XaQkuG1pQGIKC3JU4NUw3sULPenqaX/FREuw/555RCIGglrt4nveXf0NNQsjK6ElUncXgn5RzcubByqmAr8/ZGw0eaOddVcEUwOD0YZbMLfy1aiM233uqN0j7mYLspTtxgAIj9V7uinaFZLYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ItX0Fu+Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ItX0Fu+Q"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 301CFBB;
	Mon, 10 Aug 2026 21:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786388808;
	bh=YCD8HcEbS+FxeNcV5DFf41UK3cMSUjhcxM/ZFXnWEHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItX0Fu+QMKOQQW0pRKRRp8VdpUUM8PNxp9yxk5cc1dbCOV2KAgXMleEkoH+6lSjHt
	 eLWMlNNQ/69P0MUJwr0R4me0BjUh5hWZRaOgynvODjnF8Pud9w9cYSUauYElN+Rfoz
	 FnmEIZJYAdbFUcDgEOkUoZV9GgQuSE6fO0vdujKg=
Date: Mon, 10 Aug 2026 22:08:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v3 6/7] ARM: dts: nxp: imx6qdl-pico: Replace
 clock-frequency in camera sensor node
Message-ID: <20260810190800.GA3046075@killaraus.ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
 <anoerXCIlB8tTgiC@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anoerXCIlB8tTgiC@SMW015318>

On Mon, Aug 10, 2026 at 01:55:41PM -0500, Frank Li wrote:
> On Mon, Aug 10, 2026 at 09:06:03PM +0300, Laurent Pinchart wrote:
> > The clock-frequency for camera sensors has been deprecated in favour of
> > the assigned-clocks and assigned-clock-rates properties. Replace it in
> > the device tree.
> 
> Remove "clock-frequency" may break back compatiblity.
> 
> A similar case
> https://lore.kernel.org/imx/20d37ab7-308e-4f07-96dc-7ae011af76d0@kernel.org/
> https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> 
> Need provide judgement in commit message about impact of break ABI.

What ABI breakage ? The latest kernel supports the updated bindings
(merged in commit aa1826696a55 ("dt-bindings: media: Deprecate
clock-frequency property for camera sensors") in v6.18).

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Drop added blank line
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > index ca4cb986efbc..0cc05d084f9b 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > @@ -233,7 +233,9 @@ camera@3c {
> >  		pinctrl-0 = <&pinctrl_ov5645>;
> >  		reg = <0x3c>;
> >  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> > -		clock-frequency = <24000000>;
> > +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> > +		assigned-clock-rates = <24000000>;
> > +
> >  		vdddo-supply = <&reg_1p8v>;
> >  		vdda-supply = <&reg_2p8v>;
> >  		vddd-supply = <&reg_1p5v>;

-- 
Regards,

Laurent Pinchart
