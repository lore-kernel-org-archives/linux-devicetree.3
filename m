Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644379;
	b=OWe1Vv7ny1bIA4M4ghkOz7WNSBtSL0/WaekP2OLI9v9Rda668AGgadl1imniFmihHRR1
	 7I6TKlpPPEjPnXKNHPQWOWEYURA7kKQYVVmztop+dK6tVjWpM2huBFejgOTdtS0ZwIeHG
	 krhc1cvWwmNuLtSHgvkh9T/movt/AmmWBCR8e/I5MfSNRogCB8sXngSw/0EtDez1Vzofj
	 p5zJWbxKrl+7XymU+KE74gLR6TcLQzR/MncNTKAsYbViCq3HT8KcgD8gfsgdPJq88h8RJ
	 1YmA+XdaTZc2b+NKb8Jt8fy5EoZ8mkxLr6YVMPZG9OvoGMr2qVMgCAGbW/jnCSFuakw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644379;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=WeFpY/9MPCmFWavLLfubRxFj12l+xkudz51ii0gQVQ8=;
	b=a9cZ6HnweHGh0aAcnseu0QYG64M4fsjkMkZpk1h3y2TOFM4a6pVd0Ej7DqBpt5EODWHL
	 b9Sdvq9dtdmlGwHDkvilEuMzRNUh6idaDL9PNGQJjBnbACwU1kJ8fYRmPUqAWCg6/GN57
	 wiXLWthd/FxtnhfmWeQ6LYXz1a1oNraRCKtxMqh2P0EbdXpCMgW4D+TautzWI6j3AB19k
	 VeMLNUeqRisg1pYKM5As/kYdPcCadrYae2WpTFqXi+4LGjppfgH50QM9gFjT0zUBv/7sb
	 WeP0NYdi073o56Jul1NjKWUSa23tHz/w2drNlXavbfTUTt5/eAaGrFsK7nLF2Uz0c6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uS4w128y;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20471606A31E;
	Wed, 25 Nov 2026 22:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20471606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uS4w128y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WeFpY/9MPCmFWavLLfubRxFj12l+xkudz51ii0gQVQ8=; b=uS4w128y6aHwss/qHSepgyV4yV
	9fUVsY7Cg7eDEFYU4G6yRalvyq1lQrJ7W735pnFJRRYmRpXKTpIX/0NYliBNcx9h+TskZ+0Gy0Xi+
	BzcgiB0P5h8VA5YCpv7TgCJhIRLsJJiwq2rB3h58dzfm9m9TufJTxRixFTGqyjzu71ws=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWL80-001Rg8-IG; Wed, 25 Nov 2026 23:06:12 +0100
Date: Wed, 25 Nov 2026 23:06:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Saeed Nourian <saeednourian82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Firefly AIO-3588Q
Message-ID: <fe692a8f-acb3-4c1f-9e91-e7af2a08995b@lunn.ch>
References: <20261125114757.654051-1-saeednourian82@gmail.com>
 <20261125114757.654051-3-saeednourian82@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125114757.654051-3-saeednourian82@gmail.com>

> +&gmac0 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy0>;
> +	/*
> +	 * The PHY supplies the RGMII RX delay (rgmii-rxid), so the one in
> +	 * the SoC is disabled; the TX delay still comes from the SoC.
> +	 */

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

	Andrew
