Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2013303A37
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790525233; cv=none; b=H/4b1TxPNFGJXA8lO68rN1VLAP8AHWW87sHmeW6swpRLTOq6DVXRwd5wW4D0JB+vt1BsvgLBI1yFzIsN1CnjWHv1+b0SaIYpvLFxAt2vTRBsxiafZR1Iv28rZHz5hhqn59BeYlmH4/eqPG4FCfstXUYmP9lYpGLllJasRlZ0RJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790525233; c=relaxed/simple;
	bh=mzt4pu9ZaJARhmHVs2voPXGRrfC/68WvT0Qu/oRVOgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxR2tLzfBIG5fheD04IaqyyJpXiDIy37kCISzJTogYjY4QGUsHUxud65hR0PqxEJR0NFHByEevcvj8tfBr56waneaNZiWMiMC5DNp2B5G0Msjou+FNNnAeF981ZU3Nn5OMDvj0dsQwQx4A9n/LlnW3+cvwbnWcMXO3qvcgfSRKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ygKYUhEr; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ygKYUhEr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+oMeoZ4pGEsBia+lJYpRLMOIzaRZRIDGRSGowGGDiv0=; b=ygKYUhErkjokFDjmsL3hU3RSsU
	SpM9nL/uVB5J5zwuyqTNQI3AHDGE41RqsI65O/FkM+cZAWxH5Ep7WAu4VtblAqpuI0anUL/Jk/pNl
	61CuC6DFHZndKNr3B1Rp83apg17/rhmquKp6VMptUxdBN6QuMx+uafyfcNvuDtLmXWs4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xArP3-007XMX-3k; Sun, 27 Sep 2026 18:07:01 +0200
Date: Sun, 27 Sep 2026 18:07:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: BG9OXA <bg9oxa@163.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Message-ID: <89731a27-4d5f-4a01-88b1-26c2e0d65ef9@lunn.ch>
References: <179051260955.4055.15953866975694461812@163.com>
 <179051262683.4055.12205303753370851498@163.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179051262683.4055.12205303753370851498@163.com>

> +&gmac1 {
> +	/* Use rgmii-rxid mode to disable rx delay inside Soc */
> +	phy-mode = "rgmii-rxid";

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

phy-mode describes the PCB. Does the PCB have an extra long clock line
for RX?

If the MAC has a delay which cannot be disabled, the MAC driver needs
to handle this and mask the value passed to the PHY.

Rockchip DTs are often messed up in this respect, but i've not seen
any indication the MAC really does have delay which cannot be
disabled. So this seems double wrong.

    Andrew
