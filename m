Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF4F23AB88
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940418; cv=none; b=XkZoO9eZNv9HW//Fyx/1LnWtFemdVSqcIMPG3KSZXNOaZMjz6/9EkvQpHwJCLrVossZilok7oNuJCiJIMKDzuzMPwfPL5EelzkTgt/utIbntR4PK4oN+wP+/Mso82ryG1jrVEPikj1LsWI0WpgWztKgOlssTVjyxwYArk1rji8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940418; c=relaxed/simple;
	bh=K1vpP8QuA8zQYdPUJk8kWTlFgWY1vvsRgG+hQYS2whU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IuhazigHfX4jksZUg3ksM/RK1y62m688oS0hALkpANxIfEusrHH6YGYshBjMhG7aQtx9dx0Xb6oHXq0Eddm0uiZ1U6lLEdZoXijbF/4aITvaWGNZQJDskzo/j9r9nk04XEA3YyjDTOmAqqclELlrRCNSquFfcpusrcy4aNO38NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JA/Uq/8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MxfVg9rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JA/Uq/8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MxfVg9rh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DLPA1h1404137
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KN3ePCWW2QO6TlI+zRqgTvBAo+xanlhwC6Wc8W2bO00=; b=JA/Uq/8/yfQ1r62v
	tHvDVB+Ng3rQIKEiqUP9hpRnqvkJHADPkfK8evNW8oncajLSh/zANc6FcSYOOHHW
	CdgBk+T4fz8t4T8fDxTb9byvY2fIgmyw4axygnlvVj9NxE2IRKGEHJHy45RNoLU6
	hjUhwe0MQl5T+7QviCt1u1Wqnrnoq26d3iZr0mveHOPYkHNMhtN8bQuOgpXsGqtV
	O19SE78uE9siGghVOUDEoRlRIi/HLnPc7FchjPB/wCMzotim+cPd9TmSICZ6JpCC
	M5thgr4owQV29EQA+Wi6ahTQEKQ/1EPNZ9pX3X7LBHgN0KSTlU9P3TZdCcBKVMc/
	Bk1PYg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9psk2cke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:13:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so333308a91.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791940414; x=1792545214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KN3ePCWW2QO6TlI+zRqgTvBAo+xanlhwC6Wc8W2bO00=;
        b=MxfVg9rhk5e98bNKbiWjNXU394o0tom4fc8ZYS0R8qeU0mtTgJtkTiAWcSxitqZxWl
         X7NJ0ucgW93ibLWtUB3nf8R5bxeFoXQ6D39piTxPlAoI4B5N0wtLCVPuJuRxSd4m42Cy
         ivM7zhqFnkmrmQQLiI6k332BNMtTrMDKLENeg3V/0T5NW+eT5yIBLp5K0nR5BI4IuXy0
         qg/mK05asUsB5KSjrTDv9sr0xrpaVhxH9+AlgBgh9j+4F+kPzH2AGWiXxLP7uV41whV7
         /4cnjVEqzgHdIPEus2bvsIs+X6vpeBQ2V2/KaF3jhGERHycHkby8VFgpJJx7fIqs0/XN
         clgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791940414; x=1792545214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KN3ePCWW2QO6TlI+zRqgTvBAo+xanlhwC6Wc8W2bO00=;
        b=Jp1CqvhxpoKkXoqiFKyEAY7BxN0NL8cfTd66ldC71UUv05qmFF7GdIudsxVkv2hNNt
         jP8tR5pxys/dUV8IcxQARQZIyfkNtxIq5Vay6Lhfi15XinIbaucOy2dZUcN4R9CfHsg9
         FTV2Av+WDq7RMhNtPgeimpgGNNhcfWiqXSLBCFHcFeyZx3bPZq51siAQ3iMhAet6YXue
         vy/3NdOMFnIQywziSnG18+sdxu2hgLSb8b8gtdujqhLxq98ThBH8WXHBY7fxJSydmo2a
         I4xMmW9DEN4+B44ADtA/ZJnhIRbHjsvRCHOCwxh0r6vUpPb65/Dk32u36UYEQznqJuw0
         70fg==
X-Forwarded-Encrypted: i=1; AKwUvBwfuIoWIteogN/n98WMil/xygedZuwq2W4GlB0rETUHcY3Qev1Kx/5NPx/vF/i4XQEWNpYbhYqqEHZ/@vger.kernel.org
X-Gm-Message-State: AFq9FYLBZ/GW6ruDkqdJH43VMmgTm+P4b1EB/PliZmvKcz1nckvreSbx
	URZO9ayo7jn8/1MeBUzco4j7oGfXg4/N/F85T86JVNuaWc9GM46OS+ERg7MIgFAvPTg/e12GtbK
	J1fjo3ZdvRzDedhhAYq07fYiwpEa3JeDfVfdFqN/7cbbp3IyKzQQeiXRImjc2WZvH
