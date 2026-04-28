Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216D63A3E7B
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371228; cv=none; b=jMLZnePLd+blzDO4IGMbdqryTnBL4GdtVltKdNTShlS4VPY7/EEu7iB/NMmiUMts/VVzCz8iFTdeHzinmUcOF7N1UGYxu4dYI1dnKwfWJyaaukmalEdgg9IrDapc6XxPdiUuJlR/EhhbMeaOtdn8nEeMKNsowDjSzFVQj0WMeaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371228; c=relaxed/simple;
	bh=oV3rqKJGZ1HkBUoBCPoyp8xk38jGcMLgZZmmQFjwxHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHqDIIG9XzgrfNr81j/uHXIeXgpVlExtGHOeuejijqfKFAI3wdEfDxQWk7dgtec9EqmbRV/jyGFfmC3q6sIQxiYLz8vPD9WiTJF/8YhE9t1cbVNXptNQUU7NXa7GkZrpAaIQ3jGPPwk9PRFXXf39ZVri9oK5nNA3eb5QGhDEudw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQAPnR7l; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQAPnR7l"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-671ae79e617so14382748a12.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777371225; x=1777976025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yKtU8WldknGdF11CtSWFK34v/bIhyBVaz4iMdrQ//bw=;
        b=qQAPnR7l4FTSwZziBOzucVBWLB9PaNOp0TsjirSw7gt6oO+3TB1yZrdHTQ/aBo5+ZG
         OZ33MBNrxkCtZKeA/yLY+U+w9nQQ7Ezo2sf7QVbzoz85T9PKYnKYpiO8YorchXiditXu
         pMi28XndwjNFAzOp9wBh41DVe3ikDHZkvqLqTG4GELnfEZZlbu9ganXgsSY1jAyk8y04
         RgdoOHg5oKMZIQbWwppheDBJZ/tByBZTNBngoxxsbjCzTbyIu9h+6RmIFXvbtMe3bFOp
         QpzsCNHosvMdngnxO6eQftlwySCm4UOHAYE2sR+XAO6lloEEf5OsvVqNhggOkv7ipS7X
         6uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777371225; x=1777976025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKtU8WldknGdF11CtSWFK34v/bIhyBVaz4iMdrQ//bw=;
        b=c+Myo3LDVjQAfKJTZuFUP13lgSmVSZogrnY0EtWWrv+kBbJvcrOVBSq3xctTuJVlzI
         qKEN88+giSK00bkezVGNw1NqHlo0JkXxyZ6BORshxJQ/aDlpoSmQ4EtlUbYvtKAJSj6I
         eG/SjeF3p1fxWDkc29rqEFYwZ3bqU97ig05Mdf69rE5TQ+ZERB0liZ3S3NBYiaLJJ8oY
         RtM9x/VSG+dWH2aiu3HaAcYULbUBas/m0j8OeKkPxWBJIv+J8X5qBpXtFgQZ/G7a3N9t
         8KaFs8FVQM2B5IDwmzQOwo/gHSIcA4Jq3pRSy5DA7fo2diA/1/8UMDi7mj6/nx8f9Swn
         55Ag==
X-Forwarded-Encrypted: i=1; AFNElJ8lOXol8H/irv6tGZON1vtrSoDT2XBnyjOBaPjwggndxEeL0ZWL1B4e4DvwJCFFCDTgpSDGpy4MeQGD@vger.kernel.org
X-Gm-Message-State: AOJu0YwwYqf2+Rqa7DXBFFJA76GmIZRa3vtCLq9g/rGDVvUjlpBIOrn3
	r0n95OCxJ8ZHBxemhehkSkES+NDeQXARddiRzGJq/XeSyn3vXzy4E/w4
