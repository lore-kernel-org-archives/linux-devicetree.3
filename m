Received: from mail-vs2-f35.google.com (mail-vs2-f35.google.com [74.125.227.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D163314D2
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952233; cv=pass; b=Adamk0GhfPfHjOL417O6bqNRvOduRByj+mXd47TuMBenEyg+GPDBronkIU9vnZ5dMeKaYIiCTDxaVXTn/56NF42p0lVX9a8iVahIklOLYM32SwrgZsGY2lAEQSm+C/eY9Q1OakvSL4TEnRTUzKgPBzqqjT2Fylwq2vSGT4d7H9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952233; c=relaxed/simple;
	bh=ciy5AYs5s8nztyVhIOwmEsvrjTLJIlrAEhcvpdlNER8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzluTr1S3kZV42CiX28TVKeanHfjTHDsA/8v+LvO6Oz3CjFAkHmsPYlvHTf2KK1dE60OTAZPWIHsv9vnERUK9M7nmzInjNgLW+aW+KuID8ocnqZVG5GP4tHxjrbNvG0bCwa0+5PmgoaI2oFZoQe+CZ7UsLRxFwxOzdwkSE02llA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uCF3L400; arc=pass smtp.client-ip=74.125.227.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uCF3L400"
Received: by mail-vs2-f35.google.com with SMTP id ada2fe7eead31-7bf8325ae13so716321137.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 07:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952222; cv=none;
        d=google.com; s=arc-20260327;
        b=Aju9Q4spBZbX0h3RV9qZ8NN+AeE8J9U8V3ef2kF7+uzLEQllp+P+gmK1kw+8icDLzi
         n5oJ6x1n3IJaq0u+k52SjfQdm25sUSo/MAwp3hzyzV9klFzYzAn+lHzUGfQcBX37a9R/
         +g/EVlAq3aMIkzYM9h+wkBQ1j0VVE7x6WdYsmDh0CUKHmSrCc886UJNiK+AFvoV8lEJw
         UXrQtSEKX1VGoQs2wmm2Rdn7ccDD61o66mitkD5+qMRl0EM7r6be6UuLC3dAXirkiG4X
         FKCogMVhbKnxOgF94c268QmY0jWuSKA99mIC4QQj8feTNtWRhtCF5nSxofXbRwu3lH2r
         5POA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        fh=VITHZjAm0z3md+Z9virqdbLp9wQvoHLXj2O8hcUAQDM=;
        b=RD81T43UnpgFaTonQ0U2+rlKOSA502Xsd1dzIzZ97TKDELHJnLBLYXIokQUn4mGH50
         bGqDYH4af/T4yJjlKU4UOBTrMn53qWspfB2G2EjuhMjDqwt0J7SQoQBYJU5ttYbWR4bk
         A2yjtTv2uGFVlPWbGs60hvPQQ4h70agQdynVXH9ObkZPIu+RJYicSSpWu/ZsQaCbCaZN
         jKWDgo+JcLwfsg7mIkc53e7gD98gi0wW4Q40p76Ir+BqpbsMnK3pafkihPlIJAmJltyT
         uqa4+0qcyBS9aVYaCbUlHdeT+3yYefHNVf9oOiqqMe/67rPmlOT12Ad+nEWPwQvgDDo3
         rKmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790952222; x=1791557022; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        b=uCF3L400Mw41pP+ID6dTCrQn/Ou4FPEJbBHdeII18Hoz2k1k4rre1rJFIAO6bUlwre
         z6gRPhTpXcPlz3nq0557AFvFh64IkDhE8gu0hkTjEtYc2AALo8ve7aHeBWZgT9kS+qGm
         Aahd4jObOdGpUC05G+dt5DQuF+dhHOuKKmZ6W24WpocQRINW+cTk76pKa47/8kSJj8hq
         vlvzoyk+5wxSfN4jV0Sl34fdQ36egSdDouJplkpNq5THjyyVeVWZqvL8by+BiUPNF7Xw
         3PiJS7vaaBE6zz6Q9K+202iOt1HVPlA/GK7GXLGJs75ihgepxby2XEeWJJsV23G3G3Nd
         ThfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952222; x=1791557022;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        b=biIGUfF/axjLwGhESsUoVgYwxRQ39K0d1SGHbU8f+C4BDWennt/n5zgHVZ9z0A1DH+
         dyuowSX3oFnDWjHbsBl05NlGEX+gd7Qw3SHSrXMUfH2n51wPk2PIRqvC/oYhFX4uroUI
         0v/GZm+IZdDwikqMB8WDc5jpotVgSD/SrZa4FLh60wx7IXukW5z5tXRZlrBVOc2J//Lb
         x8XcdV0O4Tv0cqtgRz4OW9YqDDmF3lsOpCngCVuZTTsM0/bM51a49F3QFzWWPDvnmqYR
         9R7jsCoqDoDPXaUGOaLD1nPvbRHnVBgvnfQKCrSP2XtZaDbH/qgyySeTj0MDAVSLsOLM
         /cGQ==
X-Forwarded-Encrypted: i=1; AKwUvBykInKg8uTrfuY1notpVQibsYem/NG8Kb/v0hD4X5WFscwslpW5F6mjx1vasjPzmZzP6E6Ckjp3FOi8@vger.kernel.org
X-Gm-Message-State: AFq9FYLvKEbbKbIt4mWudmGZk27c8VpTGb1tZF6hpIDW/fLKJieXKz37
	3bX/bgyNTYb2cqfmpjZfPCtWvjnSYFUBo42Q4pWgXE1kLNRy1OjWSg6oCgn5mtEA4eFekzg8xGB
	5DGlZOejPcAxKJEuyh9E7yR0l36sxV6l6n4/xIydCig==
X-Gm-Gg: AYBFou1ZrFBr8EqSASVXKXG44P6atzxH9B8KR4j0kUAmW6PgRJXr/CU5yIFa0svhMv9
	IhwFyj/BHAGZCq2cxw51RMrFDZ06wUQdEIGcyJJ3lGhlIxkEP4RG9q+JdloVks0fdmXMMTRVO0c
	Y17BxE1fBMwBjFCqj7qKuIXbF1hBcEFYYnOw7d8Hoi2PJ3cIMZiApzdq8wMZX4lhR6F2keiDZLx
	bRqaGjHxvCdxcu/Wz7IdnQBCexwCPEayKDtmKoMFWWksUhe3bGImgmZq8A7p9+nSwopqXugYMBW
	GhvkAdaXhp3FC3NNYKd2OVKOQdutcPvunX4VOEQFH9fv2bO3u4bmNruhf2lebe1yEcHCxEGONnv
	gdOCyRSgtFTVRViE3UyO6wG2F
X-Received: by 2002:a05:6102:f9b:b0:7a1:f980:e936 with SMTP id
 ada2fe7eead31-7c0f51a9b92mr610476137.18.1790952222091; Fri, 02 Oct 2026
 07:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:43:29 +0100
X-Gm-Features: AclHuK-HUUsrOdFljkk42xven02N-tiuZrJ__yBG6xUzcagLPJ7c3UWcflomjnQ
Message-ID: <CADrjBPqi3RWdUy-S2Vn2-E6h0OGhrFPWEcKcarswivOdPzFTKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 03:11, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation
> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 942a2e9f02f5..5a16665e941b 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -39,6 +39,7 @@
>  #define ACPM_POLL_TIMEOUT_US           (100 * USEC_PER_MSEC)
>  #define ACPM_TX_TIMEOUT_US             500000
>
> +#define ACPM_EXYNOS850_INITDATA_BASE   0x7000
>  #define ACPM_GS101_INITDATA_BASE       0xa000
>
>  /**
> @@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>
> +static const struct acpm_match_data acpm_exynos850 = {
> +       .initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
> +       .acpm_clk_dev_name = "exynos850-acpm-clk",
> +};
> +
>  static const struct acpm_match_data acpm_gs101 = {
>         .initdata_base = ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name = "gs101-acpm-clk",
> @@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
>                 .compatible = "google,gs101-acpm-ipc",
>                 .data = &acpm_gs101,
>         },
> +       {
> +               .compatible = "samsung,exynos850-acpm-ipc",
> +               .data = &acpm_exynos850,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, acpm_match);
>
> --
> 2.51.0
>
