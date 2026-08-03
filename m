Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94BE23507C;
	Mon,  3 Aug 2026 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761910; cv=none; b=EHeZElSIKO82WitT3a2kwC9aLlY7o77n45p51sQYjmt/6tJjJ/7VmdsDXMN0mZWwKRXyl1NIn3dRJstHl14EitUgukjKUx2d1ZYQPaMPxJZjGQs8h2/M0qeOyL+NhmuakYDtkDxCzDZkWQgu/a6Qy2Z8ZM10IRrqczYnc/FS0e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761910; c=relaxed/simple;
	bh=6B4CVU01vXTHlyd7DRJzdlqwtH3luX7l9YjrjUVM/u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEIPAZWI62dH3b0BppPDFgMZLYdrgvo1sq5kqeXP9Pjngf1l6JnnwPhKVh+WLBXEk9bzfSbSPFYfEzZ+LI86oUmIpN+iXPk5iaIhI1325+t2eJjo37DSDzDHNna7Y7px7VJIUbbUah7NE+NOXUeFQXGDqW1CRBmcODkbaQdmLaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=XPvO/U2D; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="XPvO/U2D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h3RZ9MZrJRlYpmJWGBALRfdgpWl81bAE0/bWp0ApIOY=; b=XPvO/U2DqO7spL0YdgbUNARhiN
	IV21tBivZ4qqClwaWOpn/2TW1bLemo/ud6v9m73u0/K/JkL+qag97XzdbNhX9tBn0Ypl3DG7xLL17
	pKxw77Qn0Y3S/+D17G37K3voCR/R4iCeQz4WYq+Yy3QKfguKXLfWC/XKTXGwjtguI2vc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqsFF-00Fiw8-46; Mon, 03 Aug 2026 14:58:17 +0200
Date: Mon, 3 Aug 2026 14:58:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?6a2U5YqbIOmXquWFiQ==?= <molishanguang@outlook.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [RFC PATCH] arm64: dts: rockchip: H28K: release RTL8211F reset
 before MDIO probing
Message-ID: <d2780faf-54e8-4c0a-8070-93d36c91cb19@lunn.ch>
References: <SJ2PR04MB851017E50140354C2F5B3FF3B5D52@SJ2PR04MB8510.namprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ2PR04MB851017E50140354C2F5B3FF3B5D52@SJ2PR04MB8510.namprd04.prod.outlook.com>

> This is an RFC: snps,reset-gpios is deprecated in favour of the
> ethernet-PHY reset bindings, so feedback on the preferred way to release
> the reset early is welcome.

> + snps,reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> + snps,reset-delays-us = <0 20000 100000>;

  snps,reset-gpio:
    deprecated: true
    maxItems: 1
    description:
      PHY Reset GPIO

  snps,reset-active-low:
    deprecated: true
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      Indicates that the PHY Reset is active low

  snps,reset-delays-us:
    deprecated: true
    description:
      Triplet of delays. The 1st cell is reset pre-delay in micro
      seconds. The 2nd cell is reset pulse in micro seconds. The 3rd
      cell is reset post-delay in micro seconds.
    minItems: 3
    maxItems: 3

As you say, deprecated: true. You should not be adding new uses of
deprecated properties.

Try using the reset properties in mdio.yaml

    Andrew
