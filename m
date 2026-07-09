Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90F42DA21
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605066; cv=pass; b=Evtp1ekFqDmQBl1HAJXtIjIABTBkx/5j385kAE2iBsh6seKoZueVscgFaonX+AjpLQCt+fBeeDdt4RmPhEVhavYVBTweTO362COODDCdqkU/D5cqs9FZHx4hDWiYxfsD6ZB+8S/ikfHg/d1I69diDE9fcrUa3LRf/RUflRpl88E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605066; c=relaxed/simple;
	bh=SihmFjkWEiEO0qH8JlrA4KwYnVS+DiBZnDYthOxMe8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTtbG5M37xPptYMv+QSU2rceKwmrSkv6IrP9s/fBsOQv7Bf4V3jA920NKwtPdReaTIorWPKfTGEoo+G9htx+LSCOqZQ+u80eIckXCoIm4H0iM07sZMRtHblVHEyhZriuPLc8zAOkbqDZ+nlUwDewyB4MGFDgumSz8QQqsBqhrSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nk0eJQ6E; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nk0eJQ6E"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698b6c87884so3194433a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783605063; cv=none;
        d=google.com; s=arc-20260327;
        b=VMc723qqSHyQlb8FXccnDXk/TDNlzlvj/j89/tixtK3YIMywRF+9cQiK/iKxhCFCJ0
         MbSCNdhOqapyh+ZLZIZNSnVgB2EMeCQNPz+nUlmuXNVLVU1k/FLG/ZyYTYkh1l4ElEMN
         su+/ciM3iTtwVTIuJC0e9zxNkodRyUVa0s/ra0uKTCWSPMqD5CXRzS4GkdG5tmgSFp3W
         0kEQBh4yoBnTccmmG5eJ1mjq1NBiRt5eQ+CN/QYWyJJVKtKW5fHL0d9vvtL8j65Ilh29
         ghJqYYc5wesPAbHOfneuBABpnLauu9q6aECaj3TohXbxyGLckDyUSbviRl6oA0IvDbBp
         9T8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ybzojlHD40xTUq3ZfqVQQgO/h3HFfouo+/UtgZR9PKs=;
        fh=IZwEVvAM3uxT61xYrFZOAzEYwybAePfjZIo4fvBxOVI=;
        b=I2dDS2TQO8/y9StDhLiHaR4bybP9UxZRCarSMgVfLyDBN+Om0DMbuVNHhkY21jzEDn
         v5fTLFj3lWG/XV9Ga/+67cI4xcYUCTgD/ikj9fbFGDU0e048L1cvKG1fK2FBUHzKLpCj
         YvHGzSchFXheXGzIWyc6cVSuzA4MbklrrYfuFOynpyHvEfLArguOZPxRxwHZ0gp2Kqpz
         l0N44QvTelxQWEsBpP0MrqZhMVIHd9onPCkWiHDOnivAIGGDqVQ83kdCOVGHVDErEdc8
         IKDrqNhZQuesY86FeqHFj40KsbDKOmw1+MAyEXrbflwyfe6ohctL/8e8Cj6LS6tpI99t
         HuQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783605063; x=1784209863; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybzojlHD40xTUq3ZfqVQQgO/h3HFfouo+/UtgZR9PKs=;
        b=Nk0eJQ6EVuL7xN8ec8R2tlT/Bmc2hTLUuQS12j1Xyv2G3Obd6YLe9lTp8O5nmBuo4e
         CxGCwyObkmt9MvOA+Hm29UDNJx1YxvUIadDmS9BedKhkkeLroUdKjUK/9aVV3PYTXSK2
         KPrl4yjs81nErQFG364M9kBGcGRm5cK91ZorCQT52iKnL//HuCURDlYmGx7kBB14D21K
         4lUQgLgfK4a4rSUVl4xFtvGVAzNSADXgBy6+NRRXSOnuA2xdaBIrXpYC3IAoWPcLbNOO
         5sO2IFT6KJM+wpdT9LVEDnje1fMoxRX68s9SB3BVattd5AQD4B//ZCrg9CrJtIX7tVLK
         PE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783605063; x=1784209863;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ybzojlHD40xTUq3ZfqVQQgO/h3HFfouo+/UtgZR9PKs=;
        b=AR2syPod9xkM8NpBbOr7bZc0i0v4g4ibkQ1vB0Y0+cOyJaUkBLuZD3M7K4YCymEtV/
         4JJmnJtsnhr5PSsV6dfXG4YWhrCL1x9fqmtVTcsYre/XClruN1LadF5gb9BeGDngJIsi
         URHGR9a7qMK8xdSvnYBNzenRQ5qM712//97Q1bVv8J30d1i7srphVuJAEz34pXua+5Gr
         ZYd55AY3+68GUhI7dTWndnHlEgVxU6TrIqI55213zpu4K2et9FTTOExqpbvlA+6yX3cH
         PZM3+NxvPf7uKOon4kDzcPzfL3hGEB4vrnx5v7zgBVi5eyUeB4Yc2pkiz9/r0ljYAf4C
         gmuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXe/nIC6sK7LLrbs9rwEFbsCN32zOEkc32+0UvZ63J0tqGJyeJdRpJu/htG13Y3pFeZEuqihz/XA0a@vger.kernel.org
