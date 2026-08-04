Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D9748423D
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864010; cv=none; b=QgdlmKhU8iRraZ40DyAooFS5HXPpvHOSmcvJDpjF7IxDXlq/idT93iayQPLVwqjklz2kIkZgBCaBkMApxG97bSaPAKNU0pVc8taylhAUK9KTtrYcgLHkxZ+3l9yzECdMO98k3MV7qOxkjij7iCqww4A+sMsUexo1+bfFGORjLoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864010; c=relaxed/simple;
	bh=ChuO1LQyP6Hqw42Vb7Br/6MZFu9dL9yYWkZm/qIDJdo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n1mungd0/8J9jBPASSmQcWEDVvOXjy4/pm5Hwk4v/B7P/xDFhdH4oQGxo4XGM7N6ISUZKPxdQHws6FoRqwFFVwXZYwZxlByel7ijaiXx6wl3pNPZ/Psv4HvoryqYjunrREVb7fOVJxY2Pp/qaTnAGjSmupsBta053Bmh3a3dqg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZCBu0Sf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZCBu0Sf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95151F00A3D;
	Tue,  4 Aug 2026 17:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785864000;
	bh=P4BEtav6qtVHD/4Pcyj298li0u6hli5vclNgO1DC8Zo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HZCBu0Sft6TEA5hDsMfKTl8+ITyf0yY3RKt+BQfvcJhIa3M8AmMUm5zVRgTLsr5pv
	 kF5Q0OIaaWG5aOFcqTqUmfZFvDGyBhKWZ8iTBwLVQY6uocq14TwLVyE/hZQ0fTZYeo
	 1brueMioMT8PR+3UqQZ2r1mEP8drXHOhdSfEi09Up0gxZ2rKDEoEaKeEBxWLzkRI6o
	 ME06yoP/ZE/3/1qpxKntZ7rNRF0b4NHmOynfQReYoddz96atXxYNc9qr1ObtUgJ4F2
	 yL+hx1KiVF/2EVxYX0VBPxHqPe1VB1y5N6l5DVNtZx53ZR23ziV+PnJsopOjt0Lv2g
	 2hQtKN2S1emQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 04/11] net: mdio: realtek-rtl9300: suppress
 sysfs bind/unbind attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803171853.507506-5-markus.stockhausen@gmx.de>
References: <20260803171853.507506-1-markus.stockhausen@gmx.de>
 <20260803171853.507506-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 17:19:59 +0000
Message-Id: <20260804171959.A95151F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch attemp=
ts to fix a devm-related use-after-free by suppressing sysfs unbind, while =
leaving the exact same use-after-free vulnerability open during probe failu=
re and parent device removal. The underlying structural flaw (mismatched li=
fetimes between devm-managed `priv` and refcounted `mii_bus`) is not addres=
sed.
--

--- Patch [4]: [PATCH net-next v12 04/11] net: mdio: realtek-rtl9300: suppr=
ess sysfs bind/unbind attributes ---
commit d996574f6db0effaeff6b6c77116223c1f0e43d9
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: suppress sysfs bind/unbind attributes

This patch attempts to fix a use-after-free issue when the Realtek MDIO
driver is unbound via sysfs. It suppresses sysfs bind/unbind attributes to
prevent manual unbinding, mitigating the lifetime mismatch between
devm-managed resources and reference-counted MDIO buses.

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
This isn't a bug introduced by this patch, but does this fully mitigate the
use-after-free vulnerability?

While this prevents manual unbinding via sysfs, the same mismatched resource
lifetime issue appears to remain open during probe failures and parent devi=
ce
removal.

If otto_emdio_probe() fails on a later child node iteration, devres cleanup
is triggered. This unregisters the previously registered MDIO bus and frees
the central priv structure:

drivers/net/mdio/mdio-realtek-rtl9300.c:otto_emdio_probe() {
    ...
    for_each_available_child_of_node(np, child) {
        err =3D otto_emdio_probe_one(dev, priv, child);
        if (err)
            return err;
    ...
}

If a MAC driver already holds a reference to a PHY device on the registered
bus, it keeps the mii_bus structure alive. If the MAC driver subsequently
accesses the PHY during its teardown, the bus read operation will dereferen=
ce
the freed priv pointer to acquire the lock:

drivers/net/mdio/mdio-realtek-rtl9300.c:otto_emdio_read_c22() {
    ...
    scoped_guard(mutex, &priv->lock)
        ret =3D priv->info->read_c22(bus, port, regnum, &value);
    ...
}

Since the underlying structural flaw isn't addressed by suppressing sysfs
unbinding, would it be safer to fix the mismatched lifetimes directly?

>  	},
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803171853.5075=
06-1-markus.stockhausen@gmx.de?part=3D4
