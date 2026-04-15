Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8E1344D8E
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776251218; cv=none; b=DQz8rolxZtXnIOcY/4Bzv853mnm63iAwnbpc28dJNT6qMNcLOF6MfdK8O8B/vBGVTdy87zvMJU68Mtrn1/4X0bKm0u8Grmz81aaKI3MIxN0ZJcK2ByIihTQiEzTN2Ab5vJ8RcgnKyQ32z5MrM5ortNi9m312XwtgQML35E2znTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776251218; c=relaxed/simple;
	bh=LDI3mtUhr2Rd5w5ikgiCoRnemB42IOlavCohdIScs2s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=VvjysYNwNP55is0rwBHSSxqmTatoMnbsuUb0xembDxaRlHxKo4JLFcaY1RiZXJvzWWWEf4VQaTYLV4YQbejO7+MMSQGuJj3IrcTxEFddiew7v6X7+lg/SKnD4bgtNU6pugVQn6rwZuC/XdYommn3x7jcF8gCWe6Jqr80KCZy8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FC1dNizW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FC1dNizW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so2813132f8f.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776251215; x=1776856015; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rw116FfYB2wR32SWs/TCFerpwP/9uG3dqe/oInwd9Xs=;
        b=FC1dNizWonp4QpzI2N3Rq2W2xJ4iMmgVfWaMZPlRlepTj+O46bHcZeMyOvzm+f4p5B
         0uL6aFM3ptRN6stlO+7R8SL3cN4C1leb1oZKGUZqvWTFFrL+9ofe30xrw7dS1bEepTjQ
         J0ADmXh+JsoVhe2SX/nQRIjjwzpx/zqWnrwl+GJAsYiUS0ZzXbnZwadHVOurA4W8rzRO
         9qm1UgBqRSE9VOZzXNUgmlPQxITuvHMnnuGTsAUeT7wZ700vKzw0QCgtOVH2VY4mS9Kr
         klEEn4HbmUjn44Ac0GBJAeenFRV01M79S3CFRgUHuQKuQYuVeYJmzUFydARFzyqUq7GD
         Uihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776251215; x=1776856015;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rw116FfYB2wR32SWs/TCFerpwP/9uG3dqe/oInwd9Xs=;
        b=tPnt3Tkycue9mtIlQRh5xbL10E5AmXrwv+CT0A3DLWdlAFVLE4Y0w9Vnh+60kU3cTc
         Qd9CXqqFPrE7YV+DDoRH4U6Zq3lFLUP/eAKJsCRfEoDSLHF5KZcLR2WYrAWfLKzETsew
         hfg8vWXx/4qIiYRd26YwGOqJnDdqx40fy+Z5XMEqNwzA23RywoRW+R0nvtLktGgbTsfv
         HIpUPpSKCS6suJ/U4JVn/m4Uu9qdnWBdrwa3tuuWEGRSAL5gmTHQqcGOXyqQ+/34nPhL
         oudHWGU3yeiC+A3oKAdH4t8YnCW202N0O3fcGQNQDVEVC2aLS4vN0M0BapW/ra0sEOwn
         6lYw==
X-Forwarded-Encrypted: i=1; AFNElJ+omuleWI8aO7evBEP2zlKNBFt3d45rMllfINRrlbh0Xr+cu85TpXHAC0gFiG1iAx1dt3lZvVxQ7r9I@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtMAAYVaN1heVUlAT81V74IU5RF5fdce3z8ew0DtoWGGJaWs0
	uPoWRYj9g1GozcH1MfRRFpmhpSYlHyEtU8PM0k3y3D/h8EjyfoGslFqrnVfXPe70u3M=
X-Gm-Gg: AeBDieuMR90dOp0pKk4uLb5wYC9LyPvGhe6HVn5WVfNias9M1WZHcL4Gi6IO0ZH2IFs
	/mN8IDVywdqq3gJmWzSsdSoPCnSXGpw7NcjH+y6CirPdNC2yieEbaXT9XGBefLomjX1Vl/od8GF
	H9+aJq/7HCIF8XrbHfbnCXQnhLfEl7/YDeoqRSulZ53Zfw9N42Ucss7gbAnTfhi0zIHInoAMe5f
	SMFZi+f4ik1kD6otfEU3ghTpkltR7yRiAiGGHbT/rU6hk8Kvi42+Rb1QG+AYzFLqOJhhNBigj82
	x8draGR6Nh8oynteSzqdzbsfN3+4BUyGf8Vs5nhs9xg+3DWyVUUmK9Bx4tAX6xHj83NgktJRblw
	y4UNPCS1dxPDd/Fe+5FSWxHedPXxJbng91FEbp5pJGr+8iG+2TDAyUJ1TijLUsoyH6oQi4d9isA
	WbLwNKx4/WL/S0MOBkq8/Kb5oGJHoVoe73RWGOoUFt5OJ7f6MdsQXJNAe9atr2Ydy7Y7ofzxdvk
	Nin/FaQ1zwgBegACg==
X-Received: by 2002:a05:6000:184e:b0:43e:aa88:f1a6 with SMTP id ffacd0b85a97d-43eaa88f2cemr4326833f8f.45.1776251214558;
        Wed, 15 Apr 2026 04:06:54 -0700 (PDT)
Received: from localhost ([212.187.182.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3e0091sm3867007f8f.25.2026.04.15.04.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 04:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 12:06:53 +0100
Message-Id: <DHTOI6CA1PS0.3JFMJ1VE6OJJZ@linaro.org>
To: "Kumar Anurag" <kumar.singh@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v1 4/4] ASoC: qcom: sc8280xp: don't force S16_LE in
 hw_params fixup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-5-kumar.singh@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-5-kumar.singh@oss.qualcomm.com>

On Mon Apr 13, 2026 at 10:19 AM BST, Kumar Anurag wrote:
> The machine driver was unconditionally forcing S16_LE in
> sc8280xp_be_hw_params_fixup(), which prevents links (e.g. HDMI bridges)
> that require 32-bit formats from working. Drop the format override and
> keep only the fixed rate/channels constraints.

Why the format override is no longer needed? Please add it in the
description.

> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 7925aa3f63ba..c00eabf200b7 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -75,10 +75,8 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_=
pcm_runtime *rtd,
>  					SNDRV_PCM_HW_PARAM_RATE);
>  	struct snd_interval *channels =3D hw_param_interval(params,
>  					SNDRV_PCM_HW_PARAM_CHANNELS);
> -	struct snd_mask *fmt =3D hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMA=
T);
> =20
>  	rate->min =3D rate->max =3D 48000;
> -	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);

Does compressed playback work after this change? How did you test it?

Will it be possible with this series to have compressed playback via
HDMI (with 32-bit format, right?)? You might need to add some
functionality for this in topology.

Thanks,
Alexey
