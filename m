Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3165848C3E8
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680022; cv=none; b=a8PGAVC7B5eRM5s3AxM8rhdYiEn1c5f51bzfJwl8Zz1/dkhSdtd8NviQXBZR8t/SHgmIgyv7GoapZRo7gh4m9JUI85bkuqjGquplAJYK2gGdcCnHoGZRFKNlY6EotbzwAhGTW4hLE0JfaGlWixaoX1aeXZKzmwd0Wtl00QpC9Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680022; c=relaxed/simple;
	bh=BlG8ybK/7a9b234yW8m9E5A2c8eorZBeODdbCLkzZhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qnLpxk5126Sw/ysQFN1zk38SG1qDRk9N/wtXcr7XbjDpabpyJ1l+a8X64O6ZDwa1MBafp9mlIFi08KSf3FV4CABeKSwUqZq8l/bbeNAhjlURUCe35PAvm2rKFCsldPOuKtH3/MDAxx9QjJXUpfNykGFBroDegdxmmQMefp8D/+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DR3N4bh4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DR3N4bh4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECE61F00893;
	Thu, 17 Sep 2026 21:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789680019;
	bh=eEuuZjeGZbBL70xFPAbqfMiUEkk4GDnAKkh1pNrgl7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DR3N4bh4Fw97FLTH2VTk2ezveYhRp8C33yZH/AVfIc34hBBUjbaIq9fg1Xi0M/EUP
	 VWXpK9R1WC9wp/9xtrOr06v1jKANWdhQiulAtjSetqBjV4HS3fi+TD3TalwmYLmwAo
	 E3SmZPRksjg2U3H9I8jBJqgvjc1dPjyi6UMxFUv32MGeo9nUwQaE7Bo5cJrUY9ZmlY
	 8l+cnQ7UpyIYqmm586l12zktX7328uxRwLhuxT756RVLDiou2KtBhWetHlE36rRfsB
	 cZ9/27+/rALUYObPbj2rn6Ms6DCFy5OoeNqZsFW1WkT/QzQ6mHAzLISNprJ3v4XSqq
	 VEgC7XtGHIWlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] ASoC: meson: aiu: add I2S Capture DAI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: robh@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917-audin-v2-4-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
 <20260917-audin-v2-4-38de4bc1de34@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 21:20:18 +0000
Message-Id: <20260917212019.4ECE61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: meson: permanent clock divider leak in aiu_encoder_i2s_hw_fr=
ee()
--

commit 7076c7f044003c89d276b88e15e27dd0533c4d92
Author: Valerio Setti <vsetti@baylibre.com>

ASoC: meson: aiu: add I2S Capture DAI

This commit adds a capture stream to the CPU_I2S_ENCODER, enabling it to
handle both playback and capture streams concurrently. It also formats
and buffers the captured data using existing components.

> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 535fbf7c16394..14d0e20a4bd66 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] =
=3D {
>  			.rates =3D SNDRV_PCM_RATE_8000_192000,
>  			.formats =3D AIU_FORMATS,
>  		},
> +		.capture =3D {
> +			.stream_name =3D "I2S Encoder Capture",
> +			.channels_min =3D 2,
> +			.channels_max =3D 2,
> +			.rates =3D SNDRV_PCM_RATE_8000_192000,
> +			.formats =3D SNDRV_PCM_FMTBIT_S16_LE,
> +		},

[Severity: High]
Does adding this capture stream introduce a permanent clock divider leak wh=
en
hw_free is explicitly called?

Now that both playback and capture streams can be active simultaneously,
snd_soc_dai_active(dai) can evaluate to 2.

In sound/soc/meson/aiu-encoder-i2s.c:aiu_encoder_i2s_hw_free():

    if (snd_soc_dai_active(dai) <=3D 1)
        aiu_encoder_i2s_divider_enable(component, 0);

If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2, and
explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
snd_soc_dai_active(dai) remains 2. This skips disabling the clock divider.

When the streams are subsequently closed, the ALSA core skips invoking hw_f=
ree
again because the state was already changed to SNDRV_PCM_STATE_OPEN. This
would leave the clock divider permanently enabled, potentially draining bat=
tery
or blocking system suspend.

>  		.ops =3D &aiu_encoder_i2s_dai_ops,
>  		.symmetric_rate =3D 1,
>  	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-audin-v2-0=
-38de4bc1de34@baylibre.com?part=3D4
