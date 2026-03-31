Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983AA3A7F54
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973460; cv=none; b=Ll0wBV2VEGocWL+lgiFoe9KwHtT7IXFrcE9opAEsyG4IxUOnrJVR11A5yONalNpqSDYUeGAInAfE7TExwzKb/hgaQyw3BoOlrV5mutv2ZZtKDPbDUhdSAyszGMyJW/pzWLpveJwDyxInNEWRRF572nf3tI/46ie/VTVS6MjWizU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973460; c=relaxed/simple;
	bh=LRVKeS5UMhMw551V77BpDlsejOUZZAbhApO9Fmahy8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luickE+mp3qxlSmrXRFmT3NMsZm+p3Xw3LpHLJf3gxwRShdTkLsBbD3qGBUz0EyGnJcJhMxcT7bq9AuqgxQyYthcZIBdgLSCsIZXwqy7ly0g3CWKab9xk9CZJyGA/yW06clx+6AlUvdhNZ13OmAQ9ZfTPFdOCa4yt8ck8py2/q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci/tv7eZ; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci/tv7eZ"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1271195d2a7so4240570c88.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774973458; x=1775578258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FwEdWQx4WwArvZlgCkXHXr1gQPTf5wZQM0MIEnExJzo=;
        b=ci/tv7eZQLB3Vt5+zJbne8ctxEy6pLTfAR3MUuX37hHQPRglIpnUQqzSgOekbyHU52
         fAPOUYcGibb8GnifSS6ArS248ldnfB786EZmOvz5A8nbPDQbFaubcTLK87mFN5siZudM
         YO9zwYWBQpZrUwQLF1QCJAPwfSI2p4TQkHtmjM3uA3mAqd6JHFguqjL/G3WIRidpufDZ
         iTfPt1jYZQtk7rPxzBU2tYF/sVTQUknEsueCmXwibZjIRWXYWOJizIEc8nA8bI//gSJi
         a1/Gx8kbaiBerk2Q2i3w1UHuToOxWoyhyp88iCh9NaZgcHD0JVV4gA8rIcPYFQbFjK5g
         K9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973458; x=1775578258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwEdWQx4WwArvZlgCkXHXr1gQPTf5wZQM0MIEnExJzo=;
        b=q+K8ML70pXo9VbSCHmgckpl73nLJKR2uicQOzJ7QkS1rSXz9j/JsXMoSfLiNP+3Ku6
         kNIg26Th4K4uvaHJzdjhyvEyteWZ8AxCJc7ArMV4EWgbf1cGre3hcKbJfI+pFBzKJC+U
         xNICCzbwmQ9JiFOI6Gfc5Fa2vF3mIT8BU8WNCG4SfL83W4Df0tILh+cj1tHzvIVi4muw
         WaFd9Ct9qNcdMq8i/TNHDS194cfXFYoAaft1jBsODjRihpBv3zCnXKAUxy8dnepiQZCJ
         TOjxxsoSMDxz9dEhfLlPiJlCvm8mX7QryM1ox0KYKocUraoNxpM0gqLFG0MV2crpa5DM
         KrbA==
X-Forwarded-Encrypted: i=1; AJvYcCVeTLDJReqjwQIAQRayNxbvlY+UhSInH9whdXTUNMjIc4NwRdErp2XhKzrxZfGzKpKXaIfQ5Il2plGJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDHNi0OqweBLx2hDuqaAIY+sW+9SATMyZ/B8YhQraVaaeawYA
	IQkZGl55eh4q3OuO3CkU8cWahgd1eHa25QiSEHymhcyZm0kF2o6yw5GG
