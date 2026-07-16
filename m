Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1135838A
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192135; cv=none; b=aGqSGS1gWLMuFxNq2lTw9Z0+Xabukky8Vt8lJoNnUqMnrzoKFXxwuYtxvem9Kiw2iEtxld6/zrGelioMGvM9D4DE4jpejWzTGL+5zx23x3m2NNxT3ok1VXmgpProYtF47hmi29MOk5gAcPOHOnWvDzpv8le84/p/irTxQ6RY7Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192135; c=relaxed/simple;
	bh=kR48iTZj9uxDhqtCD4NZ2LQeM36qJutty7MPFCO35nU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQk82WU6Ud3VSiiMK38/tnTcr0PkTbKGC2dakcgzkkNf75sOVK9v4nFhIm5PiMAa1XUlcE5GInz1Zfm7TtnD6THh8cPCz5uO+YX7hZUZS3lGaX0uXTHG11ZDIxhxErMWgWw+ieMjDdOrKBybVpd8ZhOqsG6SBLeRV6hTPzlkW5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqsqjurU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqsqjurU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953ddae026so10259885e9.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784192129; x=1784796929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kR48iTZj9uxDhqtCD4NZ2LQeM36qJutty7MPFCO35nU=;
        b=YqsqjurUv6lGo97/Etd5lCTtR67wn/ynkb133RYsfuhEwzblhfW3r2g6XHgRTGzkYP
         RiKCKlz9l/oldWWtg3VpJKuqKVv7IdPE39T7rbJZ+MuyshbCA8xKMYLcD9IzshXUOfkn
         hxlm1u5dMSaMtMF6epVOfw1GH/6mgAk6dzotivOg9rhLoLnuahe6VWqPQOSgNEzFmquY
         +SZyGMg1ISHHNvPrgk7Qge6BgXXm6EI7rwPJ+qm8ZJxfxbILEHocVccsh5MTE+bZyE/7
         UHo0Q4fhggOHCZjFLOvXcIwtB/h210Pl8NbEgf/z6zTGGCF/bB91mLHFV7+vrSZBsew2
         PeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192129; x=1784796929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kR48iTZj9uxDhqtCD4NZ2LQeM36qJutty7MPFCO35nU=;
        b=Qp5S2UFxFjW6T0Wr4VuX8Om7wLH0nBzR+WfUQGK/OQKPdJWO2Lu4Ju7sdO/YFav07d
         sMS4RZXwoNNmacDx7KR+witBpvr/+6L7sWvRA1PQiVKZ9/KNYooySD2uTWE8U51K5pH9
         JzODrRYdWZglbImFnOT1uOqHa03t4FYh3HOYeBGDVnJAOG0/4NZdr0jAt/nXEcsQW3PK
         hOBwNw09nCobwZVmAf7BSb/ropTo7RrTuvMcW8841KAZSUqUEq0Rav6zsCfmbLPXo5Pt
         hBO9qaIm+hzaftA9tyaRpe7SdSsglbvlascLhe2npkvSBTAYXdDr/M1Dt5Lb64JSAoi6
         b1Ug==
X-Forwarded-Encrypted: i=1; AHgh+RrVzqveI+BuDIc3OoQsYJtlkfiP29wf7bSYgCna9EQAExKwfPrOTLCQ0fWMcTGV3ZuDjXd9R6PIcmjZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwyNnSiaODJLLiOTmuJa6gY0gK1cOGRLUGsIjfZD06F+o+NaWeV
	PNP/NHU5NLue/Wf2IGl8TfQ+2KJjGLz4D4kYsJqn7i5hB/KCpBwNIvrZ2IzcEl7vfto=
X-Gm-Gg: AfdE7cnkxYSr+gJVDqKdgeVreZhdVsAAZJEj1YIC8Wlg/OSO+mEbj45sbFSROm1skcr
	z6GxywY9QODJGhS4UR4yeHuNbCfsJyD1PL0tIZg2kRxuqqqYHj5j7Wqlgb2CTs9BV8VWRfTCSIi
	lV4m/i2WlCrQ+l1c+yirXx5j99wV68w09iWvaiJ5in0wtqxrFUdylypfzzXYQuKD4VhJY+GKuya
	PUQ7dr5Q0YIM+hykoX+WtfreJESkVAfLnm8/Z0uK9FUU2XM6mfwXkPYH2sKN/MPWLj8s0X/B1R8
	oFcVP4DM0tlMQOCZ2ZrTblMUsU0L2ghBL+vexoyWyG6PvlobQNKV9OfermroxmNUWigsjAv/LMH
	N9KSQ2SbcrgdlqoV5ZmIJKAByWcqpvNnLI7vPHnvXsQYXlyfeGPhNYtW9xQBt0Y5TyfkhzeRYVh
	mF/reT4moaAgzTR7F1b+uPaQ==
X-Received: by 2002:a05:600c:c4b7:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-493f89523d2mr212192825e9.6.1784192128515;
        Thu, 16 Jul 2026 01:55:28 -0700 (PDT)
Received: from [192.168.0.252] ([82.76.204.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c6ff429sm77947945e9.1.2026.07.16.01.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 01:55:27 -0700 (PDT)
Message-ID: <18b363f2-7a10-4e1c-be12-9701b8ef3412@linaro.org>
Date: Thu, 16 Jul 2026 11:55:24 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
 <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks, Alexey!
ta
