Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472691;
	b=W2oD6LcsQzhvVLEyVIChhKhzm+v1VZGJfDk7/wuMD74TO4tcAh13aRTXZEva0Q9STT6q
	 z+dOHFu7KzmS0K9P252rzdEp/w0NdfsFakVpLfxcgmvXhMCeFi2w9hBpmnshWUaT5DomF
	 EG9UWRseVtYVjtvmUJjwMp25vMEyd8H6+xa9mt9hbi8nXp/+r2Te6HMjIc+DaHBWQx5Wf
	 TYgwhSX7BSpO0Lg0Yd0DaeC1fT1FmsR/n+4u7W2iNRMcbVPREUcjrzIJOAXaPQDaBYNJz
	 IJfeul5yS9jfduAx6G0xZFNJF9gV4tQkAGw7BsBPeli3rrZlV/iU47zV07f1FxEEz+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472691;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=uG+Qr7dBqxde6e6CrYVj5rbF/dxo3B1Cf2kSUU+32ss=;
	b=VQK4/gBll0W553fgUYaRVog30bxIGpba8m4UxoOLSmlIb27fF9OJPFOZNAaJ2+esvQFE
	 q6ZqnI5xabTAlKLvQ7RIKGc6yRTVzWZsh/6AaMwSWQL+hs4mWIJ7OuKOLtDCrrOoVKBgY
	 kn3nVp2cC9jyppU5cvnyFghEQD0QkhCmw4ELDj/B3Z2TgWVVQ+IKpssLua2e4jYrlrGsM
	 L4BpFLpLoNMGFJysBWckVG7+Fk3IEbsoouZKTmwSPTUN9jvM4YWwQshbAA+qzp0PKmQe5
	 HF163vccIe5daBx3gRMb+jJmRY/1WaUMuEE2L7XKrSW2MMGNS8IXiZ+FWJ/ITKpUIEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=pl3VJraO;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F005606A31E;
	Mon, 23 Nov 2026 22:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F005606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=pl3VJraO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uG+Qr7dBqxde6e6CrYVj5rbF/dxo3B1Cf2kSUU+32ss=; b=pl3VJraOztDbR20nPZg4I0YChI
	59cIrO/hcjjwl/r7vM+XBpMfBQvC+iF0oWjT4NFe+R1lQwDWbkQT7snBzSagcicijS6GKYu96p55p
	ss9tkZ6jEJMaxYGupCefwlYHmLPpz8OTtimgCZJxEoDSckgaP/VfT3VWCp+p6D7B8V5w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVcSh-000udF-WB; Mon, 23 Nov 2026 23:24:36 +0100
Date: Mon, 23 Nov 2026 23:24:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: filipp.dunsky@gmail.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/5] net: cortina: Add CS7542 CPU network
 datapath
Message-ID: <560efd8b-44a6-4b3f-9f88-d1a891b4f253@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-4-fdb5e8c2d508@gmail.com>
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
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-4-fdb5e8c2d508@gmail.com>

> +static bool internal_buf;
> +module_param(internal_buf, bool, 0444);
> +static int napi_budget = 16;
> +module_param(napi_budget, int, 0444);

No module parameters.

Also, this napi budget is lower than typical. Why?

> +
> +static inline u32 ni_rd(struct cs_ne *ne, u32 off)
> +{
> +	return readl(ne->ni + off);
> +}

No inline functions in a .c file. Let the compiler decide.

> +static int cs_ne_open(struct net_device *ndev)
> +{
> +	struct cs_ne_port *port = netdev_priv(ndev);
> +	struct cs_ne *ne = port->ne;
> +	unsigned long flags;
> +	int ret;
> +
> +	/* RTNL also protects the final probe activation. */
> +	if (ne->rx_stopping)
> +		return -ENODEV;
> +	if (READ_ONCE(ne->txq.fault))
> +		return -EIO;
> +
> +	ret = phylink_of_phy_connect(port->phylink, port->np, 0);
> +	if (ret) {
> +		netdev_err(ndev, "phylink connect failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	port->rd = ni_rd(ne, NI_CPUXRAM_CPU_CFG_RX(port->id)) & NI_XRAM_PTR_MASK;
> +	napi_enable(&port->napi);
> +	ret = request_irq(port->irq, cs_ne_rx_irq, 0, ndev->name, port);
> +	if (ret) {
> +		napi_disable(&port->napi);
> +		phylink_disconnect_phy(port->phylink);
> +		return ret;
> +	}
> +	spin_lock_bh(&ne->txq.lock);
> +	if (ne->txq.fault) {
> +		spin_unlock_bh(&ne->txq.lock);
> +		free_irq(port->irq, port);
> +		napi_disable(&port->napi);
> +		phylink_disconnect_phy(port->phylink);
> +		return -EIO;

Please put cleanup at the end and use goto statements. That is the
general pattern in the kernel when there is more than one thing to
cleanup.

> +	}
> +	WRITE_ONCE(port->opened, true);
> +	ne->txq.stopping = false;

I've not looked at the details, but such flags are often not
needed. They generally indicate there is not a full understanding of
the driver API. Please review them, and see if they are really needed.

    Andrew
