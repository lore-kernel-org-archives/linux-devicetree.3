Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545760;
	b=ox6KYrJv+QAiSk/oenA4FZhdQjbUXGN8OvBS2WYZECbDjghnZV0HaO3535QlNnuQ6zwl
	 x5jQi8WyMwp/4JdWO02HVu7recorsxBlkUj6bpagCWF3DoBBI6HcngChCa0u62G/JMm0y
	 m2wmgl4iOXR4/C5Gr209mwQF/xMyrAprj/Hb4UHB/gRD09tvvHC6joS2gav2fzPDrEQu4
	 qaGbryldzfla1qt9NN6uePNNqzTACary0Wm2Fa6kyKdUGPWInzVFdXQkWF8T+KAzR4yWz
	 nF1pgecEx/hlW9E7lC/Pftl1fPdEEeUjV2P5hMJ/V4qC9gZXuFL3XHI30WsTNJKhyTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545760;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=snHCWwbVwhQKuh+FcFP2Xt8KwTxxDNFpm5983JC9nFg=;
	b=f9ManKRC19tvMder9bV2yLqZTSwTbqKy2LkofP4A1zoJhZXAvw+5BRpeVFVVpJxtpKD9
	 JpJe3RllWsw8N8HJOoRNuSiV/rkKjB0a+4DKQK+hVoLYFwnqVS4a4zVEZVw1wIBeiB7Ba
	 3nAtWDfGSuSmn14TjtiK+QggsalbCwgcSKlwCmk3uOC4lxV9FTIM3cxtnkcyGcvTxrd93
	 eOZ/2HxX8LmbbqxbkAtub4TxAZjVyEqB+YaSudNwlHQhiXpAqjs96NxrLQKx5OQ+qcmys
	 f1x2vqzuMSg36IJttF6tGedQQG455NSsfUoY3ZqhWWkRNPP53+28/E520IFBxQAQKMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aTu6PmHv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD1606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 18:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aTu6PmHv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21651F000C4;
	Tue, 24 Nov 2026 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795545760;
	bh=snHCWwbVwhQKuh+FcFP2Xt8KwTxxDNFpm5983JC9nFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aTu6PmHvGeeiN1IjgT2pJ/VdOGC+7AVmP3YXvdE8LLNTKw2zLsQAfCYcRItT92QQH
	 4yAMEKzckrptcV2+RKpM3rJmxANjbFkd6+WSrHt6hzD0Rk2+XObKV0j3bEh0LYCcsa
	 vpIWJpdIXKDnIxzGnHSm7+01mWNsfUwTQUXwc9wWC/GqbrlyHUXd/I3dF60WC/ZPlv
	 R5mU7ScRVhID36XKtfsXA/PSyqICcHc7eitLnsbjHMkOIl1Ngm4myg2lLYyYXhTdO9
	 xdimY70uJZfZEyJimj8Jr9H6FJ6k8pB4V4U33EgSkYIPyfCMhp2Jal5Xde6EfBghyH
	 oDZgFCyYfer7A==
Message-ID: <sashiko-outbox-231846@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/3] net: mdio: Add Cortina CS7542 bus
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>
References: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
 <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 18:42:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] net: mdio: config MDIO_CS75XX placed outside MDIO controller
  drivers menu
--

commit 5696e9ffcb4efbf23e9beb1e5e2f708644fbb193
Author: Fil Dunsky <filipp.dunsky@gmail.com>

net: mdio: Add Cortina CS7542 bus controller

This commit adds an MDIO bus controller driver for the Cortina Systems
CS7542 management interface supporting Clause 22 reads and writes.

> diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
> index d44278f26fabe..a20fec8058da9 100644
> --- a/drivers/net/mdio/Kconfig
> +++ b/drivers/net/mdio/Kconfig
> @@ -291,3 +291,16 @@ config MDIO_BUS_MUX_MMIOREG
> =20
>  endmenu
>  endmenu
> +
> +config MDIO_CS75XX
> +	tristate "Cortina Systems CS7542 MDIO controller"
> +	depends on OF_MDIO && HAS_IOMEM
> +	help
> +	  Support Clause 22 PHY register access through the CS7542 MDIO
> +	  controller, retaining the prescaler configured by platform firmware.
> +	  Transactions use bounded polling and recover from late completion.
> +	  Device Tree describes the PHYs sharing this management bus.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called mdio-cs75xx.
> +
> diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
> index 0485867460262..2afa6066fc01f 100644
> --- a/drivers/net/mdio/Makefile
> +++ b/drivers/net/mdio/Makefile
> @@ -35,3 +35,4 @@ obj-$(CONFIG_MDIO_BUS_MUX_MESON_G12A)	+=3D mdio-mux-mes=
on-g12a.o
>  obj-$(CONFIG_MDIO_BUS_MUX_MESON_GXL)	+=3D mdio-mux-meson-gxl.o
>  obj-$(CONFIG_MDIO_BUS_MUX_MMIOREG) 	+=3D mdio-mux-mmioreg.o
>  obj-$(CONFIG_MDIO_BUS_MUX_MULTIPLEXER) 	+=3D mdio-mux-multiplexer.o
> +obj-$(CONFIG_MDIO_CS75XX) +=3D mdio-cs75xx.o

[Severity: Low]
Should MDIO_CS75XX be placed inside the "MDIO controller drivers" menu in
drivers/net/mdio/Kconfig rather than after the two endmenu lines?  As writt=
en,
it sits outside both the "MDIO Multiplexers" submenu and the "MDIO controll=
er
drivers" menu.  In drivers/net/mdio/Makefile, obj-$(CONFIG_MDIO_CS75XX) is
also appended after the CONFIG_MDIO_BUS_MUX_* multiplexer entries rather th=
an
in the alphabetically sorted MDIO controller section above them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-b4-cs7542-=
mdio-v1-0-626d0a0e3b4d@gmail.com?part=3D2
