Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B63C38F651
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464714; cv=none; b=lKOZGH/WsxZoNQqRzjyt1kokTkCQZvH90RscZHltfXjhaAJma1K9zm0TjwKYyli77vGLLZ2Ax1p+D/WWKI6hi9rJSUN4Wpa3c9ml/3PtsWN4Mq3MpNjoaEWb2+kFYn/n3TnBIRHC60OMGI6yVnnQcv7671WRtznE0F9H2xL/Gi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464714; c=relaxed/simple;
	bh=8zp0kk2w4JfRXj8fifwE6fWiosmN7vvdTCQFHLveG1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eeECyJVfgu3uJiTtCI/mcoenhoMg+WJ6oUoCNBA8MXruNSBNamhntdIN+/w5RpIes1xB09RODYF18vlzBHGPAW3NVYQEWBmzDhhtLwsZipi6l7pF4GW1ea8jK1fvln7eipfc/XWM+vrLNAy2zpUPt+puH+4jTvQYhSF+ufx2w6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCySVVGA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCySVVGA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367111F000FF;
	Tue, 15 Sep 2026 09:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789464712;
	bh=0ErmlG3wWgJcsg5B2K49yl+pXyLIovdx2wAUgMA+ktg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bCySVVGAI/d7GvDUniRxDHPOp8UewtcfSqu9A1QX3AMoxV/psWbdmNd+EQDbDWEXg
	 JMzSj68hyLvUSP3pU8aGxUiaSsLTNlVEIlfrnCl+GyV7boM3rrNMYR9buvr2HHjGQw
	 +qnxQlpS7P01Tw51FCOPuWvNaErWoJxyBgoezea8oBreFCa1iARJ1s/oecWSBpMQka
	 vpC/2IkltjUhEk5VGk5usLFOBzOddAWkRQof7/9e4+CiJT6MUChCjLzKkAImXT8wI1
	 KQA1egLI3dD9djJ50AWvmTRcD895rCMFtgjmKmxnLOYXd8fBzQatY6feUd9r6MasJE
	 nL136ERCDsLCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] gpio: Support ON Semi CAT9532
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alban Bedel" <alban.bedel@lht.dlh.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915092046.931449-3-alban.bedel@lht.dlh.de>
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
 <20260915092046.931449-3-alban.bedel@lht.dlh.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 09:31:51 +0000
Message-Id: <20260915093152.367111F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] i2c: i2c_device_id array missing named initializers
--

commit ce4c104d77312ee9164e59bc58ade163f20cd3c0
Author: Alban Bedel <alban.bedel@lht.dlh.de>

gpio: Support ON Semi CAT9532
   =20
This commit adds support for the CAT9532 LED dimmer from On Semiconductor,
implementing it as an open-drain GPIO controller driver.

> diff --git a/drivers/gpio/gpio-cat9532.c b/drivers/gpio/gpio-cat9532.c
> new file mode 100644
> index 0000000000000..973ff74a15b89
> --- /dev/null
> +++ b/drivers/gpio/gpio-cat9532.c

[ ... ]

> +static const struct i2c_device_id cat9532_i2c_id[] =3D {
> +	{ "cat9532" },

[Severity: Low]
This isn't a bug, but does this array initialization in cat9532_i2c_id
violate the I2C subsystem rule requiring named initializers for
struct i2c_device_id?=20

Using positional initialization like { "cat9532" } instead of
{ .name =3D "cat9532" } goes against the documented subsystem style guideli=
nes.

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, cat9532_i2c_id);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915092046.9314=
49-1-alban.bedel@lht.dlh.de?part=3D2
