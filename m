Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD185FDA7
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789759998; cv=none; b=S1CTAbyjram5uMU43KbZ4URYxCoCHjX+t0Ss7DyFb2UMk2oZUMu7M1qTcirWGxTmT/oBP0yg88Z0lraj3SLlAfDXoFIeUXac9lJm0k4/3UszG7e6xIjSZ77Gj2JWvgD4WqngPFuCApUxZUd7r2RIZdKGfyfqpNjx22wdluLPLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789759998; c=relaxed/simple;
	bh=I4ZLHNc3Kb6nHjggVLCsPXuCipOM3fLsDlbTkgctH74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTuLUQL+vUH9P844+SntJiinCnGLTl9YwcfYTNF8Zu5owXkp94DBEJIGndnEje38IyK9Lhfn0nEIwvmTPvPeP6ic1O+Vh1VFZnuAKHM0vZonGLVToonm4ZzOTuz27XnEKcgDsTE758gT6AiXSQLoCae2fl06kf4CsZrRoCu53L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUWOxqYZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUWOxqYZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so7077065e9.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789759991; x=1790364791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSqwyN7Lx41J/1XR2bBQKHR+k8k6/S/N9gfyTr24T5o=;
        b=rUWOxqYZi6zM76uApjyrqapuQWHEyB1ROiV1zPbCO+8gEMPIYOape06QcmWP9X56F3
         uX9Xly+41EVnOUOUGpdmATNUPK+q6WqPzP887bAIgIRu++YSuuFjMTRzlNkIu/l7BlJC
         f/Lascl0qC7uW1MVRq0a/ABm1Np4lNVrOuc19gJQq9GuKRsAtsFubHrvJEiPpTNo4jQ8
         06wXluB+bORhdMRBHedArs02OKa2lfSoH1mh2L5fBs5K3SkLwcd3b+eoPAPgml8eL600
         m32CaCllX7zwy1mFFWrNI3iOAWswtziaIstvRhvfJhEdtqtJNuzaFdt+Noglsxh+6N9w
         YNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789759991; x=1790364791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSqwyN7Lx41J/1XR2bBQKHR+k8k6/S/N9gfyTr24T5o=;
        b=qlYFq7fqDiDDzCu4V3TBfMVMWzu2W92VxSzxHRWG1WtXR9RG0MRm7P+hVzOSQtRBRN
         oux7fJUVXLp0OETYxqzGFeunCdjrV0iIpLISgrGK30TmKXprTH2fQNwbVOV2lX1CDdPx
         AaPIcovoSyKYpYnE8jXSl8eFWA/9zQML7UKVwyiHNl32sxDQapAR9G1Ns3S9fisvhRNN
         Jr8ANS1D9sTbSrZZuLUuOj2TYZpTJgRkeQO3P1u/BvVoaqEfes7QnYvP4yv4FoSU69Hf
         V01bNSpCihIEIp/NR1XFZTdy+YAmKwCxP6rpTxRkFTVMW76sz8gEq3bAoVzGS+SigPpW
         xyGg==
X-Forwarded-Encrypted: i=1; AKwUvBwwp0G7DDXCkbpYqlAgbB1JohBKqlxHILDns5PvfsQivZFKKufITYR+4YJsR+5Bi+v19z96m9PK4GGf@vger.kernel.org
X-Gm-Message-State: AFuF++nwuGxndfihI6rGlH1RpcHzlvz3sZUrLq7LrRJKEAY0w+Z2EjaO
	acGnC6LHptEgPN3LhNJYYSnrWPf9ljPQwxhrZA2eJIzv6XRqb+0xOEh0
X-Gm-Gg: AYBFou1Inolj2b7YUK0BrdAujawmWGvMY4JtRCLUuIVnMnoVI0Cj5SDmhBjKqGqOlCm
	P3T3vo6o6+SufY7xm3SJrw8dV33HbWLuCmlIHcOL7vJAw+8AqIVBu1FyL9krwgp3NY3MVGbT0RR
	KNP7Roibfs86isahgNKeogJGkIc+DdC+RccKO3h9V0csqQQ1vKscISjkqrQFawfD1AaG89JkUEg
	neJnzOTmOGxrCf3dXEqtPutMZbg3gIHhsp4rQKdg+NP/Ab+lV9foCN0Nj9UnODsnbuVHU7fBQHp
	W7k1EMrEMaKVMjSyX4LDNwUmJcgzs20/miLssQ85+vx4Hm+Y/w8YXW5I66olDQYg/pU0czr6/5o
	kEqVDVGBuTImfCT/LZc/Fs4lfgHxzSX/3xRRGlwgJSjYD6HceHz5X8naZX13NtZdbHYLLKUDiBV
	cW4+9Hhl8aRegbCJ8CO8h+fGsqz5Lri8VEbhrHijyN9IebAIGL3VEVdlGxIfkqNMh1moNx+XrB7
	UQoVPSTjGvcQlzlsF7JLxUO1bC6egAjRRNUZmvfO4w=
X-Received: by 2002:a05:600c:1986:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49fc56cb2f7mr87032645e9.8.1789759990865;
        Fri, 18 Sep 2026 12:33:10 -0700 (PDT)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd2f7ef3sm10168685e9.0.2026.09.18.12.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 12:33:10 -0700 (PDT)
Message-ID: <74d59f1e-479a-495e-8413-51e1feca78f5@gmail.com>
Date: Fri, 18 Sep 2026 21:33:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5
 RTC
To: Stefan Wahren <wahrenst@gmx.net>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260917135841.841680-1-sander.speetjens@gmail.com>
 <20260917135841.841680-2-sander.speetjens@gmail.com>
 <20260918-steadfast-unselfish-loris-996d7d@quoll>
 <f5c04c5a-20c3-4f4c-bd1f-045516d24140@gmx.net>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <f5c04c5a-20c3-4f4c-bd1f-045516d24140@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> On 9/18/26 15:27, Stefan Wahren wrote:
>> Am 18.09.26 um 13:44 schrieb Krzysztof Kozlowski:
>>> On Thu, Sep 17, 2026 at 03:58:40PM +0200, Sander Speetjens wrote:
>>>> Add trickle-voltage-millivolt property for the Raspberry Pi 5 RTC.
>>> Why? Describe the hardware, the need, not the diff.
>> Is this something we can avoid by making this configurable via 
>> userspace / hw_clock --param-set=parameter=value ? 
I think it would be handy to have both.
A cm5 board designer could choose to have a super-cap or lithium ion cell
and for that a device-tree property would be handy for it is always the 
same.
But for a user attachable battery on the pi 5b via headers or soldering
the userspace version would be easier.
