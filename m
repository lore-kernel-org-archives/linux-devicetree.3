Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371895;
	b=KK2kxrIkkNFRzou7OUotRXTX9uaG2yh84lHhcAryCGBbqLBFj1MrF05K023zjbQw5ljW
	 AcPkEblgm9mhfu92AsQVlKzBLSXV/El0MbqNr5jhI3Bd+Ig6x9wMplehG+3ULRlKAT7Lg
	 2WJd8lT7rEIB5Wlaa6yl0LKvU5+wUuM1baS6P0xhrhTrcsBi21lJ64I5x2viBsyRxKl4g
	 h8ttIUJg2Px3iT4aD6ZbTAPxWyQa44AbvUjUsNVBJWGqC0AxEstqG3jDIiy+WMX25YJIW
	 +loMphrjIktqnAV6Aq13jJCcAdOfQBCR0cBVL6MZJObSQ2Ku5VNeWt04xE+HycAyzOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371895;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=I8O79LLuixI7Ncv80qos0WzCUNLLnHjxMOr/9odIaMc=;
	b=DWnL+MLS/NFdl4huDxJX3Uc6utVCWj+tBB+Dnfj/D2d5XcMcmSVtrgAklbQL93fq2A9M
	 wbHCBPI3gfZzoqP8v8Ws676aFsRiUPgIo054A5MCPguwSRimOzZDYyuWoh4mfONwwRPxr
	 srNHqt9LcjgMBEkeFGjhv2A5yjiau6/J0+onMUH4VRTh9f8uKMHMfm13h3m3dbVQAPn/N
	 NAg5vu6Qk3YrpPbNB+C4TVeQQtFl8fRz80I6o/9k7KA4dZWPJHM4iN1NZu8fSNMun21wc
	 wGvf7L4pq6zGSNPKevtPTcJ0IybBJL43p5FUSRMDA5mTbgeAlRf79COtDE3HjCLsJkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=BsPCX8dr;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BE6606A32A;
	Sun, 22 Nov 2026 18:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25BE6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=BsPCX8dr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=I8O79LLuixI7Ncv80qos0WzCUNLLnHjxMOr/9odIaMc=; b=BsPCX8drszWkyXNyHqAHkJDoyN
	6Z5KhKiCoIFTdy5cIoJRNHjbVJSqC9oMjYIAlfVpdYwfhjWGcmhpamxw35+z16Bq+xaF5I65ALA1N
	kq8G/V3/CzkaBkYCaW0PsYmWhIuTSOmHcVHPHyvbMjlb27hsmcQU+uqElL4N0GcRwNPk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVCEs-000bMR-9t; Sun, 22 Nov 2026 19:24:34 +0100
Date: Sun, 22 Nov 2026 19:24:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/8] ARM: dts: rockchip: Add support for RK3506
Message-ID: <cacdc706-3fef-491b-bb3a-96728347a17e@lunn.ch>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-3-jonas@kwiboo.se>
 <86007bdd-6c10-46ba-aac6-197939934c73@lunn.ch>
 <5cf52e28-110a-4fc2-acfb-eb264e8c31e2@kwiboo.se>
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
In-Reply-To: <5cf52e28-110a-4fc2-acfb-eb264e8c31e2@kwiboo.se>

On Sun, Nov 22, 2026 at 05:01:08PM +0100, Jonas Karlman wrote:
> Hi Andrew,
> 
> On 11/22/2026 4:46 PM, Andrew Lunn wrote:
> >> diff --git a/arch/arm/boot/dts/rockchip/rk3506.dtsi b/arch/arm/boot/dts/rockchip/rk3506.dtsi
> > 
> >> +		gmac0: ethernet@ff4c8000 {
> >> +			compatible = "rockchip,rk3506-gmac", "snps,dwmac-4.20a";
> >> +			reg = <0xff4c8000 0x2000>;
> >> +			clocks = <&cru CLK_MAC0>, <&cru CLK_MAC0_PTP>,
> >> +				 <&cru PCLK_MAC0>, <&cru ACLK_MAC0>;
> >> +			clock-names = "stmmaceth", "ptp_ref",
> >> +				      "pclk_mac", "aclk_mac";
> >> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-names = "macirq", "eth_wake_irq";
> >> +			phy-mode = "rmii";
> > 
> > Sorry, missed this on the first pass of the patchset.
> > 
> > phy-mode is generally a board/PCB property, not a SoC property. It
> > would only be a SoC property when the SoC cannot do anything other
> > than RMII. But given this is snps,dwmac, i expect it can do other phy
> > modes.
> 
> This SoC only support RMII mode, so I put the phy-mode at SoC level.
> 
> Datasheet for this SoC lists following:
> 
>   RMII 10/100 Ethernet Controller
>   - Support two Ethernet Controllers
>   - Supports 10/100-Mbps data transfer rates with the RMII interfaces
>   - Supports both full-duplex and half-duplex operation
> 
> The Technical Reference Manual also only mention RMII:
> 
>   38.2 Block Diagram
>   ...
>   The MAC only supports the PHY interfaces of reduced MII (RMII).
>   ...
>   MAC Supports 10/100-Mbps data transfer rates with the RMII interfaces.

That is unusual, but O.K.

For the Ethernet node only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
