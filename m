Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDA53624D7
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780975022; cv=none; b=EFHcmKJx9XaVSa/0Iwb7T6MwX8RoU++KPPchvcOh+jU8R/PQhfoVCLGLVfVxxxX24LaDSPCiobSxcu7UpgGhTdqtkpnynmmimP9xQuMZxPBU9XMWjr7Ebfd+3Vyh/0s6oVr8Ya7Hq95EH89sDkgS4JhAzyO+ZDsoSJCaBd9bloQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780975022; c=relaxed/simple;
	bh=bxKcKtPeEqYFN22wn/kaoFNlM0itlmvPBtQ91aOvqVQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qxd1wi7t3t4I+BBNgx6Xb/Lm3jpU5eXRvE+CoxkK4ukR2VARQD0igxaaxayEI6vw1uuuQx+72f7EYrbI0sY5pfzWFGC2IapDLwTM0MYgn6jOQph08Hy9d56PoYpp9LhqdUQi4NxCxx2ymsdyghI7xsw9qfBeLkDk9xtenFi/xuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGx5DwsM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGx5DwsM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C425B1F00893;
	Tue,  9 Jun 2026 03:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780975021;
	bh=Xs4b0WpREqQ2ROFpj8/AiJz+SffdgCHL0TTyqBzyKxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JGx5DwsMODUOGkbq3YyiK7pGI4HF2ueVVCSrc5GSllP1HiopjcPzPTdcnwwdes6v+
	 tA2i5rUhtlrjMN7rRe5Huu4Fz67WF/vm+KISS2wxZoo3d6ZXB4/fPT2bmV9LPYF0yf
	 qLlLi2k9++t1W2h3PStSn6qmJI7k3brYEH44Hutw9aZi+023xfyIwDEw3SJ/UWxHD0
	 slRq2dq+yr+4XdPpIU6DDN9SF2CrRV+Pzih4NHYHvZd3uCftWg9mUPYcvxsXU5ZXHo
	 t2hV7LZpcDAzqcQGCI5MH6GqNDziqzM9HNtOtVda/k+kq78bxRLrAhNHHrKVuIC2RS
	 LI0Sl7g2+eJHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] ASoC: codecs: ES8389: Modify volatile_register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260609030623.17404-2-zhangyi@everest-semi.com>
References: <20260609030623.17404-2-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 03:17:00 +0000
Message-Id: <20260609031700.C425B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The regmap cache for non-volatile registers is overwritten with ha=
rdcoded default values during resume if the device lost power, neutralizing=
 the patch's fix.

Pre-existing issues:
- [High] Critical configuration registers modified during stream setup are =
marked as volatile, causing them to be lost upon suspend/resume.
- [High] The variable `regv` is evaluated uninitialized if `regmap_read` fa=
ils during resume.
--

commit 146c46405cf59e3e0362628efb42fd4f52cff71a
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Modify volatile_register

This patch modifies es8389_volatile_register() to mark a specific set of=20
registers as non-volatile, enabling regcache for them. All other registers=
=20
now default to being volatile.

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

[ ... ]

> +	case ES8389_ADC_RESET:
>  		return false;
> +	default:
> +		return true;

[Severity: High]
This is a pre-existing issue, but does this fall-through prevent critical
configuration registers from being restored by regcache_sync()?

Critical configuration registers modified during stream setup like
ES8389_DMIC_EN, ES8389_ADC_MODE, ES8389_ADC_FORMAT_MUTE, and ES8389_ADC_OSR
remain uncached.

Since the ALSA framework does not re-invoke hw_params on resume, these
registers must be cached and restored by regcache_sync(). Because they are
volatile, active audio streams will fail or lose routing after a
suspend/resume cycle.

> +	}
>  }

[Severity: High]
By newly marking these registers as non-volatile, does this cause the
regcache to be overwritten with defaults during a power-loss resume?

In sound/soc/codecs/es8389.c:es8389_resume(), if the device lost power
(regv =3D=3D 0xff), es8389_init() is called without regcache_cache_bypass b=
eing
enabled:

    regmap_read(es8389->regmap, ES8389_RESET, &regv);
    regcache_cache_bypass(es8389->regmap, false);

    if (regv =3D=3D 0xff)
        es8389_init(component);

Inside es8389_init(), direct regmap_write() calls are made:

    regmap_write(es8389->regmap, ES8389_ADC_HPF1, 0x64);

Because bypass is disabled, these writes clobber the newly added regmap cac=
he
with hardcoded default values. The subsequent regcache_sync() then syncs th=
ese
defaults instead of the user's prior settings, breaking state restoration.

[Severity: High]
This is a pre-existing issue, but can regv be evaluated uninitialized if the
regmap_read fails during resume?

In sound/soc/codecs/es8389.c:es8389_resume():

    regmap_read(es8389->regmap, ES8389_RESET, &regv);
    regcache_cache_bypass(es8389->regmap, false);

    if (regv =3D=3D 0xff)

If regmap_read() fails (which can occur during resume due to bus readiness
issues), regv contains uninitialized stack memory. The subsequent evaluation
against 0xff produces undefined behavior, potentially skipping necessary
device initialization and leading to silent failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609030623.1740=
4-1-zhangyi@everest-semi.com?part=3D1
