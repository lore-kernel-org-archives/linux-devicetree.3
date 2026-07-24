Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D323A3EF65B
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890825; cv=none; b=O/xU8JHw6KIrN6SHA3Lx5xZjPxCWeADENXTY53PdBtCdf2mJ7ec/7DszJE+o+VYQB53W5WIAM5+K5wXOcMQ7PQo5UcsyaaryUriETySXfil/L0RXixwqhyEcineTXIPr9YSR03KXPomk2yipmM3jyRtLTCKRvER1sLask3wYPRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890825; c=relaxed/simple;
	bh=C9VaEBw3KALFzc6fqUUVF2hgCFnr4UuiuG/YCyTZl+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pWtedcb6djIgsQp3/YVPXqSF5nitb/D59T808pP9alyQzr4JVFM/1I0eeMJq9IMv4XpVV+Y94zHRoIH2uwWvMd1XLlR87scfoB5nNUu3tyUpSe139cEVAavDiGLwNDIju7wITrSODUDBmqqjL8Rgo+m4Lhdc6PPZOxMoibIQIxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKU6e3lK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feekRct3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKU6e3lK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feekRct3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADr7N2742625
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASVOI5RwmTVGCRU4btP8OOyckPBLGKw/HyewssycLCY=; b=mKU6e3lKz9ly3v3+
	kfneJ3aBPtfNXhFheFKsKirvBiJTQToegUolaAM+lpLDj/LeJGtgn7qtFJNc1Pex
	omSdwvMsOlPJk/BUmHyipDhResUbVzig+fYDrpZjdPB4kPiI8av3n00g0ok9Nr/v
	Q6p7l16iPus/YPyFur9ZtxvAJq7rJgxC40E9zY+WJNDSR6wxntjhK4z/n3KzwntP
	v0K3wKbuXvyFTXscPR+l2C2iN8eaWefVxeaJOun+0kF+vJjxo+r+zxFan0fT0Qyg
	kAh6+84qUJ0mo00HSRgtuCiEnPFWXLlQBrJK5T2ffvZT7Q1CGxuhAMPVnFHDZZem
	a9DUbQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51eqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:00:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so537204a91.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890821; x=1785495621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASVOI5RwmTVGCRU4btP8OOyckPBLGKw/HyewssycLCY=;
        b=feekRct3y8vzgHok8FtpTCav1TC5AWD6nkoBvI9/Fg/zflrnjo0qM5AWuicXZnJAGZ
         ruvFPcKf7tb/dGz0ROGji4cbmh1SpCQuOe78tNJtKT1ieyK11RnLqwBc8Hs+LJ1n9ZlJ
         W/WatTw2ucBjHi9G6+jOdIJ50OIfCSRMrp1R/rZa9qp+D45ek5raqz66u+oYFWJvlQAI
         ZbRjl2Uge4bbOhEBFRPXgw9HEAsKA0SUscTwYD7453fUvY6OHn4yYW3ZpMF41NiGZDJJ
         U3M+Tj0NupNGJ9W4NAnwef6ht6iZsMN62dJPilO4P7bdwnyCEb5luhV2ZuThbJB1Aiii
         cZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890821; x=1785495621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASVOI5RwmTVGCRU4btP8OOyckPBLGKw/HyewssycLCY=;
        b=b3JXcl/LmwPrPtZrn9E6PWqBIn6OynvCTK0higHJxD3gU2PhGEzYTc37ksJAK6M5d6
         Q1JBpffCfF/mS30UDauLwjGtNttx0JB7n/VfYJU5OBVeBA70XzTJj5ej5syN4AwFXhOO
         jnVfwFBioFBCs32toiSu9O7BwLhcBR3DW+tRARigWCVlTZTx3Uh3K3qiBGbyKmNvqQYu
         0WQ+6QeyCH0QZjBiTQmfa5XmlSd78dcLQIIDGE9OpFztj6S4fFn0111f0Kr9oCpuiZ1+
         N+q4JkSL3JNp974WFb9D+2u/W3zCJV2n3VxX2/7y5/lhbvYg+a+3FOqbKZkYHSjh5Que
         nGzw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/3jb+5C91Zu96MwAxuW8o8OyY+yNwE3gU9RV3F9ev52GU3Ec8F0doFCxviSPJX/Zc7qKNvj+5eScY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rt5uInZXuzjrDI8qIjRPIm4Hd82f6FsVljHGg70AaedgITCs
	E/4hzt+xlwFRnTW7CPqWR06Toq0gX0J3UnRD1pAb9t7CeHSdCVi5HlA2j01zSa2Ls3AY636Enr4
	+9iiM/VsrYfBaQ1e5yYVYV7/wbbAUtQO2p6qkZiNdr1dCiMJ6sk8Ah4haE5l8tb6cQENELvcY
X-Gm-Gg: AR+sD127vaB3vPxnjX8JAyrSU3mB+xgKkUAF3Qj2VEOfGO8j1wcHrMfvHc0hQlpn4CV
	SFQ3N/vMVEyZyFw7K/oqZbpirQS5UnGnYscfTN6PcKnh78dPzElfB3cPKlGiKTF9IeN1y/y5tCE
	o6hQce9zbezNUvX9SroUy50Q7tEdrZ7WnvJta4VtoKQntMwbjaMnO8ijYuyuk1+sx1q2qCirC3s
	LEJBWBkYL+9Z/oxFJr/epV8yZtiVm8Lh4kNGxKSxFaxXfbAldWxrJc9+QwEOMe5LQT+K7BBRq7v
	/zJd0TR5X957lQ0Q/4IxjsaKHLG7HY2rpaSzTv8uRG38TVk72Ebut77BZetWLMf3Bbxh9jrZCTT
	rVM1ase0IoEeAQOZNTIkjktOLzbw=
