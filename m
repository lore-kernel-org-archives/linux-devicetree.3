Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3CC39937B
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778932282; cv=none; b=EUsz0PYjUxuRlnpGgvhjV7vtj+2mXNPntkOkt2I8++unuUoWC8rqROrVNHABYBu5A+iBVo82GGiSE/P9xW/eewCkwh6BY7mm/rZtpmDlWDoH7c+yZ4OumOLQsObaIj+TgoH2XXHRbHWOqUH7rQKczyDYO47RbI+x0TvBOzx3Gj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778932282; c=relaxed/simple;
	bh=Y4paI19KiRoYlgjc17Qz1GGRVsPQOcPJ/D4l147O83U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fSKEN/M+DYt6B5CBLHC4fI1YAeQ1JQy9zkl46r5188DLrw9ZIjNM7iCzHjrNAAj1GaV6mSOCsGs3FgjgA/1eCf3GXPLrkpMt+Pw+tr/wLf8dnkgJsQ2/Al/h5OPCU67J4zAynOoMH4JCFDi54qalulaMGYpOrXMAL4w8MmN5/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUYv9VEs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUYv9VEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8AFC19425;
	Sat, 16 May 2026 11:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778932282;
	bh=Y4paI19KiRoYlgjc17Qz1GGRVsPQOcPJ/D4l147O83U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LUYv9VEsTemalTzCluu2SI3lHSLJauXWO/xUavYZjA4PJcTjvtDsvO8eU3lPfbHVB
	 e3RD/2ensOayB3616PclfuzaCBXQ+qqbS++fEQrXAchttqaih3TgVIZ7+ciHZIIXme
	 vUtS3YhYjQmMQucOcNMA5hAEE4bf27rx+E2ihA/vyMO7pBA7bY+iQJuPtGtgYi1Anf
	 6ZAmS7acTJuEF2fXVyVZMrGNMFg6xfBk2bA2gphmPyiS5vMCuxmk71fIdZp9mC1ZBG
	 Y4NlM3Wv60L4xMxEK2TZGROBReH1HpOar6hV6MTE4485tpIL9zBD5ULfeprjiqTk2H
	 lk9kuke8wB+tA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: pse-pd: pd692x0: support disabling
 disable ports GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515115050.691119-2-robimarko@gmail.com>
References: <20260515115050.691119-2-robimarko@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 11:51:21 +0000
Message-Id: <20260516115121.CF8AFC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Contradiction between commit message and code regarding the init=
ial GPIO state.
- [Low] Inconsistent usage of the device pointer in the error handling path.
--

commit e53266c93f6ce835ab8c0c15eb780fa85ffd5a46
Author: Robert Marko <robert.marko@sartura.hr>

net: pse-pd: pd692x0: support disabling disable ports GPIO

This commit adds support for parsing the disable ports GPIO on Microchip
PSE controllers and configuring its default state to enable PoE during prob=
e.

> So lets support parsing that GPIO and using the GPIO flags to set it to
> output high by default and enable PoE on all ports during probe.

Does the commit message contradict the implementation?=20

The message mentions setting the GPIO to "output high by default", but the
code below uses GPIOD_OUT_LOW.=20

While setting a "disable-ports" pin low to enable PoE makes logical sense,
could the commit message be updated to accurately reflect the code's behavi=
or?

> diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
> index 4a3c852780f58..6c5c5a26bbaa6 100644
> --- a/drivers/net/pse-pd/pd692x0.c
> +++ b/drivers/net/pse-pd/pd692x0.c
[ ... ]
> @@ -1780,6 +1782,11 @@ static int pd692x0_i2c_probe(struct i2c_client *cl=
ient)
>  	priv->client =3D client;
>  	i2c_set_clientdata(client, priv);
> =20
> +	disable_ports =3D devm_gpiod_get_optional(dev, "disable-ports", GPIOD_O=
UT_LOW);
> +	if (IS_ERR(disable_ports))
> +		return dev_err_probe(&client->dev, PTR_ERR(disable_ports),
> +				     "Failed to get disable ports GPIO\n");

This isn't a bug, but should this use the local 'dev' variable instead of
dereferencing '&client->dev' again?=20

The 'dev' variable is used in the devm_gpiod_get_optional() call just above
this line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515115050.6911=
19-1-robimarko@gmail.com?part=3D2
