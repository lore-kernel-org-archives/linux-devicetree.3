Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088468;
	b=HSN56UqVJEcx3lPJGTHWP22yMG1wVilqPRHXRoZJFQzAv//qHCtkyXa3JPac2HYuoANz
	 h3fM9oysgKymMligpa6prvQKoysRML5bGaOU51XKaxHe8h2i+drl8dwGMCX8rh0ESecpv
	 ipBf5umopy0xR/AexGDsUhaSZpBD6463FIjf8+ulQPsvfft0n2wN8SPZS6k0Jq4BI866z
	 mSVMCZn9TsmLbOqkxwu5q2vrhzJ8VGHj2PM2anj+vCrvZf365XhECPpLU6vIvrIXYVkP9
	 SEtRQYDy5d3yC7TukvVUIFBkR8ZAZC4P5BJPw7n6vSMf7u0WAdqVgn4odMfQLGXwsdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Zn05LQ3W1lpoYmiGEPENrsqSnlYIcvQviJvLZUlNcNs=;
	b=WInxf9FlmcRxhYzvyiCXrXcEhdZs7BaTk3a1h/d7HEVWd+nHNahzIP0MmQx39/xSx5QR
	 bzNhmGcYlWpABVVYU2tcsKt04oC6uSAzJcDMvpE5L+JO2bCil6jaIzDMWZfNFirOdnjqV
	 ArALb5aUdRx2RVFD5M0bAGmijJLVJevNKZmvteM58XGqfxnPVEAEGT2/aWdCbcbrAxQ3p
	 uR4gNEzWXlXwZQq2NAEW0KxCL/3nHSp5mmGOy1IPv77/yWVjTA4K3A9TnIRZT80ebrOpc
	 BYD3LA8aUUkTj9ol07kEzaPkRGqpZ5RX6OtSObys0a7tgrIlgWkpne/N1cdMMcg6OvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="hLfVGe/6";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835D3606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hLfVGe/6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso7072855e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 03:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795088467; x=1795693267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zn05LQ3W1lpoYmiGEPENrsqSnlYIcvQviJvLZUlNcNs=;
        b=hLfVGe/6VVOPTA8v7FKdWRuQuRmWxsjr6S6y5jTg5if7Lzf0tQNN4TaXAQody43hTg
         wJQ4s9BffXGconioSgn0+0huHsdHw8oEFKYEr/6f+Ca5F6S8ix1HbHWCvhH8T/P0iLq8
         vxFIxLEdW2ZUIMsIfdbOSJhTy9GLmCs6UIxIOJliplJ7PWpk7Da2VbChe+7+h6OOEFQ9
         L7xKm89Mr4c6+lEJ5x6wmHxyKbxBM7vI0oiNqm9oqIZ8dBdUg30TDvoDDxhq3ekk1H4A
         mPDKNMP5bo9+Jz3OHygXjk1wRO43yxyCiu6xP0dUdeN6SmfkpGoAdTYd8f77OLQl3mYb
         CgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088467; x=1795693267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zn05LQ3W1lpoYmiGEPENrsqSnlYIcvQviJvLZUlNcNs=;
        b=Eaw8DQlpFVFvptuu0WQXYc41ZF4Ri8D4pYp+SbhiBjP9pHTEm8STQm8bEfAC0B0ISS
         sn0Vqmsv4hpZGyoeMnBa352JI6MUn1zb+okeeY/f1SIbeV93ta4VWRm7VlFVYE+KnzEn
         LH7DYvjo2605j/5xvnR1yjTLpoCnZRz/sIT7QR/aRg0VgiuOZbQNiH1ugVwJgQFlgVhd
         KreMSI5XTOSdH0rh9zXiUkMsWXsp1m4Qcv3uUcOMMzG/JErTPaX/UI+CMCd1YISWNhC8
         /IvOYI5RKLapmQypXBNlDVio6c6l6DF6CH8tVUfpA4kcUMx7oLhcTjhX9jLLINdve4fz
         uFxg==
