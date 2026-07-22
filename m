Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1550D1C01
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699676; cv=none; b=G7PALIKoCspQeWQ1kfK0EjNTjoja7poAbz8fjdg7XR7fKSktHuMD2W41gBq4rm0ksBNN+h4oJFBVDN0eUMQDcLCSaBSpYr4L4OIG6KSrkOWknROV26PSF9Ut5Pq7ZCZNYgbEwIf/Y/267fJov0ibpoeVO0Wg9VslbUSQmNxY23Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699676; c=relaxed/simple;
	bh=coIzcvjb5ugtfK8437kbcjC7ap5uoz1cbPxQzWjRx4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQ6JJfcmVILowNG4qTzYOMxMwKJ4l0jlB8sSsjYYrKh0PY864NBGN3V0Nv5ZRYba4G+U2nGudcLIn3mGyNhEjGtBx27AD1qe07xSOPcNpNbG+ukXTzmd6LkWcbqaDrL1RnwHGuacdvQ8ZmlASnPUMCpGDrbfCRsK7s3ITUxT28M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDcw0KjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfYIdDq6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDcw0KjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfYIdDq6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M5487s4027826
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vULQwCAmlohXfO2djgyMjy/psAkw3bTqxi1rFQrNtZE=; b=CDcw0KjESN4QgTAM
	iyKOHB7Yj4nWkKKS2108Zbt7nuWXFUj8yzRUWZ2EzPyElrmFpXy9B6IHYfn8t17y
	Yz0RpRe3Oj2o+8b8P8BObC+SOoIvboN0SH/7ekT4eGXV2wnHiAkq/4zsrVPwuJ6+
	GXoPKAdTyzCx9gDLdOAtsTm5NT67ZVVcJCGBZsdcWY+i+sJhZokvEY1QxyAw5zgx
	m/a1B4lXgovOAyEQF2hBijBNlz8qzlcRRZ6o0UUvg98h8YZpF+cmmVr9AHuMfW83
	Twhll7/sGGDwVSYOVfn8qk54jf1Y4lDrzHuQ3+FYmOde9dEetHlOnn1y63ABTlcV
	blyECQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsbqgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:54:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so6329144a12.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784699674; x=1785304474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vULQwCAmlohXfO2djgyMjy/psAkw3bTqxi1rFQrNtZE=;
        b=KfYIdDq651VUm6kDrwXyviWBmmWA0hHCGVEmgcAM5p/ZaMLN224pxsv7rT8ZTZb+m7
         6g40/3nFn4VZQXYk/ssH7HcIpoPQ5nw5S3viIHXeZMypMRMgNwnWnF9mEbjyPmiLYH1i
         4sPPOtUZTL+kDAGtG+9FN9xwTclinWthF6Y9I1FNwcJUrsItFzULuAurBBK2V5eCzk2V
         +h57HpxG992R3viDIVAz62AfRhbyc2/Ngq9LE7LSqJw0n4tu4EXk80wpqv6HMNsNfYmk
         /PZ0S2sUlqS1Bngt5sANEqFswC4fn9e4SPgcbEpm8HxEo1/Fy6ZkItH9vFjhDqS0gI52
         eDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699674; x=1785304474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vULQwCAmlohXfO2djgyMjy/psAkw3bTqxi1rFQrNtZE=;
        b=cE0kh3UZjvIZky3NcEo6SPzpncbAOAYqLM22yeEGIWMq5u8aObhNPq69IpthxYxc2A
         DBEoMKbpgQmlMNeVmLa+wbohe9HN58uYI24nASSuTQNkMPFesNGzGU/NVgOusP24jrxl
         dhgww4NDbl/Wcd5NXjo60exzvJ2N1/CKdVW9La3gFU1uwg6tb7oa8cPB2EAsVlg9cAUj
         CKhIMu1BYofuva3vhwcf9CDLfdg0NWTiKMQ3pa7tCtnxceQ69+ReGNpfazpXW6jf22Nq
         qaKAP9liRoRkh+e/oDb0w9jKc4CkPEsGxB1X4LIhh38GalSa2Jknrnj5cL10nvjj55tE
         PO3g==
