Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704745;
	b=THUCYazfYJhFR40RliihVK6ezhBCwWe+GbnTxG7tPHr9ZataZyFtpH7BtTSuz5Mdcsce
	 HENFAC+GQi1cfKU+I2Boyk7JWWXWjsoIrcPeDSyC1kEJ6a5+0iJF0btdS48+ecy3heqLZ
	 WsnyQchWwywAGj61t5K79fLSzfvTkGdStMXvayhoNtAF8gihTFnSFuFmb6fMl0hrCgbR5
	 yYb7O63FzmAAbpnb0xoz0VA2Z4eG8qwwzgaIto+xSA5Xgp9Wl4gv3ui+JZ1Gmu89SImk5
	 KIDRh1yOcBwDVjT4CgjkdS2hdxn3E4Dg9dg3bopvMHMoQTFY6zUa+75CYj9cPxdvs4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704745;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=hpN95cSXW6hRkJYCYFxzmkdUDs1CcPNj9kyGcoP5BYU=;
	b=SwONoKdY3PBWASK0CvfVFP795ftEFlSkPY5ujc4ohUTg/B2xYjlEqmYPROYXZ0jc04B1
	 vPZaxeijNaamJ9sjvrj+rQvOW6aP+TyDgtPuXWICeDbDHWZKYrPTd4pgTAXcxk3xPeTVc
	 s0a6VOuC0FWoxHr7mcAWPxSD0Vq5oFN6fKsAFtetJO4tibJbjEVSZDgoBscqiBW52wseW
	 4wJ5ehtnmQLflzf3BvClO0oso0UTwaQiCUNxpQaZ75Z7905rBJ4Wr8hh1vr5Z0WPtY2I1
	 c9v4EA/JA/aXU/OFD3cPaAqQU4sayyzq0RU4hKnveCgqJWl9xYC5otYY0hfnT0snBOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=dwrwLsTR;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FFE606A31C;
	Thu, 26 Nov 2026 14:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FFE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=dwrwLsTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hpN95cSXW6hRkJYCYFxzmkdUDs1CcPNj9kyGcoP5BYU=; b=dwrwLsTRHvnEBM1jigUevufgNu
	EblnaD/euWSLqO0o8DbfbqFqEsNYoj7zQdyaCvj9AIFGiK7GfF/fpYhhBUijw+RbhTjko1fTdLDSu
	GIkjvhPJhtXafXxIHizqj/ukDg9RvkH4ZEktQeEQS3SPZ6D1ALqjcU6s2PkzyDzG5rr4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWapY-001ajo-Rg; Thu, 26 Nov 2026 15:52:12 +0100
Date: Thu, 26 Nov 2026 15:52:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jerry Ray <jerry.ray@microchip.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bo Mellberg <bo.mellberg@se.com>,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH net-next 0/3] net: dsa: lan9303: add LED mode
 configuration
Message-ID: <a96f239a-09f0-4899-b5e4-1cac4013b3c5@lunn.ch>
References: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
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
In-Reply-To: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>

> This series add the ability to program the LEDs function via the
> vendor-defined property 'smsc,led-mode' at setup.

Sorry, but NACK.

Please use /sys/class/leds, with the ledtrigger-netdev, and offloading
to the hardware.

	Andrew
