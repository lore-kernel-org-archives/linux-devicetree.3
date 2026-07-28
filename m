Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AFA472760
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266208; cv=none; b=AnrMdiBvWpxxCO+AWZ61Gn/DXVLr7mi1/u7+Ntu/ZgQMhDCS09PWpeWsD2rpHZmG0G0GV7+MLoiLv3W2f+teqLrDQFxwlQh8ZWko5w6AwHWlXETQK+fWOaYxok8XxKhYraJl38T0xsaap6bgj1bdaYbjU6xbRfhkz8bGhYH66i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266208; c=relaxed/simple;
	bh=J1miTNlCT2/MVZZKMzE1YoZoXQWAcCrgoUWeDZYybYo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sBjZYZtbFOYYSJ6gV50cvZFuY2oMX5WoxGH78ylWtEYae5GqrScY6MazmGHlske1GzQLuup96duAcNOy7vNGonVZnPZzgPGqgEzPV2hhnH7kUoW3R/7XfAXN1rAxO//zPaDNRw7wM3ReNFy+aVSBG9ApqApAi+znsiqITxiu0FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZX5pISy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZX5pISy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8363F1F000E9;
	Tue, 28 Jul 2026 19:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785266204;
	bh=ZmcfQLukZqOqEfM3pXxNPoOKbQkur967e9idRrNwZF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZX5pISyDDVgrY8m7Nw71b0mqV3FkUbi7GdarqI5Zjt1nN77mZKCJfz7HUKn5zSpK
	 wNFRN2E5Lb7E+Tr/zpm0Z8jGC/zSAG/tqNi8fGKMi7cZhPEZb+M5c6Obl/Fab39vT4
	 BVLMWpIcISxbfF51CQxeXjGsVlcuPH1gFbfyNKVp9QYg3f+VQWs31JEdWIR/i0YOJd
	 Q1E5DchFSOz3H32jCqwsX87y207uv4Ikd1iaFQabXME0RzOtN6djsHny2kD9/49/8S
	 HEsKnfhoRadcsmWmsHAuXmgu/Xw2r2i81T0jruj390AWx2Tu0X4CeO63H+mx6U7vxl
	 Gk/HKHnSAdriw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 8/9] net: mdio: realtek-rtl9300: Add support
 for RTL838x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727191559.19617-9-markus.stockhausen@gmx.de>
References: <20260727191559.19617-1-markus.stockhausen@gmx.de>
 <20260727191559.19617-9-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:16:44 +0000
Message-Id: <20260728191644.8363F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The allocated `priv` memory and its initialized mutex are leaked=
 when `otto_emdio_init_polling()` fails during probe.
--

--- Patch [8]: [PATCH net-next v8 8/9] net: mdio: realtek-rtl9300: Add supp=
ort for RTL838x ---
commit 19d0237c1026399704945da64c7e3b5e4a2158fe
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Add support for RTL838x

The MDIO driver has been prepared for multiple device support. Add all
required bits for the RTL838x (aka maple) series. This is straightforward
but some things are worth mentioning.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index ef4fa8e8274f4..9f76698a84c55 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
[ ... ]
> @@ -880,6 +965,28 @@ static int otto_emdio_probe(struct platform_device *=
pdev)
>  	return err;
>  }

[Severity: Medium]
Does this code leak the allocated priv memory and its initialized mutex if
otto_emdio_init_polling() fails?

Looking at otto_emdio_probe():

	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
	if (!priv)
		return -ENOMEM;

	kref_init(&priv->kref);
	mutex_init(&priv->lock);
	...
	err =3D otto_emdio_init_polling(priv);
	if (err)
		return err;

Should this goto err_out instead of returning directly to ensure kref_put()=
 is
called and the resources are cleaned up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727191559.1961=
7-1-markus.stockhausen@gmx.de?part=3D8
