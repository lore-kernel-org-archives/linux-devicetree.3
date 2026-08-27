Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C437F33D
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 18:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854470; cv=none; b=Zc7klsN+CKa5EAUV0ufJThjzQX5RGtCJo5Cl8YCelv+FQGx8PmoHl7i5hWHw63y4WARgm36A5JyhB7TXsZLvPpf3OnxsbVLuA0g+6UJ2Y4wqRuOA7MZ7fZ0QbC5wu4l8ZgNItv/sEjC6zmJD7k3A7Y6q4JiS2a4gO8IJJr9zk7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854470; c=relaxed/simple;
	bh=nqFcIRWHO1gbZDISpCn+623PYl+5K+bwxrZWcbI+yHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APw7xtAIFgbW+vqseDxGLcGHfg9IDViPdRfhOJOVdLYwpMn2h6/VOCmnXx2U6ngNoBk/22lga8XED0j+/sGvwv/P0Nm05ekKZP4uitpNUKndPA1NiqNSl/QGCdy6hAHax+beE4kUrw7rzcq3gUfQP7aPpIZX8yJGf87kuHgfRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDETzJm+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDETzJm+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fecbb7000so67964f8f.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854467; x=1788459267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5ubgqku7GUa3LZMLWFNhgKYbrJvkm44caMPa+3aLQo=;
        b=bDETzJm+TsAyAGteQzF1nyDV3+3d1amXKrvgL8818KtZc6xS7ocTfIoKHwnnlcpkjt
         VSs5spz9h/oOcvRH8s8ZiLU/cy2fVZJ3RTsixa7Duu0oumbvTtQhN688ilRaSglf9yDo
         UKxE88NE5/zuGRV5fX8saQl8zPEH1qM+K5KPvvXVAzTLSlUUuuvLlkUryudeo76gQuVz
         CAR9MZQfBSKnJMyhdVDWI5yqNum7Kw5qXDvUpOpXrINz34vLMN3VNu2+tmvOqcqgrNyV
         7mTUAkKRf11OM9fADHnuEM2Rb6nwAVz9EUl8UCMsNUtulrF05BmFy4L1wzwwehiQZG0/
         T/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854467; x=1788459267;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5ubgqku7GUa3LZMLWFNhgKYbrJvkm44caMPa+3aLQo=;
        b=nqXk4jZYILUk/d6XYlwzj6uL4mzt9TxAjXKtt2ickktxMu9r+coK68f4j/QMhD1A6T
         GznSh1k4NKNP8b34jCeGMqNIIMfUIqxoIuIQtAO4mKv8t8Zh0XZ+r7o0DbGPh8zPB6W4
         se/tWvOT1HtrpuYC55kTCFkktroc6eTDfDZQqoNHig/dKWr3ZdvTGYF0/mKpTO/llgST
         eutZ+nmYP16Hx5lPRv9QKRj+OO3lcPiZlCddX/IauR7z8sobodwCUVSdCezCz0Jtwwf2
         d7Stp0/HQmGP+OC8K8UEGmR+9Foo4vTRJYQfcMIfD5+I2ohYGgiKMsJsnY4iB+bDTptn
         FKJA==
X-Forwarded-Encrypted: i=1; AHgh+RqDinzIZVa8YRv4zPHuo7Cer4A/r05g39+9v7IX3Jl4heZZQA02H3udsxGFw5sPkLm5+DUhdoRXaoqq@vger.kernel.org
X-Gm-Message-State: AFuF++khm4aA7iWPagwshqFu50WrfOBKPNLgYBxib5IyuFdN9ifKFQRt
	syfEM475XLWa+Fi2lCoSY+DHj5YJNADCm8e/sxwV10eo1pbl7TtwzL7Y
