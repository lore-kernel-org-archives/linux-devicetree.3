Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7B44C92
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 05:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780291037; cv=none; b=Fu9+2UYm/Cub6TCMmmqk/yqFOA2KeYGIk5wIcSKQ40IStEKZDD+JgQRS157lSF4PeI2PYnFcBYM+aWY+T863APe93D2wCHMPjXZQGGgT7ICsdL86uEDjv0HKBI1Xv1SRqbYEzDBPjS/itEA0JXRhMJP1pc5cV5UIJLpPOHJk0/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780291037; c=relaxed/simple;
	bh=6gsGCN9fywOATamR24kEHpzEum26tdu1tLiSViwkxpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6lAiSf0pYyt5Igmx0Lq/fv041bIppLjSS/AHPBFXxxI5ADwr2FySVfKoTd5yqQW8tDC15Pny52fYerEOYeGGIAvh38ODi/QcskS7x+h48sI2jCX9IRz3GVhomyOq8VrDbsdkBG5CN3O9LMF/rDfufA8/d18U84DSprE+otluHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfH4QDxN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMDp2Z2A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfH4QDxN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMDp2Z2A"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VMptr44128667
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 05:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhDV9pl06TXs/rs3qAQNP2Kc91MF0S9ipRtDBoJkiVI=; b=TfH4QDxN1b645pWo
	JhC33efiy8Mhk6eu/lAtEE9GPc7Txr07P07e/YmpdG9Jgi0PSqLxrqK8bS13NQdF
	YAJSbTuOmAtsIQ2108+RfZ+RyK0ODulz/VuVHIlusJlkYAs5wdSGOV+3EmvnJ4vc
	2WMaO0eYwhPMRA9E8hA5xt/0Xce2mi61UJNX6wuHFqB+9rF8UoEbbMZd7zVK4DAe
	B9tiaFEsttDAqzx3cCsFVU4FvwaCr0WsoEWLiW3QgB/FMTSD8HBfxYbfHb3O9GAj
	nT6jhF2Y2bJ8bJclZ1Ex++GmsC7MjeK1uxOcDE9TmQpUbhwxrAMZi5FfLAPHaVgT
	oMdUnQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efrncdrcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:17:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32259e0eso26870355ad.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780291035; x=1780895835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhDV9pl06TXs/rs3qAQNP2Kc91MF0S9ipRtDBoJkiVI=;
        b=NMDp2Z2AxHfDMPV1xJMWIin79HhPd0kIrd91Z0WlqURfa9trm73dZm2zzvZWNkk9RA
         3x280SXhf8S3DVs9HqEtBidpVtUpu1tGKYYo5WQaLhKb/shC3KoFVhq94K8+XoN0c9BH
         11zSxLlUPcd5fOygLDRQpmDAH61rVyt7EPHcZe/CSR+V84W6vZP7hsikjKDYwxkE28eG
         4vHu+drPa0O2YWKTyybwAZYlQCrRFH4HdTKSULVy2ZtYW13/kFd9Fn7Bt+9ApnE5LtOS
         fgAamyEUZCx5gODuQZZTK/KtkrIFa7JABS15pEzB2/oI4jowBuTuCoYlxIfSTULJ+64E
         9wJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780291035; x=1780895835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhDV9pl06TXs/rs3qAQNP2Kc91MF0S9ipRtDBoJkiVI=;
        b=gKDFc2qfgK+c+h3DcwPCzbT6XAIVqXD3owTVNqwFXvfHYDhR0rq8ZWTrXH9thTkWt4
         GZAsPYYaNU1u7sA3nGTuDFmH4hwJcxPcID4oKGFZFcsQiwDtoXHaGHqaHxdzI6fkx0Z8
         q8Vz7MCnM4tQY1CBJJDU18jq0DBxTyBnt+0FH1Z5KKohWELCoXX6LCHz7J0HCWYbG+ly
         r2sx3cAxQvZgAmyR3xabTymvp0xcjqaZ7GIyZSd/hqgBxaxgn/fgOeX40KRmdOy6VJdd
         5giFM62ySzt79yFvwiNu0qHyK5ZyXU37VZCdFMAubdmEVxbAWFblSteOaR2l0gvEDTKO
         +coQ==
X-Forwarded-Encrypted: i=1; AFNElJ90vZjKT9d0u/ocRnJzPNYmXGpfpIP29ayVTGcEq8ndzbYJQMfJW1bpoIOHTCR6z8tj82ErL80Jxj4H@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxzuFKccKDbzn1tsWrxEX127+iFfxeVm70tZq6uI923busm4O
	hf3sPk5iYrdfZrqc1g3k5g/QTceMXO6IoA40Qhr2q5TxIz5e0D6rECLNEld0W0hCW63+Y6vCdNJ
	lbPNdJXRls0gmR1QB60vRxARbL2eZ3yXOaBgjgeRLC1x/ejHvVs13EmXp8ZHFBQ/6
