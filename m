Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B0044CF2F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509570; cv=none; b=F3dEm5Djod35Yv4pLBfy0pzk7Gp4XD/G8QuHETtApxgkl7bf4uNMXX2DAvCWBzj43iS2U5rRKwfpBt1aisnlYFvfmhkyUjfO73LAAD+XROzdWyBsRyfpwQtKIfkiNMXuIPZW6l5pHtxJvIRwi3x3hKCjGAARe9jVZ/VOFuv6OJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509570; c=relaxed/simple;
	bh=Lmryp5xahhJqIfp06uw6Ni/Xws3g3QD2M6M4xTh1qsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rorMMe2rX9cBtNHjzRad3x/t9hF3jMsuaAwB370eqzAjPypaqIZjpIoUchCbwcHkxLl0wGmjf//BybnxDRHHjkeRWI6DW+6pvhD6W7XkCKM0MBO1I5ZaQYcHZEcGfjaPHiOlPaS1DYlLOekSJtPEAgkFUHdXdXOGlUUnd3Dkcy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfONenWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZDd3Rsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfONenWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZDd3Rsf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688AAkO2222741
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5uSMsl7Phk/stnh2/hjHDjEP7WKyjI+VE9Mm2SfsUlY=; b=DfONenWcqw14McpL
	J/DkqrmjBC9uVHzbFj2BzO9FRR8XDvuESRAWusGGxNq/tUsiG0SJWQRw/7RdOrwO
	RQ6M4luFVQ5NFi+VvaJv6O/5yPqHdAHc/LK9cru63xzU1wnXYn06YArhqbowOWv1
	GgN7VDQgEzua/mVo1G/X7xeszOpRbAf0FfZfYAigTekZXNK8KDVoG6JVh15Urab1
	vrUSyi9C63KyOd4noaCgKI0FBBmqlWRPnTvKYGdpchdzWipbENQrv7ejS+YRRQ/G
	fhw0XSDXEMWFmXFcdv76wJcJm1Ml6XNJAHKUWuriUIOcLVVTAzYKbwIysC0rNv9z
	xDI0/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csst65m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:19:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381d039b797so618442a91.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509567; x=1784114367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uSMsl7Phk/stnh2/hjHDjEP7WKyjI+VE9Mm2SfsUlY=;
        b=ZZDd3Rsf89T8ZVSmdNb4lZ8mKR8fmzs4NCIYfTFE6t3DbPGP5aaGYTKCzjoR8ZaoRf
         Pc7q/n1znXNblA4/yhmn04PNPckZTdkIVrvMudgETqyVNMF062ksUgLx3o2wNRbXkJG9
         EI0aNjNQL5v53vcLQ4GMC6X/tfOJFP+ZgBs/iCN+tn1x5l9IBWMsyRiTxTmSu7TYkyhD
         PNgtPRphuEAU6tK7vLLl1W0OohNGqX10MSJVxjdsBMvj7HQ9vQJGMrwaiQ1fBp9zMnre
         V1lW853UvOV4Wt2sxHueMIj7zmrzUzbBQP7nWsgRN1EA9uWOiEFwsj0pO7GCjfbaDhLD
         44yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509567; x=1784114367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uSMsl7Phk/stnh2/hjHDjEP7WKyjI+VE9Mm2SfsUlY=;
        b=R9P63FWq2zGC01OarRcygyQGsbd7gWkby+RV2vt4mtUsjPVxNJkxwOxpGzXZRV3IjU
         cHWQc2KdIjSKBo4KlkY0CiXJR4v1ut0E7xS+Z/oC+j+oOKbGMP7U13ivo3btjqLIA3zj
         /M6t1ClLfqzGdGfRMM6UeRaQpVbleGxInYRj3XLsrYs7dwZ5OhA7XbgCdR7Xbs3ILTbv
         M72AxEXcqa3hpTGgvJX6m1Fdv/JAJuJWJObCOHkA+DytCqxKHGKGaCgv4S0hPGEXfeGo
         R+dAM+iwJ502LRBhTFLfrtcTnDfIB2GaTo96fJ/D1OGAvWRBmEaCWdtlgBv/p3M901SG
         Axgg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5XkFLroqp27IYZgC0Wk4UJFZDks8YvluzRX3q+G9mbVRotZRbUpwI7ZylIPvbl7GYBOixrELSz2za@vger.kernel.org
