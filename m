Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122216;
	b=C8tIhkhGyr9PrM8rYCPgcukJxXmLOiRSFDVtxQhGuPCo+sEpZZOwX+VMCXNZNZ4mV3LP
	 mbL65XOpa6C7VnpB9i3nh48JLcUVOg0nxflEAgiDHe90i1LGIok+mKCOQmqgu94brqhXh
	 BgS1eR/RA0XCWdP9RXjVLJWPEE6vRXrmTROWTa9BRyXnN02z/CLXIPwN4KM7kfArHZoY4
	 +FDzUZPWHT9qOjMHK5+dNTW0KBEk61lrSiNiEKgZdU/N67JHZ8fswKk7wGUJQ2sNfoaBX
	 6nJdAgLPsJSdaovhZ5xzhzWysCk47YGDFoaDE3ItCl9Gt7A4gO3n5xxeCwb8kKwou/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122216;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sfsFb1aGEKDdDgduNvVaqLPO/+tVEkI1Hc7WtTzriM4=;
	b=FlsZ30jIk+0CSOMW26KXTo7DtmjRkvHRvsadse9ptWJLxlswhR9MATiQeq+6b/97LNIE
	 4pak4BKGNb8D+a52lJYJ9TY/4U05Oc5iGNuZwoJbYps8OGm7EwGCXeu7IdYPFQyWBlkZH
	 lDYY2/yYKkelx3qYfSwyhxdZmf/kFypsJBpm4ZrpUm94+v6CVs5kkZ9TH0V0t7E8s4BJm
	 a0M51cXMyetGrSEj712RPxMuc03LTmxTmtEH3fj6EhpEccgTycNZ/1h58pS1g6+VoKdM6
	 LsXrCFG451mE6jGhp7qom/+g4aJmI1GAJKvGUljBDcHvQ3BFIwy9JDhXNaf4gOKYVGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ec1yZDgI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617A606A320;
	Thu, 19 Nov 2026 21:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ec1yZDgI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224001F000C0;
	Thu, 19 Nov 2026 21:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795122216;
	bh=sfsFb1aGEKDdDgduNvVaqLPO/+tVEkI1Hc7WtTzriM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ec1yZDgIKaPP2Gg+BMqEMC7B1k7AJQf+XKLHQru6ochjFwVtKC3fb5DUSCBqJrLoz
	 0v740ceRJMbVFPLVI/cYo+OEFNwQRcYRBU9R1q0EPPenf0xwB+thk7kFbcVB9cDnNs
	 GeHiRRc/bmoqNKWrgF9g/XgPwuUbkhTwJY6Ccbbt1t6DKP9VqLvbSyc2VOJVTqd3pI
	 FyH4Ur/ihOix2mwCIzmNbpOQ0KBUs0CW4ZDKi+QSy2TOV7YxRM1yMMdyqXwV4iIodF
	 FDeKh/Xq3mmZR+ePmEHSoJfbgW7Nb+pQuwmCb4P86wLVs8B3NskO09jSMjnAEazAgj
	 Nw6e5SM8v8ugA==
Date: Thu, 19 Nov 2026 15:03:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: altr,socfpga-stmmac:
 Add altr,socfpga-stmmac-agilex5-tsn compatible
Message-ID: <179512221319.568679.6038463507415818454.robh@kernel.org>
References: <20261104040320.18077-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20261104040320.18077-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
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
In-Reply-To: <20261104040320.18077-2-muhammad.nazim.amirul.nazle.asmade@altera.com>


On Tue, 03 Nov 2026 20:03:19 -0800, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The Agilex5 SoCDK TSN Config2 gmac1 path includes an FPGA soft-IP
> GMII-to-RGMII converter between the DWXGMAC and the PHY. The converter
> provides the RGMII TX/RX delays and presents GMII toward the MAC, unlike
> a plain altr,socfpga-stmmac-agilex5 port with no such converter.
> 
> Add altr,socfpga-stmmac-agilex5-tsn for that integration in the same
> compatible items entry as altr,socfpga-stmmac-agilex5 (shared
> snps,dwxgmac-2.10). Do not use altr,socfpga-stmmac-agilex5 as a DT
> fallback for the TSN port; the converter presents GMII to the MAC and
> supplies the RGMII delays, unlike a plain Agilex5 GMAC port.
> 
> The TSN port uses the same DWXGMAC-2.10 core as the plain Agilex5 port,
> so extend the interrupt/interrupt-names/dma-coherent conditional to
> match the new compatible as well; otherwise a TSN node would incorrectly
> fall into the single-interrupt, non-coherent else branch.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
> Previously patch 3 of the v6 board series; split out for net-next.
> 
> v2: Extend the interrupt/interrupt-names/dma-coherent allOf conditional to
>     match altr,socfpga-stmmac-agilex5-tsn, per Jakub Kicinski / netdev bot.
> v6: Put altr,socfpga-stmmac-agilex5-tsn in the same enum as
>     altr,socfpga-stmmac-agilex5, per Krzysztof Kozlowski.
> v5: Drop altr,socfpga-stmmac-agilex5 fallback and rewrite commit message
>     to explain hardware incompatibility, per Krzysztof Kozlowski.
> 
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml     | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

