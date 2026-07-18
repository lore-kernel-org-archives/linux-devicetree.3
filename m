Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D12EA154;
	Sat, 18 Jul 2026 20:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784408302; cv=none; b=CArhjTN7eRc0r5XUpIYD7dpqQPGeDqERBqDdmhH8CPyejM9nA9p55JD+e1/UWCEPn5Yqg1RAG6lhTEzGaR7I3TfbyIigptHLi4/6bo2sTjXYbQay4pvdroEGiAeF4PaDahrfurlJF73MnIJbBZv1b73j9nhHE1Aift2AnenGo04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784408302; c=relaxed/simple;
	bh=lhYz8gK5Lvcy83kTSlni2Q5LYxjFYVqeUAJ+5ZZj/PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6j8fiMJEqtZ1hmFC8Lr1Q3/Ry06aArYmja991LAN1hV7hrgxxw4ptqIjC1voMSlxpSW6MpEnKUZZWZCh0R3on2w3nDhyuG3Dk0hF+4Qwa5t2WltLRVaJKKV+8Zkza/Sa0MKsX3ve3zdY+y0EMnC0Y/jxPyWAN8C4Sbao79H3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vlevDmuf; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vlevDmuf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Pw0QjSmfdaB3HnkcT8LgeuXdKGUxBtNlYl3Sq69kVYQ=; b=vlevDmufoIZiJPBc5ej/sYoPze
	ifIMgLxyYKR1mBUkMMhaG0jnQqsZ2w+zS/IwxtppyRrm17KUr2bwhdCqcsgviqY/3e8yAAWWqelP5
	+ELVtCyH1ryVtkfb575Ury7lMUJ6wM+/OWXS29XY7lRrNakW4UU4cLjFN+Urn+V1YprM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wlC6x-00Cyvg-PO; Sat, 18 Jul 2026 22:58:15 +0200
Date: Sat, 18 Jul 2026 22:58:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: heiko@sntech.de, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Vicharak Vaaman board
Message-ID: <2a3e70fd-8b52-4612-958c-75b1aae5cc68@lunn.ch>
References: <20260718065900.755631-1-hrushirajg23@gmail.com>
 <20260718065900.755631-3-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718065900.755631-3-hrushirajg23@gmail.com>

> +&gmac {
> +	assigned-clocks = <&cru SCLK_RMII_SRC>;
> +	assigned-clock-parents = <&clkin_gmac>;
> +	clock_in_out = "input";
> +	phy-supply = <&vcc3v3_lan>;
> +	/* TX/RX delays tuned for the Vaaman board PCB trace lengths */
> +	phy-mode = "rgmii";

Please could you read:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

and then expand the comment to explain in detail what is going on
here.

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmii_pins>;
> +	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 10000 50000>;
> +	tx_delay = <0x28>;
> +	rx_delay = <0x11>;
> +	status = "okay";
> +};

I don't see a phy-handle here?

  Andrew
