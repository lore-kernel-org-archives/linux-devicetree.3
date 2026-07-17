Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC62285072
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332039; cv=none; b=Qg5Oiv14IereA61axpyEL8lQ60XSPKoxnhDmEQSh1zF0uVDb/hWJbjvWaVsVjR2AWAfloz++1ApVY+OHssrwayKGYBLYo6uX/rMX6ftI4zgnpd9LSbJOpx80lfpJYoyR/qzQYU+wkBwjKZnWTfKv3FPUhDEX3L3JfEbWiUjFXxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332039; c=relaxed/simple;
	bh=Wv6RgvuqmxV6Trmqyq+aKTuumlwtY7pDkIsBykijF3k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TJRA+ctJqaa24+c1LJ1OJZ2UkcovFTC0RxtAbRXAwNF6uPi7/JhWkvpvpcFAQ8y+X42Q452AQ8AktwcUFdX3j4LzMnNlo7jB0VQSYrVto9MjzVC3yTnyt8HXnMD5eIqlTTYUMulZqg3O3rEZKcjRKUhQHanDIInGmkXUCOm50Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgxsinDw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgxsinDw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200581F000E9;
	Fri, 17 Jul 2026 23:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784332038;
	bh=733isSJF/GylfaFq5TOOJsvkhb4mpZ2p6S43/F1MvsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jgxsinDwbprJ77g7Sh8DTAtA1Nbbw0SQP7gQ7ed1LEXdzQ1sMzrcO5MWkEd8UPf4c
	 rPFRuOATP2MJvmrfYYbQegMwHPG5WjEJJr/K6ck8LcY/t0fOrr4zVZVc7GQ4etY0DA
	 XG+7mUKgxZvyea3J/XXfbbvfvsECySCpws9SJ1AWx/CP+LuZPBcgGbN8kvTyOH/U1I
	 QCpUX57ISROZTZlEvx7wbFpAVUjrwOl7upgU5t1kyiR8Yds0zzYrC/akpSbdaR3i7i
	 SzKf8MRiz3JOe1GWEPa4yPZ6wp9Y7OiR6C1uvPAlP1E4aWAiUWJNJ/lDgosPaGh64i
	 q8TyG2s6cZpXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add TAS2557 mono smart amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gianluca Boiano" <morf3089@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717233402.414326-3-morf3089@gmail.com>
References: <20260717233402.414326-1-morf3089@gmail.com>
 <20260717233402.414326-3-morf3089@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 23:47:17 +0000
Message-Id: <20260717234718.200581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unreserved secondary I2C addresses and data race on `client->addr`=
 via single shared regmap.
--

--- Patch [2]: [PATCH v3 2/2] ASoC: codecs: add TAS2557 mono smart amplifie=
r driver ---
commit 6ad2a6c10e4ed5ed98d85d212f482c1f0987454d
Author: Gianluca Boiano <morf3089@gmail.com>

ASoC: codecs: add TAS2557 mono smart amplifier driver

This commit adds support for the TAS2557 mono smart amplifier. It uses a
shared regmap architecture to manage up to two physical chips by dynamically
retargeting the I2C client address before each transfer.

> diff --git a/sound/soc/codecs/tas2557.c b/sound/soc/codecs/tas2557.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/codecs/tas2557.c
> @@ -331,12 +331,12 @@ static int tas2557_change_book_page(struct tas2557_=
priv *tas2557,
>  				    unsigned int chn,
>  				    unsigned char book, unsigned char page)
>  {
>  	struct i2c_client *client =3D to_i2c_client(tas2557->dev);
>  	struct tas2557_dev *dv =3D &tas2557->devs[chn];
>  	int ret;
> =20
>  	if (client->addr !=3D dv->addr) {
>  		client->addr =3D dv->addr;
> =20
>  		ret =3D regmap_write(tas2557->regmap, TAS2557_PAGE_REG, 0);

[Severity: High]
Can this mutation of client->addr cause a data race with concurrent regmap
accesses?=20

If userspace accesses regmap debugfs concurrently, it acquires the regmap's
internal mutex to perform I2C transfers. Because client->addr is modified
here under dev_lock but before acquiring the regmap lock, could this result
in debugfs I2C transactions inadvertently hitting the wrong physical device?

[ ... ]

> @@ -2875,13 +2875,13 @@ static int tas2557_parse_dt(struct tas2557_priv *=
tas2557, struct i2c_client *client)
>  {
>  	struct device *dev =3D tas2557->dev;
>  	struct device_node *np =3D dev->of_node;
>  	unsigned int imon_slots[TAS2557_MAX_DEV] =3D { 0, 0 };
>  	unsigned int vmon_slots[TAS2557_MAX_DEV] =3D { 2, 2 };
>  	unsigned int i;
>  	int ndev =3D 0;
> =20
>  	if (np) {
>  		u64 addr;
> =20
>  		for (i =3D 0; i < TAS2557_MAX_DEV; i++) {
>  			if (of_property_read_reg(np, i, &addr, NULL))
>  				break;
>  			tas2557->devs[ndev++].addr =3D addr;
>  		}
>  	}

[Severity: High]
Are these secondary I2C addresses left unreserved with the I2C subsystem?

Since there is no call to i2c_new_dummy_device() or a similar API to claim
the additional addresses parsed from the reg array, is it possible that
another driver or a userspace process could accidentally bind to them and
cause bus collisions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717233402.4143=
26-1-morf3089@gmail.com?part=3D2
