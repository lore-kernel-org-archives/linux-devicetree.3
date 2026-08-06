Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E66F40A934
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013548; cv=none; b=bTJHl3WhZC2AHGaaTB1LFVIsI01wd216sqna+NTjNNCkj9idg1ILxlslqqU4tDQYZ+u5odIrgbepNp0W3vHjxERI559dEmNa+S37Ei77A7iMo0lypiX2SB55vsy5fm+lhuMSOwYzZM2xGGpQGOMGeh6nS02Dy5ZbmNJyGyxiqeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013548; c=relaxed/simple;
	bh=tlTja6nbTiauvKmBRC89RbOJfEA1QZo/psktct0Oh4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDiT7G/id6r/Gw4HcUI09zLebODIiPFJbfxuLR0n47dIXNm1UhgfDxW5JfTRg/MzLSKlSUkEQBNyOd9+DJJTk89B7d4ZsdSgjI5BxrN1BW4SloBSdLA/Gg5uSjnpXQ0HnH6eu/K5Z46QWVUxHTbbDFuAr68jDNGu27ozgMOsNAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dl+J8mHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYH9KR7d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dl+J8mHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYH9KR7d"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhft1871354
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wLC3JrqPrga4mftfDdK7ZIOuX0Tj0HbnIJy7FTAR/o=; b=Dl+J8mHGVqFDuNNh
	S1U5wutZ432RAuGYiGIdX8n7RU0XrUSWmVr8noPgajWKO5i8eqc0ouZGcK4E4JuB
	md7oS4ky5MjJLDeZ20NH82dmicPHuGVI8sm1y91RpX4hktR0tX9rj3malX91ISwR
	VidU1XEZJ9akJ41etgLrOWEREpktdSHytTu59htI/zp+it6JBoZdwxtNc1Hi73Kc
	jdgMXilB57mpGp9o0aFK0MUuDSqo12RNt8DF29bPrWXwVaofEK9Z4WvxfQIckNJI
	n6NnZeNScElKaHeMdX9cJybF5pFDsOpcAsXN4qJWL8BG2YaYi5syLZp0XpyQJsm/
	AYhOuQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud1mr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:52:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so29810445ad.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786013544; x=1786618344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+wLC3JrqPrga4mftfDdK7ZIOuX0Tj0HbnIJy7FTAR/o=;
        b=cYH9KR7diWWHYEYD9PlWZycF0yj9vXYhEDgy45PVzHgxUXzG7lRTiQQKX2i37mMJSV
         dOne+8bLLxg5mlSZCQnNzZ3dea1AbwiNSW/suCPPFrn2dWUt3WGMLGhVI3kc9QYs1w+Y
         uyKkptPIKIZBbQ+KaMaX+TP7OOjHtMLhUnIfCkIziHZLL5IA8cnbeClqrFBc5pl998JS
         UCRXn8mP3KXIfplwyEBTMGOpDjdYnU3bPDN52wOYEqARelFgqKexsmAy2Y9KanVqj+Ze
         1O1fho1b09LrV0xTOFHwbv0K4NVPk/W1uWg6G8tLVHsbo3ssqYhOVuyLpmakWWdGgmt/
         oEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013544; x=1786618344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wLC3JrqPrga4mftfDdK7ZIOuX0Tj0HbnIJy7FTAR/o=;
        b=ETk3c9GA/YRZcb+LhLrKAzB26yCa3YM23PJ1b8w8+Lu38TJhqXQnnJoE3f5yxzKXtp
         GyvbojNoDPAyTLTLpoaJn92gBRu1yspVajVJAB0vu6QtorCACV8crR09tneQTMUZkJVx
         qWxfeaQs9Do/gsrEXNeFmun85Q2+rWD3WhUPle5460ofczE6CCAtz56LIQ78UnWhD55d
         2yKhitHE2hLL7AlzPQTSRwyEemd732C1wNS92O5k9lLAeFyslfocMz4gaMV1pSJBUAxe
         b+cxEOO7qEL/tw/v7QCcWw2rrxjvrqJrqVRb5jetYneCS0S8NIYiuDPzfBJcIKBUMhWo
         c/7g==
