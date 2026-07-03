Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370522EA754
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066706; cv=none; b=KUwHVLzUJgQApfc0vdBeJqlsq/0CYfgUPJkmp8wBygCceb1ZlIP58d1p1kIYpIQSRHaTgDxVJ6iiNOKHDLy2p1ThydVStoYV8FJpVhWrL4WVpORFjmdpFFfc/zY6zIeL4UypoR5xd0xV7tJDAoSf1irHViHyMxocDsnFfqmUH/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066706; c=relaxed/simple;
	bh=X7A2d8nw06smgyIcTq9KpSNNtCB1qTjlb0Lz/P935uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9d9UGQ2OIAOfpas6muAKMNv8vhp4ND2yuylciJfcYv0cejlNDRoFe5ln91ixsbZs8nXCvlQSNVWFqQMIgjwjohyp6qdn5szppdZSFx4Hy301rRUVMkMvIPau2JmF0TNUpDVV5jBvrQEp86eon8x7RmJ8EdvGIDBJxycLN8YIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZAkf10s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqQRdGYc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZAkf10s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqQRdGYc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66368IIp3054318
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yHznjqxcH8V5jOn4X+unmnLf9eh1cHDxSeH30hTY1dU=; b=CZAkf10sVKZ+Z5It
	TiO0mQoDevx3Rhg54OrCNL1N+ozBkP9FH/slp89WHvQSsEq7DcyJPp+3imxnfm8y
	PaoLWfGsaocaQEXd4AnUZD/4sPMLMk6tX0POejoffawL1mYG3hk9IYMmwyN3lDCv
	Rz4YRz55iSURxWmjSE5JO57fQ4/JQbHN7yHwE/8DozGSROFGVX2FOP02Wv29AY/n
	qirXwrLFrDzgawSuwiL4ZI3R5qR0DDrw0TtmAvz4Pq0zlrlI9rVL+Iw69F/o0uLh
	LZICJLQMOsqvl4WBWZD4tvlelnoGytXTR46G5IfixDRLg0u5jvebUHtNeLYR+mTX
	bx8K3g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00frp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:18:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c860544c077so919227a12.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783066704; x=1783671504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yHznjqxcH8V5jOn4X+unmnLf9eh1cHDxSeH30hTY1dU=;
        b=KqQRdGYcXY8seHqrd9YjwbAW5LqBHF9+QjtjOc02sU2ar8D353jqCkk/QTyLO4WovL
         pRBNHUqcVLBeGJYJrXd2rKaJdE95tZ5MgjNgVT3zhcXfc9pUGvsaxEqvuZdwrwtZ8JIg
         FxOlh3ZslSvDgJTmd414di7siOYSIQY5PqUQQ77m3OMFIk48DfQrYJemmtFC3W1twyts
         pfCJ9ScLR9puEHjOpMmnmrxQJJnHvtTJRO/nYuCqc8y0JS+9N90vwYMnMfhYRNdzVWDg
         SEVDd0DyHsvzTubwMR7T/5tynNxtddDyxJbi4TScBT5UsEvricjLVEemqSLMc2DSj4E5
         hCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066704; x=1783671504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHznjqxcH8V5jOn4X+unmnLf9eh1cHDxSeH30hTY1dU=;
        b=ZLMnbjcErylnXXBzUSWM2as0/P79Jj6o+g5FIVKtsE2rWZLZJdIOH93D1MKs9qOu9+
         mKWpu6k5Fi0oJ5PzefFjIQCxbG+X6i9uSYfdcoSnvbujbPCSeOklFli8fefwlpCx3aib
         AmB4IFN84DXK9i6gSa7CR6DtCWdE7lnHyORgdR5dSZ4tubqt+WNCdmTgxfEodRQKe3dc
         udMW/hX/ntfE9bXuIs1gVPPVvA3r1+bTVo4ve2yQtY1l9YfT738n4vLtR6VeY0gMwk1L
         PgexJgrd6shrJB32MYptoCGbqAa1wU3Os7BQ8av+8tLvecg2OEhduWh/ME9b+u3flpEf
         BTMw==
