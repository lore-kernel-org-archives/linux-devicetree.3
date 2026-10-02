Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A7F4C2242
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951616; cv=pass; b=IDJBVHiWt8XMRMlv3Dbz8DrqKKpbNZIKNnAvA5TuCdH0WNdu7wMDuO5uTHJMi0xPM+XOvpgPJess+0ZDqo40LoCFu/XlWLqQ23Hz35NDOzFSg5DFJO0IcE+cwE90ujJqEMyZjsUdDMGdyOnY+YIKkmmW8FwxL0ALDMrDAiiZHMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951616; c=relaxed/simple;
	bh=PNbOBNyXkRISuH2zKHNjb70SO7pk9MOzRaXz8icfJsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGzCeImxUVXS8SELdgk+GaedZ6z2VewSKInGqFvXvPkF1PIltMcODsK1rYQL0p7cOitXHrc+ddZRptXi3hhddbtlka8KgYKD0hSJMDHkEZ5SreCnXYFiLjUGmaQXuRG4e828wbjJflTxuH7sp8XAM6VcLNLicozuzmLyveDxHNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrmKBOwJ; arc=pass smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrmKBOwJ"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cca96ec1feso2309315e0c.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 07:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951614; cv=none;
        d=google.com; s=arc-20260327;
        b=G11brVxD45NfqI6ojQb7jF7ycjKZd8bWyxpUMw85/ttU1xuIv3Ymr6UruosznmTyXJ
         3/Tb3On21SK6OZVb9D2l1nSueEA7K9/XyLNaZWTJM5Dq8vZ05Tm6eaATAiHdKztEo6kZ
         5oBtO8cBwA+OwuGiEtnDKc0Iz4u+CrcK8MfYlBPdw+84vQJyqbciclphWTMsod1nPvHc
         BraOoz6rFOg8L6P08Iw1yomaHAxTF5q5IenahavaRN14dxbvKwrLpZ9revrExhqoii+0
         /RtHTUVcdOfN2eU9rPqkkksYaB38ibJ5PJ5/phKLDxY0UZDKx4YJWwYEbh3nv7XGscx+
         4Riw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        fh=ZdZ9IA8kMjest3KV5hXE730CDY4914Nm0nCf+yMSzDA=;
        b=g1javgSHurzxETnNS/5/ghpnk3Z/Hc+4K0W+QQc6zBWfMq9x6OGyovYqwF6uiHNjDQ
         rXqm2rLzFpoCe61krN7N4riQvveJkKthV0aOH8xufdXydm2eIrEdaWG0uRknNbzTc6Uc
         CKfXqgttnaJ9tmGPVQTjz99O12dtadOfN1RuXzkOgxRpMRdNOSyLszvuXfHKkpAhSM88
         fFayXG9pQHaB1wt8LsN7o511AHAzkaWUK77N4vp4GatSnpjUgb+On/I5skAuXet02FnB
         YR94YlNWwf8LlUD4qHHCs7h6EnP8DTiNEIMD5ustAzPXcZowpWnJ8kCwuO36DE1+ZvuA
         ZqHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790951614; x=1791556414; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        b=UrmKBOwJD7r+45MqNt0a/8g1jZY8qSEomvYl7QfBvV8EBMT9kRew5q9MpDrDD9Bpqk
         yeB20MD8lwLB9OE4YFHjCxacABO3b/wfK52/hBDvzDUTFvFE+q0ZzuyZNlyDx424lF44
         5e4xW7nymLZWDYyG0skw2xLMMWQpS6pU/KbjdgDPhcqMdQsCgNYVr+P3VZoy7FhYX9Q/
         ylhtD5+bWWKNXYsPx7help9iNcNk8B/p3pqGRDXdh+ztRffT8MPwYJTx4yC5rpzrH3Rp
         XLm/6WWydqOk6WsIErXf2Y1khklK/xWEHnwY0bemZcwwbhjzAVVHckmxyLAa5y8zMsz0
         NkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951614; x=1791556414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        b=w3kXLQGYlVFyehmCbL3FA1qHLGI03BLyffuAbNAnvoeAe1KQCwgTLNiN4bQTMBjbl2
         g2nWqqSz7KbXgFF5KSsA5uNdaJnmhNtKUtj4b/fJUWOv+VemuQDL+B2SeXwn8KiMpM1s
         H4P0leNl1w3BOvhtNnCqDlHkYH5ZG2UXLFJ4gFZ6JBpBJVb0XdXmTEB39b3VEZs7MaZd
         Wo743VchSZiwsija0vID1wSGW4m5sBxLCV4JBnNC5JsLb8LCqUeg02OSbLnMC9xwIGKE
         Mr7Ru6ibg3MvCYYlvEns9+IdU2w0/LjFYh2J+qZdIQsfkwvpatTpltIo+Q5N0MlDR0/z
         yOhA==
