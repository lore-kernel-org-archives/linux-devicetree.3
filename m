Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62363C5526
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836199; cv=none; b=eaNiRA/I1TwaIiUwPhfN/xicAlmwkMSM9IeWgfOI13tVha10+LK0JrMjXPZJEZ8ZTYq1BtEh4IkVbYDH6twXlZeW/hw4s0VKxuZI8YUE853/7TM3T3RFScPLV/pOhf57tD3CiTPdnEmJIQMGq+efcUU3xtS6zohfAZ04khTauIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836199; c=relaxed/simple;
	bh=LXEWknMNIRTQZ35VggO+ovaT+Seu0+zSa9TUJoAEm00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iL611Fhtgg23cUPfacQSA2D4wDirFg73zjYHJGenpotSLsh0L0+8Dd/q50cpvHBEHW6mdWDMTBAFT3LPmcaj898WcUB+ZhI3wRI7KMP8tTfUlzc3Ci968n1tvKACs4r4/hBDoMsNKAZRMa9IvIBm+2VP4rf6s10uQdvrCeaz4bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qiPyXiLE; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qiPyXiLE"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4b77adso10512615c88.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775836197; x=1776440997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=D6zv2l6mrLxLxCJpvpr6z14FuYS5dUuaVMuugMJG/po=;
        b=qiPyXiLEVME3VuSMfWcW28NV742meOh8TimztJvyqXkNdetoecl/DsNPwIj5PAoNX4
         0pC7DuKZ7yVYuR0JJ1UokgAgSOCW5cy4UavTz5KlEMHMIVJNOe7HgJQdJVUhN9c61DtA
         vAGTw/RXveVgzx/yBwpV2dEixpZU2XYARtO2bPZfaIBIZ0v8bmgjjeTZWubt33i+75OD
         FNxSVIlYqSnBLsMcgMnvu+G6MYeKE3+QKqt/Y3yfVIul1TttJ8MB2fUIFXQca8rOF77X
         KFEcMwlZFbjAAaVV97HDLn/W3Q7261IkSgW/suC05q/mhc8/J6RfBfD/brF3o9LHs5YE
         O2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836197; x=1776440997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6zv2l6mrLxLxCJpvpr6z14FuYS5dUuaVMuugMJG/po=;
        b=RbNwaMk9ohgd4sjzEcqi4mo0zM3xJ5VOIPp4Gosrrbsp6iebibHTV5ZOWuhD3Lcqil
         RMnSqDUbsoJz4chOzLOV9MyPvgAU52XRuOiaup++FM73VvTnAiqaQu7Nd0em6fHbO+bC
         XLJ2urohi9ugoO3m9tKzRUK05lCS7l/TqLfhu5kx1vZwVketJJZce8wooc2tZ0celVEi
         y2dgJC14IzPn/4XiWr7lf1AR8V3+kJoFjz8Sg+M7gUfGLmMcvkMoXQxx1pIZZ/72dush
         94gQJqnpewybUVlWFbb6YKxNtRFVAcJ7MvPvfBGqq3X86hvSaq47a314SCNIw/u78N5k
         lR3A==
X-Forwarded-Encrypted: i=1; AJvYcCVJQKxwJyqnQjfBP6nm9npFwmwyHSZQKa7kZVAwovCTOSnOxiOSfd/tR2QaIRQSUAnrjy6KYAKBzIOL@vger.kernel.org
X-Gm-Message-State: AOJu0YwwxGp52RmZvMZgPJiHGw+B2WDPCmt+Pz2UrEP5QTZmjqAR+Y5a
	AB+WODHbvYpSXYjLFvadI/FfdS/vluhlS1yZCPZe4yUDcGCAgm/YF4Pn9VtgzA==
X-Gm-Gg: AeBDieu3Gz24JllBBgH371M01wQXn4gw9jHrDI801UJ7TkrGUKuqc+ASm0MBNqonrcQ
	J5CWdH4v2DlJUdHZGIBcpjeh1f8+l/iWkr/+QFufgZOILv07cCWj5W5mQzyY3e67VDia+Pjvugm
	mEtxqkHgdybS0CCE5qACebCP/DKNiMropOY5SIaaelgOt4Q3t+BYe5FK6WUMIkGM2VZiDhi0Yh3
	c60fD/2+gQVZOi5hCTaUV6EyJhsP6jTCb6RK1gs4GGonCBRbrao2uy0NU/OYaXmrlcZeF4xW/vv
	GFu/1QUhsRvtsA/xZ88YqQxgRZ6fn7OGtp+IeA2ijMiPX7uGD3QUqKVN5Sjpn96xxhi+nE6JWZ0
	r72tFgk8zk3yfSEzRmANsjJZ1g5G5WrBkebOdymKh42U48rcWr+ijNQCuFtB0lgF3OCrrBsSCE2
	4CnKHHg64vEnw1Nrw+9N/IgRgkw3UCpDHPXmXiLy8Mp8RFkMR97SnNn+gFdO/UuHP13O6gtj7Q
X-Received: by 2002:a05:7022:418e:b0:11b:82b8:40ae with SMTP id a92af1059eb24-12c34ededf2mr2067083c88.18.1775836196689;
        Fri, 10 Apr 2026 08:49:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c34acb077sm3516774c88.6.2026.04.10.08.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 08:49:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <066e3058-5ba8-4695-9f45-523c7d43ab76@roeck-us.net>
Date: Fri, 10 Apr 2026 08:49:55 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: watchdog: rockchip: Add RV1103B
 compatible
To: Fabio Estevam <festevam@gmail.com>
Cc: wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heiko@sntech.de,
 Fabio Estevam <festevam@nabladev.com>
References: <20260310002040.417424-1-festevam@gmail.com>
 <85660b25-a936-44f0-95b2-3c90d559efc3@roeck-us.net>
 <CAOMZO5DFWYUPN9sPzBr-W7fy8ZbrXP7u1sx=HrmUAQVCLrsdjQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAOMZO5DFWYUPN9sPzBr-W7fy8ZbrXP7u1sx=HrmUAQVCLrsdjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/8/26 03:28, Fabio Estevam wrote:
> Hi Guenter,
> 
> On Mon, Mar 16, 2026 at 11:14 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 3/9/26 17:20, Fabio Estevam wrote:
>>> From: Fabio Estevam <festevam@nabladev.com>
>>>
>>> The RV1103B watchdog is compatible with the existing DesignWare Watchdog
>>> binding. Add the rockchip,rv1103b-wdt compatible string.
>>>
>>> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Could you please apply this one?

Wim applies watchdog subsystem patches.

Guenter

