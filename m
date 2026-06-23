Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F279513790B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 02:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782181276; cv=none; b=mevKIClj7PSFKpUIyzjYVimiWEyQGB5h5OKksbuTGaKcjcIdMFulwNxCawFEh3A1u0oBXCXPGtjIrZmbeb0k+F5vSpY/RSCa1AqohtHxOSS6IyUdpJaIuawIil7DV5OuSkMD4Kl6p+a/9NV+8WZpvejh0MA4zB/CKHMEmK/QQjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782181276; c=relaxed/simple;
	bh=pVIYZAtfyA5mJDSrhT8LYInIttQICwgNvVJqf6/s4RY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SVHIgI0y3IWcLATdkvAWJVG9uExT7z/Mtu89ywG8cmVPW6JX3EByx4EOCDqMldCwXq7JHJbz5SbnIbzSA5HKf60FBYKBJUbXwabQKiC12cTlWddFEczS889XuRjUSRD4SMn+Aln6aXxDBZzCwSJUIYT1/lvmKVILTon84HzMMvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PawGDB62; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PawGDB62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5AB1F000E9;
	Tue, 23 Jun 2026 02:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782181275;
	bh=aEyewWdl4ZO4kxdx9WULP2NDPt7TpgiRPvMkVPxkCd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PawGDB62KByXn/gXjsA7AMaiVQUd8Og4YdBpgD1iYNoigJY4pp5RmhujPSjd6Sfm0
	 1s0WhvvXjxC9Q3qMkMPn5EHt474JhcoUAU1UCoNbzb9uojG7INuMHz5ywCEOIdGZTl
	 nRnynoRErr9xKb6U8NrmWuJPbX58/N6CTuZkbTgYb/UBzsyZVySqanP264m0UkjogE
	 IeUHP2zPkP5MCsiN31YOFISUrcmDAsyqmaDLKB14T0AzH8F+MBbUo2UrM4FxI5Wglb
	 jJeUAUu6L+vgXy26cM73FkldcBtkhCsZm395uMOfTlhgtAuXUqFzukl9SVL3vz3oTq
	 izLBA6M5Nbo/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/5] iio: adc: versal-sysmon: add oversampling
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623014036.3865402-6-salih.erim@amd.com>
References: <20260623014036.3865402-1-salih.erim@amd.com>
 <20260623014036.3865402-6-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 02:21:14 +0000
Message-Id: <20260623022115.5C5AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing hardware synchronization for oversampling ratio caches d=
uring initialization.
--

commit 25a143792e9062675e1abe4133ac067208b02232
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add oversampling support

Add support for reading and writing the oversampling ratio through the IIO
oversampling_ratio attribute. The hardware supports averaging 2, 4, 8, or 16
samples, plus a ratio of 1 (no averaging).

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index 8f2c502d9cb6d..1b55d343982ef 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> @@ -846,6 +999,8 @@ int devm_versal_sysmon_core_probe(struct device *dev,=
 struct regmap *regmap)
> =20
>  	sysmon =3D iio_priv(indio_dev);
>  	sysmon->regmap =3D regmap;
> +	sysmon->temp_oversampling =3D 1;
> +	sysmon->supply_oversampling =3D 1;

[Severity: Medium]
Could this lead to a mismatch between the software cache and the hardware
state if the bootloader or firmware previously configured a non-default
oversampling ratio?

Since the driver initializes temp_oversampling and supply_oversampling to 1
without reading the initial state from the hardware or forcing the hardware
registers to match the defaults, userspace might read an oversampling ratio
of 1 via sysfs while the hardware is actually still actively averaging
multiple samples.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623014036.3865=
402-1-salih.erim@amd.com?part=3D5
