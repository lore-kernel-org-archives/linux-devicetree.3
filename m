Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21762213E9C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781148765; cv=none; b=t6SrqfIWX7N1eBUYEvnq/8IJU/fO4YXeU8ejDc6+ktOVA8+8omI+wwkQ3jbBH/IaoVr1N6CLh1Akl6RP6HB+6BS18J/OBLSZelFITAILcYkrJ8TQgIdfQ8MrIkwUzOVfZjI0nkHu0ZY5GfPgEXqyEB8+oDpUuCGjG8BjbZvg6Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781148765; c=relaxed/simple;
	bh=8utGY1RhvhoTvaYaDf7pBwm25exUVQhluaJosZnwTX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a9jSwCr4AdMOOxjelF3XS8QasQLFb/U76CihypsNfS6oMbL1Co3yiAtfnfSRXylOxh4BV8z+G0/PrF70u/yCSfJM+E7IaOS6Of/Cgebps+0yWKk7//uOEXZeJW2nslqZU8NEf64J8xLexMuV4szkREjY7fo3KBrZvVDV/BIS5Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQOKvqju; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQOKvqju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FE21F00893;
	Thu, 11 Jun 2026 03:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781148763;
	bh=t/a/iyJeZMaohS4G5OFx+h0447MvYGkDC3gEXeMUOQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KQOKvqjuQrlGScRhnVt/9s/HxQ1NWSLzuF4aByJzBncvF0X0soDHZel/W5xzModvg
	 LpqKbuTqpCAUbOQymibm+lHQK+XuxOGKtX/emnQDtVr/a3WdOMXd1QGZRS2jvPnNB2
	 XlnipmQXo7yHe6+06GBB8SthTpT2UonTEzGG/NjF60bPYDQaN26FkV5DeKbOGFvjKF
	 Jxv6DLlqTnZcjEN4VDT3kVFNolfnHQb1oTZBRXi0HM7clvYPwcrz90GjBUhiuqxUKs
	 vYYV2vuWiFvtCDeu/TiOVjb3JyfWUf42mBx0ZCZkmI1yYIKTDIe3zqBYip3W91uzep
	 oZEKriFVNZEYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/7] ASoC: codecs: ES8389: Fix the issue about
 mclk_src
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260611031824.4628-4-zhangyi@everest-semi.com>
References: <20260611031824.4628-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:32:43 +0000
Message-Id: <20260611033243.62FE21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing symmetric constraints for channels and sample bits allows =
concurrent streams to corrupt shared clock configuration.
- [High] Concurrent `hw_params` calls can race, leading to corrupted intern=
al state and interleaved register writes.
--

commit 58316d49bbe1cd5f1a16ef61d0304cd59b1dd9ba
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Fix the issue about mclk_src
   =20
Fix the issue with incorrect modifications to mclk_src when configuring
the system to use MCLK from the SCLK pin. Changes the mclk_src member
from u8 to bool to better represent its purpose.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index be7a36f17083f..886069be1535f 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c

[ ... ]

> @@ -607,9 +607,9 @@ static int es8389_pcm_hw_params(struct snd_pcm_substr=
eam *substream,
>  	regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE, ES8389_DATA_=
LEN_MASK, state);
>  	regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE, ES8389_DATA_=
LEN_MASK, state);
> =20
> -	if (es8389->mclk_src =3D=3D ES8389_SCLK_PIN) {
> +	if (es8389->mclk_src) {
>  		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
> -					ES8389_MCLK_SOURCE, es8389->mclk_src);
> +					ES8389_MCLK_MASK, ES8389_MCLK_FROM_SCLK);
>  		es8389->sysclk =3D params_channels(params) * params_width(params) * pa=
rams_rate(params);

[Severity: High]
This is a pre-existing issue, but I noticed the driver dynamically calculat=
es
a shared internal clock (es8389->sysclk) based on the stream parameters her=
e.

Since the es8389_dai definition doesn't set .symmetric_channels =3D 1 or
.symmetric_sample_bits =3D 1, couldn't user-space concurrently open playback
and capture streams with different channel counts or bit widths?

Would the second stream silently recalculate and overwrite the hardware clo=
ck
registers, breaking the already-running stream?

[Severity: High]
This is also a pre-existing issue, but does this function need locking to
protect against concurrent execution?

ALSA's PCM core does not serialize hw_params calls between separate playback
and capture substreams on the same DAI. If playback and capture streams
execute hw_params simultaneously, couldn't they race when updating shared
driver state like es8389->sysclk and es8389->vddd?

Later in this function, there's a sequence of about 20 non-atomic regmap_wr=
ite
operations to clock control registers:

    regmap_write(es8389->regmap, ES8389_CLK_DIV1, coeff_div[coeff].Reg0x04);
    regmap_write(es8389->regmap, ES8389_CLK_MUL, coeff_div[coeff].Reg0x05);
    ...

Could concurrent execution interleave these hardware register writes and
potentially leave the codec's clocking tree in an invalid state?

>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611031824.4628=
-1-zhangyi@everest-semi.com?part=3D3
