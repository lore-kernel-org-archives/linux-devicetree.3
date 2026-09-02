Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA67D419FD2
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341347; cv=none; b=A1LrkJW80yR737rpxwQQQmh8leF9tgtbUoWTTK5muO+lAF5OLWqIqioc+QBC0/xe4Z4Ry9kPH9wzV3hIGKqTMiTracowO0S6sPFIq4JS83lFkuGXGjaKde4MPaTlwI1mPU84kibaYIPRhFyEJZ52tr9QWJ/zEhZC7JYLseGwNYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341347; c=relaxed/simple;
	bh=4UKucQV5JpRO688BnJncp7hMOIT+yMPDDwJ8fyq6N1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kZCwggtD4veS0LYXMCd3Ko6le0Nv8QSfwaqufTDqkPCWkhxC0iz0kJV4GG8MpRzut0EdVFimy19un2uautpbOp0SLULjfy+XSBG6vccHzSgmRdrsFcLFvs15tWtowBOmxQkO+4z0L7MeAecf+14SZbZuwfV/BVSRCI0ONGAxO8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtYcnwLN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtYcnwLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAAF1F000E9;
	Wed,  2 Sep 2026 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341345;
	bh=f6MCegLZ2RDvhO/jdSjGZYdvtAFxpubuLMts7fyp5oI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QtYcnwLNtvMpnn7FA7zDZsJYsxUriCrOsP1lLD2CEcRxyYVv0j+iJaEYjs+xQIjXZ
	 iPw4uvhkAlCQnKap/+d2rk52v8eZs1x18VyWmRZV9gUi5Yan3ygHc++eRCkqE6xfXR
	 7t/wtgOlAke/+903XEj/Jek66GvV6JAdvj+m2Ed1qZMTsY+SjWVtrecDF8flU/RsaV
	 WfWktV5FxVY3dAWbunN6awp38hRmMx3VgVLG7h1vIX3PicgnnPHC26tjMXBfgesJCZ
	 8YHq3aIvlYg/MPmOuDt9h4+yaSczTydvIqvhBqadkmfdvjmepRWkaYNe04keug7TWb
	 Wowpd1F4WwXFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] i2c: nt72676: Add Novatek NT72676 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: nina_kuo@novatek.com.tw
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902091318.208074-3-nina_kuo@novatek.com.tw>
References: <20260902091318.208074-1-nina_kuo@novatek.com.tw>
 <20260902091318.208074-3-nina_kuo@novatek.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 09:29:04 +0000
Message-Id: <20260902092905.2DAAF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The driver unconditionally logs a hard error via `dev_err` on I2=
C NACK, which causes kernel log spam during normal bus probing.
- [Low] Accessing uninitialized i2c->adapter.name in nvt_i2c_init() error p=
ath.
--

commit ad108b18a20082d1ab2afdd3a9f9c59f5896754b
Author: Ben Huang <Ben_Huang@novatek.com.tw>

i2c: nt72676: Add Novatek NT72676 I2C controller driver

This commit introduces the driver for the Novatek NT72676 I2C controller,
supporting fundamental read/write functions and both Standard-mode and=20
Fast-mode operations.

> diff --git a/drivers/i2c/busses/i2c-nt72676.c b/drivers/i2c/busses/i2c-nt=
72676.c
> new file mode 100644
> index 0000000000000..ab7be28615f0f
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-nt72676.c
[ ... ]
> +static int nvt_i2c_init(struct nvt_i2c_bus *i2c)
> +{
> +	if (i2c->comp_data->stbc_i2c) {
> +		int ret =3D nvt_i2c_stbc_auth(i2c);
> +
> +		if (ret) {
> +			dev_err(i2c->dev, "[%s] STBC authentication failed, ret =3D %d\n",
> +				i2c->adapter.name, ret);

[Severity: Low]
Does this log an empty string for the adapter name?=20

Looking at nvt_i2c_probe(), nvt_i2c_init() is called before the adapter nam=
e=20
is initialized, meaning this early error path accesses an empty string:

nvt_i2c_probe() {
    ...
    ret =3D nvt_i2c_init(i2c);
    ...
    strscpy(i2c->adapter.name, dev_name(&pdev->dev), sizeof(i2c->adapter.na=
me));
    ...
}

[ ... ]
> +static int nvt_i2c_write(struct nvt_i2c_bus *i2c, struct i2c_msg *msg)
> +{
[ ... ]
> +	ret =3D wait_for_completion_timeout(&i2c->msg_complete, i2c->adapter.ti=
meout);
> +
> +	spin_lock_irqsave(&i2c->lock, flags);
> +	if (!ret)
> +		i2c->error_code =3D -ETIMEDOUT;
> +	nvt_i2c_reset(i2c);
> +	ret =3D i2c->error_code;
> +	i2c->current_msg =3D NULL;
> +	spin_unlock_irqrestore(&i2c->lock, flags);
> +
> +	if (ret)
> +		dev_err(i2c->dev, "[%s]: write failed (err:%d); SA[0x%X]\n",
> +			i2c->adapter.name, i2c->error_code, msg->addr);

[Severity: Medium]
Will this spam the kernel ring buffer during normal bus scanning?

Tools like i2cdetect deliberately scan the bus by sending messages to all=20
possible addresses. This generates expected NACKs (-ENXIO) for unpopulated=
=20
addresses.=20

If we unconditionally log a hard error via dev_err() on NACKs, the kernel=20
log can easily get flooded. Could we omit this log or use dev_dbg() instead?

[ ... ]
> +static int nvt_i2c_read(struct nvt_i2c_bus *i2c, struct i2c_msg *msg)
> +{
[ ... ]
> +	ret =3D wait_for_completion_timeout(&i2c->msg_complete, i2c->adapter.ti=
meout);
> +
> +	spin_lock_irqsave(&i2c->lock, flags);
> +	if (!ret)
> +		i2c->error_code =3D -ETIMEDOUT;
> +	nvt_i2c_reset(i2c);
> +	ret =3D i2c->error_code;
> +	i2c->current_msg =3D NULL;
> +	spin_unlock_irqrestore(&i2c->lock, flags);
> +
> +	if (ret)
> +		dev_err(i2c->dev, "[%s]: read failed (err:%d); SA[0x%X]\n",
> +			i2c->adapter.name, i2c->error_code, msg->addr);

[Severity: Medium]
Similarly, does this also cause unnecessary log spam when a NACK occurs=20
during an expected I2C read failure?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902091318.2080=
74-1-nina_kuo@novatek.com.tw?part=3D2
