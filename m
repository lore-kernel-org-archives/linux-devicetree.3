Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4313B992A
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729455; cv=pass; b=VODeUnd6wiQce5qj4/u8fxAmO5bL5nrlBa06j3rgzPQF8i0izgyFIG3Gk4L0O0cwsZ7wMgA3WVEdy6q253y3EqnRJEkBYrDNl5EKxFFX2MKf65c1wlL1Om70tNglLUIZzyWbezP8RricNO6Ik9qFCO6PlN4MfV4B3goGlnyR0Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729455; c=relaxed/simple;
	bh=FDg0Cl/yIbEJs1iZUcaKBc5BZgkQJeT1BjRjBz2+49s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDPO9tcy21F8SEuaoAlR7yzHxhMV7vFgty2KPseNnpDtxCZKGf4TjXyqdIIjAigtBEQDBDAhgOsYDLFNdwv8Nu+8U5DsAOqqFIjLhLdQMzT/510LmurSk5uaCjNHG2aAx7o8MiFMDIuhj0fpJpf6DzSMBVlRWBhS4ThXCZJm5O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNLt9r9x; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNLt9r9x"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so4808296a12.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782729453; cv=none;
        d=google.com; s=arc-20260327;
        b=abq6ko1P69dzEz2Ur4ULs0+qPuprcbtJQ4utdyYyIMeBpeg4xh0AFB/HMCdvnrGo72
         2lD50k7SEIjDymFNDy2A/JiJFYm5KjYdL9OUw7WdLFiakiZwcYkV8ntiJW3baWDZ3zgt
         R/TsuYlQ/Sw08b8HOqCdnl4HFgctoG6/BkCiHtmoK5ojAXVq3kbg8W2TkqrED47inLpH
         t3ST0FftLl26Jzj3sjCi3ZQ53KmHZ6SFPj1zbsr6D4tJMHebK6IHN20epexCr9zvUryu
         /RKH0FBBLihjzdv3xpuVzAbKGW1MOjRDQxYRITpCuOTSZFfuKWU6OZbvhsLKGEpPLRwx
         2Vqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        fh=3A8kH4g3HWEv9swkzaGm/c2jUIsxaRFBpyszRk+SRIU=;
        b=kScJgw9t2Lpxip6CIlYC1/R26tbPFA2Cx2ZJw5CsfTG+AgOsKpjgz5SB+kn+PhC/sd
         k0gdAP2lBwwsTJ9CVg9LP/QiFqw505Zbx7/BWB7A+cOA2VxFa2K/blMOOs7l/x5mJuhP
         fPyHIqkZAEPRhDjKiNSXe6G31u/thLk8SOmDCimxgkn/nIkhXdTBbQwNYAPNpvSodRkr
         AoHg2u5ScOTY04oxpbikujbU9gWAVnePbYAZhO2/LZ6YwKhdLWn8C5pw9BN+xrz/lXnx
         gOBdpNHuyl54DBR8gspgFKEU0Z0O9PqlbqiMhukZtTTBzbGJ6gn82uFEfFSRiiPiiy39
         0uDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782729453; x=1783334253; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        b=yNLt9r9xtmlcY4hQOxUHk6RH3pxvfxn2ARq3N0PeKfYTGDUFyE8d3aLdwswytFWgGi
         4IxnsS6oh8tyJzF++FIwCHYYTeb3esPrdfYhuzq0WxfI5vxjk4qo9TA4yoxkBMWJ/vol
         UcwWSFQ5alScG44B0rHsJPpA19v9IMVF6xqIxDx1WsORJM21NU4WibuxemOnXFW8TxLs
         VYkNnnF+Jwm2NbG6em9jjmwhjhyngoTEXTWB99oTD/z6MW9Rni5ToGKxBKNNaI01wwk8
         pIXE0ZiSck51LUf4FPhkCsOKNK3trxngGlwd6MAkkwil7bys5yHRdH7MhFIIv8FnsyTg
         OZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729453; x=1783334253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        b=JiDsCEz10hR78Mz3OmF4riNsgiFAa97abmmsBVYmOOr0BCj32SBpG4mFxO1utaA++u
         lTiqZpNs8iHfoQ/RkXjnXWszKjBQsbX0ECpfsl7i0DDuh9dp7D/6xwNHkNRUJzJctCOh
         9Ottia9luJ7pwbMfFt0LqftKOK0UD/6Ac9wRn8j3EmVzVNiXylvSN7LgSl5K/Gl9prnN
         4sl1Jqw0Y9l9nBE7YkIU0GrlQaGoYFKHTUCUDjeJFDbaVKXX7A80hVuIG/qJBxFLPoZo
         TCFPCuVV1ZNibzMhIhKUkSM0yPsevhpB5pfK73dnrUG9MPriSm1GxiVygMLaI+QhVD2K
         K20Q==
X-Forwarded-Encrypted: i=1; AHgh+RqVcxcGKkXZuQCTFXtNqoGuHqc/e+PkGNHWtWF1Ovqk1xJsQVXBk35fFXf+UCTTNmTmbv4puTeSstzY@vger.kernel.org
X-Gm-Message-State: AOJu0YzvLMJsnqwn6ldjizDffCud1ibVgPgPMJFgbJwCoCCew2DznChO
	vRWHPmSFpkqE8GNX2lWXFXSeKyUnChzA6rvI8nuuR+ydoRggxupmoF40AUglZcOPVQ0d1nf9N3U
	pXpxGEp2QamaLyuRkqxy3U3WJ8NKpLqLUQEmNc+teqQ==
X-Gm-Gg: AfdE7cmGtIQ9IEAvYC73hyw4ZRxLiDv6+xzb60uNVBmax754VaPmAruuCvoy39nbxtU
	6DHavR+1752NRskemQmI0eaDsUwK6w42AhbrNmSd6QuVjHPkuQRkOeMLesKDY24ZVRJw7Getd6s
	kZmSpeRdQrqZLyG3ERXVnJeC/FNikZhCAdrIDoJI99khutzZ0L59tZqxS3BNR//+rAlVldu4zvs
	ndlxiDqDjIAu8Ofhbu8LUt9yX+cURN6WbgmDmmGuQiL5tHOjM7KO5SZ3ibOUqk5Mutrarbk5KgL
	KjICpTyGlzpzKh6CG0yhu3Cux0Cc1g==
X-Received: by 2002:a05:6402:430f:b0:698:3f58:9290 with SMTP id
 4fb4d7f45d1cf-6983f5898b7mr3425467a12.20.1782729452868; Mon, 29 Jun 2026
 03:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-1-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-1-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 11:37:21 +0100
X-Gm-Features: AVVi8Cd_KzL4j8x2t75zH4aE58eWi5dZrC_hXca-XTNOV6txB2qHwNYu_bbkjxY
Message-ID: <CADrjBPoa7pTyfANuWznzeoLm7oWdWGcJbGxW4hmuSWo-R30SJg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Add the missing TMU_SUB_PCLK clock ID for the Exynos990 PERIS CMU.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  include/dt-bindings/clock/samsung,exynos990.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
> index 47540307cb52..c06f591d9d90 100644
> --- a/include/dt-bindings/clock/samsung,exynos990.h
> +++ b/include/dt-bindings/clock/samsung,exynos990.h
> @@ -434,5 +434,6 @@
>  #define CLK_GOUT_PERIS_TMU_TOP_PCLK            17
>  #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK     18
>  #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK      19
> +#define CLK_GOUT_PERIS_TMU_SUB_PCLK            20
>
>  #endif
>
> --
> 2.54.0
>
