Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41943AB272
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756703; cv=none; b=ZuF+WPPIUsWgk0t8Cx0SnehuPq1H5Vj31a2zXqyZ7adeynmGVZWleFQRHQQQKMfIJuduxrNO3xLZ3J9Dvn5HYCpk0Opce9rcW+YnpvG8vLy2ZqBkhrwGRo0TXsYH5BczZswersqQE00je86KUqOcPqKckeHuSRe16AxNMqSvv9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756703; c=relaxed/simple;
	bh=u3gUqEFCqBFp1uYEWel+zQoXaVkE3Zg5KLkQo7FbJe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryf4KETRcotr7DXx6XdB5PHz21cPkLa6SAD08VG82bimygUgEuAtxfXmaUIYi24RQc45+4/wNGhbxi/2ZhZT/VSWMrkmgAxsmNhLUQ1kJSqbEu9v53ccEHypRgtNvEzhA8wH/VIg9NrdbaNsYetgybgdEpSyUU2lA0CfgQE+dgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osiu1T1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfnXMnQZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osiu1T1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfnXMnQZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639C2Boo4107882
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 17:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=; b=osiu1T1so6UWTxBQ
	LaeNqQnw46yuogd9E4IY+PxqdIU2I/S/1Mhaki/D1WjyoKpVNJsbKCNQZILLj0cn
	amw1h43ICKhDkuivV1jLCYuPp99BNR2T8h8VIyOOvu/Z0X2ONrNgFK6+KP3P7y+M
	8DDvaCfGeCvv5QR7tdmybH7G5CuOWgEFlvbEdPp6Z/27n79FjCTLRSFa+uyxyrm0
	I2QuwUvodW4Imnw1ZiAaF0Tx2f/1PMCtxG/KSKnls3hwv31yqv6jFbDzIOtOfAEt
	aiNgcIAZP3vOjjMNixupCT224BWqIAbMJOCCRlBhEHzxulI4Kpj0x+e2Uo20jBlj
	3J7LCg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxham39p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 17:45:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2497cc190so5888405ad.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775756701; x=1776361501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=;
        b=HfnXMnQZ6Dl22VeCPKA4faANkDrj7T1SXl+ja+AkzMOI2BjnyUL6bWvSUtwhzcIuI+
         11nlsPyH4MTL3GHvVOue5hiLqdDmhFp3xH/gL54woTtl7TKvdB8JBp2gibZ0PdBY9XRD
         38P+cbNV3buePU73zRS7pqfrUFuDuCIJnHxiBmcVqbtl3EqXV+r/cdXxsmkajVX9JHTU
         iC27oAHVg7WZeTqhg9+GrJ/J4zeuni0gAEdwJIopWhYnwE30EJz4HNvLb2ykKpZnYCeI
         Lk4n9AU7ptTdqx26zBxKV2eYfoxQYU9LJGbSCo6erdzLvAGe1fXJCfrC0d51lRLCsxjV
         BFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775756701; x=1776361501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=;
        b=r77KitLCnX44k0d00RiEVmO9r5wDo3FBboN45OAHRGm92PdyDcgHsZ6LievrDf5amQ
         sNhB1f6ZrIRN5HBa6JdJT6R3BaZ5O+PMYtnoV4nBlXC7MXOrXiEjzCkp6/xV2nySV3SM
         mhbq+J9MmNnV1Pt5kHL9EmEXlB011E3VIblOs0g3fKw91y0MFuNtLLUViiGNkG8KZp8X
         yGmvt7HKnVRGRtrdwl7HmqpJ5QzQ8MRkeIAvPpV7yrJS5igC8Hg8qrjV9e6kv6bCHPV9
         IMcW4VEUtvlr8fCclWpv57Bp6WZ1eoW4IQUMdVzWp5mvpFN8L8+haRBt6RLwILZfIOA0
         9nGA==
X-Forwarded-Encrypted: i=1; AJvYcCUxiXBU2rD3X6N6XfHc8s6Md3g73+rdilE44KAyseeIEj5fj+lE15h14mCcEsVXXe/8KEikYoBOEJIO@vger.kernel.org
X-Gm-Message-State: AOJu0YwbhCk54NOIoVhTNjCNs28QQqKSC04MUqO1cfwQ5ikyjOqA4uJL
	7sqsI9AqfGMt4YrdNCP6V0ZI/ss1yvS0mqw27KfCfAzuN1v9OsCOgRtMifoq7wYjK1nZOw57jqq
	Q4vCZ93nlAq0Lht7Klj6l3hL3G9CBz8C9HzrECfEcy0XiA9pPlclG6ucEvU4w9sKx
