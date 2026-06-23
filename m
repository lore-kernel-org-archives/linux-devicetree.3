Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402D040D596
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206043; cv=none; b=SH6AvhfNweMR7a4/08HodDmyF305uGemj7eSySBdb2evga3WYoJgqKPmYA/D11PqHUeL3KXP8JGU0/Rcal6fE9we+uj25EnHZLag20yVPu45jS+BmZLnTkFe7L5njErTvC/H7df68TSBQ4gXw8s1bzRfbRobuG6/avVeH8p1bsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206043; c=relaxed/simple;
	bh=cQKjFSMQE+XeYyiWc+t1WYLYYKCy4O9bStOxNKaGyvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJ9kKFya56TubRE51s6d6b4t22+wXoWaaaw/ePzakgU8fjNcMQdnkfgBJ9TkUHSnFgwrNq/bTR8r0Bm2zSIajk8GE8JaVTSyju98yHJIKmZy0a2WpT1QQVtaf4QdO+VyLIk6e1zFN+T+tuV8AEw8VMuRwOsYih0S7qHrNqDUrk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4mS7UH9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTrE63RZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4mS7UH9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTrE63RZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cax82992173
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24B/vWc0OHfdLJwPCzXWYKyFsXHSMgBg7admOM5KrsU=; b=A4mS7UH9cMUAFje6
	A0r8LqRcNxoAq7P0nSPp7j7UH+rGGDrFJ6XHXWLsqzS+YWI3HvZiMZwWJqIkrA4I
	AoUVIo+2n0Qks0KtLcggUx9+rPxok5ME4EiHCtEk3HdOU+C8Lmt1GEyZNUEVXqSy
	5/P5OL7cE/GhGd8rVLAzZcGLTrIMJHqoMFRJze7Ct6AVBGTG+ccWCdIKO3/dnITf
	ElE4W8bwg7Kjx8ZgIM3IgyM9+8LgzyJljD54Q1/TLJj/VZjuxKGw8ouZpleqURJX
	RQToHzvomedlloJJZ8sdKpIPQZpqSpH2pw0tm+apD02wy8kNm07e9Bwfe8Frpqd5
	4KmKbw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729ukmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:14:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84531eaf8a8so7887271b3a.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 02:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782206041; x=1782810841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24B/vWc0OHfdLJwPCzXWYKyFsXHSMgBg7admOM5KrsU=;
        b=FTrE63RZTZXpWOmNB5p4G7awUJHn2DDWLB1S2RIeAGtDG9m06+eVvMCWB5Oug6Way6
         jcOEjD8FYkuuvADjHK8nesOsEJTJ8lTLV1S8SFYwSlJeVcqe/bcn/Uzv71AyaP2eVAFK
         mEXpQ5KaBOD2xSwVp80BFdJUU/RXGsAJaN+cXddqIj7tvNx61Xn81E5m3HEXJNVFxcoI
         y3Tmw3h9vU7gGdYLdxbqVfizlxOF+UpLrgON2arpGA6fF7nnfLAJFfRTNXiEXAKia3cf
         yk271TUgK80oWLPZNfId95M4Snr7VagYFpo/Ao2cND78ECxYfMXY36HmVfBtaLJl6fBJ
         kV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782206041; x=1782810841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24B/vWc0OHfdLJwPCzXWYKyFsXHSMgBg7admOM5KrsU=;
        b=K8tQvYTF++7CJSt4KtkQVwpWxBcFkArvAFKCtm1waMOEbNbh8c9fXI0BuPPy3h5GHG
         JaU7LmmMqN2ouJJ346Se1dGtDW3MLPB0yrqCT536zdj5JDOSrpjpSeVB8rvEj+e8mMTe
         cBmKjwAkgV4yZ7vBLB7HtS1X9PPAMEUW+kMTpsfg4UG+EuTqB0Kr2SO383yiY3uy9VM2
         W2AJD4Y1FzOsOrSXlA1u/xmDYmJcwbGppYvpmG1/AmZf2xb8ryw5MsTb2nbrlijZR1lf
         Xi/G3cW4RGH+qzbu2KlCUMor0ZHe1wfDUpLwV1h6GVYzBZg+9EOvL6PRJVoYN8YQpnJo
         y7qA==
X-Forwarded-Encrypted: i=1; AFNElJ+8Yfm1SjY2jqvhiqMNrSB2zqwnuU9ILxS/NA5f72bD7qhuTwrwFGZAU1g4S+38wlVwrUrZKsWgRnT7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3jY9JaI1qo9TobLww6EBwWmMDU/wJw8gMMq0QotdYJ4i3QlEu
	1iSqdOJuQlCi9d6OPJ28n5OyC29pV6aeTp/9+wZsQWu5b8qOzQNeu/1jUdA1oaeZRmhnrDb1xbr
	IefaGuh3W+CykyTjISDWdiDHLbijP60xN/+Sy2eabKyWpO4KONnL5ais+yw4cvwjC
