Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518343B14DE
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 19:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711024; cv=none; b=cWYKAERul/9MJsAMyu2LBfnRYXmiiBcEEXnLi5TmoQVYnXHCPW2t+X2+SHdHmL+LPcFuW4SNTyFyVA6CB0OtYBCq+J7imCsNUTWXj6zv7DOO1YG0bIe2fydTx6nmDY5uHwDSo8Rre3938CaPOnje4KSVitQ2Ng4YtZXKWuWUtR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711024; c=relaxed/simple;
	bh=IqaHfFFsDzkILWexjgNF3X8j/7mWETe6V8LPk1JgtRQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DIkGc+ynSejHXvH4eQJtFCvxyTUXOwUMhe92Dio9QEepVNMOzq+grsOwwLf4asPYGHdhe7smijRgNHB97SOSWkeDMjQ3EhboHsNw2FZB6CG5Q7/mdd73eRByD6mxS8QnrkrgAzB1sKaY+PthlEfaOyEs6Z8DRgHtXqSYCJHCi30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFAAlyyu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFAAlyyu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB061F000FF;
	Tue, 29 Sep 2026 19:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711023;
	bh=MvuwfBLYgN9WR25owPDDsg1T2tqrjNUXHmTrtEn60Mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YFAAlyyuh1mszyOKvYmFmWTOgU0fj0zqN0lC1S86gzt5cCc+WhYwTwl+0kIyF5Hx3
	 8viXLO9CR+XgfGEM+aJgOQQU0sAe5F2zcTaMjh4xS9lLCQoyKG0q8ieHdhgMhBaXv1
	 TIqW5oW9mDlT+p4HV5WcBQRtyZYAlssDiggZRgsYMMx0Zp4/1/xo7lyLUedybn4LS1
	 xa7eKQwjmWIitb2Ek6cxGWpe+cBlvArFcr6B9L8YXy/oMj31TnecDMn9+RUtamjXfQ
	 l8eILPLPnradbVQDRx6a2Mlp0T8Pqm2u0jopM9M5zPe8PcXKhGbXK1oTG/hFfoJ4pA
	 8h+6S5c06ZKoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Robinson" <alex@ironrobin.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929192908.16507-3-alex@ironrobin.net>
References: <20260929192908.16507-1-alex@ironrobin.net>
 <20260929192908.16507-3-alex@ironrobin.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:43:42 +0000
Message-Id: <20260929194342.BAB061F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] i2c: use of I2C_M_STOP without checking I2C_FUNC_PROTOCOL_MANGLING
--

commit 1d57af75b3833054240b9ba2eae495a1eff1ff60
Author: Alex Robinson <alex@ironrobin.net>

platform: arm64: Add Lenovo ThinkPad X13s EC driver

This commit adds support for the ThinkPad X13s embedded controller to expose
keyboard backlight control and hardware brightness change notifications. It
also preserves brightness across lid and system-sleep transitions.

> diff --git a/drivers/platform/arm64/lenovo-thinkpad-x13s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-x13s.c
> new file mode 100644
> index 0000000000000..4a7d5d0369095
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
> @@ -0,0 +1,435 @@

[ ... ]

> +static int x13s_read(struct x13s_ec *ec, u8 cmd, u8 reg, u8 *value)
> +{
> +	struct i2c_client *client =3D ec->client;
> +	u8 buf[] =3D { cmd, reg, 0, 1 };
> +	struct i2c_msg request =3D {
> +		.addr =3D client->addr,
> +		.flags =3D I2C_M_STOP,

[Severity: Low]
Does this use of I2C_M_STOP require verifying adapter support first?

[ ... ]

> +static int x13s_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct x13s_ec *ec;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +		return -EOPNOTSUPP;

[Severity: Low]
Is a check for I2C_FUNC_PROTOCOL_MANGLING missing here? x13s_probe() only
checks I2C_FUNC_I2C, but x13s_read() invokes __i2c_transfer() with the
I2C_M_STOP flag set. An adapter that does not support protocol mangling
might reject the transfer, causing I/O errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929192908.1650=
7-1-alex@ironrobin.net?part=3D2
