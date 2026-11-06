Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952240;
	b=gt2V/AazqF1xpXjjj9t3jMpF7aEIHBMl2/YF5LEcdbw1QZjeFI4PF+wETxkdLHQ4+v4v
	 HDDQ2a2+C7EOyeLJctLcVtdFplw2vNmnywiRQZ8M0N9z62YkHKYwzpa/5jbW0d4v707Ql
	 GYMCc+Y0NpHSYtVre4ZUAZTepUPkzqnPLx3a9kgITzScVs8IKnmcS+/qnCqiFJAu9/XYj
	 UJO7yrnOUs1SKQwVAYJLiHmPTxK8dphXv4fXVYxNPRL2Woq2ja+jR5GV0Z4I92C/Hs1Jh
	 omn8qzJEJPUj33J4+u+nD96FEr7e57chCMPsFwZFQbcbqNJir6ps1fVuwLeGQLF/37g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k3uHALvzjtptIMCjCni4Os1DaEQGVzPkp8ccI+3SeBQ=;
	b=SZbizR9DfxtSRpZkAXirEW5KlaZLduxYJujD7O3RJnXAQErWxe1NvZR+RMdKGtvx3Pl7
	 djnDAmV6mGPuWQniDuW6WeLQxOphGzJVasQe1QQdecvNBBqxDIjORdQ7YO0EkInTpH0VL
	 xUclEUJN4C2c8ExZgrYiPGc5tNVyjFwofk8xvaFTrjKhXUUTWxg4jixybHI7+aAca2ysR
	 reyqHUrPanVPafYM4QBMqppPRqXoP/ZY4WRYXpdmzT2cwMk/h4kuGUI2+YSZDuvoYqYjN
	 vXV1lgvSL7Y7GQ0TRDDkhfOQNqDSC8uZZwrACTM6ZNwnIg5KCuRTSs5rmOoUUL0vjhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=k2vjgbNv;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D459606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D459606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=k2vjgbNv
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49318428d98so87289f8f.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1793952238; x=1794557038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3uHALvzjtptIMCjCni4Os1DaEQGVzPkp8ccI+3SeBQ=;
        b=k2vjgbNvN06sZzQr7ly4gExj48be0hhFCTg3HdoFnt22kAKYQVYTrUkmQsvYn9Igty
         6zO08AkzRzRm+RaLIdOlx1oWUIt1Oa9vm5bNEDijfCN7oxuL9WmLbQ3zW0KPfuRSPBiW
         8+7y3aBsvtdMOiWSpd5cLYpjZhmD3IJwoUqPeiQMT0+mkz+CDfR0zn/gph0K4DxFWN2c
         joH+fvYKWIeyqoWyb7ZC+vLwJKNXFaffBrLL9cEkw9W7GtsP2VLrYKwCCv9EzAbyuLf9
         fbNpEVG/tcWzEdqUCtUE32u6+FzwbgSjRRMxBLQ+aCGWu64H+wXSV47h1wM6MrRENrtn
         a7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952238; x=1794557038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3uHALvzjtptIMCjCni4Os1DaEQGVzPkp8ccI+3SeBQ=;
        b=S2fAqPbTnCxMixHqLY/wJpo6FwOHFKZpa2md0ZIyUGLFyKbfRpJU+Fi7W3wLP+xtb/
         X5Vu/KoaDKOgDzwgJyUYrtKBI74hsZbnhkhsIeW1HWSEezuy0jC8wMB3DX/JDA6n9324
         AscHH85woNh/tMJxaE7AKvDT2/ohKsPaytWCVzCNQ0yM4MRRsWmaddnqBHiCkxI1lr9o
         ze6pfyTG01oItIq1YaBRWN8LdrwMC+FRc+FoZDHY4x/1rXLVmGx8YtxTvA6yProQaiYk
         /s41vJCRRp/gPBagpRnRJiPx2KXES6hOM7ychLKpTkTNXIxO4Njteb8Z5j9mUHsbxyNb
         DHOg==
X-Forwarded-Encrypted: i=1; AKwUvBzKe9/XoIhyQ2+VbmmV/Sp7lYISK12o4G/Bkb3g9kgg4u460Pitl4V6BZQRvCL0cJ/qPYd3aixXBGU4@vger.kernel.org
X-Gm-Message-State: APuU4Z9ngc+U8o/pDbhyjzQJ1YKqLf9oGJEYfqKpFz7Bp3GomYpsRkIE
	K7YXbjFkwpxJVlYCVhl3fVShnsoLyi52Jtzn1Y7OoNuyKiTTF4VGXdw1TOg05xLuSYc=