X-Gm-Gg: AfdE7cmap6uHYnoeZ6ufvmCloJl0BrL53N4ya6Mwk1fQP/z2JvO+Vc2mwp+qn+rTmec
	7UPY+u7pZEJq4vT806z/uEAyt3c9FCSyYPQ68b5AC3N0Ex8sq/T05eIFTQSUoeV8BegHlV3m5TI
	sH/2sG0n5EjBoBJjtE2qbIdX5trP1TDtmaSdxqVk3uG6DO8iJgHYM/LYUulaSyolCC9POta2HJj
	cQwEk2j6KwQxOr9vZBaSp+H0raEKL8nPZR5e5Kcwc6lTf9kJCdAwnIH7iNeHgA3caO+M238YVaL
	WzYqe6qinrw8SjHSbioPXQgH8VXgHIBDDREDrW6JvOHP19TtGPsv387Giiv/+xNN6QN2ixn4Z3o
	0/NXFEyGgA7tGM6Z6Do579Jxqzmm7nS/TWCzWDL5O/Jzv
X-Received: by 2002:a05:6a00:14c4:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-845970ff8e1mr1946824b3a.46.1782206040629;
        Tue, 23 Jun 2026 02:14:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c4:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-845970ff8e1mr1946786b3a.46.1782206040140;
        Tue, 23 Jun 2026 02:14:00 -0700 (PDT)
