Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E29D2F3C3E;
	Thu, 16 Jul 2026 18:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227374; cv=none; b=s9AVIYqwQmJk7rsAZkxuJU5viO/KYfH/xgUxFBlSfNO7Xg27DSnJUK630v1m2qeQkS02s2DMYYYlV/fObPFORyaX/yOa1+CD7MEMAB+ZiTuzh87pBUBFw+gWyuHt/b2E18ss5jUk8r4EYgUONCYnmubFd9h0Hh2465+dFkaLdGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227374; c=relaxed/simple;
	bh=Ygs0XDU9Q6fwj84xZHe2v/IWQSjxGqAtyO1xfJqqtOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5p2GC2C0rs83IReBj1GOuywxmYE+T//qbDPg1KPCN9jc4CI+/sEFV2DQx/w6Z8PMAAk1HeeZ/fd/TacoCIivvVK9V6LZ8xTUwHxG3ISQfRFdjw858boe4motRcp53wJ1taS8bBlPKd+TtVdj0POnVybJB7DKbOzKTpcewvYQIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kIswzkUF; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kIswzkUF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Puj8hSyXVH9SJHRVn9nQt1SSuIa53OLrxJsSKuY9XeY=; b=kIswzkUFjBjWZZ17R9Frormnbw
	roZkXBKY6QvdhOlJtDu3wGZjF4/2AMkxsxyiOVPOA1oZRdbehyXwfaVEvqJylpGqmNQd/jZdNZGQU
	Z+PrJkIw8ValXztuiGFzc8PMotxrOb1R0p9zp8WAYheBr1NkBdmO4C5ABfE6lBBXBcqE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wkR2k-00Cc39-Tt; Thu, 16 Jul 2026 20:42:46 +0200
Date: Thu, 16 Jul 2026 20:42:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Message-ID: <e99f752a-da1f-498d-9305-089b9d736e70@lunn.ch>
References: <20260716095101.2498464-1-gahing@gahingwoo.com>
 <20260716095101.2498464-3-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716095101.2498464-3-gahing@gahingwoo.com>

> +&gmac0 {
> +	/* The RX delay is added by the PHY, the TX delay by the MAC below. */
> +	phy-mode = "rgmii-rxid";

Please read.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

> +	clock_in_out = "output";
> +	clocks = <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
> +		 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
> +		 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
> +	clock-names = "stmmaceth", "clk_mac_ref", "pclk_mac", "aclk_mac",
> +		      "ptp_ref", "clk_mac_refout";
> +	tx_delay = <0x21>;
> +	rx_delay = <0x00>;

Try setting phy-mode to rgmii-id, and these delays to 0, or removing
them.

	Andrew
