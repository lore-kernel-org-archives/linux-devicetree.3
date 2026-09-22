Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2099449363D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093747; cv=none; b=nwbkkd2vGz0K30/t1OOjI0Eb3kLhvxACJdWYcXwsDjLfPYnm0tp/zk/LYNabldurZMH1WKu2Hi/yjc5FmsUhVVyvcodOKbhX0BjjnXYE5h2UhOJrCdbpZvVG3L/+RIcH5VdPuJFteiElc/k5Cob+xOb8tEJfc0n7dhSujBcCbrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093747; c=relaxed/simple;
	bh=zTEmXosYeqUfMqKs3jStomw7tr9sfQzcCIsPAoTQb14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dqmN4qyyajzLSdlgHMcsBFvKx760vCJsO2tBwRxr7NMJFoMbyauyBjcpJNSlAF/IqvEkH9pXWMhwZop8uLFzLxtlAqOPjtP6NDK+EyNIt72ROpJRtgJVFuqmcSL9T9QwnJ603068290HFBrmSDwni2QuAt+BBiNP60Jnc0GZVIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFJwguOU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFJwguOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586141F000FF;
	Tue, 22 Sep 2026 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790093745;
	bh=D7yC38SMs0uBnLIInF6isvpcDUoTz4JRxPUfTqk4dcA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HFJwguOUi0aWqgP2/6Qe/iJjC5HC0UdK2zfxjTltIUJE7KvwwVOnhO46ZhXiMUlJ1
	 /I25vuc7zLfQd6r1nVSdjVF03pXCluQfHzRZq+7zs3Z8oEAkC1YsxrYcMaqAS4Z0bi
	 R3T4Yd6jZXj+b1XrYJA9HfVCL0ZiOdiXUz+55YZ9KWlroTbhEW2scXRfvGm4dU/5Kd
	 qnqLpd0fvD1GCZPvjf0auvwVnaRAbGcKC+4q8aMN82WpinIWu1Fi7aOx8Hf62Ta8cd
	 7/dSjtacV+gMVyQe2DTuaPQ0bIV+rEBtAamSrlz09OOZqe6O/5D9YgGSI4gVrS+bd/
	 /38Zvcp7jH19A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] ASoC: meson: aiu: add I2S Capture DAI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260922-audin-v3-5-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
 <20260922-audin-v3-5-a760312c076c@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 16:15:44 +0000
Message-Id: <20260922161545.586141F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: meson: missing DAPM route for I2S Encoder Capture breaks cap=
ture
--

commit fa09911e4a594b581f33e550b8e59c1534b784f0
Author: Valerio Setti <vsetti@baylibre.com>

ASoC: meson: aiu: add I2S Capture DAI

Add capture stream to CPU_I2S_ENCODER to handle both playback and capture
streams. Captured data is formatted and buffered from the widgets, then bulk
transmitted into RAM.

> Add capture stream to CPU_I2S_ENCODER making it able to handle both
> playback and capture streams. Captured data is formatted from
> "audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
> FIFO and then bulk transmitted into RAM when the FIFO is full.

Is the formatter widget in audin.c erroneously named 'I2S Formatter' instead
of 'audin-formatter-i2s' as claimed here?

This creates a naming collision with the playback formatter in aiu.c.

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

[Severity: High]
Are the DAPM routes for this capture path missing?

The patch creates the 'I2S Encoder Capture' BE stream widget but fails to a=
dd
any snd_soc_dapm_route connecting it to the formatter (neither in aiu.c nor=
 in
audin.c). As a result, the capture path is disjoint.

When the capture stream is opened, the DAPM graph traversal in
audin_formatter_i2s_get_be() fails to find a backend source, returning NULL.

This triggers a WARN_ON(!ts) inside gx_formatter_power_up() and returns
-ENODEV, breaking capture functionality.

> +			.channels_min =3D 2,
> +			.channels_max =3D 2,
> +			.rates =3D SNDRV_PCM_RATE_8000_192000,
> +			.formats =3D SNDRV_PCM_FMTBIT_S16_LE,
> +		},
>  		.ops =3D &aiu_encoder_i2s_dai_ops,
>  		.symmetric_rate =3D 1,
>  	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-audin-v3-0=
-a760312c076c@baylibre.com?part=3D5
