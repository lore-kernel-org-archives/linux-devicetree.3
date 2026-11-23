Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471551;
	b=qszJiv9Q+1x0WxQSHM7Z2fR2UE0fI46GhRi/47lRl6YawUPS6b9T6aynqvCHVNReCxNd
	 ZfHotaZwvSzFV+N/6gEo5jMfxVXBobQQAg+a0wuU9fJrWijUeu1ibeVOao/2VykKB70TE
	 5+d0TmduE3/9FedqTLLpRBjQxuEyJAeilJSqoVtfYYXh5d/pOsOOoVWa21c3JaXgEAEUt
	 5bf6M2tmUE3YPt5BOAPjTAXmjEDwpNJYBgnGaKKEtxeAU0QT5N8WQ1AJGXs1PPCH6y4/C
	 Y0V13qvvz0w4+S9vqpP82ENH5rw159E3HVTDoZOZ4loJYyIJLJSLBcuUL6HqnEMNAkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471551;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=UMbwUeB8t+bBe5Ch2nKDl0BemN+d0WbUUhpgXgVg7Aw=;
	b=FKTRBONvLD6gfRvaGfDu/vFF1+LsdLUzOjnzxw5dBdGJd0PykJ5BwYuaTSySyYRl7pLK
	 eJkhS1FYhtNy4nxvVfcX3rOLlirU06IM8XnETO5iD3EOO02AyTOpWdNbCkiP4EIc7xF50
	 rJaejFZDuh5palKwGjgJJ7psQr7sHchN9Kr3xVdAt1bgQ2DowP5aNZoNxXVSi2V9AKyYP
	 E++PKXJEC/Pfkt/YhQ6QWIxCb45QLXO/MN3r81dqWy+ZOT+mYLipzYjRnu4taxMIjEysj
	 UmUL7evK8/R7vpAqZFXzRrRlOOStnThs33Z77WpBGIzFniGwInsqzcXoKmCskomAWtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=E5STnlff;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAC6606A327;
	Mon, 23 Nov 2026 22:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFAC6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=E5STnlff
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UMbwUeB8t+bBe5Ch2nKDl0BemN+d0WbUUhpgXgVg7Aw=; b=E5STnlff64Gn8IH+Qnqieq/Etb
	EMU8DWBBBZWQ4Ao5o+ckh8EQ9HiFx14Uhn9TXNq3jCvctiLCKkGSd4xdzQBBcjSqSian6qZ93+wPK
	V00ke96kUHndeowZRlTQ0OnDFpwqgJQnSu64C9q575bp/cuEl3Qwaw0Dzx7BfC7/9eM8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVcAC-000uQ6-CR; Mon, 23 Nov 2026 23:05:28 +0100
Date: Mon, 23 Nov 2026 23:05:28 +0100
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
Subject: Re: [PATCH net-next 3/5] dt-bindings: net: Add Cortina CS7542
 network engine
Message-ID: <1d4fce88-c959-4bae-993a-c5aa1d792177@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-3-fdb5e8c2d508@gmail.com>
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
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-3-fdb5e8c2d508@gmail.com>

> +description: |
> +  The CS7542 network engine contains three GMACs, the network interface (NI),
> +  forwarding engine (FE), queue manager (QM), traffic manager (TM), scheduler,
> +  CPU XRAM interface and packet DMA.

Is this three independent MACs, or are we talking about a switch? Can
frames be forward from port to port without the CPU being involved?

> +        ethernet-port@1 {
> +            reg = <1>;
> +            phy-mode = "rgmii";
> +            fixed-link {
> +                speed = <1000>;
> +                full-duplex;
> +            };

This is unusual for an example, in two different ways.

1) rgmii often wrong.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

Does the PCB have extra long clock lines?

2) Why fixed link? Does this connect to an Ethernet switch?

   Andrew
