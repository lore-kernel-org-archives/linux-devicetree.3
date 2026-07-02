Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40755344D8C;
	Thu,  2 Jul 2026 17:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012616; cv=none; b=B+nZyBctMblqgTMtCm6/ofAzvC6I7NPS73rxYxaMlQOLB3KtaeQ37+0orWuc8nC/PiGnLVCpVxDjKnnrHyWWnvm6q0GUN39JVRGQIzyR3KyX5v4RcAyUwFaV+jDW3CioahsEIPw5imYziLuFAbLxPId8AkCUeflGNQ5IZh1kBuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012616; c=relaxed/simple;
	bh=+UjUy+Ax3Jm1IURjpBiYLcBUuUQRE3ByMB4C3rk10uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jua+XuLO8NnX0BpzOiDhUAw9pBXiso5rAXdkTsg8harRx7lrpaC0ctcKp36TRpB9fSNcvGmQIcesMIqIWZxMq2EgvaNWtqQNhMdzpeGudlB+j+Vyw0mWQgON1zDmihyQkewn2FPPvYwxUxjZJV+dFl0Dz7eGDKobemf/FsOPpoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kjpQTX/S; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kjpQTX/S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9hU8UIsJBJs/wJVPysC5SFtDzxZng9BNNVfogLEp8pw=; b=kjpQTX/SSMGDFX7PWnu5oH6F0R
	qH26UpJqTO5RPkm0abkr6Kd0jMQplVjnu4Hb4qRiXAEMzNFV3OKWgqJ+/JQMkVpTLWlFq75MQPgdd
	d8xMaN9+t0KnrWLbfp4yQzeRU4879A9J3N17qndTPck/+reBKLKw0WqgPFfpScFnFo/Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wfL1Z-00APGr-Sh; Thu, 02 Jul 2026 19:16:29 +0200
Date: Thu, 2 Jul 2026 19:16:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Message-ID: <c43899a8-3d6a-4c94-b0c2-33c00a830610@lunn.ch>
References: <20260702165524.2168091-1-jackyhuang@nvidia.com>
 <20260702165524.2168091-3-jackyhuang@nvidia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702165524.2168091-3-jackyhuang@nvidia.com>

On Fri, Jul 03, 2026 at 01:55:24AM +0900, Jacky Huang wrote:
> Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
> Rubin NVL compute platform.
> 
> MAC0 uses phy-mode = "rgmii-id" because the on-board PHY supplies
> both RGMII internal delays.  The matching U-Boot device tree does not
> enable SoC-side MAC clock delays, leaving the MAC internal delay at
> zero so the PHY-provided delay is not doubled by the MAC controller.

> +&mac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +	/*
> +	 * The on-board PHY is strapped to add both RX and TX RGMII
> +	 * internal delays;

No change required, just a comment. The strapping should not
matter. All Linux PHY drivers should configure the PHY based on
phy-mode, replacing the strapping settings. There have been cases
where the strapping is wrong...

>                       declare "rgmii-id" so the MAC does not add
> +	 * additional delay.  The same setting is applied in the
> +	 * matching u-boot DTS to keep early-boot networking working.
> +	 */
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	status = "okay";
> +};
> +
> +&mdio0 {
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};

For these nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
