Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E54330650
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182308; cv=none; b=IOLqjeMDdOKtRJVQkk+/sWXTfUfgoKMLlSOBnX5FEI343xCt0Pb/BJ7ApewkafI/2rwxwXtqireuo6NT6vmz5j5DLb3qSd31cvb3KMviKpNbD31JWmSsrXrbYUfeq/7I3hsszMtD/2jYTB6vB/W67mKBmkwV6fgvfIy84J8tWk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182308; c=relaxed/simple;
	bh=aDdv3xhJZMkROZKvGOWJmTDkhFVW+RBY74bEI/EmxLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXnXddD5UCzcEYbRbfSZYglfKyNbgkH3v7mS0gDfh+IQ7WaMMuyxPXSXa+EYSNIkOd2S7ox/RbYKU8+eAZPs/1viB7Pz24udIzFIZFwuw+eUt9NtOGdcBKQykCTZcmv/LX+i6O4yTtV/mQGtlxL9emfHupI/9IZLd/nbAMu75OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huKjt7Hy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huKjt7Hy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482ea739de2so2114480f8f.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788182305; x=1788787105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kfqgaWwv9QiwaG4KIBmNHHV67bw4d3U03iBTZ72Dr1k=;
        b=huKjt7HypyEJN+wmVH/sjPC/rR3u4RTAK/w74+5uSVbxo8UJpxCAhiFMrA5CY+SfMb
         wCL0MqZab24gRUsOuk3AqG0ZOz1hRHGD6tuwStcbOQt6oeS6cTmNFKUZlImgSQxN8LJY
         FttzYQoa/rL1Gpjwbz9wtuPYFgaN3TKLJBb+PqkAldPS57RjE77nkKbwbkFn7SlDH6Ij
         jXcYgCPgOXe9YFZQHhPhvpIXFuCxxYIssDc4N9aBjFHpl0zrR6GcP3Ghqr3zqSH6VFBi
         xBn2JgDx1AHpLYDwq24SmJHhxTHz7BGLxO8DlQ53Emwp+OJQpkKWyX/8Nf8JtdXn46DO
         y8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788182305; x=1788787105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfqgaWwv9QiwaG4KIBmNHHV67bw4d3U03iBTZ72Dr1k=;
        b=kgAbv7b9eN7LnXOg4AsPPBzKS1T6xkRdRJoIPDTkrPRO2MDfVIfblUs5/2dL5DVLd4
         epHxZ/DPUTJUcb67dthhmoNgQUz6F4DKFHz2zC+Ek3fjEed7w6B8I7h0n0BBbhf1CKWJ
         +ixGaNNG6i77ynt5SgAyfH7BGltMbU6pkprk3YiFvW0Bx6nHtcBtNPk17tJL/sTSLSyB
         132DJSH9WBRz8M92gS0WGLVfu/Pg5zPRn5DFHJMIgQAxVJUKP/P3pu5tfSXWGIAP6x1/
         h957oUeFfQPcWhaYNYUdnXOAC4EpaAp67lox8lHDcpuFZ+beLXPFS5iJ8DqOj9FA+3uv
         Lucg==
X-Gm-Message-State: AFuF++nl/hTcFoYjGGEU7b9keJa8vNQq+4iAFMaAOqA6uJoB6H3c6HAW
	Qrcqxa/08Pj/RRiw5pc5MDa7P9Gc2WrNn8s2eK3ojv5JZCbAI/ZpHkn3
X-Gm-Gg: AYBFou24v/8+oQ8eXWIKO6q9DqCkk7ZKwcTqUPIrJnHdF2WoH9f14h5Etx+m3HyiGws
	AfDBYSjMuOOJRS7N4/L+gj00skiwBx3izjg7emQ+mqzmk7NqixDg/fiCy8hUZECq37UWTbMc0dU
	RoVlAz40SfBoD4idbwGJuezf+BwV/jq7oGlM+mjDtkWKQJ8SRKuf4qGPVnD0twAGmJuVoUst71T
	8JzRB19YGbABE40KCD+fmAS1SRYYauUGFTpTanlfnJGdF6bb1pAPXp8WYOdaZumpCmSgOZ/K2gp
	/FWqxOloqS7/OL39PIXl+Dd/SP1JKLMHPMITb8yXQEqsc03gbc7KKDFIDYq9ipxuYl4K00ru1RD
	Ug1wyy2MwsznL0skPeH9WT+vdPo6y3Rju79ajiMy0G91mylwqPxlpaCOLzzn1yt4CumtX1aQZE9
	EHFikCdZ27u3irqgK7nSNQVO+6Z9yAykCNky08y66Y7jTi/iV+JM+qNH4dUaDGPfuzKtGYJ/bbK
	PwDmq5uf8OD5HJ4jaX0hxzCPdPOyvAj
