Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EB8313534
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778277911; cv=pass; b=COHIVx7QKe2mIVXRI2EyF2pyDhmCMjtCYokc6+yH+YytvW22HjSc+GTt8sCP+kNIZ/mAr3Rggmg7B4ln64FpMYJWwQRFn0OfM5TgoDZdd337Hoai6cxYn5aO03dvaUCUI5/kIZKB919EAVZ51LDAtZoUZ1zmH/hhoVx6K3JJ8WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778277911; c=relaxed/simple;
	bh=sFhOkypFgUFtrwO3/lD2eVgWx0KBMQErr2EqNiq9JBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrKriMjXKzDWvr8DiSjrLctKWeD5wTT1SuQGkamV5YqM7FlA4uZ/b9LFfhg/GJkDvs4MX/3mrrYFdYQ9aFH305feuJwjHCd/h/2Qb6+/jpp26lBsLSjpIZoH8o9OvyA0Wxq/tF0NYz6uPo9SR2ZBIbl5rIZOBhXO3Dw4TMY6QBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Te0YCfX3; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Te0YCfX3"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67e43a8996fso2460104a12.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 15:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778277908; cv=none;
        d=google.com; s=arc-20240605;
        b=e2Pd7JmCpO3KI2nVEnzD3zvLxOh+PujqF89Zo+Sk0A8jJPYvsYW0iPBL0Du6m5OXzv
         Rk/oGkAAxrritEzcufjk/ScfDCdKLuxp1Qu+JNdHKy/St07PGF32KAlrfNgTITeTNymz
         A84b0IpJ2Y8GkOgq96jGeF7ISpjPbj5Ht/KySQu6fO6zL3cA+9YyUh7HUFEjwAVB7SKE
         4Hga2eKzyA1BR9FvyLhoou+9zrcRGU6wQQ2qbal5mS4x6sxrKXOVIOpo2WmgF9g3uzen
         oqo/K4wgNrTp1/uIJiJOnV1fTr6Tu8aWtWdF73covFf7alP5M8w0nAftnrkfxemTOop2
         GhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9axHN34RSuU5CsT1lGt5XlZGT/hvy0PsddNDcz/MesI=;
        fh=a0Ftw+QWObhmAF9P5yioLWeswlTx9hJPuDANtILSg5g=;
        b=NWcqX97PeJWmEQpF3BeWekfg1/TXHvt8mLDH55SqtFus+3gwikXeFmZLTzMqvc1uog
         dfw9U1smg4a68d3IdBX+quI5ggIpGb9z3do7XsU0ic5Yr0+W3rR+UsSGuWUoA564+Cjz
         9F/qEpy0au/2FDag5x28WodDO6htPWPpiq8ubwdwaF84rHQIpldJaNoLFq0JXPrEGByV
         SII9cWx7RnujtXVZyQ++HK9unecPjXqtONF34cJD1M1jXDmsUFZcvDBp4rrADV2ApMsb
         scwhIa+7VPBfcv64Y5LXMJydKZvJMXIIWmYemZ1TQQGu4GjoBCf7wL9UV7Y0guQ/Z3SB
         Kv8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778277908; x=1778882708; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9axHN34RSuU5CsT1lGt5XlZGT/hvy0PsddNDcz/MesI=;
        b=Te0YCfX3YWorWj7GscIhG16r7LxH79T+UiD+AsvoWWXWPL+85VG+pjrqtb4Zx/zmNe
         0URm0AEsB/WVu2Vlqs8x39bIGdvfwqWk7ucNGgQ4V23RAHvW6Qa6ILyb8RPVJTiFuvD3
         ik75Hs7UmbZ8TsN48VnjL3/lciUzIp7ZtXulibrc9RwlpwDB1mDyGVdAVvt/Rfc+Ynxs
         rKPE5zO2Qewb3jZ7x9pT2Ced7pF6WffFTdpHp6xuTkPhShZLGzxK6Gl/P0/Np13/kjul
         isFDjs7cGPKlNBa5AVhr0bN897SwuMU2WJGUcNOW2mcDIctbHF2NnC6PzOIIQxKV0XKH
         ZcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778277908; x=1778882708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9axHN34RSuU5CsT1lGt5XlZGT/hvy0PsddNDcz/MesI=;
        b=E0V/0TliadU6HVgN/91KN/7c2/l77bynpiHk3k/WOiDuViVE5G1EipoDXjdUGm7MP5
         8PuBZ12JsHloIbaISCaSLbauKMDf+wqe5HLe6BNeLodh6KsT7Icis34dsOGbw62x6/7G
         otHtGHahcmIZTv0lgtlKRMY7qQkqHjF8Qv4i2qqXpLirBvYBzocGwRtIcT5v91svpUB7
         bbGfGDvSiea2fiKM2YZoxC6FqZicsdLEJvejIbnxFA0KMCZTepHRac2Hm5sViHzn7F9a
         eDjkpIYaHoscKQfslKT9s37AO3gvGXmKWOWXxaNiAZrDOVhJjJsLzCnK9/6x85sxhWKb
         fWJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ACYXFXesguaOuQQRMiSVXhyC1gpY7S1us9IvRLPOCVc8NelDEfdHwJo17gY2o9DH5zSwmvFQkzgIV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+a5hinTghydT09+gLkOVJugz7fiEX59lif1bqtsk57g1jm3sr
	40deeZZkiUKa7+sGbqhHEJmXabwgUNJb1PKhB5Cl1Dx7/0PgqbXvJMlaKV4DXvjUciFPEYh9fvK
	wxD8NZCTBFh7muyhVx0PQMfbf120IGuAkDG+tO3ltvKIll/zhJW/KtKURFQ==
