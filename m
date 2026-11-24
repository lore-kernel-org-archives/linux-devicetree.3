Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548720;
	b=jbWQYYBHs7Dmpqh6qKhKTofkP2AiQ96Wyepibo7HTIfNt1v1iY7r9zoudLZhFgP8+/gb
	 6nLmNFMIHqldiBWi3yo1F6S1rd45gz/OE7H2J86KS8E7GxNmlwybJA+nrcplOxKiN0B2B
	 FvEvsLlKb/2bMuz0hDe+AyHxACpju3mYRVZywdpdE1+jWYjwEDAHa8xNt46+mbnwB9QBK
	 1Lf7eX9O3vNttrIkh64AVzr8cwn+BkbaDjPIfVMgApZU6INieNKnND9f3ZwLPWFiun4OS
	 FgeaKC8gRJch5rNpGk8mRqvk7/6wyEtX0QFauKpall7g9Y9i0wo91L+PKhbDGKV+snw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548720;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9Vjg+DO7VU84bQ+x1k4iMQ7LKWoND2JoeaBzPdTz2B8=;
	b=2bz7+piSxxyTOwNwHlDXaf4ewwLSL13o2qbig+H195GVq1e/VEJzNj6B2ROLgLbZndX1
	 LvMlXG6H9s8uCd8DngEDpqmXV8iDOeeLDKjPfSD4TqwJXhMoWQTh7g/FD5NEUD2ou/4Qq
	 IYGoYq2wta+o1LAi8mVpnNJBwfz2u/NKYoSsL/dKfWxirTrIPLwHbpBevnYYnPKTsIZPJ
	 aqpF+CW2jaZ8IG4Qjau38ljsvfOI1tZytIE37hMxwJ82dLgkXsjuNvT2bi3au9MC/Dehq
	 ci05Q2vBOkT2WYIkFXRqEYH8zX1Gpf/uGS7c+jwhqS4sPuKWVS+Df5f97vNreLRrJ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=GmR0BPrU;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38072606A326;
	Tue, 24 Nov 2026 19:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38072606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=GmR0BPrU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9Vjg+DO7VU84bQ+x1k4iMQ7LKWoND2JoeaBzPdTz2B8=; b=GmR0BPrUaux42x8qg67hZWmumE
	aP0l+JZ5XFB//QHgO/XyC8NouDBm8qslGPXfTf1aMXRNfkJEY0bzjJS9ovyLkRiLkuUz9F0HhK6JS
	fTtgH5jz6VfXc27uonpeuqT3xI9/hUUFTP93qy9R+ijiJEwfwbqsFOtKTyTWbMD9asBY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVwF6-0018rp-92; Tue, 24 Nov 2026 20:31:52 +0100
Date: Tue, 24 Nov 2026 20:31:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: netdev-bot+sashiko@kernel.org
Cc: filipp.dunsky@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, hkallweit1@gmail.com,
	linux@armlinux.org.uk, andrew+netdev@lunn.ch,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: mdio: Add Cortina CS7542 bus controller
Message-ID: <5cf79810-4a6d-48ae-ab77-3c94b12b75d7@lunn.ch>
References: <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>
 <179554724805.3135.16586449147336941619@kernel.org>
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
In-Reply-To: <179554724805.3135.16586449147336941619@kernel.org>

> [Severity: Medium]
> Can one timeout leave the bus permanently unusable?

Yes, but that is expected and not recoverable.

The LLM often makes comments like this, it does not really have the
concept of the hardware being dead, there is no recovery.

Andrew