X-Gm-Gg: Acq92OFgZ8E4GP7GTgkkTc2W9p9H7cbuGSFmrCfObqjRTGQM+RVj9/upxqCLDSO6a4w
	OuCRmeQ8fACOaGhkJEbK6+uS5PbjGTGYfx0wF0fOa70S3Jjkltv6G0yBQ97FkJ655Ef3mKKPzML
	G93l1swa2MGuqaDBtyNBK5q+9tJ54TAQuWD4fmQ1H7JPrUoUq1AYTMem8GiPHNwhVlJCtIWcTKF
	s5j42yr0DBR/RotsYmIflkMOCfsfY1KL7jgAl7+7bDKwVI7OdXbYCaqcNt31pkGJice1eJpuvd+
	FvhGEIJME52z2kTxc09gSu0zaaDCM1yEIsNOjfZFPEpXUOZZtNQHOiipZJRrMNfYxsV562B4Jw4
	uxiwBtMmlhe7IF/58VbYF2WifORn8dRINjPKqHBd2TtgFy8LauPW2CoWROPwE0yG3wlhz4Vl2Wi
	ZscLbyCBTSL9tiS495WC3gwme8
X-Received: by 2002:a17:902:ea07:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2bf3685df7dmr109697425ad.31.1780291034865;
        Sun, 31 May 2026 22:17:14 -0700 (PDT)
X-Received: by 2002:a17:902:ea07:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2bf3685df7dmr109697055ad.31.1780291034415;
        Sun, 31 May 2026 22:17:14 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b01727sm96486175ad.53.2026.05.31.22.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:17:13 -0700 (PDT)
Message-ID: <155c7b48-6fa6-4f25-8b0f-4e9081d5fadf@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:17:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] pinctrl: qcom: spmi-gpio: Rearchitect for flexible
 group support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-3-3a6a025392bf@oss.qualcomm.com>
 <20260530-fervent-snobbish-silkworm-24ddae@quoll>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260530-fervent-snobbish-silkworm-24ddae@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EwUEkWlJJtqiKgKhavhz9RaGvkx_1krO
X-Proofpoint-ORIG-GUID: EwUEkWlJJtqiKgKhavhz9RaGvkx_1krO
X-Authority-Analysis: v=2.4 cv=FcIHAp+6 c=1 sm=1 tr=0 ts=6a1d15db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=43zHNb41aA7duc6R1F0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1MSBTYWx0ZWRfX7p0h5TV0Zo/2
 DSqfzgZNZ4ifmncxU7Jsb2PkiY8r/zopyN0iCvhtN/Zdlvvp891m00YXA6AQUsLuPQVL1AgM6TL
 2DrPHpFuNOcUmyqg6AXS8xZ1YRyuUssrigeTw6Gsgde7AwC/ljoagFEGZj3pyUnQjaJDKwoq5Ux
 rM3l6L+AiG1YRx/8mNkYUdkZp55uiXrStZZ2KzCviN3fl7hk88hyWSjmm6JIfxhuAkQx14Y7Y6j
 C4jFnbixJX6+oZhFAHHLEE7SC4D+nz8hHCG+BOxL/FUlIfM2fkDAZijvqoNE6v94UbWqEkpPNb6
 rfR6Pdp5vS5oecHdee1N2MDd1pnE42SbptRWQnsNH+Yw4YH8BdPdb7eyZNiyHmQrG1nq/+ef10m
 rA41g410l7mZJ7DssXLKnheNIm8Q5x4b/qRUFRiFXyC6WjxipWfV6eyOOIUMGzPZwiikzPhVhQc
 ZhCdVxmp4KyQJvOrP4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010051


On 5/30/2026 6:31 PM, Krzysztof Kozlowski wrote:
> On Thu, May 28, 2026 at 06:05:37PM -0700, Fenglin Wu wrote:
>> Currently, the driver treats each pin as a group, and every pin or
>> group can function correctly in all existing functions. However,
>> this approach is no longer valid since some PMIC pins only operate
>> together in specific functions, which are limited to certain GPIO
>> groups. For example, in pmh0101, the level-shifter function is
>> supported only between GPIO pairs like GPIO11/12, GPIO13/14,
>> GPIO15/16, and GPIO17/18.
>>
>> To better accommodate these new functions and restrict GPIOs to
>> those that support them, rearchitect the driver to enable flexible
>> pinctrl group configurations by utilizing the generic pinctrl group
>> and function APIs.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig             |   2 +
>>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 377 +++++++++++++++++++++----------
> And now make this built-in and RPMH as module, then build it. Does
> it build?
Thanks. I missed to add the dependency in patch4 which really adds the 
rpmh control. I will update the Kconfig to make it depends on rpmh and 
cmd-db drivers.
> Best regards,
> Krzysztof
>
