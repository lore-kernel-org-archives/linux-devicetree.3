Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893EB3B71C2
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605562; cv=none; b=A0H5/LWEWPwwYgMnkCUCsrG+7T3Es53AmjOTGANOEIdRuPT3XgfWu6BFs6QDUinQD6vBlMlNAFamZaPap+vKLU/gDuFwNM3WcxZ+4T/49UURgb5y88E6B5OkUVwItsNhGtjROobD2ysdsR/zxO2D9hunmOXLeprNVJoV5BKuyYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605562; c=relaxed/simple;
	bh=rBQrkdlLxu+sHScrpiOHOcI8isRa+CD1qTLn1K7LBaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iN5Y9bR67jQCRx5tQm/7CObOxL0m+W5BfEdIba5ijn9xtg0EBqHwSaV4YJdDXozLnLv0s57V/yDcKKJK4rGKdyBqbCzqSo6/dGytXzzENQNYcQizJlVcF0AXArQYn8xDyPvUZLQbWQxGYYQDW+gwLkVAcZ1o1TqLHmjJURMsu54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O69xuHOT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGVd0rK0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O69xuHOT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGVd0rK0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACWRm3474774
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7V7D596VKMgblFH1E6kjqVU3QLyINlDY8eH+KpidKYc=; b=O69xuHOTQ5mv4r2n
	LNZYoiBf88oVrj0g6nTrb330YMVO0hLNDsYgSW1DeDRixLjVs5tHFqb69pSBUO5P
	oFF+4ENAr7avI8h7CvI/UFQbFKxewyfhJKfhGLbvKfkqLvg0K87+PNNtArnkeMX9
	067u71zi6x8bBnqWNEfs4skrJuBJF1kwI1653P2UPMu5IzBF9xUcC+PBwRHFg41W
	6p64WwGDCieofF61hZ/P7RePwF0dazOELPt/3IX3uwnzE4RUPODUF5123+c73Id9
	Na5i3MEUHmG4otKAAVz95WrPgTGD4LtRnWWq+10ZHDG3MPQvVlVT+Ta2L3QAbOp5
	HNPdug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52sgax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:25:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51757324dcdso6597751cf.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605559; x=1782210359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7V7D596VKMgblFH1E6kjqVU3QLyINlDY8eH+KpidKYc=;
        b=fGVd0rK0D+Liyww9SF3LNti9iaslXkdL0M0DyCwPjSmhr2qHZ3Z0V/lxFiOv7jq4W3
         FRU+zn6UF9krOrMb8KqgWTJKjn6PZQEyNRKt8dfhZT+7twRylXwgxQpt2LdZ3t9+ltwG
         +mxYBJXo98VA1iLAgT4Z255QTemfKQBKimxXjJtmT2KCjV1zX7hkBgS4IBpn/+wi/lef
         9AvIWFH0EmcPoS0Wrh9+ZlOp0X+BknqPfT421ydOvGmaWcW2JEYysLnOkaPimlQi2dfp
         e61qqAlbKLRO0SasDxPAxed7fbvkWEmVhMtIXyzVdlaGWyQaMf1IHVG8wnpfGghkI5os
         e+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605559; x=1782210359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V7D596VKMgblFH1E6kjqVU3QLyINlDY8eH+KpidKYc=;
        b=IQsl9qrYO80jSqLErw41n+rXYMwGW9bSUGDmcB+HWP2YSBjgJRz9TsZ0dUUmW5gUqi
         1VF8LbLvmiyp9rXJSmP0FsSh3VsjQI2ZzohAcqwvIsOoNjvpWxKTJPFmxkotY3soV3aP
         JNv5mUFWTNoZ8gb6pJP6HchkI1ILwUqi8a/YZM1av/0klNxnKhWWPnHREw14OZ6NRB6E
         zLn+s7l3Ri24dl/n1a46XVNA6q92xkX0/duKtnZihwKvvJvx3Yr3s5CCyGJenJYca2p/
         34gx+ZYWN6p8Wix6663QOAa0ZlgT2UkOotcr0tfVw9AImOPdHjxUIMxfOiXx/2MOrA+M
         pkyA==