X-Gm-Gg: Acq92OEK4gPPI99TLpvA8dFFhmmL/p96yITyHPp6KfFOnBuGJpoNJbas41M+Kn7Das1
	BIzaSBMww7x86lGdelqVnmT7V8/s7eFUdX8QMKSAdY8nXo873jnhAtJYygw06OieHaNozAR0JQw
	K+D4bch8yGOl8iEaVRR0W7lbMwv7JFwgIlFmgy0kJnnzRcEYi0kHULq+wPbyBmhhCzkhHRHzTGc
	T/A/vJGVuXDBL2p+MWWfqvZbOr6Z2msPsqSEV78NaMeVdKH36xf/K7b0/Yde9Udn4q19WqPp++p
	gFLdPsZL7vc4NTwUZbA3CiPUcz2XuuKlx0BGBmJITD606BM5fAyJ
X-Received: by 2002:a05:6402:440f:b0:679:4b89:d348 with SMTP id
 4fb4d7f45d1cf-67d648b2341mr7555694a12.24.1778277907636; Fri, 08 May 2026
 15:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260417115842epcas5p1fb06d6f1663b97b1eae3aafaa6a3de0b@epcas5p1.samsung.com>
 <20260417121452.827054-1-alim.akhtar@samsung.com> <20260417121452.827054-3-alim.akhtar@samsung.com>
In-Reply-To: <20260417121452.827054-3-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 23:04:56 +0100
X-Gm-Features: AVHnY4JcC94zWVXrCoUpySC3LgZfp20jXlP-UHsUMtZ7sbT2HpSsWnqgH1G_b7s
Message-ID: <CADrjBPrD1o40K8_seeaQHzqiZRYMVVteMOPozpTVz+q0zGr3sg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: ufs: exynos: add ExynosAutov920
 compatible string
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org, 
	martin.petersen@oracle.com, krzk+dt@kernel.org, sowon.na@samsung.com, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Apr 2026 at 12:58, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> From: Sowon Na <sowon.na@samsung.com>
>
> Add samsung,exynosautov920-ufs compatible for ExynosAutov920 SoC.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Sowon Na <sowon.na@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> index a7eb7ad85a94..710ce493f3b6 100644
> --- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> @@ -19,6 +19,7 @@ properties:
>        - samsung,exynos7-ufs
>        - samsung,exynosautov9-ufs
>        - samsung,exynosautov9-ufs-vh
> +      - samsung,exynosautov920-ufs
>        - tesla,fsd-ufs
>
>    reg:
> --
> 2.34.1
>