Received: from [172.20.10.7] ([106.192.20.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed3bd8sm9568565b3a.56.2026.06.23.02.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:13:59 -0700 (PDT)
Message-ID: <81f10859-b7b9-4a37-a260-b77e36f0267a@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:43:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add Qualcomm WSA885X I2C codec
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
 <20260611-straight-refined-beetle-e2c934@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260611-straight-refined-beetle-e2c934@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3NCBTYWx0ZWRfX/xRz8+FYejHo
 lpEJf64bOIyDevlG/FkYHK6NfUEsKWWKFcFOtQsYoEWjGPhGhqihVIv1wJHDbdhHIr//0rLxHyV
 JktTp9B6nvX3tNoeWWl9lVATHQUHjzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3NCBTYWx0ZWRfX55Ywidime2j6
 p0kJ29JEiv7rU+6VHhiYs/fYtH3485Uv+JOERAGuG488lP6OWV4Stx4QOIaz1vfwDnAx5J/9Mxz
 V9i7V8brF6d00kMoVY3+MC3FKe4DfzJggTCWVAPFuz0gl4TXOZueCTvmZTsL2tsqrEUDyNk8J1x
 qI6gJOGhpXYHeB4kMbSoMXW/APXNUbHrqBYZbawlvmhCrRCePju8p1lE4T9wYfoaPrdo7A1dRxO
 xSUBJBEB1abJbHPqFTVrLXvOE9VJUooYFZ2U3SNEe7edqsRJ+LfW9tcAh2nFGTmWwrcuhtpOsNH
 evEMXpMQrXytda/d+R41vf8rMkBMn+CgJp0yZO7LacNU4guYeRVzOwKH7v/3qWbP6Qf5SVrHzup
 FghnVz8nHKYkmkjE8ovn6ehMXO1FD6ZcaIuH8ZcA8576gP2RHmEjgWAidD4B5Xr0dolSBWFdTbI
 P1GsFM6XkHmZrnEV92w==
X-Proofpoint-ORIG-GUID: BJSNqJSrjt36nomykBxwr3BFuKamxfJf
X-Proofpoint-GUID: BJSNqJSrjt36nomykBxwr3BFuKamxfJf
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3a4e59 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=GtHFPjVsJ1z6j8OeKiQY1g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=YAGGjYiUH1UqZGlMsp0A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230074


On 6/11/2026 3:09 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 10, 2026 at 09:27:08PM +0530, Prasad Kumpatla wrote:
>> +};
>> +
>> +static void wsa885x_gpio_set(struct wsa885x_i2c_priv *wsa885x, bool val)
>> +{
>> +	if (!wsa885x || !wsa885x->sd_n)
> How wsa885x can be NULL?
>
> This wrapper is pointless. Avoid creating abstraction layers over single
> call to standard kernel interfaces.

Hi Krzysztof,

Thanks for reviewing and comments on patch.

Agree. The NULL check is unnecessary, and the helper does not add any 
meaningful abstraction.

I'll remove the wrapper and use the GPIO API directly in the next revision.

>
>> +		return;
>> +
>> +	gpiod_set_value_cansleep(wsa885x->sd_n, val);
>> +}
>> +
> ...
>
>> +
>> +static void wsa885x_gpio_powerdown(void *data)
>> +{
>> +	struct wsa885x_i2c_priv *wsa885x = data;
>> +
>> +	if (!wsa885x)
>> +		return;
> How is this possible?

No, I will remove all the unnecessary checks in the next version of patch.


>
>> +
>> +	wsa885x_gpio_set(wsa885x, true);
>> +}
>> +
> ...
>
>> +	if (count > 0) {
>> +		if (count % 2) {
>> +			dev_err(dev, "%s: Invalid number of elements in %s (%d)\n",
>> +				__func__, init_table_prop, count);
>> +			return -EINVAL;
>> +		}
>> +		if (count > WSA885X_INIT_TABLE_MAX_ITEMS) {
>> +			dev_err(dev, "%s: %s has too many elements (%d > %u)\n",
>> +				__func__, init_table_prop, count,
>> +				WSA885X_INIT_TABLE_MAX_ITEMS);
>> +			return -EINVAL;
>> +		}
>> +		wsa885x->init_table_size = count;
>> +
>> +		wsa885x->init_table = devm_kcalloc(dev, wsa885x->init_table_size,
>> +						   sizeof(*wsa885x->init_table), GFP_KERNEL);
>> +		if (!wsa885x->init_table)
>> +			return -ENOMEM;
>> +
>> +		if (device_property_read_u32_array(dev, init_table_prop,
>> +						   wsa885x->init_table,
>> +						   wsa885x->init_table_size)) {
>> +			dev_err(dev, "%s: Failed to read %s\n",
>> +				__func__, init_table_prop);
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	ret = device_property_read_u32(dev, "qcom,battery-config",
>> +				       &wsa885x->batt_conf);
>> +	if (ret) {
>> +		wsa885x->batt_conf = WSA885X_BATT_1S;
>> +	} else if (wsa885x->batt_conf != WSA885X_BATT_1S &&
>> +		   wsa885x->batt_conf != WSA885X_BATT_2S) {
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Invalid battery config %u (expected 1S or 2S)\n",
>> +				     wsa885x->batt_conf);
>> +	}
>> +
>> +	for (i = 0; i < WSA885X_SUPPLIES_NUM; i++)
>> +		wsa885x->supplies[i].supply = wsa885x_supply_name[i];
>> +
>> +	ret = devm_regulator_bulk_get(dev, WSA885X_SUPPLIES_NUM, wsa885x->supplies);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
>> +
>> +	ret = regulator_bulk_enable(WSA885X_SUPPLIES_NUM, wsa885x->supplies);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to enable regulators\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, wsa885x_regulator_disable, wsa885x);
> Why you cannot simply use devm_regulator_get_enable?
Ack, will use.
>
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
>> +
>> +	wsa885x->sd_n = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(wsa885x->sd_n))
>> +		return dev_err_probe(dev, PTR_ERR(wsa885x->sd_n),
>> +							 "Shutdown Control GPIO not found\n");
> Messed/misaligned indentation.
Ack, Will update
>
>> +
>> +	wsa885x_gpio_set(wsa885x, false);
>> +
>> +	ret = devm_add_action_or_reset(dev, wsa885x_gpio_powerdown, wsa885x);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
>> +
>> +	i2c_set_clientdata(client, wsa885x);
>> +
>> +	wsa885x->intr_pin = devm_gpiod_get(dev, "interrupt", GPIOD_IN);
>> +	if (IS_ERR(wsa885x->intr_pin))
>> +		return dev_err_probe(dev, PTR_ERR(wsa885x->intr_pin),
>> +							 "Interrupt GPIO not found\n");
>> +
>> +	ret = wsa885x_register_irq(wsa885x);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "wsa885x irq registration failed\n");
>> +
>> +	ret = devm_snd_soc_register_component(dev, component_driver,
>> +					      wsa885x_i2c_dai,
>> +					      ARRAY_SIZE(wsa885x_i2c_dai));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Codec component registration failed\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id wsa885x_i2c_dt_match[] = {
>> +	{
>> +		.compatible = "qcom,wsa885x-i2c",
>> +	},
>> +	{}
>> +};
>> +
>> +static const struct i2c_device_id wsa885x_id_i2c[] = {
>> +	{"wsa885x_i2c", 0},
> Used named initializers.
Ack, Will update
>
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(i2c, wsa885x_id_i2c);
>> +MODULE_DEVICE_TABLE(of, wsa885x_i2c_dt_match);
> Don't come with own coding style. Each above goes IMMEDIATELY after the table.

Agreed. I'll place each MODULE_DEVICE_TABLE() immediately after its 
associated table to match the existing kernel style.

Thanks,

Prasad


>
> Best regards,
> Krzysztof
>
