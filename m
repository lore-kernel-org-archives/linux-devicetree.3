Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40964406267;
	Wed,  1 Apr 2026 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044394; cv=none; b=JpgjvWbQRJlTXb+5acG+VdpT5nI5SgLwAKhO6/YL0DfJRde+1LPytrhjBIJsFLrGoRmKHIcjGJLe9Ioi/NwLte1ORZeC1zVvXq6uwfYeT5RXJrqc/0b6k3H1qfbZY6R55GyGkkIDSxNZ6fIyZySpmvqSBFsBdDBC/doTCJAxVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044394; c=relaxed/simple;
	bh=QYeDVOAMxKiaAj6I3lXFfcAlkJxqGZNnnvu4Q6VtSOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfihrGv6LNKzGFgCpbhmVu8Qr8En1i1l3Bz361FeBXUcznAgpbNRzQC+P/NWh6JQtni8M2uwalvHbsAt4YQdnapfeN1f41gONZRlSd/VGU4cKOk49UZsr2yYhe+D7ycQHUSxUTiSrWTO3z349aigYkvcyNnmNcnl3us0HWeGA8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=f2c71K2W; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="f2c71K2W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rdzbCT4MvQu2UJrbXTBr/kQGOfZEL/wlR5Wrm8JW9Zc=; b=f2c71K2W8jkpY+jkLY+hls0LiW
	pf11a6nSF1WZDYF7YjZJfkQc1G7xDd8yhU/nM3iQsidCuqi43Dwn+udHP2Z7ILLjfh8e/hopSisqx
	xhcVRYCxs06whhqqA+zk5SdiNyYmjYND3iW+5dFjBgyFMixWZ8X2NZPx9BxtfY3/oPUI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w7u7o-00ELSY-WA; Wed, 01 Apr 2026 13:52:45 +0200
Date: Wed, 1 Apr 2026 13:52:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chukun Pan <amadeus@jmu.edu.cn>, Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
Message-ID: <b733883d-e515-4946-a81f-d1a595985e01@lunn.ch>
References: <20260401010707.2584962-1-dennis@ausil.us>
 <20260401010707.2584962-3-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401010707.2584962-3-dennis@ausil.us>

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	phy-mode = "rgmii-rxid";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	pinctrl-names = "default";
> +	tx_delay = <0x42>;

phy-mode = "rgmii-rxid" means the PCB provides the 2ns delay for
TX. This is unlikely to be correct. Please try "rgmii-id" and delete
the tx_delay.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

    Andrew

---
pw-bot: cr
