Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697998;
	b=gJWCAR/I3FvzmA/CeAUNSU7tKg4/7DCENbZbxz3TgPkbVbx4o+/9k61sEvx5ySt1Pdjw
	 Vc3BMLSRMg5pa0JROcSf0QYt4a7Sf/plIV42wTxyDSLdDV+fkgr/pWbuh2/WXe3gJTOw0
	 cGyLa3JhA/Te/0CRCdtCnrj2KygbTuW7bQvbaio/CZJvGTsYMgUoEtL33Pz19R/MV+tgG
	 toLHP5sdO6ps1OwushY0x3xeDmPBmyAHPcHhcmtIMY5ISPHNAZCfTgotmLRNhuNYQ8NRt
	 f6oFUS/cePnU5mQpR2AeYM8fTBSMYon0lwTcaod3JXp5pzagrVG8+d1KDFLR9ysuC4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
	b=cQ81KiLYOC0/TRhMgC1HhwADRFdRrUZXVnYNjs29H73QCVinFeuTxY3rAu/IoIam9ATQ
	 /oGIBKyxLK7B0jQJSX0PnHY18cKh8tmNhnG7Jp7FYAuhUavL78a5fttjDoleeKhJGlld8
	 F7dMRcv2pkzuJ/u0w5N9jg71pFaGegt24IBYntAxI7NVj1yDkmsd4boPrVKm6jhPijYi5
	 FGpGZN73DJXycWgdJHLF/NICrj7/cSVIqj74JYjzYt9bEld3+uvmuv64nHpc8LjZBram3
	 FuLUXW0crDiNZBtEBWAUZZJZ+X6Hii5QHKzNDfI/pCmsiTA3nM2f36P5GDYVGsptirA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=Ni5icM2E;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A2C606A331
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A2C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=Ni5icM2E
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6d290b10a35so2949304eaf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795697997; x=1796302797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
        b=Ni5icM2E74nNCK1kkhfleyOOlHVlks2ELVDV8SF+XLnFb2IkGSG86FphXdWme0o72F
         Ee5/PKGCxCll00Nx4gF6NK3jsUFm8/g2R6kV0CBuFOR9+qyfXgzICNnocGA1YS2vOBoe
         vWTxmTShzmkVYayLKrpWJ/z+XJW7tJ85GBfdGNgYWt+pd/IwgecaLttZfz8qHQtNN62s
         fmWP5SvnQIC65/yZKKAeKbBDKCINV1ANPBHCIAZheOe1ulVuoDIanWFoIxaie5fJpTTd
         PI7NMFULQDRzaOzLQawMaDir7XHQL0E1oFHvzTtUBcQ6WZzRcDNRP/GV3rtV5oHBPwBM
         CnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697997; x=1796302797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
        b=KI/XGg76gI4MVpat2NwuOXbvAQniAOtqiPUeXYw7jeXSqdk4SkKlwXFuBI08v4m631
         qiHFaFQXe/FNvh0xJRUXlcqpZZPPCSsn44wYf74mjmaozEkfRvuWthnEBpxhb6eHHm+D
         4pSWl+0Kx6viFeozS/ZJRM2iXMbkNfurouuKOVH/sfrt4wqKlBFhjhfOgCxUNRPb01jy
         x7LHAQ4khiSzk+4maPc3V8hbT/RxX0YAtdDlz5kQSti+Ue3F0HSCrMqlGbGurAAa/+XP
         enRm2SkAwnRfEaV+3lWAgGVV6/LKFV2BQO9AeiP+H/Z035BKeKXVzwdq522buSevMSJq
         iT1A==
X-Forwarded-Encrypted: i=1; AL+hErEBU+i6oXUj9Y8uEFqHhzrVqri47T20R06eiAhq1nsEjAJDUm9fgvFGEZaAYbs91yul0U7M8mmEZeAW@vger.kernel.org
X-Gm-Message-State: APuU4Z8K2D5HzatGMNaNMQWF31hM037sLIcrKcCQbZaHwdl187QSSuPs
	AQhWxzfLacufDVB5V1Pey1L1BD/RgB6VpYHpK1+LJSSzBe8bORqCKBy7UzdIahKrgcY=
