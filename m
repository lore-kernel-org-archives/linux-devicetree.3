Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382684;
	b=jbJhoN6W3obnQCqbIz6uLlMWHWZrZwxJP7ocCnjVA4OCTqEzJGfag1RxMPJxW8YAGdeQ
	 0KSlknfb3PmHQqXLJM2u2OCd5k5keN0nu5IgU4kTUQvamFJ0iOhV1IFF7XrsWlNrKifkU
	 zEvfXlAaCEU+a6vbbUPTEJ4RMwfZrd+ZM5psnYfGpJO+06xLfctgIOF37so2LOekRFT/i
	 OsscHcd17pf+tWzZAsGf4/CtmLBXBzr2fX4hn6B9ckcH4+reP5Sw/dG3GKLDHVp4k5wFj
	 5WwnoxTLyJgoKH5SkzAZtwYPWmfqSdbQYXGiRBUxq6PEaD3aM8m0sdYFnsR3N0pI9WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382684;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kMLeaGELYsYS7Led6Wuz9RBFocdL6pgm4qhWj2t96to=;
	b=3LLNW61YQtCtjpZomYrdhic4xrA/h00Q2dnKkjnnqewA4yq2QIaqeFuV2SIEiTTcBAt1
	 sJ+zFQBFiGpRSU5nFAEiTcNSDG9C4IAC7N3SNuL2GJJEHn/30S94jTQEX/KeXCd/4Hyzi
	 TniJxrSzb2NCOGAfO2/ijf8MCaUrn9Iht3gxFZLI0Dr/vs9mkCYOtaAcy+N6ryNKxwXiz
	 KQ20AHitNff0oe2rbDGMSxJ4NrOK2/5044vNjYD2JCtDxu23l8JfY2FOeViHS9R+92tN9
	 4L3R0XJnT1traxZsy2eN12IXk8iTDjK/gfd81udlYwTIXCAbF1qb+ZcFkxgeU0E3Czw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ea70ZD3R;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648FA606A31D;
	Sun, 22 Nov 2026 21:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 648FA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ea70ZD3R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kMLeaGELYsYS7Led6Wuz9RBFocdL6pgm4qhWj2t96to=; b=ea70ZD3RFYf9r7Xo5xERlpSNX3
	AuDkMXwq5WvQxReRV9XyZmMClcnUQvBR16VfFzUrCRcPoYscwPr3QyE2q08LU1T5iTvczF40nS10P
	ciejCfBk35MXituFAEK7Lq93QSePM9voI721EsyAEnhJM+1t9eJ6ZZpUjSN9nnKwQt0A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVF2u-000cdk-Jj; Sun, 22 Nov 2026 22:24:24 +0100
Date: Sun, 22 Nov 2026 22:24:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Jelonek <jonas@jonasjelonek.de>,
	Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH net-next 0/2] Add Realtek XSGMII interface mode
Message-ID: <df35e0d4-9f1f-4882-bc6b-257add4e9fb1@lunn.ch>
References: <20261117084748.2387647-1-jonas@jonasjelonek.de>
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
In-Reply-To: <20261117084748.2387647-1-jonas@jonasjelonek.de>

On Tue, Nov 17, 2026 at 08:47:46AM +0000, Jonas Jelonek wrote:
> Hi,
> 
> This RFC adds an explicit PHY interface mode for Realtek's proprietary
> XSGMII transport. It carries eight 10/100/1000 Mbps ports over one
> 10.3125 Gbaud SerDes lane. Each logical port remains limited to 1 Gbps;
> the aggregate serial rate is not a per-port Ethernet speed.

We should be careful with naming. We have already have QSGMII and
PSGMII, for Quad and Pent. X is too vague. So we should somehow
indicate 8, Oct.

But...

> Protocol identity and naming
> ----------------------------
> 
> XSGMII is the name Realtek uses for this interface. Calling it simply
> "octal SGMII" would describe its capacity without identifying its
> protocol. Existing modes such as QSGMII and PSGMII already distinguish
> multiplexed MAC-PHY transports; the PSGMII introduction is an example of
> adding the generic mode definitions separately from a driver user [1].
> 
> Cisco USGMII is a relevant comparison, but equivalent port capacity does
> not establish interoperability. Cisco defines Q-USGMII for four ports
> over 5.0 Gb/s and O-USGMII for eight ports over 10.0 Gb/s, using 8b/10b
> coding and a packet-control header [2]. Linux already represents the
> quad variant as "qusgmii", with its own control-word decoding [3].
> 
> Realtek documents XSGMII and O-USGMII as separate RTL8218E interfaces:
> XSGMII runs at 10.3125 Gb/s and O-USGMII at 10.0 Gb/s, with different
> hardware strap selections [4]. The SDK also distinguishes them in
> phy_8218e_macIntfSerdesMode_get() and applies separate initialization
> tables. Realtek's O-USGMII is therefore the candidate for comparison
> with Cisco's octal USGMII; it is not evidence that XSGMII can be renamed
> to USGMII. Compatibility of those O-USGMII implementations would need
> separate confirmation.
> 
> This proposal retains the vendor's XSGMII name rather than assigning an
> existing protocol name to a distinct hardware configuration. It does
> not assume a particular XSGMII line encoding merely from the line rate.

https://deepwiki.com/lotusmomo/airoha_sdk/3.1-sgmiixsgmii-drivers-and-apis

Airoha also seems to have an XSGMII. Is it the same, or different?

Adding Christian.

I hope we are not going to have vendors introducing there own
variants, and we need

PHY_INTERFACE_MODE_REALTEK_OSGMII & PHY_INTERFACE_MODE_AIROHA_OSGMII,
etc.

       Andrew
