Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130510;
	b=E68kc6BxK01zsOJ657xLzKsOegNCTzguI3qwJmiSpxZOzTsnsy+r5NnJXVSXRA/K1kQ7
	 EFLsQSXAdSNuRL6QD3/e3RY6bBQY3ZTYxyIBJziTXjOZAph6Otw25ahsngvwl34ZTWeGW
	 62W/6RbEMiV8MntbjlbW1ZOGm2oaWOwWrgZwq10dqAwnu9Q1NDaJJh6tKsgNQdUFLSfln
	 7ZecxchZa3l0P0S5ndMfoUQYrZi+qSZV95FwbgnDzgIQjWkaxk66dFeZrnN4G2/Dta8nw
	 A8yNyvwjkLZ8Fx9QmgtlKdlyT43KOAnGuVGMeWTzxaHwS7jEcAWcFI3mpAihr8SjktA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130510;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EGAR8AwNfaaNnY+c/wiFpYuTC+Sl5mX+8pWJKXAFaeA=;
	b=SqmAl60raDSpDDnWmlfxiiOwROoZXJmsIskZpgqBiqMwg+w5yt4C4mtM8ym1PRCm8JFX
	 aiW6QPpgOoEcjVipgkD752bWLCukuOEJfhxzmfuPL/S0/Tzq7s+jilSQ10rd6KO3Gq6Vm
	 xGYrgO2R87r6pyjgn9uAnX8Cg1N/ieTZC6qeK4lq57hcv8WecYP0BQ/IsxFHtg3uvFSx8
	 SSftX/6IGDPlBZx7g4GBTcWhnNoK3OZOn2XNRk1OxVs1tspheUCUB5NLhpSryvPDabZ4q
	 s+l3tqVxavvWlA6r6SWl3xTPEV7HuGMTXaFNXhOupu9p60LxrkapwHgVja21dC89fDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exKS5AOW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEDE606A320;
	Thu, 19 Nov 2026 23:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exKS5AOW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1B31F000C4;
	Thu, 19 Nov 2026 23:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795130510;
	bh=EGAR8AwNfaaNnY+c/wiFpYuTC+Sl5mX+8pWJKXAFaeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=exKS5AOWd6cAQi3uKf0M74CRJzeUBwGdpYRoTjlYR7fTPEjOcGC4rXhLCfilnGMOj
	 GbyKnhzg6qW78qHFLa4/ixUSdp5vLI4GUzXd6MiavClaZjFKuf467oG9sF3G3l0hlY
	 CBhaIimtghJ0QNny8wVb/xbPZmBcPbRbG+h4P5/CGhM7rZip08eVsIa5UoQLhMGQsA
	 IKNucTsQGrmQSMTcLb0400X5qWSeKCoyoaPE0nnle+m7Y32qNkeR2QYh2lk1W1zmdF
	 uTcWQw2gZap4gAsBB8JK9G8gOIskT8M4mEXIJUACjZRTuKrcqfH1syxTtOXv4X+0Gd
	 UETr2tmDegMsQ==
Date: Thu, 19 Nov 2026 17:21:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, tbevis@amazon.com,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	linux-arm-kernel@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 2/9] dt-bindings: i3c: Document the AST2700 I3C
 controller
Message-ID: <179513050618.1478011.10339945188286451327.robh@kernel.org>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-2-4d8fff5c5196@aspeedtech.com>
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
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-2-4d8fff5c5196@aspeedtech.com>


On Wed, 11 Nov 2026 11:16:30 +0800, Billy Tsai wrote:
> The AST2700 I3C controller implements the MIPI I3C HCI programming
> model, extended with an ASPEED in-house control block and a PHY
> programming window advertised through an HCI vendor extended
> capability.
> 
> The controller takes a core clock for PHY timing and two resets,
> named in reset-names as the controller's own reset and its DMA engine
> reset.
> 
> Boards without external I3C pull-up resistors can use the PHY's
> built-in pull-ups instead, selected with bias-pull-up; the achievable
> strength set depends on which pin group backs the bus, since that
> fixes the pin voltage domain. Reuse bias-pull-up (pincfg-node.yaml)
> for the strength in Ohms; it is declared on this node rather than a
> pin-config node since the pull-up switch is part of the I3C PHY, not
> the broader SoC pin control IPs.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> 
> ---
> We considered expressing bias-pull-up's dependency on a pinctrl state
> in the schema, but couldn't find a clean way to say "depends on
> whichever pinctrl-N is active" without hard-coding pinctrl-0
> specifically, which would be wrong in general (a node's active pin
> state doesn't have to sit at index 0). We've added pinctrl-0 to the
> example to illustrate the typical usage instead, without a formal
> schema-level dependency.
> ---
>  .../bindings/i3c/aspeed,ast2700-i3c-hci.yaml       | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

