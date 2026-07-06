Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA83F58C6;
	Mon,  6 Jul 2026 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373650; cv=none; b=X0N7cr8UlEWQWr5WnNgaOfd8byXLNSI9EZEn+/ms078G3+BszECLMZRqp6AQNLuLIF9fkdR8RtgL3Y8A1Nl1vIbeBiHyVqxvhhsa2ZNnYVh5vWjIh2KqY9vPAJQrmku2fX1Nk87gOhDHHMVJ+XGOJInVgEzh2iXRAb8QPMbaiRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373650; c=relaxed/simple;
	bh=gLBHuq1Xa767xXQc3+ivgjlwWr2hYn0HHC38saTlrZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgE2cz0vt5+ZMGisn74VVjsbGz0oiBmniUUn59DySPVt05YsmW2GuuA4HlakCIXVK/P2byL76uVk1l+V78pVQLtAp1j/MnLRjua9V1+hz19Im44VILoEiPp5fWnR1JcLBDxHcRnTtTulFuWKDVIriog9qjuzz/1ZCbCvaBdnEzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=BStsEw0m; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="BStsEw0m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KGGKkAUXMo3mYXdgw//fbeNQbfmfA+U4ZlbWmELp4Rs=; b=BStsEw0mWdGD6P77NeD7XTo5E+
	tMLKRALNTsZjY+dYVGg+pUrA/xfylJQwIVxCtBV/v+NcdUnwcNNlhSbm8OfUZETKQzhumFXLFeL9M
	/Z+KfqBRJ9XLn7S7jLF2bA2KfbOz8TusckpW/R1qO6zjBNRWMOh+FwMlA7SXymDOCs6s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wgqwy-00B4Ax-OS; Mon, 06 Jul 2026 23:34:00 +0200
Date: Mon, 6 Jul 2026 23:34:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add EmbedFire LubanCat 4 board
Message-ID: <647b653e-d602-46d3-bbc1-0d3fa132696e@lunn.ch>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_6D311DC5F405B157049538DD5B080082A10A@qq.com>
 <1ac2d0f4-e027-4633-9d34-2709cb3e43ec@lunn.ch>
 <tencent_BF5741F8151925AFF7A3026460204C2B3108@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_BF5741F8151925AFF7A3026460204C2B3108@qq.com>

On Tue, Jul 07, 2026 at 05:20:35AM +0800, Pufan Jin wrote:
> On Sun, Jul 05, 2026 at 05:11:58PM +0200, Andrew Lunn wrote:
> > > +	/* The board has 1.5ns delays on RX lines; TX delay is provided by the MAC. */
> >
> > That is pretty unusual. How is this RX delay done?
> 
> You're right to question this, and I apologise -- the comment was
> inaccurate. I re-checked the board schematic and both TXC and RXC
> have ~2ns of trace delay added on the PCB (annotated as
> "TXC / RXC : delays 2ns" next to the RGMII bus).

O.K. So both having delays on the PCB is what i would call "somewhat
unusual", vs "pretty unusual" for a single delay.

> Since the PCB already provides the required clock skew on both
> directions, for v2 I will switch to:
> 
>     phy-mode = "rgmii";
> 
> and drop both the tx_delay property and the misleading comment.

Please correct the comment. One issue we have is that many boards use
"rgmii" and are broken. You have a board which uses "rgmii" and it is
in fact correct. It is good to explain why it is correct, otherwise
people could think it is just another broken board.

       Andrew
