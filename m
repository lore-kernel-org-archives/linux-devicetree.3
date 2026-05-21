Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD542244667
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 17:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779384827; cv=none; b=q4BJQpxAZ5fOj5eEzG0yI4c46gt3FVhApmRWeCUL/s393d8IKX7N6LkaVZhU8q9M5MdjY3YTSEUzbnjG+hJqP05WvWe0pzivN/HyfMK3Tw/h9ES15KQsjs2UGdcbhiz0XabWO5JddEgdU1Q/vmdWujYbHG3FNZOCIELttFXa8S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779384827; c=relaxed/simple;
	bh=69hD0NS9bSqZFU2sw9qKlu6zE1J+ih22Mi2g4FgzQdY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mO4MzQCcIqpTB+P+8M7fmD65D8IqsyOMx+l8ms1XJzaByuA+jMdyTS5e8LdFE04BXPALwImfImVWAmwJAWZSCac4ksDU54ktjGVV+2HurmiHr50UlnR8NVwFDZ9zSVut3p2g0sHaEeK7Zf80KZ1AMmTJfYKndlXJ5z0rysSY7Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoO3/gx7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoO3/gx7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F217E1F000E9;
	Thu, 21 May 2026 17:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779384826;
	bh=51UY1UuitBXPKOkFGnnh8y6Q8BcndmYq0d+ZLei+t7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YoO3/gx7TC0Bm4nL8Q3Z4wGiA62RU24JvW4ekPB45heyNav0Hq4w/qr+TmcgeFvJw
	 Wu0WHuIeIcpPpTG9PdZ/Cj/wqp6u0QNzf1FNFCl7snGyV7o0iX9a0CXUY89dk8scvM
	 sRAOBwsZuNRrzGndZI4+e6eQgUMAb0VlhV4wcTrZIQb87LHqe7KQteWZ274y411vAl
	 Bk/xWCHkbhzFdIzDs3uJxWkNBFCR77BVhJ+Pwhs8uX7f2VspVbUP8v6max1o1F7iek
	 gxRQQsl/7YJkjxfAhLS0UAA/zNBxdmyL7fIUHXmx7OyGHuPfuez7lDb0DJBFP9/xma
	 nlGIn05oODcNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] mfd: sprd-sc27xx: Add SC2730 regulator cell
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T3R0byBQZmzDvGdlcg==?= <otto.pflueger@abscue.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-sc2730-regulators-v4-3-1ac8a3b5ed82@abscue.de>
References: <20260521-sc2730-regulators-v4-3-1ac8a3b5ed82@abscue.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 17:33:45 +0000
Message-Id: <20260521173345.F217E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The existing MFD cells for `sc2731-regulator` and `sc2731-poweroff=
` fail to bind to their respective drivers due to naming mismatches.
--

commit 410bda683e83be6297ddc2d59ec5df1da8471eae
Author: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>

mfd: sprd-sc27xx: Add SC2730 regulator cell

Add an MFD cell to register the SC2730 PMIC's regulators.

> diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
> index aa052f6466231..214bcbef0c271 100644
> --- a/drivers/mfd/sprd-sc27xx-spi.c
> +++ b/drivers/mfd/sprd-sc27xx-spi.c
> @@ -61,6 +61,7 @@ static const struct mfd_cell sc2730_devices[] =3D {
>  	MFD_CELL_OF("sc2730-efuse", NULL, NULL, 0, 0, "sprd,sc2730-efuse"),
>  	MFD_CELL_OF("sc2730-eic", NULL, NULL, 0, 0, "sprd,sc2730-eic"),
>  	MFD_CELL_OF("sc2730-fgu", NULL, NULL, 0, 0, "sprd,sc2730-fgu"),
> +	MFD_CELL_NAME("sc2730-regulator"),
>  	MFD_CELL_OF("sc2730-rtc", NULL, NULL, 0, 0, "sprd,sc2730-rtc"),
>  	MFD_CELL_OF("sc2730-vibrator", NULL, NULL, 0, 0, "sprd,sc2730-vibrator"=
),
>  };

[Severity: High]
This isn't a bug introduced by this patch, but do the existing MFD cells for
SC2731 regulators and poweroff fail to bind to their respective drivers due
to naming mismatches?

The sc2731_devices array creates MFD cells named "sc2731-regulator" and
"sc2731-poweroff". However, their corresponding platform drivers
(drivers/regulator/sc2731-regulator.c and
drivers/power/reset/sc27xx-poweroff.c) set their .name fields to
"sc27xx-regulator" and "sc27xx-poweroff", respectively.

Since neither driver provides a platform_device_id table to map the
SoC-specific names, does the platform_match() string comparison fail?

Would this leave the SC2731 hardware without regulator control and poweroff
functionality since the MFD core instantiates these platform devices, but
they never bind to their drivers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-sc2730-reg=
ulators-v4-0-1ac8a3b5ed82@abscue.de?part=3D3
