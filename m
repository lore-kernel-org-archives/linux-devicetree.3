Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378F0386C39
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944547; cv=none; b=RHN6eg7qWfJIfnk7Bqnq8cFK4vF3foE99JxkkKhsVhjSK0DnwV2K/1kFbtjBnwWimKJ56v6sow0cCfFCIJKP0z5QTjo1m6x3/4LjaLNd9JbvLG28XnCbrT9EeBOZtXgtwtFEIcZ3bZVdd6T9alg6x1fCprVB41jL3Y1V0lm8A5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944547; c=relaxed/simple;
	bh=5C4z95/rtuXSFk2JQ31cDh9rIZibU8Mydc8tSQz3fc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QTxYR6CSWoGUwBvbWwL/Ll7qf6cO+Qnn3YARzef4SPNk8/nariSctpNMWb8Y8YznUHmMcND4Os4O3pdxVKvHpT9GtOeBtNFmuyogxE8JQ41ESomv+d4BwsGOdkIbNUCb5U1/ZkPJCGVdOOJ1e5um7ALIq9zn2qA4YwAFDomI2t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWmbUWM/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWmbUWM/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4C11F00893;
	Mon,  8 Jun 2026 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780944545;
	bh=YvK11Osbx3Qh4z4Ps3pyW4RMR8yQgV2gTIfp6NJ58IA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JWmbUWM/Z/nd4PlfHMj4hI+dGrXYkqBuFo5EP612S+uWgaqj7BuvOMUdlnVYsqvr6
	 Shc8zCWFKQXv/tbKUyxqG0D7YaOytM5ST+IIWlBuYmGMZavOrnNqmCrwJiJJFEH3F8
	 2hSManTdTIJiWDcBpReaPPIeeDVEKEDQsLe/RXiKnL2r1XAMiVTfGbpMdneBhyGL3n
	 cZWLys3Yh9hj2/kp8zz7xCet5zYAPsJIl0YNbaNOCVPzNKxj1/Bbi+QV3IHNIVJHiZ
	 uIdLrC4H1Zfv4rIfXNdxg4ydmycfkr3GBiH1p8AvZM1cdHmpYQmTX9A5e6LW7v+vEe
	 etlHDsnwKPZfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] iio: adc: versal-sysmon: add oversampling
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608183801.1257051-6-salih.erim@amd.com>
References: <20260608183801.1257051-6-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 18:49:05 +0000
Message-Id: <20260608184905.AF4C11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The oversampling ratio software caches are initialized to 1 with=
out synchronizing with the actual hardware state during probe.
--

commit 3a6a43bb24f0fd6d80e623d9f51baca549ff9147
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add oversampling support

This commit adds support for reading and writing the oversampling ratio
through the IIO oversampling_ratio attribute. The hardware supports averagi=
ng
2, 4, 8, or 16 samples, plus a ratio of 1 (no averaging).

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index 5fbd509089bbd..389a88878115f 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c

[ ... ]

> @@ -890,6 +1033,8 @@ int sysmon_core_probe(struct device *dev, struct reg=
map *regmap)
> =20
>  	sysmon =3D iio_priv(indio_dev);
>  	sysmon->regmap =3D regmap;
> +	sysmon->temp_oversampling =3D 1;
> +	sysmon->supply_oversampling =3D 1;

[Severity: Medium]
Is it possible that the hardware was already configured with a different
oversampling ratio by the bootloader (FSBL) or retained state across a warm
reboot?=20

The software cache is initialized to 1 here, but no corresponding hardware
synchronization or explicit register initialization occurs before the IIO
device is registered.

If the hardware is actively using averaging (e.g., OSR=3D16), could the IIO
sysfs interface incorrectly report 1, masking the true hardware configurati=
on?
Would it be safer to either enforce this default state on the hardware or r=
ead
the current register values during initialization?

> =20
>  	ret =3D devm_mutex_init(dev, &sysmon->lock);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608183801.1257=
051-1-salih.erim@amd.com?part=3D5