X-Gm-Message-State: AOJu0YymzCJX2g3TwIT43Y2TIPsHYuLvZbHzHTz9G1ZPJ0AcW3b7vQRW
	KENYEynS/z/7JBSRmVQWszKRe+uJpAvFKyDzSQBXqWveAsxSholsINys+5ZL6NP7Cr1Vl4Hmac6
	0mAx+3gd7Ru+MCyP4xr4BX4j4/EjIPBYAjCz91o/AfCTG724Y2WhCnNeMv0Cpx9Ui
X-Gm-Gg: AfdE7cmsDltjyzPXYlMwisyorv52kxCRyOTMGhe4Wj+ZFv6nyEyWRmbqtHSZDejH4TF
	IcIYE+6aVvNEXptVuu17VigtBvMn5EGemZRWNi+u3vCb8rs4j/pScmX4kqjf8lX4IrE2o6ZlxS6
	to3Cvv6dISVqZknbXbsDlUSGY18tOnOmEsRAZyxHwGRRH/Ycogtj9aUp9Y5bgEpNDwqaN5Uh4nr
	9S1emVjqYaPAWipLIKhhBLLPIB71KdntNuF56kuBdSxA/QFgeGV+CFSTtzCJrZUBg7a8IQp1r53
	uUgrmTnpab8RZW9LnCqhZaTn2VjpnAh9Qa4uen1fsokB+wiREZ9Yrw5qbhHq0FhYq0Sm7RxRnXT
	aV0sNmzb+0vZr3VLslt9ywZsD/9WphF8IpCnWb1E=
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr2290735a91.5.1783509567017;
        Wed, 08 Jul 2026 04:19:27 -0700 (PDT)
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr2290700a91.5.1783509566602;
        Wed, 08 Jul 2026 04:19:26 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d17ec015sm2578846a91.9.2026.07.08.04.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:19:26 -0700 (PDT)
Message-ID: <ca92af9b-2cf0-48a0-82a8-3c48b4ff5357@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:49:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/19] clk: qcom: dispcc-qcm2290: Set HW_CTRL_TRIGGER
 flag for GDSC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-8-cc13826d4d5a@oss.qualcomm.com>
 <94abf47a-0fdd-4dcc-b56f-963ba80ba33e@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <94abf47a-0fdd-4dcc-b56f-963ba80ba33e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e3240 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aR6tUbKHR8Lh8TkzPOEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX1PjRgKWlTxtP
 tZcMofwtfrw3wJIWjUNzwNS4zd8HHU3LCQ62PAB7oUz+RSjrWfD6aByjp9eEK6ik8ukUDai4hqY
 zCpmhxfXipwv5DOyUJg9Up20GhwDKk+OAh01pxj/lMnxoKEr9lt1LkiymSX9sFNni1slZK/Wge+
 vl7RN16RZ47pOwU2gQDJGjyFamEbhmG4XiqMeZVLh0SGkP0uAVQzXmLFrPIHCsDrW2pRtliQGct
 Mx1cBtJjUDPZj4mXiIAxmkLbSGupaiAUBNRDKKUV8BYEUwtYp2vEdA7aXlhR2WeU4bcyZx8QWlP
 MdQD7Nkiq5MZB7qVPopKgCxNfGFykU8p5OishE7icaOsMGjv33YIUJ7FH6w/1vH6FFozmhlyW3U
 SCwiydFjTvLSq4lV8CzmRFw9dJ9AjjyrPH8mDB8TmwPNS8NWIZOYZnXBgM9IdlgMbDQ6EmNXRng
 e0JcnHUFevCVhXzc+Fw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX+tA+cLzWkxuP
 GF052SHLAFXNV1nrfqZTl3OXULlPC0G4j2zDbeuQN+9XACJM3pzUA4a/ngH3kVCHDGNmTLBNryU
 wbZAtisbtEPMABndd9h32Y6cdrHEISk=
X-Proofpoint-GUID: d_cZQ4ka5O_iLgAdqHe7IkBT0_ZlReOc
X-Proofpoint-ORIG-GUID: d_cZQ4ka5O_iLgAdqHe7IkBT0_ZlReOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080110



On 03-07-2026 12:54 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Set HW_CTRL_TRIGGER flag for the MDSS GDSC to provide dynamic control to
>> switch the GDSC HW and SW modes at runtime.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index 6f8c21f05ba4536d45c2a609d152f871cb875bbb..89a6cdd26217381cd44a515766363cf94d0aaeeb 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL,
>> +	.flags = HW_CTRL_TRIGGER,
> 
> No other dispcc driver sets this (other than kaanapali). Downstream uses
> this for when DISP RSC (which agatti doesn't have [1]) is supposed to
> idle
> 
> Konrad
> 
> [1] (well maybe it does but there's no RPMH so essentially it's not there)

Sure, will drop this change in the next series.

Thanks,
Imran

