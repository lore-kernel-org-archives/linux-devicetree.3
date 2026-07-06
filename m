Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3903FE35F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341533; cv=none; b=YfhO1PWSDOhIxyE7AESvI388OxBHVtNiy0dd6drztNhsWDKFw1UHYYZu4NV0K7ypjCGgFR65/EthQydcbHNUxrvvvwNFu9EwHgWdxnTxK64DxjZYkRmGKnbCejemU2qEmphfgkSEpvpuQ9VPbsxy75s6/Xrw+bNP2mbz/amu3fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341533; c=relaxed/simple;
	bh=ZB9qw/FoktltYDTtZmKGAiHusi7djsQuc9QrlOagD8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7guNc68yfeuiYuTCPsgLEQJXTkmg/Kf/3WRzMBM2cvGdsTQbZQ5T1/+b9d3pBCfAXuATV7zYtWdq9n2Gt4gPXZkDfiZlR5bf00MggsmOWwpuhqp3SbLaF63huREXG1xmJrm/5owNxi5MrvS894dQeGlC8AwtCUVdLCKGd4/9fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uB6RGujH; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uB6RGujH"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c127ec4447cso381775966b.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783341531; x=1783946331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0R72pD2mExeKC5AJxZ73S5fYO6zCf9Lqx8bTZyttVKQ=;
        b=uB6RGujHOqaoyr1ZQLJR8lNbPuqVYIMxKuNZHXqZjk8NZlCUYDMJUnCAbLcbSQeIa/
         o8ks4Tl4cjn0P+nwbfJtzhN7AQ/5SeNYMeI+BdgiyZoqRbC1h+QpxyPK800bwOASTHdt
         3Uem8zZIdN/vUAyoyz36ZisCSR3bLl9uw3IZB/a5/abNqk6eV5NJuwvKtaZk4EjZ9heY
         ZxRSeg1o9sXDycgx258mz3coZFEDMQ+3xuS698RHR6LYjsOn4+Ikco75SBgKnnF8pxGv
         LDmE6lco517tZYZWL2m0gJfPJur9XNbHTAIZDWSCgYjwZ5TLhkXt3iGPhi+hiJCHvg67
         XDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341531; x=1783946331;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R72pD2mExeKC5AJxZ73S5fYO6zCf9Lqx8bTZyttVKQ=;
        b=KmS4jrd5LgzNWrDpygNlzNlFTIaZtEhRqnaIGXoygEILwOZ6jIEXLYGgj0q0Ewh3TH
         oPsR0HWlX504bbYi8yw034iPm1mOxI9Qy7EH5q5VoZokWqyYTYdY+wkgv0GIEt8hLFEQ
         Lr3e6/ZHhFwoc8K99+G1PbpyEXBbfQVehcNOK5adGGudUFwvt3PVKIUICbjD3GSZcQCg
         0Wyian9ZiftyQ2+2f5tcRgolRUu33sF+hUbVF1Ny3fwVIuAYhox+vHKp0BZc6mBzCDUg
         DQfsB+Aj16110AR8sBHzw+iG0tKntmW5OtfZkEYAjYSB1R7Lf4qNIamXiKG1sCy1WD24
         nyDg==
X-Forwarded-Encrypted: i=1; AHgh+RqV+vjXFbL8RD+rEr1+noDsKgDvqV2UDV2qtK+RbPdeFoBnUkDoZIzvrZD6c6prw30+2ui0mn9e5Cke@vger.kernel.org
X-Gm-Message-State: AOJu0YzqK9kt/QJc4hBwf8chNQMqbsJDabVCYCnLgNpWuyCQrzaL5mLl
	y34ng/Ip/fxRE4miqGZlPcqk1piEptWhsl8BfyOPmq2vueHUp2HZbjHcukP59boSlqsWYalq8Vw
	dGNkk
X-Gm-Gg: AfdE7ckkbgMpYcTProvX9Dy6XnvHSdgz+hvBbH16C6Bb72DiksUjamdd6PWIZSVIbnk
	1izjIDPyHJsgR8DQTK/K3axHl8rHhUrRmdiITCrfuGcCul9fuSYf45oj2rMBOyKFz/EZAfpR6gE
	4VbqPEj4/uWadTHVIzLduuZhO9MQWFqgEV4IPXjQGqcl3KkUARGMqm84PEXG/6ep0wIsVcGm6gS
	H9Gb0RAbuiFW2ldwJp8LdUn6X+W1F34/Ks/5dUWikZlYYMKERFUdZnCSA0oXDIHVWz+ecrA9sTx
	E6ILZfsl2tQ6g4jkc7FjuhCc5Uz9WwlOUL/ETBSCrL5vCI5yRxg89U0iH+fUHS2hvkN2r/3ssE9
	UXLiJ0gac6EFK5zPg1BA8QvAGEvGno9QWcLfSWfyeX5kHt0fFiLjq6RDco0hI1ZZ3aFpb88loyE
	ILbaX/d3ugpgQyQZjlqH5DSrQabw==
X-Received: by 2002:a17:906:3199:b0:c12:8c27:e2de with SMTP id a640c23a62f3a-c15a67c0b70mr18101966b.42.1783341530615;
        Mon, 06 Jul 2026 05:38:50 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9d1c7sm4068863a12.20.2026.07.06.05.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:38:50 -0700 (PDT)
Message-ID: <bf24e5b9-3407-4e81-a458-f365b89867ed@linaro.org>
Date: Mon, 6 Jul 2026 13:38:49 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
 <8871f6d6-6102-49bd-9758-faebbd9fa19c@linaro.org>
 <612730a9-8d5a-4c3f-8e04-6a248258e51a@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <612730a9-8d5a-4c3f-8e04-6a248258e51a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 13:36, Krzysztof Kozlowski wrote:
> On 06/07/2026 14:27, Bryan O'Donoghue wrote:
>> On 06/07/2026 13:09, Krzysztof Kozlowski wrote:
>>> On 06/07/2026 09:11, Atanas Filipov wrote:
>>>> From: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>>>
>>>> Use devm_of_platform_populate() so that child nodes declared under the
>>>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>>>> platform devices. This is required now that CAMSS is modelled as a
>>>> simple-bus and ISP blocks such as OPE are described as child nodes.
>>> I do not understand this rationale. How is this required now? Are
>>> existing DTS broken and do not work? Then this needs to be explained.
>> Required is wrong, true. Existing DT is not broken no.
>>
>> Should read something like:
>>
>> "Use devm_of_platform_populate() so that child nodes declared under the
>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>> platform devices."
> This patch then makes no sense before the binding defines such children.
> 
> If you carry this patch outside of this work, you do not need to keep
> the Nacked-by tag. Only constant ignoring of review here is the reason
> of Nacked-by.
> 
> However if you carry this patch separately, you still need to fix the
> lack of sense of doing this at this point.
> 
> Best regards,
> Krzysztof

No I agree. It only makes sense to propose this patch after adding a DT 
that cares about it.

The ordering here doesn't make sense.

---
bod
