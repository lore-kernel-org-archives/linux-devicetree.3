Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F61B15B971
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 00:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775348118; cv=none; b=Gyve3eM/o7IlUCg8yDHSU5LVJhwpO1QhqDdK7YZwdABRHYwxjtpCVqTJQSTZh9A7NHlFK+8iaqNgM5YvCdXjZgmeP/O3Mm2jlJjVMLNAkLUeUXwHuI+CFJqUBDP0mBHO4BgxJ3Z9LBwlo9OmIVKq+qC5r6qJYxmJlqtwRuiz6+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775348118; c=relaxed/simple;
	bh=BqF5Ej2M5OJWzngrc4HxVEbLJx8wJq7qVUOlYU9Jnj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OuIsTn0WCvtTLFgONrOQl8rQuYxSQtALSvi1gvsPgXhh+s43R7Z8o/VJd70EqcKIMfJvBnd2GvJmjNPZ4CJ134WtBCLpHTdaH/m6safS34F5qLE92I78voFWFcQIkMrBfQy7TjLPsAlgIbZ1bs9WRRYKF2eCcknU0PPY9PSR+Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y3nQGDc5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y3nQGDc5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b983bb07eso1660941f8f.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 17:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775348115; x=1775952915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tyH1td2yG3Lr3A+EaOSUNG+8Njer1sxg1R+RRdpnOs0=;
        b=Y3nQGDc57odxB0UXDTnPxuBw5c65qOfFZHmsm2o3VInrSZxPoBpyKo85iReSCEoioW
         UgyNG0N6ua4jEvRytolbhK70uoiX3L9qk6Tcf2kVAW7+CUsNIlK+mGRD61QkJv1BnUH3
         Ufdmt9u3Bal2/q4UhDKFOUct9+DZr3HlCbwEkMU5C3502b5mAerMwMTbvEZVHn1IRwRU
         wfYBP2akHJ5SzrES8DfkOd8lhOyDyIkGcJjAZJq3Rpnt6umAqJ0dyyIcynJGPHfurhOs
         MlXJAEzea9g7FfENWLb3wkFaOpcITT/ayKo7Jwh9TCVf6CWlLSIrXgyx8VzN391oWT+W
         evmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775348115; x=1775952915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyH1td2yG3Lr3A+EaOSUNG+8Njer1sxg1R+RRdpnOs0=;
        b=fHTz5TfNmsSSgDla7dHXY6xR2cCkLOO5ItoR3Y/5oXpBzEWjHID9rv3Ds7bPOAVln2
         RammjJ9Qpba1lyFQUULKpmRZimpbzMKmshANplY3ZYMSlEtT3sBGJz/PNMFDNKtdpes2
         FiwP1Y2F5dSFA/I9Ng/UFkDClNHA459jfGvkUjaGbceuQmmHJiKxB8b7ZPK6P7Fjma+G
         tT0jSB2k1tw0PN3Zmu32QFwam+VZr82JJEzbzhZoQHDlAxEP17rNbNLJcbuvw+3yHh+h
         hxumVF0Cprxh0OgkDPvXu9OKfpCPMyJCCzKWN5J2Y48yrRJKyLF668mJkcJwSqqeVfXh
         GzHA==
X-Forwarded-Encrypted: i=1; AJvYcCVcfUXJoQWIa9iIwVIJUcl7uKPZ5pMGt/fn3x+84XpUQFlcC4PY6ArM/4EICVcFzNYTnJtyzwRm4178@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp/oCbW4WeakIwHsX7UcT0r2VYAerS6xHPyk6NcXI+Z+goMSCp
	1uOGlSRjkosQcj0ei30JSDCE1heKeBYUbZsa50Yqbj8X8zcPCrVKBp2O0tRi/dCdSNA=
X-Gm-Gg: AeBDiet0vSKrnUUMv0j/A2Ct7GvuAcEkKXxKXu44Yd8JKq2El34NaGBFlFEF206aXYc
	cvIulGVIZytC29AzRfG8psvaancXgQRhVFtVWMWo/sATQJZ7+lIPcMi44lFFtzZEH0H8LovWsL7
	fl3wMAGKCbDbrOohB+8GHcDCuQQ0ztxce1HqSPIJe6GnsjTlD2kfzqXzZ9BpUbc+r82YtCVKS0p
	H+pDAyK1Ev+wyfenOK92KVdZvBGfcOVw9WlkwHz9O+udNkWilVv/o3Qy6epKsO12aRxCkiQZCJr
	WgPpfegKXgzu0MLLhrdBRDAOlzNCUkApSWxmRBY4pkXMtyeCuzv7wxTgMZOxwyyIP8dvWllbn8e
	uUTkuM4FZq1rXNL69DHcy8PvIjqr1Iyf3tINrwo6JewRqMvsJqgijCklxbI5vd7PwcOX0whOGk9
	KTb8w1/5owjq0KNOLmb+3y9TxiddF5SY9v8Q0=
X-Received: by 2002:a5d:5d0f:0:b0:43b:3d54:3154 with SMTP id ffacd0b85a97d-43d29277113mr11674528f8f.7.1775348114416;
        Sat, 04 Apr 2026 17:15:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.125.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm28453399f8f.4.2026.04.04.17.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:15:13 -0700 (PDT)
Message-ID: <c0cb35d7-3fcf-477a-9268-70f379a76637@linaro.org>
Date: Sun, 5 Apr 2026 01:15:12 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> +    items:
> +      - description: ADC channel for sys_therm0
> +      - description: ADC channel for sys_therm1
> +      - description: ADC channel for sys_therm2
> +      - description: ADC channel for sys_therm3
> +      - description: ADC channel for sys_therm4
> +      - description: ADC channel for sys_therm5
> +      - description: ADC channel for sys_therm6
> +
> +  io-channel-names:
> +    items:
> +      - const: sys_therm0
> +      - const: sys_therm1
> +      - const: sys_therm2
> +      - const: sys_therm3
> +      - const: sys_therm4
> +      - const: sys_therm5
> +      - const: sys_therm6

I agree with the number of io-channels but, having fixed names is I feel 
not correct.

io-channel-names:
   minItems: 7
   maxItems: 7

Does the same thing but lets you name the channels at the source and the 
sync wrt what they do.
