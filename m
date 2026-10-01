Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB59377AA7
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861618; cv=none; b=QMmNJXkmxQxETwN6zmAPhUssB2U2RnPV/1Z2jWIvejTe1SMdL7FLHst6JWB/6Mel1NQ5MNI0t3QSq7p7av0mY0rlSUmSAUkAl1bwBTthtf81oNyeBQU99yjxdCTlLPTMQa1MCAdYOTvyRau0e7y+O0oQdZSCHlWXOJz9MF3u1Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861618; c=relaxed/simple;
	bh=sYp4IODDRE/oqGxfiwL0E5qPsGe6BaznATzQ1246n/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCq/xEDHWZET7PKxiC/luMRRS1MAYzFbLkj9HM647WZvbTVC4WqsNr8uPwDBhoyeGoC5giCcnRYCbt8X70xpQxhmyfSidSyvh7RhlGYSLxVBJl7S3VIhH91V8p00Ver3EcGMwQO2rZsqo1OETtBkWJGlEmu/8VSkSzXZu1y/07w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=VA8aJFvK; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="VA8aJFvK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZISLUrZjX4iOiIppbllyKD1bMSKBGdCj0f514qP2Ki4=; b=VA8aJFvKOX5a5dHnydfnZAiZoZ
	xsVbFTkY0Vsp2WeSQcCPHm3bnBB/EXnPPIcEjYhg72PBhEysEIrd2GedfdD7rMFFIgi1qEfpupnGM
	zzruX6GHY60XJaPIr18aS6ZmV2SAoYWQo6rLQPPWOBbeZBuJjcZdK+lN3mG2iXkfimZI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xCGud-008OTL-Sr; Thu, 01 Oct 2026 15:33:27 +0200
Date: Thu, 1 Oct 2026 15:33:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: BG9OXA <bg9oxa@163.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Message-ID: <80eceb66-b573-463a-a577-30ba5793dbc4@lunn.ch>
References: <179051708448.31632.16350193430088134671@163.com>
 <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
 <179086062104.25951.4172888328376175948@163.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179086062104.25951.4172888328376175948@163.com>

On Thu, Oct 01, 2026 at 09:17:01PM +0800, BG9OXA wrote:
> Hello Andrew,
> 
> Following up on the phy-mode point, with the measurements I promised.
> 
> I ran three 15-minute runs at full rate in both directions on this board
> (rk_gmac-dwmac + YT8531 PHY, iperf3, 900 s per direction), rebooting
> between runs so each configuration was fresh:
> 
>   mode          tx_delay   rx_delay   board->host    host->board   retrans
>   rgmii-rxid    0x2f       0x00       922 Mbit/s     939 Mbit/s    0
>   rgmii         0x2f       0x00       922 Mbit/s     939 Mbit/s    0
>   rgmii-id      0x00       0x00       918 Mbit/s     939 Mbit/s    224
> 
> The MAC error counters (rx/tx errors and drops) stayed at zero in all
> three runs, and the link came up at 1000 Mb/s Full duplex every time.
> 
> So plain "rgmii" with the delay added on the MAC side behaves exactly
> like the rxid form, and the "rgmii-id" run - where both sides add the
> delay - is the only one that shows retransmissions. That matches your
> point that only one side should add the delay. I have changed 2/2 to
> phy-mode = "rgmii" and dropped the rxid form: the RGMII traces on this
> board are ordinary length, so nothing in the PCB asks for an extra RX
> delay.

Did you read

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

phy-mode describes the PCB. 'rgmii-id' says the PCB does not have
extra RX/TX delays. So 'rgmii-id' is correct here. Please spend some
time to understand what delays are being added where, and how you can
get to rgmii-id without any retransmissions.

   Andrew
