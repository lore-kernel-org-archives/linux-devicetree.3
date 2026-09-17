Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC72938F253
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631658; cv=none; b=ta0WNW77drPuHgys8WWOfWnVtfP3dR1vzqoBbDargxsGVW2iXFwrsBSYJwHykKEKctJ4D/NLFtxBYMOw0VOMumEzoe/OCxPe1XADz5HjM8w3Bb7nV70xIMQEAsHUWrlFGS96flbbFr9WomNRPUvUiuyfiyr5RQDf/NaJdYsw10o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631658; c=relaxed/simple;
	bh=uOCuFhVmBofkTWwgfcTvMkb0kujRVDC14LwjWAuu/Y8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QiIWPgV2ksIds4E1ckXlTc+1Lq4BemkrxWEROIcnmB/AoEex5SN/iekJL6WygLXFoQPnDeSlb9k1aA8/P+RcZ8Kq9jqnrE2RLLfQ4sSEQBHN6qK501xJXTJOqpJXtDOL7oFoP4po2OsxDRILydnPUgUPJwL60jrJ16q9OWVEhuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwkRdKOw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwkRdKOw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7491F000FF;
	Thu, 17 Sep 2026 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789631656;
	bh=V7C6mvvZaq6HvA04434oNYFc7udbJjolNJZZBkdlXgM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HwkRdKOway2taunOc9Hs5xvKfRBlVvxYtgcO9h56RSmEQlU0VAo82fDviIiTUKB//
	 iYoGowBiMjjWQmEpcNIIKUEEYy1Tu8OM7ikLspD68uallsc3Lgvffh+ARZ9t5cFG3+
	 C1ANC0Fbx5ajFPFJX2Y+nVHBsGAkWI6s2ZVXbOsOnwvyGGoJyXLOaz6OcWo7dRPg0Q
	 xRD+DvtfNqGGIVKafufG4NXqnsonbZzZjc2RW7ZxfEorICtLiJ0nfPwA9ob+V0emyi
	 LBsuzFxw8VjFwjD2DrKB/d61LFo5+1PY6ZZ+8YvjLpfN8H/Z0wx990/DOpciFfwBxf
	 M5Q4CLR4N0Mkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: ethernet: oa_tc6: add reset-gpios
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessandro Zini" <alessandro.zini@siemens.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916075349.21822-3-alessandro.zini@siemens.com>
References: <20260916075349.21822-1-alessandro.zini@siemens.com>
 <20260916075349.21822-3-alessandro.zini@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 07:54:15 +0000
Message-Id: <20260917075416.1C7491F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: oa_tc6: probe deferral broken by swallowed devm_gpiod_get_opt=
ional error
--

commit 68c336e363623d8a5b0d1022273415e9f9d3b4a9
Author: Alessandro Zini <alessandro.zini@siemens.com>

net: ethernet: oa_tc6: add reset-gpios support

Adds support for an optional reset GPIO in oa_tc6_init(). Asserts the hardw=
are
reset line if the GPIO is specified in the device tree.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 6fcc5f561d560..a697e2cb99cd8 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c

[ ... ]

> @@ -1503,6 +1506,24 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi,=
 struct net_device *netdev,
>  	if (!tc6->spi_data_rx_buf)
>  		return NULL;
> =20
> +	tc6->reset_gpio =3D devm_gpiod_get_optional(&spi->dev, "reset",
> +						  GPIOD_OUT_LOW);
> +	if (IS_ERR(tc6->reset_gpio)) {
> +		dev_err_probe(&spi->dev, PTR_ERR(tc6->reset_gpio),
> +			      "Failed to get reset GPIO\n");
> +		return NULL;

[Severity: High]
Does returning NULL here break probe deferral?

If devm_gpiod_get_optional() returns ERR_PTR(-EPROBE_DEFER) because the GPIO
provider is not yet ready, dev_err_probe() catches and logs it. However, th=
is
function then ignores the error code and unconditionally returns NULL.

Callers of oa_tc6_init() (like lan865x_probe()) treat a NULL return as a
permanent failure and return -ENODEV:

drivers/net/ethernet/microchip/lan865x/lan865x.c:lan865x_probe() {
    ...
	priv->tc6 =3D oa_tc6_init(spi, netdev, NULL);
	if (!priv->tc6) {
		ret =3D -ENODEV;
		goto free_netdev;
	}
    ...
}

This converts a retryable -EPROBE_DEFER into a fatal -ENODEV, causing a
permanent initialization failure if the GPIO driver loads after the SPI dri=
ver.

Should oa_tc6_init() return an ERR_PTR() instead of NULL on failure, so that
callers can propagate the exact error code?

> +	}
> +
> +	if (tc6->reset_gpio) {
> +		/* Assert hardware reset for 10 us (datasheet specifies min 5 us)
> +		 * and allow 1 ms settle time for crystal oscillator startup.
> +		 */
> +		gpiod_set_value_cansleep(tc6->reset_gpio, 1);
> +		fsleep(10);
> +		gpiod_set_value_cansleep(tc6->reset_gpio, 0);
> +		fsleep(1000);
> +	}
> +
>  	/* Check the PROTE bit status so that we can reset the device */
>  	ret =3D oa_tc6_check_ctrl_protection(tc6);
>  	if (ret) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916075349.2182=
2-1-alessandro.zini@siemens.com?part=3D2
