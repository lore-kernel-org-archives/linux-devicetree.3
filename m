Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362415;
	b=DyoI8++s2VHTqbC+7xj6g0RZJWMcYaYQgNsSYtCpUa/m+MgUZHJaOs1fp/xikEPyrvto
	 2/rTLa5gqT3t0BMUCD00BeGO0x3MzfLOxPbGjh7fRap30EEfKwXwyp11KZ3fdRVC7y7uB
	 n8Y1WTzQy0XVhxu0Aob400TOePVRL1avIbsc88O6GTTkKj0ZVxbcEKPimFQhpFOoieuOV
	 feqn/ey3guV9Tb25eVCQcfnmU/lCO37YW86/IGvvto3HrCQNfPPDoyKnftUxCeoePTZi9
	 LnW0MgPEdMi+L7guSIfSAmLmumnVcNEWMsLhqvZaSNpDaUoNrPdIIudSDnp6h8TRg8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362415;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=yoDV+prWsX7guq+90WivZjKbCtQ+ft9UJtNUNcoppyw=;
	b=osknN4tbsK/NKLzH/nPVy6Yelb0hAyPXbuOsBUrej8YnP0/uR/IDC4d4Us/Wxvro+av0
	 XreJeF3SNMPya5yUlnTF3fYoXrnW4iM1zg60yIznk5RV+eJcus9Hh+Vnh5j0iyoMXh43E
	 JzKJw2Vgrz1u5Lw8pertwqqPqUy9GrT9AEtbMV5d8AlUFW4BKOcCtJzZjOESGjByVA1eE
	 To8VOPnIyee1bMMidIldp5kqEC4ZiDvBg1jt8UlhG/H0VcmDit2A17NL0MksL7A09zz9e
	 A5MxQEX4Rbc0O4PJJFz5UtHqCyWxrtET9+uY+P6xAyQ70pekKVjnEqWYTwbIYLH9FjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FWAlQpvl;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0990C606A32C;
	Sun, 22 Nov 2026 15:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0990C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FWAlQpvl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yoDV+prWsX7guq+90WivZjKbCtQ+ft9UJtNUNcoppyw=; b=FWAlQpvl9OScDr7zh1eXy10phf
	2k/eaxwZpN3S1rognH3ERyRNfvilejPDFDKo/iib74CPp4Cg+G2yEcaADYM383sGV/b1B1dDUsbrX
	MAEm8LbHu+rIi4ix0YXUiKlHY/ULurJJRs64W1Ws2wAVrabjm0Ci2F5X8633lGtDqNp0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xV9m6-000aVN-A8; Sun, 22 Nov 2026 16:46:42 +0100
Date: Sun, 22 Nov 2026 16:46:42 +0100
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
Message-ID: <86007bdd-6c10-46ba-aac6-197939934c73@lunn.ch>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-3-jonas@kwiboo.se>
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
In-Reply-To: <20261122060114.773624-3-jonas@kwiboo.se>

> diff --git a/arch/arm/boot/dts/rockchip/rk3506.dtsi b/arch/arm/boot/dts/rockchip/rk3506.dtsi

> +		gmac0: ethernet@ff4c8000 {
> +			compatible = "rockchip,rk3506-gmac", "snps,dwmac-4.20a";
> +			reg = <0xff4c8000 0x2000>;
> +			clocks = <&cru CLK_MAC0>, <&cru CLK_MAC0_PTP>,
> +				 <&cru PCLK_MAC0>, <&cru ACLK_MAC0>;
> +			clock-names = "stmmaceth", "ptp_ref",
> +				      "pclk_mac", "aclk_mac";
> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq", "eth_wake_irq";
> +			phy-mode = "rmii";

Sorry, missed this on the first pass of the patchset.

phy-mode is generally a board/PCB property, not a SoC property. It
would only be a SoC property when the SoC cannot do anything other
than RMII. But given this is snps,dwmac, i expect it can do other phy
modes.

	Andrew
