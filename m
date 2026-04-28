Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBAD2D7DF8
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407992; cv=none; b=dZHoMoe9GCrgkalWG/5vsmyCUPWJCjMxpqyvxqkfPP1/5AJ9c2Hs3XdJWoyeZyWPERY2RNhV0IwxLkkxBBsmpQIu9pH1/YfH7gaZrxk3sq0eDT8X1+KeXJ+djAT9bURghdawe295X9OKtGJcHC7nPIJdyozW7fDTPmbFJhvCYzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407992; c=relaxed/simple;
	bh=bikCYCChr7YkCUSK+pLWX18yTfLp9aN20MtL2K2GstY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XbbChX5yjBr90aPePqg0d+mV61t4qndEEfK1pNQaUR3iNAd561s9wZK99cJzEAzzaeelNOYI3+F0PwPVdHPZTRIBpvSQkQQ7I8kv0AvINh52DenoVLYptO4cvKRwzKppNgvBTh5dPpCrpjynkYkwpWKjYrn9fEX4i4xzdCRWW0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZ7Uy8nI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZ7Uy8nI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso90537295e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777407989; x=1778012789; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2z5CJStQaZH5C1yDNgwonipIcrAGaww4SYiAIYI8F8=;
        b=UZ7Uy8nI2+NOm8dpnjNNSb11MMuUBVTWQorG96Z9b22UBZwbnwkPAlHmmG85il8AD9
         Sw/7FzGb5F4wzlj8+Y3OyDOM4ppwwpIirs7Kj3J+v8VNDqbrfgsGVQF1EvygTCYRou3L
         /Mk49+Yniu2XxoFd6+lkgHP2oXe0dukmmxcS6r03r6O20G0jXHVP0+omwb7zryAdhZej
         J1FNxtA4O8j7148p3VYhlRRKwwiJuk9NLnFv4JZ5f0nS9wYYNlDucsZZA4HmU9veB9Bq
         WmYG3AlKNL5FdweLUdqaLopCeDszF0c/l50xoXhP0Ci557j7xiRsUfwhi2wOcotYdI6y
         yCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777407989; x=1778012789;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2z5CJStQaZH5C1yDNgwonipIcrAGaww4SYiAIYI8F8=;
        b=AoCr+V3A2HcOriY0GvO7n695SCZV/TsqgXYJDwjT4ikeYh46LiVU8yiv5ToiBdVPgE
         Iidn7HZSs2Mf6CSNhR7KB37c+VvUeIoK4fU7Am+M7331c1/3T4kKShgaGgGaaHaah3z/
         uTqD7tAvL5gDpIje0Rku/bNugoVpEHC2KfDgf65p0wZ5ZQMf4C0PQkosewad9WJkSS/r
         xiVjVpZXGVmB2Df+dQ0l7QFLCttAJRNJYb4LSdoiTzad1i06CiE0m58D1ol23zL90zDF
         Ije3iQ/Bd1uv7udzrfRbvwNjp0jZnybTyT7SJAJC3DWXCHFu9BDPDoZ4Uiy7zM9HZAPb
         MnRA==
X-Forwarded-Encrypted: i=1; AFNElJ9CrFclI2KRphQ/vBzNR0yHulJzBtLyPg/Y+0NIBmZoL3e8tcb8WHHbA6dppFBdskCP4LyeakBkhjfO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywty/uttvXMdqfBQMeMHC5p3LFqrf25wWYaEapFQvqXE33SnDqs
	gNpjH7cTHDE9MtKlY6AVWoWkFa/vjtwufpeQ43R5uKq6+a6jT9+AAub7aIA5bdbOPuU=
X-Gm-Gg: AeBDiet8GklReyDRZ1/NCZUgXQ6YonUKe4OFhnQq+cr9DLqooS9jZfvI9z2w30HEpq9
	Ykkj4UV0FCBFbfGDxHCYHCM5rQoU0D/csFtIYfubSSo1+W1uf/nj52Cz5at71CpY5ppfpWOl7XO
	xhcBuO6RduD1/jrziQMa7QSGOfL+HxbXw5nRXrexLKPN81lqOnr0B6wEoqT/1cwWh+xn2BuMBTh
	ARNBByK83pXmKsAdGZrj/lWiudkDeDZI8eI3guQAN+/pmMLEk8K2B3NNFxgfNIlXffhJ6EPC4Pg
	+RnjKfqjSfNOeIV97+p2+e4L5nj4ZM1JYckxc74WlYEP0syCyIhOPBlAbjv63lXFWMtcRyqR6tK
	0VXnfB1HWC23If7MHS1ZVdhDGOOhZ6+aWi/YmNawL5clKGb95lfa6Ps439u6iAo14mhYWJwC+So
	A433tTQuXK7nsH0Mm/Z5D4ObfxD0cVT8YyWhF+2+1dhgTEFCC5DsvUeoN6BsOpwIiEg0hwIa81G
	3Cn6n4VkydMPapW0szM8/Sv
X-Received: by 2002:a05:600c:4f0c:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48a77ae5386mr75966715e9.5.1777407989369;
        Tue, 28 Apr 2026 13:26:29 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc11fcbsm10511235e9.3.2026.04.28.13.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 21:26:27 +0100
Message-Id: <DI52JP9JH6AH.3I5OKWOZ56MIU@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850
 mailbox
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
 <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
 <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
In-Reply-To: <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>

On Wed Apr 8, 2026 at 2:08 PM BST, Alexey Klimov wrote:

[...]

> On Thu Apr 2, 2026 at 9:42 AM BST, Tudor Ambarus wrote:
>>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *c=
han, void *data)
>>>  		return -EINVAL;
>>>  	}
>>> =20
>>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
>>> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
>>
>> Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask inste=
ad of
>> a shift.
>>
>> I would rename irq_doorbell_offset to intgr. It aligns with the register=
 name
>> from the datasheet. You won't need to prepend _offset to the name, we al=
ready
>> see it's an offset when doing the writel().
>
> Sure. Thanks. Let's use FIELD_PREP.

+       /* Ring the doorbell */
+       writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
+              exynos_mbox->regs + exynos_mbox->data->intgr);

FIELD_PREP() wants a mask as a compile-time constant. Unless you want me to
add switch/case for different SoCs or I misunderstood something I don't see
how this is gonna fly.

Best regards,
Alexey

