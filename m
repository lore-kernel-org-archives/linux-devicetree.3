Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226B435838A
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 17:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786209148; cv=none; b=MzkvibeD3CGbU/T70C2g7RUnVHxrXiOK5pacPtyX919m2OTVRL8HUcD5NFZywgTguMs2a3bsyjBoE39HhLaeztnLI6FFTsWtJoNi591xy3PGua5zuPnPLSSUX6q2rdnPgHdXqOw+XsZC+BVrrKgdHAmZp8Taze09CYD4epg8oBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786209148; c=relaxed/simple;
	bh=zML4BOWJQGi+07klmTjibL0grEK3aTVzq0oFCv1aV8k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S8nkfdFsNGlJX81xroCdQ8NKMtHYIjRjDtyjXnDJH2Fg03P3YB6UrSyKF6vw1qV/qO05EeS4fLINxTn2t/eBacKZV1uFnma8B/c2A1TylotrxKHxoe/rXRBvIkPVDCTptwPuCzlW1BjOVXS5rfpcICL37sh25SmzjheTspmBHIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSxQfgQI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSxQfgQI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288471F000E9;
	Sat,  8 Aug 2026 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786209146;
	bh=ihDaghTM0ywzt3EFMpHtXRgdQVUQIHSaxPRovbXr5Ws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSxQfgQInyDBcFjEk3uyC3GTHe0CPuFp50ICvAyPsfmI7JSk8tbq9JQAuGB+NL1mZ
	 0DubrjJITflHoBCib2RnTk+d9S9Q2ckWuxwTKLdsX8FCzwmdp7o9Ux6nTwjNlYrGF1
	 +4+0wVzGOcnjfMiuPBeKe6GtejFwgRPY9y6iNQQfm6+/zjBpRdrE7VZ3QzObg6HarI
	 RLiWvKfH8XxH780TxWTvvnZW4Lr04yYGYHR2j3mvc2IF6KCbddearT572d8K9m4QrF
	 K6TtOqCe7Oigfx+Eqexwd2r8UQ44qdG+MaXUrY3V6kAQGTX9h50No7a1lajz/EqcCW
	 /z7AkREtGGWbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 04/11] net: mdio: realtek-rtl9300: suppress
 sysfs bind/unbind attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807171058.522833-5-markus.stockhausen@gmx.de>
References: <20260807171058.522833-1-markus.stockhausen@gmx.de>
 <20260807171058.522833-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 17:12:25 +0000
Message-Id: <20260808171226.288471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete mitigation for a use-after-free vulnerability: `suppres=
s_bind_attrs =3D true` does not prevent UAF during probe failures or parent=
 device removal.
--

--- Patch [4]: [PATCH net-next v13 04/11] net: mdio: realtek-rtl9300: suppr=
ess sysfs bind/unbind attributes ---
commit 5daa031cbe196a78cb58053e9b33430ed4fb2104
Author: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: net: mdio: realtek-rtl9300: suppress sysfs bind/unbind attributes

This commit aims to mitigate a use-after-free issue by setting
suppress_bind_attrs to true, preventing sysfs unbinds on this specific driv=
er
instance. It notes that a corrupt devicetree might produce a load failure a=
nd
a cleanup too, and that the mdiobus may outlive the devm-allocated controll=
er
structure.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 73ac5fdcd2674..1873928b362dd 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
> @@ -830,6 +830,7 @@ static struct platform_driver otto_emdio_driver =3D {
>  	.driver =3D {
>  		.name =3D "mdio-rtl9300",
>  		.of_match_table =3D otto_emdio_ids,
> +		.suppress_bind_attrs =3D true,

[Severity: High]
This isn't a bug introduced by this patch, but does this mitigation fully
address the use-after-free vulnerability?

The commit message correctly notes that a corrupt devicetree can produce a
load failure. If otto_emdio_probe() successfully registers the first bus but
fails on a subsequent child node, the driver will unwind its devres
allocations:

drivers/net/mdio/mdio-realtek-rtl9300.c:otto_emdio_probe() {
    ...
	device_for_each_child_node_scoped(dev, child) {
		err =3D otto_emdio_probe_one(dev, priv, child);
		if (err)
			return err;
	}
    ...
}

If this happens, the central priv structure (allocated via devm_kzalloc) is
freed by devres. A concurrently probing MAC driver could have already acqui=
red
a reference to a PHY on the successfully registered first bus, which will k=
eep
the mii_bus alive.

When the MAC driver subsequently accesses the PHY, could it trigger a
use-after-free by attempting to access the freed priv pointer?

Setting suppress_bind_attrs to true only prevents manual sysfs unbinds on t=
his
specific child driver instance. Will this leave the probe-failure and parent
device removal use-after-free paths exposed?

>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807171058.5228=
33-1-markus.stockhausen@gmx.de?part=3D4
