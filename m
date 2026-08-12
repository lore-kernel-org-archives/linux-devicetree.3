Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4A13019C3;
	Wed, 12 Aug 2026 21:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571602; cv=none; b=jaj2QNdKAsIsOQJoblQTdSIqHnfgIelYQ21FyhTBDgFEswtQPsaFihQ08qTr1Gt8LD3fBh8W+gWSyxVGoo/QyUU+aL1WFRYSmFPkcrMKXF8Hf1yERGSkQFhPmRqbIQUC5932qMe6UjwBpUw517JUUMMMt57kzqoEaCPHOybcpyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571602; c=relaxed/simple;
	bh=/gnaec6TEyAeT/WPSyWjahEy8bQjIl5XiQ0JgWVu9Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqpS1pbT0mhcV7EjwiMyD2RzwLo6FgDJnEpj1zUOsmRd+4YIWqBGdl06mwAdbTjaik3eAtLG/5lS1it5hZWalmvsNgnm3wNM7ukKFDUMaDYHHHGbnf1DmN2RXDTz3PKdZnzI8mrWQnnWl9nC4QbP2ptjYVwpAwDyVzD8kMpKtsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=FtawfCMa; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="FtawfCMa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RwZHukbqLv7BHqS0JF9Z6TGHh6LoMK09HeqSBe948E0=; b=FtawfCMarRQisIuojPvxU6cEHB
	6K3HFmxxNtgbjeavOzneNPWx3BEqpxR24sQ5BmSqS8beNlOJao6fXnt2Bhmx36xzwNNuRdSOEp12+
	VMewNvBWyr6iAQ8FoXhRILQJo4JguHdE3+GJJauDwh3HLP68EePTG20MzuRR9gK+jQKI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wuGsZ-00HKYZ-UH; Wed, 12 Aug 2026 23:52:55 +0200
Date: Wed, 12 Aug 2026 23:52:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Radxa E54C
Message-ID: <6248f137-ff98-4d3e-9ca6-f94741533686@lunn.ch>
References: <20260808080018.1492239-1-amadeus@jmu.edu.cn>
 <20260808080018.1492239-3-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808080018.1492239-3-amadeus@jmu.edu.cn>

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-mode = "rgmii-id";


> +			ethernet-port@6 {
> +				reg = <6>;
> +				ethernet = <&gmac1>;
> +				phy-mode = "rgmii-id";
> +				rx-internal-delay-ps = <2000>;
> +				tx-internal-delay-ps = <2000>;

Both the MAC and the switch are using rgmii-id? How does that work?

	Andrew
