Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884847;
	b=xA05BUu30/4NOd0HJCasYFj+FX4P2J9qsTnh9i5uJDvRYCR7UGTfruK3NIWqgE7r61XA
	 fHRPnxHIUPaFsrkkO1WJgkep6g7HMvRRaAD2L30u1wDb9oQMNJlz17glsPD5bB/pZqT33
	 jW2PMgrBbNfQXk2GOdYnY/n5TAbveoDyJwY/IHgvf/wOTgz+tnspZJdyYh7b0kmAKJUs8
	 a6GdC6b54cLBBdlTa8Vkl84fyaq15lQV7FV8ihq2Ss6zz4k7dFSyVsCiHkjcuYA7jTf5K
	 JrS2GN9apy42m2UyEzazB+vHlxQnJEzCBUWBYrPFiQ3xp+bYrr+VDyuRK+c6dFbcwUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884847;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8It8RVjGfp/NpAy2/y5u9GfJHtUMavZffPYM2+kcgLA=;
	b=2Kw7zEFFJaP4xyr6b4XgaIKwmHIhRytapXNH/9IJC0PQGippudxdxK9hvsPiDdHO0Mnw
	 i0WKBV9U7INW7beWS4rgcThja5S3XqKXj7aiORU5Ufm1kjhmoqWPJOJzzZCagvlioaDey
	 CXffM8Tlp89ZAiEBzZe/eBVaVpzkM1Nqx/hFzWxSUpPhSwqr3GRByqoGawPDv0pVbO8Of
	 1yjCyzcxeqRl6C/l7sOE/bZgS9yxeHHTDO7LlFqfjxjoQbTn1w0SomgcAKN+2x4I/SirN
	 vBW8SaR/apvJ/fdjZwfl+h4LE+JBSl557SYe3qjZS3NFTzQ1rbxcBzG3YM1wm9PqlBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Saigpd4N;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90779606A321;
	Sat, 28 Nov 2026 16:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90779606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Saigpd4N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8It8RVjGfp/NpAy2/y5u9GfJHtUMavZffPYM2+kcgLA=; b=Saigpd4NakftRHygrXo8G2CZJK
	hyTr3J0QPjjQmiZInyiV3CSZdW5Ga7iZyuDIXsx9uxEnewNRj9G1aKDWUCm0ixFSlRYwMZNIsc8y+
	+21u/60VmXDDPK1SAVzdCKJvdKMrjSx7Q9sH4weWc838R1pDRTLbQdcsiiYuzr2eOKvo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xXLgV-0020eN-NH; Sat, 28 Nov 2026 17:53:59 +0100
Date: Sat, 28 Nov 2026 17:53:59 +0100
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
Subject: Re: [PATCH net-next v4 2/3] net: mdio: Add Cortina CS7542 bus
 controller
Message-ID: <8b0db660-4dc5-4533-afa2-d708d22dfc44@lunn.ch>
References: <20261127-b4-cs7542-mdio-v4-0-0e37fc0c47d5@gmail.com>
 <20261127-b4-cs7542-mdio-v4-2-0e37fc0c47d5@gmail.com>
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
In-Reply-To: <20261127-b4-cs7542-mdio-v4-2-0e37fc0c47d5@gmail.com>

On Fri, Nov 27, 2026 at 01:14:23PM +0300, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> Support Clause 22 reads and writes through the CS7542 management
> interface. Retain the firmware-configured prescaler and unrelated
> configuration bits while enabling manual operation.
> 
> Use sleepable polling for the bounded wait in the MDIO bus callbacks.
> Report timeout errors directly without tracking a pending transaction.
> Use managed bus allocation and registration to cover probe failures
> and removal.
> 
> Acquire and enable the required APB input before accessing registers,
> and retain it for the lifetime of the registered bus. Managed bus teardown
> runs before the managed clock is disabled. The firmware MDC prescaler is
> preserved; no clock-rate or divisor programming is introduced.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
