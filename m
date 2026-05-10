Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BA4359A6F
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 07:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778397091; cv=none; b=fHT+nMPT2qRFIs+ofJo6ecib1FgHJN3b2SUbZDRtRLF5V08yqiA/9dOOGfyyWhKbBag+2BC1GUp1nYj37L7Iwvgy66KWki4MLKuiNmkj6uCrzB+wKeGX7g5Ejr7l/uTFl9JnFVjLFXRyBAuMpuzuDwEPZbNXyIlxF6sbk42PDiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778397091; c=relaxed/simple;
	bh=EleGY3vgTfeFTin94EwbWKxMKGx9dC00TvNm+PCjBFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/h/GN6weEqx9cE4C4TDy9ItT7o9NWb0EV1yBgyu9zaqO2CATxci+ffJNAKY+DFnD9xvXKrShPBzjOGAm0niPUonffcoUGkHu52bn9WXQfY9rrUS7/U+RBgG/nmgD9o3k6x9omjaWKmQl4DuNc2DlGNv3JeSszn7S3uNWpwimCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SW96mx06; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SW96mx06"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3664df32e91so1813862a91.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 00:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778397089; x=1779001889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NBksUd3TRhC53VHUdaPee5fHFL6bRQ8cdTbc+yWXtmA=;
        b=SW96mx06o0pNpOnHmcKaLPN0tLpCmk5Dsv2cx0/v/Q5MB+a/c1SqztMuVyGnd1Q+Wi
         DzqQZCIa9TNu33j+kvEWYp5+Orb0vX5UTofuIGI8ijv/p22dL6flnZkcGRF8QQJVv7cL
         qTmloesHRofRp7pPRlC87LZ02OVT3rrEwjK+y8BSCXrJuoPkSrv/O8qWLKYFpgMI75iJ
         xObpJyFLHFwNEyQwYGYgsvq0ZTbQ9Xj5ULOpuckKAY/7HCn9z9qSZ9hSQ3tQa1kUwCba
         vvIok0dcUpN0gLAXJtYudB4HxuwBTjBcJooJIhXU0/9Bx17/tHGdcOT6oR1/HLQsMEks
         GfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778397089; x=1779001889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBksUd3TRhC53VHUdaPee5fHFL6bRQ8cdTbc+yWXtmA=;
        b=jXOcFX98TR7bzuvDAjHySAqQRSYFt7CuXKgEv6JlQ4g/I8El93Gm2chb5pUD9cg6Zo
         8LlLvf6zLZJTAVwJJq/QbIVXU2PmdZRBTdddzAqgM1Gc/w0BeriKS97Op49po8LJ3gvr
         /RAe2qAe7z/YgON1h4g5oKoAFNxnJX8iNVzJgxmv1JTF8wnbMeuJiTXSOd+rMViro72q
         7ZEOfRpbJ/2I4yWMHIXYw8xYfylZyG3yDszppS+C+5D+01Sx0jhcVjhADlJBDvjnsfTS
         tdw4S3lxWuqzBajfEO4143WJsL+5PKL7t6mN0L2BbFeEOXuC2Clt60Ca/+Z1ODP0IkZc
         1ScA==
X-Forwarded-Encrypted: i=1; AFNElJ9XT4U/hgy0sKsR0tQws24RVOkGPf7TGbnjWMKwG3eFlsK4vFK03DAPW43AmG+NzDVTR77oJs0mH7om@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0PNySKVJ/pPvbd3njOrYdJecUetMJ0iMtbovzgKviPr7lfEuM
	HMtLQUVKKEGYtB9YO4ZsoSzStEoozrkTBM6m0/mK/DQn0ItwkcEblR/G
