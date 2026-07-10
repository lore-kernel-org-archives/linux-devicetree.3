Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BC23C2785
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783719665; cv=none; b=fI9dAoyWLJ3nIyBBAqYerDhpk32DpqG4XlAk5rojhXd0L05tSryQ4x49O6I6fSO/hKDlCfd8+oydZWtRC970BeGsJden7nZV5sfVs3Pr45qpd59k6uVNtHmH7hPo1UUeFPBrinr+oZ2e+zjrVrSJaTYjuKF4X4k6eQU+3kS/BFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783719665; c=relaxed/simple;
	bh=sRLsKhX3nbX3ip0h+lFJX6a9doiDlrP1aVmvc5UQZsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIiLuXf71dZUAmk5vgLmFHM4Wc55mWedSWX+zIdW6GX17lRfu+FFSL8ik/yj+2B3PjHDZZ31YTQpGGCVegqfzX1yYvEEbg6yZ7Y1EJOS5UVxp06Fu18lP7gytmxVWLXwzNPL8ISJtV1UmYIio4OxM8XtBV5uXOsnlykVcEiltak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7RIYxd7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7RIYxd7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso1311895f8f.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783719663; x=1784324463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98z+F18zm2o1eM5nkxQ5VKYEoQh7CpUJdp3ti2B74Ec=;
        b=F7RIYxd708YM3jQHsLdNtcVcoZ7aOviKcVmkiiGo0mw7fvIMpGl0CsQgrlft/cOoKG
         kSxqFPAhQEDSKD9vtdUO3nC8TR95bDPsIkFAJZPEzeKXeLh6zN56ERp8njtiz0nSwJLV
         rFDjyB0UhTpMquTModkqZZTPRT8CKZ6o/8cq0vORdwFq3+SxTucffQf5BWaSl1Q+ChcT
         3c74Gxh4yEFqLyla7jImI1NifWzRXT0u8zNHNGUMFntD/kF4BbVw2BZ5FIuqrMae5j9Y
         OOn8SwEYz1BCFmSSeTPf2aMLro5JZ0hBakzJ2mCcNneCI2K82MuGjRldftO5ZY+sZ84q
         SMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783719663; x=1784324463;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98z+F18zm2o1eM5nkxQ5VKYEoQh7CpUJdp3ti2B74Ec=;
        b=RYuKKcvqFarkx/5yTiQsfjRPMi8Y8VHc8U4bb4HhRabvB3IzBs9h9BkQlk8dtzvHJw
         mDr0J8pm8uHxziY7iklOYzAD5tk2e6eXAeKiT8/QokqlcgFFiU8z0JPtsmC86Nsi8aJu
         Msra9COovdyjV2rc6aPg85MErzzymJTkDR4s27+O1xY5C+eqoxgwMKMYlSvXI76zJazI
         gBlXX9hoePN6vbA9kj6XY6JKZeD4nUWKssX3Wuwg5v8eaAPXdS/gWSTjGlLqBafkFIXO
         Q9dvCiZNBTRgHO4akmJXBxwCJH+FjjX2I18O1FKgTGgpcOWAf77+JSkGN2XM3FHUkqUX
         MVsg==
X-Forwarded-Encrypted: i=1; AHgh+RrauSzYLHMC0DwQxp+S50qAjIxMqHrqaRpiFWRgw4OgKzGctT2rw1o+TGoFBdPe7JsnzkAkjYSAMYpn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr5AfWWo/MPKcqaSDQHkVwrIe8JWewDe1se1H3msSAIfMnJsOj
	MlzidhcBuy2vtrh4nzVKzYnM0NQeBjMEDx6tlG5VUaftjx6KrU0iQCts9g2c9tMF8zc=
X-Gm-Gg: AfdE7ckyzSiR9Lt4JRD+aFdJkcyEzqC3qzzVuI4wqAxzIm7tJty10AvWmCPHOT636ep
	gicAfhJSFdIvmXXfihRbPtgRKMUcOyO+4LvwHBlp0x3M13k2ht+B3UQIhQahCXH5laplURmd82s
	XAu09J9uj7K0/9HNNMmzhnIDuMWA7pqEFj0UbuS0q92RuwnqDPdMjJt5EDg5k5F3+yBaP6nxsSs
	p+SduRk3E0H4qExwPCwqSh7heJhRoCcea8pHzMQbDT4728NX7tgJ4Yfp3FC6M6xjwbAMdx9985F
	ujOnsdpIrd6QM3xvPvvHAHYKH93ZaHtRxVF00yJdLio/fHaXScQrtW255O0F8tZzVGoJlOB8U3G
	kjEcAm/VZAsArnq5ccusJyEZHWOJIjj67j4oYfnS+Jni9L9I5bSlnMBMj5lDVJbeGfjuUDCEQzJ
	U/IFsIjroxdInCRtS5I1R8mWpB
X-Received: by 2002:a05:6000:4284:b0:477:b22:488d with SMTP id ffacd0b85a97d-47f2dca803amr471641f8f.10.1783719662677;
        Fri, 10 Jul 2026 14:41:02 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.243.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm65817946f8f.21.2026.07.10.14.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 14:41:02 -0700 (PDT)
Message-ID: <54d76244-8ba2-472f-8577-b5d445d6ede0@linaro.org>
Date: Fri, 10 Jul 2026 22:41:00 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-5-51207a0319d8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260710-camss-isp-ope-v4-5-51207a0319d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2026 10:04, Loic Poulain wrote:
> Add the uapi header camss-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> Signed-off-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> ---
>   include/uapi/linux/camss-config.h | 161 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 161 insertions(+)
> 
> diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/camss-config.h

Why haven't you based this on the HFI stuff I supplied though ? Its the 
same hardware right ?

---
bod
