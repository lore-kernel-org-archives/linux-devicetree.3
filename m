Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148DA1EB5CE
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791614717; cv=none; b=j94IEa0CXABwgZpzKuQHQ/yENcUVI13yUQOPo4iaFTI5B+bTN0P9JXTYzUTDIjd+hkHp54f3LcRj3G16ozGtGK5gvUZkYFyYtt5lJ+DhDP+N8GULintNBmerufoSvfBCwl7j8P9rNm/NSqCKlf7dCmll9FeOMH3hk2WsXRX+I7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791614717; c=relaxed/simple;
	bh=hLHvqAEwZvXyYbqWEfj5GNakLrGz+0wEfpe5f/+oRp0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WAiGS02QJPwk9Nmxwf3tlbeozvVD6zuiKjoLYPJD1GiGYuKn7ATStXFUQQ25gFOpMA7YEzvry/3zxxgrpF+LB6QBTIvKJey+zpMOT9rhuPGrUPyNpTV35ZzLGTqHepfL0ZZrwJtdk99Kjq3dd0sAf6G7PPkwhM2yv5mBaRa3Cmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaDiHf6p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaDiHf6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA421F000FF;
	Sat, 10 Oct 2026 06:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791614715;
	bh=E8ZV4zgUHfSxJsBEwDlhokMMIZ43VZ9yF/vt2EauIY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SaDiHf6ptaZa89Bfj4mI5K/tICQvuGU8khbNJ9fUHuiyP6HQY+BuaxibbNzaly0ZR
	 9rIwxWnPouHyDFq/va0ohMfpeUu4bF+toG+RVVS6ohkSNKKuRL+Tkbd0cM0DClQ7zm
	 hHFUix3BU+ulBlwrAbwPT4m1xzRzOyT8Gkr4QZKP564BYrO48yTDLCqJ8DUP36Gdn0
	 +xcPFqHu85PMYxo22duO7WafBddky8+0kKlRCOAZVYYwcBWYGd5PBsRZYownQQR058
	 7eVsa38JAq0mcs873KVFdJSR17hbzCOQWs9O6QtS42DD053X6L4W7N13VEVc84Ymff
	 jZao0ewV1A8DA==
Message-ID: <sashiko-outbox-166284@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] i2c: rtl9300: add realtek,rtl9607c-i2c
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Zavertkin" <misha.zavertkin@mail.ru>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <e7186b18caf58f2fefa61093921805d5dc045e07.1791611999.git.misha.zavertkin@mail.ru>
References: <cover.1791611999.git.misha.zavertkin@mail.ru>
 <e7186b18caf58f2fefa61093921805d5dc045e07.1791611999.git.misha.zavertkin@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 06:45:14 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] i2c: rtl9300: device_is_compatible check breaks DT fallback patt=
erns
--

commit 96f11e2144ef16398bba64fc512f5b346ab89571
Author: Michael Zavertkin <misha.zavertkin@mail.ru>

i2c: rtl9300: add realtek,rtl9607c-i2c compatible

This commit adds support for the realtek,rtl9607c-i2c compatible string to=
=20
distinguish it from other RTL9607 variants. It avoids using the IO_MODE_EN=
=20
register on the new compatible by restricting the select_scl call and emits=
=20
a deprecation warning for the old compatible string.

> diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rt=
l9300.c
> index 3a8225b0666c0..22aa3b38458c0 100644
> --- a/drivers/i2c/busses/i2c-rtl9300.c
> +++ b/drivers/i2c/busses/i2c-rtl9300.c
> @@ -200,10 +200,12 @@ static int rtl9607_i2c_config_chan(struct rtl9300_i=
2c *i2c, struct rtl9300_i2c_c
>  	if (ret)
>  		return ret;
> =20
> -	drv_data =3D device_get_match_data(i2c->dev);
> -	ret =3D drv_data->select_scl(i2c, i2c->scl_num);
> -	if (ret)
> -		return ret;
> +	if (device_is_compatible(i2c->dev, "realtek,rtl9607-i2c")) {
> +		drv_data =3D device_get_match_data(i2c->dev);
> +		ret =3D drv_data->select_scl(i2c, i2c->scl_num);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
Will this check break device tree fallback patterns?

If a new device tree provides a fallback compatible list like=20
compatible =3D "realtek,rtl9607c-i2c", "realtek,rtl9607-i2c";=20
device_is_compatible() will return true because the legacy string is still=
=20
present in the node.

If this happens, the driver will incorrectly execute the legacy select_scl=
=20
hardware configuration (modifying the IO_MODE_EN register) on RTL9607C=20
hardware, instead of delegating it to the pinctrl driver as intended.

Would it be safer to differentiate hardware capabilities based on the match=
ed=20
driver data (for instance, pointing the new compatible to a struct without=
=20
a select_scl function) instead of dynamically searching the OF node for=20
deprecated strings?

>  	i2c->sda_num =3D chan->sda_num;
>  	return 0;
> @@ -494,6 +496,10 @@ static int rtl9300_i2c_probe(struct platform_device =
*pdev)
>  		scl_num =3D 0;
>  	i2c->scl_num =3D (u8)scl_num;
> =20
> +	if (device_is_compatible(i2c->dev, "realtek,rtl9607-i2c"))
> +		dev_warn(dev, "Compatible 'realtek,rtl9607-i2c' is deprecated. "
> +			      "Use 'realtek,rtl9607c-i2c' instead\n");
> +

[Severity: Medium]
Does this also trigger an incorrect deprecation warning when fallback=20
compatibles are used?

Because device_is_compatible() matches any string in the list, providing a=
=20
valid fallback to support older kernels will falsely trigger this warning=20
even if "realtek,rtl9607c-i2c" is properly specified as the primary compati=
ble=20
string.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791611999.gi=
t.misha.zavertkin@mail.ru?part=3D1