X-Forwarded-Encrypted: i=1; AHgh+Rq6YeaRodienSKoK4DMJEzPWopJ+MgCb0eUYOl+PJ9oRnvULQQXR2MGZbnk3QX/jmJ6+jOHB+NG7FTJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwMTkWwJs/Ez4KbCrxvD2WY/+flNFnUt1A5Yq8yHuRlCCt6kvZt
	ImQQs/3M2ZR5NiGdOW8LKYCV20huPuoIcPjlTLYZscrsYez8J5VeBlIw0JaMBg3zv3NRbr4pl2U
	U12akd/cyNYByFg7frJV+u0IkPYGLbPj+Xbo4vcfzYXuLfT2iNeX1A9+uAgUJX0J0
X-Gm-Gg: AR+sD12nc5DRphr8+bD2MA4MnkgVWbSe85Udg5DAR+np+Do/fC3oWrxU/Q29RHbMvDQ
	zyl+CFkH/uJZ8GOxBeJ5lTSTsw6JCXqjpGiyHfPC9Ae25RusDilgi/wuRgv5qrLiWsD/G+OYxuC
	k2WamXRr4KXApmP6NLDwsqLdriXKQx8+vSo7MCJtq9110u+fb6l524Ir1a7b9+feCzrMwfgfu9x
	LAE44hBh2hDLLMTopMFYIuhyLuwX5kagE7bZ0VCPYSiH+c9YXzGXvzPtBYU4wvwMlrTHCqqq3RO
	9IyjauaraxGcS5U/QmX7O2SQwgPvJr2OPH36EKtdWQ2W4NnXvi8CBIKWJlzUdiL7jCqtRt8ViZ4
	HRn9wdCmjT5Vwe+km4Dv3V/7wsfVMg8mcAvk=
X-Received: by 2002:a05:6a21:1b81:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3c429456cbcmr2634318637.22.1784699673320;
        Tue, 21 Jul 2026 22:54:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3c429456cbcmr2634292637.22.1784699672896;
        Tue, 21 Jul 2026 22:54:32 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.252.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm5101865eec.3.2026.07.21.22.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 22:54:32 -0700 (PDT)
Message-ID: <e553a5a4-6dbe-4dd1-97b6-75e7134fa08a@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 11:24:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
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
 <pg_LiPVcP-SCcSrY6h5V1eEiD4KpYf-r_Ext8kFqdjKN6FAIqYP9AwoUTOs9THCufaMrDD3alFSp87FYRYHX6w==@protonmail.internalid>
 <2323abe7-ecd3-4504-8790-ef1a2dacec8f@oss.qualcomm.com>
 <e6b1ee5c-da61-4334-9450-d9cb2e7c05ee@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <e6b1ee5c-da61-4334-9450-d9cb2e7c05ee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rIxwRdriP4NJ8Cy7eP6VD3UbKSeXDjGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1MiBTYWx0ZWRfXyh2qFWmHEwMB
 so5/8iGacU8MV0phNe99STGowXb2gux0f1qeha8DCOL8sUtLfu4rXf+V57UxRUIOCTIWPUI/nSm
 NuAI+70aVtB3WUOoZMgmEMX5kCoMrvjPTX6pzC+eyNzHm+GmN8NcolO4AvF1Bx+ZvL5rei5kCS+
 8IruuZoz+TM345qHjZtY7ta/6kQYlyTu7UGFjBmDaK0mZhjCl6BJoS2OScEeqnLQpTL40Xk7yO+
 96dTC9ryPhkK7vPuc5ddwCSqw+KLRQSQ7HlxN2vf6NHK92UcKVPuLQgRQB4BnwgS3t+5Seat964
 UNxVDkd36t7XIRU8TWlF0xdJ8R18DP90Oa0Ly8VooJ7rJS24PLJhYqJUvMPlNnJKY9D4AoPoFUS
 +JOgo3TnmBRbcZQLiiIusn5Kx9fmhm4g6Bo7qmpwTxktwSgakFFp8yl8eIght6sy+3WPWiql/za
 fuAUIjzO/bPxXY1IF/A==
