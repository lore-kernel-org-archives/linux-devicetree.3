Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707085;
	b=EB7w/2l0Vb60YqMbDUN4ZdeijAGF09VKJBlTxm10TKMzp36P87wWfqeQQDvU/AJRPbjK
	 EJTQE/nUQqwpnVcfw64WXJIS8Y5C8/9sGG+w1c4RDV4Yx+vK3uaA1is2WIApsMd/5bCD7
	 BfLcaH8nLlQznNeKwUczGe3y3zUVWI+AgVv0TH6eSO5rszSA99DdsZjoh47vVLMyNlTfP
	 6Rw4jj2e9UuEKaKHHVjzPctzNa6ofsfkLuOu+KbUyEv/V6BoPRFk9Ny5ftsLo4q24FalT
	 a18QkVEmCzO3sDaxARtTG1itUjhuNpKzDWI7oJz1v66SIZtEaMwA8aCrceljaMoXLew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707085;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=xQ0RSjJ7OY5hjeVnaVHGJ/axxFsswP+kzVwoQA4BraA=;
	b=2GDw8NfwNH+JROgwxfLBqsqoN63qKlX41D46JtwBrLL4V4v9joNKN3twpdYLD+9UWouJ
	 GgCUKTcmLLE7TNXE5AcseEUG1m/RsRNqfGMtYC4GFD/NWYigaTueGY1eTGxghRNHyiSSH
	 Huqmfx2z5xigl0tPNoINm0688dCMFkW2zZ2FGnT/SRVcYg52C/t9pevNU8NiGDtxVpibg
	 wBD01ZGEGsz6/E+Pr/jFMsSiJz4O4280OvxBXOBAJF8fw9ZplorecNCT44OLxjd8JOLH/
	 AD0nOmSWqitmBFBDpGY6kSYT40oXPzo+wcXgcl0byb+DC9E6B2Ds7FBlKNRJrW1XhJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=HmJJFbWf;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76529606A31C;
	Thu, 26 Nov 2026 15:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76529606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=HmJJFbWf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xQ0RSjJ7OY5hjeVnaVHGJ/axxFsswP+kzVwoQA4BraA=; b=HmJJFbWfwVAWdH/N+SCSq5KDX0
	8xgNLRqAWTss+beWiQ4u4TXrmBSQgoQw2kPhs2bAF/zqVjzXt8lfkGYs6ErB/7dCrGGTLkVB1Eo8k
	3E05jyy08z7u8IeFDIElQzJDDe7hBP/cjKGv0Z/PDJfE8gobHVV1AnuCS1KhN1MA0rB0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWbRK-001baQ-Ni; Thu, 26 Nov 2026 16:31:14 +0100
Date: Thu, 26 Nov 2026 16:31:14 +0100
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
Subject: Re: [PATCH net-next v3 2/3] net: mdio: Add Cortina CS7542 bus
 controller
Message-ID: <97babf2e-02eb-4efb-8662-f960a36b9073@lunn.ch>
References: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
 <20261126-b4-cs7542-mdio-v3-2-35739a0f3225@gmail.com>
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
In-Reply-To: <20261126-b4-cs7542-mdio-v3-2-35739a0f3225@gmail.com>

> +#define PER_MDIO_CFG			0x00
> +#define   MDIO_CFG_MANUAL		BIT(0)

Just curious. If it is not manual, what does MDIO_CFG_AUTOMAGICAL do?

> +static int cs75xx_mdio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cs75xx_mdio *priv;
> +	struct mii_bus *bus;
> +	u32 cfg;
> +
> +	bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	priv = bus->priv;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	cfg = readl(priv->base + PER_MDIO_CFG);
> +	/* The firmware configures the MDC rate; retain its prescaler. */
> +	cfg |= MDIO_CFG_MANUAL;
> +	writel(cfg, priv->base + PER_MDIO_CFG);

This comment is not obvious. I'm assuming the prescaler configuration
is also in PER_MDIO_CFG, but nothing here actually says that. 

/* The firmware configures the MDC rate; Perform a RMW in order to
 * retain the prescaler setting, which is in bits 24-42.
 */

???

	Andrew