X-Gm-Gg: Acq92OHqEyFH3KVTNV/EzE7f/pwIecDLkzxQGC1Q4N9lYb4Un5WStNNOO90ShuZTlIz
	r+ETGuu8C5Grx9NlDu7Z4vhzWIRWhmpfBATGnq4Ie97HasGXgIA3PAcDneRAZoMXaZoFuMPMuCT
	zkZvbg5aYn1hyJAAdbm5FEkIOmi+7OEQQnVMsd+t3scFnVOnV2O2VdiiZioDtjN8wZz+y3d7Bo/
	qK6P2FA7hFmVQ68bbYDIK1iGO3i1CVUDWxElW3sVbAv/L4m0YKVf/TkOWalVK3i2KsZ4kdajQ0Z
	6USGQQbMwBPCavIzyYEDZ6o5WMiaviIIhzj30ELoKraLR9ruW8VCIOwMN/IwYMVu8fn5aMiDebM
	oZUZ+AFGJ8EyVan7jpW51PmdlZFf9woOk+RxLufV+dT7Kf8FKzowRbxdBID/xKKRKx6J4sh44Xk
	3Mps4bai8ixYuhCI762pQeQemv75CUGvjHC94ZUsRzeiqheA==
X-Received: by 2002:a17:90b:1651:b0:366:3d97:74a9 with SMTP id 98e67ed59e1d1-367d3c7153amr5332804a91.0.1778397089420;
        Sun, 10 May 2026 00:11:29 -0700 (PDT)
Received: from [192.168.1.5] ([60.243.224.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d629c17esm3678111a91.6.2026.05.10.00.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 00:11:28 -0700 (PDT)
Message-ID: <6235faf8-fbdd-468a-ae2d-a4a3f7ee50fa@gmail.com>
Date: Sun, 10 May 2026 12:41:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dt-bindings: mmc: st,sdhci: convert to DT schema
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
References: <20260508-st-mmc-v3-2-81c329ed28e8@gmail.com>
 <20260508222225.1E854C2BCB4@smtp.kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260508222225.1E854C2BCB4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09-05-2026 03:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing `minItems: 1` for `clock-names` and `reg-names` restricts them to exactly two items, breaking schema validation for existing device trees.
> --
> 
> commit 66ec88f9e00b102af921864d0e0bf8b1b9e7f38d
> Author: Charan Pedumuru <charan.pedumuru@gmail.com>
> dt-bindings: mmc: st,sdhci: convert to DT schema
> 
> This commit converts the STMicroelectronics sdhci-st MMC/SD controller
> binding to DT schema. It updates the clock and register properties to
> support backward compatibility for single-item entries.
> 
>>     - In the legacy text binding, 'icn' was optional. Keep the clock list
>>       flexible to preserve compatibility, although all existing in-tree DTS
>>       files already provide both clocks.
>>     - Document the optional "top-mmc-delay" register region and corresponding
>>       reg-name in the YAML binding, as existing in-tree DTS files already use
>>       both "mmc" and "top-mmc-delay" entries.
> 
> Are these descriptions accurate regarding all existing in-tree DTS files?

Yes

> 
> In arch/arm/boot/dts/st/stih407-family.dtsi, the mmc1 node defines only a
> single register name (reg-names = "mmc"). Other device trees such as
> arch/powerpc/boot/dts/fsp2.dts also define a single clock and register.
> 
>> diff --git a/Documentation/devicetree/bindings/mmc/st,sdhci.yaml b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
>> new file mode 100644
>> index 0000000000000..10e0e1ee6d5cd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
> 
> [ ... ]
> 
>> +  reg:
>> +    minItems: 1
>> +    items:
>> +      - description: MMC controller registers
>> +      - description: MMC delay/auxiliary registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mmc
>> +      - const: top-mmc-delay
> 
> Because items lists without an explicit minItems default to the length of
> the list, does this strictly require two items for reg-names?

Yes, but I can add minItems as 1 to accept the nodes that define only 1 reg-names. but the existing DTS uses both.

> 
> Will this cause make dtbs_check to fail for existing nodes like mmc1 that
> only provide "mmc"? Should minItems: 1 be added here to allow single entries?

Yes, I will add minItmes to allow singe entries.

> 
> [ ... ]
> 
>> +  clocks:
>> +    minItems: 1
>> +    items:
>> +      - description: Clock for the MMC controller
>> +      - description: Interconnect (ICN) clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: mmc
>> +      - const: icn
> 
> Similarly, does clock-names require minItems: 1 to match the flexibility
> added to the clocks property and prevent schema validation errors on
> single-clock configurations?

I can add minItmes as 1 if the node only requires 1 clock, but the current DTS uses both of them.

> 

-- 
Best Regards,
Charan.

