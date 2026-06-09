Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C933FE36
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974396; cv=none; b=kYXcl6HBNwGvwNTO+IYT7yKmRorH4wKC5tfOmOXYhXyJVd4u8oLcbGC1ajtc/SqVojro6mWAD1Vl8ci6+AODEqxZHT5EjFllaNw5ysLI1pmOGWZgscR2au3Mgos+Hg+a/sWlkJ+Y1rSoojBk2/VuvQYJNUpNdrTnkqUewOvGmAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974396; c=relaxed/simple;
	bh=szh1CoizDTSxCp9v3664a6ydl/yN5klyMP/P7vW3mHc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=itjEIOUiPeMt14Iubts14mo1PJLK4ka7AbhHyyo1hMPkd+dN5ei8zB8EvjzLeU1Xsh+gENnzNKlzvmf6VK5VIyggW+Jl4+ab7SVEVqdFGg/zsqSCGOjiJqFXaQhKMedtozG0Co3Jhh5714YOZEZFnRKQwOFNWwZIEykDXKo85gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvNaNQaE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvNaNQaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113F61F00893;
	Tue,  9 Jun 2026 03:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780974395;
	bh=nwnyvky9KaGWlyB5DU9iNNiKHsHjesrrAObPYC+0t2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FvNaNQaE2eXf04CrtFqkhstC24kx1ZbYHuyXNATStkOc+S8SKSOgioETmmnFAtvAH
	 gLkycC40aN9n2bi5HQK8rHreZpUIz9V3eMNiq2l5Gaxa0JJozm5QK8gbgoDxEQ3yEw
	 Ahks30AK2Tzy6iV9gycNHAToMk4cTKpGE/ccIxvmW+/85HfgdefuZ5MAvpKusl6o7K
	 xIyCmwQL06CV2Nr4gjJFqhp4Yvmtj8+rmODobi9AumaXMC3+FJIwrAd9RR/I4sj5c5
	 IBRBk7Fgb9FxpEsyR34mqurUzjwARTGpcU+7EVlfblOWENDOhLGpoc5KAQHMkEq1Kd
	 Nc7CQrZ9y8jyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609025605.16945-7-zhangyi@everest-semi.com>
References: <20260609025605.16945-7-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 03:06:34 +0000
Message-Id: <20260609030635.113F61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added INPUTL MUX and INPUTR MUX controls will lose their=
 user-configured state upon system resume, defaulting back to 'Normal' and =
causing the ALSA DAPM graph to desync from the physical hardware state.
--

commit c098d0e96724f95fd767bddd48bd70af52c8b3e9
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX

This commit adds INPUTL MUX and INPUTR MUX controls to the audio routing
graph for the ES8389 codec.

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
> +
> +static const struct snd_kcontrol_new es8389_adcl_mux_controls =3D
> +	SOC_DAPM_ENUM("INPUTL MUX", es8389_adcl_mux_enum);
> +
> +static const struct soc_enum es8389_adcr_mux_enum =3D
> +	SOC_ENUM_SINGLE(ES8389_ADC_MODE, 4,
> +			ARRAY_SIZE(es8389_adcr_mux_txt), es8389_adcr_mux_txt);

[Severity: High]
Will the user's MUX selection be lost during system suspend and resume?

These MUX controls are backed by the ES8389_ADC_MODE register. If this
register is treated as volatile by the regmap subsystem, its value will not
be saved in the cache.

During system resume, if power was lost, es8389_init() unconditionally
clears bits 4 and 5 of ES8389_ADC_MODE, forcing the MUX back to 'Normal'.
Because the register is volatile, regcache_sync() will skip it and fail to
restore the user's selected configuration.

Does this cause the ALSA DAPM graph to desynchronize from the physical
hardware state, potentially resulting in incorrect audio routing until the
control is manually toggled again?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609025605.1694=
5-1-zhangyi@everest-semi.com?part=3D6
