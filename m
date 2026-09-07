Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6F14F0538
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 18:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788805216; cv=none; b=XGpN1Z59TMSsEfHMJ4fFJ/wsZ5L88BXkRb0ZrifCyh3QFXv9C8gH0YhExzf7my0fPXS12pFIZjfEflCS35m6NiylbDQ1k8oFTwbY8G5x7qd/N9EnJbkmbJVwhMOpCJdNeqprMM95VngBPw+qfwc7R/nyhDIh77KvtOdkUMr8Wy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788805216; c=relaxed/simple;
	bh=BmVphEJ+LrpBoykzWRCT5zIKyni6Vp1LZk7+yZ4QPBM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iuc/+Jt5U0CfnYhegzERDg7dJ1CwO4d9yKUFhOkw4QYUK5ivIcgRFtNtxpuC46uRrJFdel/T5BuwURcYdMMP9ryvgfHgGNt7NLGlW+jt5cM0E/zhQegFCFG8n0MNKpjMGlYhXBgu/lD1mK6QuOlFjdnQLi8la81i4pNFjm3/5/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4a0KAlR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4a0KAlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC481F00A3A;
	Mon,  7 Sep 2026 18:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788805208;
	bh=y6dyyJNeLFWfRj3g5/0pUvMvJ9Ax4GF/nHZ716jLQPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L4a0KAlRkr5i+OSiUs/6AtY4JI1jp+9gFn/jEJAmOeFTRgvZTzwo4f6ONLYQIgU16
	 TZmeh5HIHUERIjb6X2BNgsu365sdM4gBK5T8bxW8gBZIhl06Us+QOvoYD7wT0Ran7l
	 MndGAMfJj9I034x0cRbyaEncYnIYhRwgxmbamCq4CzcJfTUNFazGZ6/9b7jcu0rmk6
	 sq1Q8WCyLUWXi8VbIWgov+KxQmPjF7x6zC2RHS6rqfLaRvD84IniSyPpwoQJJyT8e4
	 0YZHroCNC9enCa3NV9oNDQZsUfZg2K1WZgb0djDjpnY92bcpCMtshe5PJWMEVr6UBI
	 BTbx93A5t5V3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/5] ASoC: codec: adau1977-i2c: Add OF device match
 table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-nord-asoc-driver-support-v1-1-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-1-997d3b20cf43@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 18:20:08 +0000
Message-Id: <20260907182008.7AC481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing Match Data / ACPI PRP0001 Breakage
- [Medium] ACPI PRP0001 Compatibility broken by `of_match_ptr()`
--

commit de095d944f1c821e3699bdad1f08a37eaabe1d3f
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: codec: adau1977-i2c: Add OF device match table

The ADAU1977 I2C driver lacks an OF device match table, preventing
it from binding to codec instances described via Device Tree. Systems
using compatible strings such as "adi,adau1977", "adi,adau1978", or
"adi,adau1979" fail to probe the driver as a result.

> diff --git a/sound/soc/codecs/adau1977-i2c.c b/sound/soc/codecs/adau1977-=
i2c.c
> index d1c6c4ddf5063..9f54fa8375b15 100644
> --- a/sound/soc/codecs/adau1977-i2c.c
> +++ b/sound/soc/codecs/adau1977-i2c.c
> @@ -34,9 +34,18 @@ static const struct i2c_device_id adau1977_i2c_ids[] =
=3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, adau1977_i2c_ids);
> =20
> +static const struct of_device_id adau1977_i2c_of_match[] __maybe_unused =
=3D {
> +	{ .compatible =3D "adi,adau1977" },
> +	{ .compatible =3D "adi,adau1978" },
> +	{ .compatible =3D "adi,adau1979" },

[Severity: Medium]
Will this cause ADAU1978 and ADAU1979 devices enumerated via ACPI PRP0001
to be incorrectly initialized as ADAU1977?

Without the .data field in the match table, device_get_match_data() returns
NULL. In adau1977_i2c_probe(), the chip type is determined by calling
i2c_get_match_data().

If device_get_match_data() returns NULL, i2c_get_match_data() falls back to
i2c_match_id(). On ACPI PRP0001 systems, client->name is generically set
(e.g., PRP0001:00), which fails to match legacy I2C IDs like "adau1978",
causing i2c_match_id() to also return NULL.

When cast to enum adau1977_type in adau1977_i2c_probe():

	return adau1977_probe(&client->dev,
		devm_regmap_init_i2c(client, &config),
		(uintptr_t)i2c_get_match_data(client), NULL);

NULL evaluates to 0, which incorrectly maps to ADAU1977 for all devices.

Should we include the appropriate .data fields here so they are correctly
identified?

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, adau1977_i2c_of_match);
> +
>  static struct i2c_driver adau1977_i2c_driver =3D {
>  	.driver =3D {
>  		.name =3D "adau1977",
> +		.of_match_table =3D of_match_ptr(adau1977_i2c_of_match),

[Severity: Medium]
Will this break hardware enumeration entirely on ACPI systems using PRP0001
if the kernel is built without CONFIG_OF?

The ACPI core uses the of_match_table to match compatible strings for
PRP0001-enumerated devices on non-DT systems. Because of_match_ptr() is
used here, the table pointer is explicitly nulled out when CONFIG_OF is
disabled.

Since __maybe_unused is already applied to adau1977_i2c_of_match, can we
drop the of_match_ptr() wrapper to ensure it probes correctly in all
configurations?

>  	},
>  	.probe =3D adau1977_i2c_probe,
>  	.id_table =3D adau1977_i2c_ids,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-nord-asoc-=
driver-support-v1-0-997d3b20cf43@oss.qualcomm.com?part=3D1
