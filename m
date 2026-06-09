Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFD1364E9E
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780975316; cv=none; b=egQ9DObuhVBHNom86ACRzdIFS3Dub0bxiCfY13deQPw5+CtJvRCDkxsJs/v+lPg1t44y+7PPyth+Vy2j6ubcc3qxhjP9X5vaGMs5YYdIviUNuwl3+/QzqN5xj2KpzPFV4JLil+QcMhbP5PIDzr4i3smXNrpT5Zk15NcRi3wRFGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780975316; c=relaxed/simple;
	bh=h0ZvqBueRkR04c8uIniGRaovWhVJwiZwr8IqhxA0zSY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EgQow/bW+52Us0oqhF+9Q+MjNal8vRfU7Rex+SkAf6rsBcCVTuDCJqSsjE9+fzqEUPcR1IUQrANMFMIfimiNoEAc96UA7FsLXtzN7dQSvhGh1sOuFNOImQxaBbKI1t2/mCADw00I49wplej//aMFnvIjoI5DNtLjJg6Jtp7oSsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJsHR21W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJsHR21W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AC71F00893;
	Tue,  9 Jun 2026 03:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780975315;
	bh=u8LZMZLyCJbs6cg6mw+UUnAiGAvl588xcNAP3WrFkA0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QJsHR21W/qkV2+TFqZGmivMXlNlbykt+5bCqA6ZWX54IUDkoTgBnXXy2aYtDRzf8j
	 +f0k9DmD4+A8mgp0n8qezoW/NEq1LlEKuk2shVh5lhkNepx2gxdlHUAzLeOIcKkfqf
	 pzGwFNuJKYUHU0mQOcH5UtilGamBaOOj9wLya621ppOJwRkIivZ727Y65zuAZpeKZJ
	 PnM5zPxBa78JaKilw0DWWY8jDvm6ntWiKlakcy7wj2hHY1uFJUdOdmB6Hs/WtBvRND
	 qCBO7Zr+mi9lvrFKim7L4fVmA343Do0MLXeTHM46nuAkoe0y1jVa6h4f9obGUmhf1c
	 BYYb6lkm3CUIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609030623.17404-7-zhangyi@everest-semi.com>
References: <20260609030623.17404-7-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 03:21:55 +0000
Message-Id: <20260609032155.65AC71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] User configuration for the newly added ADC MUXes is permanently =
lost across a suspend/resume cycle if the device loses power.
--

commit 244b36be42543e8998257a345f41703019f1e7ea
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX

This commit adds INPUTL MUX and INPUTR MUX to the routing table for the
ES8389 codec.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index d1bcbbfcd4754..5e4afafd9be63 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
[ ... ]
> @@ -191,6 +201,20 @@ static const unsigned int es8389_pga_values[] =3D {
>  	1, 5, 6
>  };
> =20
> +static const struct soc_enum es8389_adcl_mux_enum =3D
> +	SOC_ENUM_SINGLE(ES8389_ADC_MODE, 5,
> +			ARRAY_SIZE(es8389_adcl_mux_txt), es8389_adcl_mux_txt);

[Severity: Medium]
Will the user configuration for these new MUXes be lost across a suspend
and resume cycle?

Because ES8389_ADC_MODE is omitted from the non-volatile list in
es8389_volatile_register(), it is treated as volatile and bypasses the
regmap cache.

When the device resumes from suspend and power is lost, es8389_resume()
calls es8389_init(), which overwrites this register with default values:

sound/soc/codecs/es8389.c:es8389_init() {
    ...
    regmap_write(es8389->regmap, ES8389_ADC_MODE, (0x00 | ES8389_TDM_MODE));
    ...
}

Since ES8389_ADC_MODE is volatile, the subsequent regcache_sync() will skip
it, leaving the routing configuration permanently clobbered. Does
ES8389_ADC_MODE need to be added to the non-volatile register list so the
MUX state can be properly restored?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609030623.1740=
4-1-zhangyi@everest-semi.com?part=3D6
