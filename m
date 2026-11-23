Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462860;
	b=OvpK4SmNU1/BKvWpyiIpkMuchGYkpTRE+T4o/VPjoHkJRoPf4qrbfW/EU1KLszfoUW75
	 fPcVYnIeymZzmUSorqDxRrDccZtV+HB7ramnmh7Dx09SeDiy3WyI+iDRh1ljd7y+NX6Fd
	 Jeamc2Ik9PcRqF2Pw+/ZJOYYOHNoh62voUQe99PFi5/yhokpfq0MSx2XuHINcWbrF9L1A
	 hTUNSng5ggYM0nVJsYO3WFuiR8aVYlfUCvHhgKS9c54BUr+e6+n9Cn1cjZ+m9fSaJjYCq
	 oGigqWZRFqiIHhqVth0LAcBPj9gAkbt4gdAxSpWZUb8a2Lp7IrLRQyZoUsY+e3GiGog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462860;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=wcwFeZ3mkqm4Vtr54rYdFLiq+NCKtb/bIgAQfBTTf9Q=;
	b=lGmv5RnIQFoEqaHHAwcaqIrZXVw9AbbvcaTjPpt+euopvoyRTTScjJ/X+TYIZEP0PGza
	 7VoniWeoFXwRZVhAEO4DoTX+XqPFO/TRX+43svyJxWu7OeMCoOHp+UgiH92hA1D9kCZNY
	 IOTQoZd4p13axTstWScDkg87sSHE3G4o2YRZo6VKcYAAnlttByl89TKr0UB5VM6H5Kw6N
	 FIGlDgGUS+502GzoJBLRcZ5Uc6UQhmXRmrMuOy8bp2dxSOuB79p0h9SEQs1Go60JFVld6
	 aPJe2zwwFMSVAjVGSKR8vToH1JbEGEIeGU4kziovrgJZvuEoSHQDPoPJsjMxuoO8Sww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=APbzfF6D;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECFA606A33C;
	Mon, 23 Nov 2026 19:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECFA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=APbzfF6D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wcwFeZ3mkqm4Vtr54rYdFLiq+NCKtb/bIgAQfBTTf9Q=; b=APbzfF6DVKkNQddz1KqlVEnvrU
	0ONShdDNgBKL2KrgVg6s5X8qyDZp3maUhgZaWDzLJa31EY0IcWzj2Ibx3qUQlgiMD1G3TWNkwKPUt
	C6C8sjGzrSiABVbbVvaHOxDgaO8vsafPw7o1wGQtjo52bYfAB6w0wgiDFivcr9iu1O7Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVZu0-000sYb-5H; Mon, 23 Nov 2026 20:40:36 +0100
Date: Mon, 23 Nov 2026 20:40:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: filipp.dunsky@gmail.com
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: mdio: Add Cortina CS7542 bus controller
Message-ID: <e55e5103-db9c-43ed-8bcb-406909fe8f5f@lunn.ch>
References: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
 <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>
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
In-Reply-To: <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>

> +++ b/drivers/net/mdio/Kconfig
> @@ -291,3 +291,16 @@ config MDIO_BUS_MUX_MMIOREG
>  
>  endmenu
>  endmenu
> +
> +config MDIO_CS75XX
> +	tristate "Cortina Systems CS7542 MDIO controller"

This file is sorted by tristate string. So this goes between

Broadcom UniMAC MDIO bus controller

and

GPIO lib-based bitbanged MDIO buses

MDIO_CAVIUM is an odd ball. I suggest after it.


> +	depends on OF_MDIO && HAS_IOMEM
> +	help
> +	  Support Clause 22 PHY register access through the CS7542 MDIO
> +	  controller, retaining the prescaler configured by platform firmware.
> +	  Transactions use bounded polling and recover from late completion.
> +	  Device Tree describes the PHYs sharing this management bus.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called mdio-cs75xx.
> +
> diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
> index 048586746..2afa6066f 100644
> --- a/drivers/net/mdio/Makefile
> +++ b/drivers/net/mdio/Makefile
> @@ -35,3 +35,4 @@ obj-$(CONFIG_MDIO_BUS_MUX_MESON_G12A)	+= mdio-mux-meson-g12a.o
>  obj-$(CONFIG_MDIO_BUS_MUX_MESON_GXL)	+= mdio-mux-meson-gxl.o
>  obj-$(CONFIG_MDIO_BUS_MUX_MMIOREG) 	+= mdio-mux-mmioreg.o
>  obj-$(CONFIG_MDIO_BUS_MUX_MULTIPLEXER) 	+= mdio-mux-multiplexer.o
> +obj-$(CONFIG_MDIO_CS75XX) += mdio-cs75xx.o

This file is also sorted.

> +struct cs75xx_mdio {
> +	void __iomem *base;
> +	struct mii_bus *bus;
> +	bool pending;

This pending is odd.

> +static int cs75xx_mdio_wait(struct cs75xx_mdio *priv)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_poll_timeout_atomic(priv->base + PER_MDIO_CTRL, val,
> +					val & MDIO_CTRL_DONE, 1,
> +				       CS75XX_MDIO_TIMEOUT_US);
> +	if (!ret) {
> +		writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);
> +		priv->pending = false;
> +	}

Have you seen this fail?

MDIO busses are simple things, it is just a big shift register. They
pretty much don't fail, except if the clock is not ticking. Any
failure is generally fatal, and you can expect cascading failures, the
next operation is going to fail, and the one after that etc.

So i would throw away pending.

    Andrew

---
pw-bot: cr
