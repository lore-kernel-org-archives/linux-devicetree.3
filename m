Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B93911BC
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113027; cv=none; b=IKLixtQjIbw6c9KNINRRnRFp1LJ0pOnzNPFjyf+2Uak+qn6MfUsOkyF7zghP/QFzmoWXXZv9Z7KceT7mpZuP8pH0eekiX9xkIJqTCv5QZOG5uvJBFryYvit3b5V4F6+rmxrU/I5d5Bg8qWln7c/PYk7twCQfWQ5rcRTIveDFFzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113027; c=relaxed/simple;
	bh=9chXbWvneviCBI6gsPcp6rBnUHso6qIi2DiOcMGp3AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuEiMBpIlU4LKqEgvm90uNZomJhblYscTPNoHxYdl2UQKJUA41EwVbaRvOWY2XuAfnZLrH+BgwWYc2SF9IBIGCNPOdjRNBEfBgzyRXsizSGGU/2gqFqDDC+Jp2Upq4WbpF1yJzfsmh05FfczNpYORKnleKY5aGAkHm9zsXZ2KUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=JVavm7f6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="JVavm7f6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a097f5ab95so5443395a12.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786113023; x=1786717823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmlvdA3j1ijNUJj1yqvwrA06bbHfnJpUaXqtqC2M7xE=;
        b=JVavm7f6sIIjrsJWPx0XFYh1H9ETdYiYFmTgIubT02q70kVTKIM99thpu+bu5hrtGu
         yAsfwnZuCzvQciRe73WLkwHiX+iN2A7QuWS1uJhFTMqFsB0//B9BuY8/PKv/xQe9IRi0
         2oZXDtQuE2lJ3y+TPKUdSlE+V4soG1B+dUHm0XQWMo594nSw/0O2jIftrWApnYUSdHfx
         4bBxA8rMZDcE0wzq5WVMegMCCDnG6Vb+WOTkOm6m8Gpp2po8MC4L3Ozb6+yrNZ4SQeVx
         YTfDPCS4VNCKeVwlMEct5p8uJnT94cvh/gNNF3NKK2Xyu9McOiQzzzRDgDLI6LZxPdhG
         FNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113023; x=1786717823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmlvdA3j1ijNUJj1yqvwrA06bbHfnJpUaXqtqC2M7xE=;
        b=Iv5BJWMVU/6//W838KQhemTnwxB8fJxPmavuoeanuEsdpcFsHlYUVAtJ8Qw57bXkBy
         LH0SgqIr4DlbsYgJ/E2DBD/CAS5LaTxJqzZr9OE87+0bfixvE2ke2Juo1OIw09nD9C9W
         /MHGuaSk3vAMMaCbpFzhZkMgy8+y7BiiEXfQxWA8Oq3VbAo5EhznTCis9kL7m58YZVkM
         XsLQyUNG6YTPgkYDFDzhvJ+/1+vK5N3O0E9aTuYTNFP4ONF3ESGQ314JPBj+BrcUvpRV
         vOWFsooTElYZFtzaVW51P4EbBX/7cE/mVS0VhL7jyDIGoe1Hxyo7eYqbdmM9o1CgZDGL
         lZiw==
X-Forwarded-Encrypted: i=1; AHgh+RpC+TnEEK1PLwCw9cta7nosU4qb8VgicQB0tWePyu77KGVzJr9/pLoMF9XAEGEQTGur9WvjYS7gBjcB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9XPG1V24C1bsXbk7pti9zDFvTqcjyp3YGOm5RG4xkbNuTSnfJ
	YkXWNRs+F4oC6ZMQNRHxObTepOCanoDCT8XaMvqmyHLdedhiTdynJ4F5ymhrZIm13Pg=
