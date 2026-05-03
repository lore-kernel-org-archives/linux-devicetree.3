Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648AE3537E2
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843313; cv=none; b=i4+M7CqI5Ji1wu9P86+Www7LLCfnm28vKQOYX4q0qx0Dttlxa0Lf8FwDjTXMueD5E9e+UiRoj1/x2vjemYTJObmrk47e5dbvksxFJpiffeZWA8V6H+3NAmHB+qhpQPYZCEkP/R2AOElRrfPdz70cY9rJdACptUpiA7oh5qBw9oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843313; c=relaxed/simple;
	bh=tYupaspFfCJOfKetalRjhlUYhov1a4SvzMQl0DK1eKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMb66LKqP/u6Cyu0uDhCi/1tAOWKPVm2W7DEgW+bj6KB7akczOqKuUsV8nFMg0GF5c2WNJcHbTUVV/be5ZcS22T8GfzGmLT/DZ+SDeXrJ5H5uto3Cndm0Ll3Csc4R26JyauO/Ah6Ss3/lo4dykyv+R3Pd75Ol9RV1SuC8PZ0HKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYe4kJcK; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYe4kJcK"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8aca4e14411so36481646d6.3
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777843311; x=1778448111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mkg+VtHb7z5VW8iw73r4CHPWNF6Icrx/bYF2pZNP/U=;
        b=hYe4kJcKFsFdUHwnpMqqBdO53ZOw1dL6AofRG/rs02xPmwVsgFwfCw4jjEw7mXle4g
         NNtEh9CHVEYHyiV6RqcRnwl5UH4bVeVbd52Uwf2FrlBSNgmlLJkWFeQyPHMQtepxOZbk
         62XskseUViuwj2O9nNnKHmxTLX8LvINTe2zjDLQ9BjyHHZObPgVppXLJ6vfpIhGLIgSP
         VESxJeJQpWW5bZEw06d1zpt9Q0sH/ldfE9XSUXhmxMr+Jz4NwamDTaqOugGvouoy8PsG
         x+cUs09UEreAFesCuy0STOjaMTYtldkQ4tb/8JNRd/prTpN/2ysWGsOmoRBGCQGswWhL
         9Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843311; x=1778448111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mkg+VtHb7z5VW8iw73r4CHPWNF6Icrx/bYF2pZNP/U=;
        b=UJMXIfVdHfMhJC5AngcvLbZltYSGl3oXPMnGQTv1VTIfVs58U6axhXzUAUX4NXEWoe
         VH9QxvGmzy5hotuxDAm7z7LGhO45qIUMhug4byiSDg/Kp4HfRcI2Q9RO/otPs5l/NI9v
         C8ooeuheY+dcIezePK/2orruDc/f0KPRe8UtQnjLjwB36i9r8FYKF//4Lp5R0nCuh3/3
         pJVrOs2dQMiIQ82DniykRlmVR+zuERJnPbFhMx6nKLRVp42naREGFR/Ji71UwmkE9Xcq
         JaUGhVA4zJgYwS0ACBz4HTHX0iwWsXLvABoOdnrkDCk1buJIUkX+Kkijo25lw+vlIuBh
         C35A==
X-Forwarded-Encrypted: i=1; AFNElJ8lVzp2DlIoPGd3NpkW+zeYK1tk7lYRCJxSvwHWQhuFxN2zdC2z0A3ixP92CrQ8LQEiWdh4zYQF97Cc@vger.kernel.org
X-Gm-Message-State: AOJu0YyPnJ2+YWwIDpSszIKaJrLxIlXdSui8KefLXidO0HP1hFPYGtsg
	dKgwKtG9N8EVmRhDLuYA6j/cdSExA0umdxBUbdrlGCerZwWVGsnmfEWw
X-Gm-Gg: AeBDietruXayIRVjobxee3REL92EoAjCWPfEjLRx/EcHV/w78kLqbho/4VcSB5mG1Gr
	iLQ0eQdYXGkn+4BexI5uT/Si6NP21/N7WxmQYFn2cBQ/qMThunRExrW7purZxTxHDfH1HxfwREZ
	1WBQIzea/fiMn/aCOVt1g+NvTKk5OLV23cabMod33qErecqHJCuSodHQwCqufaz0bPErnOZuz+D
	7bhKzrQEPZvH0SbLMrMBtId+Eq2YFaClATedVCuk9Jj360giewhcwEQGySC0rzwGhdn6xWvjZ3Q
	CT9UT41FUFfYzhUyPTLwQbiVJKUyXlKki8N9a8pJ3KIdn1fBvXWxi3AIUWuIXj2BWYfGXLw6s/H
	Q/yrfG3FzEnJEgSiwgHqOKXVAtH6aEobwFcWWTteU1eRCcLUQHsDq6m2KQ2/9gAl7eSv27L+cWr
	OadjcjuBAZVOki4Uk2OrKitQFMSspZwyVmBYei+wYPb1wnWJIG4u8fuNF5pYkMbfl4BC3VTb0bA
	7Q44Ccn2s+yKwQ0EaUiJrH2Ymy0xd0JhXSX
X-Received: by 2002:ad4:596b:0:b0:899:f0b1:7332 with SMTP id 6a1803df08f44-8b6687360f3mr139026546d6.32.1777843311331;
        Sun, 03 May 2026 14:21:51 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b5391e34dasm108625546d6.14.2026.05.03.14.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:21:50 -0700 (PDT)
Date: Sun, 3 May 2026 17:22:38 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add
 PM660L compatible
Message-ID: <afe8nm9VXytzxyxj@rdacayan>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501153128.8152-5-mailingradian@gmail.com>

On Fri, May 01, 2026 at 11:31:17AM -0400, Richard Acayan wrote:
> The PM8916 analog codec is also found on PM660L, typically connected to
> the SDM660 internal sound card via the digital codec. Provide a space
> for specific compatibles and add the compatible for PM660L.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> index 15389645a3e8..074a20cda89f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> @@ -14,10 +14,16 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pm8916-wcd-analog-codec
> -      - qcom,pm8950-wcd-analog-codec
> -      - qcom,pm8953-wcd-analog-codec
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,pm660l-wcd-analog-codec
> +          - const: qcom,pm8916-wcd-analog-codec

This should be PM8953, since PM660L has the cajon 2.0 codec.
