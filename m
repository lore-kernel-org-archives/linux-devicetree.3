Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8627423A68
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563852; cv=none; b=R2OSfI4BceqaSQtPSP+eel5amIJgtJIu7MbHkMBeOqmct8oiSKZnHLsBq59Yo1OibU/hv9aY90YM+5hIQVMtZ0mBFLndrswR5JzjADIC+sj5l8BXEgshT94IlVbFzVd6T9XzIAD4j9zF9vDglOgDRYiHP9E6o6LXT9ZvQnjpmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563852; c=relaxed/simple;
	bh=nhUUkVi9/hcYpl+bQ0fHNNneX3Eu22Xic+NtqQ3E/qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUR5ajSc9UfrmbmSpmLok37itXntbmpa+1pvYYmPPkzGjAGCmTLIhdsalH/ROIgd8UhBZ9ixl907GLlh5OmcqcI37Pt3auto29tSSB0FJ9IKIWbkzM7jF47cXcpn/vmNuok2KJxqnyOFWTl3ca1MdG1zZ5wwEJcFs2Gb+vcMwHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1q/nkbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8U+AfEm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1q/nkbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8U+AfEm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDNgBA2480963
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 15:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17t3T+XOa+UMBrL9L1bRnwu0sMA5ZJW1jZ+/PIyf8Fw=; b=m1q/nkbnbEl3h9ZS
	QOhSS/CwDIZqfdQq4Z/bKLWv4ePXtO69SrX/Ohi1Z+Dt/YHTCpjHRimvenu5S434
	ZlDYJACOyv10EKlPFslVr46Oypyh8QnWw7VyVcueZdPSLSGEQoS7BEl57tf8IxGS
	9aRwpFA/LSPy6+glSyxK/xjx+PeGl2mnAVHL1bP5SjkX94rD9UIBkcrYYpmOwDVi
	ts67b5eQTnbc4PjbukcrB1SGTyRRh8X3b/uMzotv1qzAmOpeRui/2pbfKeg6LWpc
	W01+r/GaIApHdBAwWKXntiZCZ/88SUxirMMpfBfrqf3OPlRCxjAK9xcz8KNmfHek
	toKWlA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7x6gpwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 15:44:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so102472137.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777563847; x=1778168647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17t3T+XOa+UMBrL9L1bRnwu0sMA5ZJW1jZ+/PIyf8Fw=;
        b=V8U+AfEmIe5bFWNygVNsnyA0x6+tCg7LPKmcZsPBsvszzpnDs4HzjBMD45Jb75OlzT
         M2G1pyRzyUvGGtftYY2q89CyP+QbC+RkPIuBqqsoiXetaQlw8krNworxEDFnHpIDFMvG
         unZhGsLV1tArJlVInZQH84pgrGVUNdafh6dFrwdjn1nbNnaHboTtwiLFtXREuA9WGvUT
         FgI+DqtP/fVTYPs5EX7IGGnbKB7A+3RF6NLLY6mZNChQieBbWaq51jO8/dRRH8dfEB1s
         RZvmz9dN0sb9gJ2Udl1mxdIdj1dcYm2VDBb28VVELCGxww+LKAPeW/+CuHX5JZ5owmi2
         KdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777563847; x=1778168647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17t3T+XOa+UMBrL9L1bRnwu0sMA5ZJW1jZ+/PIyf8Fw=;
        b=R+fvzDUzqpb5vsmzaKOpd700ixUroYGXxNEZCAk8soFrZmXs+/YfOrhE81HbyunPih
         sa7Ul1qUlofzaDuxLo1/gJ/QFkeQK9typUsUiYxqG7EKIFDZpYvhQR+Gre/6RbZJ2ckO
         DBgRciGWrO/hDi9/R2SxXkmI57H6VBwEs1DJ8i9SL7WGcGgNPcSZcCigdWeLQtz/F1W7
         9W96Cyz0Uu8iFornKmk/BWyjGKwpDXoSAOmWB53iAJTKzQRN6ZzjOS1OEF3R3Ej8mlYr
         s6f//ziyaX4dQyxXVXeGGVmSIcN3y2guFBh1ew4+Ov8173clbcuo2tOCKEUwMqgvnnVc
         rUxg==
X-Forwarded-Encrypted: i=1; AFNElJ8/FcIeoyl/iprNV3X72KexomEaF27E0YAU1XEc1/1ccCaSWRwEdvk7sa7iLVfvwym5SDrCzYz/U3NE@vger.kernel.org
X-Gm-Message-State: AOJu0YxJyUt5cu71l/VRt+LOMXAvZjLEqlZFjbk6sL/kLJHXvd/2U4Ms
	nRyRkJRO41+ZyDiMBUCitWHVzeL7lEHjYNQHlMH8fPwpik/BOCI+VKw1yZBor42v3gfDr/A8kHV
	CeIshqvHHuU4DQWrpaIVAV+ItmV5VooiwZ6uZ+sUPHBwlC89wGi9IYl2t14g1aojN
