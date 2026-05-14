Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3915B41C311
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770024; cv=none; b=Q7sgZb8vZnMEx+xHs20HmcVbjd2k8U9xZplHE+lbb9GNNvHe55FoAs1BwlDYImVTdtQbjNu8hGiL7aD3JgFcG6429VBszc5GBWi9tqPL0CYPVL/lzp04FGx7yH2KT+xyIJp8QzPYTquTqEj55+Q8jy/yH1MD/Ic7DIoREEIYCiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770024; c=relaxed/simple;
	bh=XBgsJzzh1Igu9BQ6ze8gVJXAK3iTc1uKe+SPXuPW3Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLK4v8oNBS1YTeO/uQKL/JFUIADYm8CG/3d9CeW1FpgiFOyQJvegXV1TVrbM4W3isfhLiPQMgabDz6cPDxi+tbHWDzMvw7t8b+jeewBNX+WQI9X8qZHhEzI7SChTnep0gLiwSQL8p6xfotSyPeXD5Fr/Ji+3KbPyYYl4eaQ7i8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9aXNEzT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9aXNEzT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso92321665e9.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778770022; x=1779374822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBgsJzzh1Igu9BQ6ze8gVJXAK3iTc1uKe+SPXuPW3Mw=;
        b=r9aXNEzTrD1KcseQDKeYOVQhoeAT4pGIUwJduzays8C8A0opR71zGhTOsRvtPWJ6/x
         Q4p9Yjq2JaMmoz5gKDz6TIacZVKE/ySABBkXqV945TQ8OYwFYOQQHr8JkZj0Zt9Gb68U
         wXj8QwZDlt6vr1xPFNixvd5Wlwenf8NCF6jRZMwyfSPpaVV8ayXwz9SDUYkIK2q6mMRW
         MBfntvywir6CSs1nVai4VZIfxpyKoRqhM5HsmJ7g7/0FrTnlpLomos+l0KKnMoyBLjuX
         oTM05JBeEkYYMAgGmuOopKo/GeqOV/vVMSrE3udq9f5FEYhiAHBB5ARzvIb/RE5sJjoe
         lzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778770022; x=1779374822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBgsJzzh1Igu9BQ6ze8gVJXAK3iTc1uKe+SPXuPW3Mw=;
        b=sQquLxd8WugJxDQma2VVnGC7befGqOyLy8F5nFwFdZwWtuoqSkdPO4iPw0xEe2lqLP
         P31j2TRiUJ5YrEpukMFn7ccX3JpdTVzt0Pfsob0f9vXIf2QJ6GcFX8jeYV43QgExcxP6
         381hcjHqW/gVvG9wT+YaQDEHNnI9luTjfKxfhMZToPdIXExp6jkCetT409rX1RIdNBBF
         MlzbY0/FkKvyVdoZ0WG0dtMvsI6kVEf+MG2wthFQvgHJhM2lg1GlJHymEy7TpsJSO390
         bxOLfn2iLnGjGdWdVOkHlqqdG0SdZkVX8tyVbpR08Fo8H0r+5sKhVza8vSr9Nu08ywHJ
         EZUA==
X-Forwarded-Encrypted: i=1; AFNElJ9L1j8HSxSr6xC55uebSigwHyxYKTBkL+KyDLoAztoHmRVZesDg/ssd2kaTBAjEnMuFMHnGnHT6I9uo@vger.kernel.org
X-Gm-Message-State: AOJu0YxJrfYmpTk9cKaULphdNVx2Z0r+aH6Zt8AoDGEaxPed9uSgMb9N
	wMWba7eAaqyjLdehXYp3OeRu+J/4WvZ9IGWpZ7Gk3ktI5ZDUDAGZdS/XWTWEz6d+IXM=
X-Gm-Gg: Acq92OGql5OFAWh7S8Aoc0hiGtTThkYMgOVaSDFcprsrlf8vpMeYmcg1MgAKpFnruok
	UV0Jf3o+gSGxxp14tuJqI37CPA2yl7tt0Fv81ND38QQyAycd71fWrDhG+G8HHWstPArsAyIlbJt
	4yPYzkmdPwKg5IVGVqmOsgkZMKsgsjBC60641+Mj5d7qSgl6MTaTOLzHFNJMDoBSYE+efY40ZKM
	oNITCvJkVLjrcbWWc0KH+hvu0piqk5sh+po42jfa4fI7QXxl3KSHvHuS5u4Eh1qBwljfw1Ewifh
	QweeHYtQTVEQiQq3t2oRCnaZu2xBMFfW4hBf7ecQgGX1uCk8nUNsgzBdb8lN3dYQKYEIVSWF+8n
	dDCryHfaSb5hs5r9CNqFGPqjKYg65oNl0I3r2XWmmaEkuj2sMdwRGrATfpN2AJnmeoDKTPT5Ea2
	IyyENl0dbkUj7LrvJvAnUHN4F7mSys/i2e
X-Received: by 2002:a05:600c:a02:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48fce9d9271mr113000745e9.15.1778770021624;
        Thu, 14 May 2026 07:47:01 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe464e92dsm2595315e9.1.2026.05.14.07.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 07:47:01 -0700 (PDT)
Message-ID: <e91496f2-3b7a-4982-992a-91e8326367be@linaro.org>
Date: Thu, 14 May 2026 17:46:58 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
 <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

Please check sashiko's review from:
https://sashiko.dev/#/patchset/20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433%40linaro.org

does the gs101 pmic constraints apply to e850?

Cheers,
ta
