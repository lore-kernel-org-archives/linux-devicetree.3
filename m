Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC583C3442
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 20:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986304; cv=none; b=bT2Le7Wfpt04LCb/CvgyoTLBvmYi9oS0T6xCDkZJqeaouXDJCZvPMqFsgyqPbnaG7VkZkG4UcscipkQrcKrDWpcndMUPVbIpHidaT/ZIycf2qI/6FwaHzSN1k8wGh8bGuQvC6zeFq4ftcYTACMoes3uGINLHed7K4iiK51e+XOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986304; c=relaxed/simple;
	bh=8AbxnatoXUifDGjwqaRizi+Qr5E765H8Y73G5gm5o0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbP61s8wjMZa30g58W0V0/FKa+mrxZEbg+4VTSTKnU39f1VFIUS2sg3xLjewuKHKbGSGbbFN7crAgXO3+v+M/0yiEFzN7vlroyRGsd4M+JoQw4PRzBwjzs5821MukOe9fBU7a/vPoxOSErej+cHDvxWkRojsgqmm2amhCtfMrsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1ZUVrBC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1ZUVrBC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso60139125e9.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986287; x=1789591087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7afDL+31SJFMeOGNst+LXN4XK7ERQT0EAu5rJfALKU=;
        b=j1ZUVrBCTUr6ssVDgFsnNBe/bfoX4Pw/ntRyU86Ka+7BQgDqExaYZsFnJ71vGkU770
         aDf+Ggl3HQ6RGoIe+G3SDbDA6U9+EKVDCcrNU/qczhMSqQmsNJxH3CwfDEQQNUpuS5kt
         hAoxDWyvxavJqBphdjER72rTUhC+MtKIBbus4VCnc/Wv/Tw9S+7LjFf11mO5F3GporlR
         eBaGy1wy6k+cdUYUHqB8ZqfjRxr3j0DbR705v70GpJ76dELf9vx3waYJBOC0Y+lcCphC
         TspCInNgabfcYsVIlIcH0liZhbxQ4dAv2DPa+hSar3G91sJD0E/TDX0EGD/Su2Q9HHf0
         RXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986287; x=1789591087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7afDL+31SJFMeOGNst+LXN4XK7ERQT0EAu5rJfALKU=;
        b=Uw3XRBHs5BgPIjhIucuGTJQhdkSTvPoKvGxyAD9SS9xvJKuZDsq7Csgm7qbIBK7eob
         3kTiAhGjKHqOfv4pkb4hRbTTEdb+DHx4guXE0XHjGvjhRVNrko3+FyxboAhZTAJvhyyU
         WaKt/vNqImWV67vxZwZlQvDIAvA0uQmnxwDdSdSp4+B3oUMJXRrf4qFvyY+sl/fPwGwI
         in7ucoshILLWk9CskziFjimhuI/OQmU3XqxS7WM/SywO9K5euhRV4o5a/liAvnB5px64
         WRUlzbMbwOvLvKc0W44x0qrJL+2uQ2ekUMw3IqersjlnGxKF+8uubuWGGvGqnhBf9Z8J
         gEWg==
X-Forwarded-Encrypted: i=1; AKwUvByudrw591UFaCCD98MGEFrPxakMppj7+htVAmgJkUo/6b71d10WJhxDva1qNhaAa0aNNPtxD2pIHnU3@vger.kernel.org
X-Gm-Message-State: AFuF++mTXRAaQx8wlruUoEpPKSyu7soAjALQbfk1LiuyY8wTNdEZlqTW
	siC4HN5CqS57W8G/farIwCPV7eH/3qPtimx/wqTYhak2gG1aL2cT7biK
X-Gm-Gg: AYBFou2Pg9EKO5hUeeBftTGKby8nxLuUIQN36jkHSIMvEs6R6/4EeSJeMKA7H52SOKM
	JVtVsQ7kjnc1BA42DEvaYfybcGB/lvIVRS+YppHz75L7YzfSji0tx7sFQlHfhRf3tPdVneyY7U0
	B50w/bmN/WguYYNWgW0CaTraCZJJ1VL7R/a9xeREZMl7LxylZ4dGgxpZv1vvlbWuTM9GY3lb6f6
	KIk0b6CUxMFMwi6YLDUlJuSWrMHorZ0IQmtTcFrdmEQHe8WODbHxCa4I8F0JnhOqw9oUuLdBpFW
	IBjJ+LUigP/5L6bPvxtilzoHDQSSZSGZE5/uQhTcqICVjsTtP1f27XQwPM+97ZUhxlWpY/CvVrE
	oggd5jraLpD23qz8CtNCPa2xZINoj3yGczYP0+JfE7tUVjpj5ijb1aPZWDHwzkTwDc3hrfk3MIQ
	7yBbCqp01qtU7cYZp1x5M+Zpcp0Y8iPQS6oq9bGWFQwtH852Ze21vRdQ3v56EnnRiJNPve4oUYr
	SBvly1hS0O8DSfdst7m8ByUGesNjr9WXLtLgSbB6qA=
X-Received: by 2002:a05:600c:3b02:b0:49c:fa21:1c7d with SMTP id 5b1f17b1804b1-49cfa211d76mr359028785e9.18.1788986286889;
        Wed, 09 Sep 2026 13:38:06 -0700 (PDT)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20daed90sm6913595e9.2.2026.09.09.13.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 13:38:06 -0700 (PDT)
Message-ID: <af6cf493-c84e-41a1-a4d0-0460101f33a6@gmail.com>
Date: Wed, 9 Sep 2026 22:38:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Raspberry Pi 5 RTC binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260909141300.1368790-1-sander.speetjens@gmail.com>
 <20260909141300.1368790-2-sander.speetjens@gmail.com>
 <4c237cd8-024f-405e-a00e-e22ff9529d08@kernel.org>
 <8cd19ae8-372b-444b-bd2a-dc01221b5896@kernel.org>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <8cd19ae8-372b-444b-bd2a-dc01221b5896@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > And more important, where is any interface to actually control the RTC?
 > I see nothing, so your firmware is? Then this is not a separate device
 > and you just added DTS for your driver, which is a no go (see writing
 > bindings).

The RTC is a physical, battery-backed RTC, but the Raspberry Pi
firmware exposes its register interface exclusively through the
firmware mailbox.

I initially used a firmware phandle so that the RTC driver could obtain
the existing rpi_firmware instance.

Based on your comment, I think it would be more appropriate to model
the RTC as a child device of rpi-firmware. The driver could then obtain
the firmware interface from its parent, rather than adding a phandle
solely for driver plumbing.

This would also mean moving the binding to
arm/bcm/raspberrypi,bcm2835-firmware.yaml.

Best regards,
Sander

On 9/9/26 17:54, Krzysztof Kozlowski wrote:
> On 09/09/2026 17:47, Krzysztof Kozlowski wrote:
>> On 09/09/2026 16:12, Sander Speetjens wrote:
>>> +
>>> +  firmware:
>> There is no such generic property. You need vendor prefix. Wasn't this
>> already discussed for Rpi? I feel like every time contributors send
>> downstream DTS ignoring what was discussed upstream.
>>
>>
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      Phandle to the Raspberry Pi firmware device.
>> You said nothing more than property name and type. Explain what for.
>>
> And more important, where is any interface to actually control the RTC?
> I see nothing, so your firmware is? Then this is not a separate device
> and you just added DTS for your driver, which is a no go (see writing
> bindings).
>
> Best regards,
> Krzysztof