X-Gm-Gg: AZFdTZfJB1jN+43ydQA12s/uEVfIGXXsTfJ3SkN+7uLIs2bykHC6owSgB0+5Oxt6jql
	dyjFLlgawXAkt8WsfmA3l1xOls55P21g3byvvfUrEgHm95u9ncXk1eKzFdxewM0n8STGvF1eyDz
	bOhVo8pJgjIsnoRHPjLN7hRWOrH/RYzC0g+0NLd4A0lzjUJzHgCMlqxHCaNlQ5FZG6MMRVxsIB1
	y6tlB+Sxg5z+0c9F1+bxh4aFs0/rd5wUjWUOcf1ZIkgC7Vg58V22DKVIdMULn81fKEHYrwyrM/q
	8n/judUGsVyoHp+/2tWOzI/zbQEv+ZDGxDYYkmP8tBJQRpM/M+tYR1830y0XOv0KQzGz7ktazzk
	rBZmTdiJOk2wsnW15MqDa5H84afHlkasyovQ+CjmZWrvQCgr2xIStBwlGWHGDbiZNG6//mKJY5r
	y1mEhJiXYTgoBGs3P8FXEGy2+f8mpMl7RynREJOA85xlZ9aTDjotHnWofMJ+yf0A0H5oLsyfpiz
	qvo3ZnMV6uJ+rwUEryKvi7tJ4U4TRVcFw71Yp9c37g24Q7ii2KmYvxrUau/q8t5KlnWpn5S/g+9
	xL1BG/VhckIhJ5JIZVk/gRU+N/GAjB+R
X-Received: by 2002:a05:6820:809:b0:71b:40c:9d86 with SMTP id 006d021491bc7-71b394b3c12mr14780581eaf.44.1795697996937;
        Thu, 26 Nov 2026 04:59:56 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380c6815sm13831517eaf.12.2026.11.26.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:59:56 -0800 (PST)
Message-ID: <e20fde6a-3389-4084-a2de-fee5426a74e6@riscstar.com>
Date: Thu, 26 Nov 2026 06:59:54 -0600
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
Subject: Re: [PATCH v3 2/3] clk: toshiba: introduce a TC9564 clock/reset
 driver
To: Philipp Zabel <p.zabel@pengutronix.de>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, abelvesa@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-3-elder@riscstar.com>
 <579859f0e1b53aa6506492a2e5d073f3f991014c.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <579859f0e1b53aa6506492a2e5d073f3f991014c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 3:42 AM, Philipp Zabel wrote:
> On Mi, 2026-11-25 at 14:21 -0600, Alex Elder wrote:
>> Define a new platform driver that manages clocks and resets implemented
>> by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
>> and disabled, but currently only the clocks that are (or will soon be)
>> used are defined to be controllable.  There are also 13 resets that can
>> be asserted or deasserted, but support for some of these is omitted as
>> well.
>>
>> Two registers manage the state of the clocks, and two others manage
>> the state of the resets.  All four registers are found in a region
>> mapped for MMIO.  The region is provided via a BAR on one of the PCI
>> functions embedded in the TC9564 SoC.
>>
>> The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
>> state should never be changed (and a warning is issued if changing their
>> state is attempted).
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Fixed problems/garbage in the patch header
>>      - The Kconfig option now depends on RESET_CONTROLLER, and can now
>>        be enabled if COMPILE_TEST is enabled
>>      - The generic gate clock controller code is now used rather than
>>        implementing a custom one
>>      - The PLL and internal fixed clocks IDs are no longer available
>>        outside "clk-tc9564.c"
>>      - The PLL is initialialized, followed by all fixed rate clocks,
>>        followed by the gate clocks, to ensure each clock's parent is
>>        initialized before the clock is
>>      - Updating the reset registers (read/modify/write) is now protected
>>        by a spinlock
>>      - "Unnecessary newlines" have been removed
>>
>>   MAINTAINERS              |   1 +
>>   drivers/clk/Kconfig      |   9 +
>>   drivers/clk/Makefile     |   1 +
>>   drivers/clk/clk-tc9564.c | 456 +++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 467 insertions(+)
>>   create mode 100644 drivers/clk/clk-tc9564.c
>>
> [...]
>> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
>> new file mode 100644
>> index 0000000000000..306781e2f7b4f
>> --- /dev/null
>> +++ b/drivers/clk/clk-tc9564.c
>> @@ -0,0 +1,456 @@
> [...]
>> +
>> +static int reset_update(struct reset_controller_dev *rcdev,
>> +			unsigned long id, bool assert)
>> +{
>> +	const struct reset_init *reset;
>> +	struct tc9564_clock *clock;
>> +	unsigned long flags;
>> +	void __iomem *reg;
>> +	u32 mask;
>> +	u32 val;
>> +
>> +	/* Warn on any attempt to change state of a critical reset */
>> +	if (WARN_ON(id == RESET_I2C) || WARN_ON(id == RESET_PCIE))
>> +		return 0;
> 
> Can't this be checked at reset_control_get() time (in fwnode_xlate) so
> that critical reset controls aren't given out to consumers in the first
> place?

So I'd pass in a slightly modified fwnode_reset_simple_xlate()
as the fwnode_xlate pointer?  I hadn't thought about that, but
it's a good suggestion.

>> +	clock = dev_get_drvdata(rcdev->dev);
>> +	reset = &reset_init[id];
>> +	reg = clock->ioaddr + reset->offset;
>> +	mask = BIT(reset->bit);
>> +
>> +	spin_lock_irqsave(&clock->lock, flags);
> 
> Consider using guard(spinlock).

OK I'll do that.  This will be the first time I've used this...

Thanks.

					-Alex

> regards
> Philipp

