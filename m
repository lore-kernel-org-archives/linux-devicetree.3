Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB74530569A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513699; cv=none; b=rxOLhmU2cskzVM/sw/mrzE9M9AK4ueI+XsvWT4nyVPM/EkxSeIODW9dDQfl5owFO3ClFcZx+jpmiWD60zGmLixluKS4FulwrBwr8sf0jyqDklqroiK0f4RQ2qvwadVuC1zXLl8M6S4B1ugMK7VatJ835QOgctmi9+z4kpaSiNas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513699; c=relaxed/simple;
	bh=ImY+QKS1yWtn0AtQzKxjo/SmwqApVnVDxa9ZWuNJn5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQ4Dmmk2Tj9j2o87yzNFivsNJHTT6/Y97iRoKdLJyieCc4uZDv5ngduqAp1E8tBijK2da9OgQL1QRqT3fqzW/2X8lLi/jzPKJeXikq38WvJdFIX6sBazplifk4djX+gUFYlsJ4mpsCVB7hWYj9JNSxqqsk7qF6BzCk/zEy0rIdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhsDasjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPkqihU/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhsDasjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPkqihU/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6JA7c3250534
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8bECzSiTb3LgJMZEcwHvvqOjyDEdKf1cdVEHMFUpUc=; b=AhsDasjFeRTEExNf
	5ijKNMYAgfwAsDtnm2nncGAnI8WyxVB6BpGqIjDkfE5kQ52svlGwJJEdMhOhArO9
	f2RuvkWt25ueryhn0EUmPzjUFIVeOwOsjauvDXgXAdjy2pthTrSuRK+Z7c/df4qa
	IIZyS2jEdfTHcMp6dftifGxZaixqLuzZMoTOT9ohJQXax0jJ7uiT8uzw5CVrRIZ5
	PqyrRvMU6PGeLB18ow+6kFNN0T38T0JQ814hU4kY/nXBusc+5rkxZKZssarJKIRr
	Ys0Y0254r9e9HnUsBGTtHJ1PzfpW3TWn83LSCsQDhGGHhOiBKGgwYeGnGNgBxdhF
	ChE15A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybxe8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:54:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso5735081a91.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513697; x=1782118497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r8bECzSiTb3LgJMZEcwHvvqOjyDEdKf1cdVEHMFUpUc=;
        b=YPkqihU/TMnrK/XNe+TLIox05zyQ+Mu6XeneCJnxh5KRmxhNyipOIXcFdNvl4q8QnY
         msiTqddeKLfE+XMVDxcfpDRPUpIyrwVPFpftZ0haHihQaAuZJgkYyfHGeWg2Y6t1PdPR
         lQDAqwuzsHyP3oWKvxwgumA10z21cKwWkAuFWrm8Pv3sxFpuEsp2SPn3ftlVKiVMXU5y
         u/WURBhRAlTfIZRTJz2UcxOu4gVICHKb0UfIuq7BGjsdcQHhLV+35rNKlABeiLceoeho
         L0est+prHt+t5dNXm+9H3igsOsrqNQ2A8vN98Ct+3StciBo4QJMxh1fKx0M6nw/KST/i
         tQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513697; x=1782118497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8bECzSiTb3LgJMZEcwHvvqOjyDEdKf1cdVEHMFUpUc=;
        b=dW2zgWPTnquarK7a3iR5asbGcm/pmVPIG/K/NdbDmseZ8oab31zLQ05kUlBKqkgO2M
         upUVqiUenntylF7Df9zijrhjCSDFfHk7iZ5Ghv95LUYFdCy8O2loldqQXaGcZlpDQIfB
         wre0HR+/1XtAJD9ZdmxTsaIgQQWnpDYjEWSjQn7RGy4YnrlL02nApY3ybelbsUpn0hII
         VNBgWr2ItYfwQRB7uuCEqHVrWNPpnYm5BRSniKle/1GC9hcgwLSiz9wjFgeZjP45ll5M
         zkwP7tdmIzrAAka5J1Ul0gCSpuh+2IC8GOva525rDW3U1quiSDOcrOO/yt2M51nzdFuk
         yn7w==
X-Forwarded-Encrypted: i=1; AFNElJ8JSG0o9mTXhgzL5V4fVoKs5F2XfhWHPpszvrB798Kc+pqGcp11Q7VI7EVlpplV8Ewd9AR/EldTskuc@vger.kernel.org
X-Gm-Message-State: AOJu0YyW6WtmdoY6YY+sCxw9/ARHEl0r+B5PJamTo7qp975ZqwLDdLuW
	s2ndvcEfPbxyya1rPKhK6tTsalfcgcjSrr9+RmxDBmxBxGA8sEEZ66uasn6tLoaqkJwLY8oBhTY
	zVfHs/7GBHbj8U4PPVhgvALUXTPUgAv/p/swHyA5rnfBTjqVsI/29T4HB3p5et39n