X-Gm-Gg: AR+sD1073rOvGOsH2Fo3kTxt/1s1sHAOKNC8elv46dhdQuvIhUef+6ySTh5gGprjY0B
	2ZByaBw/Ulsa4CcqNbiw7vo3zsG+FOoqO2v87q8Xz8AHpS5uXC04OlnmoLwwFqFdo9EW482oksp
	qiZ6qkoXPAxm0nZqLhW7scqXDUz9jF9bgK+AV/3CuxqMYvg3h1wKsiRcqlLoAwy5rlkoqC/XG9P
	tow6FE/U1th+GCAkVE3n/ie1k6dq8TVcw1sAmv1aV6MOpXNnDFK1hVIwQureeMBZw9zjES9BbVw
	gWCr/ImRmqAlS8fCcYrHjcYpWtrLoXImp8yWURkjlfPiGBeSeGbhopc6H+qFG7+pUJFhiT4q5Z+
	D8/kEZFHn144jtjgDXFgKd5TS1Yw2v6ep6kDzLHxAfTyaC/Pi5lXrix8v8m+Gg7UTzVJ0fS//x7
	vu9tiwtLkGGbkGuzq9HNe7g0y8bUAWr2XdPyJUCts90q1VUiT4uZy/mHYvDz8ETT/vTGCCrVRfb
	P96wssdAEsfFxWoI0RhgfiFnVzP0gx0Ts2jc7sardaaWldmsxyGRVJQ7qdzEQ==
X-Received: by 2002:a05:6402:28cb:b0:6a1:8fff:1590 with SMTP id 4fb4d7f45d1cf-6a1e62d7f80mr2357759a12.19.1786113023537;
        Fri, 07 Aug 2026 07:30:23 -0700 (PDT)
Received: from [172.16.240.238] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1e7cab26fsm604018a12.7.2026.08.07.07.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:30:22 -0700 (PDT)
Message-ID: <3554d8d1-65f7-4556-8b99-1c03e0cdca53@fairphone.com>
Date: Fri, 7 Aug 2026 16:30:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] media: i2c: dw9719: Add DW9800W support
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Danila Tikhonov <danila@mainlining.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Daniel Scally <dan.scally@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
 <anGlY_kwp_I-fRnz@kekkonen.localdomain>
 <f7cae569-0c51-41fe-92ab-f29311a22761@mainlining.org>
 <anMeoKP6rUlgtKyR@kekkonen.localdomain>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <anMeoKP6rUlgtKyR@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Sakari, Danilla,

On 05/08/2026 13:29, Sakari Ailus wrote:
> Hi Danila, Griffin,
>
> On Tue, Aug 04, 2026 at 09:27:01PM +0300, Danila Tikhonov wrote:
>> Hi Sakari,
>>
>> Thank you for your comment.
>>
>> On 04/08/2026 11:40, Sakari Ailus wrote:
>>> Hi Danila,
>>>
>>> Thank you for the patch.
>>>
>>> On Sat, Aug 01, 2026 at 09:04:15PM +0300, Danila Tikhonov wrote:
>>>> The DW9800W uses the same chip ID and register layout as the DW9800K,
>>>> but requires different default VCM frequency value.
>>> Is this a real difference between the two models or what fits for the
>>> attached lens? Too bad the datasheet isn't publicly available. :-(
>>>
>>> At least the differing default and constraints for dongwoon,vcm-prescale
>>> needs to be documented in bindings.
>> I share your skepticism and have essentially the same concerns. Since I
>> do not have the DW9800K datasheet, I cannot say with certainty how it
>> differs from the DW9800W.
> Indeed. The limits should have been added for dw9800k, too, but I guess I
> missed this in review. :-\
>
>> In particular, the parameter referred to as the VCM frequency in the
>> driver is used to derive the SACT value. For the DW9800W, SACT[5:0]
>> defines the actuator resonance period in SAC mode and the one-step
>> period in LSC mode. The datasheet gives the corresponding formulas as:
>> - tVIB = 6.3 ms + SACT * 0.1 ms
>> - LSC 1-step period = 252 µs + SACT * 4 µs
>>
>> Therefore, the default value may differ between the DW9800K and DW9800W
>> if the formulas or timing characteristics used to calculate SACT are
>> different.
> Griffin, would you be able to comment this?

After checking on my side, DW9800W and K are almost identical in both 
structure
and register values, including how tVIB and tLSC are calculated, DW9800K 
has an extra
register that can change the output current to 130mA but we don't ever 
use that.

We didn't have a datasheet when working on the DW9800k so we had to go 
off of
the downstream driver during runtime to get our register values. The 
datasheet is a
much more reliable source to be using for this instead.

My colleague has already identified ways to fix the bindings, which we will
tackle ourselves.

> Another matter: the comment on dw9800k says there's no device ID. So is
> there a device ID that wasn't just checked earlier or is there really no
> device ID?

Indeed, it turns out the DW9800K DOES have an info register, which should be
0xEB, that's on us for not updating it after we received more documentation.

Thanks for drawing our attention to this! Nice patch.

Griffin

