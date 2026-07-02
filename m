Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAF444DB64
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 08:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981970; cv=none; b=AVgVJylqvQBPgicWD/1JZxjlrdn5N35yo1r6S/qROPGD9Z+0vxCmuvjbidEny1WLHZjJJiOrRHOT2ElNP7Wz9ntXr37Ba6yLdDT9jE1tmWUwq6q7d6ytpdlNY1PdBZqtc7mu+Kj9K8XKAr/I+FB4CGRgCGLlvFbNbpS9IEfJi5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981970; c=relaxed/simple;
	bh=MS5mWFwy5vf0hf4HoyQCtkkdTuvb0vq8o19bZAWxSgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7wiuN70mOx8EQTJZbQAaqso4Oe9F92/mXWtKGK6URiSJ3jsi1FYE8GUMS/zIrOdHqPAD9BaCpV5D9aJeNWbYQvj8EI88wcMvPuXQRG5tC6hlNl8LZPQ22s3KgS/hw2Xg5ucCcNkpS3WV8Ap+389zLcqOv/WDWf/Dn5faWd/r0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nheqRINr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nheqRINr"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c12a430d71dso147345866b.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782981966; x=1783586766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XTERvRmf6CZrO5bc1Pl8xU9eJ7e9Wlwnz0/kVW1zl8I=;
        b=nheqRINrw8OuAzndytOu+U0QWFfYPNF1JD9cSK+I+G7nlr4N9TjerS2hZFQUpTNCkn
         FNLWVeCDnsGuEetWuhqiZLF83EhZL6V0gEBfT29X9sZ+8jj5ysod+s49WmgzOLq6un9n
         AlY4Hc/NJbqX53jNeop1y3rwiVUJ4pjVOR7CeDrP5/a+5GICf//1RhbzLcuWwZ46n4PO
         JcZcZvjnQRbiV3FlxLw7CgLvDKUjZjYxmrhCWSaSDSGjg73CDYrvrdumLtj8fh47uNdO
         Fd1s9E87rZWnmOz8MhcKvZsljcVOZ3X7eo/R8S9u4kkCGvdbxR3th46Yibx0rx5oUjRr
         acow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981966; x=1783586766;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTERvRmf6CZrO5bc1Pl8xU9eJ7e9Wlwnz0/kVW1zl8I=;
        b=oAhwD8687wpMqu9sT0GmxLy1TPxPm7qHIXW/Ejg6TrSwlSxiFfufa0RFNORz6UeLEC
         pP9L/GJN8NFfKtMEjtcfdH2HlZWOVWOO39svG4Q97wzeAAxvbag/tuFs6uZvicsr9qpe
         zh9h5Kwg3B4+C+l6lR1pAwD7EO/rlhFOyVHWUYsclyOFLM5mH933kyBYhw37ygxBOQAl
         5lnp70mS7r2BRKrmj6WTOqdQkLgzmpEomO40HY0zWcLIRzDw7d9qLwQ8L6rRXhKmd5/c
         wmAbNtK9Dd/hK7PVpmB2YwEJHYf7GXSkrittKENb3A8LF8xTa9WrsCVqN9Qh1mjKSoAc
         6Uhg==
X-Forwarded-Encrypted: i=1; AHgh+RoJxxCXyRNNq1rRLbYPJZz5/p4nxZt6nC+BX2R2j3uJdkuomGtVuqKMHxpF3AH3HBVYmllwJ5GDXIdi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1An9XGa0/nWeHr6CPrPqvca8t7RdYV6WhcH3Nop5ChXzD6Ncn
	nuMId1TGrggsH6gk82zj11yRlZhLpYKsQHH7xinboZHxphhgfUtIgohVbUuOgvwhZhU=
X-Gm-Gg: AfdE7clMttFDCyySjKmhRnTMwNRisEcqMKJs0J8CXfrk281OdKL80JjuUS4V83Mi5ND
	akg9EY8PD4CeJrG9H6ziBHgFWFgV9tGd22BGhJR7XoQelYzKXBuWU/PVT7NxAQoUUJhPimTTTXx
	VsCSarBcPD3eyVbgOFmScNNOildC3aL79mGxOsfUeCn+ZLevm42VJSluAfhMz3npDMaqWIFgdsS
	D+oTJvz/zkjvFqikQNq/8J5BQazHnzgrP8cyh/CXdpdN6FZTxL7ec/mM8vHwPr3Uw+R0HwdmhNy
	Hh315WmcklS904uXSjB0f/Rtd25fkVKNgmp+2Vo3DLGU7hp/TGTpR+AIKqkW17W6pTptlyN/JwZ
	+O2s9cG+PoNHEgxZvX2kztNepyY6fuvfskWyjjQnBtF9hZmIQvSPc0jaS87TZB0AM9dXajkSNO7
	2sPRkvuJOeVAEM5M0cLQb5FtM=
X-Received: by 2002:a17:906:6a07:b0:c12:706f:c8ee with SMTP id a640c23a62f3a-c12a9d385e9mr217162766b.11.1782981966186;
        Thu, 02 Jul 2026 01:46:06 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.47.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f6e3dsm89006666b.62.2026.07.02.01.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:46:05 -0700 (PDT)
Message-ID: <3e2e6184-e020-49cc-9a4b-609c05aed846@linaro.org>
Date: Thu, 2 Jul 2026 09:46:04 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
 <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
 <6b6492a4-7610-4dce-a81c-8dc0387a4061@linaro.org>
 <1c583e24-09db-4d90-8f32-d3d3961188a0@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <1c583e24-09db-4d90-8f32-d3d3961188a0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2026 09:31, Vladimir Zapolskiy wrote:
>>>> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
>>>> suggestion will specify the mode.
>>>
>>> This cell is just not needed, and unneeded complexity should not be 
>>> added.
>>
>> I'm going to stick to Rob's initial guidance on this.
>>
>> https://lore.kernel.org/linux-media/20250710230846.GA44483- 
>> robh@kernel.org/
>>
> 
> Sure, the discussion will be continued abouve v9 of the series, it's
> just a chance to do it now. Rob properly pointed out, that the invented
> "phy-type" is not needed at all.

I'll quote here

 >> +  phy-type:
 >> +    description: D-PHY or C-PHY mode
 >> +    enum: [ 10, 11 ]
 >> +    $ref: /schemas/types.yaml#/definitions/uint32

 > Perhaps putting this in phy cells would be better because the consumer
 > decides on the mode.

A clear instruction which I'm implementing.

> Ther fact is that the whole placement of the CSIPHY to phy subsystem
> looks execessive, since you add a driver for a media device, there will
> be nothing PHY driver specific left in the CSIPHY driver but name.
No, a block with its own pins, external voltage rails, even its own 
specific votes to scale individual clocks, is a distinct PHY.

There will be no further CSIPHY init sequences getting buried in CAMSS. 
It is well past time to dispense with the monolith.

---
bod
