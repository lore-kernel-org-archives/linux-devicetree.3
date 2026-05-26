Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B60839EF2B
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806219; cv=none; b=rMCRmnszdYX6yrfrddMKeZ2EWLnJITVnSKVmHbHLP035bGad13GcelI97A1o8r9+l36/7/GPl+Q2U69Rwk0UqgCUs1wASs6dJi64Y7qeUM/Xns0s62kbA/6/Sc+eXT2q2at8b7shSb2MD0K+7Il1KqI4SHhgT3D0qe7eNl8IdV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806219; c=relaxed/simple;
	bh=bddmPLdlh8k4/CdvGhfjRlpoA8phjbaXLF3xZh98BOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Puj7JPjjwRMAmXkoRwYCDNHMtGEaWiVnDOIlAyyZ4QqwF5tmUCQU7sIKqZjw3+Z2rJyQMC48wR1b4L5Om99gd702oglNjtv7xGVlBrAxTvtbeFWSoLL9Hx+pUP1k9J0piACttCO/yDT97aWlTfWo6/no0HXrxTgnBPs1423jKhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hvj+sR3v; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hvj+sR3v"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso30635825e9.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779806216; x=1780411016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/6TPmhMOXzTepD6L2/v/4s1TFOwJFHZZXVYfuiMLr8=;
        b=Hvj+sR3vFCcZxMPVhSEO+WsNyZ3WqMT4ehSbFtzc1c9MLRHlZMh2cfNYzx42kk3aKC
         2dyJF/R2quj8raD1g1jjUgMOCUSN07IXn6utlrxEAQoEAoxbaUtqR6ntZG0nlfBqWs4M
         Ewif0b3L1iMgxj2jRrgN7Za7zC6tEZ0lMokayKqjcjzxnK5dW3yYBV5EKzQqrMZJYgpH
         tYtgJuR8VJH0F6OiTHrBeROkqs43O5LVF9BK5WcNf0MmniELr9AaCCz8CNruxI8Y4o7u
         CkTthIdGKi2oBPAY/NKKxF0gq/MJg5hxomSCUKnFC5B/Hqk8eETKdxXABnC4oGwC5Nrc
         THHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806216; x=1780411016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/6TPmhMOXzTepD6L2/v/4s1TFOwJFHZZXVYfuiMLr8=;
        b=VsBEmIr3guBB1r+O+wk8DEVHuv2LkmM3uudj341uFHltL89vNI9qzHfTJdcjtRiWo6
         Krv7/2/moy+W47Wjkruglu99CIIWM0AESkwuRWj1F1hTyr8ceZ9kUd8HUXiEK6Pk28A2
         ymYg/TsVU0KNlTmgAAFg72KW3nHqFd2DwQoioQiBK7Qm7c77njZXmAX2xyxFpZFkpRmk
         2/WP6+N3/DvRempQYkd/FYrU6304wwt1ODnP63U1uY74E+5DGSbG5OI75gIJzbli9f53
         w3paNo68cpkK+C3bikb983FxcnX1Zt3Ry1WJKOU7WB+ozMzXsVoRoA/9jFQC+0CZbLf2
         8zTw==
X-Forwarded-Encrypted: i=1; AFNElJ/UZONuRsQ+rYOhKDg922sSWNZQirHDcdHD8PfEW1iBG8uxhX0SzwOXjH5Q/9B4kklVobx44fkTWc3o@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+f/YIRAASWxvyk1FQeOtOHioRtl7gmcioB+XBlueAod20tedm
	3jR5Zm4uDLa2gNdqmZlePYCufwumD47qfoGdHUFDsgTL/LwPjd2+l0eCe51c4hYYK80ZtG9D+Id
	iiw/BUCrJ6A==
X-Gm-Gg: Acq92OHTf1jYqhLqxPQ59P3/+7JwjzKP49WuYITZ3FIarQ8giKzfo+8ExzI2fBRTQBY
	V6CY2IExET7PLWSZLGpUsa6i6L3jGKvCM2kuqs5YEY4ZH7nIzmOiT+p6BkRiosi6/s/JP8iSkTG
	0Qie5ULo6FjqxjadQ2eBV37FMUPDyFYrtP1aRjWGvXspob/BfyRRPE//vw1oxU5eDFngZ0oOs28
	C8lEGUbV+D3WOOnZWEiDclwnbo03ERBMJkuksyXbjEnFstdmdnBWH6cbKQdx8o43oxXwBVk1mTQ
	/ozNp4HCRaxhJkY0oFgB6mVgE14YzXBX5+rPuEgu2BNxrF2E2Lz49dow2Yy+P7fl4Yedy1EJFSH
	pA0YMC6pGRbfhDUVOfISYxFRB7BoR/BNYjhRkJKAu5ScUCrJKZXn6yb3YSoP0MjzQ2V9UqBYGiE
	W+kQEN4Dnvtz5tqpZhfvynKTzy0pbWlpY=
X-Received: by 2002:a05:600d:6413:20b0:48a:9540:1a3a with SMTP id 5b1f17b1804b1-49042495183mr238402265e9.8.1779806216533;
        Tue, 26 May 2026 07:36:56 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cce01asm37274935f8f.11.2026.05.26.07.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 07:36:55 -0700 (PDT)
Message-ID: <d8539fc8-d2ed-4b27-aa1c-ee92d7c8ff8e@linaro.org>
Date: Tue, 26 May 2026 17:36:54 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: thermal: Add Google GS101 TMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
References: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
 <20260525125455.AF31A1F000E9@smtp.kernel.org>
 <4832a220-ace5-40ba-b85b-7c69b3aed869@linaro.org>
 <20260526-uptight-bustard-from-jupiter-291e59@quoll>
 <08eba1cf-2df8-4f2f-a527-ee03ee792920@linaro.org>
 <20260526-nocturnal-dragon-from-lemuria-c517a4@quoll>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260526-nocturnal-dragon-from-lemuria-c517a4@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/26/26 5:34 PM, Krzysztof Kozlowski wrote:
> On Tue, May 26, 2026 at 01:02:37PM +0300, Tudor Ambarus wrote:
>>
>>
>> On 5/26/26 12:39 PM, Krzysztof Kozlowski wrote:
>>> On Mon, May 25, 2026 at 04:06:40PM +0300, Tudor Ambarus wrote:
>>>>>
>>>>> [Severity: Medium]
>>>>> Since the commit message and binding description indicate that the
>>>>> Application Processor relies entirely on the ACPM firmware for all
>>>>> functional TMU tasks, shouldn't samsung,acpm-ipc be included in this
>>>>> required list?
>>>>>
>>>>
>>>> I disagree. The property remains optional because the ACPM firmware
>>>> can be bypassed entirely. The TMU IP is capable of handling thermal
>>>> management directly without IPC intervention, so the phandle is not
>>>> a strict hardware requirement.
>>>
>>> I see your driver will fail probe without it, so something is not
>>> matching here.
>>>
>>
>>
>> Yes, that's because plain TMU register access, without the ACPM, is not
>> currently implemented in the driver. The ACPM can be bypassed in theory,
>> which is why I left the phandle optional in the binding to reflect the
>> hardware.
> 
> The point is that phandle is not optional currently. Binding must
> accurately describe the interface implemented by SW, so either SW does
> not fail the probe on missing property or the property is mandatory.
> 

Got it, thanks. I'll make it mandatory.

Cheers,
ta
