Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FA31D5174
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790453080; cv=none; b=t3qryHhB5sv0QL8yHIsKOeP8IERZUe9Gw+ZkwiCS0LZ8kF4sHdb8+ugdESbQIlgxqyI98AHux2gGqTxx2oHJjUyXBJsAFAdjQZPYznnBQIVV2ebl+/cYyjIdcpUXNmUtnSRBjPQ4CIsmwMFXsHH5mpGCtFDZwU7jhqvDriK55ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790453080; c=relaxed/simple;
	bh=JokWPHhO1/oYd1V2MsfyL1PLN12AhPq/yRkt838QGsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dFHRtW8jk0M+ACaNpNuatfwcGjKfp+PbGOdbA3VAKBfcysJCMPKr9utKXcbdrGTmVw1YqHL0J5JBXa0EJLCFOJltgtVPLQwBWqVC1/Bk821GuvcMvXvuWv3DYAm7Zfuizs3LkHZ1RtIZ4A5da5fEJGsrFf5BTcVbyb6tu+kGDds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baOh6FY5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baOh6FY5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A7C1F000FF;
	Sat, 26 Sep 2026 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790453078;
	bh=12vi747poqZSjq5DWASSZfcbL5yvDmXHb91JT+TYETU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=baOh6FY5O4aQjVHAcgrl1luxVTZWfpeZJaBWywdTLTKPIMDIzgTzFiPnlqtekTa/b
	 hFIjtijD3dU3AUxqsB5Zan9K5W7vzn+n9kjNw0Wl8E8zew9VYLr8dyPV1mMJ7d1Fuo
	 y/dVCleYe1ex3jC+ZK3YSjLIoOF3VRO6PiHyLJSHP1S5rYmiZGo4brrKpC5hsPBC1m
	 tu64hogdZKOoq9QWvh0Yb0pcPEL6qEyJNESk5lt53hTEKHTI7gSytVcQ0GbLXRYE4d
	 JdAQAGMFOgbK0VM6mTJ53NzIFPuKm8gsZlIz/QAgY+Guq892AJ33TC9O3Uvqwft9+z
	 wV+AMEFJPEKqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: Clover <alex@ironrobin.net>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926195415.5995-3-alex@ironrobin.net>
References: <20260926195415.5995-1-alex@ironrobin.net>
 <20260926195415.5995-3-alex@ironrobin.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 20:04:37 +0000
Message-Id: <20260926200438.05A7C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] i2c: missing I2C_FUNC_PROTOCOL_MANGLING check for I2C_M_STOP
--

commit a8937fc74e70704582392fdfcb89327bf751206f
Author: Clover <alex@ironrobin.net>
Subject: platform: arm64: Add Lenovo ThinkPad X13s EC driver

This commit adds a standalone driver for the Lenovo ThinkPad X13s embedded
controller. It handles keyboard-backlight control, hardware brightness
change notifications, and system sleep power sequencing.

> diff --git a/drivers/platform/arm64/lenovo-thinkpad-x13s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-x13s.c
> new file mode 100644
> index 0000000000000..708f909f78780
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
[ ... ]
> @@ -0,0 +1,408 @@
[ ... ]
> +static int x13s_read(struct x13s_ec *ec, u8 cmd, u8 reg, u8 *value)
> +{
> +	struct i2c_client *client =3D ec->client;
> +	u8 buf[] =3D { cmd, reg, 0, 1 };
> +	struct i2c_msg request =3D {
> +		.addr =3D client->addr,
> +		.flags =3D I2C_M_STOP,

[Severity: Low]
Is the I2C_M_STOP flag necessary here?

Single-message transfers inherently end with a STOP condition. If the
adapter requires this explicit flag, the driver needs to verify that the
adapter supports protocol mangling.

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
If the I2C_M_STOP flag is intentionally required in x13s_read(), should this
functionality check also include I2C_FUNC_PROTOCOL_MANGLING?

The I2C API contract dictates that I2C_M_STOP must only be used if the
adapter advertises protocol mangling.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926195415.5995=
-1-alex@ironrobin.net?part=3D2
