Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795301798;
	b=19VDs2IWlTMo0iLGHML/sGV7ImXX1mK/HJZqqheessDu6vVkAui6xZzvyc9xOWmly4lo
	 EEUtPs+h+1kh3hSNqyFMsHa7oupL7+IHI+s/Dni2cqdFSayV2nId6ikWjbuV/SKLh011/
	 B9Je9V3Yce7m3pFjYO2a59X2calpYdEqYJPkDbfL5m1V3EXxZoGiLo7ftcM4nkG5hv2th
	 8D4CjkWog7VtWTghsItY3ECc+Z0lxdDRJ7PNWONVo9qjTbfq54MllkX12nr+L3y6yUIkr
	 m2UDkAfmU6/RLx9uycuNjMWdYyjsxspuES8RBwly1uf+2L2pU0P29P9sJGz+Sf5F9WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795301798;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=r2q3LlcXOhJE/UcBDtYyeeDxFGZavtW/dVlyD11nD44=;
	b=iP8vEfNP58xil9K4Dd5Rcp/iRt+CaF8+63NXOTBqpmR/axoMltzeYPvXLKu6KOE1robx
	 VnTr9aHApwUneUxTcC+wpI3uO3QSnF7aXML44RvNq7ReAWPsDgfBUDAok09fUwzCTYiQW
	 0kSWpISSvj7JjOIlX2ISbS5udnLUVFQxtfQ8Og5uuj8RYSpP3emTcBnMA/cvwwwKgt5Uw
	 8z0Iv+zE00W3AgpCGfQSn4EOwAMrNVzoFFA8K78ye2ALDUq5krwryLk3rolV9Tc9cPbTB
	 dXhNTfncXEVTLXasj2u7wMiv5h6TlUVQgAi0sq9wdhnRYR3zzsMSQgrrOghzl/YaPxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g98bzIVj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806EC606A320;
	Sat, 21 Nov 2026 22:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g98bzIVj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D81A1F000C4;
	Sat, 21 Nov 2026 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795301798;
	bh=r2q3LlcXOhJE/UcBDtYyeeDxFGZavtW/dVlyD11nD44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=g98bzIVjF7dsTPk0LCNmEnMGd7I8UNkcV0BYpfbjNjVtvp5uKbQPCCyMfjrk1S8ZM
	 ijCNO/E4TofRPcHmCXc2H+nMObTE9l9tITZsgQbD/cRFGegBmzyKCje9n6zzH9F6ch
	 gZYQl4qqIpjkNoJpq9lJgB1NhCi+Dp+qV97dy+mzmE4KAoJm9VPnHHUoU9vrQvDevZ
	 hQgl4E+4XPUQvEki+kFVCbBPo9yo03KmX9ltn2BOJikuytMwxYXyg2MqCv2Zg0wF27
	 sZVfYh9R2TxAYvIldqCao8WbiuZzSYg701NEensNoe2Ovj0Nx5e+IWzTmM5jEaHIUN
	 nteLzy9C8yOnA==
Date: Sat, 21 Nov 2026 14:56:36 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Cc: 1579567540@qq.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, David Wu <david.wu@rock-chips.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v4 0/2] net: stmmac: Add RK3572 support
Message-ID: <20261121145636.5c41bda1@kernel.org>
In-Reply-To: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
References: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 17:04:34 +0800 Cunhao Lu via B4 Relay wrote:
> This is one of the subsystem submissions for RK3572 support.
> 
> This series adds the RK3572 GMAC bindings and support for both Ethernet
> controllers in the Rockchip stmmac glue driver. It provides RGMII and
> RMII mode and clock control, with MAC RGMII delays disabled.
> 
> The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
> Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
> The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
> ports, a Type-C dual-role port, eMMC, microSD, and UART.
> 
> Testing was performed with Debian 13 minimal and Linux 7.3 on the
> OK3572-C with the FET3572-C module.

Series does not apply, please rebase on latest net-next/main
and repost
-- 
pw-bot: cr
