Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705513;
	b=T/xk/flqqAyRZZepMNOe3ABVxHDdkl5D00M/oe6mgHiwlwB0c29MAhSAY4Rnkw7zs0/a
	 z+Yg83aZZPzN9pyQW0mCsbmX0AA4x5nFe92prwg/xKO4XTLRmA+8WSPaeIP+IzRQnhX/A
	 8WVub8r/wLz3bPv4XpOmibQYx/LNjtE4BW56pikTMtk8TLKni0mrxayhzTUFT4eoBXRSv
	 sf7HV1pzw6dHN+scevFByjvE+aCiDc0VXlrhavnaPAbpqqQosFW7YV9tLRoP0PcJDjjb+
	 /JaPMMY7x7pg08eITeKnsrtb/+dLL9RL0Rv3ASo7xD15bFQz9AtNiB1U7fvidFCTUiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705513;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=xgw9Cs2alF68ttVVZEfnYrUIUiuSk8K9/fzAeapHAI0=;
	b=k/VS513WVp0ZyW1NeUpHZrthUpYgtrXDoiwKJ4qXarBAyCq8n4YVbJ3bMDbJ8kiGS8z2
	 q07EgBzuzHg9dGMsgqeMzFH7NLyHTCS4GBAQnWI90Y1Qkke2QVi+qGRUywGizmFybuKWd
	 0vXlp04ZVKxm36PWeMKKPsjInCf2R4ygGRuwLf2uBNpcAouaWA4OCbhAAIetgRQobVy83
	 3Ky24nMn4gI5pU+dv0C6R9FMM7GiQhCKJf2lljSKngn0Pr5+Uxy+VdN04+uMIY9J6IZvH
	 pR4M82kJT6OpaYQPJDwrqMYXF5hH/fTHqW+t9j7df9mhvloejl14leV9d96fMTBySbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Q9LTg0t5;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DEB606A686;
	Thu, 26 Nov 2026 15:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98DEB606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Q9LTg0t5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xgw9Cs2alF68ttVVZEfnYrUIUiuSk8K9/fzAeapHAI0=; b=Q9LTg0t5iwzwxgjRUfXVDnEo0J
	MUIpnGoWGKz4SAnB8COXr7XcVrFzr/3nAygrnbM5+/7izsjYvd5Nwh4Z6HHnPOzNZ/FuAJcFS+b8s
	uoXOYVuGcF6WjEULHnr+J4Owqm+yQJObnSLJwI4D0U9BcQKTkQZQ7hZa8LDnA6gtywhA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWb1t-001b7K-5c; Thu, 26 Nov 2026 16:04:57 +0100
Date: Thu, 26 Nov 2026 16:04:57 +0100
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
Subject: Re: [PATCH net-next 3/3] net: dsa: lan9303: add LED mode
 configuration
Message-ID: <4d2a5db3-2829-4383-8f8d-05cf7c94fddc@lunn.ch>
References: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
 <20261126-lan9303-leds-v1-3-a96731317859@bootlin.com>
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
In-Reply-To: <20261126-lan9303-leds-v1-3-a96731317859@bootlin.com>

On Thu, Nov 26, 2026 at 03:13:45PM +0100, Paul Louvel wrote:
> The LED function of the LAN9303 and LAN9354 is selected by a single
> LED_FUN field that applies to all six LED pins of the two external
> ports.
> 
> On some boards the LED straps double as configuration straps for other
> functions, such as the PHY address or the EEPROM size, so the desired
> LED mode cannot be strapped and has to be programmed by the driver.
> 
> The LED subsystem is not used here: it models each LED independently,
> while this hardware has one function field for all LEDs.

Ah. This should of been in the cover letter...

[Goes and looks at the data sheet]

https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/00002308A.pdf

So you have the choice of using the pin as a GPIO. So you can
implement pure on/off. That gives you the minimum you need for
/sys/class/leds.

TABLE 12-1: LED OPERATION AS A FUNCTION OF LED_FUN[1:0]

The functions are rather scattered all over the place, but i don't see
a blocker to supporting hardware offload. It will be messy, yes, but
possible.

We have been pushing back on vendor properties for LEDs for a number
of years, so i don't really want to add one now.

   Andrew