X-Gm-Gg: AYBFou0LWCHauCs6PyVSFAvSWJ8Db6RIr601aEP72zOVBOTyB0XQWMVDAnrB9vytliq
	lKw5tPTOyc/YgD+LFdeAnozzzSgbsA0ZjnNfJm8QNTLI2mK8dP3PdxUXRuNjru2WRNug30Ux/qX
	GzzyKgnH7Xfp5w+5Zp/++yI0l5IlatM6Gjo1SJdnSoUfRJ0PQj3CFqF2uALHRyBubd6Zxtifm6O
	RiXI9Vx1x00vT0Zx3TLZqem0jIL7GGuXutrQp3eM0Y/f1hBp+1e22bpzXOTVdfcg/veAvNdL2PM
	JZbUf7biDMvKDEqyfDY8j6+c4dE3KSbgR9pCLgW4FJI+bVkNwZMEKmduIn+ptQ07G9S0eiIr8v0
	yy5wTTE4JLaiROD3oIYNSlHCS5FIdvgKyyMGdORmkBrt4NNRVwKoStEno8zDeR7Nmxq/jZOBBmO
	haBBjT78KJXKnz6tuRu7SYfmcm/Wb4J1D6yzX0j7E65gbJ55RMuUik9W6gYJY5ctrNUhdW1PUNg
	gIPXQW9air5xQErBDFh1jisGVRBjEVZXg5eeyW2yMSNp/FgJ4QCn6uPEwoeXWjvmzghGE7fth94
	+Zj+BtCPd9SGCPzwOh7n4bs9OkrQMpBAItk=
X-Received: by 2002:a05:600c:8b28:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4b6dfba8628mr21279205e9.30.1793952237431;
        Fri, 06 Nov 2026 00:03:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm34920515e9.2.2026.11.06.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:03:56 -0800 (PST)
Message-ID: <096754b1-6362-4f44-992a-989a1ccdec22@tuxon.dev>
Date: Fri, 6 Nov 2026 10:03:55 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] can: rcar_canfd: Allow the CAN FD clock to be
 sourced from fck
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev>
 <20260902141544.565763-4-claudiu.beznea+renesas@tuxon.dev>
 <20261016-durable-meticulous-owl-7a9eed-mkl@pengutronix.de>
 <69826962-0c21-4616-9cd8-6eb0478a422b@tuxon.dev>
 <20261017-weightless-poetic-mayfly-bbdf75-mkl@pengutronix.de>
 <4a9e32a8-8a2e-4b70-8057-2d51e6d38b98@tuxon.dev>
 <69f0c77d-8c23-4949-bbb3-0a07da506b7a@tuxon.dev>
 <20261019-precise-auburn-bison-8b0d0a-mkl@pengutronix.de>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261019-precise-auburn-bison-8b0d0a-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Marc,

On 10/19/26 13:42, Marc Kleine-Budde wrote:
> On 19.10.2026 13:36:49, claudiu beznea wrote:
>>> Based on the comment on this code "If not available fallback to CANFD clock"
>>> I think the intention with IS_ERR() is to allow probing go forward,
>>> falling back to CANFD clock, in case of any error of devm_clk_get().
>>>
>>> The device trees that I've checked sets the can_clk to a fixed clock
>>> with rate = 0 or have the clock provided directly by the SoC clock
>>> provider. I think the intention with IS_ERR() was not only for -ENOENT
>>> but for any other kind of errors. We can return in case of
>>> -EPROBE_DEFER, to ensure the expected clock is used, when it's available
>>> and sane.
>>>
>>> I'll switch to something like:
>>>
>>>    gpriv->can_clk = devm_clk_get(&pdev->dev, "can_clk");
>>> +if (ERR_PTR(gpriv->can_clk) == -EPROBE_DEFER)
>>> +    return dev_err_ptr(dev, ...);
>>
>> On the other hand, returning -EPROBE_DEFER here means the driver may never
>> probe if the can_clk provider fails to probe, even though the fallback clock
>> is available. That would go against what I understand to be the intent of
>> the IS_ERR() check: letting the probe continue when can_clk can't be
>> obtained.
>>
>> Please let me know how you would like me to proceed.
> 
> If the clock continuously fails with the error -EPROBE_DEFER, your
> .config/DT/system is broken. I don't think it's a good idea to ignore
> these errors.
I've addressed the concerns raised in this discussion at [1]. Could you please 
let me know if there is anything else to address for this series and [1] to go 
forward?

Thank you,
Claudiu

[1] https://lore.kernel.org/all/20261019121356.2421761-1-claudiu.beznea@kernel.org
