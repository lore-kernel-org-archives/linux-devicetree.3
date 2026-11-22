Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361688;
	b=AHOuhvIUDzFocsy1YvDL5fZfgFAtNZn0psx77zRGfV7wE5lMZUl1V1RprDyoTvzyOtMQ
	 ipkwLNReRaFKPwjYl+WYqGKdgwcKqCbkic2yBo/1Y7mOE4WHWVr0kyl2C7aODQYW+TknU
	 idIVvss3DsincI/CgvkQEwr4MQ4n1IhLL7gQZqj97fJyYPBb4zyuMCCK/k6r5+eRUekPN
	 B04Ciozn3HsMWowyTulkIbdKmJFQTgPTLoLEsuzJsS0EPyPWu/nkiwSz4ea2WmJ50fWhY
	 5kFdx8mXw9/fKRj+o0Yba9rRQTJAZLgpNEqo8iEBDGLq9AWI+v5lDCj2tLzF50VOqPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361688;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=KDBbuF5ql8/IVe5UKKYnyAQX4+XIz2LwiSFaHGaN3XY=;
	b=QItTWt6kwUsQvHu2ndWs1oHp5LO+ANk0vKyfTP4J6L3MSniXN1I7RZdb/lgnfZ9Lqh1r
	 Nh/J4nxKJYRjgXfi7Vc7qdMac+adsXu1lZMcXf/BShXM+ilC25SllHqcNz+DflB9u8vxq
	 2J+3ef7LFUDpv121Y99Y/1UCykWEy+fR7ATmXO7DnnTnQSKVIeSx+0qHkRyP5iOosLAhG
	 Rrg4rtgH/pyK0KQfoXNl65b1+xtMbg5CT797fdMeV+NKUMOl2W/OR8ehI4YxVXGuVCyEr
	 THI4iIXR9JCKgDuJAROx7Up6L37QQ+7gog8vD3iq8OexEyQtzpnA8udSP0L8vdueuNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=5bsoI5TT;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0C4606A320;
	Sun, 22 Nov 2026 15:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0C4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=5bsoI5TT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KDBbuF5ql8/IVe5UKKYnyAQX4+XIz2LwiSFaHGaN3XY=; b=5bsoI5TTnSlGRfAQrt5wg0M5wh
	Aikl7hDAxg6CJoCVgzRLZi72pNs2Ud7GDcc58pccxgWaQso04K+K+hC+FBFjq/IkkVT7poV5aYGBT
	GvEGratV5V9mGmw7808uMHBMIEkprb+Xp0gZjlSBxJSbDVk19C9v0duMdLoV0IamY788=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xV9aM-000aTg-8q; Sun, 22 Nov 2026 16:34:34 +0100
Date: Sun, 22 Nov 2026 16:34:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] ARM: dts: rockchip: Add Luckfox Lyra and Lyra
 Plus boards
Message-ID: <99694488-727e-4004-8f80-f48871862cb7@lunn.ch>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-5-jonas@kwiboo.se>
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
In-Reply-To: <20261122060114.773624-5-jonas@kwiboo.se>

> +&gmac1 {
> +	assigned-clocks = <&cru CLK_MAC1>;
> +	assigned-clock-rates = <50000000>;
> +	phy-handle = <&rmii_phy1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&eth_rmii1_miim>, <&eth_rmii1_tx_bus2>,
> +		    <&eth_rmii1_rx_bus2>, <&eth_rmii1_clk>;
> +	clock_in_out = "output";
> +	status = "okay";
> +};
> +
> +&mdio1 {
> +	rmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};

It is unusual to not have a phy-mode property.

What is the MAC capable of? Can it do RGMII? Does it default to rmii?

It is not required, but it would be nice to have a phy-mode.

   Andrew
