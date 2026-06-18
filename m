Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8663B42E9
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772079; cv=none; b=Ag8agibqdkhkU32wkCbTuzFPlPlRXsYvaYdFP+Ko74+9joppTEpEhv/omUJLHv/BFLQ2TlbG5pXRQsdt7akyt+g4XewZuMVaGjchqMdJfzCnItFGIgd8lLB62/3UlyD8y9oNEJNc3Xl8tG+pFVGZztYZwyvAPkGZ64by74p1pqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772079; c=relaxed/simple;
	bh=azaEvRhKENh4NuxoGpcwWEhUr1ILqEyCh0h1getcE5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eIAGBPGhh98xT0Wzb7e4O/EXlhZ60xFq2ki1A6aR8gbQe/A7+ngRhYpGGUnL9Zf6Poqaq91y89nF0r6NJq/zWQxbBxhzyRnzxIXGS1YoQt3foUJGn2nhvUeBRCNMWW9igiJYiOUBIEZO0P4aWA0xymBtwn+DO2k0HfM7GKinCUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eY+BwuWA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eY+BwuWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1BD1F000E9;
	Thu, 18 Jun 2026 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781772078;
	bh=lJJ1ASISe2uB2beywQ5rO64MMViqFHOhAeaYAutIB7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eY+BwuWAqQNxksT89InjOUBZYKrggTMBz1F/iDXoaBSZCw6XlLXx0C+tT2lAeghi7
	 tYIGRF7Kbg46pRZyvoTZoNKKthNa0lOszF3mEiCvhv0qUuzF5ahlcyTZZ9yaFBDppt
	 4hM9+leMSWUQ1WU5cG0iEmlFGXizU0w6QQVWHxgB16h5Mid9A/l6qtMDCT/VHfW/lx
	 UEikm+m/TsgH9O39hK4EH/QVoYp1qGbz2Ujl6aZ22mSwFpURnEV/pW+yFko+6acww+
	 mTn/n3e9uHeL7EasIoqGQNLNXmPU64lMHqxQ+2N1iN6Fzd1prGF3D8oTYbyyf/JxH/
	 A1+jp/FhDD+RQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] ASoC: codecs: ES8389: Modify the initial
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618082842.2778-6-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
 <20260618082842.2778-6-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 08:41:17 +0000
Message-Id: <20260618084118.5B1BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Regulators enabled in component probe are never disabled, leading =
to a refcount leak on module removal.
- [High] Unbalanced clock prepare/enable calls in bias level handling cause=
 clock refcount underflows.
- [High] The return value of `regmap_read` is ignored, leading to the use o=
f uninitialized stack variables if the I2C read fails.
- [High] If the codec was reset during suspend, es8389_resume re-initialize=
s it but fails to turn on the clocks and bias.
--

commit 15d74449bde5fe0d61c65b106c592477686df171
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Modify the initial configuration

This commit modifies the initial configuration for the ES8389 codec by
updating the values written to ES8389_ISO_CTL and ES8389_OSC_CLK during
initialization.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index dc3410459f39d..09257687bb84c 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
> @@ -793,7 +793,7 @@ static void es8389_init(struct snd_soc_component *com=
ponent)
> =20
>  	regmap_read(es8389->regmap, ES8389_MAX_REGISTER, &reg);
>  	es8389->version =3D reg;

[Severity: High]
This is a pre-existing issue, but what happens if regmap_read() fails here?

If the underlying I2C transfer fails, regmap_read() returns an error and
leaves reg uninitialized. This uninitialized stack variable is then blindly
assigned to es8389->version.

This same pattern occurs in multiple places, such as es8389_resume():

sound/soc/codecs/es8389.c:es8389_resume() {
    ...
	regmap_read(es8389->regmap, ES8389_RESET, &regv);

	if (regv =3D=3D 0xff)
    ...
}

and es8389_mute():

sound/soc/codecs/es8389.c:es8389_mute() {
    ...
		regmap_read(es8389->regmap, ES8389_CSM_STATE1, &regv);
		if (regv !=3D ES8389_STATE_ON) {
    ...
}

Should the return value of regmap_read() be checked to prevent using
uninitialized stack variables and causing random device state
misconfigurations?

> -	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x00);
> +	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x56);

[ ... ]

[Severity: High]
This is a pre-existing issue, but does this driver leak regulator references
on module removal?

In es8389_probe(), the core regulators are enabled:

sound/soc/codecs/es8389.c:es8389_probe() {
    ...
	ret =3D regulator_bulk_enable(ARRAY_SIZE(es8389_core_supplies),
				    es8389->core_supply);
    ...
}

However, es8389_remove() fails to call regulator_bulk_disable():

sound/soc/codecs/es8389.c:es8389_remove() {
	struct es8389_private *es8389 =3D snd_soc_component_get_drvdata(component);

	regmap_write(es8389->regmap, ES8389_MASTER_MODE, 0x28);
    ...
}

When the component is unbound, the devres framework will free the regulator
structure while its enable count is unbalanced. Does this cause a regulator
core warning and a permanent resource leak?


[Severity: High]
This is a pre-existing issue, but do we have unbalanced clock prepare/enable
calls in the bias level handling?

es8389_set_bias_level() unconditionally disables mclk in the standby case:

sound/soc/codecs/es8389.c:es8389_set_bias_level() {
    ...
	case SND_SOC_BIAS_STANDBY:
        ...
		clk_disable_unprepare(es8389->mclk);
		break;
    ...
}

Then in es8389_suspend(), the driver explicitly forces a standby transition:

sound/soc/codecs/es8389.c:es8389_suspend() {
    ...
	es8389_set_bias_level(component, SND_SOC_BIAS_STANDBY);
    ...
}

If the ASoC core had already transitioned the bias to standby prior to
component suspend, does this force a double-disable of the clock and cause a
clock underflow?


[Severity: High]
This is a pre-existing issue, but does es8389_resume() correctly bring the
device out of standby?

If the codec was reset during suspend, it re-initializes the codec via
es8389_init():

sound/soc/codecs/es8389.c:es8389_resume() {
    ...
	if (regv =3D=3D 0xff)
		es8389_init(component);
	else
		es8389_set_bias_level(component, SND_SOC_BIAS_ON);
    ...
}

However, es8389_init() only configures registers without transitioning the
bias state or enabling mclk. By skipping the es8389_set_bias_level(...,
SND_SOC_BIAS_ON) call, does the device remain unclocked and in a powered-off
bias state?

If so, a subsequent ASoC state transition to standby might try to unprepare
the already disabled clock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618082842.2778=
-1-zhangyi@everest-semi.com?part=3D5
