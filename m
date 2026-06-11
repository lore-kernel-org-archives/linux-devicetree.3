Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D34B3DA7D0;
	Thu, 11 Jun 2026 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175886; cv=none; b=FQU5nsTDZJPkIfYBBo+kjQfdQz8mMs05qBrnhEqOTasTXWrklcbcv1tCMh0BgfGxpDx8sId/nFfcQI6Fx+QP1K47GfBbhRSZxTUKixblCYb3uSLRj1RBabXEMh0sQKyc1eGsqlhhl2s290fndmtjRKFO1msmjjT6qTDA4/nPmjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175886; c=relaxed/simple;
	bh=0htWptjL1aj8rvl1k7StMY9376c+EB2tYy/hDLbzqSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNq4LIETgo1+CpIktfnSij2YfIwGKQkkrPjSwPb37TJa8C1oF+EYn5JLkkBTH0KlwyRXUrA/pAKPt7ZaSDRCjqQS2Wcz1NERJXsFo6qKEFmPLZ6n9/dzhyLQeek47jd/YUR5f4/hMmat5Z9whoFKtCmJOYK2WllMeZMz10Nz3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCH8ip6y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCH8ip6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257FA1F00893;
	Thu, 11 Jun 2026 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781175885;
	bh=DXbvGxjsbYKAOSuXjFoiX5RrWY+cznGeY+TWkckl1mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aCH8ip6yO86ZyM5RRiI3m8OEnA/TqawQ4wlHxYSGqZhTZo2KKwiTPXTjUqgnJqJnI
	 kp+7C9baLAEpHRO79tziW5AsKGHxmQaD8We1Qw/5iGigtapLlquxNPluMLNPlpYuxG
	 XsUBe1pOm7B/L21eJD4ZWePh5lmFTM0MlJlIv00W2Mk2eKQFGyqiRwqCq8TTTAPoGe
	 7gzZ5yY7dGMTiG8t46ExvIbgilFMBuwF9adQ32ZJtB0nEVqUie7n8cRsoHwjQAOo0C
	 TZVzWq+GBjRWMiJQODRtouB3r+857gVp8nNObP+sXwGGE+WOJVyz9h+G0ZSiUjRcCZ
	 XK1naB+iufW2w==
Date: Thu, 11 Jun 2026 16:34:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: nuvoton: Add MA35D1 USB2 OTG PHY driver
Message-ID: <aiqWSGCuhAK7hoY9@vaman>
References: <20260604101220.1092822-1-a0987203069@gmail.com>
 <20260604101220.1092822-3-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604101220.1092822-3-a0987203069@gmail.com>

On 04-06-26, 18:12, Joey Lu wrote:
> Add a PHY driver for the USB 2.0 PHYs in the Nuvoton MA35D1 SoC,
> intended for use with the EHCI and OHCI host controllers.
> 
> The MA35D1 SoC has two USB ports:
> 
>   - USB0: an OTG port shared between a DWC2 gadget controller and
>     EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
>     the physical USB0 signals to the appropriate controller based on the
>     USB ID pin state.  The DWC2 IP is device-only in hardware,
>     so host-mode operation on USB0 is handled entirely by EHCI0/OHCI0.
> 
>   - USB1: a dedicated host-only port served by EHCI1/OHCI1.
> 
> The driver implements:
>   - Power-On Reset sequence with a guard that skips re-initialization if
>     the PHY is already operational.  This protects PHY0 when the DWC2
>     gadget driver has already run its own init before EHCI0 probes.
>   - Optional resistor calibration trim via nuvoton,rcalcode.
>   - Optional over-current detect polarity via nuvoton,oc-active-high.
>   - For PHY0 only: a USB role switch that exposes the hardware ID pin
>     state (PWRONOTP[16]).
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  drivers/phy/nuvoton/Kconfig          |  15 ++
>  drivers/phy/nuvoton/Makefile         |   1 +
>  drivers/phy/nuvoton/phy-ma35d1-otg.c | 264 +++++++++++++++++++++++++++
>  3 files changed, 280 insertions(+)
>  create mode 100644 drivers/phy/nuvoton/phy-ma35d1-otg.c
> 
> diff --git a/drivers/phy/nuvoton/Kconfig b/drivers/phy/nuvoton/Kconfig
> index d02cae2db315..5fdd13f841e7 100644
> --- a/drivers/phy/nuvoton/Kconfig
> +++ b/drivers/phy/nuvoton/Kconfig
> @@ -10,3 +10,18 @@ config PHY_MA35_USB
>  	help
>  	  Enable this to support the USB2.0 PHY on the Nuvoton MA35
>  	  series SoCs.
> +
> +config PHY_MA35_USB_OTG
> +	tristate "Nuvoton MA35 USB2.0 OTG PHY driver"
> +	depends on ARCH_MA35 || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY
> +	select MFD_SYSCON
> +	select USB_ROLE_SWITCH
> +	help
> +	  Enable this to support the USB2.0 OTG PHY on the Nuvoton MA35
> +	  series SoCs.  This driver handles PHY initialization for the
> +	  EHCI/OHCI host controllers, including per-PHY power-on reset,
> +	  resistor calibration trim, and over-current polarity
> +	  configuration.  For the OTG port (PHY0), it also monitors the
> +	  USB ID pin and registers a USB role switch.
> diff --git a/drivers/phy/nuvoton/Makefile b/drivers/phy/nuvoton/Makefile
> index 2937e3921898..3ecd76f35d7c 100644
> --- a/drivers/phy/nuvoton/Makefile
> +++ b/drivers/phy/nuvoton/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  obj-$(CONFIG_PHY_MA35_USB)		+= phy-ma35d1-usb2.o
> +obj-$(CONFIG_PHY_MA35_USB_OTG)		+= phy-ma35d1-otg.o

Have you considered reusing usb2 driver with a different power_on
function? Or handle the differences internally in the driver. There are
few similarities in two and some things are different

-- 
~Vinod