X-Forwarded-Encrypted: i=1; AL+hErG4uI7yEBtfSnd+U5m28C9211eRkeCYyIgzTD3jq1+UTPdsR8sBmBKagbr7h9vlqvElr/+JRZ2AiXG6@vger.kernel.org
X-Gm-Message-State: APuU4Z/PnKQORcyR19oTjggVTpT6DhsHHi9EB8XLGBO7sWjOxz6Zt66K
	SolPEWkHY3K2Eh54+mQ0DGaEXb1eaIAGIWXEBWGekMAY6ZyOD6uPwJq97wqyqHdvyn8=
X-Gm-Gg: AYBFou0XE/xpvBfipwj6Kydh8RQSKwlmjn0KU/StoOtNErrfLU/5lyrpnGtkb65zwTf
	6GEN81lnbBE4GxpW1KWB+7RCMO35YLfLdplmyxFh+dlVP5KkRpE4rrA9D43ZuI5IuN2lq40//DM
	lpF+xI2POVy/VBauaMMgYoc0gmmg1Qgmiat6oVlh64tb5N/WVhzwQSBLnWYa2xuhilzCl+KruPj
	6ditt0CnNBgzDImaNQg/u4x353R5/6ZtPik6kUWEhJwpYo+6XI5FY/1ZardRGPhnXZChTCnMmPS
	Ikfw4AR3cnhJ++1dKHNHOwjOjEcG2FCDs4LHMv7X80UCPJD2aUnP/PgMbr1hI7njSQETLUIRwYx
	GNbNvVUzwgn2E5i+EwnqrtBec35K8SHJcXUJ6CUzFjbKXxGz1wDAc2zYbvDJIWkp/0jA6cJn0fC
	Ev5qFXDPbzeFoADFdYFbajkGtsLawrs9Wn9z4Zzj9+/p6sZpCA4LEKooYABSKlhK1RW+HVOQyCX
	Os4ayoya1IpFAdBcxOCYY67aubfGpL17XpGR6VkXnZ8wLhzDPA9orxjOjF9VYgKE7o6F7UNI/XA
	be0/CJxsbQA4S+hTFFdp6S1AB+F7YmrwCGu7m0Vx
X-Received: by 2002:a05:600c:12cb:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4bb861576bemr14665855e9.11.1795088466528;
        Thu, 19 Nov 2026 03:41:06 -0800 (PST)
Received: from [192.168.0.252] ([79.115.63.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c406sm9943663f8f.14.2026.11.19.03.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 03:41:06 -0800 (PST)
Message-ID: <fa1f0750-ac4e-4bf9-b549-2bb9a17cbb0a@linaro.org>
Date: Thu, 19 Nov 2026 13:41:04 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] thermal: samsung: acpm-tmu: Add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
 Thomas Turner <tturner@lineageos.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey!

Thanks for the series!

On 11/18/26 3:51 PM, Alexey Klimov wrote:
> This series adds support for the Thermal Management Unit found on
> the Samsung Exynos850 SoC to the existing acpm-tmu driver.

Exynos850 almost doubles acpm-tmu.c, and most of the new code is
register-level handling that has nothing in common with GS101.
I'd like to split the driver now, while we add the second SoC,
rather than later. The layout could be:

  drivers/thermal/samsung/
    acpm-tmu.h            internal header: acpm_tmu_priv, acpm_tmu_sensor,
                          SoC driver data / callbacks
    acpm-tmu.c            probe, PM, thermal zone ops, threaded IRQ, OF match
                          table, locking and sensor disable/enable around
                          threshold updates
    acpm-tmu-gs101.c      ACPM IPC callbacks, sensor groups, regmap config
    acpm-tmu-exynos850.c  MMIO init and trimming, threshold and interrupt
                          registers

  obj-$(CONFIG_EXYNOS_ACPM_THERMAL)  += exynos-acpm-tmu.o
  exynos-acpm-tmu-y                  += acpm-tmu.o acpm-tmu-gs101.o \
                                        acpm-tmu-exynos850.o

See drivers/thermal/qcom/tsens* for a similar layout.

Also, please note Christian's fix for GS101 threshold 7 [1], you'll likely
need to rebase your set on his v2 as it's a fix and shall come first.

[1] https://lore.kernel.org/all/20261117083442.830549-1-christian.loehle@arm.com/

Cheers,
ta
