Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B5A3C276E
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572283; cv=none; b=kmwYganZJ93JJ+569nl2VgoH1kCyVM1tDpSzO+l8JblAjfrkcw+Gs8VuYx8wsEboaOvMHyC54pDy/QVAtIelA22nJZjkVm1+NEkbrjzNBsUq6rtk1jB1N4zWr6zSZYcnkj3vh/51I3EKuEwsruf4VKxAnU6NjD5Un8Ua87bt9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572283; c=relaxed/simple;
	bh=CImErCK453/2jtS/jVyzggFVcO9aeFsBNs1Imd7DWps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4NhAt2WAEF8LO2oo2V+ui7UPD40RaVJd/GPBpgxDtkhZLC94hgFt9bjOK+LOXjKR7JofdFYPZhj3qxFs9jem3Awr+gsuMp3OZSYhZXxyVpa74lR0B0D13trswwQt6OG4tspUTrCPuZJol63ocXJSvNdZOScJ7QMz4Nr0DBPHsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YHcbyLfs; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YHcbyLfs"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so709954a91.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791572281; x=1792177081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voQnsCMf54BeM6EKGprlzbES0+jYHxFzIpzAIjrxSoc=;
        b=YHcbyLfsATTi27I5DB3mBTZ4Pr+dHoum8ZgLbLz4hKwL/h72KmIO2k2J+nmNVA8TIg
         HBBQZLAND14TTBn5PLv1aLP572i8KtT+R8Jd8aMwPJtAYgKt0ZUY949aJn0vs5D9sa+z
         QJNA4+9by9/g42t9fg+IH7PhwpwmfMS7pNgH38as8bfMBPavPVxsMP0cbzza8oK8vAfX
         e7JWKpimiy13/e9ksyj6iU5HVLVZqoQNFrpNAz/xCfNTMNmuKu9ISwi2minPZUpDpKr9
         MsnCWu+mdCQESWi+oMTkV2bUTD6uNN5yf1LhfpzfoWu8uEb4erXYDdkTf2MjUTFKBHWC
         Nilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572281; x=1792177081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voQnsCMf54BeM6EKGprlzbES0+jYHxFzIpzAIjrxSoc=;
        b=mSXXKK3M8ru1i4I5LyFL9Yrx0ljrrKs5c3Zy2C+4esgoZFS28Dpk5oUwsIvmuouYem
         oZubiKtMt423z7J2n0lqX2pU9RiEWH30sEOVN+tK7RSyPPvlW6McxXwbfJUX6o2JBC3v
         7pJmFIuYtsSGwNilemBlxX5zTduHKDN8fSZA5OYuZOYTk7dSWN7sRgEc5htmPtt6kkVS
         i3tKO7bFLwbLREyE2Yml9L5A5a8xM7PjlpFWN1yQtdp79dYyiVwU3V4aEUReuNnDS5j/
         gWtH1rpAhUZjCwpFUons/163QFn74HsDWFiLeZtFqA3XLkIU78+mERjzcmxLLK59F+s1
         IDQA==
X-Forwarded-Encrypted: i=1; AKwUvBxrhaBtlfrssoTVzgTgFOGoPq8iCdJ03Mx55ooToC9lDKnLIGYmlZapAkyUtvxUKZTPC0D4/gBKdy7y@vger.kernel.org
X-Gm-Message-State: AFq9FYKFD5sYF6RQXYRBHACCixqbhLYJHiAXuW7CD0+N9qxwxAb/nGEQ
	V2MwdsEXyGGB6RGqEBlAPLxyK0pF9avNz0dPSY9UPrumTK3zjK17WeYmMd7H4kAdog==
X-Gm-Gg: AYBFou3foSDw0EYr5UZQ5nby5eGFfOqRudeFlcQS1ZwRBHCSueKkL9e02jHOkOx2VrA
	dUukmS0kkyyBijQZt2EbcrTKy6bp2ru1c8sRaMYG0ZR+mDbWoAe5+A7/8FZD9UnElT9RnVzmoDM
	QhuDG1kh/qY+btD6ccXclpZA74wNkKU3E7s3LFWfkHAAh8ZAj4rlImw9HhKMY4FdaCRK1iX4o3p
	LqLTmNBVjVHA3NLDoWx8W79t+qfhI/gNjq8L4pyt7vJGfHf+oO7qSwe0YwLm3iQRkpZOGxjwGt9
	TAzpoZOvcnxVdqrcqbJvNPbTvHCjWuymnX5N2buMtb1P9ReQ/YXjoeVIK0eV+5JDrZJ7GrJ11Kx
	RRBmY2ZKa3917P07H4923UIWv8WHBPzAlal9Wcvkyh4GqfyJoBEmbXJVvbV/VZEYYNqJ21a+GVp
	NOnDCJCj22lKUcNtENdCBZmDNHBMrYH2PlnyCySu5Ij0O7xiNuLCb/GzLixbYecTvkaCsR4iJbc
	oo2/FmNHUl+x+jY+sFC6BqPXDVYonQoI+hJ5XUvqYK04GsNZSnAenHlVqCEZ9wWDVFGKVl6OF2i
	UPozzaBJ0fu/wihya15Fxb8FXSjmk/X7Stj3AAjA
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr3010368a91.38.1791572281011;
        Fri, 09 Oct 2026 11:58:01 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:3cac:e69a:a0e2:88af? ([2a00:79e0:2e7c:8:3cac:e69a:a0e2:88af])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm5852181a91.6.2026.10.09.11.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:58:00 -0700 (PDT)
Message-ID: <9046b5d6-ca6b-4466-bd8f-73f034234caf@google.com>
Date: Fri, 9 Oct 2026 11:57:57 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: connector: Add time property for
 tSenderResponse
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20261004-tcpm-sender-response-time-v1-0-3f8b43084acc@google.com>
 <20261004-tcpm-sender-response-time-v1-1-3f8b43084acc@google.com>
 <20261004030531.9D32A1F0089B@smtp.kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20261004030531.9D32A1F0089B@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/3/26 8:05 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: missing schema constraints for sender-response-time-ms
> --
> 
> commit eb9d81bbfb13df2dbe09db76aefbc40c815abe01
> Author: Amit Sunil Dhamne <amitsd@google.com>
> 
> dt-bindings: connector: Add time property for tSenderResponse
> 
> Add the sender-response-time-ms property to allow platforms to specify
> the tSenderResponse timer value, i.e. the max time a port waits for the
> port partner to respond to a message that requires a response.
> 
>> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> index 8ca0292490a2c..52dbdd738db64 100644
>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> @@ -283,6 +283,15 @@ properties:
>>       maximum: 200
>>       default: 200
>>   
>> +  sender-response-time-ms:
>> +    description: Represents the max time in ms that a Type-C port waits for
> 
> [Severity: Low]
> Is this new property missing minimum, maximum, or default constraints?
I could add the min, max & default for this property. Will send a v2.

Thanks,
Amit

> 
> Unlike other timers in this schema (such as sink-wait-cap-time-ms), the lack
> of boundaries means offline schema validation (dt_binding_check) will silently
> accept arbitrary values. Should this have explicit numerical limits to prevent
> accidentally violating USB PD timing requirements?
> 
>> +      the port partner to respond to a message that requires a response. This
>> +      timer starts when the port's PHY layer receives the last bit of the
>> +      GoodCRC EOP corresponding to the message requiring a response. This timer
>> +      stops when the last bit of the EOP of the expected response message is
>> +      received by the PHY layer. A timeout leads to a soft or hard reset by the
>> +      port.
>> +
> 