X-Gm-Gg: AR+sD101AIhJa8fIU2W8oBOOkvBhohwvcRHmygxHBj76MX9cBcxgZIEgph0VSarRFHC
	D1JLISeAc85r9zWvuW04wsKgRUYTqMFdUnXVn0/GiXhhcimMvvXjYVtMpUl0rDlsfhDjdWHFX3W
	vAxmQLIXAiTxj6ScIHWRnQgLBrF/movlcNr3nVQpT/OgZ8lYiQoR1Bn0b+BQJcrWM9AiBqFuZHX
	NgwNpDnmluAsHWqq/KnRwiNnf1kpMMQT5VhakHg0SwxEk2MVnqGUDs+GFfPosQMAte9kDZi80tC
	t7ecIUldIKrwjXuCNxzB5mY5GsR3Mds0ItutcBe4eXiUdrmWWa2zhJysvdSLZp9ATAtD+8s38vY
	tqrufFVjWGryEXYIaFZZC9rIdh2djP/7bMiOFwE+YryUPPvGp/lSM4sIHywLagzmrZhRsRbtUmJ
	Zx92ZFo3v2JlWCQNS9o3lmPZDDWsUvVXxmknSzUOoO0eSV4/aFRLaqUJ0mUsj7eT0nznsPqv2uV
	YOORROQTK5Km0ckEMAFFQSw789zTN3vMED+iZ+G4nh+n20ZrBRcrVVHNZB3pLLynySlRLci
X-Received: by 2002:a05:6000:4211:b0:482:f530:c45b with SMTP id ffacd0b85a97d-482f798a6c1mr970197f8f.5.1787854466843;
        Thu, 27 Aug 2026 11:14:26 -0700 (PDT)
Received: from GLaDOS.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dc13fsm10426102f8f.24.2026.08.27.11.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:14:26 -0700 (PDT)
Date: Thu, 27 Aug 2026 20:14:24 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v6 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <apB-gMzH2cQNtv_Z@GLaDOS.station>
References: <cover.1787851637.git.stefano.r@variscite.com>
 <11592f9d727337fedf02fdb107a24e935f3ebce4.1787851637.git.stefano.r@variscite.com>
 <20260827174206.8A4B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827174206.8A4B61F000E9@smtp.kernel.org>

On Thu, Aug 27, 2026 at 05:42:06PM +0000, sashiko-bot@kernel.org wrote:
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
> > +		clock-names = "mclk";
> 
> [ ... ]
> 
> > +&sai1 {
> > +	assigned-clock-rates = <0>, <36864000>;
> > +	/delete-property/ fsl,sai-mclk-direction-output;
> > +};
> 
> [Severity: High]
> Does removing the 'fsl,sai-mclk-direction-output' property break the master
> clock for the WM8731 codec?
> 
> The wm8731 node configures the codec to expect an internal SoC master clock
> by setting clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>.
> 
> By deleting the 'fsl,sai-mclk-direction-output' property from the sai1
> node, the SAI1_MCLK pad is configured as an input instead of driving the
> clock out to the codec.
> 
> Will this prevent the WM8731 codec from functioning on this board variant
> because it never receives a clock?
> 

The WM8731 MCLK is provided by the configured audio clock root and this
setup has been validated on hardware.
Removing fsl,sai-mclk-direction-output is intentional for this board
variant.

> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> > new file mode 100644
> > index 0000000000000..158158afc3391
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> 
> [ ... ]
> 
> > +&iomuxc {
> > +	/* GPIO Used in User Space init script */
> > +	pinctrl_bt: btgrp {
> > +		fsl,pins = <
> > +			MX7D_PAD_GPIO1_IO14__GPIO1_IO14			0x80000000
> > +		>;
> > +	};
> 
> [Severity: Medium]
> Are these Bluetooth power sequences improperly delegated to user-space
> scripts instead of kernel device drivers?
> 
> The pinctrl_bt node defines the BT_REG_ON (GPIO1_IO14) pin strictly as a
> pinctrl definition with no corresponding power sequencer or regulator
> binding.
> 
> Since the comment explicitly notes it is used in a user space init script,
> will this prevent the kernel from autonomously enumerating the UART Bluetooth
> device during boot?
> 
> [ ... ]
> 
> > +&iomuxc_lpsr {
> 
> [ ... ]
> 
> > +	/* GPIO Used in User Space init script */
> > +	pinctrl_wlan: wlangrp {
> > +		fsl,pins = <
> > +			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4		0x09
> > +		>;
> > +	};
> 
> [Severity: Medium]
> Is this Wi-Fi power sequence improperly delegated to user-space scripts
> instead of an MMC power sequence?
> 
> The pinctrl_wlan node defines the WL_REG_ON (GPIO1_IO4) pin strictly as a
> pinctrl definition without a corresponding power sequencer or regulator
> binding.
> 
> Will this prevent the kernel from autonomously enumerating the SDIO Wi-Fi
> device during boot?
> 

Both Bluetooth and Wi-Fi are intentionally handled in userspace,
as on our other platforms

Stefano
