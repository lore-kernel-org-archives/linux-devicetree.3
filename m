Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058CE2C2360
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143802; cv=none; b=n2BlFGLeeocFCjbX+dEARsNr+fM+f13WomZ7+GeEsBOjCsncKAq5tVwwLJppTFgfqnN+VFzsVf6cHHfO2yFDGKEKyZwxJgXMQ3yGeWhu5y3SrP5DXDUBC+xTOkBfJJeIdbTl3Td21unSkB064EhKZSgb/V2VEA0ohPPPHLj9iOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143802; c=relaxed/simple;
	bh=DVnMoZhByKB/ZgoZKTqAbItmxIP5QYxY9YqAlo3uQ6g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TuiYDqle1ifQj0szlqzjFo7c2anTYZMkKupGwna8k/R2j+jRUUYAs3NwWWileTtlIt63luuxmh9h/CruaDicMaJo2YSisNf9jczzElJ5UREWH9zYlJ5AQ4zSCiZlcEkgzuEAGGas9GfYnDrrAYl9SS+6fGlG+WldwLm5BOmi/UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPlTQMlQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPlTQMlQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE0E1F000E9;
	Wed, 19 Aug 2026 12:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787143800;
	bh=wtDew5uw+3FblJwn6YlwXBNUyjpv8Fp6wjHzrCjHEDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JPlTQMlQn2uXAZ4sFfMXKNXKrPKJ+l6P7L67xrOM28M5pkHh3UP4kG9O12uUrZXD5
	 8WEB9kR1zoexnU3EBNWqQWYdiRSfdLo3itaGRF5agOMBZRTu7BDpUk0Zan1yBCbzXu
	 CZFVBEV1SgxLvRA3Zef787K5I9jqzDDZaq0vUEa7KPRuP4HkMp+8PCYWwl5i3zwJO5
	 xUIRJe9tF9LhZK+HgNibZL/iruUy8qegxP0d3gwZSwZBL2MypVxUGs+5V0ULoRH/b5
	 m+SZ0EPdU+nUC3VLwty40JbhsA7eFujr836/zU+4CrN1mg9eJF/bopxR5OdShRjwZq
	 p1h8ZkMXwCSdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/9] iio: dac: mcp47feb02: use dev_dbg for invalid
 label
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819-mcp47feb02_refactor-v4-4-beb2aa3bfd09@microchip.com>
References: <20260819-mcp47feb02_refactor-v4-0-beb2aa3bfd09@microchip.com>
 <20260819-mcp47feb02_refactor-v4-4-beb2aa3bfd09@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 12:49:59 +0000
Message-Id: <20260819125000.6DE0E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Making the label property optional causes the `label` sysfs attr=
ibute to return the literal string `(null)` for channels without a label.
--

--- Patch [4]: [PATCH v4 4/9] iio: dac: mcp47feb02: use dev_dbg for invalid=
 label ---
commit 60f7652ad06abf540ec40667fe14b057bf9a477b
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: use dev_dbg for invalid label

This commit modifies the firmware parsing logic to tolerate missing or
invalid label properties. Instead of aborting the probe with an error, it
logs a debug message and continues initialization.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index 2ee981393aa1a..e5533fa3c31c0 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c

[ ... ]

> @@ -978,8 +979,7 @@ static int mcp47feb02_parse_fw(struct iio_dev *indio_=
dev,
> =20
>  		ret =3D fwnode_property_read_string(child, "label", &data->labels[reg]=
);
>  		if (ret)
> -			return dev_err_probe(dev, ret, "%pfw: invalid label\n",
> -					     fwnode_get_name(child));
> +			dev_dbg(dev, "%s: invalid label\n", fwnode_get_name(child));

[Severity: Medium]
When the label property is invalid or missing, data->labels[reg] will
now remain NULL.

Because the IIO core still registers the label sysfs attribute when
the read_label callback is populated, could this introduce a regression
where mcp47feb02_read_label() outputs the literal string "(null)"?

drivers/iio/dac/mcp47feb02.c:mcp47feb02_read_label() {
	struct mcp47feb02_data *data =3D iio_priv(indio_dev);

	return sysfs_emit(label, "%s\n", data->labels[ch->address]);
}

Since sysfs_emit() unconditionally formats a NULL pointer as "(null)",
userspace tools might parse "(null)" as the channel's actual label. Should
mcp47feb02_read_label() handle the NULL case and return an error code like
-ENOENT instead?

> =20
>  		chanspec.address =3D reg;
>  		chanspec.channel =3D reg;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mcp47feb02=
_refactor-v4-0-beb2aa3bfd09@microchip.com?part=3D4
