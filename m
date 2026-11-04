Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796138;
	b=1fpRv7j4+XEvascNfjdxPYsECnS45yJToBj7bkJAzPvdmI2PQAufo4piV+nok/u1fgW8
	 jCfGowIiO9o51hcP9rDQQA/bDbd4chjVVSdTRzNZThnD+189yFcNQbN5RsdDp65cPDgW2
	 NgANAQaXLPVRwVbak4WNyB1QnddLrAtu6r4xz/Z6iALCNA4eN9qvztiMW0gy0Bbijg06Q
	 F0Yr4mIXSsrddx/0E3gWNM2raf+ZsLH58U3ZalRl5Z43otcqeA9cEDX+FJ+Rvx18KtxAt
	 dVM3DyOxX/NZ49lA55jZrNo2++ItLLTgAgd2SaswuWz/0yeMK/QKNUQpTf+jQBk6cMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
	b=e2eUiIVJNHb5BqXlsq5Bypyoempa3nZGJFDGZRzZ8z3FYk8K+KNhm4niIlNl3k6rS4uO
	 eEu5OoOCEhsBsa2P4XQEseYEwvkbj9VOy38mGG7vyRu5648CuAjBNtw9W21gGeP/WJrZg
	 AUCWNcqdkpwlet7vnWaQ80Dmu3n8dYzgzevSwPXl4TO6EeuA2y17q+nlVCV01Egj64X2o
	 snAOslQO+3fQUQuwaeGcKsdEM1Gxe84lktfpTGjHSyYQq+Z2ZkS6eQsWVb6JVmrCSeD2F
	 nM10rDDO4yNcOU044yLjY2OqWhTdIeFI6xpJvlRSsc/oRVTXyH5kW4jXf8ckapfKNLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiT1E2wl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0FhS9J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109CA606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109CA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiT1E2wl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0FhS9J
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsgB1700282
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 12:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=; b=UiT1E2wlC4LPns21
	26JaTaMG0ZJ88knZvaPJ1cjuUkiOUawIQ7KxFarPy69PPOKkCaXNAQlE0u7DIQuS
	UpVXFrJDfRDK5nJBxe7V+mme0U2o+LPtytdGCG+LAH7QTc4zoYX1d7oo0I0D2bl5
	EHt5jm4z9yNyAhMQiXS2NJ3sqcM2etlzI7kbRdUkgS6rJdz6+JFds1f/FtcOCTP8
	He4yS2TmDqblmBUI8hJhQ4PZCWVZitBT8Rv4QTidQwZj39euTYfhwYMazKwhe02E
	DPFkeAGSu7BlGqeJsN5H7bJMI6W7TnILGDT/OteKDH3uGvxZYGgBPIDxEsccreDh
	u5MkAw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pygahx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:42:17 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-70377b23231so319049eaf.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796136; x=1794400936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
        b=fG0FhS9JQn+BozO3evXFHnriArZEZZkC5l7152CZW2R27fK7q5pwkldr5KIXaccyxZ
         ktUvXU1x5GvctESAKnjb+WPO+l5rQEK8psMAsnDUFoAUZDIBA6tbK3Pw3nvW2ChPZO1G
         H5+SQU0EhZ9jZIcwwz+z5pHzfI9M4SzSilzDtoL+4hFPKLge5rwk/if9X8GUntqzkwVS
         Hq231NGU1Xr2+GoLRSa2ebBpFkWdIf3H77vasOjnxVfjytBdsXTYH/Art2wUuAnIKvh0
         o2ILH8JpqXx6bPS0EcOHq3/OkLJfox24t5oddyblrnzUW+ksp4cdL0lrUQeAjXqdEv68
         6o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796136; x=1794400936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
        b=1fPTr8mxb/g9lEellG52xWqn2xBw52dSjfIc8AyGgx7QUB+F2q3ZEe6TGSM7hCegTT
         io4XHrMkUn07mtsjtUtkKDy0PeW4hsT1bKH+YS7+xB8DYK2vH03obzDcrHVmqbvLUs1e
         DRVeMXxoRLaztXk3xHcTbnWUZJP7LJ0sDnkBQIH+p0XpxptDR9jjNwelU3lMBINnk2M9
         2ccGq63y7ko9CM/szmHQuS32uGfZjDw+cq+RMHHjNFfWRdMJTYKxL8bY1uNTqdIYz/jG
         rZOQqvTL7kRtiq5nUzLEwPdjG8Ct2MwDwCVLkDxXf51UsZNls55sdiuqt8WwoJgydm4S
         lHLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwhF9gIGLmcWXq4cI2/u2c+JP48IV6WB7IbMDTK+V0I3IkDtKDJnzJJC0efbq+jl5CiIls0QfLfG4f@vger.kernel.org
