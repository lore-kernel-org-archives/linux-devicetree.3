Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE1119D89E;
	Tue, 31 Mar 2026 23:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775000141; cv=none; b=oRWJfLNUjomNDypJ4O+vWsGd5CY8i4lCxXnm3K6zIOscCzEW7FDBpfBC5XKjUSH2OPd0z9DX7uy9aHW8LpSRx6k8Q2SwVdwttm6X9uJjtsnj0qqYLz70qji5+4T28pBKnjGJF1kQOvA9VpqrL7esPIfgA24QGjQpg0p2pfBAbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775000141; c=relaxed/simple;
	bh=0fBhtfZ1hrQCxWWBqNY10CZUCs7/+Hj9oeWWPhyHhyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bD4SKIA/yuXqbFzS/9j/oLp8CzXuXKj71FgWm5vGurq5CgT65FJoCCWwDW/wkESro6ejUdeD/o/jrPbq4H8FtPg9ZtkdAbwJ1WAxmQSh54Qw9bKbez46/75HXodm6uk6BDtpzV5dhim0lhkf6OleRQCaO3FbNh7Iznp4Z8SjaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=AN8sx1Qj; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="AN8sx1Qj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HVS8vnwDDp67iG/gjIG0ZPUsJ3Y7Nryk4cO6gyrgH3o=; b=AN8sx1QjM5M3zl1AAI2+qM9R0h
	xAB/+4IuhBDvVwyAKmk410FBG0H1Nat2S7mFTBxvzyutBnf+EuyCJIbegiitKb9lJqWmB60CfVCku
	GRbY0RUs1BeNYhCGQ1fOvHxwZ621eAT2WAGUmIAIBrGWxVQ2Lc1oMWFDUDzySHSIbcfQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w7ic9-00EG6P-To; Wed, 01 Apr 2026 01:35:17 +0200
Date: Wed, 1 Apr 2026 01:35:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
Message-ID: <95d6ae8e-6832-468b-9e04-dae1337a87f7@lunn.ch>
References: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>

On Tue, Mar 31, 2026 at 09:18:00AM -0500, Anirudh Srinivasan wrote:
> Adds the DT nodes needed for ethernet support for Asus Kommando, with
> phy mode set to rgmii-id.
> 
> When this DT was originally added, the phy mode was set to rgmii (which
> was incorrect). It was suggested to remove networking support from the
> DT till the Aspeed networking driver was patched so that the correct phy
> mode could be used.
> 
> The discussion in [1] mentions that u-boot was inserting clk delays that
> weren't needed, which resulted in needing to set the phy mode in linux
> to rgmii incorrectly. The solution suggested there was to patch u-boot to
> no longer insert these clk delays and use rgmii-id as the phy mode for
> any future DTs added to linux.
> 
> This DT was tested (on the OpenBMC u-boot fork [2]) with a u-boot DT
> modified to insert clk delays of 0 (instead of patching u-boot itself).
> [3] adds a u-boot DT for this device (without networking) and describes
> how to patch it to add networking support. If this patched DT is used,
> then networking works with rgmii-id phy mode in both u-boot and linux.
> 
> [1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5ecb9c777a@lunn.ch/
> [2] https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc
> [3] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com/
> 
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>

Thanks for the updated commit message.

Is anybody trying to get the changes in the forked version upstream?
It seems like a reasonable way to solve the problem, at least for new
boards.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
