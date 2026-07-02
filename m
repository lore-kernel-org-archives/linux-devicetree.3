Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC383EDACC
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991377; cv=none; b=Vkts5jTijupeJMcDGgXgt0QuFDCFKImPVVIhAgOTVbo0D20Cbvw+7AO9TvjsYGoWyoFajpnt5p5jHNsWEL+CWBHVjHMTX1q0YnSeSdRgzj6p4NMibQmGler1MEgkR9Wg61L0bHa97T9yWFhciPR2fs3u3P/MYlgv95UKOuBmijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991377; c=relaxed/simple;
	bh=BjCZldRmVu7iIL1qiFQiiS2rf7b4kgTkGMTTxWONjr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuB6L8usuqTXIS0vB9pTY4Qk6aOrgw8xN+BGf9UkYn0VnKZoLyC07++26Uvx7I7/ITWQ9NmXql8894HGbchz+PHbrVV+lw82wS0NAa+KA0CNlioWarm3OFKvrbxGDNac6mfDrCGHvXTPQj8/zn3riz/oXfJkifHchtEat0JJKSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWKLBOQv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWKLBOQv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so11455835e9.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782991374; x=1783596174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KhhtWV7Ryh6pz9r0SAzNB6C4UPIw4trYcrpHGw3+K5E=;
        b=JWKLBOQv5td84hv0LK8aQzdZA2lyEh7d9gRVfDeBB8SdxKlt0gnfGWOikEZPu5cY3y
         EItywlxa6yN8bfbDDYTD5KW7b7IFEU/Im8Ub/ObaE37pM9a3UqgxsFhlNd3CUk0wJQHv
         XlxxIRe3pjBZP0fWL8KydwRmfzBkRVI8hWJMDKVhONFgrXvnzvGkLhlHMljngpERSCj6
         1h/0aG9ybpn+3ReLLDjgqUu3XiHd9lQEx/zHQMkjDwlON+F8geXVo9cFaVpm5wPIzQal
         ik9n8ZbJSBWaQzWvat9vZIImq5Zxf8+0dOAE6FhJkmvghyxSvoVqkGUMonKqmT5ERqGl
         LG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782991374; x=1783596174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhhtWV7Ryh6pz9r0SAzNB6C4UPIw4trYcrpHGw3+K5E=;
        b=WQbvTS1DnUAEpJhs1hoaC12XyFtmfffqoxmjemDhHyCWklwR1hPAxxFHoEwQiR97wc
         5/DBSuMWxKrTp/vi1ZIQk/jr1bceIJjwk5wFwLvG3wMZHWeThpvksq22v/2A1rlMVMT5
         iScFOuSJMsbuSl05NsFoLShPccTy+BkZZjUj7+1A0fZq2EJZkCupifEFSTayf50/8S9a
         HbRU6Fe2+0yDkglEd9H3G1uIKiy5ns/RpH++BJUEToC59btYX2zG6V+ZI/E1nSzQ8xsm
         gm4R5vEsNOe+trv813h8NYXbFwn1XkNVf866zOjZNn122JAl2V8akKxYudwTmT60to6v
         mYqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/3j3CG2eqX6Efc97e7n6y2Gv9IByaDmAa9OHU37k+fg6CKV16TtFbo1Sns9ViRNFRC/kgiSqGfWWs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt7+0oTpoc1/gaI1PjOkNjc5KKIbGSFEIVn2Lj3HXexvUhcsHO
	OxB5IPA8m62LMNWO5P0li6PKvxqpPdFKCkhA5DX1Jd5/LtWEWAxSVUj1
X-Gm-Gg: AfdE7cnhooBV5G7zVTqwaO3nYiOUE6+sHJpgoMBT+Jjs5sSYlfwksIQdhuznGujdAyC
	6rLx9bPHxfPvJaWhnzWX0MnAE1rd4pfiV0rv6qnZ2QJuWGfRcGuXNMydnz7ai7KosXLwD8jU6aj
	oYML16HwA/xtAfRt5WJfpQuKj3YLaDIXKGZ/yLl/wMyAAMRInl9q+8NPTnvddBeg/NkAn7thK8U
	GgJE3KR9wE9gcD1hcqcoNTn8tMjfS49DDHbfaFlzVVXeM3wzeGxnC0X8KgTOAF3JhagZAJ1E2H3
	UcNJ9ckdpq6k15Kk52ZXD31NH19Y1OzIa6FymUfjgFN65ozJ+fxP/Lpv6kID1wJ94Itd6J13oKu
	woSNWBvT3FLNG2SrwWKDxIo+Rg8luMhOxiH5mGKPkbWKTxs2v2nyErVe160+wRdI4yoL6t22RC6
	7Tm2NAT7x/6eTG5fu3NTBdtA2ecVRZR9I+UWkAjMFHPu7V9y0FwSktsRnXrqm2y2W6vb8eUPfzd
	RgJbkRRdyn3nkA=
