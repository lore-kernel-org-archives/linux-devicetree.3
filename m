Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7435647D93E
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070450; cv=none; b=Wdvjo/WgSZCCnlLVUlT9MwHuJ2oIYBcO3vPqTLhcQ6UCUP8bRDyi4EVUwHYadu1DFc+57ilF3w+UTHE7lidA/DQQsHAAzOSvLGg/kQE9wyfpbbrfeksa1NOnpDfaG0/NV3MoSY0T8Z5jcGyKSPvwXtnK8xB5WjHgs8N6L9XNAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070450; c=relaxed/simple;
	bh=jV7GyKDmrbeMj1etY71liW7udXFBC1k0wCKXTJCKms8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=snSk4bdFVv0qcHd9D5dY3MjNTQ6ck6xlQmygK96VDVvcbDc7YuEyuABbQjdFq4kA72ds7q481THn2kVc0JfCYdCkJYOnZDwoyeFJZ9HEiZCv3qWaUjmrwN7z3dchOHoYTrPfFMircuwmBqvHm6oRDAfjHfARbzJjRAcFH98AJYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1wL87x4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1wL87x4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7A41F00A3A;
	Tue, 18 Aug 2026 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787070447;
	bh=GDTEWR5SUineV6jFCp7EHWpWs/pz3f4xFj9dzOegc68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h1wL87x49OTonizdBJ9jOMCMgTQCtaChrJmqY065T2NEF5nHkkn9Kgc0A+OOiz4vC
	 9pfKby6cVLZa3aMmNOBiDfiuBGW9FM8GSD0QB2DmPOSA/9LIV/YV3DGT9W5r8NroQ1
	 M6LzfFkTqzul/AXGTbMHORV73p42JDdlZNRjG7uzDfdpFRzS137zL3iHmLaDGbD919
	 zcZDzXlU2wBcy8YQckvzUxKumYV9APr6whifzmCxCSMqbixzD69xRTsW6IwKDhWCjv
	 Tip5NQ++SRXbNe9GPRLxHNweujZ7TIK7ztvQKnfDnZITifWQQRly/i481t2HrUirmA
	 8GoVsAm919s3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 06/13] net: mdio: realtek-rtl9300: suppress
 sysfs bind/unbind attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817162632.1208891-7-markus.stockhausen@gmx.de>
References: <20260817162632.1208891-1-markus.stockhausen@gmx.de>
 <20260817162632.1208891-7-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 16:27:27 +0000
Message-Id: <20260818162727.AA7A41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The proposed mitigation (`suppress_bind_attrs =3D true`) only =
prevents manual sysfs unbinding but leaves the identical Use-After-Free vul=
nerability unhandled during the probe error path.
--

--- Patch [6]: [PATCH net-next v14 06/13] net: mdio: realtek-rtl9300: suppr=
ess sysfs bind/unbind attributes ---
commit e83244316d6929d12214fe1f515d997dd87e2a27
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: suppress sysfs bind/unbind attributes

This commit attempts to mitigate a use-after-free issue by setting
suppress_bind_attrs to true. The driver relies on devm for the central
controller structure, which can be freed early while MAC drivers still
hold references to PHY devices on the bus when unbound via sysfs.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 87b91aef9b56e..3360cadfb7f32 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
> @@ -839,6 +839,7 @@ static struct platform_driver otto_emdio_driver =3D {
>  	.driver =3D {
>  		.name =3D "mdio-rtl9300",
>  		.of_match_table =3D otto_emdio_ids,
> +		.suppress_bind_attrs =3D true,

[Severity: Critical]
This isn't a bug introduced by this patch, but does this mitigation fully
address the load failure scenario mentioned in the commit message?

Looking at otto_emdio_probe(), the driver allocates priv via devm_kzalloc()
and then iterates over child nodes to register an MDIO bus for each:

device_for_each_child_node_scoped(dev, child) {
        err =3D otto_emdio_probe_one(dev, priv, child);
        if (err)
                return err;
}

If a MAC driver concurrently attaches to a PHY on the first successfully
registered bus, it will hold a reference to the PHY device, keeping the
mii_bus structure alive.

If a subsequent child node fails to probe, otto_emdio_probe() returns an
error and triggers devres cleanup. Devres unregisters the buses but leaves
the mii_bus structure allocated due to the elevated reference count. Howeve=
r,
devres unconditionally frees the priv block.

If the MAC driver later attempts an MDIO operation, such as calling
otto_emdio_read_c22(), won't it dereference the freed priv pointer?

static int otto_emdio_read_c22(struct mii_bus *bus, int phy_id, int regnum)
{
        struct otto_emdio_priv *priv =3D otto_emdio_bus_to_priv(bus);
        ...
        scoped_guard(mutex, &priv->lock)
                ret =3D priv->info->read_c22(bus, port, regnum, &value);
        ...
}

Should this probe error path also be addressed?

>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817162632.1208=
891-1-markus.stockhausen@gmx.de?part=3D6