X-Gm-Gg: AYBFou2TmJvil+VgFyRwL9YkyT+PcFgzaAAR+MWIXx4q94dkS1ci6+KEKkImImm+rvi
	NTno2AdGaN7mZ5nlmB8AtOuD3rqJFx6SEETWGrn/WjQp6bvCYV28W6epvfGzCJl8GmJn/nhK8f0
	+zhpd4CHYrrFhzUDtgA960lGmqw6w6LRe7kwgSD18EgVugKCByH0SQYsuezEnmDJp44K7jHJ1zA
	mdkXXEWEluhxLPl5EbD7Mu64ootPDGC4eWKwV4SnoqLYPhRdmJEDt4yYwH5bWEcWHX7XUPjnWI8
	k5JnbBfqvQIWKU8MQGx3+U2SN55f/M0Xw33C+fDvT0Z7kL/aaCQStMqtY29BOSOaARKz49B84uX
	RwnxaP7gbkIE+FeIo17pl+6056vNNBIFCoeK4fYAQVkpgEMfF+Phl1tf8XLIzUic=
X-Received: by 2002:a17:90b:17c2:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ac5c873a51mr1327909a91.51.1791940414184;
        Tue, 13 Oct 2026 18:13:34 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ac5c873a51mr1327897a91.51.1791940413711;
        Tue, 13 Oct 2026 18:13:33 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm2153127a91.7.2026.10.13.18.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 18:13:33 -0700 (PDT)
Message-ID: <68acff8e-2696-4ff9-9bfa-3b23e2b15fd1@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:13:28 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS
 debug block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
 <7fccb993-8605-4eb6-afd5-94edef1d487d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7fccb993-8605-4eb6-afd5-94edef1d487d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HLbzgj543mKIwUZgIZTSdQpmGwYHcigo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNCBTYWx0ZWRfX1vZEz7mBZQXA
 noEzL2sDugiLwgOgs3k+itliY3oV5PSNZ94leGJJf014NTATf/Mm2LpglhHrqXIVQ5x4z16Nmtj
 tS6Ilw148tghwOcEJoC2NOIP1OHfuDE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNCBTYWx0ZWRfX9/oLMhiDh5KJ
 d4n9Lqda8jgLHFoxD/Pql9e4JrfIGFljHtnYfQ9qGF3qumgT3NZVwXnnXjFT5y4T7ST5eMGug7b
 7iPwLJjuX9Yb2KqDC55PlHQmYxIS+JbDq5bXWRqLbUg0Ri6iYulS91EX9lel6FpL5SgdHfVrSvU
 vqSekItqgO9MFkBfg3jg/e5WTmRvOggDcMxglpSxDG4NgZJAm7rCWXsryEglP2yX9hMmskboh4f
 St6rvduQkgkA4P7cJh0Pei0jEXe73gKpXWd/rxNweJMsh5Wb+2Zo0pqupOlflh13T6vsluJTYtg
 ptX04Gb4lLgRB1y5O7VLGJzlbcudckOM6HlPPwACPxDrODkKlpco5W+Yb8xir0sN+iBsdVQhzLq
 qEUwWij7/AwZU5AIZHakn9MoHs7HoX+Rpacn0mqseiaabcGGp+EnRd+VobmGpG2sHlHAhkOiF9Y
 2LmzBV41PiZQHAcu4nw==
X-Authority-Analysis: v=2.4 cv=cbJHPXDM c=1 sm=1 tr=0 ts=6aced73f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=i2zWceGxLG-rlMTYNyUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: HLbzgj543mKIwUZgIZTSdQpmGwYHcigo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140004



On 10/13/2026 8:46 PM, Konrad Dybcio wrote:
> On 9/22/26 12:35 PM, Jie Gan wrote:
>> The APSS debug block is built with CoreSight devices like ETM,
>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>> ETM trace.
>>
>> The replicator, funnel and TMC ETF nodes in this block are physically
>> powered by the CPU cluster power rail rather than by a dedicated always-on
>> rail. Add a power-domains property referencing the corresponding
>> cluster_pdN domain to each of these nodes, so their power state is
>> tied to the CPU cluster domain and the runtime PM core can power the
>> domain on before the devices are accessed and let it be powered off
>> otherwise.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		funnel@12080000 {
>> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +			reg = <0x0 0x12080000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +
>> +			in-ports {
> 
> No need for power-domains here? (also same question for the other
> platforms)

The power-domain only adds to the devices within the cluster. This 
funnel device doesnt sit in the CPU clusters.

Thanks,
Jie

> 
> Konrad