X-Received: by 2002:a05:600c:6986:b0:493:bb23:152a with SMTP id 5b1f17b1804b1-493c2baca0cmr76877265e9.34.1782991374089;
        Thu, 02 Jul 2026 04:22:54 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f125:6a01:ed38:5886:81fd:d626? ([2001:9e8:f125:6a01:ed38:5886:81fd:d626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bfe7427dsm76413895e9.2.2026.07.02.04.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 04:22:53 -0700 (PDT)
Message-ID: <5177c53c-3885-410e-8f6c-e40e38677b32@gmail.com>
Date: Thu, 2 Jul 2026 13:22:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/2] net: pse-pd: add Realtek/Broadcom PSE MCU
 driver
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>
References: <20260630105651.756058-1-jelonek.jonas@gmail.com>
 <20260630105651.756058-3-jelonek.jonas@gmail.com>
 <akYPfkRbEzWFuC6j@pengutronix.de>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <akYPfkRbEzWFuC6j@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksij,

thanks for your review.

On 02.07.26 09:13, Oleksij Rempel wrote:
> Hi Jonas,
>
> On Tue, Jun 30, 2026 at 10:56:50AM +0000, Jonas Jelonek wrote:
>> [...]
>>
>> +struct rtpse_mcu_port_config {
>> +	bool enable;
> in this struct we use only enable, do you plan to wire it somewhere
> later? I assume you wont to keep it as documentation. May be add some
> debug traces? And add some comments what do you already know about this
> fields.
>
>> +	u8 function_mode;
>> +	u8 detection_type;
>> +	u8 cls_type;
>> +	u8 disconnect_type;
>> +	u8 pair_type;
>> +};
>> +
>> +struct rtpse_mcu_port_ext_config {
> Same here.
>
>> +	u8 inrush_mode;
>> +	u8 limit_type;
>> +	u8 max_power;
>> +	u8 priority;
>> +	u8 chip_addr;
>> +	u8 channel;
>> +};

This might be good for follow-up patches. Right now, I don't get
the full complexity of the pse-pd framework so I'll rather keep it
simple. I see that at least some of this information is reportable,
though not configurable (yet).

I suppose it's preferred to not add unused stuff so I should just
drop the unused fields and add them later as needed. There isn't
an urgent need to document it here either, the guide I based my
driver on is quite available here and there in the web. I haven't
actually dealt with all those fields close enough, so adding
half-baked comments about them isn't good either.

>> +			break;
>> +		msleep(RTPSE_MCU_BOOT_RETRY_MS);
>> +	} while (time_before(jiffies, deadline));
>> +	if (ret)
>> +		return dev_err_probe(pse->dev, ret, "failed to read MCU info\n");
>> +
>> +	switch (info->device_id) {
>> +	case RTPSE_MCU_DEVICE_ID_RTL8238B:
>> +		pse->chip = &rtl8238b_info;
>> +		break;
>> +	case RTPSE_MCU_DEVICE_ID_RTL8239:
>> +		pse->chip = &rtl8239_info;
>> +		break;
>> +	case RTPSE_MCU_DEVICE_ID_RTL8239C:
>> +		pse->chip = &rtl8239c_info;
>> +		break;
>> +	case RTPSE_MCU_DEVICE_ID_BCM59111:
>> +		pse->chip = &bcm59111_info;
>> +		break;
>> +	case RTPSE_MCU_DEVICE_ID_BCM59121:
>> +		pse->chip = &bcm59121_info;
>> +		break;
>> +	default:
>> +		return dev_err_probe(pse->dev, -EINVAL, "unknown PSE id 0x%x\n",
>> +				     info->device_id);
>> +	}
>> +
>> +	if (!info->max_ports || info->max_ports > RTPSE_MCU_MAX_PORTS)
>> +		return dev_err_probe(pse->dev, -EINVAL,
>> +				     "MCU reports invalid port count %u\n", info->max_ports);
>> +
>> +	ret = rtpse_mcu_get_ext_config(pse, &ext_config);
>> +	if (ret)
>> +		return dev_err_probe(pse->dev, ret, "failed to read MCU ext config\n");
>> +
>> +	dev_info(pse->dev, "%s MCU, %s (id 0x%04x), %u ports across %u PSE chip(s)\n",
>> +		 pse->dialect->mcu_type_str(info->mcu_type), pse->chip->name,
>> +		 info->device_id, info->max_ports, ext_config.num_of_pses);
> Reduce it to debug level print.

Is there any guideline about what drivers are allowed to print during
probe? Usually, I'm a fan of at least seeing an immediate sign of life
from a driver, even in success case. And I also see that from drivers in
other subsystems, e.g. fan controllers or GPIO expanders.

>> +	return 0;
>> +}
>> +
> Best Regards,
> Oleksij

I'll address the other points I've not reacted to explicitly in the next
version then. Same for the low-severity sashiko-nipa issues.

Best regards,
Jonas
