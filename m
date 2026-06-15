Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC593E5A04
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525548; cv=none; b=PWg38N+k/kAkbqPnLySoCSY7hwR8eQbVcpLQygQx7wlGWVFkvo2T7PM2UYrv5T1fTO9e9WI65Yqa5HwyEjRLSyR76PvvVyP9Hg4+n7z/GBiS/2y5aIdYHYKeE3LwcaHg7+micqL1vZbt7+I8uXqtUQBwBAoIA7LjjFpKDduuGBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525548; c=relaxed/simple;
	bh=+/7n2Rq1vOpj2Q8D7C+okfFDDw5hzhTjlFZrTWqulM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK49A3Gk6O26HieP6mLu0VkHN4YV/wtIrjpvW990DsFybTBvM4miWxbrFmKcUGlx+y3md757mwkVi53fOtxN0jzPjPZSsVA9l8GSZQEgWx8FXg3qYz+PULKL3yQ+QYsqi8JEqXYJhWRlHza9AzU9Uc4XzwGeDlOHGHMi2qj6l5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8asB7bj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2gdFCCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8asB7bj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2gdFCCB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApXIJ298358
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsKI60nJ3cRPMhSIVuZjFVkGFqOS9FdBjlayzytfzoQ=; b=R8asB7bjvkXSZB4M
	jmQagOrX7VJqHo3eIGNqgKXycJiY/adEKkIfYZhlQ2/1ZplgKUz0FZE3lSN4wEw9
	PDbiULJ2fUS6N4SOI6+ORmXphM5d21IIX8jrN6sOVdVSaN31E9kuemIkpQ3nFt3f
	HFCu3SiON9TfEV4RTrZXmCSDae3J5t91EGQYBn6apo7vg/trR1+ScdOpaxgxViXY
	G0Oz44rS83ab3DAcQQmleQPHLvIF+czEHmVQBDDaHzY6eMpZ43YOoROX+PZj7jO4
	K3rG0/AGYJMwvDtCpW8ZbSACUaBKiKZM/Oc06xDW8UOxF3Zoqjlal+fjbj80etXy
	pkv5uA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter20m38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:12:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so3680026a91.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525545; x=1782130345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BsKI60nJ3cRPMhSIVuZjFVkGFqOS9FdBjlayzytfzoQ=;
        b=a2gdFCCBe3fq1NT9F5bxp9TrGrcpFHQNaZk+li2T08VyGvyIEudjHpOkJTC6ZE5W6n
         /6HF0LZwDEwf/4tooeOln/kZq+gQ09FaP5Ne3MkipmFgJnuzukDCQLr3ZcPniZexVO5o
         11nlMmd2t9W8UUw5T9REsNpR0GX6z7Lnq7M9vPTVgk+GfKOlv3/fT0DolWJ/NlPwPUH/
         bC+tWjteDbLbKQP4B/h2ZGpzm1D3emMSDYwnmlZaj++x2wu3kCgZJArhr5LbTynBAYmd
         ohQxe3zfHF1bBdPcAc82GVnwM1V7Fj/V9yzQ2Cv7Rke+TbTjJZG9mFyY5sG0emOswsIm
         IRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525545; x=1782130345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsKI60nJ3cRPMhSIVuZjFVkGFqOS9FdBjlayzytfzoQ=;
        b=JApzXgDlTNKkJspwEl8bPP8m1zGP7jO3PGE27hQYJZHH0p30Ny+5DKkBNxPxQmRkne
         8A2iob9NLMstYHPgdQY/+Yn7N0cHwI+drH0aS+ozx+ckDA9NUW84GCnwgfuze7iTMYem
         MjsEDg+nmFYE+V9Qot4sPVtCunlq0wdufHNGc1KEge1wR6P3bCEbXsyJmpIndCo94wJA
         aGk6VYomB7NfrJPxa7FpCBvhTCP31rS0+aq8aMYfUstGmZkAZChy6mhaNPaVKMeaJa9w
         Z0uc+cbuKOIejGVRe523V9k6QNOQQzACSl6qzmUa1JMAKHh2aT/va2dipkhY3tjgQtj1
         2Slg==
X-Forwarded-Encrypted: i=1; AFNElJ+zOaEvT5Lh3TEMZMOp0Wk5JWm3X8UPGCX44j0n+K7wrKjb7CBhIE3YwxX/PkJvbZ+ix0z2dfAgXBbF@vger.kernel.org
X-Gm-Message-State: AOJu0YxuaGLoQvCoIMbKpfe11tqlfcqKTOwj9tdTu5Sa64Drjq34azd2
	klerJuqRuLRCx2pIkah5wxB/pivKjsnUpBfMYDracufgjvt0/xTjCWBaSEstdVwILa19RB1TYW/
	q4j9hIf4Q+mPQYk4QNopK6yqlljy0Q4rTAXyIIwLip6cy2erupr8mNigJkuHxAzvq
