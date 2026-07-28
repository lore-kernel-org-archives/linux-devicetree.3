Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C403AFD07
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235903; cv=none; b=pKumu1zdwsy7fHtCRVlsSZVaoxuu7o17+ApFbMfQ+JzWK/ZYVoI7q5Uv5+9R4q7ajsNlKyw5RxOJ1+Ju4TQAZrHAyAuvsfGjYLyV0lRSlyn1OsDxMvcyeFZ9LkHAuxBow2prA9oBrijQc3xGs6pClp7NZDQ/NwS5zHy0bSkrW9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235903; c=relaxed/simple;
	bh=uFRNW+3w9EnOK3PrrtaSrrFmRFgj9UhlYBeXgQfDtfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBn26nZTXpyMQZ4XcebAvViazClvyr5MaJUr7wWS7TFFrCuY95Ysm7xMXY7EZe67r+gg68rJKmHIcoMXQwEZM2gN+wPfX2GOmxNSzCwDoiit5MVDqtf1us7Z/MgTw0ux9vq3qRoYcwvsOmmdT1RKy8zkeaB+eVWHQujIJrvkziU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XT0+OBqP; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XT0+OBqP"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so4467671a12.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785235895; x=1785840695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0DjSdXiKBw0ZZEMZd8FTQi9iSoUjrgkZuIJH9PB0eg=;
        b=XT0+OBqPLlgwsZrZdZioLsy8Z13LP1eySQdC8+FRBOfn2RbaTFDEkVw/Ge/n3+efSk
         QIQ+O/CirVFyXuT9m5cqgDOqB1Qg+qdQE9h6vzpA55KP1qKM1Z6Ioa7bkIovCcLFKzUH
         aF39TY6+RG5VGy6EaTgDnBZuLAPBH/I0gqnJwYivYfQXhgokfUy3s5AtUh++xP1H7/Uv
         FWA+XcQMA1uKiAsHUj4sOXB44hUnk2INPOLQuXt63fWxZa7mFtdMdYn0y8ktrfE5ZAVH
         jqIsPRUKRnbdmBKB8lay+ibWUoEnjJXW4RE4Z4Lq3oyGNrGc7ei9pPFtMKq4hOvx2raq
         0VZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785235895; x=1785840695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0DjSdXiKBw0ZZEMZd8FTQi9iSoUjrgkZuIJH9PB0eg=;
        b=lx+EsV2N6byd2FOGqvPyeHY+TDpZfwN04AR2J6Il9Tyx0MZZgJa2vCQ6C55ZUB8x+I
         EJahclxTg61+oeOtvNgkQA3yYtFA6gzknYbyBo96xillFK6nWQpqA+Ds2Bh3hCCZ8MfJ
         k+KVLbEG2C+8T3DbLL/U48rMsz4Do1VN1gjVDKqhBYOBg2oFvL0u8yzEhcHuP118r124
         3XupZr9VtRCtsB7cJlTWKUiAp7ymhoKbd/JNI6sQZoT6YsH0Sipwwjcjyz3FISpczAHo
         Eido49HGtb7oARO4HGY+TaNFipsZ5tN4Qo8SN4fmosYP50YADqmNHpNC2HqATA7lnvia
         QS+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpfzW/bQn46iLBEbuT9IE1hzUsmP15m/5B/yej4awW11Cms5poYiL8LFZmlmbNQCuGf+Jm4vhxWLsky@vger.kernel.org
X-Gm-Message-State: AOJu0YwW5XTekqXhxGoEf1+Qx2psJMzkGSlpBhO/wF1rs+vW6CmaOzZi
	so5OodyMflD+9gT2asBpD44RITd1u1WAD8OEfLCW8EZnFOr88SwPCZknUr3cOKJooh0=
X-Gm-Gg: AR+sD11ypmiIlX0s9ZYdrqWv93ShZel+1Y2eOFs1so4rTnBZ/ssJY+powSoOIl0eP2M
	XnLCOUKxAhm68FtQN0+jFq4JKexuMQ9vRaSfxdLDV2YXGup5KNkLBvawf1bmwJMImAuohjEcty8
	TcTKjaGHXUb33ZzRsj8na74yO3qbXOok2GWiPJ/dLOB1k/ESfIMxKodyCCBrz2+eeogHosLZigO
	F+MPdosIh+bpguC4/m705m2jMZhbwj97OIJHFJxZnkO7CK0Ug0BXTStqcJ3eVmKM+hS+wjtooA+
	VnhEtWQnfW9HNCJwPKq43PIyJBtdvAVx4BfGB1Y67oSJdyWXf+c16NTPXIYrwTTCBRZzZWu5Ltq
	Ts43RRzth+uvHl2hCrwGNzxBeaJqiXv1IhHOaunSK00ZR/TRlH83wq/99S2YqwezL+CvqWYqzlq
	y/pFG8AUIX12h5
X-Received: by 2002:a17:906:fe43:b0:c15:ce72:9352 with SMTP id a640c23a62f3a-c1f72147fe4mr100806566b.33.1785235894410;
        Tue, 28 Jul 2026 03:51:34 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc3c0sm744772166b.51.2026.07.28.03.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:51:33 -0700 (PDT)
Message-ID: <bdcb1c93-a560-42c2-9239-bc197b230a13@linaro.org>
Date: Tue, 28 Jul 2026 11:51:31 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/5] phy: core: Add devm_phy_get_by_of_node()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-2-ae811e2f0799@linaro.org>
 <t2c7lvpp3xyoumd2gdzntkwb6xpdjvhzyp2hllukimzfzbwbvm@fkgwdtcqxof5>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <t2c7lvpp3xyoumd2gdzntkwb6xpdjvhzyp2hllukimzfzbwbvm@fkgwdtcqxof5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 11:46, Dmitry Baryshkov wrote:
> On Tue, Jul 28, 2026 at 10:35:33AM +0100, Bryan O'Donoghue wrote:
>> Add a devm variant of phy_get_by_of_node() to allow for the familiar
>> pattern of having devres automatically release resources on the driver's
>> exit path.
>>
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> ---
>>   drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
>>   include/linux/phy/phy.h |  7 +++++++
>>   2 files changed, 41 insertions(+)
>>
>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>> index ebfad5325072e..7af24f2f4120f 100644
>> --- a/drivers/phy/phy-core.c
>> +++ b/drivers/phy/phy-core.c
>> @@ -1029,6 +1029,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
>>   }
>>   EXPORT_SYMBOL_GPL(phy_get_by_of_node);
>>   
>> +/**
>> + * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
>> + * @dev: device requesting the PHY
>> + * @np: device_node of the PHY provider
>> + *
>> + * Returns phy associated with the device_node or ERR_PTR. devres manages
>> + * releasing resources.
>> + */
>> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
>> +{
>> +	struct phy **ptr, *phy;
>> +	struct device_link *link;
>> +
>> +	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
>> +	if (!ptr)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	phy = phy_get_by_of_node(np);
>> +	if (IS_ERR(phy)) {
>> +		devres_free(ptr);
>> +		return phy;
>> +	}
>> +
>> +	*ptr = phy;
>> +	devres_add(dev, ptr);
>> +	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
> Why are you adding devlink here?

Looking at 987351e1ea77 ("phy: core: Add consumer device link support") 
- adds this link to 
phy_get()/devm_of_phy_get()/devm_of_phy_get_by_index() to enforce 
suspend/resume ordering between PHY consumer and provider.

So the get_by_of_node() replicates that logic.

---
bod
