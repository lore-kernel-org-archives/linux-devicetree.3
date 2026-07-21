Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D683E49C8
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651037; cv=none; b=lusrl9B/2WOTXKtssighSvh5CmK4ZJ16jrAMXuGZdA8BApzhq157NyxZSoSDyS6srzV4icXmOuebQZB87Ej2ZQIhFmdR8Tl98c6O0psZm7aeWfYf8RzeIDTl7LIiOHR5LLGNswP8OkEz4IaO3IiE1zHmsRTNnNruBOPhjil27Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651037; c=relaxed/simple;
	bh=O4wVnhMMQ+uaPI8Kv6KE57gAovQRnopHFObePh6Lvsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffcN7+hQe3gkUNNvAtO9AmWjvPWEaHisd+c8dIKq0NSQ3Y/4u0bMtuL0+VLaQ9tdJQFDRYHitmSe8Hln5RfIFwRELP7kv7N6450lbfRyG/shmZFQ9wLd58lcxDSWpxdp7gcdJVWWbmWQrNScD1JzhUe5JuLo+Ij7KQ2vnUCTXGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAz59KR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GO8FkbJq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAz59KR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GO8FkbJq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg7V91939379
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5oelxBd3zAgbhAM2GaaqJvi+znKFiv1xjAU+wGxpDo=; b=XAz59KR6aO4QANKv
	q0to/Q5mIShemq5pKb4ArAImK3AP6ctMJYGMICTTUp8Z0gcCdV4nVvBCnntjITkc
	1Mmv9cbqx7igAHe5s1U5hP1WWB+KlSlWQE7Xg9SThyZEQf98KAzaiOfqi+bTJi9r
	OAEFAO26F2lQNyr8fFueoXqRi2VOq/BqdPPgtyiksmK0bf43wTGwmjp+amc1oLpx
	LqvCQHRnrvcQ7Gp6hqsfq/FjbuG8FC+CvuI7o5ACZ9vwb9l58QOy8P3YpCZE1dvR
	f1Ds9rYRXWaD4vpv3iRKaZltCLsQB6QAHYfggolT1uf1+AUQiBi+TypW+GIxRAIe
	rV285Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs8ysh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:23:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so1563691a12.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784651034; x=1785255834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5oelxBd3zAgbhAM2GaaqJvi+znKFiv1xjAU+wGxpDo=;
        b=GO8FkbJqaImuFq3dxmIIrO7vPv0Izh5s9LH/n8HlZNFAYHWrXWLEfXbEkEy3MkltaN
         F5PfaAwcjONN0zkd3DLRqk7oKqnNlMqRbTrFCvYhCQ6pwicCTWw9NrUKUNk3yNapW2Tw
         8zcuhnaWvjUsgv+1j4QpeYqXztSRBPtCj8Hc5dC569Azb21Yovdei4Xrxo1rA15ul6PK
         bgSIhZqQqRMZ/rDc6Ui9ymDkX8NUldIobMq5GpKkeuUahgpOueOpHXZyUnmTZPEyl3Xr
         URTMsGXB5Y1MFBj6PAXHGr5UvEioU4c75M+35OEx1r5jOo16STePMD9c6QhEQkT/UTtC
         1K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651034; x=1785255834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5oelxBd3zAgbhAM2GaaqJvi+znKFiv1xjAU+wGxpDo=;
        b=B1vIRLGjnTz6NVY1ANvqhEuh9d7yRPn3Oqkfm8ZHRSHGcc1qqYpCR96vargi0WLwUh
         PQ3REoVMPfppObdABiYy21ncNSIauzJCscJ3s5Qqe0d9OvWrLXj4VQd6mEt7M3u98tCq
         wsRfo2PCiV75z2zXpFMjUwNg+IX4RMgwbJMTX3INEjwV+G46qpT9hKUrK8E2oQONWT4u
         A1qWOW968Qsw0hx9CXanzCbVsCSTqDmcZSG094D+V70AmtW3vGo+Pc/b9dGN6ZpO61Rv
         Jth0nqkg3X04/wKRPaYiZF58Ft6ihUrm07zN8bt4lkxQxNQvPk9QWyC2HpAygPnyBjhC
         INfw==
X-Forwarded-Encrypted: i=1; AHgh+Rpm6vPZC+l8yHL5ndU6cYzD9MQHRxEF7iVujAtXfPgI1VIp7FJgi+z602h4zojdbpXBL2mYS4Q3Ump3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2bwF1RdGvY9JYwrHvyzS6OmmXGRBMVS5HmGIngGLQWXlpkYIU
	amlW+09FmnMFkyKhpxBmJp/N9d5xOz8u1/JuT/YocFQccZ6VcruabtgiptUQ9/iaQkDDBdwdny5
	U15LcQEseMGkwfSkf6ur6sJeGFe0D/Y7TXJDraNK9PZjy0mYKdnKrXN8iHSjwiPsF
X-Gm-Gg: AfdE7cm4XzqutaS0bgzjqROkDNbkO3agBpwVk1RpvYfGTT76PVSNEKeMmsOxpD/kZGa
	jvkJMluqTs+J+q1YJJ3A1WoJtYQe0pyCKg+1weQrjwdyfpS26wjA5eyfPHrHXfz30aHm6BWha9q
	nq9rVv7YkcQlPjUuF7c1Ql7AQHnee1+AjOvJp+ZErBR0lhFZDK6Cu5Z7QgPZV0m9UweCzENuv5x
	xmZvqHKCc/7el1S7or4GTk1MGK3UhtshOVzdNp/kCIE/xKpl6JuXdw7q4ZsNI36swkrEUtYsVdq
	H3mx/6mNHhoXIudmltipJV5g9OoVWKLBttjOiD9R/bZBsihjSYusm3wm1UfUvnsFPQLNHdoA/CG
	AEoZHNiwDuwBo28cAyvp/XlivmOqtNuKz
