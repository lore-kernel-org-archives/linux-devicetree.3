Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462882;
	b=KU1W+lUFWIqfd8trnjYiwzq8B94nWhdjGAEk+Gdjqjl9YLdZv2FT9r6a4VpuMJuQKvB/
	 kAEBNJ6HlmHOAj6bv+sh0U/WwBusMqq52L4+Vb+SS0J4/eUoiq7fAeymXHCIZ9jlpxjBo
	 2FcdEVzTgohfC7k8PQJlCsZLBiMhXG9/k+OryM/jeBLh8iPD9CF74BGDD8S1Zl6eSq/ha
	 zE2r0EAOOI2wUuAnQysedhPKwagQ55pt6s6EyFHsifO6CW5kQyl7WyAT1MbkDzcosKK+a
	 vuLCBHln7WcY0rK9vXQXEVceEve4MtY1dzQstKGp220aGR7QThZ3FL7/Ipoyy0j9WVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462882;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FxD7ernARvm8di1v9KF7tBc0PpAhQj6y9u5xElDnL1o=;
	b=YLuFiEZm5dUgc3wDaaBHpuxzHpPOmDWnxk4kpTXmMKe0mkUr2k701OwJ82A9xPFPEKHi
	 2fH0h2FnDAP7OI8v72gIOQP5JnBoVhR4N4rU0T5iwebSXoz1rhxX0AFahEcCJTgKxtTKv
	 pRqq8HntMYAStvuGDm1tgOPud6PUH3LkSSYS+sILZAyR2OvrbP/fXDx4n6IyM1KZ0g8s5
	 twR34RCQkWd2TC28dZPm+6y5bBzRoGeZKDI8dfY2I6HaOcltbLAZKaLervx+dl98RCXsT
	 R9yXa38n51cU8Tm88CLBD7nOymQgBtE2PyCvPcRTUW774nv2bYU0+LJOURITafz7OAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=StG0HfOW;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD5606A330;
	Mon, 23 Nov 2026 19:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BBD5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=StG0HfOW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FxD7ernARvm8di1v9KF7tBc0PpAhQj6y9u5xElDnL1o=; b=StG0HfOWLPDSL0m23JLTtVQ6Jm
	wvKZLlgGCp4gHwP/BYUsnEBjf0cT+c5p2Qv4lJpylDeSCoVeww0a3PNX5VIJY+2qkBNMgCBJWCvUk
	uJwEcb1xrLTz/HY4NBSNzYGiKg8qEq84wYwzEKzFAUig5elMvjH6iM7qN4+pbzfGdk38=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVZua-000sZr-Uo; Mon, 23 Nov 2026 20:41:12 +0100
Date: Mon, 23 Nov 2026 20:41:12 +0100
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
Subject: Re: [PATCH net-next 3/3] MAINTAINERS: Add Cortina CS7542 MDIO
 controller entry
Message-ID: <f3d9907e-bf8f-4e72-906d-d89e4cda2abb@lunn.ch>
References: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
 <20261123-b4-cs7542-mdio-v1-3-626d0a0e3b4d@gmail.com>
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
In-Reply-To: <20261123-b4-cs7542-mdio-v1-3-626d0a0e3b4d@gmail.com>

On Mon, Nov 23, 2026 at 09:41:44PM +0300, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> List the binding and driver under the author maintaining the Almond+
> platform support, together with the appropriate subsystem mailing list.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
