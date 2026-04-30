Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDE9428466
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777556418; cv=none; b=nREgyR8VaNJBi3eZGnMRFAraxGfow5+63BWQuQAszQ0TakHh8bmTj6JVfw5nvBJj8m/egvFDUeUM3AzoZ5PLX5DZ7RS3fL9YeCNEfNMyVd7M8hrp91W9aAugmFsXmEmtM4g5HK3xjnkxnLarT2+mNAnzoH/s2kvLZO1/h96fjPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777556418; c=relaxed/simple;
	bh=66i8SiZie1Gm4LFg+caCbRColkgs0M0GxG5EPWDPZas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bj1oLZ9SY2zUTHPV4kyq97qLzuE1mGWMuBN//2/3ffnDReAbcNjPe5M5LN7xzR8MCG/kEx7XrplBtGPJ9MmqFs7leWrGX39T9qUMhoSEHzD4YBmdR7Hp4at9M12JvBkvZnibLqtg8CCcyOYH44Dxu/WODrzivNbfNgq/nrtKU78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EKtLRtYg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EKtLRtYg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44a14580111so93867f8f.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777556415; x=1778161215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=meUp30gG/FVsgvAEeVESK01aKYB23yJUpx9wfRGIDWY=;
        b=EKtLRtYgX/Nl6Ve0ubV9vwpQaGqjSHwvQifUuHF5emo5B/cT8jFYqMwgASfY2b3o0N
         BqkoHpbMByB5Yj3zGcDYK8tg9VjxHViKYXcURXSTuSQZkOY6c867G/Gg2o6NsBDp9Jwr
         kTWTv7yw0ACdd+BH8YRYqe4YTepDEV/h5NT+AeK44PBx1qReR2EUwDDkz/U3mV71LdX+
         YWM5B3WDp9H1WALbDNEf/oxT3WIBT12kA7AyfrPF+OY/ew503qkFE3Bm/C+6ykIMZFJI
         XL7yoSBWHAPWHyctLFQCHNXr03YC0e7EVjtVnCr6WjFYDx9nSJWiRcqtvCR6GjKmrZaz
         QbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777556415; x=1778161215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meUp30gG/FVsgvAEeVESK01aKYB23yJUpx9wfRGIDWY=;
        b=jXvWF41+cHCFn4lOooDGknnmpLWpcvpps1zDOl4Y+XzSTAl9L3vTj0SPW9+xUSzvIp
         h4DETWXbeCxqasguGq+DeimSX5vCFvoei3kZgdm2ZxLM5JWt+gyVtS1LOpRvsEZDVfPc
         vQrPO59TbTEdaHBXb8al+Nn7pwJWuDYUufzDW5sTqoM73uyeUARydiHSbIPh0b4mWzp+
         /eGlPETgWZRemXyJa7yLvaskLNrfjc8W0NZtg/g7ulSCjjL1EgFgr7phdJMYyVB3Slxj
         K4+CqkUTwMGINWli++mw1V30FfX1L9mDm2+PxlDNOiEE0IdgJHD3fxph0nMoQ+FXSbMx
         Fc9w==
X-Forwarded-Encrypted: i=1; AFNElJ9Os1GA2FJdsQlcska6r5LrBt9nkSm7Kjr2dxNATcgxQT9C+LFVARXcRLEFjvGjaWUCcFz+8Qljkzbd@vger.kernel.org
X-Gm-Message-State: AOJu0YwPBQCfxZxyFAxzwZ0LS5hLXG45/DE7DvTEhh0St1zhUHl/umNK
	FDuLTtvElwyBlvmvrbeRGqQ1r7w1f2cuemKKbNV2kO0syobySOMxfjPIWyyCyGz39Ys=
X-Gm-Gg: AeBDievGtc9N/FN9XuuF6Ts5p5BmdK8Xg68mnZBHDIqBGAN9+rqN31H4WSedSiAhGTH
	H9/BfLTcKqbxeWOm2W7Pzl86brgMd0PWGRD8U/9ja6r/rdh5enZX8ShzpZzI0ddHceeSMhouK6Q
	xgrOU0jsUkzqvlwEE+RowC16+TO0lEc/2rQ2r26gr+WqsvXojOddsoIUhlIU/MFmmnEgHuk+uiA
	DF1Vg9jtuIHBShzxVzwT2hdrSPPeF4cpxQ64oGJAsffUvBavGPpz4xTYmmy+5g30TvDB43BoVcU
	M0FqMk0vF2H6HEce7H9YxfjmABR9amkk2rzP/6DImY7/Zk3PB/hZjiOsjvyF355p7XVYCmr2jde
	M0fgO05i+egD3KpyURGZeNBNRF4RwTAoAtPROADE+kYUxIrzAniXhtH1M98xdSyIU21yG5EQM9U
	TdcBWGv9SWVm2m1pg8phgZu7+BljlMxOaGNOhuSFpDjdM=
X-Received: by 2002:a05:6000:1862:b0:43d:77c6:be78 with SMTP id ffacd0b85a97d-4493f42beb1mr5272265f8f.39.1777556415022;
        Thu, 30 Apr 2026 06:40:15 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca664csm13806106f8f.35.2026.04.30.06.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:40:14 -0700 (PDT)
Message-ID: <56c1bb6d-54e4-4977-bd88-9ce7a6086b1d@linaro.org>
Date: Thu, 30 Apr 2026 16:40:08 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <20260423-acpm-tmu-v4-8-8b59f8548634@linaro.org>
 <DI6IGZIW2HZ8.OBLZIORMOH2F@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DI6IGZIW2HZ8.OBLZIORMOH2F@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/30/26 4:07 PM, Alexey Klimov wrote:
>> +static struct platform_driver acpm_tmu_driver = {
>> +	.driver = {
>> +		.name   = "gs-tmu",
> What "gs" stands for in the name?

:) Google Silicon I think.

> Shouldn't it be called something more acpm-ish generic like acpm-tmu
> at least?

yes, it should! will update.

Thanks!
ta
