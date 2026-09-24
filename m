Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCC031F99C
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790213211; cv=none; b=AAZGWBuWkx4skE36lNt/DIjrqCVjQmbo0RQWqBLjsRFvv5jj6SbNmOBqVKPX5tYqTyeYRyQjPwXDGxZtgGkJSSJOSaqbFG+qHPg2gt2Q+N3bS5+BmmOzSet+lUKsJ3IablY+A4xJJkxPalTzQaVUeGKbjyd12hLi5s1J8xKOE5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790213211; c=relaxed/simple;
	bh=QQkaqMHt2bDKYjzTWhhvmF2NKEcpIXUnzBmhkTRoYUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELSY2gqsjrJYM05dVrVuAc8JrbDSWHIGugVSb+edfZfXVJc5Up1aq3Ae8tRwuqrMhbIUmeXVl8JDyKyXzjpZQF+ipafHjo8MfEp8yBu3bHKJEujr9+1mmZuigx7l5QAq4ME8+TyQBTNArIpF94ahM4sje5xH0Q8FjWmwTf8ARP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gs7TV7jC; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gs7TV7jC"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso888518a91.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 18:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790213209; x=1790818009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ce1YuMyYgEbSKo/+e5CLoiv54uIucnRXju66KzgmBcQ=;
        b=gs7TV7jCdXQgYnSsibU1F1/vHINpBCLR3+sKMajId0KNd/qbmRKa8Rk3MiuqhbEqb9
         FD4f/4NZ3qkAREqrJKGn4+Z6OUiWGDLMMHAoAsGyAIdk2ACov7V3eWVBKf0mNYgAq/+X
         fN5G0eQdADLTlhQw1yBa6EBsGYm16LFGsi6vo16Of4YguslEigxHN9Z2lqVOIY8b/MpJ
         fDkgG+5XTRfSq69QFsYRzzVNssr6ScxpISMx0jGQaR5YRhp087TvR5uwJ8KlQ6FmA3xF
         +ipMr+XI4Zy2q4kygx7Jhof1DuGRxyzkgGfpqUCFpfxY3hR7Kdcj+iU9vYzSv0tsRipo
         znHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790213209; x=1790818009;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ce1YuMyYgEbSKo/+e5CLoiv54uIucnRXju66KzgmBcQ=;
        b=uCpN5WoV5MSPBYyjjVgB/LvMuisWgokskoUxZbfB5OXlcHzK4Gc+hAYo7kanCPjdyh
         l5eAIs27DbRdUr0PItJfLvOaRsrTy/VoC4eFqGTDIutvvcf80rnpDWcUlVasDCy5dUtY
         EkCkyaMiRsi6P08k+QG/dzVeuasWG7XETKTsvzroBQT+XwNMVRXKzhYJyj5hmwnBAeRR
         58kkCrFvWAtpplTporZXojZoEAbY7Ew/EEokQJFcHkQIvini9zF0oJAGbq1BbL3NDf39
         303I2Q5qYCOe0oUqLDW+4cFoM03jrQhXaniAPM4TA4Jblsxu6QcPa1QURE9PQdRTFEHf
         bLmw==
X-Forwarded-Encrypted: i=1; AKwUvBywOaKuYyYSF+CXkQ9FEdNrdEtOb3bdftVPYjA8UABjU20WRLi0pdAzHfUmzlj1l3xWOMJg+W9fEiWc@vger.kernel.org
X-Gm-Message-State: AFuF++nNMe3CiKjSg055G0duRJl7LVfEKNJGzxLCx0BOo2QZ5oSf321H
	bDs1BliVO5n7ek4Xkkd96w+NJ0vkoldTUg+xrpooOCLogUL4O6RjsFr3
X-Gm-Gg: AYBFou3qaqHeeo/iGh9yO99j87fH43op4w7rCiC09NHU6RSFHa5/UAHc7PyMmNA31UV
	V4O2qFlZITg/vQI50Ok4AbVzj2OYSbu+D5RSJcbn2hqmFLK5wV/aIBTpjpzsPG8sguexGke2VKr
	Mwt6gHez9klSceK0LgsIZ0speNdFumvNN900bfRaBuHNgaTfkLKU6zHWTLDDkg6LxMhD8+Q37iC
	l89eT8rvFSiHkBMaqnrd6vBJhG5LvWDQKmxfRHgpJLu6loDvBoOlcSAP3N2pMf9JlINDdpzYe6o
	NvqaZd38DmJgWW8xZzl3mLxFEwa4n6ffWDVIGBwbmUonjhi0E4w5J1x6Z+powqLlqHuuctrHTA2
	OXCRVhgSE2gbcg4FgwLmasXc/SE4pmEpPJ23zNdxDNLrF2khdsZlphF3UmY0yB3gjquie/SRfkU
	Y7XVuU4OFSKY1keJNOACr6z1QIxOBIQkk5LNxwSe++UGH6Q3Bz8/z2/eUXoctnpU6zRb7zcgLNK
	8VcQ5ZTYr/REfkWFRTAin7S9nWKsbAEQnHbiMQPgYnpllq5lFX40gSkdoyc
X-Received: by 2002:a17:90b:28c5:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-3a098729524mr645400a91.22.1790213209231;
        Wed, 23 Sep 2026 18:26:49 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f2cc3sm1698246a91.6.2026.09.23.18.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 18:26:48 -0700 (PDT)
Message-ID: <cee8c7b8-88d8-42d9-b425-31adb499ad40@gmail.com>
Date: Thu, 24 Sep 2026 09:26:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton
 MA35D1 SPI controller
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
 <20260923041926.425551-2-cwweng.linux@gmail.com>
 <arO_P5imHln19iV-@sirena.co.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <arO_P5imHln19iV-@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Mark Brown 於 2026/9/23 下午 07:59 寫道:
> On Wed, Sep 23, 2026 at 12:19:25PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a Devicetree binding for the SPI controller found in the
>> Nuvoton MA35D1 SoC.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Hi Mark,

Thanks for the review.

I will update the binding patch subject in the next revision to follow
the SPI subsystem convention, for example:

   spi: dt-bindings: nuvoton,ma35d1-spi: Add Nuvoton MA35D1 SPI controller

I won't resend the series for this change alone.

Thanks,
Chi-Wen


