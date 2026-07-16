Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217054252BC;
	Thu, 16 Jul 2026 17:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222972; cv=none; b=ivWPRD7dkCQ1QW1Wd5A9GY50u4WT+bnROWqOKBBcdhKP1NJimL816VVOZsUd6Jd5JfI3LTaiUZLsa38znLDL5v/I4TFVOoHyYncD+L635OuGywjQiXt17JUSiW1GJB/do0daYVaxiQS5tthbuaQP0HLE5mxHDhJqA/J/lsf82vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222972; c=relaxed/simple;
	bh=0I25V1lm2uQavxyKBG5xHjAsbVh4f1AAiddPakl6BSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7q1NHhjIOl6CRE7rMCYh4yNwpoTBfJdn9WEfOdM95rAfawWrRidQ/I4/k+SdIyWv0MzVv/6B/qZZ7m5l/+7eQKt8HJiWMlfyYvVIyg6Wpo2TTUBV/cC16bKtqVYelwSrGf1sUstx5+Jwe32+HWEhZod0UmFqUbdu8cacXYRQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=RFXip3c5; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="RFXip3c5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Oy7KDCiie69MUnyvy/2/gWtYYCH4ZMop/RN1w+cqgro=; b=RFXip3c57PRC16yRHWVjGWfcBO
	WPr112RJloTjAizRsaTVqHYYmC7h1NFbF36WOOwCEfevN7aoGix2wmY94uuWQqwP6xBEAWaTKCtCD
	9IjH4eLUWqS+T2b8uDwiPP0xN6hBz+63Se42ItF4DN50zNnus+nJTX0Mtm1RohYZLgIE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wkPtj-00Cb53-9i; Thu, 16 Jul 2026 19:29:23 +0200
Date: Thu, 16 Jul 2026 19:29:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add EmbedFire LubanCat 4
 board
Message-ID: <b648a0b0-2b78-4256-8a30-ab4f9a1b40f1@lunn.ch>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_D22A164B3AEEA50562C1EC988862BA827A09@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_D22A164B3AEEA50562C1EC988862BA827A09@qq.com>

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	/*
> +	 * The PCB adds ~2ns of trace delay on both TXC and RXC, so the
> +	 * required RGMII clock skew is provided by the board itself.
> +	 * Neither the MAC nor the PHY should add any internal delay,
> +	 * hence "rgmii" (not "rgmii-id") is correct here.
> +	 */
> +	phy-mode = "rgmii";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};

> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gmac1_phy_rst>;
> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>;
> +	};

For these nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