X-Forwarded-Encrypted: i=1; AFNElJ9Q7ITreWccOc7Z+3Fr1HFKlbvhvhlsSwmzUrwbpA+A+oYjt7hQfTjKywwJXMH4oSwEWiA8mo9b6JPP@vger.kernel.org
X-Gm-Message-State: AOJu0YyBNM0620+7ItRIiW0mY9Rjn/j7VnqyhrHan77gUfMoh30MXzss
	iavYA9+EdR36QifVs8V1vEC97CohKBdIbKRQIpXASp9YHJwWfxAYgbeo7q8LwW+1kpGxqjdFhBu
	cAe2Y5v/JG0cakcp1qgGuZqf+aHk05H6Ss2t/SmCT9+UIEhGRIxq01/xu+I5GLCfv
X-Gm-Gg: Acq92OHlrH2S0zBZ1Bwv0V5qaJuVkzI51SGiQcOTZgGgguLtr8m7X60qnFzpXl/Dsi3
	FfPQPOz/zlLYkduDVSKlYSYOKavZaYb4IxS3b13YbVS4RZ9g8f+NwcVu8NHfdiTiKqBoCtFc5hp
	P0+/4tpUN5bmZQUkoZaO5dTvwKyCU9piD56v9/duQBH0WH0UoJYxduTpSFBA2vKywlX+QmMyH1K
	vpVdmVctFYlzOGvvDETeu/fbJtyq6gh1D5jPfoAAhRremjY9is7otTCR5477M8rk27pb5jad7Jr
	oCfI7N4owfjGZa0zDLhxXac6hBCw/ClVyIV5+p/PIBUYx16k+sN1AthVkBnaShKo41Uv0NZAYA6
	EInu1BYBVfZQAFl6YnETPCxBaqamuKxlQdHjfomxyezMnRw==
X-Received: by 2002:ac8:5f06:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-517fe242998mr177623931cf.2.1781605558867;
        Tue, 16 Jun 2026 03:25:58 -0700 (PDT)
X-Received: by 2002:ac8:5f06:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-517fe242998mr177623691cf.2.1781605558432;
        Tue, 16 Jun 2026 03:25:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949fb19sm4637499a12.27.2026.06.16.03.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:25:57 -0700 (PDT)
Message-ID: <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:25:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX4OZnyUBlu0ay
 W+muhSxPDPKctOt3pKFrS7pfBWWzyQagxkrI/HB4ByCeOpbOigLikUgC8hrkOUYH0XvaNOTpALD
 ooNInjaqlxjKq/W0fWq4ymN6ySBAwG0=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a3124b7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ana-416hF8iW2EXVXAIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX5NxsskmbcKyu
 eEqofDwcr11/Pq5y6PDtINngWpo++b42YTtVdGxMWzf/8ze3VKg65wChHZEUCGYSiunEk80bwWN
 xrPZ8pqaupaLeVGrUEg9p2sRnht5sS0f25xa2ch2qHDdFHjaWP23+ISzbnwQPRBellfd41b/bOM
 Dehoj4N6u7ZFv2djZJaoM9ex7TaK47XqgN20/qnMabZ+02S+Iu+I+Iwt5oEnD3KnSnmIpkFYuVA
 UDH5DB70bQEA4jSy/BzkIl8cAv26+pLWlkDiD7EwV9hWwxY7hZDGUMfUB9mFRU6Rvflai3Uh4vZ
 2Ah7Bapf15yMh9o56dPVTi6zUBemto0P6qulKjgX1TB09OGDkgqV2/St8youFIVhyL3CwK4+Y3B
 4FqP7lJC52XJPFoEnFqo2sy/nEg06K5D4jpYk9qxAyBwEMXGGQvhBTqgP2ppj2bbVvaT3AhkFr+
 /2rFkym7YaEar7CGyYg==
X-Proofpoint-ORIG-GUID: W8Toxtk8Qdt4frZDQfT_q1VptPYuHmAY
X-Proofpoint-GUID: W8Toxtk8Qdt4frZDQfT_q1VptPYuHmAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160105

