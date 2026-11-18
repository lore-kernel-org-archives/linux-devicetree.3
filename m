Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013020;
	b=DeqxEtPy9jQS5bLtMENqf7+u7PybAtHOG5sXlC4BpcMzoD59Dx41tN4itz5DkA9fRXVj
	 dL8Ht8OMu/FSn/F+PfHDD9ubpz6nx9K8ztsjYrl++QsaFLZ8pLsvzNPV2wKEu+BBjo5ze
	 GQY5JtzJY++Tfg9stTqB9XS3uNDOb3Q0WEL+9Vy1Aah1LdRjdM26PzEfZrtbqtRwQZKao
	 OIymeY8P02YSQVrTtz7efLwsqRsNhJ2LeCmzC8Us5i+kvFORXxTYL4lNrr8IPfLWcUz82
	 RTQF69nheAnXVWICB+fILvP/8pftxk1fKvMad9jhgUi3LhSop2bjBSOjwYBxpm5/qbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
	b=gG+Qtiky9rHM/PvYfnvPJI5HDDqdUrX9HXYnCEodv4qC6PjMX6YmsqQOiv5CxFejhdRb
	 dhqqrkhxHnV4I4ooI5Ndzuk0W4QX2mmNZrazqgyXP1xuShS/qRCj7Xx3g4fjKypKxydy4
	 rNkcfmpSvMj3oQA4ltajKnDPKlMtUGeg7oI/DRFBZjZEF/P8XpKULO+uo1o8ydxHZ8kwR
	 dSGV6JdW3acy7xklX5mR9KNCxRudH7Aq29Wxn6bNTnIygWRBLjp1Tg/Jd4jUeQ8jI395T
	 XNH5Xg4ASHfqL3n3A37bYhTbv4SDrCAOlrdl2/PlaU9BWUXyoJAOho54nKZNFKwjAHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dwmBcbth;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C42606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C42606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dwmBcbth
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so10967335e9.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795013017; x=1795617817; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
        b=dwmBcbthvsOhg0BMX/WUPjZxJfLOtywE+LnL/i36T6xenrhO4k/DBOfdcAzV42w5Hw
         g6WrY964j8f8iJU3SPok0C/1aq2y9kAYI23N0YBDuRF74H/2nt5R43dk4KAGNkYJs1jE
         fdFL4jE8D/LMoJYVFcrtDI3gfMtZDRviRFxD4mGfWCQQUFWG1cHSjRa3YY4gKpCuhCbN
         axHcHFGJCac3wLUTg+Rj6x5Qp5Xel5RKPALHaO7dHDTa5J31LOYnwSRnlZbZMMyCEZID
         TvFUUO5DCJMLUjmwi43B58XiEMJYdkmTGuqy1unsmbByIT3TWGMAgDwFJxhnZGjZ9GLo
         ivgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013017; x=1795617817;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
        b=X+4+J8l5e/fDn/s71UhiulDMpqmV1jyCdUL6mMWfbq9/dmqLUkBBAgPmIzFYqISwWB
         8sQzkqq4/F9NEiPwA6tGQjhYcnjepkmkH6lBIxrsAeu2EX8ZXYe1HkinmJ6ZuJugjxHm
         8sSPXn61KdQmSRAGHu921Ilx3Y1PM8sNL6hay0gPlSAmv1i/LuI9qoTO1GnPlVFZU9iM
         WM97D74VfB5X0z8n1hi52M5kgTOpSXrN5GToiQp9Wcb+i8V/4Jra2ZgcMFEIMFZLJgRx
         9FV4D6Cv4CwBpnEz7TF7Gy+OPsZKoNf0Rx6NcDQfyYRv7RvxCVdLivDnGQIPZtWqP65Z
         sYUQ==
X-Forwarded-Encrypted: i=1; AL+hErG1VdolHFThGtadWFCu701SrHp3TXCPxzbNzjD0VWW6+MSWfFBA0XZGlk/ZvtKMvK1GM/LdJQ1yPBbY@vger.kernel.org
X-Gm-Message-State: APuU4Z/7sNP7yblopfzgzRUXGKQhBrW+nYbCLngm5Cl7gVICFi+lJwuP
	e9vW/u6nC+eolFb138COqJ5xIX4f2+Os42x1bAaHg1n9gOOugQ0+fftbGJxzGLQBZR8=
X-Gm-Gg: AYBFou26qIyDK/Vhax/RZFYx97wc/qrDLnFKfjqq/lwx6P+Lo7uoY8JEUA/2f13iTW/
	DHvIM9WQudp1pfRvitB3Rs0b6GWgH1U74TyS4pN+r0fIJuUbegPd5URAQJrCczLdaVVOXgJXex0
	/r5li3PPTPBeDUAYc2kN3vNNv7s6+bKpwh9wTUskBUT6pqPQ+d6RTFlREIDUJXCy6xUmyIVKzd3
	BGKKhyCHmuF/zrC+tLcjTz08hJDFVhvz+3eJRVGLIVaSNTv7doPa45ebpTNSW/8LoW/O6Der+Yp
	S6txEXLF2njZX7msJQx70i/+YPwf9xvhy6+VH9UVaqpf0NlDO9xWP+1zMAPvA9j5YlkMXwvYFwy
	GOZkzDU0mb2ZxO5M9b8nhOOMO7qqniopRhAmALr4+qAGTaQBlCDf4PyuGPbCAdcSuG/S7YGzu0X
	AfrtnYF2UnACjO1PwJ/xHRi1Amk+LlutXy8jp0DyZy0s9hG+T/PxoO3Hbz9mWwe6bOrfX5Mvcrq
	AwNpVdmVolxsu6H/nxyvkLAEoLolgHBkG4/jiCBECv54vwskkZhZ29BAr4ZK4GyFUfoSgnmhRDf
	mGFu/PUkGH02mv2yBcVv+is5timCRvNjdEPT9ozxXOqDWx+b/VxvBW7YZM+Q7mhwax848Q==
