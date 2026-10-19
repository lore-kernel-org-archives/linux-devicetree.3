Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5B45D920
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386069; cv=none; b=RY/Wuil73F2c1cPsUlsAaBqY5qxAshq+ARGWf6H678wZn0rpF0iVAgy9hULqJ/QMKm03U+rHTu/RhJF49WPkIwnIEs+rgIwDRQPk7JZ51mSF+yMUAPYrFmvimJ0pAbdDQMd0NNy4+SdH/6VXipD8hRH/UXLNKGnp6lZ5B+SRKxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386069; c=relaxed/simple;
	bh=qg0/cscURycJsdkMQrebTh46raKvBmrkckbAtyxDaII=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ca5mLRxmEVBD3R8w1Z/6oDuTuwDIc+5y8CCAU4dSwb/aseYXO1PkABpve1yjkvFnJtZHKiyX0o3sxWdy9jMMdj7DP3nCLVJcpTA24Un57AS3f5u3/bTZ4itkkW4baKtuxJ0vkA7/M5A8gk/xfe1PL+AlpZ+H+2MV/yn/xXY3T9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxeqxSrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c83OXK+5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxeqxSrY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c83OXK+5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4itpb1747643
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poibRC5zVcH9qn+EiHq8IXMXYpqGERkP64AbTqP792M=; b=JxeqxSrY1RnVQSTB
	xHba8KncJxS5Qchn0yc/UDxrVpQ3MDVGS4QOkSlZemnLCS6tsJb26e5EF3ZTFhnl
	HzfX8ch/4ZtPE04TVAf6oR2e0w3Uwqvy38/YDfhVEGNmI+47k7oq2Rn9bmdigDR0
	4XmmItPMzPwdYS5l48bQcTuh1JwcWlWrWqHmK7mLrTvAovBMTWKCVzm/rjVITcp0
	PAjqxc/48O+BXGR7ZYHa0ap+akp9SoT5PRQf99vbhEXXP1xvfe2xIn4RbcN3oNvN
	hCb0wBfSHy4bkcMNW8Jr+oyAzz0TQHGzqWElFVDGfmC1Z1shtooSA9uMVMXDyUMu
	KnvRzw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc183cw4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:00:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e818ca61bfso15274455ad.2
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 22:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792386057; x=1792990857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poibRC5zVcH9qn+EiHq8IXMXYpqGERkP64AbTqP792M=;
        b=c83OXK+5a8n0Irv7k5kRdDW8IzWsbTzOonLUHyt3uEnBRErl3Uu0Ge41BlJ3dnOiOD
         HDqMiS4YD9O3rVmz9v1wJqLnRZXGXdWg1Vsi7JVXukQtnG1ZcLRR3VWOFYNgtDtpYceH
         zaOk95KCPhJmLKk48R3PseyxGAHC8t4M99XMXDN7ycR//RGja1KzIXMYrBoAAVW2bv5g
         vUmCGPu6Cxsnzs5GBhEqeiSg8SrcoTYIu8eWV0tNEA++6CBQsbzRA8ZhN6OnGeBgeyO6
         zOWxUfnibAIGGhcdRKsFoDMU226kJ1KXYE4ZobYYdsZ9AKNfhBctZ7xo1Mj8CDtecBqi
         7BLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386057; x=1792990857;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poibRC5zVcH9qn+EiHq8IXMXYpqGERkP64AbTqP792M=;
        b=UEr8Fo4eW6W7Gd8xopuT0KGAkErDRmaoxHup8nM0iMpcQPfbmQ1PFMvo4d9uC8c3d9
         TCVTmocmyzTBziPU6bX4EjMxwTU0ACYg/TZNhuF7DbcKQRq0TganahsLfOQFb6o0El2E
         hFkQwJEOtY6cMe+daiONaOBk3KLudrHSjBoGY9ujojUbROiYG5FuPVfdth3Q0yZSuclZ
         noDaxADGrwmMP84dWl/jeT3YOhDiRYLAt9fTfF4lPxgHYf0qTb1FeKHfuuxoSrKli4O6
         jw5oUTDTVEoa51p5lOLp5/vm+Bv3FB+GLQGPPhE2s61aALdZ9MltnDeTiAyr+37Dozrk
         vrIw==
X-Forwarded-Encrypted: i=1; AKwUvBxPHIyEWlSaVULIhD/EI9pzWTAXdewsOITeaG2wsS6HmSEjt0KpGVARDcndZzdt+3v3PSi+oB2B066U@vger.kernel.org
X-Gm-Message-State: AFq9FYIZANrmLmolHUsweQW9Cb7tArKOErdqE8a4CHzyaVLOA30IaYnE
	sEBV03bfddnz2TY7tVdhZY6MoAa3HivIzNuUVAxMD7Q4mZXqcwCYIyV8ksnVu3UsCUDAbKqlMHe
	vWpGe+R7g6/7CppYM13cwd6ntNfZZdBIg890sbyES24EDMem18scLv2FxGt19nDjh
X-Gm-Gg: AYBFou2eOQgq31rV28LjVnAiTWaTTJEsjmYBYSNn8cmVXJ3JuFLkWLIAx9hiA5jBaJH
	YunExtqzn0H85EVw6cLlNzUq6aGciqBT2IOMbYv0Cqtdzp7yWJIH/rDPeYdHIeksVbjIpQ9Cdhv
	MyllVY8KNx0aWzT0CgX+7MT7xtxIilTk4re9DKwNJ0agZkaMGw4TaMMTUjuEWH7BXhHiXhoqT1N
	6quPK0PsIZiiLeNGboRspKOmR6f0aSKz127pVp3bkgTOiMiJBhdojL33w2dfk6/UajNpC6OENGt
	6EK7tTUc1Cc4LNiY1Jr119rdd2Eu0VMHMjHij53sm+mSyJglfCtBDjnJV96Gg/xv1AdvSGzWpAp
	cOVhRKtNsQNsE2IORuHEFQ9bDAB46
