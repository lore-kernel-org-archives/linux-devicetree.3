Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D23C8197
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273338; cv=none; b=H9U6gf9wZn/QHaZrSN+LtWTdzQY9z2RiZQ8QUqhrG4b9rTV3DzbG5g6Q70c/68F/i2wSgbTifNSePT85xgMs2g/oSAJ0r0W/P9qb+A3gUQnc3C3orBWmO0RSvFMgwqusg9x8q+cSWicXLe5zAGiwjwZW4GX1F/LVEHKTclzet2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273338; c=relaxed/simple;
	bh=lrcaDcfQLC1QXhq4uob+kymRCzqAziVM2Esjyyayqb4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=URmqY99TXi1KOpckaKFABi8TZymBIMlA2tPu1wcjruj9ah7IDuODnTNcjFCuY8M/YG1+kybDJIBinw6RqQnFo4ekVfCorItaK6MqPtLyqvhSMUPJMnrhP+mdJgE/CSETzIVkYHjbnRoqcMupmS7rc35vGFIbc7gURib7JjiafHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ProPB97F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ProPB97F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E3D1F00A3A;
	Tue,  1 Sep 2026 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788273337;
	bh=h7bUukGTAjjpOAXjG2eph238xDoVjDcb5AKVMCFlXz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ProPB97FetbUbSh1mi3NZF2prY/1EmjwjCrlE/miob693nc9Nh26OuoaS9r+L6zIA
	 XhHw0qZrxLhHke+OSN2IjX1ipEUY8fa/ZRxODDLsnfZCaJZP1KFACCkGgEqj+n5BvX
	 Dk35fDnGIrQUzVI2/4s3YuNe5GNTLRoVBxo5H/iQ5mGv//HCiy4d+N1gTkL9d6J152
	 wqhgRexsx63npI+J6F4h/6iqmwM5LPfmouDb+luSlcNK8Mcvl8eF93ChQ8vB0P/mNk
	 XjgMFqsOliLOqRBlXXv5po0cwtuG5L10Cd65oQ6HfN2r3z5dQPYxahECbhGuh353Z8
	 qS8gjbPQ/2NGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 06/13] net: mdio: realtek-rtl9300: suppress
 sysfs bind/unbind attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831143439.2404484-7-markus.stockhausen@gmx.de>
References: <20260831143439.2404484-1-markus.stockhausen@gmx.de>
 <20260831143439.2404484-7-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 14:35:36 +0000
Message-Id: <20260901143537.00E3D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete Fix / Use-After-Free due to devm lifetime mismatch
--

commit d4a21a88756b9fbf7a5e82fcf73b2397de6c2abb
Author: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: net: mdio: realtek-rtl9300: suppress sysfs bind/unbind attributes

This commit mitigates a use-after-free issue in the Realtek MDIO driver by
setting suppress_bind_attrs to prevent unbinding via sysfs, which avoids
triggering the devm cleanup while bus references are still held.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 69565a87f99db..7de8adec243ba 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
> @@ -844,6 +844,7 @@ static struct platform_driver otto_emdio_driver =3D {
>  	.driver =3D {
>  		.name =3D "mdio-rtl9300",
>  		.of_match_table =3D otto_emdio_ids,
> +		.suppress_bind_attrs =3D true,

[Severity: High]
This is a pre-existing issue, but this mitigation appears incomplete. It
prevents unbinding via sysfs, but does it cover the probe failure vector?

In otto_emdio_probe(), the priv structure is allocated via devm_kzalloc().=
=20
Then, it iterates over child nodes:

    device_for_each_child_node_scoped(dev, child) {
        err =3D otto_emdio_probe_one(dev, priv, child);
        if (err)
            return err;
    }

If probing fails on a subsequent child node, the parent probe returns an er=
ror.
This triggers devres cleanup which frees the priv structure.

However, if an earlier bus was successfully registered, a MAC driver might =
have
already attached to a PHY on that bus, holding a reference to the mii_bus.=
=20

When that MAC driver subsequently performs a read, it calls=20
otto_emdio_read_c22():

    scoped_guard(mutex, &priv->lock)
        ret =3D priv->info->read_c22(bus, port, regnum, &value);

Because priv was already freed by devres, does this result in a=20
use-after-free?=20

Could a malformed device tree triggering a failure on a secondary MDIO bus=
=20
still cause memory corruption due to this lifetime mismatch, despite the
sysfs unbind mitigation?

>  	},
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831143439.2404=
484-1-markus.stockhausen@gmx.de?part=3D6
