Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554A4749E9
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246408; cv=none; b=N8y01x0Rp/qvc70oEOdLMim/JL3yjtcS46lgvcW64N21j3Rn/fxKN0+84nPVSeUWy38/pygWV7/NZI2kn54ToNrDWbkajzhTd5QFTQSeb9TWWAoxN9djKkQnfkMLinfuVEtCm4AiBG+pViVPhlS2WhKgisg0VZ/rAe9wyiLWWlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246408; c=relaxed/simple;
	bh=y4BCepEeTCV42NtlCS0SIBt47F5NeIAGZNdAyGLVVnY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fqQMsOQ3P320mPK1PKqCnCiPpt21JbbNdtR3PbZTKLKheQiInOpElzpbfboj0gR31F6Za+iewQoRi9WKRfZEhVnhay+7Cg+1ECbVctzPLXcfsSmX+ex1sjk1kEmmoFSXpEQVsWKy8eMJdAm4h8BI0n6DzifQ8S23L1zfkDeHnhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m86SwwSi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m86SwwSi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773F61F00899;
	Thu, 24 Sep 2026 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790246404;
	bh=r+GaS3LlN+CjRL0Z9zaAV2LJkh9hwC0ueQotnZMtr2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m86SwwSif9oLzch0WVLclJCjRf9aLoBmI7i4n1639QqDwrA7slzDbBxIwbnRgGPJA
	 Wg6tDGm7NXfH11egOUeAn4qjmSoYvwrLzqxtb3FFq5PYkFQ0x/0yJ5pV/nIlKu+1d7
	 8+iNRa2jqEF9bDlQvrVlH4sNN1UiiPg+455JDLfPRIteheujOcofSQ749jRwK7DiiC
	 OAV1nwVgBRWCa/VJJlNopGtOZDlg6FP4QeuiHfyaXWgKTCYek2o4Ka15v8oSgA9IC9
	 kFznZRw/ictmdXQyHON8zJpAoNxX9n4TUwir1TWnq72i5Qx0aEWQ1DRNDxAAin66JQ
	 7qtXaivnzkW6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 5/8] net: mdio: Add SoC-e SWIP MDIO
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260923-devel-vstrassheim-soce-dsa-ml-v3-5-ddebafcb9ba7@linutronix.de>
References: <20260923-devel-vstrassheim-soce-dsa-ml-v3-0-ddebafcb9ba7@linutronix.de>
 <20260923-devel-vstrassheim-soce-dsa-ml-v3-5-ddebafcb9ba7@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 10:40:04 +0000
Message-Id: <20260924104004.773F61F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mdio: null pointer dereference on devm_ioremap failure
--

commit b20b4c686880ab360f1cde6275ae5af3a5306146
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

net: mdio: Add SoC-e SWIP MDIO controller driver
   =20
This commit adds a driver for the MDIO controller integrated into SoC-e
Ethernet switch IP cores. It supports Clause 22 and 45 transactions while
managing shared transaction control registers.

> diff --git a/drivers/net/mdio/mdio-soce.c b/drivers/net/mdio/mdio-soce.c
> new file mode 100644
> index 0000000000000..59c0b3da483eb
> --- /dev/null
> +++ b/drivers/net/mdio/mdio-soce.c
[ ... ]
> +static void __iomem *soce_mdio_iomap(struct device *dev, int index)
> +{
> +	struct resource res;
> +	int ret;
> +
> +	ret =3D of_address_to_resource(dev->of_node, index, &res);
> +	if (ret)
> +		return IOMEM_ERR_PTR(ret);
> +
> +	return devm_ioremap(dev, res.start, resource_size(&res));
> +}
[ ... ]
> +static int soce_mdio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct soce_mdio *priv;
> +	struct mii_bus *bus;
> +
> +	bus =3D devm_mdiobus_alloc_size(dev, sizeof(*priv));
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	priv =3D bus->priv;
> +	priv->data =3D soce_mdio_iomap(dev, SOCE_MDIO_DATA_IOMAP_IDX);
> +	if (IS_ERR(priv->data))
> +		return PTR_ERR(priv->data);
> +
> +	priv->ctrl =3D soce_mdio_iomap(dev, SOCE_MDIO_CTRL_IOMAP_IDX);
> +	if (IS_ERR(priv->ctrl))
> +		return PTR_ERR(priv->ctrl);

[Severity: High]
If devm_ioremap() fails in soce_mdio_iomap(), it returns NULL. Because
IS_ERR(NULL) evaluates to false, will this bypass the error check and allow
the driver to proceed with priv->data and priv->ctrl set to NULL?

If the driver proceeds with NULL pointers, will subsequent PHY accesses=20
through soce_mdio_read() and soce_mdio_write() pass those NULL pointers to=
=20
readl() and writel(), leading to a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-devel-vstr=
assheim-soce-dsa-ml-v3-0-ddebafcb9ba7@linutronix.de?part=3D5
