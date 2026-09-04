Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF2490C1A
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524523; cv=none; b=r6n75r5xU/+XFybMYRqUyzt91bsmP/NBcRB9iHaela1kCaWoy8oimRUXGEtfZZx4D3VriuiwIUhkcWvpNcNavI1qqweM2F7wG/0HSQq6LTnAWiSRuLWowvnKjuvAJJ8o/Me4iPZ/LIKXN96qgzslAs5lgYGBNcBCEHNEqnbUyAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524523; c=relaxed/simple;
	bh=fsYtRjbTdxVcNT6t2ujPjA7w9tMu8e/g4I6CgN6zl/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R2JSnhkFMbILHv5d8fjIP+Dst5QFK09PKiVxs1i7fHIM+wUaMQTRoqsbrLOYiwwbty+X0pVAJvu+MG18Ri8isjjWn6nNKmU3tvv000WEikO7fFufrHSWpY1lsEo1scnj9AC1GDIrIN/nNTnmu39VR9TDLkTBcIX3qtXLN/GxEXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSqMN0ci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSqMN0ci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4511F00A3E;
	Fri,  4 Sep 2026 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788524522;
	bh=TsgClw2TOdNNgEh8G/rvqppSZZebOcDcCe3L9Q9CxiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SSqMN0ciPC8lGLrjscN7iThF7muRbVMKc23huEXS/uoY4TYt8Xg6tqFlbH/VCmFpd
	 8U9bAYwP4IHIG+Ald8rLRL0fndLa7/AgJ0xkWH6AqSe1EclRMNwLWMh/EZf05A+br5
	 DzAxrP83kyygZQCIYY61DEtpYPDbS+WpdBeROIDQWHe0Z3cdBztgkGCzI/MQHYHM6y
	 skvPe+v39DMrohmmWRWIin570uzCAti0xsfnnlzCI9T9EULncIPeolEjZjNmE01PZS
	 FZF7G9W7yV9hTEp4oNP41lY6Ik++pxMyBv4bdH/uE3E+IrLOfA+xL5X9wlg7Qg66eW
	 pcD8V5OcDRUsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/3] net: mdio: realtek-rtl9300: Convert
 "fwnode" left-overs to "of"
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260903122119.2638354-3-markus.stockhausen@gmx.de>
References: <20260903122119.2638354-1-markus.stockhausen@gmx.de>
 <20260903122119.2638354-3-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:22:01 +0000
Message-Id: <20260904122201.CD4511F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probing fails entirely if any child MDIO bus node is disabled.
--

commit 9c3a52ecd349185743d66b8f8767bc5d73fad987
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Convert "fwnode" left-overs to "of"

This commit converts the remaining fwnode usages in the realtek-rtl9300 mdio
driver to use the OF API. It updates the probe functions to iterate over and
process device_node pointers instead of fwnode_handle pointers.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 11d078ef941cd..429321e9114fd 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -1027,7 +1027,7 @@ static int otto_emdio_probe(struct platform_device =
*pdev)
>  			return dev_err_probe(dev, err, "failed to setup MDIO bus controller\n=
");
>  	}
> =20
> -	device_for_each_child_node_scoped(dev, child) {
> +	for_each_child_of_node_scoped(dev->of_node, child) {
>  		err =3D otto_emdio_probe_one(dev, priv, child);
>  		if (err)
>  			return err;

[Severity: High]
This is a pre-existing issue, but does this loop cause the entire MDIO
controller to fail to probe if any child MDIO bus node is disabled?

Looking at otto_emdio_probe_one(), devm_of_mdiobus_register() will return
-ENODEV for a node marked with status =3D "disabled". Because
for_each_child_of_node_scoped() iterates over all child nodes including
disabled ones, this error is propagated back and aborts the main
otto_emdio_probe() function entirely.

Would it be better to use for_each_available_child_of_node_scoped() here to
skip disabled nodes, so that a valid device tree configuration with an
unused MDIO bus does not break network connectivity for all active buses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903122119.2638=
354-1-markus.stockhausen@gmx.de?part=3D2
