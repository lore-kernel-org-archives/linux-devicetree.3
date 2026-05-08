Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDF43ED103
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260492; cv=none; b=QmQQZjiXDLp+8pDMHmdXjO1yTDeEFavKrvEfBCD6GzjZLHmN2H24qJX34WdpP/pc/xAFc7b0MUvzYeYmAVzl/I5SwR5Xbdv0/2cQOGnS6F/Vb2M+QC5SnlbFsfqGzDW/YhxiPAtLXUYTBCamjzn1g2sGsYaHyVPftn/rOixkmxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260492; c=relaxed/simple;
	bh=oclkuQHVTCEyVa3kbvV8ehfJg7gQwDXcAh8lMm1Ug7s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ia+pm/QQtyfX3uVEaaj/0mPiDz8lmFyiuOhufDi02Okkl/bEOQq/XeQvdQ8NiIAO7Gq2LPHt6lCfEZEllz93b6jh1aOwoubZAuzkkfzzrOx8hqDlX2PfT0G0RtYLKROsRTO+vS6DhOU9UbxXtCrrzKt47Sy3sXcSUrsGbv5ahls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1n6lcUj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1n6lcUj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C08DC2BCB0;
	Fri,  8 May 2026 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778260492;
	bh=oclkuQHVTCEyVa3kbvV8ehfJg7gQwDXcAh8lMm1Ug7s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=C1n6lcUjSlzEaamj4H9w1M9J34/1s6EDcvN91n0hV4dxHMdhAZ0F5DzmUStDKajLK
	 bktkZQS8BpnolDOLhGH8DCmDFzO9WDa7TeFzXw+feSf+KKpnkYKpOSdE6Qysl2WpQ7
	 Ql99P5/DYBZAE+RiXel9s0PwxxHDMqmpvl/zhIktj+kdvGPw6bqZ/xdx8v9P8CxRw6
	 Fm1uuLhEA0NE71zoKD8/gLg/eCLVo+PwnV4O5EO7t3YRXNkuGxlzbmofcxD7rmniyf
	 MgqrHy/2c3Qz9dKEUnV8f7g3eRwAx0t7XG0PdmgOBGMyZ6kB7cqTNU7KJaFjBbFg/Q
	 AiMkat4YqZZxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: pse-pd: pd692x0: support disabling
 disable ports GPIO
Reply-To: sashiko@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260507104720.262641-2-robert.marko@sartura.hr>
References: <20260507104720.262641-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 17:14:51 +0000
Message-Id: <20260508171452.5C08DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver requests the 'disable-ports' GPIO with `GPIOD_OUT_HIGH`=
, which logically asserts the disable signal, contradicting the goal of ena=
bling PoE.
--

commit bef0e9b8a1213b027391963a1e52c45fae73be60
Author: Robert Marko <robert.marko@sartura.hr>

net: pse-pd: pd692x0: support disabling disable ports GPIO

This commit adds support for parsing a disable-ports GPIO in the
Microchip PSE controller driver. It attempts to set this GPIO to output
high by default to enable PoE on all ports during probe.

> diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
> --- a/drivers/net/pse-pd/pd692x0.c
> +++ b/drivers/net/pse-pd/pd692x0.c

[ ... ]

> @@ -1780,6 +1782,11 @@ static int pd692x0_i2c_probe(struct i2c_client *cl=
ient)
>  	priv->client =3D client;
>  	i2c_set_clientdata(client, priv);
> =20
> +	disable_ports =3D devm_gpiod_get_optional(dev, "disable-ports", GPIOD_O=
UT_HIGH);

Will requesting this GPIO with GPIOD_OUT_HIGH actually disable the ports
instead of enabling them?

The gpiod API operates on logical states rather than physical voltage level=
s.
By requesting a GPIO named disable-ports with GPIOD_OUT_HIGH, the disable
signal is logically asserted.

This activates the disable condition and turns off PoE on the ports.

To de-assert the disable signal and enable PoE as intended, should this be
requested with GPIOD_OUT_LOW instead?

> +	if (IS_ERR(disable_ports))
> +		return dev_err_probe(&client->dev, PTR_ERR(disable_ports),
> +				     "Failed to get disable ports GPIO\n");
> +
>  	ret =3D i2c_master_recv(client, (u8 *)&buf, sizeof(buf));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507104720.2626=
41-1-robert.marko@sartura.hr?part=3D2
