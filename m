Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795846715;
	b=kVYVJCBsJT0yDPJbXvuJuvXSJI84cmqwDgyN1XKkExrmZQJDSD7ai3I5Fn034L1AkAOX
	 BFj3ZqdFv/4/4BtERSWLZhFsoxdWpTvkRiFdqQyNIMUkDTdO+SOr9iUOlmCWwKOuYlLaP
	 aK+lXZekwZyOnsPDyez24h9gRqWtly/Z7WBdFhv03NjuAd/b7YbrZxasnz+nrjC9OgMJy
	 fEezsXAQWB7N+s4TllNWXgBLIAV3Jk6q2Cgf6Ke6Si8Y4Imi+wPVGbRuDjhGdFRaCBQQt
	 UaKSXQIiFJMB0JyRZiwzX8hleZoV7dkPR6vqbTosANlf9vciRzzK47RmOsoSvXAehsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795846715;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=k7J6TLLCIarsWD8/5ux9wv2wr1oM4S9+UrlbnYXYYKU=;
	b=sT99l8qD453LIz/jidTjrI8LwkAjIRXzmoCNFHSesxGqa+1L+DavwJIM5E+gzxR/4oRU
	 p7D0A7BvN1s/1Fd2ZsF9KwlHUXyWNHd0AulICRgIIdERdCfJyYCn9So5NMcMQubAwFOxT
	 d5HhM0tfUw4f7GamtcW30GOJMbqwIzXb1ZvH3d7fu+PCudik3U1iMuGqO+1/ueLeasB6h
	 JGuGZBtTs72P1Ez+1m7y4AUlHpv29W/wgadJcQ7keMbEQFH5ywTfttR4/Z9lGq5mbSgNF
	 sQFusooOI69xxZEQ0nsGk8bstpZ/PD6tMj73fGBuPdfivKX7eVTMTTHHHKo405wSfeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=Rodce3Gt;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=8Cukuoul;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0980606A31C
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 06:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0980606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=Rodce3Gt;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=8Cukuoul
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1795846699; bh=k7J6TLLCIarsWD8/5ux9wv2
	wr1oM4S9+UrlbnYXYYKU=; b=Rodce3Gta8SDLrjSPXWt6cEgDCtwC1bW2cG/8/B/EEXW3UYnjH
	1FO/eUvRMQq+4pu5kS79Z6+XnZvV3MpGmsqrARQ1QzsWFYsQPY20KY5kaSOYe+WMIyQBccnFbj+
	xyMsiMiXl/Z5vuA8prXQF2JP7catU2D73g5yqZ4HR/IXnOKrcmy8TaWoj+Wb1+vWgj7aDKUtyjl
	mQOgfEiajFou4nJ0epnMdieVL+T5F9uMlMsx7gzHe9F+ZUKekW0dEiTeBYJg0KhU8hq+gYI8ZNV
	xWo0sbUgGPCTan5vODNeMR5/LW8sLhg6ABpZsGlV0SlCysTr0MwbYdlv7mu5DJZ6OAA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1795846699; bh=k7J6TLLCIarsWD8/5ux9wv2
	wr1oM4S9+UrlbnYXYYKU=; b=8CukuoulCXMMpGEKLE537432nLlqh8SMeUbgHIgTSdYagE9Fm6
	oPHQ2G41QrpG/zUjxQoxFKI6hfBB7p10oXDg==;
Date: Sat, 28 Nov 2026 13:18:14 +0700
From: Dang Huynh <dang.huynh@mainlining.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add CD GPIO to Orange Pi 5/5B/5Pro
Message-ID: <awpxYCW9N_tqAhiX@melt-pi5>
References: <20261121-orange-pi-5-sdcard-v1-1-e431e7c46ba0@mainlining.org>
 <c6930807-24de-49c2-adcb-5dbbc3da0c45@cherry.de>
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
In-Reply-To: <c6930807-24de-49c2-adcb-5dbbc3da0c45@cherry.de>

Hi Quentin,

On Thu, Nov 26, 2026 at 10:56:12AM +0100, Quentin Schulz wrote:
> Hi Dang,
> 
> On 11/21/26 8:03 AM, Dang Huynh wrote:
> > CD GPIO is currently not defined in Orange Pi 5, this breaks
> > SD card hotplugging.
> 
> That's not the issue. The issue is that the card detect signal is muxed in
> the SDMMC_DET function (c.f. sdmmc_det in rk3588-base.dtsi) and that relies
> on the SDMMC controller being powered on to detect such an event. This
> cannot work when the controller is in runtime suspend, so we have a chicken
> and the egg problem. The card detect should resume the controller, but it
> can only work when the controller is running. Hence why we now go for the
> gpio function (via cd-gpios) instead. See
> c7a9549ce46e ("arm64: dts: rockchip: Switch microSD card detect to gpio on
> Radxa ROCK 5 ITX/5C") for an example.
Interesting, I didn't know that the controller could do that. You learn
something new every day I guess.

> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> > index 2db6ee95e504..8fbb0ba19b74 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> > @@ -282,6 +282,7 @@ &sdhci {
> >   &sdmmc {
> >   	bus-width = <4>;
> >   	cap-sd-highspeed;
> > +	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
> 
> issue: missing pinmuxing
> 
> You need to configure the pinmux and pinconf for this pin (via pinctrl-0 and
> we require repeating pinctrl-names wherever pinctrl-0 is modified).
pinmux/pinconf is already defined in rk3588-base-pinctrl.dtsi for this
exact GPIO. I guess this is in case when controller's card detect works?

> 
> Cheers,
> Quentin

Best regards,
Dang