X-Gm-Gg: Acq92OH7R0zQ5NERCbS2zs6R0PGHgnaEjabweIxPWiNZsmKhR9gAst5w+usc5n41JEX
	zJJaXwDVNQy4FGm8L2lKwp2cPfVV4PN2DnxJWP66Vfn74GwoCz+fi+MOYlRCE7UP3Px6lrSc02a
	eRzECNSIre1VagKTxvt68axR5PLEnIFeqfY5AIgDkm473/HggPf3NFJpx7w5YI7js6a0gJ9bL1z
	hygEYBZ4LrVYYCYzcJzgIpRmtEN1Opru+1jCP2NYb0jE9217JjC9Ii7+BkyBcr/Maym9A2sLljn
	GLDgAifQiQ/uOp7sJnbCWx8PwBJLRxzFlB7E6fzeSD/HqBTvnG2kC9fkxsZpvmxlB0gBp4WOWBT
	4GVlq0v9nLKsA8ufNBR/uUrfMFvyqppZg1XpZn8zFq4RUspFv15ZH
X-Received: by 2002:a17:90b:5205:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-37a1e0084cdmr9309391a91.5.1781525544093;
        Mon, 15 Jun 2026 05:12:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5205:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-37a1e0084cdmr9309346a91.5.1781525543224;
        Mon, 15 Jun 2026 05:12:23 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379c298c3d6sm8030534a91.0.2026.06.15.05.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:12:22 -0700 (PDT)
Message-ID: <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:42:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX7F+e4Xz4g1/y
 i+VbfL99XgeOxmZOgDWRBDOaxR7TKdRyULjSdFfn5fzIVcYzH395xV09tQNQ4Bb90fnxpWxKljD
 5yaRSPw3kRbsCr+sYInCm+wa+j6fsRQ=
X-Proofpoint-GUID: YrtZ8yRKXvbVWzNFDqsjvo8rd194BwEB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX4ISuJ/Q0Q9le
 fDESnp0DBtqe5nlGcVDDho7aL0Ma75U2Z+5RFONdWMDlok5WPrQlYegEGV+jJLORbhLcXcxZSLG
 Wr2bPz6n0gZVUzBYbTNXtRtm8IMheVLZtmSlIdCe0afr4Za5qRd+e5JQBJBAMonkCGkHavjG9R5
 ZWQKeO6nqlyjfiy/rYdrqAsRfB2gbqcxX8s0pWUqvxqzqeiVgUtT0/lIv7braVfPI9OsMuCgZbk
 Xmx9NMB/Wyle708FTVzCOvZXD60lVQFvGgB4dntRYv7KWqaRgmg0cYYLKKwBlR8bT9SONVAsiga
 k1Ugzcju3Ra7tNoL3vN3MkN+s8emjVIExNdTc6qMvrmQByfafVXOnjOHNsFn+U9Vph+/e2cSPu8
 VJSIxniXn/0+DFXRxeRUqfOy6hibI7RTelolDJk8Suj4FswmJN9pJGqBmPSmVyUCNBFFJ3+3JQa
 vz3IYUgfcn5yxIhgbzw==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a2fec29 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DT6rP8QiwiOHS3JImSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: YrtZ8yRKXvbVWzNFDqsjvo8rd194BwEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150127



On 6/15/2026 4:04 PM, Daniel Lezcano wrote:
> On 6/13/26 13:05, Gaurav Kohli wrote:
>>
>>
>> On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
>>> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>>>> Why? And where is this generic property defined? You cannot just
>>>>>>> sprinkle generic properties in random bindings.
>>>>>>>
>>>>>>
>>>>>> Ack, will add why part.
>>>>>> These names are matched with the thermal mitigation device 
>>>>>> identifiers
>>>>>> populated by remote firmware over QMI and define mitigation 
>>>>>> devices are
>>>>>> exposed as cooling devices.
>>>>>
>>>>> No, -names correspond to values passed via DT, not some remote 
>>>>> firmware.
>>>>> The remote firmware should give you interface which is explicit and 
>>>>> does
>>>>> not need such properties.
>>>>
>>>> thanks Krzysztof for review, We need tmd-names because of following 
>>>> reasons:
>>>>
>>>> Following Daniel's series [1], the thermal framework supports
>>>> mapping multiple cooling devices per remoteproc/device via indexed
>>>> cooling-cells.
>>>>
>>>> 1) The thermal framework's cooling-maps reference
>>>> cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
>>>> there's no way to know which index corresponds to which TMD, as 
>>>> firmware
>>>> may return tmd-names in any order.
>>>>
>>>> below are the changes post new thermal mapping changes:
>>>> DT: tmd-names = "cdsp_sw", "xyz";
>>>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>>>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
>>>
>>> names property are not to instruct drivers to register or not to
>>> register something.
>>>
>>> I don't understand the problem and explanation in the binding is
>>> basically non-existing.
>>>
>>> Remember that all lists and indices ARE FIXED, so driver knows exactly
>>> which index means what.
>>>
>>
>> thanks for review, shall i use driver data, which is basically pas 
>> data structure like below:
>>
>> static const struct qcom_pas_data {
>>      .crash_reason_smem = 601,
>>      .firmware_name = "cdsp.mdt",
>>      .tmd_names = (const char *[]){"xyz", NULL},
>>      .num_tmds = 1,
>>
>> Is something like above acceptable? and this will also help to filter 
>> tmd names as well?
> 
> 
> How the thermal framework will bind the thermal zone with the TMD ? 
> (node pointer, id) ?
> 

Hi Daniel,

thanks for review.

With id only, in this case instead of taking tmd names from device tree, 
qmi_tmd will take tmd name from pas_data(driver) and register with the 
cooling framework with id only. Please let us know if this looks fine.

thanks
Gaurav
