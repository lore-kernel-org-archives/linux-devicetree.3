Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA917438FF9
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835926; cv=none; b=ZCL1FuIfm9dpHtuB5WyXm92COStxF0ONS+7NA/AskQG1ye2MwdumseuKHxuQjY8FA4A/5IroPXgzNKyQJsWOoNRNY9FxDd0LRaDvVdbYuTVuipseriH7aHrUAsEj9Ilnoia9yte7YRTsajXvuZjPLLd9+kvHOYFXfKXjsOgH/rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835926; c=relaxed/simple;
	bh=uSw4iLWni+08K3Y2XPPthhXGT8z8eNuujhWRQ0NoO/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8tkNWYJI4mFnE7GZT1VpMeAqCVAWPLlAWlPj3T9lZ4ynsnkMlAlz3g20ukH05PtNBPFDGzpxYIqrGv/hJGVxaSMOjPEdrV5nf/hmRaPL4svkf3M8I7Kk5yGPgt7l9z1y6R64XWD2TvoeuEFtiD3W00aG+ApfYzHsLccd95klYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHyyCsJe; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHyyCsJe"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a8721851e2so9873023e87.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778835920; x=1779440720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSw4iLWni+08K3Y2XPPthhXGT8z8eNuujhWRQ0NoO/Y=;
        b=kHyyCsJe2muVQQwvt5wzTDwFbOnpO8COGH0q1Pdfoium2jscGMdGqfANjXUVrUE3C9
         VnMimtm9+Z4/jWxsOwkxKqH06B7crDANToskrImuzZZmyEDQI5LkBfXmHgCnCjeIMt/F
         vglNcNGR0xahOFJallcd6yaIwYmzRlRgtyLXajTCN7l9vdELtSdSRAJ2M1UTqDHapTjH
         +Yz4pvf0EtoJ7o8/ZfKeQJmhUTokJQ63FCH4yHaaMdA7oIeG4SlNGyE7tTwahzxeRMxW
         6zcIjq4E3xbTjJ/O61qgrcXbwE2hBicr9E9UmN9PXmM0RVnfFy4BmejiKV8+3gRLe3n5
         hg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835920; x=1779440720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSw4iLWni+08K3Y2XPPthhXGT8z8eNuujhWRQ0NoO/Y=;
        b=QpuVqTvwFOB2ufCFrkyH9NkodE0XQvx1xvAPoIpNiuog0FPnFBfymPwV8KlsCxLyOK
         T8nQ8o4KuMUt02yky5xo6vAGaCJGFIO888xLJLbXZroF1sfL9NMd+vx2saXToGVzZBqo
         YAR20aLlO8zD2vfSu+TDe0fUJs5hPxRarazMkUErZBiQrcmBYcl562C2uOAtdXeUuzAN
         9hP9Wj7S3RkEIC2TqjI92REA34D1LMMlFUWv9/0ss5u5t+EqG6JW69PIqkvFROR4tDBE
         kv/5ojV96reGS1rPNBcJLS7JGa7uQR4OxUo1Ia9buI6IfmgtSS9EK6QBmDnfDwFdq2Pt
         +mDw==
X-Forwarded-Encrypted: i=1; AFNElJ8sDDNpJynuKLv7i42rnv4+6JRZDxKJl3shuhK2R9gKcDEBWkFcUQrpDUwrYtcAjOEQ+4Y3IGSB7Uo0@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ69A7XjjEyP5TzhwOtWdvE2Gjd/hYJOxcR5MAMcDaMUqx30lL
	I1sb+L+pI+RZNXcxZjUpsOJ+AmCydhjZhuhxKjFrxSSOlIHo6ugDfG4x5FB0DuAdjqo=
X-Gm-Gg: Acq92OFgmWs1SX6IYNse1uPwb0xWWnxUeokZOh5sps0PJe0FVfsCKwLQZy+/jrybNHF
	5TOjjhkA3+4SgHY9MsTgGFGemcTKnizDYOo/HyQ81MEZJp4DDAC1lHONWTyiwVBDhOs4/W/Nc6I
	/KYt6l5lpXE+amFjs/OAVfmQb43DwWjdkQ28pRwEdqUDuwLBxNFDIsFsXh8PyUjN4/cyhXshg9B
	iXsnDHdU3YMYEwLryjaOXxBhS++MhFIrme+ZMPrCwEEPZ8Jm9lCJNluyQ7HL+WUGe1Vh4Jn/M5I
	cGe3VcOxCnzEW3QFLuOusJDovzuY6Tiw1VAF4KOIruLT5cG/jM4RYPiwxgesBoASkRIaEclwOeq
	28UXN1d3FFR2v9FuzEZ/nNqXP+ffnJevN6vati946FUhEKVY3BCqrXbt1GBWv05d3yTpu4rpB+x
	n5duIdrjnurH9WNbfkjDaXF39023gEILJg
X-Received: by 2002:a05:6512:3ba4:b0:5a8:6cbc:60f3 with SMTP id 2adb3069b0e04-5aa0e769d53mr851416e87.34.1778835919654;
        Fri, 15 May 2026 02:05:19 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm13447979f8f.33.2026.05.15.02.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:05:19 -0700 (PDT)
Message-ID: <e91af899-9ff2-456a-a54f-613b859260e7@linaro.org>
Date: Fri, 15 May 2026 12:05:15 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] firmware: samsung: acpm: Drop redundant _ops
 suffix in acpm_ops members
To: Lee Jones <lee@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
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
 <sboyd@kernel.org>, willmcvicker@google.com, jyescas@google.com,
 shin.son@samsung.com, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
 <20260420-acpm-tmu-v3-3-3dc8e93f0b26@linaro.org>
 <20260507120003.GG305027@google.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507120003.GG305027@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/26 3:00 PM, Lee Jones wrote:
> Acked-by: Lee Jones <lee@kernel.org>
Thanks, Lee!

The set evolved [1], but this particular patch was not changed.
I'm going to carry your Acked-by in the resend I'm going to do.

Cheers,
ta

Link: https://lore.kernel.org/linux-samsung-soc/CADrjBPqzKpcd9vuCmNUptCUPyPpPbHcc19-7kN-1c0RpW1e5DQ@mail.gmail.com/T/#mcce154a7e0c6cd1ca6cd5a1e37541ed7a85a84d4 [1]


