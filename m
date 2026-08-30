Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9422184540
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 22:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788127833; cv=none; b=CdDyzvftfJzJ8/2J3hT1iM3n8wI9I8WJH6N9hRp8G+WOJHj0gaPxaoG6wYw9f496NJeamgFwA0x2YO75ebi7N8p9cySRaHO+43sH4r6R4QkqJDo3kcAdGvl22O/9psBJnjA3x8yXDTc8Hpysbi5NgMhT84M5jCKkGlbSYU9NGOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788127833; c=relaxed/simple;
	bh=g0cfNJdOFDd9VnDszWXMvizBIdpblSfeOCbNWzPu+2I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Od9ExK9PnvxCKSKa9SpslCjurFELXVc7hUp8RYQK+eHBrP2gB0QnqDX6uq+LQgrlNGN95SlNfRef5PNlYdnkS7op2CQV/YN9STAEyOxVRWncR2ljj/+NOWB4VkBlR0B80EkO5HYRyXlaateUc2XB6ceeNNdZs2qixbW/Gb1OuHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfabWBKw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfabWBKw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3831F000E9;
	Sun, 30 Aug 2026 22:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788127831;
	bh=shQaCtnXY/shUCjxULCdERvs/b+PKReqX6fXRFjFQJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SfabWBKwXg9L7bEcZf1hTsWXICZP+d2q5iGfUhPml8gUfmqwUURE4VVSejk7BOZDD
	 CoBqKlEhRxCZ+4YRLS2aDnnCGi1eebANl/iDdX58Tg1GKQOlrRGN5MSCSIUDNIO4Yq
	 WsmqcBdq6aUxj9pWULAjky0+0WRrbnX8SWhOwf9TX0RTLvkVyzfPhK44j7Y96sKFDo
	 ryVw+i66+4UZJWlktWt+Hhver+TKHCvhqiWz33SwRhxE9+W5DM04SHu5c+TKXksQDn
	 cz367VvR6Bpp4HnN6jrfUd7Jjcy0ohupHUpd2a5bHAfJZx9p4lvS5h7qc8hDhGyaIQ
	 9IJIuo49rSzqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] crypto: atmel-ecc - add support for atecc608a
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thorsten Blum" <blum@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260830220151.21469-4-blum@kernel.org>
References: <20260830220151.21469-3-blum@kernel.org>
 <20260830220151.21469-4-blum@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:10:30 +0000
Message-Id: <20260830221031.3F3831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free due to early return in `atmel_ecc_remove()` missing=
 list deletion.
--

commit da00b1f7ab58791bf49d80087ba781e30c9433d0
Author: Thorsten Blum <blum@kernel.org>

crypto: atmel-ecc - add support for atecc608a
   =20
The driver already supports the ATECC508A and ATECC608B and uses only
commands shared by these devices.

Microchip documents the ATECC608B as a backwards-compatible, functional
drop-in replacement for the ATECC608A, with the same device structure
and command interface [1]. Therefore, add support for the ATECC608A.

ATECC608A hardware was not available for testing.

Link: https://ww1.microchip.com/downloads/en/Appnotes/Migrating-from-the-AT=
ECC608A-to-the-ATECC608B-DS40002237A.pdf [1]

> diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> index 075f38a67935c..0904bb47fd0a9 100644
> --- a/drivers/crypto/atmel-ecc.c
> +++ b/drivers/crypto/atmel-ecc.c
> @@ -348,6 +348,7 @@ static void atmel_ecc_remove(struct i2c_client *clien=
t)

[Severity: High]
This is a pre-existing issue, but can the early return in atmel_ecc_remove()
cause a use-after-free?

If a user unbinds the ATECC device via sysfs while a crypto operation is in
flight (tfm_count > 0):

drivers/crypto/atmel-ecc.c:atmel_ecc_remove() {
	...
	if (atomic_read(&i2c_priv->tfm_count)) {
		dev_emerg(&client->dev, "Device is busy, expect memory corruption.\n");
		return;
	}
	...
	list_del(&i2c_priv->i2c_client_list_node);
	...
}

The early return bypasses list_del(&i2c_priv->i2c_client_list_node). The
driver core then frees the devm_kmalloc-allocated i2c_priv, leaving a freed
node on the global driver_data.i2c_client_list.

The next time any crypto operation is requested, atmel_ecc_i2c_client_alloc=
()
will iterate over the list and access the freed i2c_priv node, causing a
use-after-free.

Does it make sense to always remove the node from the list before returning?

> =20
>  static const struct of_device_id atmel_ecc_dt_ids[] =3D {
>  	{ .compatible =3D "atmel,atecc508a", },
> +	{ .compatible =3D "atmel,atecc608a", },
>  	{ .compatible =3D "atmel,atecc608b", },
>  	{ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830220151.2146=
9-3-blum@kernel.org?part=3D2