X-Received: by 2002:a05:6a21:2c11:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c3ada36c4fmr21416068637.76.1784651034380;
        Tue, 21 Jul 2026 09:23:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c11:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c3ada36c4fmr21416036637.76.1784651033819;
        Tue, 21 Jul 2026 09:23:53 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm347633eec.25.2026.07.21.09.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:23:53 -0700 (PDT)
Message-ID: <2323abe7-ecd3-4504-8790-ef1a2dacec8f@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:53:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
 <5d213d08-8e00-4e7e-93ae-ba05f22f09e7@oss.qualcomm.com>
 <CAO9ioeW3y0ck2k3H2XK4W7z6YCFO6nuENN6=SmKxjQjNUNKWPw@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAO9ioeW3y0ck2k3H2XK4W7z6YCFO6nuENN6=SmKxjQjNUNKWPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uM0mTmXm_Tj4uxAJxR0RwUutEMwF7prz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3MyBTYWx0ZWRfX4yQkE4MG83vL
 du+hKjDr/VCNQliZUSxPmWNF6U7FEgDWbvrEAXwQD//iJvB5l0c4FPrQcu4KnOuS9yjtrg9ES8L
 t6SEdTJCumiut7stnv2HwORWbD1LlpE6V04l3iGbKceY6c82OET6hNjyZJnQIaFC5bYOA8AsNDT
 wdIGdFn9kBFItbjCODiiX8kUh+2DA1bUGTOvZZhAZ38b/e70KbFwTD16/h2OKWZ/zo01wHYAEpb
 FPx64drP6ABCA/AMtiGfV0SQ0HAtMNKOGR0XcFZ4WUjKgZ4wMung3iFYKLHaidp/2nVS6YXFurj
 vU91UMh0AULggiWBuWYJeaoc9TpQKvqJLsyxiD2GaPZHbt6mdEZw9DbaSYzOhEzRXaEuNT0HmLV
 DMJPd0mb9auSs9eB+IAeiNtF3EwLAwMyum5IXvfsHecC36byDCJybVFqdC/9v7Mapl1Mbr0q1Oj
 pwbbYLthUci1VPqU3AA==
X-Proofpoint-GUID: uM0mTmXm_Tj4uxAJxR0RwUutEMwF7prz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3MyBTYWx0ZWRfX5C+UUo1rT/9y
 vzaL3wxAkj34UWJgd45mFp8Tb6smrB/WEKy9Jse6jg8Hvmfz6FOyHecOikC3OpEcRQrFr3yJa8w
 AkCJ5tudERcLhhavPzZXDtE98itSDcQ=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f9d1b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fu1g7sk19LlnXAIAUm0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210173


On 7/21/2026 8:34 PM, Dmitry Baryshkov wrote:
> On Tue, 21 Jul 2026 at 17:08, Vikash Garodia
> <vikash.garodia@oss.qualcomm.com> wrote:
>>
>>
>> On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
>>> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>
>>> The raw formats supported by Iris were previously advertised
>>> unconditionally, assuming UBWC support on all platforms. However, some
>>> platforms do not support UBWC which results in incorrect format
>>> capability exposure.
>>>
>>> Use the UBWC configuration provided by the platform to dynamically
>>> filter raw formats at runtime. If UBWC is not supported, UBWC-based
>>> formats are omitted from the advertised capability list, while linear
>>> formats remain available.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
>>>    drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
>>>    2 files changed, 43 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> index 4c8bc7aac135..9fee5f28097d 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -3,6 +3,7 @@
>>>     * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>     */
>>>
>>> +#include <linux/soc/qcom/ubwc.h>
>>>    #include <media/v4l2-event.h>
>>>    #include <media/v4l2-mem2mem.h>
>>>
>>> @@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
>>>        V4L2_PIX_FMT_QC10C,
>>>    };
>>>
>>> +static const u32 iris_vdec_formats_noubwc_cap[] = {
>>> +     V4L2_PIX_FMT_NV12,
>>> +     V4L2_PIX_FMT_P010,
>>> +};
>>> +
>>>    static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>>    {
>>> +     const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>>>        unsigned int size, i;
>>>        const u32 *fmt;
>>>
>>> @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>>                size = inst->core->iris_platform_data->inst_iris_fmts_size;
>>>                break;
>>>        case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>>> -             fmt = iris_vdec_formats_cap;
>>> -             size = ARRAY_SIZE(iris_vdec_formats_cap);
>>> +             if (ubwc->ubwc_enc_version) {
>>
>> Do you see a possibility that ubwc is enabled for a SOC while VPU
>> hardware does not support UBWC. IP document for qcom,qcm2290 lists some
>> UBWC configuration, while VPU does not support UBWC. Not sure at this
>> point if other blocks indeed support UBWC for qcom,qcm2290.
> 
> No, QCM2290 doesn't really support UBWC between the IP cores (as such
> it has ubwc_enc_version = 0).
> Currently the database defines a least common denominator for all IP
> cores. If we ever get to a point where we want to define UBWC params
> per the core, we will need to restructure the database.
> 

Ack.