X-Gm-Gg: AeBDiesDWU4u0xp+cN4IqTkPq1NhnxDVcId18mYB3KDs7jE63ZN5QlC3wJD8/nxQt8e
	J1XsOTwCOQi4MOFGyMUwPKhJHdDoB44sCLZsYNsZX95s7l3fk0aw9aI9JyabvufYGPQkzkaTByL
	gVX86ghV6BUEgYtnbcJva6Tjdyxx2G3oC0cNBJVUYivnNE5HnEJXVykqlyDYPKUSRncgRI0F0gQ
	qCaMJhqc2olzsTRasziVufgya5ixlw3tjSZoaIQLGW/FtCMXjAql0z0LGsO9meK5CE2i1l3f6l/
	oaZzHgvgLaJ/Jzmch1q+udtVL5v+sVL8tzZgk2LojNF7DXTq5Z22br7Iwjt6yWBfY/O2EBZTcxu
	2luaKhAi1ErZUAJxHguhVDXMxBQ7rC/sco8eP9RY3EMD/qytULu7xeDexe0zkSy1+GXGCIt7T5T
	ElUDHS8ZY5MXlrYE9wuorfOzsLiabKUiV4+tNfcPc+QGRsL2+YGog=
X-Received: by 2002:a17:906:6206:b0:ba5:95b1:f152 with SMTP id a640c23a62f3a-bb7ff559c2cmr134415066b.0.1777371224996;
        Tue, 28 Apr 2026 03:13:44 -0700 (PDT)
Received: from [10.43.64.110] ([185.94.190.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b887edcsm77045166b.47.2026.04.28.03.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 03:13:43 -0700 (PDT)
Message-ID: <30758adf-0ec1-4f20-ae3f-e5ca92bac730@gmail.com>
Date: Tue, 28 Apr 2026 12:13:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Vyacheslav Yurkov
 <V.Yurkov.EXT@bruker.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
 <20260323-sanctuary-semantic-432089feb1c7@spud>
 <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
 <20260326-lustiness-borrower-530898a5ce28@spud>
 <f3e27db5-d84d-4b6a-9d6f-25fcc9044efc@gmail.com>
 <20260421-each-candy-67380b760d26@spud>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260421-each-candy-67380b760d26@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.04.2026 19:28, Conor Dooley wrote:

>> Before I send a v2 I'd like to clarify a few more things:
>> - I provided a schematics by means of the URL. I believe there's no unified
>> way to provide something like that in the documentation, is there? So the
>> only way to describe it properly would be to summarize the description from
>> the mailing list, right?
> 
> I don't believe anything we have at the moment is what you're looking
> for.
> 
>> - I'm going over the Common Clk Framework again, and perhaps I understood it
>> wrong. You mentioned that I have to implement is_enabled, but I implemented
>> is_prepared. It seems that I just have to move my is_prepared implementation
>> to is_enabled. Does that sound correct?
> 
> Effectively yes, I think.
> 
>> - In my particular use case I don't need enable/disable ops, but to keep the
>> driver generic, I'd probably want to have the bulk_enable implementation
>> inside, because I don't know which clocks are assigned in a device tree. The
> 
> Why don't you know this? I'd expect there to be 1:1 mapping of gpios to
> clocks, with an equal number of input and output clocks, since all
> you're doing is detecting if the clocks are ready to go?
> 
>> clk_core_enable function only enables 1 parent clock, not the the list of
>> parent clocks. Or I'm missing something here?
> 

Thanks for your support. Yes, I talked to the HW team and I have this 
information.

One last important bit, which I'm trying to figure out, is how to notify 
the users of the driver about the state change. I understand that Common 
Clock Framework doesn't support clocks drifting to unlocked state, and 
I'm OK with this limitation. Right now what happens on the clock 
consumer side is that it gets -EPROBE_DEFER when any providers are not 
there or not initialized. But if the state of GPIO is not the expected 
one, then -EBUSY is propagated to the probe of the dependent driver. I 
can also change EBUSY to EPROBE_DEFER, but how to trigger the deferred 
probe again is something I don't know. The only alternative I can think 
of is a call to rmmod / insmod from the userspace.

Is there any other way to achieve this?

Slava
