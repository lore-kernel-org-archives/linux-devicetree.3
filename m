Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81533FC5C4
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339200; cv=none; b=RmBFk3YXwhcsjv/XyHrcgU4WRBiy4ooDxlm8oU1F6An2pApDVVnqmdIzsR3BZK8I6BnicfSZh0Qd8KsF4pFyrc4oJVDrFwxkaK6uD+I2WjdyxFlIpmZ0DXiUD4YHd70oTGPoYvWlRjBbcFWqTQZTy8SPEx18HYY4g9fcSelLSCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339200; c=relaxed/simple;
	bh=9XM89p3PPS3p2mFjd53wnyQOiW/X1oyLEFsCw2qC+p0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UQLtOd7JHg8BOlgiEfGrO4uW/e0VG6wUwcyrT1IJpwLoSfBEos+baLy+DPcizUljq8cDqH/bq8aE3nBl8mbbbOxt7VJoZtrbgvzTI4UZJghK7lC7Xkd6/IW/FtK/gr5XLj4UTbknmkU+xD2WXxv7C5erUOU0LhOAaN61Gy6A73A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDM2kOqn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDM2kOqn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2119B1F000E9;
	Mon,  6 Jul 2026 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783339199;
	bh=PAKR3gv1rnUDCiInQJ4E+iEHfOvht+4pDMLgvdEwiJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VDM2kOqnhyYbF/8fX2hGjQ2+vKVdtawA3tbsRCxM3UBJq4sJRUQYctuaqUCIihBkh
	 uJJLpON6EobOMnw6hAwAyrcMDSMHpRAvorBkmo72V+BRL2oOCTIWuUpxXdkdSlLawB
	 tN22IL6yDfCTDTl/Ohg+VEyAOaRjlliWdYwOgutRV0OZX5XfI9NLq5rmEu0YqkqjzL
	 pgUkpLthXA80xUaDSWmJWTihY/uoJqtZkZuV9hRFm2iBukvRfQB1KOO4uXgAweTBqf
	 botv73p0K7iGElsMS4h5WlslOeG1cE3BfZXjguTlt6wCbFY2urAR44/KHF5EmOlZAi
	 RFWUQS0PMuCPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] of/address: Fix NULL bus dereference in
 of_pci_range_parser_one()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlo Caione" <ccaione@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706114731.57353-1-ccaione@baylibre.com>
References: <20260706114731.57353-1-ccaione@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 11:59:58 +0000
Message-Id: <20260706115959.2119B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing upper bound validation for `#size-cells` (`ns`) allows `np=
` to overflow to a negative value, bypassing range bounds checks and causin=
g an infinite out-of-bounds read loop.
--

commit 36a316bab0beafdbab73667fca4e9ad8ca56a5a3
Author: Carlo Caione <ccaione@baylibre.com>

of/address: Fix NULL bus dereference in of_pci_range_parser_one()

This commit rejects nodes with ranges/dma-ranges but no local
#address-cells in parser_init() to fix a NULL bus dereference. It also
keeps the DMA limit walk guarded by a non-empty dma-ranges property.

> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index cf4aab11e9b1f..fd2468b89579f 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -761,12 +762,20 @@ static int parser_init(struct of_pci_range_parser *=
parser,

[ ... ]

> -	parser->range =3D of_get_property(node, name, &rlen);
> -	if (parser->range =3D=3D NULL)
> +	range =3D of_get_property(node, name, &rlen);
> +	if (!range)
>  		return -ENOENT;
> =20
> -	parser->end =3D parser->range + rlen / sizeof(__be32);
> +	if (!parser->bus ||
> +	    !OF_CHECK_COUNTS(parser->na, parser->ns) ||

[Severity: High]
This is a pre-existing issue, but does OF_CHECK_COUNTS() need to validate an
upper bound for 'ns' (#size-cells)?

Currently, OF_CHECK_COUNTS() in drivers/of/of_private.h only validates that
'ns' is greater than 0, but unlike 'na', it does not enforce an upper limit:

#define OF_CHECK_COUNTS(na, ns) (OF_CHECK_ADDR_COUNT(na) && (ns) > 0)

If a malformed device tree provides a very large '#size-cells' value
(e.g., 0x7FFFFFFF), could this cause 'np' to overflow to a negative value in
of_pci_range_parser_one()?

drivers/of/address.c:of_pci_range_parser_one() {
    ...
    int np =3D parser->pna + na + ns;
    ...
    if (!parser->range || parser->range + np > parser->end)
        return NULL;
    ...
    size =3D of_read_number(parser->range + parser->pna + na, ns);

A negative 'np' would bypass the bounds check since subtracting from the po=
inter
evaluates to a smaller address. This would result in an out-of-bounds read
across memory when of_read_number() is called with the massive 'ns' value.

> +	    !OF_CHECK_ADDR_COUNT(parser->pna))
> +		return -EINVAL;
> +
> +	parser->range =3D range;
> +	parser->end =3D range + rlen / sizeof(__be32);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706114731.5735=
3-1-ccaione@baylibre.com?part=3D1