X-Gm-Gg: AeBDietEup27XyaoJaU7qChiD3TWOo2DGTJfrDx5orO/ENNuRlqJEy6xDrAcS1kyvLp
	5retbeoHG1r7s3a3eUs5cIS1nhR5URKdAihWATOa2+jDMLtb48/KzZ/2zG3n+iGoTFKhAr3Sfm6
	zlGQA6pk6j2NX6yOljpjVt7r4TjPmAmkN2oDIFrFZWo5yoJ1JL4pjlgtz0M32xPGKjYnTunrTAk
	SZ7gZypAzIer101bqSKGGo9hZ5Et/sZfew3WsRk0NG6jfSSIgaSdETWaB2ieUN1MUPczOdby6Am
	qra/xXtv4sCib8Do7xwSd9qW3rm6uiEzmN8WRp6nescFfS1Bh0787h4ddrWclfoEzutcaSFQJZa
	LzGcFOl6IVC8j0sD1jWfM+nsqM8VGgndkD2xMd3o9okRgkCpDBg==
X-Received: by 2002:a17:902:ffd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b2c73474b0mr38712655ad.16.1775756700530;
        Thu, 09 Apr 2026 10:45:00 -0700 (PDT)
X-Received: by 2002:a17:902:ffd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b2c73474b0mr38712455ad.16.1775756699932;
        Thu, 09 Apr 2026 10:44:59 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2ec20sm1392665ad.66.2026.04.09.10.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 10:44:59 -0700 (PDT)
Message-ID: <1b17af8a-91c8-4ea4-ac8a-d8e24951a9b5@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 23:14:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver for
 Eliza
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Akhil P Oommen <akhilpo@qti.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-5-4696eeda8cfb@oss.qualcomm.com>
 <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kSGy0ntUX6pkMoeadeiGLRqEbxZpGc2I
X-Proofpoint-GUID: kSGy0ntUX6pkMoeadeiGLRqEbxZpGc2I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2MiBTYWx0ZWRfX2Qjh2XqQ8Gv2
 dLH+Q1xi5Fihil8/a179cWpAQR2yWfD3FfH5n0fNzQcEDOcXSHTblo8ErtmjzkanVZ6vX+08e5h
 DabJ96gALCWDnOMEK4ae+ih2Dkq8+ZDvzoHPh55cusGLPMGo30s1RhgSrvtvB07sLXeJfcJLSgS
 0gfDSLd/bwMeDk7X0mD9y2Gjd0B5AuVSaLtIlkuACmtFD2EZFHEhztlIHH6mm3uqiIv6EdTrh8z
 I2XRR5r9B3qhph0Qi47t3DzVADM7amnOR0oB+AxuYOdPhDkpeDQ1PgtKuAKd6eQZYfsxz2+lmMy
 jKbFfbtgfmN8GDn70e6rP7CP2q77BvqhjoMhcRPPPh2CNoIhnEqQM9eCCYmauToXZ2uoOoBbD35
 shzuTr56OXfiHtKLDHuHG9UUZJc+HplirUiCgNAAn8cyvCescr4h2seUHC1PDnh1cAQWdLg9+Oa
 yrLNgwclT/gWUwO+Itg==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d7e59d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=oNSZD+MgFY+5WZUJqYhveg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=CmEREM0NDXUXjFKD81IA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090162



On 3/19/2026 6:25 PM, Konrad Dybcio wrote:
>> +//	[GPU_CC_FREQUENCY_LIMITER_IRQ_CLEAR] = { 0x9538 },
> dead code
> 
> +Akhil is that useful?
> 
> [...]

I will remove the code in the next patch. It is not required.

> 
>> +static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
>> +{
>> +	/* Enable frequency limiter irq */
>> +	regmap_clear_bits(regmap, 0x9534, BIT(0));
>> +}
> ..sounds like it

I missed to clean it up.

-- 
Thanks,
Taniya Das

