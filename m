Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392331F996
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974544; cv=none; b=BeLworIX2dxehD1+3HX6+1/JQaLprvuqDB1OuoaT2ksoez/BK6xZpDRw2hEKzeryu9L9JFpp2aolMG3401W2Jrpr7jn66JUvFiksbRvI8MxM6xUbejm5YDKpNbdNdRmIyMFlET7xEsxMyjgbdiz+2GGpDyjgwdt6SfrsrXdqeyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974544; c=relaxed/simple;
	bh=HY/IPPzbiax8P/WmaF1+Ixctbj3iwCYNnZJ9A2xAR5I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wo8npPm9+xjNUe0YNq2wAnkjJoDlplw0bZVeSCjYxc81fZD4cnY1b/E5Lmx4kuPlsDegrzKXsJKlZ1lVhstn8Wtl5LDa0LAWstWtlM1d//sIIj8MLr/Rzj5i8FdE0joEtdzI8QJdHk7FPYOVCSdWebmRThTQOCU+CdDClF2TmJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itSV/Nsh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itSV/Nsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F1D1F00893;
	Tue,  9 Jun 2026 03:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780974542;
	bh=VO6+1wMgXB9CX04KUzqfpbh04WGM4ix/lLClMja7+SQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=itSV/Nshz7by9Hq+cWjUU5b6AF85c07lkFTRlzrqE3hDXBu2cP0aL2mRf9X64Kxjm
	 ndwKgFNIYVYyRDFCt3Im7BnEQGSaRoybxvY+docE46WQhAf5KesAEg7/9aWqZU+QdP
	 rJ31pV/CWb2wWSn2vrJN2TXEtZPdYIdeHSDkX6ucSRpWOgfZRzatal/Xep5JRzRrm8
	 uI4WchKOqdFOvlou3Z+lcImp2yr4wNzwU/nIiysX3AAX3RSodIYgl3Gmjybkz0e+YW
	 efoZWWPVRCFJajkKJK2U98E6ckCM6ZxqAwbFi4/IvfKYKwAlrZSgbGmu9G8wWMX8ik
	 d3g6b7h2/XU/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] ASoC: codecs: ES8389: Modify volatile_register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609025605.16945-2-zhangyi@everest-semi.com>
References: <20260609025605.16945-2-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 03:09:02 +0000
Message-Id: <20260609030902.A5F1D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete volatile register list leaves critical configuration un=
-cached, causing state loss on resume.
- [High] regmap cache is clobbered with hardware defaults during resume, nu=
llifying the preservation of user settings.
--

commit 18a4d58b5b0816359115dead13dc5872d2f0a08a
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Modify volatile_register

Mark some registers that are not volatile as false.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 449d9574b03a8..9c816491648c7 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
> @@ -50,10 +50,29 @@ static const char * const es8389_core_supplies[] =3D {
>  static bool es8389_volatile_register(struct device *dev,
>  			unsigned int reg)
>  {
> -	if ((reg  <=3D 0xff))
> -		return true;
> -	else
> +	switch (reg) {
> +	case ES8389_ADC_HPF1:
> +	case ES8389_ADC_HPF2:
> +	case ES8389_ADCL_VOL:
> +	case ES8389_ADCR_VOL:
> +	case ES8389_MIC1_GAIN:
> +	case ES8389_MIC2_GAIN:

[Severity: High]
This is a pre-existing issue, but does making these registers non-volatile
cause their cached user settings to be clobbered during resume?

In es8389_resume(), regcache_cache_bypass(es8389->regmap, false) is called
before invoking es8389_init():

sound/soc/codecs/es8389.c:es8389_resume() {
    ...
	regcache_cache_bypass(es8389->regmap, false);

	if (regv =3D=3D 0xff)
		es8389_init(component);
    ...
}

Because caching is enabled during es8389_init(), its explicit writes to the=
se
registers overwrite the user's settings in the regmap cache with hardware
defaults:

sound/soc/codecs/es8389.c:es8389_init() {
    ...
	regmap_write(es8389->regmap, ES8389_ADC_MUTE, 0xC0);
    ...
}

When regcache_sync() subsequently runs, it syncs these defaults instead of =
the
user's configuration, which silently mutes the microphone and resets its ga=
in
upon every resume.

> +	case ES8389_DACL_VOL:
> +	case ES8389_DACR_VOL:
> +	case ES8389_ALC_ON:
> +	case ES8389_ALC_CTL:
> +	case ES8389_ALC_TARGET:
> +	case ES8389_ALC_GAIN:
> +	case ES8389_ADC_MUTE:
> +	case ES8389_OSR_VOL:
> +	case ES8389_DAC_INV:
> +	case ES8389_MIX_VOL:
> +	case ES8389_DAC_MIX:
> +	case ES8389_ADC_RESET:
>  		return false;
> +	default:
> +		return true;

[Severity: High]
This is a pre-existing issue, but does this default case incorrectly omit
essential configuration registers?

It leaves important configuration registers like ES8389_MASTER_MODE,
ES8389_ADC_MODE, ES8389_DMIC_EN, ES8389_ADC_FORMAT_MUTE, and
ES8389_DAC_FORMAT_MUTE as volatile.

Because volatile registers bypass the regmap cache, any user changes, such =
as
DAI formats and DAPM MUX selections, are not cached.

When es8389_init() writes default values to these registers, regcache_sync()
skips them, so the user's MUX and format configurations are never restored,
breaking audio routing.

> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609025605.1694=
5-1-zhangyi@everest-semi.com?part=3D1
