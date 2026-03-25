Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0883385B9
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774477996; cv=none; b=DpYRDDNqn54ICltZuTKxd2Kk2bpL4k+dhHUwsWGlirgT+bOqz9UuQhIovH97stgu+EDol6PY7TAW0oTKodg1avB5Qz+Wj+G8iOVA8p1V5mB9Rc0hQbvDx/pfEDVLLJvUBMG3D8rLb7YskUKedj9gf2IeLZ2UNf30gSwvijnO4lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774477996; c=relaxed/simple;
	bh=naBQi7shofUGxunBgNte7CeJA8dVw8PHKBKVIyPmkh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAXPmYH8Hddfs3Z0UaXKPVJGD8dt9cYAQCFXGKvGoMm8P2ZpLDnTuhLZrKkqPYM2y/pJGMtQz/zIncRs0R6Eg8CWVKIM1h6rvsS1Zzc9tkNw+QVzYMrwqBZyhMUoOmhy9X2hUzIH1f5NQJZOlVONUejYx80sKsmXEld4CPLPsnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSZS/ohx; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSZS/ohx"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-127380532eeso773670c88.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774477994; x=1775082794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=14O+rHUy9JUHv4nndxIKJLmJP+F4NFBUxwm3pxRAatw=;
        b=sSZS/ohx2r5eSqD3yx1nUzQ2cL3d5PMh6tIFW3z5QIZjMrPdgGQkdwnSaFSnAW15zc
         b2jagFUbbcSne5XZFRo5H1yb39FraR7PVLMKFgG0rTqHyGQcg1PUrGRJEzjJS2h7Hjru
         tr9SSUqbRjbuXL+bNk2oZ9wMk0vOjiMY5bNgJHhgcSlXNSI5Hi+upeH9bVfHTC67rP9o
         uUQVAe6B4w4KVww2AFk2BbaeHNxAGMxNWak5D4g+WOnKn2gsrVwectxpf/gcz6gdZ6My
         wid/+tQ+/nYMDQUmCYC9kOtdeLuo6NZ9ivuSfKs9WZhqQh6EegWdxTMhlPCVvRbFCiOA
         fJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774477994; x=1775082794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14O+rHUy9JUHv4nndxIKJLmJP+F4NFBUxwm3pxRAatw=;
        b=kLrkyux8oehhTjhNrJxX+AKWGInljPgXNEA+7VHLKbeHoYZ7L+TustITLurljG64dt
         l25rdDHnaDpo7DoRybURqpPDZD41HF0ki/jczEMxkCP2NvRQ0MtlKn55iinRh8LAqesO
         1xeAn0E3JhTeqJC2i3Aomq9//caYS+nq6f8u8jCrfiF743zrsN5qqjhpeVZwbD93zEBX
         P/BqpeIrgHRumyTWVSZ6u6H2MtwIWqe2Fs8/MNB019W9d7TB5xx1ti8qI9EDgjZt4f1h
         J0KgMINuQFXckKfxT0Gqs5K1iQNJ4LtIayMA+297RAx7hFIh9qcgOSZZDroGQxCWw0LN
         EG1A==
X-Forwarded-Encrypted: i=1; AJvYcCWMSMcZE3UwOH1sruUbAIgotV2x7n9CV13Zcj2Lh7+dZbLySvyAGFMm7pNMx2mr3ttdHZSskN4ReGMf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1VrLH/tzmAW+YcvWkBvJs24pg6abP91XncelabsUthgLjUkLc
	Uhmbejz1vAKOJ8Y4vzQZHs4juf57EbkJuod9Oujyr/O+i0xU7a/sYW/b
X-Gm-Gg: ATEYQzy87I22drT98w3C6d6LiXJQ1SdLCONIo7T+j0Z4uCGAz4/siXER+HOCKLwC9Mx
	Dcga/HK3o58khXDQ1Zk7zLcDxd0iGbUe8fdwrHCmV73AAyODsd/ZbgA8dgxmOmSYul3ISigks3d
	DPtcI+fudmwSXOh8lWMmdx83aYV/6Nqqw0v4lX5x3Vq4+qKbvaFCWJr+wOdsmn8Ef7SxrMXHgrK
	yvblbkrjmJ4e8TPt9iTu/cRsNb1c+7ajPAKhOu7Udk5p9ezbWk4iBlR0ABANU8hmsfYCldkkbdp
	fE/dA+DIsinG0g6VK611keDnfqsi1MMwR8ids9q2E4vYge3ShwKLSoVcDKfl9FEBmlgFaoe9xZn
	9ub+daCOYL0JGajDZixfp7w9ahxApT2UPFFefS5PY59IWrAgfwwyt5cc8vbW7OPak7r16i8yW1K
	5VDLEqfZUdSHoMO7m22pcfdAOOXUdf6MVugY82YlhKJEBW/UMsJ9VH8gTbwT8vhmgtJjjto8LZ
X-Received: by 2002:a05:7022:402:b0:11b:c1ab:bdd4 with SMTP id a92af1059eb24-12a96f04f69mr2620804c88.38.1774477994108;
        Wed, 25 Mar 2026 15:33:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa762430bsm1567649c88.10.2026.03.25.15.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 15:33:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f016c567-dd37-4f1a-8c8d-5b8dc6a3b9a3@roeck-us.net>
Date: Wed, 25 Mar 2026 15:33:11 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
To: Rob Herring <robh@kernel.org>, florin.leotescu@oss.nxp.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
 <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
 <20260325215630.GA6513-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260325215630.GA6513-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/26 14:56, Rob Herring wrote:
> On Fri, Mar 20, 2026 at 05:29:58PM +0200, florin.leotescu@oss.nxp.com wrote:
>> From: Florin Leotescu <florin.leotescu@nxp.com>
>>
>> The EMC2305 fan controller supports multiple independent PWM fan
>> outputs. Some systems require fans to enter a defined safe state
>> during system shutdown or reboot handoff, until firmware or the next
>> boot stage reconfigures the controller.
>>
>> Add an optional "fan-shutdown-percent" property to fan child nodes
>> allowing the shutdown fan speed to be configured per fan output.
> 
> Why not a common fan property in fan-common.yaml?
> 
> We generally specify fan speeds in RPM (and then map RPMs to duty cycle
> for PWM).
> 

The problem here is mentioning "fan speed" instead of referring to pwm
duty cyle in the first place. It is not just misleading, it is wrong.

It is impossible to associate fan speed with a specific duty cycle because
that differs for each fan. It isn't even consistent for the same fan model -
one never knows what fan speed one gets for a given duty cycle. It depends
on the air flow in the chassis and on fan-to-fan deviations. It will change
over the lifetime of a fan. It may even change with the ambient temperature.
Fan controllers use a feedback loop for that purpose, but that doesn't
work here since, after all, this is a shutdown parameter.

I don't think anything but specifying a shutdown duty cycle is
feasible here.

> Also, we have (or can have) cooling levels defined. Perhaps we should
> define the cooling level for shutdown? Maybe other things with cooling
> levels need a shutdown level too?
> 

Unless I am missing something, the thermal subsystem does not currently have
a concept of a "shutdown cooling state". The driver supports registering
with the thermal subsystem, but it is not mandatory. Even if the thermal
subsystem would support shutdown cooling states or a similar concept,
I do not think it would be a good idea to mandate its existence or in a fan
controller driver.

Thanks,
Guenter