X-Received: by 2002:a05:6000:454a:b0:482:fb60:2f0 with SMTP id ffacd0b85a97d-482fb60045amr31993922f8f.8.1788182305045;
        Mon, 31 Aug 2026 06:18:25 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab730fsm23770454f8f.8.2026.08.31.06.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:18:24 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:18:19 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
	imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v7 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <apV_G_t1swul34ZB@GLaDOS.station>
References: <cover.1788180142.git.stefano.r@variscite.com>
 <c12693ab258171be75afa6cee783e5c3de21c1fb.1788180142.git.stefano.r@variscite.com>
 <20260831130506.94DB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831130506.94DB41F000E9@smtp.kernel.org>

On Mon, Aug 31, 2026 at 01:05:06PM +0000, sashiko-bot@kernel.org wrote:
> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> > new file mode 100644
> > index 0000000000000..ab05de43cc53a
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> 
> [ ... ]
> 
> > +&i2c2 {
> > +	wm8731: audio-codec@1a {
> > +		compatible = "wlf,wm8731";
> > +		reg = <0x1a>;
> > +		#sound-dai-cells = <0>;
> > +		AVDD-supply = <&vgen6_reg>;
> > +		DBVDD-supply = <&vgen6_reg>;
> > +		DCVDD-supply = <&vgen6_reg>;
> > +		HPVDD-supply = <&vgen6_reg>;
> > +		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> 
> [Severity: High]
> Does the codec driver incorrectly bind to IMX7D_AUDIO_MCLK_ROOT_DIV instead of
> the physical SAI1 root clock driving the pin, causing the ASoC driver to read
> an incorrect frequency?

IMX7D_AUDIO_MCLK_ROOT_DIV is intentional here.
The codec MCLK is provided by the dedicated audio MCLK root,
while the SAI1 root clock is configured separately for the SAI interface.
This configuration has also been validated on the hardware.

> 
> > +		clock-names = "mclk";
> > +		assigned-clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
> > +				  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> > +		assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> > +		assigned-clock-rates = <0>, <12288000>;
> > +	};
> > +};
> > +
> > +&sai1 {
> > +	pinctrl-names = "default", "sleep";
> > +	pinctrl-0 = <&pinctrl_sai1>, <&pinctrl_sai1_mclk>;
> > +	pinctrl-1 = <&pinctrl_sai1_sleep>, <&pinctrl_sai1_mclk_sleep>;
> > +	assigned-clocks = <&clks IMX7D_SAI1_ROOT_SRC>,
> > +			  <&clks IMX7D_SAI1_ROOT_CLK>;
> > +	assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> > +	assigned-clock-rates = <0>, <36864000>;
> > +	status = "okay";
> > +};
> 
> [Severity: High]
> Is the sai1 node missing the fsl,sai-mclk-direction-output property, leaving
> the codec's MCLK pin undriven?
> 

This is intentional. fsl,sai-mclk-direction-output is optional and
is not required for this hardware configuration.
The SAI1 MCLK pinmux and current clock setup have been validated
on the board without this property.

> 
> > +&i2c1 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default", "gpio";
> > +	pinctrl-0 = <&pinctrl_i2c1>;
> > +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> > +	scl-gpios = <&gpio4 8 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	sda-gpios = <&gpio4 9 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	status = "okay";
> > +
> > +	pfuze300: pmic@8 {
> > +		compatible = "fsl,pfuze3000";
> > +		reg = <0x08>;
> > +
> > +		regulators {
> > +			sw1a_reg: sw1a {
> > +				regulator-min-microvolt = <700000>;
> > +				regulator-max-microvolt = <3300000>;
> 
> [Severity: High]
> Is it safe to set regulator-max-microvolt to 3.3V for the VDD_ARM regulator?
> Since this could allow the PMIC to supply up to 3.3V to the core, does this
> exceed the i.MX7Dual hardware absolute maximum tolerances (around 1.3V)?

This is intentional and matches the existing validated board
configuration. The regulator constraints are not used to drive VDD_ARM
to 3.3 V during normal operation.
