Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAAC3B1B3
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 04:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786162399; cv=none; b=Ezb4vnmZFaUev7tjn8KZGFbRB9mkNm24HFCGJzzhcE5Ls4OTCg3OBauMNlVm1dVB7EaQFJz7nXpLW+S5vocVIGCBZCytjhgCNOFf8nH6oR3yFNdEfE+1h97Y8D/7Eh5PaJqBeOW+o2XO+n+sB8iJ8Y4bJiHY3CnGREbF8HFjsvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786162399; c=relaxed/simple;
	bh=+fk2ccZ+hH1Bkb4d1LQCAuL5dTtcASXL38Mqdxh57nM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WCnQlfvJnUqU3HdKfa3HTpeMx3AJko8Jwrl79hAFeANM4qYlINh0bhyZJ7KPZShXnyleF3BnHI6DeOrUDn0/UDJX/ClwRPFjB+Bnzc7s/Idcw+BRxkdQO0fNA6kbTC4vLVDw3iqKrs3UDBfbdnPTHkKY2hwQubYeuVnwI2to9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxZ6kg4b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxZ6kg4b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9981F000E9;
	Sat,  8 Aug 2026 04:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786162397;
	bh=+eINqu0JJynMBwg6QYA9VqlYB7EeE8WPF1PW7+Nnjys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PxZ6kg4bbY1742HvR7KI2vKbx+5hNTKE1qOTyti7BIkUI2y1+UBuHAPtqDPDrsdz5
	 iyT0Qa+kyK5oH3WnFL03mUMLg6An/SLBCb1nf1OrnOFiI3CQ1AGR66cPDYlirW0kIN
	 /9hIaC549p+kvSoSz58SxMgMvZLfe14c/kJCfhl9bdyR2cvBXZ9Mvs0Z2nMFBxJRy6
	 JLo9usqWS0vUSh8ewUZZorQHEo2vy7wOrLPEAMs4sIGO51qOMOpaEVosBnHVXyzQF7
	 MVlA2zlzHR9uEuFtNsiVU8+LYjq3qLuHhYC5Gbd5e95DaPSYLmQe3YSFONT9B6X7q8
	 sueciDCc1S+Sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/9] iio: adc: ti-ads1262: support excitation
 currents
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-ads126x-v3-6-f89925d72792@gmail.com>
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-6-f89925d72792@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 04:13:16 +0000
Message-Id: <20260808041317.4E9981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] IDAC excitation currents will not work because the ADC's internal =
voltage reference is never enabled.
- [Low] Build failure due to incompatible pointer types when passing 'ads12=
62_idac_mags_nA' to 'ads1262_find_one()'.
--

--- Patch [6]: [PATCH v3 6/9] iio: adc: ti-ads1262: support excitation curr=
ents ---
commit 62f1b6149a86f48a45e748f65baba909e175b7ee
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: support excitation currents

This commit adds support for two IDAC excitation current sources in the
ti-ads1262 driver. It allows routing IDAC1 and IDAC2 to specific pins and
configuring their magnitudes via device tree properties.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c
[ ... ]
> @@ -456,6 +482,22 @@ static int ads1262_channel_enable(struct ads1262 *st,
>  	if (ret)
>  		return ret;
> =20
> +	val =3D FIELD_PREP(ADS1262_IDACMUX_MUX1_MASK, chan->idac_mux[0]) |
> +	      FIELD_PREP(ADS1262_IDACMUX_MUX2_MASK, chan->idac_mux[1]);
> +	ret =3D regmap_update_bits(st->regmap, ADS1262_IDACMUX_REG,
> +				 ADS1262_IDACMUX_MUX1_MASK |
> +				 ADS1262_IDACMUX_MUX2_MASK, val);
> +	if (ret)
> +		return ret;
> +
> +	val =3D FIELD_PREP(ADS1262_IDACMAG_MAG1_MASK, chan->idac_mag[0]) |
> +	      FIELD_PREP(ADS1262_IDACMAG_MAG2_MASK, chan->idac_mag[1]);
> +	ret =3D regmap_update_bits(st->regmap, ADS1262_IDACMAG_REG,
> +				 ADS1262_IDACMAG_MAG1_MASK |
> +				 ADS1262_IDACMAG_MAG2_MASK, val);

[Severity: High]
Will the IDAC excitation currents function without the internal voltage
reference being enabled?

The driver configures the IDAC multiplexer and magnitude here in
ads1262_channel_enable(), but the ADC hardware physically requires the
internal reference (INTREF bit in the POWER register) to be active for the
current sources to output current. It appears this bit is never set in the
driver initialization or channel enable paths, leaving the internal
reference disabled by default.

[ ... ]
> @@ -1150,7 +1192,58 @@ static int ads1262_parse_channel_node(struct ads12=
62 *st,
[ ... ]
> +		ret =3D ads1262_find_one(ads1262_idac_mags_nA,
> +				       ARRAY_SIZE(ads1262_idac_mags_nA), mags[0]);

[Severity: Low]
Could this result in a build failure?

The ads1262_idac_mags_nA array is declared earlier in the file as a
const u32 array, but the ads1262_find_one() function explicitly expects a
const int pointer argument.

Passing an unsigned pointer where a signed pointer is expected triggers a
-Wincompatible-pointer-types warning. In modern kernel builds, this warning
is promoted to a fatal error and breaks the build.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-ads126x-v3=
-0-f89925d72792@gmail.com?part=3D6
