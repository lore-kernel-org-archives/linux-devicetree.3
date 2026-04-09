Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B766438F92D
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 12:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775736299; cv=none; b=nj+zIH4/g0JE96Mb9i+e+lqVVkFg6m3khHNAEnrFSa6nMaUwQRb147oMQ80YL3s1Du2Dg1pZR6x+Pxps2w/N9amkcytMVBx/TEU/Bn6dkDI8HVKMsi1poJAt2UmW23DITNUsKxI1mpl6m2+u/1Q5Wmcqqn7YPUSqsUYgo4cYMjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775736299; c=relaxed/simple;
	bh=y1SKITBc1nOEkuIjqqPXHMikNAW+SnUOZAXWsPdkYbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEQZicIht3jaehZy2C3m1vZaWK5QLyvHjUy1273U5cRauRUq6IX8DU1BvinqTX8AkNPHnjSMnpiSRzHQaa/AxnBtYhtIQsw+lLRNHFN+YFRxym1HDRLavuYiuIedHaUe/TxU7o/2qrlrSQfr8xXvRw2ie/zs6DCOGqR8rLMTtvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N3bVMrOg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N3bVMrOg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so9524855e9.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775736296; x=1776341096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74KMQDyamsOqfkVKpW+KmRC64tMrk0EgM043WfdM7PY=;
        b=N3bVMrOgA2caZm+E9dTcKVj+fJFKwzn4THIXgr2WF+xwj6l1WtxrFpZNvZLKfe++vk
         cearJ24UMqLR6yoBVKVh/flpzj2O+R/zOeVHVgCDRiUctzgNSHMADtw2qdDVxmCAmYPN
         ZbprktfcIFw9Q4guE2GJO93ZQuWJ5+pubkyOfd1Vy96M3zyTEUXS/GGczVNuOSlNpLBd
         PAomU5gKAswZCLXH94PRtJkwpcye50Vdo55nUI00v0MLZSr9d3fFNq1UgTTmX4dLeYfu
         i/DthNUPlADGkcijNG8A1e59+y0ZGMwGu9JB68s7YsVcWrLIxtTu2BDD10hYtpg+E8Om
         qX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775736296; x=1776341096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74KMQDyamsOqfkVKpW+KmRC64tMrk0EgM043WfdM7PY=;
        b=V4vaRQRDZ+WM4YWrfQqRCmPD5jb6vfs0Pjs/lW2H33Fac+KZyKIzfsZEd0BjtfbacL
         dFXYU9qCfjQn3KxWH+WYefDnaeXjq97ECMUAAdm2TaeYIUrU0C1ukXO6OdteJtXTqm6D
         uM+JYqJ1Syn+1PIv4DLEd4Jx/6AMHIWMO1i8JvZZbtfxD5tAUJcA9HgAjXjna4Abb7Nf
         kEEdtDAAfkvihkl8FHxSif/GpQ25kME6RJc9uJJgmiPdN74A6pDzXCxdrTdEzy+QeBt4
         3BGz1+mtyrdcoeKaICW+Gff+cF3c/iZw6JsP53vQRdxmy83Tx5H7v/MZToXFb9f+KXLc
         5R1A==
X-Forwarded-Encrypted: i=1; AJvYcCV9DWpRKq9FroGyYkpUPluaWb2T+ktlZiYU6lroA54pptseBUBi+PMgXCrvC7lK8WzKQPQvbjDAua89@vger.kernel.org
X-Gm-Message-State: AOJu0YygbHU4uKw6FzJq+OtkEmlpG7YrHhsOz0UZveWK4Xsz9X6VPpDn
	WhRPWZpiTGmWrukVxMqd3egwU/CMf0e1SqZxAOL3FD2g86wwq1ldXzMvkUek8oNcJTE=
X-Gm-Gg: AeBDiet2RwSaxb8AF8t5qLUzEkJ+QWnGQU0cHyID25p7zIfcYvNyHqIUz2YBRB7kPOz
	iqRxG9CirB9YOtUicUCHYNm5772tInAqkA4bl4jXtRdz3ZK9lHqrsAzvnu2H+bc+DIZGMYyx2Oz
	gHQeikHtb2o0p1VhT7ct+F7w7SfT1+6LVsEUDz7Td3iPaK9cqrrI0+iS7hhovaTL/HP9EUXpRAR
	/PVPmW6dSdUS0cTFeGEPXM7bDTDpOH8u2F4H30XfPijIRK0UWtrbyiBVxYCsmvYsJdg3iPPbvcf
	a5kqZM0sbgn/ENDd3B7dKcFWABMRdJmh1ECiN1GwXPBwIv1GfoukNa5Iz6zdDROIEQdim1odHWe
	fR0562Xp++gCBco1SWk3pNf51K36aTJuSdHNuDIp2X+ozHLMTeom4Ct3TBoCQYPKvjLGNbGwWec
	zWsWDaOmRWmJC0ZXXEsHpXKyIRxiGCBvo6YRbjlNRPbA==