X-Forwarded-Encrypted: i=1; AHgh+RqJ/IhxoB6i6IKoOw8kQGCmWbuB2bM4bCEuFACJbh4x0LapVejC7yzstsO6HVdEPED3Sf+DZ8G0KL7X@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgs9NEBp/AGIDqqka8kL71SH3EBtcPfiEqMDPDxL/S9FEQ00i
	7PTxyDMtQfAmgn8x40+PrO3oaONvHS3rRuOK2qTw3JDV7FGR0kTMuano9mDs6KbIIVLzeyKTGTm
	3tpoAi/xEP+oW6mqBfdYApUPwfk1gzw9YFXnuuU1g5y421IRAXXcgfqhWS7jKkAu+
X-Gm-Gg: AR+sD12/CwX58UQopXpZBCtIQqDE3iI6AUWQVZ/obl/KkQw9t0hcBqZHQ6Mxp6KoHD7
	zUnuzH6mWkygk++qR+qyX/Eev/x263WjonOpeuRfbrbdpy/NlzTxba6l0jS72jcdLUNkjKLkhso
	nqGxf4ylTRftcVbAuLQWdm9YdtEEIWDrl6/VV/gw55WQQlNIj7srdqq5ePjXMhbmuNnFPqvTcPW
	5dZvFY5Db7lDvrQ40rkvqnUutQSuLxMLp4ZUts7TTZ01IOc8vRXQ8dLTLExXE8WK6t2W1zSMgdQ
	1hmi8/c7ZLmTRZhQY58GYOSUbFbpYU5unFOdokPZEa0pZ9Bx1pgWM0QLgiOJwtCJfddUi//dqw9
	pTXl10+VMWkdwW1M3JFLNv8hhJM+0V1A5
X-Received: by 2002:a17:902:d581:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d0ca75b37cmr176329785ad.11.1786013543834;
        Thu, 06 Aug 2026 03:52:23 -0700 (PDT)
X-Received: by 2002:a17:902:d581:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d0ca75b37cmr176329365ad.11.1786013543359;
        Thu, 06 Aug 2026 03:52:23 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4930e1sm29469905ad.41.2026.08.06.03.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:52:22 -0700 (PDT)
Message-ID: <a98d90bd-aa9d-4af3-aa54-3a34300070d4@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 16:22:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] iio: adc: qcom-spmi-adc5-gen3: Add support for QCOM
 PMIC5 Gen4 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-2-9c49b2eea6f9@oss.qualcomm.com>
 <20260803011400.1fb6c93a@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260803011400.1fb6c93a@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfXyvTah2VBQE+h
 qG5kRFurHb1GtRFjgDkywn9cL6jSlWrfpbyD/cOHKQhUHTV1yKVzGjTRYAbWkcT443qXVgQzSk0
 YEX/YoBGoyyAoHH9enFlae0X5fgzEOCsDusYMGY+8UVi8nxzUPTk08UvbsEnWs1Q3xSdm2DZIC3
 2Lj+FZCdZ9PjRZgnl54ynEvSDOkn6FpiPPl65t36NynH4xgAfhAOlCqHn7mEBHueAkgXvw4z4WJ
 hzpauzZPcuhYIP0E4mniyC40Hlqk25FZqWwS6LZEUNu4wR5GDcPWRJxHuJyTcBVDzU5k2sVY1uX
 zpRpIoj8cuPdFZW+mgrNMoekhRlbQBIltaf7ijOzTZ0ZTZZ3Py9bpuVzJiIKIglaRuJG/yU/XkK
 4rAT1mKqwG/IPKbK3QEiQMT40GnYwYF1RRNopEZu5d/KLu9kOYxkvcYZYk7crqo+fNxwEkLxy4Z
 E0jkm7mPyr3W0KHQV0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX6pNzGoicqDtt
 /DhH1OYE9GNMvWfOTYEtRC079gubyMtYmvl2n6Z0bdQTMLyELw/1sIaAcbbxVdBOMBcyPmezue4
 jQUSaxgFUuu6sDDRk5+oTt7OAvGCMjc=
X-Proofpoint-GUID: 1wYSci4xdAM_JlRNZEc0iALZ7zuJ8lru
X-Proofpoint-ORIG-GUID: 1wYSci4xdAM_JlRNZEc0iALZ7zuJ8lru
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a746768 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sIB6b2e8xc4MCbZFZ_AA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060085

Hi Jonathan,

