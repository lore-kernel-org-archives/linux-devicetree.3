Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08473BE641
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784243653; cv=none; b=tUth8XVGOuPK904Q5yNUlX4n9C0BauHAPq4yrVdYbuO20I6g6wI5li7eFMSULuEqvR3hHc0YbmPRBrIfHPC45YZiGhPmViG2jmvPAITwecD6zQXsQnBqNxL+1uop/JSs7ArIUncWOBFbLbSl6HBGk2Gl50IC0GfiVgVNDTGnaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784243653; c=relaxed/simple;
	bh=l9iG0k7k7PdZztxcBTMyPl3NPKF0Kwjp6WemYfeqYsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dl0LHaF5ZhYaFWmV5j0pkcSyNJJSeBRNApJBR/rW4qzWJ66fdA3VZesismD/Xm76/ErtWL/8SxSjv73i1EOjPlpTMlAo14hKs84/wmZ83r7n4h3C1GhkGdCPWa9VZ0sn5BK5JUAoZ1DP56iqBs1YcpyZnCJxNkUdolvyySxwyy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uf8VuppA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uf8VuppA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceb096e675so66764435ad.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784243651; x=1784848451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKfkASazymAuzBp77HAv2IvpHNmRZScs7UCnl03HNVA=;
        b=Uf8VuppA8jxLh+yGUD8olgVSTK6omtXOMHPqb4UD7fwh3icmJE+neavxCA1I9l+8Qq
         sXRvPlyEvtyxhDg3Hio0lVdwVBhi4amnvJ4EkZ03jNIHcxdE7iBq14CEjy46AsAS38ge
         Ri/IPwtcFH2bvvnycB1ASYoqUdeFmi0yPa4s1AC/IJSS4PCXfUiWptrFl43NS2eoBTwA
         kAJdSJbR89BNxNT25Ouh27MaeM/sMhJ23hcSxexE0S7oBt8E3VFywihZYQAJSPEJXRWv
         imLQMs2E9+BLh2BOZ6bOAhUTjNYgXX96AoyB7vSJZ/Nr9xUoKk/XSLd4I22JZjPBRyDs
         wRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784243651; x=1784848451;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tKfkASazymAuzBp77HAv2IvpHNmRZScs7UCnl03HNVA=;
        b=eFM61jtbgINVukGJpqwt26Oy7Gufp9iBgBTQnULSjBH2pWf0DipmXBgPbb0YOvq0iV
         SOgqW5nagVNGGmXFmXUPCGvE0wTBEzAQZ7xNmTbClRrsFAZWs4EWhWmea8Gbfdhe78RB
         skdVncFLp+gJP6XFGTdfSlt4CmGYS3ykQOPJtT+Um9EPqFyyLSQ7rX7fmh7aGUqmnofE
         SptASEtxEz8txEoGLkXeCjgfUqRMoiGpLdYa4BmwwI4jq/HUebCra9LBSbLQgi27Tgb8
         6zHo20LTvgFhOdn7G5svXywyf72KIktjCuZHLUrvRkO4Megg5cMemqGgxG3jA/Wl9ybe
         IzcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrelhHR0BOdY6KGKX3ON0k5vU/V1KWyz8xYOVn9xd4VZKAvmzcNVjlPzpd4g0OOymo58p5gwmpPhtlm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnnu6Z4OnvKuXiyrfNy6cze/qD6o8p3/bLxuV93CW8fILrI7fw
	sHKVucPTNavYUDSdIVWsNHGSm9n/ShdncT6yJJ7NgM7S9/0Nw/vfct7F
X-Gm-Gg: AfdE7ck5mcoBSsLiHuWCXNd1AJ7Phgn6JHOQ/hPFbXF1kZ10xUwbC105lPUSKnwy0mk
	BhSZvs7W5Sh9eU71pl8OueCdXjDdbLeFViEt4hsFNK3GQ4uOat3PHV8jwOStikEn5Z75ea2ZktR
	Hk+qwdPzUUwOiUeU4LG+V9E7dN8zMqnrZVmxHAqM2DKHkuCMmZ25pJMeeO5ZrJ5xORs1yakNr3b
	7ytTh1VQtfBe3F/Ns2EVMk3pCH1H3owoV37Wbk//QEFTbQrsruf90hbCL8kwD+fJ6Sv7kjtp+jD
	YVFHkWhwi+JzYraBRE4jwlOWUvE9NCRiXRkY4xXJxr0KwBdM+sGEG4jskSOnDwTYa+u47iyKKk5
	oLun2/XRw4QTPXipvG+VK6s7e/s8tttKiZ45JPyBpi+bpz6XED3o2qCmR+xKwYZYB63U+wrFoGZ
	c1Z8wqWxjybqF68XhZCaq/tOWN0YruNO6yU/IJDz3uudAYaVz3fpU=
X-Received: by 2002:a05:6a21:1506:b0:3c3:791e:5e0c with SMTP id adf61e73a8af0-3c3ad7d165emr22293637.19.1784243650965;
        Thu, 16 Jul 2026 16:14:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd426b36asm12389178c88.2.2026.07.16.16.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 16:14:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <37ce18e8-d505-415f-8e01-0212840aba8a@roeck-us.net>
Date: Thu, 16 Jul 2026 16:14:09 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hwmon: (adt7470) Add thermal framework support
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/16/26 14:21, Luiz Angelo Daros de Luca wrote:
> The ADT7470 is a temperature monitor and PWM fan controller capable of
> monitoring up to 10 external temperature sensors and controlling up to 4
> PWM outputs.
> 
> Currently, the driver exposes these sensors and PWM controls solely via
> the standard hwmon sysfs interface. This patch series integrates the
> ADT7470 driver with the kernel's thermal subsystem, allowing its
> temperature sensors to be referenced by Device Tree thermal zones.
> 
> To avoid saturating the I2C bus during frequent polling by the thermal
> core, the thermal callbacks are designed to read from the driver's
> internal cache.
> 
> Patch 1 adds the YAML device tree binding documentation, defining
> the necessary #cooling-cells and #thermal-sensor-cells properties.
> Patch 2 performs a minor refactoring to introduce the ADT7470_PWM_MAX
> macro, replacing hardcoded values.
> Patch 3 registers the 4 PWM channels as optional thermal cooling
> devices.
> Patch 4 registers the external temperature sensors as optional thermal
> zones.
> 
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

This chip is 20+ years old, and it is very unlikely that it is used
in current designs. Please provide evidence that this code is actually
needed and not just a coding exercise.

Thanks,
Guenter