X-Received: by 2002:a05:600c:3f08:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-488996d2323mr413895265e9.3.1775736295947;
        Thu, 09 Apr 2026 05:04:55 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd2181casm73225225e9.11.2026.04.09.05.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:04:55 -0700 (PDT)
Message-ID: <c796e077-e061-44c4-a8e1-dbd8d3c14caa@linaro.org>
Date: Thu, 9 Apr 2026 15:04:52 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Juan Yescas <jyescas@google.com>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
 <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
 <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/8/26 4:08 PM, Alexey Klimov wrote:
> Hi Tudor,

Hi!

>> I find it strange that the SoCs use different registers. Are you sure you're
>> using the right direction? i.e. ring the doorbell to APM and not to AP?
> 
> Well, I am not sure I correctly understood the questions and comment. So,
> this all was tested with ACPM TMU code with 3 temp sensors and it seems
> to work and sensors react in the right way.
> 
> Downstream clearly does the following (see also [1],[2]) when sending
> ACPM msg:
> 
> static void apm_interrupt_gen(unsigned int id)
> {
> 	/* APM NVIC INTERRUPT GENERATE */
> 	writel((1 << id) << 16, acpm_ipc->intr + INTGR0);
> }
> 

Indeed, it looks alright, thanks for the pointers.

> I am aware that gs101 downstream uses INTGR1 in apm_interrupt_gen().
> 
> When I use INTGR1 for e850 then I observe acpm timeouts. Hence, out of
> curiosity, what's the expected behaviour when/if I ring the doorbell to

If you raise your own interrupt the APM remains unaware and the AP times out.
You also have a spurious interrupt on yourself.

> AP (to itself as far as I understand)? My understanding that it won't
> work at all in such case unless APM firmware does some very fast
> polling.
> 
> 
> [1]: https://gitlab.com/Linaro/96boards/e850-96/kernel/-/blob/android-exynos-4.14-linaro/drivers/soc/samsung/acpm/acpm_ipc.c?ref_type=heads#L423
> [2]: https://github.com/samsungexynos850/android_kernel_samsung_exynos850/blob/0af517be2336bf8e09c59d576c4c314446713101/drivers/soc/samsung/acpm/acpm_ipc.c#L426
> 
>>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
>>> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
>>
>> Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask instead of
>> a shift.
>>
>> I would rename irq_doorbell_offset to intgr. It aligns with the register name
>> from the datasheet. You won't need to prepend _offset to the name, we already
>> see it's an offset when doing the writel().
> 
> Sure. Thanks. Let's use FIELD_PREP.
> 
> "doorbell" naming was chosen for readability and maintainability reasons.
> It seems to be more generic enough name that better reflects the workflow
> of what's going on in ACPM+mailbox machinery. We can rename it to just
> "doorbell" for instance.
> 
> From platform data it will be clear to which register it is set, INTGR0
> or INTGR1, to align it with datasheet (which is closed anyway).
> 
> Regarding intgr vs doorbell name, the intgr is a bit unclear for a
> reader if it means interrupt generation register or something else.

interrupt generation registers sounds sane to me

> But if you prefer, I can go with "intgr".

I think I prefer intgr, yes. If you choose doorbell, you'll have:

writel(FIELD_PREP(data->doorbell_mask), BIT(msg->chan_id),
       exynos_mbox->regs + data->doorbell);

or maybe s/doorbell/doorbell_reg? But that would duplicate
exynos_mbox->regs, we already see that doorbell is a reg offset.
Doorbell is too generic for my taste.

And then how would you refer to the interrupt mask register? You
already have a doorbell_mask in the example above. 

I won't push back too hard, I'll let you choose. If you can find a good
naming scheme for the interrupt generation reg and interrupt mask reg,
then fine.

> 
> One more option is add a comment, smth like /* Ring the doorbell */
> before that writel().

I'm okay with such comment.

Cheers,
ta
