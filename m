Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304E0397923
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738390; cv=none; b=VHVzAfkygmz6IfzJ7b9SzvBPdEaiz+jwPeOUWa3jbhZjRFa5uUfuR1qMZ1DrY9TaZGyiLpo4TQ39DUxIKK7WgOQGpVBW5u2t5IvvHUfHySwsiJi8lJjroPChASrsJ/1iJeyPln5t2GrO+cWT04OphmxpW8COTXZLODZgLie/E0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738390; c=relaxed/simple;
	bh=nhqzigJHu2rqL2Px63MJ43z3HN14aip2diXgZ+RPOUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZxk5pVxVXQ8Use0Mep6r2wKlOgwDGEDAgYav0FtvFmJsH6t0lbMp5PDeuZtdWaFv6wTxKGGwVTvZ57l7lg6gpAtQB1wx1YgqEiLzZEKY3fKbw9TNbOUqKmmODoFbmdCy6ItjRV8PjtfJPQqPj1NJFXaaiGUM4IrsYm9N0gVfBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzSWghLl; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzSWghLl"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848595b338cso3772448b3a.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 23:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785738388; x=1786343188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jR6DHa6uHR7CPMwwaGVZjRKeuYi64yZ/mtj7JzFEqlo=;
        b=jzSWghLl24Yr0Bgm2X+9+7luQJjC8gXYou5dkNEtJyEtcMqXEwJDpeM3M6z62z9Scm
         aWCYqLLqiVTNtYXVXz2Mfi+sQr4a/G2p655SEN/SWMjGC6wkySFu5J1+iAhT1MgspQTd
         t39aEoCLQDxx3Bw4JEbsnSgYRjILkYZjYNbD9HK4lveq3s8C0YqTR5qIVaBTV0MyDt1e
         1tDvRE4dbD/vY5++7WTQUED807OKgBN8PUtb9BBx9vMDSY1VPbyZbVSrAG3t0Xm9lElf
         /UJppB1qA52hvkwOQWxhevUGZv2CrHB+QKdmjeklm+/Nom9GoumgwXaDhwXBzLLtShso
         QO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785738388; x=1786343188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR6DHa6uHR7CPMwwaGVZjRKeuYi64yZ/mtj7JzFEqlo=;
        b=NML9zdo27AQAu+atl9H+qx7e4itxgCov1ikXOFJ/I427bOdy2OLi21/s7a20QOA+wQ
         aVmfQhdF10xUgYRNDZiz8acilKVEId4MeiI8Zu5Z34CfFVle4rAEsWdpdxy3jGMEffVx
         iiO6sYetuHUkKGc7+OEohBIms1EYD8MUdupYcyAc8q1OOADTjImUS5KB+lHicPAMMqHv
         C0lxhb9KyJHngjWUrFTrT9JB01RFfqpaOwKMBd3E5raaJWU9jfEx3srxC2OcqOPvQpOQ
         v9t0WGJdLUKbspj84Twqt73mS20hO+hzogHlDOlApiJZMCsLhY4X9+CSi5Mdf0Qlxz3U
         QYcQ==
X-Forwarded-Encrypted: i=1; AHgh+RovWON0eOpGE2f7LgQ6iF9hOJbBNbm8mSptzE6bSHAOa9xCCVG7kWUG9Gf//F02UnK0zT1UBSy0Xb19@vger.kernel.org
X-Gm-Message-State: AOJu0YyPDHRG6bdKNa0r/dfWRu6aq4FBjs+V8ti46ppO+9x3Iv+cmuTf
	xGpxj6lAuM8Mgzsse11VEeKLt+YVs5MCbBXq0JXQyIHf7K2uLubUzKDy
X-Gm-Gg: AR+sD13RaRBHPizCQlY4fB3qmB3SiIS92rM8XEw2mgJ6VuLVv94WLb6uENdocw6jLSp
	Oxcwa6k+Hor9MRVuS3oIXkaqq+bOI/XGjKb2/ORwqqpF2kkq5+IIEecIAGJ9br3/woyukPtCkM9
	451Tc+UODwbuZF7vFoElK5Usoq28PQP8OfmY+dZ3h3Qqau0VTvmBKDKtJn2Px6txlD4PkLxCPUJ
	rigCBoUlhe4a7WUMZ5CSsIT1QY1taqdmmySyiCKXRLWRCuleMs4NixyiV4VCNZ1KFZ92vJ0gWHg
	E1N3ZlaytPborFUG7bMIFn1hWXjTRE01uizA6r/9BWNTSyinAFDgpEekML7Ip/2ywJEVCpXTmdH
	2AN8GfVb2OvLiZJacsOEtIzOZdgYWtfBSDxFZymTobvZIl1RTHC1sbJO6vZSM6vM/mKzzHo1saD
	hpHB56f+jtPeQU95Oo1/JWhQyWeCFPbkgZzpbmBj0va9KOKl210EQvfwZ1WZXWJG8PiWgIuCNFk
	EbKcdy8v8XsYNbrczszHUURx1paq7BOyI8Irq5uIcdBRhRZc+I=
X-Received: by 2002:a05:6a00:3cd1:b0:847:98ff:4af5 with SMTP id d2e1a72fcca58-84ee47d5328mr8196482b3a.26.1785738388390;
        Sun, 02 Aug 2026 23:26:28 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc51cc95sm3221883b3a.60.2026.08.02.23.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 23:26:27 -0700 (PDT)
Message-ID: <f852bd65-820f-466a-8fd5-52a899cfaff3@gmail.com>
Date: Mon, 3 Aug 2026 14:26:26 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip
 selects
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260803024048.1641756-1-cwweng.linux@gmail.com>
 <20260803024812.9FBDD1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260803024812.9FBDD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


sashiko-bot@kernel.org 於 2026/8/3 上午 10:48 寫道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit disallows the `cs-gpios` property in the DT binding based solely on a current Linux driver limitation, violating the core Device Tree principle that bindings describe hardware, not software capabilities.
> --
>
> --- Patch [1]: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip selects ---
> commit 3aecb6991adf3696410ad69c99107c7d732fd078
> Author: Chi-Wen Weng <cwweng@nuvoton.com>
>
> dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip selects
>
> This commit updates the nuvoton,ma35d1-qspi binding to explicitly disallow
> the cs-gpios property. The change is made because the current driver only
> supports native chip selects, preventing the use of GPIO-based chip selects.
>
>> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> --- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> @@ -33,6 +33,8 @@ properties:
>>       maximum: 2
>>       default: 2
>>   
>> +  cs-gpios: false
>> +
> [Severity: Medium]
> Does this restriction violate the device tree principle that bindings should
> describe hardware rather than software capabilities?
>
> By explicitly disallowing cs-gpios in the properties block based on a current
> Linux driver limitation, board designers who route a standard GPIO to a SPI
> peripheral's chip select pin will be incorrectly prevented from describing
> their actual physical board wiring. When running make dtbs_check on a board
> device tree that uses cs-gpios for this controller, the schema will reject it.
>
> Should the hardware schema allow standard hardware properties like cs-gpios
> even if the current software driver lacks support for them?
>
>>   required:
>>     - compatible
>>     - reg

Hi,

Thanks for pointing this out.

I agree that the binding should describe valid hardware and board wiring 
rather than the current driver limitation.

I will send a v2 that keeps cs-gpios supported by the binding and 
instead enables GPIO descriptor-based chip-select handling in the MA35D1 
QSPI driver. I will also keep active-high chip selects restricted to 
GPIO-based chip selects, since the controller's native chip selects 
currently support active-low operation only.

Best regards,
Chi-Wen

