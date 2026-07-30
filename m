Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825938AC97
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785384729; cv=none; b=uCaUEfPflUSzGg1vQkvnn6qkS1AvKPKlEuwdzrAK0rKpei8Z12k3khKc8UNeH6BIXDSDWYAM+KIZnnHubClvmNbImDwTT6dkNQHQujgZQAaX+2Fri3cmTBdAcSDD2buavJIDlOa8/jF9Z4j8GMatjZ+F0iVXbSxXjNJX7pNYI2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785384729; c=relaxed/simple;
	bh=LAu2sW5l3IiFBj/Rjq06BIicVSjU9eqoVk3guL9bz/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3Z+3UJy/OxTgf93nYeZx5Uw2XY7WK+M+cHigm59EQ5dt9d0WsrldShEjqyQf3WqvalCQkkhA85ls14duumhw+s+5fYIPyk2b3S31zlFQLJs+jYReJQKJ18eDlNvUdA5Zl2TVD1DfC8/hVDas71MCrcWPElDld/VvB/XgOmR4g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaUPqcGN; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaUPqcGN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce98cb8165so3717495ad.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 21:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785384727; x=1785989527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJL6cS6g6CqvOf4rn75EuWDitpA19wttRxq8V4yVCks=;
        b=MaUPqcGNf8lEXdgwOQ7KlEA4zqATZiCHF+G8J7Kt/RWJZBq+N2wB5W6scg1EdlwdEp
         As9Uc2tOFJqqbeBfSw/YAAth1PPklTP+4M2oiZaurOi7tSNKt0IpAQChQH1eZsPjjJmT
         rF8Jqv5Y0+E2+pIr+ro//kwht394Zk3yzWLJukwobkmM+m3t6ErmdQcpAFchSIo1wMFg
         f3Y4VL0PmP/xuHx8dceIZ67abg3osZAS/wYh8cmTAEvaJpL9YlfhsnXpJiEw7bVvcvJ6
         PrFAGPjPHnoGQSSrxlC9fsFcUG+LbHe7y75hIda92q9+wUL3H11GgAfFwNHaaQTjTKUc
         yvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785384727; x=1785989527;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJL6cS6g6CqvOf4rn75EuWDitpA19wttRxq8V4yVCks=;
        b=g0AIMnB6zsq4jtOJlpdvNFM5Y0SWikuYZQs2blaXAAXhQceiPaKoVVg65efm24iVS3
         usnUjyv7k4mYQ9ZadPoI9jb7kI33Ogk1APwlSZwSKeW6GGhSLCYuGblGdt43USqtj8BL
         /y8uibRZahL8ms1es8N7pqmNsvmGBgIFz/Ej9bAkL9M7t7wKLKWjqWpF6yDH8BBIlM0W
         oez9B0C9G5NiuTbG3U37ztqZ0K5Kh83gcLHBOzoxgAhKvgfumCsiDeesA8DWFhJnJSQH
         yW1mJ9AYLEgbd/AibzsU3AZUEsniautf7DKMoQ0VT65ywceErA+qXcdTx7x3/BlDdGii
         8dOg==
X-Forwarded-Encrypted: i=1; AHgh+Rofl5DNk879n5Hkuevt2St4FtiGDGkZAZh1cgmegz+0AyIhVopNHiFAeFY1WwUycHpjRjDG1fo9KRKP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+WxzzizJq0s09I1aXb++2goY3mWwpEFl4BW7EpbgV4i75kz0c
	fx89ImPpqnJ7rt9Pn9osyuI57evtbTx1VFPPXYaioGGJOwFzpg3WlrUJ7ZguEA==
X-Gm-Gg: AR+sD10f6d8Ab/54xbXSoshaWzQ3ZbIehcRNC9RhlhEqYuJh/vwhlGNa8oqL66pmHNf
	ysqmGITIAi7Sx7ONAbLtQVNNLpHriHPOwDEawSnJB+XoeoSi9LRpaduwsyZyFpzrUz9k36LrO5O
	HQe8/D0oT9B7Y6qUo+3/m+dfgoFyLXh63g98a1Erkt2PaEsZ3N2VDEs65zdneGT9q4OgLgX0Z2e
	TWuswunaeNEpqtjFyoYvwMb4g0ovLr9mxOgte7t0dAx+1EPy4Kt0s4Yz0SNkIjkK5KyUrBFXf4f
	0jqQ/hWILnK4OfQ/So1fZL0ShFau2UH86I/mZvoWTN8CF1xXXPQ53qq2W8iSpsG1Ds+9gT5FDJG
	lJJKDW+AN0uGww0q6zsoemvKQDEdnKugmfwshyubf2K81FPqKrX2mzcdJkFu8VCMAtg0Acpz+bg
	llQUPYHHT4FW2NYv8l7ZBC5EKSaj2Kxhdj+9BkcXj1PZ2jMhyHuljTnmPdiKoHe6xbRZAiHEdK9
	pmH2S3duJQnon/lKz3kO47G0ukvZB1ZgJIPFw==
X-Received: by 2002:a17:903:1ac3:b0:2cc:80d6:b72 with SMTP id d9443c01a7336-2d036fb0f54mr6657595ad.20.1785384727063;
        Wed, 29 Jul 2026 21:12:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c3721esm19709085ad.77.2026.07.29.21.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 21:12:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e8107a53-6d77-48a8-bb4f-24e9aff9c27c@roeck-us.net>
Date: Wed, 29 Jul 2026 21:12:05 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
To: sashiko-reviews@lists.linux.dev, Vincent Jardin <vjardin@free.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-2-98848151cdb4@free.fr>
 <20260729220154.3B6021F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260729220154.3B6021F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 15:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The newly added compatible string 'mps,mpq8646' lacks driver support in the mpq8785 PMBus driver.
> --
> 
> --- Patch [2]: [PATCH v6 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646 ---
> commit 341628a3dba9f658492690f20d45d96084eb12d5
> Author: Vincent Jardin <vjardin@free.fr>
> 
> dt-bindings: hwmon: pmbus: add MPS MPQ8646
> 
> This commit adds the mps,mpq8646 compatible string to the existing MPQ8785
> device tree schema. The MPQ8646 step-down converter shares the same
> constraints for the mps,vout-fb-divider-ratio-permille property as the
> mpq8785.
> 
>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
>> index 90970a0433e95..d7a32fb3b7af6 100644
>> --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
>> @@ -18,6 +18,7 @@ properties:
>>         - mps,mpm3695
>>         - mps,mpm3695-25
>>         - mps,mpm82504
>> +      - mps,mpq8646
> 
> [Severity: Medium]
> Should the corresponding driver (drivers/hwmon/pmbus/mpq8785.c) also be
> updated to match this new compatible string?
> 
> Because the DT schema specifies the compatible string as an enum rather than
> allowing a fallback (e.g. to "mps,mpq8785"), it appears the MPQ8646 device
> will fail to probe. The OF match table in mpq8785_of_match currently lacks
> an entry for this new hardware:
> 
> static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
> 	{ .compatible = "mps,mpm3695", .data = (void *)mpm3695 },
> 	{ .compatible = "mps,mpm3695-25", .data = (void *)mpm3695_25 },
> 	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
> 	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
> 	{ }
> };
> 
> The I2C ID table in mpq8785_id is similarly missing an "mpq8646" entry.
> Without these additions, will a device instantiated via this new standalone
> compatible string be completely ignored by the driver?
> 
>>         - mps,mpq8785
> 

Sashiko for sure doesn't understand that the same bindings file is used for multiple
drivers. For DT maintainers - is there some common guidance for situations like this ?

Guenter

