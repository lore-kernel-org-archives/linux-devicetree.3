Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F122D7B9;
	Thu, 11 Jun 2026 15:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193489; cv=none; b=e+TMrlx712r6NAhukhb830OJ94l9QtS8Bg9zowV1dB2Gv/TEG3d8P/BQumqsxuvFSglsWv8BPNJPuAzvw0+oGQGqui00joWBW/XnMq2p0hRw3GYnCrI/rNpMvyErumRb55o7qSrCp2AQyZ5zxHw9n9ws2O+CDIzsWMv8+xQcqvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193489; c=relaxed/simple;
	bh=gz11kSp9jOAZhx1WiiL9sTFIeOpMQE+jUbmcqlceFXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Su9T73WmH4lPNaJCE1c6G8aCh+xWWuRfpkq2a5V4A6KGOD5DR2stA+PMcssXfmslIDOc8jwZDkcWEUIvayk8LCM1k13bQn6JWm/eRjWBXA2YXN2xTyEuHBf0UBuPCu43su79RABsOeKIZUmZSGBc3iqFxiNUeK4lyM6yG8koSAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=JRkhRdRd; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="JRkhRdRd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ay/pqQVPXIWWJwlc0dUtX0HqvnadfJAa4MdZo4NoSxQ=; b=JRkhRdRdI0wAxV9i/GI3MUsimw
	F3Cg3voANNES7YJ1k6gON4AJlMtNR4Ds8s0nIiMWucrk1D7jy8YmKMLCgbboRMhr2NcIsxDQZCBz5
	oTSqbzoUYWapEF0r+AozWSd7i5OLQKpQ6ICokxgULZ8LCwi/5eadBTiBVYxg6vuY5GaQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wXhmv-007BRy-7p; Thu, 11 Jun 2026 17:57:49 +0200
Date: Thu, 11 Jun 2026 17:57:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
Message-ID: <843dc0ff-a504-4237-b0f4-d92be07e2465@lunn.ch>
References: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
 <20260611-ventura2_initial_dts-v7-2-a61d8902bc5f@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-ventura2_initial_dts-v7-2-a61d8902bc5f@gmail.com>

> +	/* Marvell 88E6393X EEPROM */
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +	};

How is this on both a host I2C bus, and the switches I2C bus? Are you
using multi-master? Is there a GPIO to hold the switch in reset while
the host access the EEPROM?

      Andrew