X-Received: by 2002:a17:90b:52cd:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38ec6661b73mr7464229a91.34.1784890820594;
        Fri, 24 Jul 2026 04:00:20 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38ec6661b73mr7464179a91.34.1784890820045;
        Fri, 24 Jul 2026 04:00:20 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af892bsm1290553a91.9.2026.07.24.04.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:00:19 -0700 (PDT)
Message-ID: <abd6cd95-1e27-4eff-809a-2d97f2f71fd5@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:30:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: qcom: common: Register reset controller only
 when resets are present
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
 <1eca6815953b50fe3f276b64d74be2795b8382aa.camel@pengutronix.de>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <1eca6815953b50fe3f276b64d74be2795b8382aa.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a6345c5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CcRILfWLW4tHOLBHFjEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EuWemhl4K6MoZADMpU3XPp76k9_pap5j
X-Proofpoint-ORIG-GUID: EuWemhl4K6MoZADMpU3XPp76k9_pap5j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX5bgKe+V4FGiM
 bN3NOMBBBI3lSsM/xIoXo0X+7LJ/PAijcBefG9uaMNujyRb+H3KigWglbuETxOO+2dvT93NazmD
 qUIQ81a/CHJJYtXz2s+o81WKb2brRQg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX9KkKkqsEay1i
 gRKVxPc9KTgMyk0aJNLebOnFd1OmtPdkRQA5pQ0l//N1+/8EmxTBmi6HcNU55NsJ3bys20G6cpj
 b6pfTQBuBsICUtVC3U1Om9hinlhMluFFoeQlXOp4WIYmEfMNlYkLMVtTWYLOX70MU+IX9LUx0gp
 qYJT/RrYG4cHehS4RMGnxKbga+DRhlqkygkHs08udsK4L3wCSevvfxXCZSCLmVN12p285C6AQIx
 iwa7CtmeK2ra/J96oAc2tWCEoUXrFadOCral7O2lWSsBySiSrIllQRsY7Sjbh/6VlRky4Onnna2
 1GmKMDByF4Zp2LJOx16n4gZ9wRYhGqA0oP1yRLyvHcXZX5UfPKEc2JqWpRfOn0hCw/sDSdotkvr
 8gqvAZdUBZWqocW0YdfPeL11kHPAemB6U3CdlTDpfJYVJoPdGY6Wfr0RwqtxiLnxwLiE0bH8d4R
 d5EX4OACKN+cKH2RWww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240099



On 24-07-2026 04:19 pm, Philipp Zabel wrote:
> On Do, 2026-07-23 at 21:15 +0530, Imran Shaik wrote:
>> Some clock controller descriptors do not define resets. Avoid registering
>> a reset controller in such cases by checking desc->num_resets.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/common.c | 24 +++++++++++++-----------
>>   1 file changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index 2c09abaf1d2a15b7fbbbfeb67c03075381185a00..d6ff83045da8f308dcb9c5836af48090323248de 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
>>   		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
>>   	}
>>   
>> -	reset = &cc->reset;
>> -	reset->rcdev.of_node = dev->of_node;
>> -	reset->rcdev.ops = &qcom_reset_ops;
>> -	reset->rcdev.owner = dev->driver->owner;
>> -	reset->rcdev.nr_resets = desc->num_resets;
>> -	reset->regmap = regmap;
>> -	reset->reset_map = desc->resets;
>> -
>> -	ret = devm_reset_controller_register(dev, &reset->rcdev);
>> -	if (ret)
>> -		goto put_rpm;
>> +	if (desc->num_resets) {
>> +		reset = &cc->reset;
>> +		reset->rcdev.of_node = dev->of_node;
>> +		reset->rcdev.ops = &qcom_reset_ops;
>> +		reset->rcdev.owner = dev->driver->owner;
>> +		reset->rcdev.nr_resets = desc->num_resets;
>> +		reset->regmap = regmap;
>> +		reset->reset_map = desc->resets;
>> +
>> +		ret = devm_reset_controller_register(dev, &reset->rcdev);
>> +		if (ret)
>> +			goto put_rpm;
>> +	}
>>   
>>   	if (desc->gdscs && desc->num_gdscs) {
>>   		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> 
> Is it possible to have num_resets == 0 but num_gdscs > 0?
> If so, the now uninitialized reset variable will be dereferenced and
> passed into gdsc_register() a few lines below:
> 
> 		ret = gdsc_register(scd, &reset->rcdev, regmap);
> 
> The whole gdsc reset handling looks very spooky, with
> gdsc_(de)assert_reset() calling directly into the rcdev->ops with no
> regard for reset control state.
> 

Yes, sashiko also pointed [1] the same issue. I will check further on
this and submit the updated change in a separate patch. For now, I'll
drop this patch from this series, as it is no longer required after
separating AudioCoreCC clocks and resets into different devices.

[1] https://lore.kernel.org/all/20260723155515.68A0E1F00A3A@smtp.kernel.org/

Thanks,
Imran

