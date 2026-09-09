Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40867581229
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964320; cv=none; b=Wtkli5tKMGlEw9fDf5ZIcyH/AQrle1yCAke/Xb+yjVoO6+fy/HxhT4/KlSoIWfPr9KHAaaEg+T4/AudXrPc+kn1/VJ9BnjNPIdAhRACgIWtFJ93iCSW0raJXPToFaZ8muxpqR2/Hzp+m9DbU+VxFwaY2EYrGYDVYFRPl5V3B7wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964320; c=relaxed/simple;
	bh=AoO4lMhxyurG52hxr46Ql5voA77xEqAXcW2oN1SBC+w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RZRBpEBuOfN9RQx5Wra03Ijhh+2TdOMhaW1Mp3E0UmagIZT4ggBl7P4Tp26VQGd1dG4n4rzd/0KrnUApL2UZ6x5V/ahAHUuypp848fR/gRLERe9r7Ewcq+K0oZmTWzYWKUbfr5PxDZqo5p+pEPPFq1hYWVSkkwfZpbKPUKdg6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4ZSWqRT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4ZSWqRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CB01F00A3E;
	Wed,  9 Sep 2026 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964319;
	bh=jsUxHwM3KvtUa57d2GRR0o0Q21VcbKYNC0d4cWlM2iM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k4ZSWqRTU+HHU/94Qf/fcCttjQfLcS4gi41v5SU2QWu9iDWhX4KSB/zVPLxf7t/Lt
	 dMXh73OTkVc+2ODIHftIItZcSbxDUeu/IBXLTcql8GMx3N7axzJWyXXaCBZhHuujPF
	 3tkKtDof60VZ6j66Oim6aQFZzmIXvm2TUUomldl0RLKH9nHv9UdTSZO39yWFHaKmEM
	 nd1ozVJyQYoNwMZyJM2BKU618EiRr8cq5w4WsYHwi6J5UU8xF4F2YdOw/wR7JDUn0p
	 e+sj/09ubrEc8G2nw3xjMACOsfgSjsJxZ2pVtqF1V1dlzcy0im9VuqMGgid9Hwcw5I
	 Ws7AlL1eDmRXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/10] iio: dac: mcp47feb02: Increase EEPROM
 Programming Write Cycle Time
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909-mcp47feb02_refactor-v5-4-8b67bcab93d1@microchip.com>
References: <20260909-mcp47feb02_refactor-v5-0-8b67bcab93d1@microchip.com>
 <20260909-mcp47feb02_refactor-v5-4-8b67bcab93d1@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:31:58 +0000
Message-Id: <20260909143158.C1CB01F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Timeout value is incorrectly set to 1500 ms (1.5 seconds) instea=
d of the intended ~15 ms.
--

commit a4c6e4bb178f8d633d5c95e35f6b2ffcf7e7e711
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: Increase EEPROM Programming Write Cycle Time

This commit increases the EEPROM write polling timeout for the mcp47feb02
driver. The goal is to match the datasheet specifications of 11-16 ms to
prevent -ETIMEDOUT errors and incomplete nonvolatile write cycles.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index 2ee981393aa1a..53a7bf4e71c46 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c
> @@ -449,7 +449,7 @@ static int mcp47feb02_write_to_eeprom(struct mcp47feb=
02_data *data, unsigned int
>  	ret =3D regmap_read_poll_timeout(data->regmap, MCP47FEB02_GAIN_CTRL_STA=
TUS_REG_ADDR,
>  				       eewa_val,
>  				       !(eewa_val & MCP47FEB02_GAIN_BIT_STATUS_EEWA_MASK),
> -				       USEC_PER_MSEC, USEC_PER_MSEC * 5);
> +				       USEC_PER_MSEC, USEC_PER_MSEC * 1500);

[Severity: Medium]
Does this timeout value correctly match the commit message's stated 11-16 m=
s?

Using USEC_PER_MSEC * 1500 sets the timeout to 1,500,000 microseconds=20
(1.5 seconds) rather than the intended 15 milliseconds. In the event of a=20
hardware failure where the EEPROM write never completes, this would block=20
the caller for 1.5 seconds instead of 15 milliseconds.

[ ... ]

> @@ -509,7 +509,7 @@ static ssize_t store_eeprom_store(struct device *dev,=
 struct device_attribute *a
> =20
>  	ret =3D regmap_read_poll_timeout(data->regmap, MCP47FEB02_GAIN_CTRL_STA=
TUS_REG_ADDR, eewa_val,
>  				       !(eewa_val & MCP47FEB02_GAIN_BIT_STATUS_EEWA_MASK),
> -				       USEC_PER_MSEC, USEC_PER_MSEC * 5);
> +				       USEC_PER_MSEC, USEC_PER_MSEC * 1500);

[Severity: Medium]
Does this scaling error also compound the potential delay here?

Since store_eeprom_store() can perform up to 11 sequential writes (8 channe=
ls
+ VREF + POWER_DOWN + I2C_SLAVE), this extended timeout could delay the sys=
fs
write thread for over 16 seconds on a hardware failure where the EEWA bit
fails to clear.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-mcp47feb02=
_refactor-v5-0-8b67bcab93d1@microchip.com?part=3D4
