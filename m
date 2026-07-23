Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA54E3EE1C7
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796685; cv=none; b=jR1CW/AzvxReFVD+SSYujHUMoVexKUxvHFhe+Gu6rryApHA6rI5ctxqfuigNVw4KTROh0IXnf5ZHAjL6HGSIR1ikIlH0HQg3dc1wNHJHHj+F2sBcPA7WIG7SVcMIUmaDl2+XAm2SSy/Co5SC6DxLqczzK6Zt3Oug5SlHWNQbFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796685; c=relaxed/simple;
	bh=Lpgm0tR2fQjHwzmjAsV8NAG6MPczuI1qIgbsWDPU5gI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lxea4FFTFYHLWceqEgEKF7sHQ4AOItKQwrtSpLM+epwvtVRMATrKL7Fv28zFXgALPGIKcmrGW7tDsqxu4niIqb7iq9XcWgsDaOtf++YzsSwxR1aQHMi62Tl1c0ABvYsC4GY+xW9SNGfl4AQ/ohYdxVEo9XrrGOaArb7CQHqyQds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMi6Ax1h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMi6Ax1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30FF1F000E9;
	Thu, 23 Jul 2026 08:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784796684;
	bh=pumhOobUJLwDRCQKNp3FSoNTBvv8anzpv5yT/B3k7EY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMi6Ax1hWbYYZu6h4mVRLbAryTB8132EEQlxsN2OaMK3JLA6F9zgmD+cBxhXy2gVP
	 sYEW2GHQyZnlzNjoRGyh/aSrFfHZ+MVO4BF2QPVj4t6PPaTywd+AAwffCjYxDs+MeV
	 0ilDxWL50Sbb+KDkb/NHLo2mEQpbfRqLDHL7LzOXahwhtLKjXkIZTl/NzDBi8Tf3VQ
	 vOYqPLELle+474pYxt8k5X/0ErkiU7lCbPJ5f1vSaFybnI/go/V8uuRjoIOJuVlIvu
	 dCV7lcOIZjRhUiTckTGVzgwX8sqS7UNW1lPTe39L/rk3h+x2UEXujb1ansKZ21kztR
	 rexy0EfRrCt6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: es8316: Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-es8316-regulator-next-20260722-v1-2-721f757879a0@thundersoft.com>
References: <20260723-es8316-regulator-next-20260722-v1-0-721f757879a0@thundersoft.com>
 <20260723-es8316-regulator-next-20260722-v1-2-721f757879a0@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 08:51:23 +0000
Message-Id: <20260723085123.F30FF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The regmap lacks cache-only protection while regulators are disabl=
ed, allowing physical I2C access to an unpowered device.
- [High] Regmap cache becomes permanently out-of-sync with hardware after c=
omponent unbind/rebind due to newly added unhandled power loss.

Pre-existing issues:
- [High] Unchecked return value of regmap_read() leads to usage of an unini=
tialized stack variable in the IRQ handler.
--

--- Patch [2]: [PATCH 2/2] ASoC: codecs: es8316: Add regulator support ---
commit 8810711bae01652cebd6d01e2ef62b85b877ad30
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>

ASoC: codecs: es8316: Add regulator support

ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs. Request the
supplies during I2C probe. Enable them before enabling MCLK and accessing
the device registers, and disable them on probe failure and component
removal.

> diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
> index 3abe77423f29b..904056b2569a5 100644
> --- a/sound/soc/codecs/es8316.c
> +++ b/sound/soc/codecs/es8316.c
[ ... ]
> @@ -767,10 +778,16 @@ static int es8316_probe(struct snd_soc_component *c=
omponent)
>  	if (!es8316->mclk)
>  		dev_warn(component->dev, "assuming static mclk\n");
> =20
> +	ret =3D regulator_bulk_enable(ES8316_NUM_SUPPLIES, es8316->supplies);
> +	if (ret) {
> +		dev_err(component->dev, "unable to enable supplies\n");
> +		return ret;
> +	}
> +

[Severity: High]
Does this leave the regmap cache permanently out-of-sync with the hardware
after a component unbind and rebind?

When the component is unbound in es8316_remove(), regulator_bulk_disable()
cuts power to the hardware, wiping the hardware register state. However, the
regmap cache survives because it is tied to the persistent i2c device. When
power is restored here during a rebind, the hardware resets to defaults, but
because regcache_mark_dirty() is not called, subsequent regmap updates that
match the stale cache will be skipped.

[ ... ]
> @@ -800,6 +822,7 @@ static void es8316_remove(struct snd_soc_component *c=
omponent)
>  	struct es8316_priv *es8316 =3D snd_soc_component_get_drvdata(component);
> =20
>  	clk_disable_unprepare(es8316->mclk);
> +	regulator_bulk_disable(ES8316_NUM_SUPPLIES, es8316->supplies);
>  }

[Severity: High]
Is the regmap missing cache-only protection while the regulators are
disabled?

The regmap is initialized in es8316_i2c_probe() and persists until the i2c
device is removed. When the hardware is powered down here, can a read via
the regmap debugfs interface attempt physical i2c accesses to the unpowered
device?

[Severity: High]
This isn't a bug introduced by this patch, but does es8316_irq() use an
uninitialized stack variable if the i2c read fails?

sound/soc/codecs/es8316.c:es8316_irq() {
	...
	unsigned int flags;

	mutex_lock(&es8316->lock);

	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
	if (flags =3D=3D 0x00)
		goto out;
	...
}

If a transient i2c bus error causes regmap_read() to fail and return an
error code, flags remains uninitialized. Will the function then evaluate
garbage data from the stack to determine the jack status?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-es8316-reg=
ulator-next-20260722-v1-0-721f757879a0@thundersoft.com?part=3D2