X-Gm-Gg: ATEYQzy/1Qo3V+o24MDY9vaODyRbNE7r6zkLdsX5gmNpYERXYvleJU+6AvvhlI4U4Vh
	QwGqdWz0L78O+tZDYezSF3sVpanrUAYJOfeXdAaQxnkWM8VawKcVzJ62niDn8ATeqJ58F+19ElQ
	/Yiv2pVGclBXVjYkOrNTEah3gP8yvC/PgdH16o3D7rwzu97hVUaa2umKB6jn5UWMjpYWB6WZHSo
	35xuWFYBxadh1aOKW9docwfW6Ryn4VhGkXcb0KeQcmQqVfaT1WNzDlgVB3e08tSg9DGfyeOwrsA
	dZgUPgQ87wachUkYyBwRtygcDGRJCppizYYFZpXOmpv1+sBNt3YfFo1WakeHsi5qi2/5gN7jCXR
	Nikl681cQhYvQnHf2e7sTzKk3YtS4sKPGf+3TwwN7EbeE3avJNv9/QON0eTRE3qEPYAwZW+khXp
	xwP/GbTkDsM/8HPNFI8HbroqI2bDZRpKpwryg/ZnQ37xC/XgpmaQxe5uSM65NgpkGomQe3yYkP
X-Received: by 2002:a05:7022:4398:b0:12a:949b:b9b with SMTP id a92af1059eb24-12be64e9f80mr39479c88.23.1774973457563;
        Tue, 31 Mar 2026 09:10:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm15731000c88.10.2026.03.31.09.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 09:10:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <20872ef8-f68c-4916-a05f-404fd49fff00@roeck-us.net>
Date: Tue, 31 Mar 2026 09:10:55 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add support for Texas Instruments INA4230 power
 monitor
To: Rob Herring <robh@kernel.org>, Alexey Charkov <alchark@flipper.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
 <67a5d1c1-a9c5-47fb-a0ec-5b69a991b01e@roeck-us.net>
 <20260331155246.GA1299761-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260331155246.GA1299761-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/26 08:52, Rob Herring wrote:
> On Mon, Mar 30, 2026 at 09:07:32AM -0700, Guenter Roeck wrote:
>> On 3/30/26 08:14, Alexey Charkov wrote:
>>> TI INA4230 is a 4-channel power monitor with I2C interface, similar in
>>> operation to INA3221 (3-channel) and INA219 (single-channel) but with
>>> a different register layout, different alerting mechanism and slightly
>>> different support for directly reading calculated current/power/energy
>>> values (pre-multiplied by the device itself and needing only to be scaled
>>> by the driver depending on its selected LSB unit values).
>>>
>>> In this initial implementation, the driver supports reading voltage,
>>> current, power and energy values, but does not yet support alerts, which
>>> can be added separately if needed. Also the overflows during hardware
>>> calculations are not yet handled, nor is the support for the device's
>>> internal 32-bit energy counter reset.
>>>
>>> An example device tree using this binding and driver is available at [1]
>>> (not currently upstreamed, as the device in question is in engineering
>>> phase and not yet publicly available)
>>>
>>> [1] https://github.com/flipperdevices/flipper-linux-kernel/blob/flipper-devel/arch/arm64/boot/dts/rockchip/rk3576-flipper-one-rev-f0b0c1.dts
>>>
>>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
>>> ---
>>> Changes in v5:
>>> - Reworded per-channel subnodes description in the binding for clarity (Sashiko)
>>> - NB: Sashiko's suggestion to allow interrupts in the binding sounds premature,
>>>     as the alerts mechanism is not implemented yet and there are no known users
>>>     to test it. If anyone has hardware with the alert pins wired to an interrupt
>>>     line - please shout and we can test/extend it together
>>
>> The bindings are supposed to be complete, even if not implemented, so I am not sure
>> if the DT maintainers will agree here. We'll see.
> 
> Given ti,alert-polarity-active-high is added seems like the interrupt
> should be too. And the interrupt can specify the polarity, so is that
> property really needed? There's alway the possibility that you have some
> inverter on the board too and the interrupt polarity is not enough, but
> solve that problem when it actually exists.
> 

The alert pin can be attached to a board interrupt, or (more likely) it can
be attached to the I2C controller's alert pin. In the latter case there is
no interrupt property.

Guenter

