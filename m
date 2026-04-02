Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29F637CD4C
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119590; cv=none; b=UjCYkryb7DQDqvmQnDDxr6VK9qbFVXXilhU0lfcKmbAHXbxBQu4wi3XPh21miJORx1cIjKFjEMl636M/F3TLX700D0ggkDdaVmzEuKMpKi8dGsCvgbq1rj0SpOLBH3UcXUJMIuu+g0/dK+HJ7XfwVCpN8Y7n2WVMhI1izQbKnk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119590; c=relaxed/simple;
	bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYWei8BqNyFjGX/xQI4cpQ5hGSj3tLql7MhBVv96Kh8pMMadsOdv79abm7309+9C05Qvab7Lb9JA++1BRtQuNgcxdaQDATa8xGHvPgAbMgZmMhXbi0oQUhwAF16jeRbfKcTz10+YFVQw7/oB1PO/sTE4ZSNwmoLeHu71KHy7Z0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEbDHRD6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEbDHRD6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486ff201041so5454545e9.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775119587; x=1775724387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=OEbDHRD6zavDlt62Hf8Yeb89S541USknmfSO92ew11z4hAE0xoo7WSiaULW6A+2W+L
         K+GN8pigmWYRi743U/dwWXisPy8xAYnnZ1ioSUnJGZUZC+3FmBAFcUPPYvJrRHGo9lVO
         VFXYdiKP7t2c5+f6CE720xSOaJ4/n051ynipwzOPbDy0snnD7au1z30J+xHsbJwxetxP
         fviyD0eTq1r69XXZyFmLDtcWBh1bCJ50bWjOoJa1wlLQGps8OZG7reCQV5PaWUM421P/
         YAWj/IZGK9quxp1KU/6/0J2COPDHZuZaLGV+gZVQ6bcqu0fvYMj/uVpoCvzBORtG6mA2
         WeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119587; x=1775724387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=OpqOznsZNdUdV3m/2k8AMh+iorq+8irCmRjBKGNOMU2n9ut+b/CosvyYBMhSd6t/MV
         33NWql8DwWkZQsm23q/TFjkdRUosZWGbRzvH1RnK2xJDm3zGR//ehv6ZoDfopTFnKtfF
         7yxa2e46vV9rZ6BwYH4vnofMTe+iZZphdKVR8ct5aJy1zQ9mA3VFiKeW8hXPXNacLv+m
         NwRM4KRy7WxDTITnDpXeYJvR+c036NTKf8C4hCQqQUJN51h/aHSOATITP1iFHh0b9c0M
         6BG0LkC+Y9FR2r4qxgcVts8W+MNuayiKsFdq1uRvFkDHAh+5GnOQRCfoIyLr8M3hEkZE
         b0XA==
X-Forwarded-Encrypted: i=1; AJvYcCW5ctmhbcdoaGheE9qw2E9xD020bmXCG234zdw7FLeGb3dNbpVg1ZkO/9cAtKKGCHlCHFbHENhqtU5E@vger.kernel.org
X-Gm-Message-State: AOJu0YwXVsaqp0Rq8PSysd4jSYkmRUZn5r+C9CSQiaBDzOj+h684BRCj
	sgY683q0jySuxchcWsNjIfN/+p+xSe6SEuxqqL7t+8dMj2vZf2/OPyW9xVWzrzEl6Vw=
X-Gm-Gg: ATEYQzyNtZ2kG1MPaR7hr6HnOHrPgYCiyz0/tsE/upvfhBVF4tQBFj1VNtFLpNEaZdO
	5rp8gC679TAA0IY1YDhEiWSq7HwMIohS2TENPVrHRae2+HTH5D17qQjWcedV7s55R3SNDUzYrqS
	1lbc/IdGDeVMMaqeEAvPc8my4EwoRBescyUichUTPd/p13ptzPhIR7UcpeCX4g0q9MABsmYsPB0
	3xcIP/p/XbPeBK1O5PucpaM8X6DGxOTUjsUmoB+5EHQinv94Bvt5do1x6CoRZ5yEIR4dG9pQTKg
	INaAM0KaRltGHU1FEvvYsGPRAD/qxWX9QcuNnXuhwQYL6PtRgDJ5zxmOMnex4y82sIeZcL+CP2+
	CmP9qUKPQxK2stdAQj0c1C0tgXfAnO+hnwXSwT5e/H0bgdxpM64L+Xo7rVCin/R9RpwJuMjgVff
	kfnIAR6/fEIQPrA86f7A35PUK0A00ulf8=
X-Received: by 2002:a05:600c:8708:b0:485:3949:e5c6 with SMTP id 5b1f17b1804b1-4888b6d4fdemr41857485e9.3.1775119586975;
        Thu, 02 Apr 2026 01:46:26 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93cf2dsm161779865e9.11.2026.04.02.01.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:46:26 -0700 (PDT)
Message-ID: <55953d5d-c4de-46a8-a9e0-8ff952707234@linaro.org>
Date: Thu, 2 Apr 2026 11:46:22 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