X-Received: by 2002:a05:600c:81c5:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb7da38bd0mr52621935e9.24.1795013017611;
        Wed, 18 Nov 2026 06:43:37 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e5919c5sm29710375e9.3.2026.11.18.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:43:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede
 <hansg@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v8 2/5] mfd: axp20x-i2c: Fix i2c instantiation
In-Reply-To: <1ja4ogfp5l.fsf@starbuckisacylon.baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
 <20260924082705.GO3864833@google.com>
 <1jy0cq94na.fsf@starbuckisacylon.baylibre.com>
 <20261014104801.GI199624@google.com>
 <1ja4ogfp5l.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 18 Nov 2026 15:43:36 +0100
Message-ID: <1jh5he2o9z.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On mer. 14 oct. 2026 at 14:21, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On mer. 14 oct. 2026 at 11:48, Lee Jones <lee@kernel.org> wrote:
>
>> Note:
>>
>> --- checkpatch.pl (3 issues) ---
>> Line 2: WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
>> Line 3: ERROR: Invalid commit separator - some tools may have problems applying this
>> ----------------------------------
>
> I've checked before sending and checked again now, I don't have those
> warning. I don't see anything long on line 2 or a separator near line 3.
>
> Any specific way I should run the tool reproduce the problem if there is
> one ?
>
>>
>> On Thu, 24 Sep 2026, Jerome Brunet wrote:
>>
>>> On jeu. 24 sept. 2026 at 09:27, Lee Jones <lee@kernel.org> wrote:
>>> 
>>> > On Thu, 10 Sep 2026, Jerome Brunet wrote:
>>> >
>>> >> Apparently this device never really supported i2c instantiation via
>>> >> sysfs, because the driver does not even look at the i2c device data,
>>> >> which are not set. It would only probe if the device matched through DT.
>>> >> 
>>> >> Fix that for correctness, even-though it is probably useless.
>>> >> Add the missing AXP323 while at it.
>>> >> 
>>> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>> >> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
>>> >> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
>>> >> Acked-by: Chen-Yu Tsai <wens@kernel.org>
>>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> >> ---
>>> >>  drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
>>> >>  drivers/mfd/axp20x-rsb.c   |  1 +
>>> >>  drivers/mfd/axp20x.c       |  1 -
>>> >>  include/linux/mfd/axp20x.h |  3 +--
>>> >>  4 files changed, 15 insertions(+), 14 deletions(-)
>>> >> 
>>> >> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
>>> >> index 5c93136f977e..a76bec5604c4 100644
>>> >> --- a/drivers/mfd/axp20x-i2c.c
>>> >> +++ b/drivers/mfd/axp20x-i2c.c
>>> >> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
>>> >>  	axp20x->irq = i2c->irq;
>>> >>  	dev_set_drvdata(axp20x->dev, axp20x);
>>> >>  
>>> >> +	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
>>> >
>]>> > device_get_match_data() is bus agnostic and should still work from the
>>> > core driver.  What's the purpose of splitting it out and adding
>>> > additional call-sites?
>>> 
>>> device_get_match_data() works when the data comes through that path,
>>> which is generally the case.
>>> 
>>> i2c_get_match_data() calls device_get_match_data() then fallback to the
>>> i2c_device_ids. It covers the instanciation from sysfs mainly, not
>>> something usual.
>>> 
>>> As explained in the description, this changes plugs a hole identified by
>>> sashiko that technically exists but I highly doubt anyone will
>>> instanciate the PMIC through that interface. Those things do not really
>>> come as breakout boards ... That being said, it is cheap to fix.
>>
>> I'm confused.
>>
>> We already call device_get_match_data() in axp20x_match_device().
>
> Not anymore with this change. It is the point.
>
>>
>> So if you populate .driver_data in axp20x_i2c_id[], you should be
>> able to drop these changes altogether, no?
>
> device_get_match_data() only goes through the DT tables.
> Not the i2c_driver.id_table which is purpose here.
>
> My understanding is that if you instanciate the device
> through sysfs (which nobody does for these devices) and you only call
> device_get_match_data(), you will get NULL because there is no fwnode
> associated with the device, which in this case silently translate to
> AXP152_ID.
>
> device_get_match_data() does not go through the i2c_driver.id_table.
> Only the i2c code does, with i2c_get_match_data() and after trying with
> device_get_match_data() internally, which is exactly what we want.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-core-base.c?h=v7.3-rc7#n121
>
> As noted earlier, this a problem reported by sashiko that is real but
> extremely unlikely to show up in real world. I'd happy to drop
> the change if you don't want it. It is not need to support the axp318.
>

Hi Lee,

How could progress on this ? I genuinely do not understand the problem.
This change is fixing a sashiko reported issue, in the appropriate
manner I think. device_get_match_data() just does not care for i2c
.id_table so i2c_get_match_data() is needed.

At the same time, what we really care for to progress on the Allwinner
a733 HW support is the rest of the series. So if this bothers you,
I'm happy to re-submit without this fix. Please let me know.

Cheers
Jerome
