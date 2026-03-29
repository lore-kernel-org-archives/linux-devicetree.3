Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D861397;
	Sun, 29 Mar 2026 00:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774742751; cv=none; b=oM0QY8eJAC+zj5KpfaA2i3N8t5nlUQEWncBr48SUXmI4ZR2TmK0yrO8/WMr/8SaF0k/G+SJNtGuZw5jy/13P3Uv3V0Fgrx4cR2yjXfqZj/j584SqmR8gUUP/8fcLIn0gQ2sM3Um0xNqS0mfDPsr0nAHvZS3PBV3aQhekgRhbTXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774742751; c=relaxed/simple;
	bh=fthWY48S5PMtnkJlEyNVcbgO42N+UhrKPOMSYRkhiNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRZXqBNAa42Fc2kNVHy8ERFVBFAJSgCwbYXtfEIYRzuCaJ3to/eKf48n/to+TzDmeVAxE1dkDenAdgYZUHrs3+q58LiiLi/HtgtrWvh/0lga+ai8FQuz0gNXjMwlfaaoYO9Xxcg+4IWg5QhHF95git77iKUUH3U/nHzIcBMSnMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lxv/6hvb; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lxv/6hvb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xcjE38flg+beXCyYhvfc5FSyv3vszAeQaaEqYfMJIcQ=; b=lxv/6hvbzGP/4c4zEr2Q8luyNd
	xhBfyzkSNK3UwaeDM0XQhZTPo6PSZvgstOY2FjpTSHPPr7pD+ZtpA2U5i1pBHMyLUgxy0g+r4k3R3
	AdHyEp6Ln/1O9K7lvIRr0aUCkGuFvkJE7m7Jz1grPsHZVkEhCns1Gu2Zgw7Rx9ENC+Tw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w6dek-00DqEm-Fj; Sun, 29 Mar 2026 01:05:30 +0100
Date: Sun, 29 Mar 2026 01:05:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
Message-ID: <ed3d39df-0a0e-427b-86cf-b9b2d2094b51@lunn.ch>
References: <20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com>

On Sat, Mar 28, 2026 at 06:39:59PM -0500, Anirudh Srinivasan wrote:
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
> This DT was tested with a u-boot DT modified to insert clk delays of 0
> (instead of patching u-boot itself). [2] adds a u-boot DT for this
> device (without networking) and describes how to patch it to add
> networking support. If this patched DT is used, then networking works
> with rgmii-id phy mode in both u-boot and linux.

I've been looking at

https://elixir.bootlin.com/u-boot/v2026.04-rc5/source/drivers/clk/aspeed/clk_ast2600.c

And i don't see where mac2-clk-delay is implemented. Could you point
out the code?

Thanks
	Andrew
