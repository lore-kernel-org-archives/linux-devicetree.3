Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872043;
	b=3gd/jm1E7BprVfOH6qTGN1uqAUKktzxnyIa3criPcprZxe5xXm/qFY/kCV/8PrfLVB7k
	 +S8cai6p+EhCF4dw3wxfyMJtj0DhxZnYu2eFdm62lI3/Ccja984hbfc61yCbx0TjBQG2s
	 zxP9UGvsWTxW2vWbhABMNzTxbzYufbKh3/Oh+aJGJARduiqKdmpja86K3zpCpZheMSkYy
	 thmQQ9twcCTjDFF1qWXFPu/ChaBqaZlTLd1ea0PlR31WN59SdSgpDuPxqXc3nG9lMr5ZI
	 cM1clOUR+p26GQKFLnwU8l6XR5VoIRyHkWGT6pQq4ioU6Gp8HDYcff/XwtqSL60e8IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
	b=AhCNfr133PM7dZMOh9ovPeaSMtXlnJi16jQSiBVhbAegd8swaOtuLQ+x0MRSyeo1gpTZ
	 +Kqh1T/dHuP3LvmP16PdnR5xcjHOw192YtQpd9mxPuqezBF5S8sA17hSjDceBZOWZ+JZC
	 s8/HfVl9WI0JRZmQTrdbsXMjwwADFjmODDdpZwBu2H5NAsd0oZ9V28mMyEu1wf64r+N6n
	 JU6f3kkSJpQ+LC/Ev9Ep3UIMGqX7rzz1LjMB1uyYcgjMC3Yh+E8/5UFgiH6nzmpvGB3qQ
	 aKKS/ylxsXuFACLYQ/MdUGH9Cnmd1TWvLLzkRs8W+O7pqKYWpW6ZIl9wp70lzGkI5Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RASG78SQ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BADC606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BADC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RASG78SQ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a215e64962so15407245e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872041; x=1794476841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
        b=RASG78SQJZb7zly3rDtTUgyOxzbegHId3oxXTHrgcPPTO7wKUsm28sWnWodJU6lGHj
         Xl4lgSwi6T8p8iO48+EYJyut2DlkqBgDidTj54wXHNwFYg81frFZE8Q7apcHbehGyfUA
         oEBrf2dIpQtOCwWHURtTzf2Dzmg0FgcsA/tVffLX9VOTMSbrVTczidrPCVBSUmPfF8xr
         VdCf7x+UzAcuXIV8ZgZ7/IHSey42eTXQt/qVDbQZL/NKaCBoqsLCKXtWNZ4qjue5YjS9
         3KNNVGfvWsr5ovwtxywRvbMkqZpXcjcM2JDvQJQyfSpzT0jiqJ0bYD4srOLe6uto7P4W
         fyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872041; x=1794476841;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
        b=mlKCJVxCpjgCCAKljd8J/hgHMROg+psU4fz0aA5yatZMyAbE4xaP0lVNQCglZb9eyz
         h5AxY81ZERG30PwJVlk+ze8tVFL+qxYkxeT13rkotR+N7rG/uEh8rJOWp0VxUms3NzYS
         TnhgGMpIuLfl49B/h18+6fE6R94qMFiDtLooV+KoTcATH3JzLrhRPteRIC/xPd2Ls9Kq
         35y4CClangnJzE/XjFLNfTEUV67+SVpwhzMe90N88jkn0Z6N0gnR2eE5yIbfbWRwURHr
         7lx/TPTJLW2TQkRZRebm9Pv/926945i2y9o0DjPhDlvhaw9ly/24y8o/7qRHd86iV0Hy
         TOog==
X-Forwarded-Encrypted: i=1; AKwUvByOK0iuSwKNDqZSUQ8gPMHSNZGdCt9F9hxGusSs4CE/5xHCpoe0vQ1cSWFVPHlSm44kq8IXz801tgsl@vger.kernel.org
X-Gm-Message-State: APuU4Z+QqOYYM29wAHQIt5yOEpb3DsXbTDSrHmjgmX0L5MfyaKXPnjUK
	1s+lAMq5XnegDnkBKNpksGw+mhziaX/+//ePx4ysEJSe93i0HCPpAjHuhYDsRejs40g=
X-Gm-Gg: AYBFou2XTMbazGghOgPrzjhWCGIappICnu0rqrBKyBvI7pi/iQUo1sTtokrwN92r3+J
	J/mADo/yOkwTz3EPFo2vSfdvR+ZDIHFwhG6WW+8tUHOJ3iipF7bjX/Y1RzOKhq3WK6DcKLAZhR+
	ZQO7UDgs9c+5BTMi0Kt0UN+Wi4Ga9PLUZJw273UH/LZOUvR2dER0dkwtc0t3we3IpVeMhxK4g2V
	gQEFbbUB3rFALputnIjF7XT+jLxq+eYQuqhqH4b/+XY2NhyR7C4WgrKKeDmqcc7RipiCSiPa9t3
	5zLVzA88ZaSPWac4935UOMHoGBb1cuJe3WfChO+VJ4WtOThLfwWllbA4WXmErL9oLHk3jd6jvFL
	dw+y3Aj3tf4v7N57P4k4P6YzS0Qk9RbnqY8nF0n2sXmL+uwcZjSTMUSw8LbGE62QYslTbCEGHoR
	dAJHuYF0EDAKALaqPh/prLhvh9bpuSuqKIj38FfQJxsMRnBZWUq7auaMxjiAFkGDm9Ayq/2D1Q/
	cXm7MrMScQCVUi8rZhTwdP4AH3Y8YL6cVVHWrlRAw6j2Xs8KSRgtnzF7SvvI+IQ0HNkbf7Mv9K+
	8ptfTVX7KkrlpHqBPVryqhLP6ZnqFzLm2swJnfAA
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ac18b7df2cmr429163325e9.23.1793872041405;
        Thu, 05 Nov 2026 01:47:21 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d71dsm8886594f8f.36.2026.11.05.01.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:47:20 -0800 (PST)
Message-ID: <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
Date: Thu, 5 Nov 2026 09:47:19 +0000
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
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2026 23:16, Vladimir Zapolskiy wrote:
>> +maintainers:
>> +  - Andrew Gigena <mail@andrewgigena.dev>
>> +
>> +description: |
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8150-camss
>> +
>> +  clocks:
>> +    minItems: 42
>> +    maxItems: 42
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_axi
>> +      - const: camnoc_axi_src
>> +      - const: cpas_ahb
>> +      - const: cphy_rx_src
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy0_timer_src
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy1_timer_src
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy2_timer_src
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy3_timer_src
> 
> Please switch to the new model of describing and exploiting
> the stand-alone CSI2 PHY devices.
> 
> Any CAMSS drivers based on the legacy description of CSIPHYs
> should not be accepted into the upstream.

I mean we are just adding a new define for a SoC here - not a new init 
sequence.

We could move all of sc8280xp, sm8150 and sm8250 to a new driver 
topology but, I don't think that's a reasonable ask for a small change 
like this from a new contributor.

Certainly would welcome the transition given above as a defined and neat 
series but, I don't think there's a need for that to include this SoC in 
100% existing infrastructure.

---
bod