X-Gm-Gg: AeBDieu+PuwKF4KPlQEMqKrvWhLJ2Y74pU+5or7PWIwnZ3DBPwOX+speBrZ/cQhdIx9
	eI7cRG/hD1+nAwRoor4ifvmZzcBe+3DNou6d1cuLxXsjbrOBQ/Kb5f/bL2+703bAzprs30N7Dd8
	skiCd7lDXzQ+5/u4jUuPs7YsPo4OBKj3iNks4Uy8Bq2IdNMc83FnHRvBhBS8MdShKvw/Xx2Fgso
	a8wEpJjuQmKO2pvvwwEpOet36CSVwlU9fVzGMlFG6S5AfapdWTrZs/UyDCoxpFUnfeQtxnbsduM
	F00gf39gyCc5rXoHxWLZ7Is4b6fGbxArD9lKqBHQXeUj3bH4G6ToyWmJ060UWfzBOWZhC18GWK6
	JBfNMeZaON5AjwcXmxdKxxoNlllB6jeYohjkdCUD1VrvXxvu5XKMgnedC1luFV4k77tIhzxBhis
	zPe2lQL+bracysSQ==
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr640446e0c.3.1777563846772;
        Thu, 30 Apr 2026 08:44:06 -0700 (PDT)
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr640426e0c.3.1777563846217;
        Thu, 30 Apr 2026 08:44:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d4cbsm12589166b.16.2026.04.30.08.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:44:05 -0700 (PDT)
Message-ID: <a74a19cd-2a33-404a-b074-58a8d7d53279@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:44:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
 <5vkpjjuq6vh2mr4lcq5cwqd4h5cbserf3n756d465kheuwl5fk@tu3amjwe5k57>
 <269bdec3-6340-4b27-9b38-3fc1dfc958c8@oss.qualcomm.com>
 <de7a2958-e431-4162-b0a0-d58bbebb600d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <de7a2958-e431-4162-b0a0-d58bbebb600d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FLJCdADkrOqdCDHv3kzGG66xURcwHPkI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE2MiBTYWx0ZWRfX4GwPcVBoaV/5
 yMjKhuvQjXjm9uAFsRQeW1FMeXMMNKT2QcL2STbaYj6fezlxI3syhyCz83vxci1jTqFUYm0tm/r
 mXSVNO+/LBgsdUZtg/zamK650Wm2WHYIHZb17L8RrJK0aprGJe9LlWMi3VWghC9ZYoDicFF0//K
 JRQUEOywoaVVVPolb4cWXRkqvqyf8X6eGph18OOCJshL4v+257tfq1lxnEBzEprsPDQwDDLS/T1
 ESx3pXpKR1T7RCqZqRxF66mlktoKD15KaforK0b/F81FWG57Vk5ddefOUA1NvURUI8IR/YOLm22
 dhWz8Ut7G5XOgD29Jjwn84nZX3Y5aHMxha7Rc8AFXc3DZpzLcBT/xxvjgZQA6xTTytF+/zGEkxC
 xJvOnB3LM1TTxSgKXJ7Ef9rllixP6g15EKOYrUg+S6o1HKOQKXE1sS5X/0NKDTucXlssR6yRXT3
 VW4jKSGReCVrGH5An/A==
X-Authority-Analysis: v=2.4 cv=XoTK/1F9 c=1 sm=1 tr=0 ts=69f378c7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=C5MmyifQ20IcwxlzDtwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: FLJCdADkrOqdCDHv3kzGG66xURcwHPkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300162

On 4/28/26 7:22 PM, Jagadeesh Kona wrote:
> 
> 
> On 4/23/2026 4:43 PM, Konrad Dybcio wrote:
>> On 4/22/26 8:28 PM, Dmitry Baryshkov wrote:
>>> On Mon, Apr 20, 2026 at 09:59:00PM +0530, Jagadeesh Kona wrote:
>>>> Some PLLs are already configured as part of CRM(CESTA Resource
>>>> manager) initialization. Add support to skip PLL reconfiguration
>>>> for such PLLs that are already configured.
>>>>
>>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>>>> index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
>>>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>>>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>>>> @@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>>>>  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>>>  				 const struct alpha_pll_config *config)
>>>>  {
>>>> -	u32 lval = config->l;
>>>> +	u32 lval = config->l, regval;
>>>>  
>>>>  	/*
>>>>  	 * If the bootloader left the PLL enabled it's likely that there are
>>>> @@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
>>>>  		return;
>>>>  	}
>>>>  
>>>> +	/* Return early if PLL is already configured */
>>>> +	regmap_read(regmap, PLL_L_VAL(pll), &regval);
>>>> +	regval &= LUCID_EVO_PLL_L_VAL_MASK;
>>>> +	if (regval)
>>>> +		return;
>>>> +
>>>
>>> Why is it being applied only to Lucid EVO PLLs?
>>
> 
> Thanks Dmitry and Konrad for your reviews.
> 
> This is the function used to configure all Taycan PLLs, currently all the PLLs
> configured during CESTA initialization belong to Taycan type only. I will recheck
> if similar logic is required for any additional PLL types also.
> 
> 
>> These clocks already have a an .is_enabled() callback, could that be
>> treated as equivalent?
>>
> 
> We already have is_enabled check to avoid configuring PLL's that are already enabled.
> There can be case where PLL is configured from bootloader but not enabled during bootup.
> This check avoids re-configuring such PLLs that are already configured by bootloader but
> not enabled.

Okay, that was the missing piece.

Is this a micro-optimization, or something highly necessary (for e.g.
glitch-free display)?

Konrad
