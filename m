Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881602;
	b=sZ3DoECiHxeyJLLotNeR3VWgBUw5l8KtvLRMHcOQ51xIFoZGGKq/0iafGcIurUkg2uho
	 27av/e14p5DXoh9kyikyfUKSpu8dAcQg8bcVSNb1a/QN+T57O+OR7UartquLrOukk/AdN
	 t9D80q3DVrAhy/4SxQ+/Hl+slfQYMpIP/CPMpL+/ABs3SHSQoTmsUll8pnlzwiPg31fG4
	 OY9P9wxJEIOSwNWbJ1wtSqUQpNFXO7F5C5Z6hnyb23m2g4egX6fedSxxwwzCOziuvEI8n
	 tQD83n4y2E0J23OQCAtOqHcN3zU6yQbnyFz/oMZ0CcQVePdyrzA810bWmkpL4QreDhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881602;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=VDZlYT62DLMq4/bV/vxxwJ3hSgltztB3YVXdaM0u9JI=;
	b=pp+A8yLKPRFWIgQiiDm8wE4M9Sywp0c5uYA7Cw4mgun1DEXIr5a4wDjmpJ0qxKDfIMay
	 +PIte3NwZE0BPcaNWLDi1xejfU0mA2AzHYmmva+H+isskKYJ1k4FAhkWTv+SVqT2vUOoD
	 fsnZfpHWrzl1aXFr7GDQ83k9CPSiOUixbyvmNOxioGtvlf6JSX6hOQ5FsTNaGhrp5mYqH
	 SC8Q83wnhdL4qTu6ZcXo8GG+upNv7EKE54oS1dvOg8ZsvQebCaOoWADYdfqSKsjiSEvAp
	 mqtEeJzK/npfxQzl5oSxwgiELidxypyR0r2jSqaHpu8Ad3DF73Q4ksgNQwLTaVhCjKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=2CxxdLkO;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210A1606A324;
	Sat, 28 Nov 2026 16:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 210A1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=2CxxdLkO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VDZlYT62DLMq4/bV/vxxwJ3hSgltztB3YVXdaM0u9JI=; b=2CxxdLkOoxRth1lz6jYvoBrNj5
	V1XvifqHJ4/7cb3lsAuw826RLA/oYduRgXEG9wrdkmCfM0KFNJyzaWw7FOj4lGwnrRAzIgNl073lG
	cgwUpQTcR4i+BnJIps2gvl45uYrsoxLeMjG+sic4Ag0HNPAGCf7GN29kNYkOwe/HsR7M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xXKpu-0020FX-7v; Sat, 28 Nov 2026 16:59:38 +0100
Date: Sat, 28 Nov 2026 16:59:38 +0100
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
Message-ID: <de94e9bc-142f-4e3b-8bf9-b2c2c56e3c27@lunn.ch>
References: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
 <20261126-lan9303-leds-v1-3-a96731317859@bootlin.com>
 <4d2a5db3-2829-4383-8f8d-05cf7c94fddc@lunn.ch>
 <DN627T3YFWKR.2YJE24R4DRSDN@bootlin.com>
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
In-Reply-To: <DN627T3YFWKR.2YJE24R4DRSDN@bootlin.com>

> At first, I thought that the fact that this PHY has a single field for all LEDs
> function would make the vendor property somewhat acceptable.

As i said, it makes the implementation messy, and many of the blink
modes are going to end up in software, but it looks like the standard
/sys/class/led API can be used.

I would try to document an a simple to understand way what each LED
can do in hardware. That way users can try to keep with the hardware
offload cases.

	Andrew
