Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638085;
	b=kor9GaDznXGcFKO8Q0ai7HSVSqaqf+9iatAoNOL8dCNXEb3HmgSfztZWo03b+3a4I0GD
	 NWklAr68DWzmeBUXZi+ainmk2jEl0GNaRE7Ja10dVH03dDnfzdLirOI/HcMHCOEewzc0H
	 GD2F2W4jg6Mx4h8NstuLc4VNy9tjFcIYk5SDv8PzI9TEaW1VIQOts32pSM0+NCSvPGAMA
	 NydHKRBTzPdYO1W3zz07RX2fdqHgHlu61zv+vkoyPksM9iaZXux1KAYsgEZxzSkeVUJds
	 8k9KcTWAHLm1Di3xAz/bqp4WkMITiBJ6yrFNE/fMiBPi5O2omjFdT57MO14CAdrSmkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638085;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=V2GUmZwFsfLBFSSZQCmvVdVgdpxOnuSFTIyva+aBgq8=;
	b=jGFWOVd8i20Si6OP45C0aeI379qT+egtkCwREcjKlr+SpoTQSD8/8GBLYGuP7Ox0BnkD
	 h99eLvTh6LChIRQolRCIEc3Ud9YRhO71svx6UugRSl4zHsHD2XFTi+n37DeFPnDPm4yef
	 QZRSLyLJhKnCjiGjXaJL0cSQvlUbEo+CR/pyh195J9P9a6Lp7vQp9e6tOI+AHrvCl7tzG
	 xl3/dlVrPGRzODuEbCIx0fyjW6kgvWZyVIix6fJtsizbOgSpeE2+KIu00kt4gG4k6/9uW
	 KVZPpKr69BqS6a2Is+JqSYVSJDmLddZDYd42O2Un3f20No/iPiq1zXMwLQhS0oG8mTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=rJ1qih2B;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB4A606A32A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB4A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=rJ1qih2B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=V2GUmZwFsfLBFSSZQCmvVdVgdpxOnuSFTIyva+aBgq8=; b=rJ1qih2BJIeNTNyt1+R9p1juni
	HfYACOBScWidZ1qkh0nQqzZTDl0RwHHQba9FnIsjZOp86x77yDpH9+l4pUMVAu2M2saqyb3skySTS
	oImIDPW+ygv6HQqCmcQLXH45LK4IJY+UsHyEedRuCWM/oPOeP5yuTd0K8RwyPVeItqY2Csm5PJmDv
	q9q9UP2sQVOuITTD+MW8FfKfUkdLxlRljmHD5zeGN0nw2CqrrUQF+7cPsdnshTG/ViSPSuQZjkm3E
	vVZh6M/JRmuZ5f3IApHM7l6ulQ8fxcgasukbuMZeqdzXowtOWtNMCuudR7rZfS45erRxmmX70TigO
	ODGB5bpQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Clark <inindev@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Alexey Charkov <alchark@flipper.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/7] arm64: dts: rockchip: Updates to RGMII PHYs on Sige5 and NanoPi M5
Date: Wed, 25 Nov 2026 21:20:57 +0100
Message-ID: <179563805247.3885553.6358930861216631692.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Nov 2026 14:48:08 +0400, Alexey Charkov wrote:
> Both ArmSoM Sige5 and NanoPi M5 boards use the same Realtek RGMII PHYs
> which currently share an issue preventing them from enumeration unless an
> earlier boot stage left them out of reset: at power-on, their reset lines
> are asserted, so they cannot answer an MDIO probe. Until they answer, the
> OS cannot look up the ID to match a driver. And until the OS has a driver,
> nothing releases their reset line.
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: rockchip: Describe NanoPi M5 Ethernet PHYs by their ID
      commit: 693e0c4f00389a097d710577ed5c24c4ac3f75a7
[2/7] arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by their ID
      commit: 5d839ad9553f90c727157c45471a911f64cd067a
[3/7] arm64: dts: rockchip: Drop NanoPi M5 PHY reference clocks
      commit: 9c83b53e6c858a9a8f00ca82ecd1f46d2d723b70
[4/7] arm64: dts: rockchip: Enable ALDPS on NanoPi M5 Ethernet PHYs
      commit: 620ad5b09bec5abd83d35bf23c1af1fb68eed80b
[5/7] arm64: dts: rockchip: Enable ALDPS on Sige5 Ethernet PHYs
      commit: e48f1d304f7b69b47c6f98b701aa6f8c84ffbb9a
[6/7] arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to datasheet timing
      commit: 5efab9e7c28448f6035e7216255f7b76b28ff97b
[7/7] arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset to datasheet timing
      commit: a2a390e7fa9e73ff07d2a9fc002114e299483202

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
