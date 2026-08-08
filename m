Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D17D2E737E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189263; cv=none; b=CWuxIAfOfbuTyRwAW6oiqsvI2vFt2Ggpi0BiKqZQ0cngoHSdT+TRdajYdYRVfENMHOBEQSG27bL5yd2X4bxagfpTswVHYaVf2SKxAoKjY1hxhNP2aKP5m4ZEyYi/dAhHgvO1M46kqmw7vUWkYc7VZpk9y4oSZRBBFsvrtqUAiyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189263; c=relaxed/simple;
	bh=0G+QGixXi2wkDojQPOBV/fWkVTWMF0sxDfrDoIzNhmc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k8BpQCOSV3E9OTsv+dpwiil6YES53oWBlbmToUSNVD8iF8E1901XYHpmwHUbw72n96VJX1rjHeKpTWx/ET22Qjt+gQGkdqevkD7CvqnizWiF39a9TOVJx145IUAOQ5+6Y1rF73CR8oE4andMNEw1ZfYG/B93I3SA68r32s34BII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjVee15k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjVee15k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E231F000E9;
	Sat,  8 Aug 2026 11:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786189261;
	bh=KDEaeE2cWt4SGDmp39qqmOCp3ZPEEnpVANrOA2dw44w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fjVee15kCFU1XZw20ZmJdedQz4QHn+Sd6La9dEIF3p7VVOmCe7uWHpz1SyZ0vARTt
	 UiUtQQ1PvIjV3lnVHtT5BQiAkCQ9k3GUhyy3ujpab40oCRGsnL5KoM+XSFoYB7EwMw
	 dVOjQdqSfQfWtz/mLVkHY970dypD/xnDrfle+YB3jQsZu1yj5jBWLIcTld3foU+9rn
	 eqKA8BoycU92Rd3WyxBbRQttNMj1N9MSba+wqieQ7CqrfBUeEAPyf4ZbZgn4SnHeHf
	 5lX3GvCZaWk1erK3l2ZXnYo43Wqqhl0nGjk3KAx/sAz+0TJwwSYNn3nB3zJfKbseJ7
	 jozbaJNJu9D1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] spmi: apple: lock around FIFOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260808-t603x-spmi-v5-5-553c5ac2f137@chaosmail.tech>
References: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
 <20260808-t603x-spmi-v5-5-553c5ac2f137@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:41:00 +0000
Message-Id: <20260808114101.59E231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver uses register I/O accessors (`writel()` and `readl()`) =
with `memcpy()` to stream payload bytes to/from the SPMI FIFOs instead of u=
sing stream accessors (`writesl()` and `readsl()`), which causes endianness=
 portability bugs on big-endian architectures.
--

--- Patch [5]: [PATCH v5 5/6] spmi: apple: lock around FIFOs ---
commit 79f5d9aebdc66fbf9df1c1b4f401429d674f9b42
Author: Alba Mendez <me@alba.sh>

spmi: apple: lock around FIFOs

This commit adds a mutex to protect FIFO register interactions in the Apple
SPMI controller driver, preventing concurrent access issues.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 9843dc871d6c7..fabccd25aa0da 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -78,6 +80,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u=
8 opc, u8 sid, u16 param,
>  	size_t i =3D 0, j;
>  	int ret;
> =20
> +	guard(mutex)(&spmi->fifo_lock);
> +

[Severity: High]
This is a pre-existing issue, but does using writel() and readl() to transf=
er
byte buffers to the FIFO cause endianness portability bugs on big-endian
architectures?

Further down in spmi_raw_cmd(), the driver streams payload bytes to the
hardware FIFO using writel() with memcpy():

	while (i < len_wr) {
		j =3D min_t(size_t, sizeof(spmi_cmd), len_wr - i);
		spmi_cmd =3D 0;
		memcpy(&spmi_cmd, buf_wr + i, j);
		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
		i +=3D j;
	}

And similarly for reads:

		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
		j =3D min_t(size_t, sizeof(spmi_cmd), len_rd - i);
		memcpy(buf_rd + i, &rsp, j);

Using writel() and readl() instead of stream accessors like writesl() and
readsl() performs an implicit CPU-to-LE conversion.

Could this cause the data to be unexpectedly byte-swapped on big-endian
systems, corrupting the payload sent to the device on the bus?

>  	if (spmi->prev_fail) {
>  		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
>  		spmi->prev_fail =3D false;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808-t603x-spmi=
-v5-0-553c5ac2f137@chaosmail.tech?part=3D5
