Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552861;
	b=BqBYjrVWYMj0gc/jSc9c3Xrrai6JWxJWJFfYIKd3+G6Lzpg+GuPF9lUjjR4CvInYWMXb
	 o0CTVRAqriaw/DGKc1gMwaekT9a85AbsTOA+2VG6Nd8XGbsxWi/nqe7S5ieJWFRU27weo
	 udU7zvTxNiAX+pRytQFN/eR1C/7HilqhzaWjxsxoIwQraz9QpMztPTwpOgDmtepnR2IpU
	 ARfFTBSVaezxvplqdDHHnOrvK1+/calZPPvhfemVR5UhlphLxSU+MGgETMzPXD3pwVDNw
	 v9nuvD6iZzoS6wNEu16Yy62IeWtj0kKaQdfwQnOR3R7IZ0shMNTtT+iITqWjNUfa5tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552861;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HtXaFv8ox8eoXfuZbsRmZP1LbmphcLFEuiWXrOeEnQo=;
	b=wbm4ypZnwRDNujPjB4navX1NM1o5Y5tcF4YIW6pZlNrJqAZfdJ1yqxk+6G0gxdGjuGxX
	 Fn8yFUx8crXuVAYapgyJc7lHJ/+f98aV03wEFl/Qp/MJWp9jl6Vx/dHqiU971rKBNGovU
	 brWX16fPNuNEUL2uGK8S7/CvnhiI9Q/HHTUVYfSKND1a6J2s0qzKLWGCKH5b/AWThTL2h
	 UILc8AxuXtz6V+anAdmZrf5VuaYmN3RcvsFOpWBcLFqDSxV1F1O+r5CMbv1JwCCxqEknL
	 OnTBo3ookrNSidxP9FTt1rzp/U6WKozMvOPkAraybIU44Nia2VVkNC/yIn3e+XjpAGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RGLAPBhZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398E2606A32D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RGLAPBhZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648A81F000CA;
	Tue, 24 Nov 2026 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795552860;
	bh=HtXaFv8ox8eoXfuZbsRmZP1LbmphcLFEuiWXrOeEnQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RGLAPBhZA5aOZZNqZsqtNX7VmltH+wROEXxMKgnRyE+xnIekf4//TBIof5aYaVmt6
	 ZTJOIupUIbN2p5CXsFCuytKX6KYXM5U3O8r+3u/zUlbZcUt2w8hZpRFLRgfuaosgk7
	 4CsOM7ipmgAhW0cBuQMqZrKv8m4yXwhSAT3lo/SYuEClE1mlIRaaFRhJbZoyRdD6SJ
	 Ew7TBe0Xzag7MgDSRuOUXSfbq3jFRdz+lK7zwGm7gsWbZ33sF657doRnlpQYAhspr0
	 OFQbJU1jqpGL77wTsA2Rf9Sf6Vb4sLf0fbyYduXP2mZgSCVPnPtUxey9Uu4cUgIiY8
	 vz0gYuqiEZvoQ==
Message-ID: <sashiko-outbox-231995@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/3] net: mdio: Add Cortina CS7542 bus
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-b4-cs7542-mdio-v2-2-30465e831853@gmail.com>
References: <20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.com>
 <20261123-b4-cs7542-mdio-v2-2-30465e831853@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 20:40:59 +0000
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
- [Low] net: mdio: cs75xx: unused bus member in struct cs75xx_mdio
--

commit ccf31526086167de7cf2594c8a7e311b16ba7517
Author: Fil Dunsky <filipp.dunsky@gmail.com>

net: mdio: Add Cortina CS7542 bus controller

This commit adds an MDIO bus controller driver for the Cortina Systems CS75=
42
supporting Clause 22 PHY register access via bounded polling.

> diff --git a/drivers/net/mdio/mdio-cs75xx.c b/drivers/net/mdio/mdio-cs75x=
x.c
> new file mode 100644
> index 0000000000000..33e1a48bfcf16
> --- /dev/null
> +++ b/drivers/net/mdio/mdio-cs75xx.c
> @@ -0,0 +1,119 @@

[ ... ]

> +struct cs75xx_mdio {
> +	void __iomem *base;
> +	struct mii_bus *bus;
> +};

[ ... ]

> +static int cs75xx_mdio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cs75xx_mdio *priv;
> +	struct mii_bus *bus;
> +	u32 cfg;
> +
> +	bus =3D devm_mdiobus_alloc_size(dev, sizeof(*priv));
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	priv =3D bus->priv;
> +	priv->bus =3D bus;

[Severity: Low]
This isn't a bug, but priv->bus is assigned in cs75xx_mdio_probe() and never
read anywhere in the driver.  Could the bus member be removed from struct
cs75xx_mdio?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-b4-cs7542-=
mdio-v2-0-30465e831853@gmail.com?part=3D2
