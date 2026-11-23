Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446517;
	b=a1Yks04uL4F3Ke1yqbHhDu0245103Xua2/hLaNnEMCet3dOUK6HRnEOrsQcCluT1hzIh
	 J9C6UdFlfZcce40qPEfrT74MYoR03x4UMZg4DtxbKdkH+a+XtvK9YoFYcWaMvQMGl30Ov
	 7HcdCQq3cSIiElk0RYAmGlrnMd0qL0HAGG/XUnruS7fxIux91ck1iXC6qmclCXehUdGK+
	 ki2aA6/nq8HEnd1URcQUwUa0VrAZ/srQ+labB3JcEu5r8OvUPQ79Glyz2lD8Zkanl4VAn
	 HOvDRtCd8uds1Z04f0MtIWUamVBmK03Ldq36eFcIqG5uWH+WIsGw4FkDv/1leJAadcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446517;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=cjblWQP22DDkX8PQwyqUXo6ncqKIwHv586PCd1qQti4=;
	b=LBIDzJypqQ4mrnZa3Oj6+5EIE05t3yy0aoPPaREHdxddheyz9UyvAktqevxwOcT9mzk4
	 ebKyBMp0VJAaBau6ZIHU8D77xRPXWkURRwnSJcon+rpXjc+WqQFt2b2V4ojAV1ymDR9tx
	 0XJmGUxgAvcvf2h3s2ub6H57MuAiuYHYysAqu+6jvIfqHW/yK/uLW2QYeEOWwyynMi+Tp
	 MM4CXTf9a9NC7OphZJDTa8BJc1tn0Hma7dtzCS+s6z43OdpFiAxSiBlYYG642NvptBrz3
	 GAnshAIKlp+gRnwZ30S0nxcXiKZdGy1l+F/4bRySrMaYeykKv2biCpAYnLzKTZfYoTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ooMIwlxg;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDAB606A31A;
	Mon, 23 Nov 2026 15:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ooMIwlxg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cjblWQP22DDkX8PQwyqUXo6ncqKIwHv586PCd1qQti4=; b=ooMIwlxgNI33rP63+Ad3nDuhiS
	S+S+xP7FY8nMS6Hcz9h2CIDRnqiLbNwX+E1kpoG6nRApr1vLNGYfAgvNTmmXiyiBQSkdZ9mPQE3gU
	/962kEe+CI852MVoo3PV30dPW/u97302eFEgw85NsSKZGlxkjNLOhmzpe/xv6xk6x6IU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVVeZ-000obW-B9; Mon, 23 Nov 2026 16:08:23 +0100
Date: Mon, 23 Nov 2026 16:08:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] net: stmmac: Add glue layer for Synaptics SL2610 SoC
Message-ID: <c86cfa4a-5738-4b8d-bed5-4dd075f7cbf8@lunn.ch>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-5-jszhang@kernel.org>
 <4f1c4180-3a00-4b17-a27b-e61b307d3e5f@bootlin.com>
 <awQ5raWYlMBpCqIl@xhacker>
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
In-Reply-To: <awQ5raWYlMBpCqIl@xhacker>

> > > +#define CTL_PHY_INTF_SEL	GENMASK(4, 1)
> > > +#define CTL_PHY_INTF_RGMII	FIELD_PREP(CTL_PHY_INTF_SEL, 1)
> > > +#define CTL_PHY_INTF_RMII	FIELD_PREP(CTL_PHY_INTF_SEL, 4)
> > 
> > Please use PHY_INTF_SEL_RGMII and PHY_INTF_SEL_RMII from "common.h"
> 
> I read this as "use SYNA_PHY_INTF_SEL_RGMII and SYNA_PHY_INTF_SEL_RMII",
> correct me if there's misunderstanding.

https://elixir.bootlin.com/linux/v7.3.1/source/drivers/net/ethernet/stmicro/stmmac/common.h#L316

#define PHY_INTF_SEL_RGMII	1
#define PHY_INTF_SEL_SGMII	2
#define PHY_INTF_SEL_TBI	3
#define PHY_INTF_SEL_RMII	4

Which is easier to understand?

#define CTL_PHY_INTF_RGMII	FIELD_PREP(CTL_PHY_INTF_SEL, 1)
or
#define CTL_PHY_INTF_RGMII	FIELD_PREP(CTL_PHY_INTF_SEL, PHY_INTF_SEL_RGMII)

You should try to avoid magic numbers.

	Andrew
