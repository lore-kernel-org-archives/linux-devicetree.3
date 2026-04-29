Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D2F377ECC
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476059; cv=none; b=kh3DkFISgESelxmd+ulZXvTuSYUhBh540HtXbqpky0xuFd8QD6s4b0hpgMGnIRdiUGGF/A5t3+yRCPvFlgVh/Kc3A2YfWexMSNc3mWDI+uTmEYMNrJKfHo5atKe9ajbLB8Bda6QoZpS5V3012VfAKh3wht3/vctSGZFDppJrsF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476059; c=relaxed/simple;
	bh=G01D3imQ7+o35Ef3KRuQfIV17JN9Pd0G6yv1+UrifFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JVQEYuMYTJ3GRauDHdXgUhBi77756Tn+LB48q44UslhOqF+mZFapRBq0oSe8jlPcIEZ+o1swXtbuqXJWVj8jbiM8dN7OboqCCvLYgMh9FP3rY1TrK65AKVXEHLWN5JxAt4PRG+aOUmFiCs7JdNb7vC71GxuyVz0bQo91L5rvFK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lzsNQwSE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lzsNQwSE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48896199cbaso125068295e9.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777476056; x=1778080856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1mflq2JmCovYJyevIlYYXkXeU9o+ZpGv13YTJw53l4=;
        b=lzsNQwSEhng+nLmcAb+SX5pYjDtxV1pJcPLQSsS05vnrhXcquTsxitaPN2BdI9LMl7
         r+nftcDlD6HWNI491c5hHBNXY0CC3W48sTY52d5ib4zxvhBaQsEZA//z5p5IHjD3D+/s
         8NDlhjYuchKHpTpk2AR0KMWrCRV3TIY5QbxkkTkeGxhDotq3aWTuKAzawknPHXxs3YxV
         rXvJ+A+xGdSR2afXoF96Wbgezi7L3HsQFdy+1L9UHraG5I/1z1sgUeSgjSRvAzPQ2R67
         pTc1CgB5YjBThxB9OJJa0RV0wmoiu3xApBCUyNydZQCA7SBfeT+irEHpeB5//9rFibiR
         iNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476056; x=1778080856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1mflq2JmCovYJyevIlYYXkXeU9o+ZpGv13YTJw53l4=;
        b=adOuT71SgWY4yL9WKCi8y8/A3//6xnVja7B66kQoqXX27o4Gjg+g+tR4RIMedvayGs
         gCVxoMOJ7xQ91BMVbSZH7Vje4BWGOnfgmZn0AS/e+ua37V1u6RicBsRkHMe6Ebupde52
         OC4/PtmE8+MA9xbOEDWmuGkujob6koQd68t2qlrLpSZYVfuvgMIXpN1rvkJ0RNyp9BKD
         2hHxA6rBH73jkMUMBTD7Be+X5M6Ksz0SljFvVhBShq+43dHZsPCB/G3+KiIhiqYeYBDs
         BrnDbHbUoK5zsvEGe7zKpI63rst7P5uy7/ydMl7GQHMItH1dbjJMOnUk9KT5AtMbMYFJ
         BJ3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8HzR8hTxvR63BGRG3BeyUTIlNLm3URVvyn3fIF/rGmTIEGveAWDuUcHzCGP+FT/Iu/MvbS25Txo6bL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7HdtxPV5V6R1Hj4pYJX1TlLdD71PBisDHX00fHbz/uOsKOEQi
	KXgp2JnLfmbJXvJ+uAu6+Uk6Naj7CusHl/b9z7hffZPdZGquywOUuw8yEUdG/wKpZAk=
X-Gm-Gg: AeBDietRbSZdgxu4WoTWvC8C7PQUlShAc+c2lOEzK0cjwTMxoQb6x+gU9A5Hm1Yav9r
	ojvOddVzgp/4aFDfkFFlrqPSVMBTwKKyGEuj8geAKoa4dfTOGKnWlheHOEj1g3Fg53WTXLYu+Hu
	UoUUnaMPhgnV8JL1+VIn+eIRTS8HdpqemxUME5GGidYC1SyOikDVODMPmuBtuidhZcCc99iTZkt
	AHPfVO6FK9iYlgyl3j57P0ipbCrnkmP2IaHz41BEKWm9lpYfxeUKm4CvY+/iRscrpdQpPT3CHpu
	/Xxkcp7qK5wLnJcnl0TkNclOoKUDS1aOHinTJQ1UnSC5hoEiugx5rVMzmXE0BiX888SLCHVG5Fj
	C4hqVuAl+h2npZXXw3R9GcHluqRO4E1K5FgQabTORdq5t3chXsmeJq/oUfI2TgljAhmW1r8IvtP
	UhGQTY9ua22AZuDBYjVuEUqESyPG/4AuIebRikzEKUO0U=
X-Received: by 2002:a05:600c:4745:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48a77b054d8mr122018735e9.14.1777476056171;
        Wed, 29 Apr 2026 08:20:56 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5afesm5634461f8f.30.2026.04.29.08.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:20:55 -0700 (PDT)
Message-ID: <001a226f-606a-41fe-a684-c208d8898e17@linaro.org>
Date: Wed, 29 Apr 2026 18:20:52 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] thermal: samsung: Add support for Google GS101
 TMU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
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
 <41ebf31c-89ca-497e-b206-ece332d0260e@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <41ebf31c-89ca-497e-b206-ece332d0260e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof,

On 4/28/26 12:24 PM, Krzysztof Kozlowski wrote:
>> Dependencies
>> ============
>> - context dependency on the ACPM fixes sent at:
>>   Link: https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org/T/#t
>> - cleanup and prep firmware patches 2, 3, 4, 5, 6, 7: required by the
>>   thermal driver (patch 8).
> Well, cleanup in one driver cannot be a dependency for other driver.
> 
>> - bindings (patch 1): required for DTS validation.
>> - thermal driver patch 8: required by defconfig (patch 11) - logical
>> dependency. 
> Most of the patches should be taken before, which would leave you only
> final new firmware interface as dependency. Creating such unnecessary
> dependencies is not helping.
> 
> And the patchset even grew and will conflict with other firmware work,
> so I will deal with firmware bits and I can provide them via stable tag
> to thermal for the last patch.

Sounds good, thank you!

I'll send the firmware cleanup and preparatory patches in their own patch
set after the firmware fixes get in.

Then I will resend the thermal driver once all the firmware patches are
sorted out and a stable tag is provided.

In the meantime the thermal maintainers can still check the thermal driver
proposal.

Cheers,
ta