X-Gm-Message-State: APuU4Z/BXAeT3OZ0LTlM+eK11fSuUA5UQgzMzToTATzFpcWlpUZ64Oew
	LjXwlx9MVpOWqhY2YszLBVj/OXmGIHjTDGflR5Gxgn1iwmzFyOZzRlCoUq0h/6BG2/+wgW2ajsE
	9vN0b+ooDSp7k02VVxpXyaC0T6vQHeskyPkh1r9stMSFonfPZauFVIVYusSlU8YQA
X-Gm-Gg: AYBFou38psXZr+5LECSqTfBJSZTjQnlVKpXClP7MBMPl1FQDT5gQnjV2c2ibicR2dEQ
	/S+bRG5aoagy48Kweo98bX//c9S1c7nl9Sp7CEVUzskCdnGLbJKXzyz3kdimpsvJLniPqQPNUGa
	ZlKtQRYQlJRsOVHD66bXPrrOASWg5NoKZevZQtrRJtboRcxnwawmpl2S4XAp8CituQYBbu7c16G
	mhujW4cIn/WusOizImf+J9p2vyAafBckR/VnJi1anl7bMw2wmylOtGZzSkYXX5a9CrSVF6gXb3O
	5YDtUAT3Lz371dql76MBEnuZDcERRzYbvIFNJftF+D3e8pSrocBkUSeNuoAGVcYomFNK77OgJaf
	GAgG/+JTavvcfecRN9n4hgqpdh3t3jfjj1HrtHeNN93JMkxZYnF28dUGXQbZWm574WIMlXcvPA7
	L5i0VtAw==
X-Received: by 2002:a05:6820:1c99:b0:70a:6888:2288 with SMTP id 006d021491bc7-714f2a22e1emr8458519eaf.63.1793796136316;
        Wed, 04 Nov 2026 04:42:16 -0800 (PST)
X-Received: by 2002:a05:6820:1c99:b0:70a:6888:2288 with SMTP id 006d021491bc7-714f2a22e1emr8458498eaf.63.1793796135837;
        Wed, 04 Nov 2026 04:42:15 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1317c7dsm1497063eaf.13.2026.11.04.04.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:42:14 -0800 (PST)
Message-ID: <f9ff9954-8e80-470f-aedf-6dd415b0e1e4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:12:07 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
 <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb2829 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Uwc5bU2mXagv8lUGyjYA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX1HP65JQCzNwL
 t7LRBpxhnxzGPMGaIhXAwXflCKG3mweIF2k5OANh90Nv91rq2WgEnWbPMNoGHZiaNYTn9KJQ+ZV
 Prjs7GvmnI88YXfEcvgWfObl/wZaUpButHCKEDT5v6IUQxFA6fnbrwPcIyZLVX+GML/TG3OiARC
 dfO3Z4q3G9V1ZtLhqEhT7B7bPEAhRSIbxnOkfZDjrfrgvztU7l/Rpf74Gj6wwPycEUuixhn2FyF
 ivvwBJYlTHEcXlMhz80n6zURZm72xnObcughFDf8AJ8iTYwpeZ7TL1kdY+EP/RJdgTh0KX3h/GZ
 8+DrDaHCTo3A5kauAw1lvzNnC+u94Fs77cFjH9JnAMtOqpFC8v+0oZbZvAbB7ddOojWjLhVabsm
 nKz4Jjj+VG05HmkWKgXvpIxhEnb4qjCeDJYz4DJIVrxKSES1jCcROBFgF3/4YI+9W2eLZiR2IY7
 acoQwU27qgxfrAhUfqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX4fEUTyJ1KBLv
 RPPMlGOfkX9ttc768OgrAw25yJWKI6wL/2SDcA2KfbpBIywZYbnkSpDgfi4+TiFbsH8TI0clJMG
 UsCDFk4Z4X8ZPbMNzu/D5A/jNaht6nE=
X-Proofpoint-ORIG-GUID: SJtgDtnu6_S47ndIMdgDGDqyFwljheJG
X-Proofpoint-GUID: SJtgDtnu6_S47ndIMdgDGDqyFwljheJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

Hi Konrad,

On 10/19/2026 8:23 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
>> PMIC. The BCL monitors battery voltage and current, providing hardware
>> interrupts when configurable thresholds are violated.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> 
>>   arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> index 1e02578e4ee3..4809b3d8cfe2 100644
>> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> @@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
>>   		#address-cells = <1>;
>>   		#size-cells = <0>;
>>   
>> +		sensor@4700 {
>> +			compatible = "qcom,smb2370-bcl";
> 
> Like on Hamoa, why just one instance?

The BCL peripheral is enabled only on the first SMB2370.

Thanks,
Manaf

> 
> Konrad
> 
>> +			reg = <0x4700>;
>> +			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		smb2370_j_e2_eusb2_repeater: phy@fd00 {
>>   			compatible = "qcom,smb2370-eusb2-repeater";
>>   			reg = <0xfd00>;
>>

