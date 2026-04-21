Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E983D7D92
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781189; cv=none; b=uekzn5knpeo4Yss3f6yV1/55n+j5Me44g70t4mEWrdqWtl7UgDL1dVqib+vqCgEOv4cjXDhA800RpetXf+FZhxQXUImdMgDXo4lekbK/s1LfRkRUtoQMBWsK8pxQaEUhMmZFf8KJdJ53ogn+QQ+fRJWpPy8vvj2OXKX6HAZ6HOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781189; c=relaxed/simple;
	bh=UWPQCfgf316qPUguCLiEFmB2ZXHdeN0sOy21ZYEMOWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8m8Wbe0Cd2Ei7L+cofCXbeIB8wAHa40YcNCZbmGpRlf7Wmn3ZZgW9w8GI0rgS+DgSBBK65+0XwRsTTLvfj1W1f+nkwrYPswIuQiRakQbxLZHSTuaNJKW3DGK0y2jUZl6Kssxo1I2rMx5kW0USo1tdSlOC7unWqM6JBoNGXAmN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Y2p/7jYg; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Y2p/7jYg"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4648447e29bso1240659b6e.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776781186; x=1777385986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ya9KQ8AG7Y9lezf9EpBb7uASqYKD1uqcvJf1BeHB1ns=;
        b=Y2p/7jYgEuH1+I7MUMEh33jpigc6gHDFNZ3kxhcfDJj+m3wXd13qKM5lAcSl7+68Ef
         VQFptxE3Js2158B8xtORWckMaP0rUEHz6mdYDZcsKXlgG9ZG/rBVBj0jQVlzmCApzPxp
         Iye+7f+A0tDgbPT0X2r1/BHli8JkOWb7duzEH4N3tzEuKk/P/yzBSONuzOBWpTsrP2UH
         ZW9flHnFzEQ8nIgp1zZSd3Xuu8BFmo0Gci3mA2PuqkzBPOPqT1nDtoocA/xiHl+QTUXz
         AJbwKI3k9Xyykg7JSzbXUT5FHR3citteukHoLz6LQLP+jWv2lkinu4ryVnRvDYzq1rFL
         RV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776781186; x=1777385986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ya9KQ8AG7Y9lezf9EpBb7uASqYKD1uqcvJf1BeHB1ns=;
        b=YLEBX2DDCyt/akEyuX04etFyl9luzjZ3WLoO16yyP9/FSYu1f3KdzAcBFC9FqRgdw+
         JqDNgrQrCiWBC2Aw8Y3QR1kqxa/04UsdABfcRqDEGKJlqxY808nbMEtba6Qo4a16G6Bt
         dFGXQVTZeQJIYQCb0D3uKoRxam6+Yb8oBF1dU7gggWWmvhuIHFn43/DGvnyAm9JX3pHk
         DBbCQw1rqKoXpSSXzI3av80ek4fscVdwc6bimOVE5+fEjD6O12mopPec/TvgP5Jw6YNd
         O0E2I2f5jQUtgbDY6GNuJR7D3mkka5lKlp4a5vBTbRidbbBGWqvuJRmqLNvWLwxyeEp2
         knqA==
X-Forwarded-Encrypted: i=1; AFNElJ8G8SXCdvoR4RUAFFmSjTVCdp3ugxFrgyHnR8th6rFUR7TTxJhQypOi2H3QEMGOjSVBTs2Chlxc7C3y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcq5N6ASqU6NK+Y5Srq4D+ZWYlqPwKNZIemXijBBMo6k0+vhTy
	4EQEthLCMcuWaSxm0tvMjYxYwqvijFUz2pSTDTxeq+mym/rjetKVtMJu3YUawiArymU=
X-Gm-Gg: AeBDieu8pHjRtD/uTM02CjZvgPUpGAhHca1wQjzcwr01mHLIwoiJdVjNuvh+6KSp6vM
	tM1KKVAkM8mKJUjUf/V6wyYxI0px2iQgSg69PLpSLES/0f6ot81VNgREteG4wRoWdXr0oar2haj
	tGdxbI4UAjJvu4R7+jGFT5LXqE2xzdzF9OtWz0zohqlOk3b30f+Z3WQdXtMnY+6WOUglZ+bJf/4
	NTA9Z4EFAxmGUC6D2PmkNDCYscJhDlqEcFrffEVp1RZrTJXhtk/F2vdrM6TNBcTHcTYr3jVapPN
	p1QpIiki6CQfQwEsFJHH7NcshsyyB4OdniF6qbjiC2QA19Uhk2tsdJfPk2YzjvHeG2ULQMUnSPq
	RVvzc6CTQ2R7ORhJueMARgA2Sf/NMWIJGc6wqV/sEctysGNWTV8TtLWa8LHiGZBRWwzV7jozYge
	pUpIBP/IXUu2BSA92jc4XlISrTlTC8yU1t5y+rov3CT9qN0gO1bGhJ+4Cy/CGISUIdg/CuInMVk
	/a0KVtFcLgf
X-Received: by 2002:a05:6808:2507:b0:467:3f4:9073 with SMTP id 5614622812f47-4799c882ed4mr9496713b6e.16.1776781186245;
        Tue, 21 Apr 2026 07:19:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:dc5a:64e5:1cd3:94d5? ([2600:8803:e7e4:500:dc5a:64e5:1cd3:94d5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930bd9f2sm10716833fac.8.2026.04.21.07.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 07:19:45 -0700 (PDT)
Message-ID: <60e5cb91-e82a-47be-a7a0-c89f5f1b04ee@baylibre.com>
Date: Tue, 21 Apr 2026 09:19:44 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: iio: dac: mcp47feb02: Fix maxItems value
 for reg property
To: Ariana.Lazar@microchip.com, robh@kernel.org
Cc: Conor.Dooley@microchip.com, nuno.sa@analog.com,
 Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org, jic23@kernel.org,
 krzk+dt@kernel.org, andy@kernel.org, linux-iio@vger.kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260417-mcp47feb02-fix5-v2-1-6592ea499cce@microchip.com>
 <20260420150116.GA2486072-robh@kernel.org>
 <8a57341539af3a96ad42004be2389370b76a1a56.camel@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <8a57341539af3a96ad42004be2389370b76a1a56.camel@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/21/26 9:11 AM, Ariana.Lazar@microchip.com wrote:
> Hello Rob,
> 
>>> @@ -161,8 +161,7 @@ patternProperties:
>>>      properties:
>>>        reg:
>>>          description: The channel number.
>>> -        minItems: 1
>>> -        maxItems: 8
>>> +        maxItems: 1
>>
>> Perhaps there are 8 channels and 'maximum: 8' is what was intended?
> 
> 
> 
> Thank you for the review.
> 
> Indeed, I mistakenly set maxItems to the maximum number of channels,
> rather than to a single entry for the reg property (reg value is
> between 0 and max 7 based on the part number).
> 

> If preferred, I can also add minimum: 0 and maximum: 7 to specify the
> valid range for the channel number.
> 

Yes, that sounds like the right idea.