X-Forwarded-Encrypted: i=1; AKwUvBztY0ML93je3EXkfuJRdJ7wAYar+u9iYF2mECYAm6C2+DjuhFOB5kCFY8CUYLTyB2tDL5EHuG57CAPc@vger.kernel.org
X-Gm-Message-State: AFq9FYKjTWWfkHFENzbixTf6j4q4KH/mtfLl2owvDorYHuQiEPNDqPyY
	AhUK9O2ujvpfOc6JSN0F5el6O8BREER8Kl2I6GiMulE/7BRmVsdCr3lyhwGtlkfj098J7Zq2p68
	cb4G1STxi+jJZmb2om3J6ljUttSAI12xNZ1BqBBSRVA==
X-Gm-Gg: AYBFou2QOYvDWVsxlaey5nahXtDMbMxdJxUuawQ9XfRYdpwSFXKNYFY61omOyy1JKXw
	eEjso3CYkm7orYlHl6JQIm7vAQEnlWnFb9Zg1+kgoh1kyIB1rCM2zKq1tSznuzyJNmZpYx9I27g
	VKVQHCBLtFNjV/36O71fhdK/liyDp8q+ai6G1aWHId7p7ScSwogzjgS98ysLKk68K62tg9+oTgJ
	ZZXaLXTSBoq/QQRS8XP8QMd3MMkEm7xdFi93f+CyE1ODOt7eOestZ8+Yk296znRVoGUlZMgh9mx
	nXNSpRe0qWSmJRJfoElWoiZZJtbQ3HZOws4eMdQuZwrOncOwr79pvivvrxfaMq4cED83RDr5wAc
	geR4tc6N57FaCRA==
X-Received: by 2002:a05:6102:6444:b0:7ba:ea54:65a9 with SMTP id
 ada2fe7eead31-7c0f42731b5mr647395137.6.1790951614035; Fri, 02 Oct 2026
 07:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org> <20261001-exynos850_adc-v1-4-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-4-791b3516bb9d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:33:20 +0100
X-Gm-Features: AclHuK_nlsYCw4TsUB6KsMMTGZlzaoT0nlgKI-1tdzuxscLcNJSDMijcKeaoSvg
Message-ID: <CADrjBPpXvW1RVGC=mTO9sQncS3w4zAMKekwVa7Vbrq5OszJMwg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: exynos850-e850-96: add soc thermistor node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 04:09, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The WinLink E850-96 board has a Murata NCP03WF104 NTC thermistor placed
> near the SoC package die and connected to channel 0 of the CMGP ADC.
>
> Enable the ADC node, define a dummy 1.8V regulator supply for ADC, and
> add the board-level thermistor node linked to channel 0 of exynos_adc.
> Regulator is represented as a dummy one because we lack PMIC support and
> should be replaced with a real one when PMIC support will be implemented.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> index afef32ad4ee2..1abae8b9fa49 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> @@ -126,6 +126,14 @@ reg_dummy: regulator-0 {
>                 regulator-name = "dummy_reg";
>         };
>
> +       /* TODO: Remove this once PMIC is implemented  */
> +       vdd_1v8_dummy: regulator-1v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vdd_1v8_dummy";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +       };
> +
>         reg_usb_host_vbus: regulator-1 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "usb_host_vbus";
> @@ -166,6 +174,20 @@ rtcclk: clock-rtcclk {
>                 #clock-cells = <0>;
>                 clock-frequency = <32768>;
>         };
> +
> +       thermistor-soc {
> +               compatible = "murata,ncp03wf104";
> +               pullup-uv = <1800000>;
> +               pullup-ohm = <100000>;
> +               pulldown-ohm = <0>;
> +               io-channels = <&exynos_adc 0>;
> +               #thermal-sensor-cells = <0>;
> +       };
> +};
> +
> +&exynos_adc {
> +       status = "okay";
> +       vdd-supply = <&vdd_1v8_dummy>;
>  };
>
>  &cmu_hsi {
>
> --
> 2.51.0
>
