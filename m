Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7738318B85
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990021; cv=none; b=OeqfVCx1XZPWKpJJr+az6aPLwKFlYApRy0yW/2slOjz54k24p4+PhjssJRqcTf0Kchh9OsZNh38yQXeq204e+MhblG6I2xjvYe5FPbN+uHn39g87PHS4Gg/mQUyYZF9VqZffThJMvlP+c1RZdr1I3sZyG1+vEqrPN+bLaVyXj6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990021; c=relaxed/simple;
	bh=MP18MVNHTXW7aNo5eGxHrpd9iKiT4agqpG7qvYvWGm4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OzkTw5wcynHjqPR0+OM7AHoM109VizFy5qPd+bSQ2AjwCX/RMaq4JLSXwRhQwNu0QuqCBaS5uwJRRQnKxyJhfNbyjUXmp7ZToRJWD8C8vNwvvR7rRCRGGuFtOOCadvgZL+BI7KPPe41XwwhCql6YwB46AdUnCTvE9q1y+05zPR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqObM/Hf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqObM/Hf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16D81F00893;
	Tue,  9 Jun 2026 07:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990019;
	bh=YKc6nCZrr9SMM8NJnPMTxLtpgHDW+SWLJ1lj0GYGtEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SqObM/HfwPxx5GZRe3mWFjYJTM9bAROcncRz9bQ7jkmbpLJrjYc+rJbzizWixJ1AM
	 2vMbW5lG6Nlv4wD1hDvc6kE3CHenFl1LwjC6pEPt/WSmXxWjt03oBxoEgTPFUaMpWg
	 bGe9GRnA4/dYqpaKaVT2Pd/cDI2yW64e5fOpBrbo7UXjYed14ZLqMpCF7hGec3yCU8
	 AgZOi1FvmFi5RoL59VrRwWVCw3mhm6HRSk7KcPaOLp84hfFuPJKgn19xAfVDOsTCB4
	 e5+czacOhz0Dh9d3B86Htygo7p2/xJBMYsBfjmryQkiM+ME060xk7fr5GXoyKwlK/y
	 8VyaTryoVB4MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] ASoC: codecs: ES8389: Modify the initial
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260609071732.20939-5-zhangyi@everest-semi.com>
References: <20260609071732.20939-5-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 07:26:58 +0000
Message-Id: <20260609072658.F16D81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calls to `regmap_read()` do not check for error return codes, lead=
ing to the use of uninitialized stack memory if the read fails.
--

commit 73684b8bb77238aedd3f4796976da733be77e2de
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Modify the initial configuration

This commit updates several initialization registers in the es8389 codec.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 647d9d62820e6..284eb707f9f7f 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
> @@ -793,7 +793,7 @@ static void es8389_init(struct snd_soc_component *com=
ponent)
> =20
>  	regmap_read(es8389->regmap, ES8389_MAX_REGISTER, &reg);
>  	es8389->version =3D reg;

[Severity: High]
This is a pre-existing issue, but does this code handle regmap_read()
failures correctly?

If regmap_read() fails (e.g. due to I2C/SPI communication errors), it
returns a negative error code and leaves reg uninitialized. This
uninitialized stack memory is then permanently saved to es8389->version
and could affect later logic.

There appear to be a few other places in this file with the same pattern
where uninitialized stack memory might be used if regmap_read() fails:

es8389_pcm_hw_params():
	regmap_read(es8389->regmap, ES8389_DMIC_EN, &regv);
	dmic_enable =3D regv >> 7 & 0x01;

es8389_mute():
	regmap_read(es8389->regmap, ES8389_CSM_STATE1, &regv);
	if (regv !=3D ES8389_STATE_ON) {

es8389_resume():
	regmap_read(es8389->regmap, ES8389_RESET, &regv);
	if (regv =3D=3D 0xff)

Could we check the return value of regmap_read() in these locations to
avoid evaluating garbage data?

> -	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x00);
> +	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x56);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609071732.2093=
9-1-zhangyi@everest-semi.com?part=3D4
