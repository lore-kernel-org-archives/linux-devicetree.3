Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E404D2DFF3F;
	Sun,  5 Jul 2026 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783264329; cv=none; b=n6h/LFhzVC2ixB9PWrLRRnZive44TwlcPtEeM6bBcKLTmEP3Su7jLKLuKCorNxipn0m6YiMm9AbWz5PvLZK6iWiDiYj4ejlYkMMJLW+RyBEkpBMQwRPYcull+pZleByGwrcyUIZ51hRAxB2QTJ9NgmNomXfl5lX4B1uaM4ZNH8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783264329; c=relaxed/simple;
	bh=rk/843IBjfhEUMim3dhuVJUnX4Cy7h4Jpe4Rt97Huvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtiQX2FBBSWvfPnjd0mTgcKOMlgPIM2WjExlLeyStCVS51LjKur60YB/FLCfJKauD2eCq9qMKIPK4o9WbXuoQKnxUjfgROlv6neCrSfwKUSvkeKHgHVDHCCBWlu13v2DOAs4m7P3Svt1VgM45WWjGOzOVCrtadX7JCY4iIZ4wnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=gmFGAFXz; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="gmFGAFXz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HptUES/0sfPU3Gkj8T4/h/5gi9Cj/ZvB7ArF8RxIxNg=; b=gmFGAFXzeorkLhLgDBMjGel4Ae
	4cMuKTf4Yzd94nkLb1gY11bD1CFBzXBUGnud0NGEg1hyxgbPlPcd1wsVVAVZEwod9VypYE+St30AQ
	IMhcNUnJOgNg7IQvwFzIkvC0TWwt+v67R2qZsGPK6mHOodtlFFWWUUSsQBDyJ8EZt5LM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wgOVi-00AqXH-1s; Sun, 05 Jul 2026 17:11:58 +0200
Date: Sun, 5 Jul 2026 17:11:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: LemonFan-maker <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add EmbedFire LubanCat 4 board
Message-ID: <1ac2d0f4-e027-4633-9d34-2709cb3e43ec@lunn.ch>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_6D311DC5F405B157049538DD5B080082A10A@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_6D311DC5F405B157049538DD5B080082A10A@qq.com>

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	/* The board has 1.5ns delays on RX lines; TX delay is provided by the MAC. */

That is pretty unusual. How is this RX delay done?

> +	phy-mode = "rgmii-rxid";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	pinctrl-names = "default";
> +	tx_delay = <0x1b>;

please take a read of:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

Ideally, you want to the PHY adding the delay, not the MAC. 99% of
rockchip boards get this wrong, they have phy-mode 'rgmii', and
{tx|rx}_delay properties. And i tell developers to swap to 'rgmii-id'
and remove the delay properties.

With the PCB adding some delays, you board is slightly
different. Please drop the tx_delay and adjust the phy-mode so the PHY
adds the delay.

	Andrew