X-Proofpoint-GUID: rIxwRdriP4NJ8Cy7eP6VD3UbKSeXDjGz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1MiBTYWx0ZWRfX3emFzUtTXPBD
 j7QZvHd6oYXIg55Oe2QN0CCn+ojPzuiG1q9k5rVf8Txx3o5wEgrcQYnn55HmcXSm3w74KikQeiM
 vSbK4vGlQqdUPzHNhr46qhBVAyTYr90=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a605b1a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=7QKhCc/PCtuziN3cdRcg/A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YfwmlBJXWq4pewXu0PsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220052



On 7/22/2026 3:46 AM, Bryan O'Donoghue wrote:
> On 21/07/2026 17:23, Vikash Garodia wrote:
>>
>> On 7/21/2026 8:34 PM, Dmitry Baryshkov wrote:
>>> On Tue, 21 Jul 2026 at 17:08, Vikash Garodia
>>> <vikash.garodia@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>> On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
>>>>> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>
>>>>> The raw formats supported by Iris were previously advertised
>>>>> unconditionally, assuming UBWC support on all platforms. However, some
>>>>> platforms do not support UBWC which results in incorrect format
>>>>> capability exposure.
>>>>>
>>>>> Use the UBWC configuration provided by the platform to dynamically
>>>>> filter raw formats at runtime. If UBWC is not supported, UBWC-based
>>>>> formats are omitted from the advertised capability list, while linear
>>>>> formats remain available.
>>>>>
>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>>     drivers/media/platform/qcom/iris/iris_vdec.c | 26 +++++++++++++ 
>>>>> +++++++++----
>>>>>     drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++ 
>>>>> ++++++++----
>>>>>     2 files changed, 43 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/ 
>>>>> drivers/media/platform/qcom/iris/iris_vdec.c
>>>>> index 4c8bc7aac135..9fee5f28097d 100644
>>>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>>> @@ -3,6 +3,7 @@
>>>>>      * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All 
>>>>> rights reserved.
>>>>>      */
>>>>>
>>>>> +#include <linux/soc/qcom/ubwc.h>
>>>>>     #include <media/v4l2-event.h>
>>>>>     #include <media/v4l2-mem2mem.h>
>>>>>
>>>>> @@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
>>>>>         V4L2_PIX_FMT_QC10C,
>>>>>     };
>>>>>
>>>>> +static const u32 iris_vdec_formats_noubwc_cap[] = {
>>>>> +     V4L2_PIX_FMT_NV12,
>>>>> +     V4L2_PIX_FMT_P010,
>>>>> +};
>>>>> +
>>>>>     static bool check_format(struct iris_inst *inst, u32 pixfmt, 
>>>>> u32 type)
>>>>>     {
>>>>> +     const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>>>>>         unsigned int size, i;
>>>>>         const u32 *fmt;
>>>>>
>>>>> @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, 
>>>>> u32 pixfmt, u32 type)
>>>>>                 size = inst->core->iris_platform_data- 
>>>>> >inst_iris_fmts_size;
>>>>>                 break;
>>>>>         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>>>>> -             fmt = iris_vdec_formats_cap;
>>>>> -             size = ARRAY_SIZE(iris_vdec_formats_cap);
>>>>> +             if (ubwc->ubwc_enc_version) {
>>>>
>>>> Do you see a possibility that ubwc is enabled for a SOC while VPU
>>>> hardware does not support UBWC. IP document for qcom,qcm2290 lists some
>>>> UBWC configuration, while VPU does not support UBWC. Not sure at this
>>>> point if other blocks indeed support UBWC for qcom,qcm2290.
>>>
>>> No, QCM2290 doesn't really support UBWC between the IP cores (as such
>>> it has ubwc_enc_version = 0).
>>> Currently the database defines a least common denominator for all IP
>>> cores. If we ever get to a point where we want to define UBWC params
>>> per the core, we will need to restructure the database.
>>>
>>
>> Ack.
>>
>>
> 
> Ack-by ?

The ack here was to acknowledge the explanation provided towards a 
specific case. R-B tag provided earlier on this patch stands good.

> 
> ---
> bod