On 8/3/2026 5:44 AM, Jonathan Cameron wrote:
> On Fri, 31 Jul 2026 23:36:15 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made
>> for improved performance, mostly at the hardware level.
>>
>> One significant software change is that ratiometric conversion resolution
>> has been increased from 14 bits to 16 bits, so the maximum value of
>> these measurements needs to be updated for Gen4. Add a new scaling
>> function for thermistor channels which use this type of conversion.
>>
>> In the latest PMIC arbiter version (v8), there can be up to 4 buses
>> under the PMIC arbiter and 32 PMICs under each bus. In order to
>> support communication between ADC on the master PMIC and ADCs on any
>> of the other PMICs, a field of width 2 bits is added for bus index
>> and the bits for SID are extended from 4 to 5 bits, in the SID
>> register. Add support for this.
>>
>> In addition, it is possible that the master PMIC has ADC of one generation
>> and it needs to communicate with another PMIC with ADC of a different
>> generation.
> 
> "Possible" sounds a bit hypothetical.  Can we state this actually happens
> on some devices?

Considering existing upstream platforms, this is applicable for SM8750. I'll
mention this in the next version of the series.

> 
>> Add new DT properties "qcom,adc5-gen3" and "qcom,adc5-gen4",
>> to distinguish Gen3 channels under a Gen4 master and Gen4 channels
>> under a Gen3 master respectively, to ensure that their conversions are handled
> 
> This line got a bit long. Wrap at 75 chars for commit message.
> 
>> correctly.
>>
>> Co-developed-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  drivers/iio/adc/qcom-spmi-adc5-gen3.c         | 165 +++++++++++++++++++-------
>>  drivers/iio/adc/qcom-vadc-common.c            |  32 +++++
>>  include/linux/iio/adc/qcom-adc5-gen3-common.h |  44 ++++++-
>>  include/linux/iio/adc/qcom-vadc-common.h      |   4 +
>>  4 files changed, 195 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
>> index c68c6c5f6aca..810d25b665b1 100644
>> --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
>> +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
>> @@ -86,7 +86,9 @@ int adc5_gen3_write(struct adc5_device_data *adc, unsigned int sdam_index,
>>  }
>>  EXPORT_SYMBOL_NS_GPL(adc5_gen3_write, "QCOM_SPMI_ADC5_GEN3");
>>  
>> -static int adc5_gen3_read_voltage_data(struct adc5_chip *adc, u16 *data)
>> +static int adc5_gen3_read_voltage_data(struct adc5_chip *adc,
>> +				       struct adc5_channel_common_prop *prop,
>> +				       u16 *data)
>>  {
>>  	u8 rslt[2];
>>  	int ret;
>> @@ -99,8 +101,10 @@ static int adc5_gen3_read_voltage_data(struct adc5_chip *adc, u16 *data)
>>  	*data = get_unaligned_le16(rslt);
>>  
>>  	if (*data == ADC5_USR_DATA_CHECK) {
> This feels backwards.   We first check for the top bit being
> set then check whether we care if it is set or not.  I think
> checking if we should look at it first makes more sense.  Also
> shorter max line length:
> 
> 	if (!(prop->generation == ADC5_GEN4 && prop->cal_method == ADC5_RATIOMETRIC_CAL)) {
> 		if (*data == ADC5_USR_DATA_CHECK) {
> 	...	

I thought it was more efficient to have the check like this because
there may be several channels satisfying the longer if() check for Gen4
ratiometric channels, but the chance of *data being exactly equal to
the error value ADC5_USR_DATA_CHECK is lower generally. So if I reverse
the checks as you suggested, the outer if() check would pass for every
read done on a channel which is not both Gen4 and ratiometric, which
seems inefficient for an error check.

What do you think, should I make any changes here?


> 
>>  
>> +static const struct adc5_channels adc5_gen4_chans_pmic[ADC5_MAX_CHANNEL] = {
>> +	[ADC5_GEN4_OFFSET_REF]		= ADC5_CHAN_VOLT(0,
>> +						SCALE_HW_CALIB_DEFAULT)
> 
> Probably just go long on these lines and I'm not sure there is enough benefit to
> forcing the alignment though if you really want to it will be more useful with
> them on a single line.

Sure, I'll keep these on single lines.

> 
> 	[ADC5_GEN4_OFFSET_REF] = ADC5_CHAN_VOLT(0, SCALE_HW_CALIB_DEFAULT)
> ...
> 
> 	[ADC5_GEN4_AMUX5_GPIO_100K_PU] = ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
> 
> Obviously it has been there a while, but having the comma inside ADC_CHAN() macro
> ends up making this look a little odd.
> 
> 
>> +	[ADC5_GEN4_1P25VREF]		= ADC5_CHAN_VOLT(0,
>> +						SCALE_HW_CALIB_DEFAULT)
>> +	[ADC5_GEN4_VPH_PWR]		= ADC5_CHAN_VOLT(1,
> 
>> +
>> +static const struct of_device_id adc5_match_table[] = {
>> +	{
>> +		.compatible = "qcom,spmi-adc5-gen3",
>> +		.data = &adc5_gen3_data_pmic,
>> +	},
>> +	{
>> +		.compatible = "qcom,spmi-adc5-gen4",
>> +		.data = &adc5_gen4_data_pmic,
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, adc5_match_table);
> 
> Why has this moved?  I'm not seeing any new references to adc5_match_table
> before where it was before.

I think I moved it with the adc5_data structs by mistake, I'll
move it back.

> 
>> diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-vadc-common.c
>> index b03cf584b165..cb23d0d178c7 100644
>> --- a/drivers/iio/adc/qcom-vadc-common.c
>> +++ b/drivers/iio/adc/qcom-vadc-common.c
> 
>> @@ -341,6 +345,8 @@ static const struct qcom_adc5_scale_type scale_adc5_fn[] = {
>>  					qcom_vadc7_scale_hw_calib_die_temp},
>>  	[SCALE_HW_CALIB_PM5_CHG_TEMP] = {qcom_vadc_scale_hw_chg5_temp},
>>  	[SCALE_HW_CALIB_PM5_SMB_TEMP] = {qcom_vadc_scale_hw_smb_temp},
>> +	[SCALE_HW_CALIB_THERM_100K_PU_GEN4] = {
>> +					qcom_adc5_gen4_scale_hw_calib_therm},
> 
> I don't mind if you want to go a little past 80 chars to avoid doing this sort
> of line break that just makes things harder to read.
> 
>>  };
>>  
>>  static int qcom_vadc_map_voltage_temp(const struct vadc_map_pt *pts,
>> @@ -556,6 +562,32 @@ static int qcom_vadc7_scale_hw_calib_therm(
>>  	return 0;
>>  }
>>  
>> +static int qcom_adc5_gen4_scale_hw_calib_therm(
>> +				const struct u32_fract *prescale,
>> +				const struct adc5_data *data,
>> +				u16 adc_code, int *result_mdec)
>> +{
>> +	s64 resistance = adc_code;
>> +	int ret, result;
>> +
>> +	if (adc_code >= RATIO_MAX_ADC5_GEN4)
>> +		return -EINVAL;
>> +
>> +	/* (ADC code * R_PULLUP (100Kohm)) / (full_scale_code - ADC code)*/
>> +	resistance *= R_PU_100K;
>> +	resistance = div64_s64(resistance, RATIO_MAX_ADC5_GEN4 - adc_code);
>> +
>> +	ret = qcom_vadc_map_voltage_temp(adcmap7_100k,
>> +					 ARRAY_SIZE(adcmap7_100k),
>> +					 resistance, &result);
> 
> 	ret = qcom_vadc_map_voltage_temp(adcmap7_100k, ARRAY_SIZE(adcmap7_100k),
> 					 resistance, &result);
> 
> is under 80 chars anyway. 
> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	*result_mdec = result;
>> +
>> +	return 0;
>> +}
>> +
>>  static int qcom_vadc_scale_hw_calib_volt(
>>  				const struct u32_fract *prescale,
>>  				const struct adc5_data *data,
>> diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
>> index 39cbfcbdb101..5d8e38350827 100644
>> --- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
>> +++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
>> @@ -40,7 +40,8 @@
>>  
>> +enum adc_generation {
>> +	ADC5_GEN3 = 0,
> 
> Does the value matter anywhere?  If not just leave it unspecified.
> If it does matter because it actually gets written to hardware somewhere
> I'm missing then set GEN4 as well.

It looks like the value does not really matter, I'll
leave it unspecified.

I'll also address your other comments in the next patch series.

Thanks,
Jishnu


> 
>> +	ADC5_GEN4,
>> +};
>> +
> 
> Thanks,
> 
> Jonathan

