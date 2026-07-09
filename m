Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF163BB9EB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585261; cv=none; b=oYEzN0iqdUZ1BfDn2aDdMv6+gpCHShGWYKvDYKhH4WVAOtmFEqg0Mi0Og8WKOqNoEiat7emHpED+Jnmm+B0oxvSqnXwvzdde9Jgn775ngJ81WFfjdp3T90AcSFJWogEzmv2NJwzEPxYOnXUA3TFNf/xyR4Ytn832cM94USgZCs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585261; c=relaxed/simple;
	bh=Ohzl7PWWxPjWZ4tXvMcYkXyrj5Wxk4aqB0wBzBEY2O0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUR7+eq3fXR7duHWOdSR92m4OAR8qvRuZZ3Vd+tiJxDfOjGw0Rn77HVsFnUPdvaWCmh2brJqXCyaglCZBcvI7t58ygqTKyyn37BRpHlbvWHzdd/8TNTCPpa65tHbCaHZXIdZeyXgNwuoV8+pLctGjwqQ3pHfazXmaYDwCV5WkMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQTXadIh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQTXadIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82161F00A3F
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783585259;
	bh=9tUtktBx772SuNsHQ5mcJ9lnSn/4XPHVAAgyesELQcY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jQTXadIhqjAIfbf/M+pHE5woVFPcv7CPCsaR/+q1L/EcSvDDlwA3tHsNOags65Bco
	 iD4y0ZuAOGAE38C+t71xryFmOIBXQd2Ne/t4DUkn+SPjZCMioHWTLKp4sJo/3ugts9
	 ci4ZZTxTDDteQnLpG2ZldCaHnZ8kVJ3Gi1s88tiRBNWJV8niuOVRrXuujpAZ1B12Rl
	 Sug/bz3VDnX8ELwOcgjMjSQcDBMJWBAUSxENX+izop4o150HKOMwPGm4D2dYR8Wbbn
	 NRcMPu8S3atEEgS+aKKqhyfo4QPuSpaMpUwc41KdZKePTsZ9MUfeW1CuKMqyfGxMNM
	 XlUkrOrQhCosg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b018fe8318so217165e87.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:20:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqqTKpOQDOobmMsXy/aVJd3uGRqfyqcukE5x2lZz5qaZEMdz57gXZfwv6Ci2XrGG1biyjySONcoCCPy@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhD+xf3KnQDmSwESRh0bpU4oFPjtTDJqOcQEYml2iXtJP4plY
	+aKrTHdqJiz4DyhfTQWw9suMlTONj7LpFtdfIZZ5wm/+BFgg3Jx3l1/jmeTZC0Lfe6xHqxyiWzf
	GgMg2K1wKAEoFl28jRYyYy6gaxGq5lotU0XQ8DkOOPA==
X-Received: by 2002:a05:6512:350a:b0:5b0:11b4:fd7d with SMTP id
 2adb3069b0e04-5b011b4fed3mr1316663e87.55.1783585258690; Thu, 09 Jul 2026
 01:20:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:20:57 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:20:57 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260708114924.1069239-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com> <20260708114924.1069239-2-prasad.kumpatla@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 01:20:57 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md7LFXEd5KZ0Q4QExAjm3J=kSuE2dY+VA24Nw7MfVh_5g@mail.gmail.com>
X-Gm-Features: AVVi8Ccn_oAqwXTtlBZJX_W2TZrcjkC2Qh7GQ-UuQblJCynSYsRTJkzjBuBAll4
Message-ID: <CAMRc=Md7LFXEd5KZ0Q4QExAjm3J=kSuE2dY+VA24Nw7MfVh_5g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 13:49:21 +0200, Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> said:
> Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
> resource (LPR) vote through the PRM interface.
>
> The LPASS PRM supports a resource voting mechanism to control low-power
> states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
> clients to request the LPR vote using the existing qcom,q6prm clock
> provider interface.
>
> This functionality is required on newer platforms (e.g. Hawi) where LPASS
> clients need to explicitly manage LPR resource voting via PRM.
>
> Also update Q6AFE_MAX_CLK_ID to account for the newly added clock ID.
>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 45850f2d4..06ca2c287 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -236,8 +236,9 @@
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103
> +#define LPASS_HW_LPR_VOTE		104
>
> -#define Q6AFE_MAX_CLK_ID			104
> +#define Q6AFE_MAX_CLK_ID			105
>
>  #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
>  #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
