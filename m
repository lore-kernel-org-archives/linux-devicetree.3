Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF0C421250
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828833; cv=none; b=I0GcJYyM053dlDUozcUWuOatd5YlIEEdLmkvl0W61kOl+IWTw/BW9i/S74yrRGJZWgP6MjIV58/soSgOPSBPByC4p9/t3h1Q/N3E+7AvNnwHBS0je8udbc4PyUaJtDzQYkIRvCMNKuwZ/fsVaVs/4MqtNlZxkhdGN3WWSOf+eUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828833; c=relaxed/simple;
	bh=Pc1sG92KgU79aHglfgstbE9HbzWM0wDT1E3FvPcMdCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTf7cb7GXRi4jux0CRIidYEb9CVHhW8CDq7kMxbolEv3qHilYTovlUmG2sTCWQC4vVqGmmz+HLuV8R21rWJDq445ga6Th6S7xHFzKWTJwnQwfGrGYM6Kg4jYjFyLrXZVWqz1PrWSv9PygKccLInGOBODtD9odc5vSzW+k7wuT2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6dxIkMB; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6dxIkMB"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e58034d05so4183200a91.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785828831; x=1786433631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIv9dUKWHm/aOpY5+JLW7X8HZjzTHsriJBw+UKX0NNU=;
        b=l6dxIkMBPTDLyM1bbb2D5jbXlCk01ps//oB37enMRnaZDEmTLvR5mgfvNonzg/VJ7K
         2icEWARN5oyM829ESfg4j6sBs+s42kmWAjsm513QTddHxdgxodl5o2MyYOyewbTHHP06
         izkoYogC55pL9hOIZDVils6HlEeTnQcHUV+1pVlgU2KACLLGYMxTNb9GOXPGEQucLpg6
         BSFFk+AUzjgOoQkg/OwaCpdM0wB+PCEq/G5WS8nShksPKk5RWUD/tYMBmCIobAb4a0Pu
         2YfOYsNZvMujc/CpnDgqsYQFLBSC/TQEqSfwDBJp9eMs8k3bJjeNeEI1vms4AVou2WUQ
         Cx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785828831; x=1786433631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIv9dUKWHm/aOpY5+JLW7X8HZjzTHsriJBw+UKX0NNU=;
        b=YQcAfhH+sr8fGnfAYZHfGNkaXhO42GkhmqqZWCAEqTfjvNfwOg/7XZKGwpKnqohi1h
         SM4Skf+QNnCe4UZ6SiIZVlpQ9dsBgoieUmoyweKHaML6Nca16NflZlO/I5i9hz2XDsds
         gfux6tc25vXsti4yOvEGGBugmlvTRU6rYLfYIYdFaoxsonqPf7ghw6RQFLXFfC19j6AG
         TNLfQn5/w4dV/JQ88sx9vPA0QnQ343v9YCZ0g9fv5AupWHus511/tiSke5UdM0JHJxW/
         vmiYlAoRY3OhgNfFjHjAOtlF4Lg4hf9jrF+WnHpRCRNTuP9ARKzTqeUC0ihXrlBMIRhy
         8gyw==
X-Forwarded-Encrypted: i=1; AHgh+Rrm03gJ79JMKS8s8f4fkWhAgi7JBb1kEnd5ew8/gc64Y28MQWeHTdSzjUllokN3a+jd+OBm2x8eYn9D@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3SP50zuUkDSmbmsdRU0w6iyCXo7/2MD2fSKyRnEZ/D5LlmGu
	usopE8pHwh0ZUnaqvOAbTvl9/peWpm4sFNsnWcz93Pb7E5FUdtFhK0H4
X-Gm-Gg: AR+sD10ax8kHBtMW/XqfbWAuTioVoajDyLpZqUCxeJF5q9C5VB2YaXKL653LonHm3nt
	in8ApZvZM6EKnPrMxrtSzLGE6AmzRFpafoJT4r3QScPCZ+m8EzSAS5T/6vDk/Z/0dzV0t4s5lat
	uiHrd+S0yaUa/OB3Nq3oqS3p6eQPpBFGVY2W1QiikHH2Ov9Z1rnckTpPzDQWxIdqme+5X+aXJNU
	5wat9RnZcfzgvKFx+z6ryBcERaebRIN49XEPh8Jqssf+gx8RZ+FwZXQgIiOREMoZRU4K7zLGdJN
	xXPSTWXmwivQOnvvuzVnNB0uX4FVzZgEccwdr2I8zj6J9rEf2kOQTYxesXuJMxj8cM7N6novTFq
	LLK6Uor1es5vTmLstXlsYcnfEAJ3wLS2Ju65NRRHAiKZsrB36rS1mvBnw2C8CuEK8KIy6xlf/nd
	CbmPyJpUtCXtQwGu2dK225Ij88avo/MDI4Xb29Pj6rqtr5V6RCis7v7qjhcLcRHAu5+kz9g+Yzo
	h1cyjbH99+xUpy4FiQw/XuUhTlY1K5knVVa2/sE4HKeDGRlHyLu
X-Received: by 2002:a17:90b:2dc4:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38fbc4067bcmr12402842a91.6.1785828830448;
        Tue, 04 Aug 2026 00:33:50 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fede7ad70sm864284a91.15.2026.08.04.00.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 00:33:49 -0700 (PDT)
Message-ID: <6acfb226-e63a-4c41-b67e-8d8e6bf93b2d@gmail.com>
Date: Tue, 4 Aug 2026 15:33:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Allow
 additional GPIO chip selects
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
 <20260803074913.1656675-1-cwweng.linux@gmail.com>
 <20260803074913.1656675-2-cwweng.linux@gmail.com>
 <20260804-smilodon-of-imminent-recreation-aa579b@quoll>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260804-smilodon-of-imminent-recreation-aa579b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Krzysztof Kozlowski 於 2026/8/4 下午 03:05 寫道:
> On Mon, Aug 03, 2026 at 03:49:12PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> The MA35D1 QSPI controller provides two native chip selects, but the
>> generic SPI controller binding defines num-cs as the total number of
>> native and GPIO-based chip selects.
>>
>> Remove the maximum value of two from num-cs so that board device trees
>> can describe additional GPIO chip selects while retaining two as the
>> default chip-select count.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> index 377ccf4fb224..f837367e6d5f 100644
>> --- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> @@ -30,7 +30,6 @@ properties:
>>   
>>     num-cs:
>>       minimum: 1
>> -    maximum: 2
>>       default: 2
> Isn't num-cs the number of native chip selects?
>
> Best regards,
> Krzysztof

Hi Krzysztof,

Yes, you are right.

I interpreted num-cs as the final number of native and GPIO chip
selects based on the generic binding description. However, the native
chip-select count should remain two here, and the SPI core will expand
num_chipselect automatically when the cs-gpios array contains additional
entries.

Therefore, the maximum value of two should remain in the MA35D1 binding.
I will drop this binding change.

Thanks for the clarification.

Best regards,
Chi-Wen

