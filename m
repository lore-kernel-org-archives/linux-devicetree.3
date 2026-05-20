Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9B73F4114
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296603; cv=none; b=ekoi6A+uD0oiaWyohNbiSbINJmziKM+P6C06ZRrF8zV1PKK0eMzxKsN6SLzsbkN97rT6118yPguIx2b0j2FcW2Qbg8qGyDrAA6zPUSw0uMX4/4EXTC+x4drYg6S6cKqP5diLaxAtPlTjBZP8ZFLpdMjDlM3RMjztOWDK9IpPZ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296603; c=relaxed/simple;
	bh=V05fA5wMWovZbR5ons36e9gJtJ17rsaO52RQsGdKtP8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hK4FUseqQAjIuArY8kVQdTvlDgJulXbE9mKKseGntG3tqxPfgcMwWCSwbyDtrcVvEJeb+JZU0rYFpseHswUIZr9DatAW4Ud0tWIboSQ3UQmunBCBkNMxWYeC/BQOgaZgPi6QoUWTJ0DCrAILrCthUAGh+8/Hzrh5pvUge2ur01c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlCiIqm1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlCiIqm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15271F00894;
	Wed, 20 May 2026 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779296602;
	bh=v303taeh6Gc9dHuXH/32pddfGtpDRLGNs0ejPPPJ+SU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nlCiIqm1e8XYhsxal49YBS2pYA6BWREtwROH0HBQ5njLN4yx4WS+9wCQ9RAhZZIwa
	 rNKoE962GDsQvUUAPO2d7MmLy9nWlh6gH2l9mCf3aEQjgH4tvf09eplfucnprIqfQy
	 ZmzfCKkVtGTTf24e5Fw7trUnS+k6L7p/T1C+0pW3EyyEbxO2CrIvjpvMsVQ+zIKXEF
	 nO0rNkfRCmXYAo6KCT/DGMynshQAHNXVrMTJ8XXr1uSyRKTtmzq9xuAo3gtRMyqYuZ
	 fdzsZCaGADY5prXle6W/Vy3Zb83WgsE0VmSmohjwfDN8A/P5UtV3pMuJ7+QrDMkH2s
	 XOClloAdLH31A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] rtc: ds1307: Add driver for Epson RX8901CE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fredrik M Olsson" <fredrik.m.olsson@axis.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520-ds1307-rx8901-add-v2-3-e069ea32e1db@axis.com>
References: <20260520-ds1307-rx8901-add-v2-3-e069ea32e1db@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 17:03:13 +0000
Message-Id: <20260520170313.C15271F00894@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Trickle charging is not explicitly disabled when requested, posing=
 a battery safety hazard.
--

commit 1b11fec487efda4e55a4152eb696205b964ae2cd
Author: Fredrik M Olsson <fredrik.m.olsson@axis.com>

rtc: ds1307: Add driver for Epson RX8901CE

This commit adds I2C RTC driver support for the Epson RX8901CE. It includes
support for time reading/writing, Backup Switch Mode (BSM) configuration,
trickle charging, and battery voltage low status detection.

> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index bf42c250ea7d1..23dd104aa2be7 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c

[ ... ]

> @@ -568,6 +717,26 @@ static u8 do_trickle_setup_rx8130(struct ds1307 *ds1=
307, u32 ohms, bool diode)
>  	return setup;
>  }
> =20
> +static int do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms __alw=
ays_unused, bool diode)
> +{
> +	int ret;
> +	unsigned int setup;
> +
> +	ret =3D regmap_read(ds1307->regmap, RX8901_REG_PWSW_CFG, &setup);
> +	if (ret) {
> +		dev_err(ds1307->dev, "Failed to read PWSW_CFG register\n");
> +		return ret;
> +	}
> +
> +	/* Enable low battery voltage detection */
> +	setup |=3D RX8901_REG_PWSW_CFG_VBATLDETEN;
> +
> +	if (diode)
> +		setup |=3D RX8901_REG_PWSW_CFG_CHGEN;

[Severity: High]
If diode is false, does this code need to explicitly clear the
RX8901_REG_PWSW_CFG_CHGEN bit?

Because RX8901_REG_PWSW_CFG is a battery-backed register, a previously
set charge enable bit (for example, from a bootloader or a prior warm
reboot) might remain set even if trickle charging is explicitly disabled
by the system configuration.

Could this lead to a physical safety hazard by unintentionally charging a
primary (non-rechargeable) battery if the bit is not explicitly cleared
using something like setup &=3D ~RX8901_REG_PWSW_CFG_CHGEN?

> +
> +	return setup;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-ds1307-rx8=
901-add-v2-0-e069ea32e1db@axis.com?part=3D3
