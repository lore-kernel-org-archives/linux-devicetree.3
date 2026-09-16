Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3F9517BDD
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568944; cv=none; b=CmUz1acnm1omhQjDlSzUbXgMgPeYo5CxGbJVnR2Wvy430uqGjYJPVaP0ZWxUrbBJ4LQX5xBmF7JP1NDnHZYjd8IAJbjDBLETylQGX7FeboLpvGA74/Sg+JiUIEX9x5D3wbKE3CmPxSwp7ItLgMY+6v3zGg2afEVoLclkKVtO4tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568944; c=relaxed/simple;
	bh=KUh4eOA+E2tXGtWJPBGx224s1mvEBNZ1uEPAhFnz7qY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XLRkvkktn2sPwv48XZxwWbr0JSbBBEUO3iwd55f6wwvf3MRGnJjuDm+I3Q0vqCORCjxjPHF3/kSfYebtl8r/1pfFECyp4crRPbOoA9SGszr40L69FwPbPgwmS9Df6tJ4lbhom/EiSnx3TS/+JHSJn7uzRsruNNeXa0XhoQW8Hvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqADc5UJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqADc5UJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEC91F00893;
	Wed, 16 Sep 2026 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789568942;
	bh=juIrp+9n6MKtxSGPy5nWFQk5zkwjLYe4xw78a6TAOKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YqADc5UJj5uuigUjGTBq9BvIAuFllAggtccknfCMN83UmtJejjzFFd4JRj3KiKZrB
	 41ox9XUG4XNeGgPyn5yjUH2ferYUlHuzgg07CinLj3IY1/ZVZbVWHg9abRA11cnCVC
	 RU/KtZESw6fznMoS2x1vIVZU/FMBFVMWYo2A/aLuyh5t0rsRUYU39E2OAtUA3IRT0M
	 3QwkagsngEy2MxXJh1/z59oZ8MXu/G9buuKEGP8Hlwq1AgTGf9Dft8enKGoYKhiriu
	 86/ghZ88nDvuWRg4kW2ZjWF72CNf0vGt8bRKoxg+w+g2uO4S372MEjiZz/uXZ4Ni+4
	 2g/Xj64OCrtAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/11] iio: dac: mcp47feb02: Avoid unjustified probe
 error on missing label
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916-mcp47feb02_refactor-v6-6-285464651f89@microchip.com>
References: <20260916-mcp47feb02_refactor-v6-0-285464651f89@microchip.com>
 <20260916-mcp47feb02_refactor-v6-6-285464651f89@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 14:29:01 +0000
Message-Id: <20260916142902.4CEC91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: dac: spurious warning logged for missing optional label
--

commit e24a38fff253c54913e6b4136af8560e0bb6d2da
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: Avoid unjustified probe error on missing label

This commit resolves an unjustified probe error when the optional 'label'
property is missing by substituting dev_err_probe() with dev_warn_probe().
It also corrects %pfw usage and safely handles null label reads.

Link: https://lore.kernel.org/all/20260804134616.1D8A21F00A3E@smtp.kernel.o=
rg/

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index a93e05cda5f36..67bf8d9d98350 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c
[ ... ]
> @@ -977,8 +980,7 @@ static int mcp47feb02_parse_fw(struct iio_dev *indio_=
dev,
> =20
>  		ret =3D fwnode_property_read_string(child, "label", &data->labels[reg]=
);
>  		if (ret)
> -			return dev_err_probe(dev, ret, "%pfw: invalid label\n",
> -					     fwnode_get_name(child));
> +			dev_warn_probe(dev, ret, "%pfw: invalid label\n", child);

[Severity: Medium]
Since the commit message indicates the 'label' property is optional, does
this code unintentionally cause log spam for valid configurations?

When the label is not present in the devicetree,
fwnode_property_read_string() will return an error. Because this code
checks if (ret) and calls dev_warn_probe() unconditionally, a warning will
be logged on every boot even when the missing label is a valid setup.

Looking at the rest of the patch series, it does not appear that this
warning behavior is updated in subsequent patches like mcp47feb02-core.c.

Is there a way to verify the exact error code or avoid the warning entirely
when the property is simply absent?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-mcp47feb02=
_refactor-v6-0-285464651f89@microchip.com?part=3D6