On 6/16/26 12:08 PM, Fenglin Wu wrote:
> Add an initial driver for the Qualcomm PMIH010x PMIC haptics module,
> named as HAP530_HV. This module supports several play modes, including
> DIRECT_PLAY, FIFO, PAT_MEM, and SWR, each with distinct data sourcing
> and hardware data handling logic. Currently, the driver provides support
> for two play modes using the input force-feedback framework: FF_CONSTANT
> effect for DIRECT_PLAY mode and FF_PERIODIC effect with FF_CUSTOM
> waveform for FIFO mode.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

[...]

> +static int cfg_write(struct qcom_haptics *h, u32 off, u32 val)

static inline

although I have mixed feelings about having so many accessors

[...]

> +static int haptics_write_fifo_chunk(struct qcom_haptics *h,
> +				    const s8 *data, u32 len)
> +{
> +	u32 i, bulk_len = ALIGN_DOWN(len, 4);

Please avoid mixing multiple declarations and assignments

> +	int ret;
> +
> +	for (i = 0; i < bulk_len; i += 4) {

You can do 'int i' in loops nowadays

> +		ret = ptn_bulk_write(h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (; i < len; i++) {
> +		ret = ptn_write(h, HAP_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
> +		if (ret)
> +			return ret;
> +	}

So if i'm reading this right, the first loop will always write
4*(len//4) bytes and the second one will be entered at most once,
to write len rem 4 bytes.. should this be an if instead?

> +
> +	return 0;
> +}
> +
> +/*
> + * Configure the hardware FIFO memory boundary.
> + * FIFO occupies addresses [0, fifo_len).
> + */
> +static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
> +{
> +	u32 fifo_len, fifo_units;
> +
> +	/* Config all memory space for FIFO usage for now */

What's the not-"for now" endgame for this?

> +	fifo_len = HAP530_MEM_TOTAL_BYTES;
> +	fifo_len = ALIGN_DOWN(fifo_len, 64);
> +	fifo_units = fifo_len / 64;
> +	h->fifo_len = fifo_len;
> +
> +	return ptn_write(h, HAP_PTN_MMAP_FIFO_REG,
> +			 MMAP_FIFO_EXIST_BIT |
> +			 FIELD_PREP(MMAP_FIFO_LEN_MASK, fifo_units - 1));
> +}
> +
> +static u32 haptics_gain_scaled_vmax(struct qcom_haptics *h, u32 vmax_mv)
> +{
> +	u32 v = (u32)((u64)vmax_mv * h->gain / 0xFFFF);

mult_frac()

> +
> +	return max_t(u32, v, VMAX_STEP_MV);
> +}
> +
> +static void haptics_fifo_irq_enable(struct qcom_haptics *h, bool enable)
> +{
> +	if (h->irq_enabled == enable)
> +		return;
> +
> +	if (enable)
> +		enable_irq(h->fifo_empty_irq);
> +	else
> +		disable_irq_nosync(h->fifo_empty_irq);

This is called in the .remove() path, I think you may need the
sync variant as the underlying device may be destroyed before the
ISR completes if there's a late interrupt


[...]

> +static int haptics_playback(struct input_dev *dev, int effect_id, int val)
> +{
> +	struct qcom_haptics *h = input_get_drvdata(dev);
> +
> +	h->cur_effect_id = effect_id;
> +	h->play_request  = (val > 0);
> +	schedule_work(&h->play_work);
> +	return 0;

nit: \n before return is 'nice'

[...]

> +	ret = device_property_read_u32_array(&pdev->dev, "reg", regs,
> +					     ARRAY_SIZE(regs));

Here you use device_property_

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to read 'reg' property\n");
> +
> +	h->cfg_base = regs[0];
> +	h->ptn_base = regs[1];
> +
> +	ret = of_property_read_u32(h->dev->of_node, "qcom,lra-period-us",
> +				   &h->t_lra_us);

And here you use of_property_ (please use device_)

[...]

> +	input->name     = "qcom-spmi-haptics";

Odd whitespace

Konrad