X-Received: by 2002:a17:903:22cb:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2e9a6d3b0c9mr57043695ad.57.1792386057290;
        Sun, 18 Oct 2026 22:00:57 -0700 (PDT)
X-Received: by 2002:a17:903:22cb:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2e9a6d3b0c9mr57043315ad.57.1792386056791;
        Sun, 18 Oct 2026 22:00:56 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e878910sm33730395ad.61.2026.10.18.22.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:00:56 -0700 (PDT)
Message-ID: <e4c681f1-b516-4a0a-8ddd-4885e428e748@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:30:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
 <sashiko-outbox-171155@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-171155@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX8HVonhtqeFDL
 1ALfxYtGDwZWNt8zDxBGiMcU5Spv6fR1oR8WxwirN6XLDNA3B8dzhWL1TqOq2QuKk75nszrHUtS
 3UG0fnolykHTGp6i/2YAhHpoTO8yH3g=
X-Proofpoint-GUID: ScoJFBQ8f6tBbW12RM71GPiX0o67UTOH
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad5a40a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oUrbEBrvFYUpg2Fk8RMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX5lHnf4weUniG
 qcWxhOoVUp/4n5o1dudMmzwk8TxtTHqFa51YNH+318TJkuG668B6Xja7Gvzn98oyzVK2xK8ZoQE
 wSJg6jSGkb6pl+bVyOQWkP+BGBh9s3eKwil25KvR34isrsoRaFj1/LTJPG8YUVWG9Cdx0QuFc8t
 nM0ME+4wY3ZZHiTS2htx7Enp1yDHIf0s/fbc//vsKw325Ktiwa5eejGHiC2FohTSYE1IoQNkysZ
 fbTrmhuLZNA0ve1QCagXHFLaAHNmzCJ2i4XJZNqKC5O2eBzVsYkTzw5ewzQHXVS72umH7fxHWrn
 kcVZUP0qEM0qx6k5LUtLcn7vKrIWS5+Hz6i5xuaqvFcAELdQKRdcmpYwZ3ybUqCdHBsZ/VAFWCC
 RpRJt6gaRBviP6rkIOSZdzocn+RH5DkA1lIrlAE2ZTIZYAQGV2rZnrduthVXyYQYGQJDZ09Ga2g
 +BtwGlMuNz+pF2vo2Iw==
X-Proofpoint-ORIG-GUID: ScoJFBQ8f6tBbW12RM71GPiX0o67UTOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190019

On 10/14/2026 4:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mfd: silent fallback to PM8008 on non-DT PM8010 instances
> --
> 
> commit 4e77301709b8663667033b7dfed82cf937a2d7c5
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> mfd: qcom-pm8008: Add PM8010 support
> 
> This commit adds support for the PM8010 to the qcom-pm8008 driver. It
> incorporates PM8010 specific IRQs, MFD cells, and match data to support the
> new device type via I2C.
> 
>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>> index 2d6c01cf54f32..4179427f38911 100644
>> --- a/drivers/mfd/qcom-pm8008.c
>> +++ b/drivers/mfd/qcom-pm8008.c
> [ ... ]
>> @@ -180,14 +218,36 @@ static void devm_irq_domain_fwnode_release(void *data)
>>  static int pm8008_probe(struct i2c_client *client)
>>  {
>>  	struct regmap_irq_chip_data *irq_data;
>> +	const struct regmap_irq_chip *irq_chip_desc;
>>  	struct device *dev = &client->dev;
>> +	const struct mfd_cell *mfd_cells;
>>  	struct regmap *regmap, *regmap2;
>>  	struct fwnode_handle *fwnode;
>>  	struct i2c_client *dummy;
>>  	struct gpio_desc *reset;
>> +	unsigned long pmic_type;
>> +	int num_mfd_cells;
>>  	char *name;
>>  	int ret;
>>  
>> +	pmic_type = (unsigned long)of_device_get_match_data(dev);
> 
> [Severity: Medium]
> Will this silently fall back to TYPE_PM8008 for non-DT devices?
> 
> of_device_get_match_data() explicitly checks for dev->of_node and returns
> NULL when it isn't present (such as devices instantiated via ACPI PRP0001
> or swnodes). A NULL return evaluates to 0, which matches TYPE_PM8008 in
> the switch below.
> 
> This means a valid qcom,pm8010-i2c device instantiated via ACPI or swnodes
> will be misidentified as TYPE_PM8008 instead of TYPE_PM8010.
> 
> Could this use i2c_get_match_data() or device_get_match_data() to ensure
> device variants are correctly extracted regardless of the underlying
> firmware representation?

This driver is intended to support DT-only instantiation right now, so
we don't expect to have instantiations via ACPI or swnodes.

But anyway, to avoid the ambiguity due to NULL return from
of_device_get_match_data evaluating to 0, I can add an explicit
check for its return value and fail probe with an error if it
ever returns NULL.

Thanks,
Jishnu


> 
>> +
>> +	switch (pmic_type) {
>> +	case TYPE_PM8008:
>> +		irq_chip_desc = &pm8008_irq_chip;
>> +		mfd_cells = pm8008_cells;
>> +		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
>> +		break;
> 