X-Gm-Gg: Acq92OERAww+/j47ocG2DhpKbHOj4PMXHOohMVqlAE7gIxyvp7cvg7TBXffYtKvcKuc
	uOWvawx7Mdhq9FFljfRsukjAzO28QIkvCo3GF+EoaiQ/cqpNEUAy7ghJkbpJBSa/aFZxydYdTT3
	gRP5NEPDBTtF6GvW5xLeTqWtwiXV89sR0pReLM7cZlmhmma/qvD6rt4TwdZCoiooXJAGtVl9t+k
	xbvKl4pyHX0B1GkRQwdt02DJvV1f1yvbEIPi8pYzptVDoSH5o8vQyYBUa31YK12poJ/iesWlpz1
	wlBvJTQZYqVhC5rj/F2iWuok+hgeO1/iBzs+FHOvobsweSesvQpF4UDVtCJaHotVn1bC4gh/pER
	T4tZ1+MUWX+Hat9C+x7++7ql6UQQFkyLVfOodvJ5Z/SZc0Dld+BlhuFp36qSYC3MbSA==
X-Received: by 2002:a17:90b:4ec8:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-37c2bd06679mr10501804a91.16.1781513697378;
        Mon, 15 Jun 2026 01:54:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec8:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-37c2bd06679mr10501782a91.16.1781513696915;
        Mon, 15 Jun 2026 01:54:56 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a212ab0dcsm10243964a91.15.2026.06.15.01.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:54:56 -0700 (PDT)
Message-ID: <0d6e0c5b-045f-4b14-860f-872aa294c876@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:24:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
 <20260615084646.4F0A31F000E9@smtp.kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260615084646.4F0A31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VwfmOJC0cWVK5ytAQqAG3t4sUoENsPzI
X-Proofpoint-ORIG-GUID: VwfmOJC0cWVK5ytAQqAG3t4sUoENsPzI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfX+3aJkHJ4XNjr
 nu22HFXgP6YnbNJ0/ztw0IBKnjEaUeY4n53olVi3RXZwlGhgS8avO4axZ1RkUJbg33gXVnKphA4
 MKlxSBckhsDsU8TsjcojHwflyyOeODs=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2fbde2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LUqKRbfh-dbFGJuYVaUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfX76lWza7fGpig
 LzvaDBVIjsxG0jZtyoD8NeYp+Pn4uB4r/Y4YcJlMMeuRql15Z5o17j0i6q+w+eh4+An6pO+2zds
 DdlplYNN3qERakgaavVDd2FYRzeiFCR6bPf0HOUG3/PloIqvXhcajumX4cOkUtPWNKUtsD5t/o0
 qYNW5NgK2PCQDjCUfJ0Hd8ej4XFy8K+Ch24etOfSL8l3XZNYgQsJnMywF+WP4xawdWt3UxRtGtQ
 CQbcn8F1JUj8kIKoDPIeQk4RCwzu6HrsUnGcqHsjuUUhdz2ODQnTyNAMuwzeT0daHLJ7yYMRih0
 87k1o5Qv+y0DdyrJPN5gvu5ZXNtU1dAVHh6B5D2BOh8NGk3g//DLKtL50EoKtEE+Ma5SDoxNyxF
 NGZp+0SccFBBVdCMr5OpZep1U2INe9dQBEybv+Mia51OJIQoa2YRAIlIK7EqPJkrIIcpDXr41/W
 oePWHQEIdPmd+4jz/+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150093


On 6/15/2026 2:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `.is_enabled` callback maps to `regulator_is_enabled_regmap` without enabling clocks, causing a synchronous bus hang on IPQ9650 during probe.
> --
>
> commit 57e8a1a06a52f828e01d53b16f6c708e7f6df23e
> Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> regulator: qcom-refgen: add support for the IPQ9650 SoC
>
> This commit adds support for the IPQ9650 SoC to the qcom-refgen regulator
> driver. It introduces explicit clock management for the REFGEN blocks, as
> they are not enabled on power up for this specific SoC.
>
>> diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
>> index 6a3795469927e..4b8aa40d7efe0 100644
>> --- a/drivers/regulator/qcom-refgen-regulator.c
>> +++ b/drivers/regulator/qcom-refgen-regulator.c
> [ ... ]
>> +static const struct regulator_desc ipq9650_refgen_desc = {
>> +	.enable_reg = REFGEN_REG_REFGEN_STATUS,
>> +	.enable_mask = REFGEN_STATUS_OUT_MASK,
>> +	.enable_val = REFGEN_STATUS_OUT_ENABLE,
>> +	.enable_time = 5,
>> +	.name = "refgen",
>> +	.owner = THIS_MODULE,
>> +	.type = REGULATOR_CURRENT,
>> +	.ops = &(const struct regulator_ops) {
>> +		.enable		= qcom_ipq9650_refgen_enable,
>> +		.disable	= qcom_ipq9650_refgen_disable,
>> +		.is_enabled	= regulator_is_enabled_regmap,
> [Severity: High]
> Does this result in an unclocked MMIO read?
>
> During device probe, the regulator core calls the is_enabled callback via
> devm_regulator_register() to determine the initial state:
>
> qcom_refgen_probe()
>     devm_regulator_register()
>        regulator_is_enabled_regmap()
>
> Since the IPQ9650 clocks are disabled on power up and only enabled later in
> qcom_ipq9650_refgen_enable(), regulator_is_enabled_regmap() will perform an
> MMIO read on the REFGEN_REG_REFGEN_STATUS register without the required
> clocks enabled.

REFGEN block can be accessed without the clocks enabled as part of this 
change. Hence there will no issue while checking the STATUS register in 
the regulator_is_enabled_regmap().

>
> Could this cause a synchronous external abort and a kernel panic during
> boot?
>
>> +	},
>> +};
