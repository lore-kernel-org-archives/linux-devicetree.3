Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441C25228C
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 01:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777772755; cv=none; b=Z1Ffkp9/rmLYQZAlnb+xQZG7O/bw6YlZ/hYwTWht6/5o4a9cSWDoUh2ApZjIJ5F69pBP406FJsR9x5PuQDoGV1CWk9DfKFm4h8jTixLCeQaVHmwHufGagkDxgIP46k7n4p/Kt2e2uK8p2KAT7w3gwtDxwWFVPIccZtpFUu/u6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777772755; c=relaxed/simple;
	bh=YKj28Q85niDGU70q6VNatHef1IVTl7zI9IJbJKkrDqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hT1b4EUvHwdPb07xfCOOH6GNN5b+oRbCRCuO5yXOoYVm/wiL4kg7pfcabmkcZajIdZLsa1/Q8D7NHuaxwI9ZCRZvjYMbqmtWpcBRH6/4+hZeS9r7t8jg9g1y/7y1q/pbaM1wnHN2y06taXI96mwEj8skE6yV82N/qRZwF3JYLWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=jiEwwJEI; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="jiEwwJEI"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb20bcff5aso288061285a.3
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 18:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777772753; x=1778377553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2VDIdBulUU5TGbhBANhJGFN/QeEIFSIYNJHL/TT6dc=;
        b=jiEwwJEIidVBpn5VKvdaqyut0STQFn5mUin1j0c7CPH3JyqMyIemYiIdKm9lx22P81
         sv3BQST9ufNYY5RSEqNxV3ydmGcdP1P9DKRRfCF/5VLCbkV6KzJqtEfwrP7XxN7jBkVY
         3jU+aJxY9wP68cm09MacVfg8HbSfAvnFojocv4c4fv1kJ3r4vGRF693QpbgFbJZNZYHm
         J9+kpgPA04Up0whIt4myKwa9Jrr13USBrhogdKpVf+nKoicoHY/Mhr+9Yzv6lxXfccbY
         PLOCKahXZZEwa6PRj9NvYXtyz1209AcMuvvlNoRYrWPVFUrhTtGhdFrtL1ARQTGX/ijI
         b60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777772753; x=1778377553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2VDIdBulUU5TGbhBANhJGFN/QeEIFSIYNJHL/TT6dc=;
        b=Auhx8VUipcibnzoHWKh/DmVW+wvUIMwx01EQuMxY5Y9unx1FXfl293qNiDONi57K8U
         x/8NRu32ib2S3k7JgoDFFcZ0ULBg/Pt4sv1w5NIEIR/+ZriiIJa2DLxWZIgqZcJ95T0t
         6wbiL3lBv1q33nzV/DSwk9ng5djgYS7KTaDxIrYZT/aNApw4V8fTL7rpvtaxt8O4lSqc
         8VLzev5ssSwcuhcGd4hFj4Zq4EBnDgkQ3lBZt5yAcxdWe54In4aPJ1/VK0yILtfzzXfW
         kz9DN+KvYR9jikwWoy+DQ/tjMyhLZWMC7LtHrvs96qdt+5ANBO7K91nOeF8czF+Q0nqh
         lPcg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZjNyYO/khxpeqbIOkUpEpVXTM6lYfS6RC2Gwb0KhkzmRgHNWGNubnDjKsgIQk7gObnkIB91X69QbP@vger.kernel.org
X-Gm-Message-State: AOJu0YzMfIUD1JnRqBQ70Mxj7e24M+sLc+cY76yO+Kd/HYYzNXlpFYEr
	M76xjTzPLwZHpJt7j6wcNuSOZhKk5Z64UcA0uo5uSc1APIQV3paDz/smvI8w/VNWU28=
X-Gm-Gg: AeBDieu2EqqfCGmy8hd4hPAIUHbxP8B68iF8H/nHA17k2z2ii0WRkAKbfVknJ65cm+y
	2NBAoGXiWqmjwUvFlOoYdIMl3PAcCBl6eCduhyuICVPvIeMmKJMjxYoE+p62uta3OlJb/vPtEc/
	EreK/IIdfKc35LXxOwHnlbpRMDcIxadeOci9C3oKtKP/pta6ALiYm4bMZF/5TaYSyhJ4U5vcCeC
	smvus2bo8GXL1nFS3npH/b7+4pSlDPjikMNCQKsgxbH+aXPeAsDp6i8qVaq8JuycMfnhXAEKN5z
	c5GzGwfuUSwp7nTIEyLBhc0BwtdVKlAkY1FRCQoady2F4CDJumAEMZAxUmplqmHGdr7tqtkCIbC
	Nzu/pik2VtD/+jaE+Cs90deOmsYZIN1pUtR3LR9joXQBVZNtwwe+tDTD7ktQL17dvLZ47aGA9E0
	p/z5Y3hUlltgTwku+j7ypP5Wfqw60KrslkudOxaTMHf7icJ69nLEg19psubS6nJq4NTU5g3H/+t
	Q==
X-Received: by 2002:a05:620a:284a:b0:8eb:10d4:a471 with SMTP id af79cd13be357-8fd17e4b6c1mr769719785a.43.1777772753243;
        Sat, 02 May 2026 18:45:53 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c9229c8sm680230385a.36.2026.05.02.18.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 18:45:52 -0700 (PDT)
Message-ID: <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
Date: Sat, 2 May 2026 20:45:48 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 1:36 PM, Andrew Lunn wrote:
>> + * There is a TC956X PCI power controller driver that accesses the
>> + * direction and output value registers for GPIOs 2 and 3.  These
>> + * GPIOs control the reset signal for the two downstream PCIe ports.
>> + * Their values will never change during operation of this driver, and
>> + * this driver reserves these two GPIOS.
> 
> Why doesn't this power controller driver actually use this driver to
> control the GPIOs? Chicken/egg?

I am not the one with authority on this, but yes, that's my
understanding.  *Something* about this chip requires that the
PCIe ports need to have some configuration done on them *before*
PCIe is powered up.  So that driver uses the I2C interface to
apply these settings.  Meanwhile this driver uses the PCIe-mapped
memory to manage the GPIO registers.

> Maybe add a comment why gpio-regmap.c cannot be used. You probably
> need to instantiate it twice, but i still think you will end up with
> less code.

It's possible gpio-regmap.c *could* be used.  We started with
vendor code and this code got separated at some point along
the way.  It was working, and I don't think I pursued other
options at that point.  I'll look at this possibility before we
send out the next version.

What do you mean instantiate it twice?

					-Alex

> 
> 	Andrew