X-Forwarded-Encrypted: i=1; AFNElJ8J9+OU0TgtwbO/EAMMn9gws1V1M8vAW9g0Eg/4jObl2MQmUuQ3sFsOpoRni79R5RkZ+eF/e5o7lP/t@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7g072oQysy3vCgvAN4vbWClB561QJRusdFZDoL//YvbfkgXxS
	X3BnZRzwxmtC+xj5s+0AXmpb42r2coHpPfAJur+tK0+qWVacq1iSIVEVv/Q8UQLEUZJNOYHjBKq
	CFLoBj7D9fDHQVF0ILZVCntOE5LxmezH2S8IBJatk3q07nWl7u5PH9btxqafgxGLr
X-Gm-Gg: AfdE7ckIckCfyaCTnzNKTY6BO+niU7Wm8uNT8ErltShPvohB8E5ahaPVjcSOvz8bq9t
	3kvyw3x47BsPNuPS+V/QeOUuzwN8Nb0IGAQs8KqO7YalVINkLeonT3/KDc/CfKsrtI/gdrhVGeQ
	ZizVTgGJF1UY54E4WHSBFsc8IlQpp7ZGZpezCzo9sno9BgYlB1uM7Z9CXM2BxpLLt5i12zYXu0U
	BM46PReLnxO37AbpiFkcVn9VF/d4FmPkuAJa3A9hDZyM3RISiQUV3mTXjhozwMIHWUkTL3w5WqU
	0rCahqTybZK1xajh/cvgdBwea/exDRtNoe8rQet3KX0RbmWsHUEB5HTImPNi9qY66k/UN6kec1V
	+CULdILLlL1+PDRiyyAuPacyPTgXD11d4Nuu3DoTS
X-Received: by 2002:a05:6a21:9f07:b0:3bf:6c08:2847 with SMTP id adf61e73a8af0-3bff42f825bmr10946886637.54.1783066704021;
        Fri, 03 Jul 2026 01:18:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:9f07:b0:3bf:6c08:2847 with SMTP id adf61e73a8af0-3bff42f825bmr10946858637.54.1783066703563;
        Fri, 03 Jul 2026 01:18:23 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm21148189c88.12.2026.07.03.01.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:18:23 -0700 (PDT)
Message-ID: <996d66e3-76a3-4d12-9e79-8dfe3e96137d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 13:48:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
 <87mrwcqejt.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87mrwcqejt.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7xgU48_KHSM5TBcS07XeLsnay_sX8izO
X-Proofpoint-ORIG-GUID: 7xgU48_KHSM5TBcS07XeLsnay_sX8izO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfXz18R4+HUmwQZ
 +Z+jglnx8XmhwkkNYYwN7HRVLRyDeWqVf54INuGjMeTckaZflSB/hT8hCbZkTZLwzgBcwWy0oKe
 cQIJrepETYgQ20/1kQmY2WIKskLMV5s=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a477050 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=xxOP1YzqUXX0Hlv9yD0A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfXwGPloVsepxxb
 2IDb4sWAT4oALjQncOwKSmX1l0CM4W6b2d4GCYI1id6R5fSj7VfcehDOYAPdDwsqnUBtu+AiqK2
 SKkVX20X9r8vvrFDbJQXIDAlLwSGfEnpqaFRJa4Ar0nvyGWNMkiSimmf9utE+Eh3BcZF+aJF3IG
 FqD5WtYFEiMzJCv3VZ2O4jPdW8FJLSpva235aMqXrsQHfmRrKsUzk6mq7Tu9xb9oAhABTK+z4pN
 YP4oIlOxB3t4j7BwghMJAN27tyzSO+ygx551v+NDbf8aiJfX3J5ze6l2ZBReQKoy2dirBxvD/qn
 GsHF5SPaD9bDYEFJcm/RHp4qdFdUypFZEUF+3wvnMcGFQ3QVlUc010/4uMS7Hrs+h+u8PP8tj2D
 /GWu9JwMeOIEKJdsFuTCoFD2/JzaN1AjhNLC41QIfvPC1rnjSQmNHDL011bUAn0H/PGqaxK8yLI
 BJ13L6JVwrU12U8ikvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030078



On 6/30/2026 8:08 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> @@ -336,7 +418,8 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>>  		return -EINVAL;
>>  
>>  	pdc_region_cnt = n / 3;
>> -	pdc_region = kzalloc_objs(*pdc_region, pdc_region_cnt);
>> +	pdc_region = devm_kcalloc(dev, pdc_region_cnt, sizeof(*pdc_region),
>> +				  GFP_KERNEL);
> 
> No line break required. You have 100 characters
> 
> Other than that nit, this looks sane now.

Sure. I will update in v4.

Thanks,
Maulik