X-Gm-Message-State: AOJu0YzCmi9jsoo9zfM2vdGOSE9hlEihqGa/JaBr/q1S+4z2J5s9D0Ie
	sLDStEtyNDaLrnPx/kWX1i4aDn/FTE29cpBZN7gjO/vQTpbNVXKmnkWcfYN9iiRzxJYNb+czDyj
	Hcx2EArHZCdyGzgeaOPzAO/RA0osjstx9XMLiU1kJUg==
X-Gm-Gg: AfdE7ck/HvkII1fxPwGObQgdNlMElfmdGzMiv/IvvFVPghf+Zc6d4m1b4PWr+4FoFzk
	+Si8YCkGxS8krqLcpTnY+8tIYYcjrwos/XvdWpXbbjrbRIXih2IQnSNwAX2lYexX+lpnaKCi/t/
	6gt8ZHDWMzzTYzhA357yf+psH5QDGwmz1MfaiQntfSfguS4JOxoLA3yxVuMceGtBVMDBOl69rBE
	6lba2Hq6biJyRvHch5r8wBMvfAk4omfEZowzyFtABLq1Q488LT4urstt+EWLUcIDDPyV/Rw/Ii4
	+20i3fOzEcKRn032rHFCC9Myq3OsSCE=
X-Received: by 2002:a05:6402:428a:b0:698:5610:76e5 with SMTP id
 4fb4d7f45d1cf-69ab445ea87mr3046587a12.6.1783605063166; Thu, 09 Jul 2026
 06:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d@epcas5p2.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-7-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-7-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:50:50 +0100
X-Gm-Features: AUfX_mzbOQE90wbcU5W8GA5XzSbsGokNAuCSRvh_hJojsQkyE6XqvwM4U1XHkcA
Message-ID: <CADrjBPrPi_x-ppDtQAMHC4akqhzpT7i66Dz86uCzopdbW88MBA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add maintainers entry for the Samsung Exynos8855 SoC based platforms
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1705eb823dd0..f6d9e03d3370 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23996,6 +23996,13 @@ F:     arch/arm64/boot/dts/exynos/exynos850*
>  F:     drivers/clk/samsung/clk-exynos850.c
>  F:     include/dt-bindings/clock/exynos850.h
>
> +SAMSUNG EXYNOS8855 SoC SUPPORT
> +M:     Alim Akhtar <alim.akhtar@samsung.com>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Maintained
> +F:     arch/arm64/boot/dts/exynos/exynos8855*
> +
>  SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
>  M:     Tudor Ambarus <tudor.ambarus@linaro.org>
>  L:     linux-kernel@vger.kernel.org
> --
> 2.34.1
>
