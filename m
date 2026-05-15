Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E030F938
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842884; cv=none; b=V9ZdJ6U01iCyDzcnyRpg8SAUr06XnHywxsheHQkdHicsJ4weO7FIgpswfjn/AYSoDa3NcIvO3LNMDqPmhdl6/O5p2xPATrqj7jQhV2iSx8sJDb3Ch1p76bBQ220tY5v2jwqFP00W3Rx6SMa/VTRvc6o+RtXQiffVzGZRCMi/WVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842884; c=relaxed/simple;
	bh=8LNM8bxfvLzgNukQvPUbSNf5aqd9048QCCXgSYVLbks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsl01bBOWC7vJJ3oyFOYeInSVrqmjfcPTqIOpHLCMWQPR/h7K41UqtYzR6MV5gpBpvMVJY6uKYMqLP+CKTsShrHX0WOU0EpkTga1juinc9GOZ1bndt9oexDSArXlcBCxIJ7VAXQT9L13WmVu+qnHf9wyh8a/ikYp3dDKGNzNDSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpnwlsBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dISYFOna; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpnwlsBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dISYFOna"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAjAiM654886
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXp7bDYjaL9ZxRokeUkbYdn60HhVaLGWRSrmxm4jD1A=; b=gpnwlsBZK6D7r06n
	coWh0zTuEFlOhB68uBoTydxkZkU1i69N28nqlg1IlKzbHAgaIZLOj6t93x0D7e54
	YwZ5kYGGqhRsR8vbMedO4K1xMG6TFhNEwZ2JxxBTJPe7XjwgKXEezkDowsIf/MDQ
	TyujVfEjUuaeZrB+Wd2FveWFs13xgtRR3JvlWK/TthJ5sShoESBlZDkg9Fd2vdpS
	EuRsgzoeC0+CQWXfrHb/SiO8i6Y8x4pPxgJM8+wfj3QHebyK1ksZpoo7ZYQOT6TX
	rLmMhKrVLxX7Blr3SVhgxSbx/HCCPFBE+HVFMgb9GDHNpOcAvyEWb3CnyhM2Ybe5
	bt8W4g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu0kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:01:22 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e06cbc08d6so23726817a34.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842881; x=1779447681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXp7bDYjaL9ZxRokeUkbYdn60HhVaLGWRSrmxm4jD1A=;
        b=dISYFOnaKgM7TfB/X14gtjlVRq4jvdrcuhV6fsjxRcbfZJwFgg+U5WHU0mdJh8fQ9H
         4Ko6VQL6Zmwy4O95XnwJ9/N5NXge1yeL+wQRNteQBoQwvv3x9EVEg2YswGU+D/8ObRLb
         5+wFGjelDhX7gS7+ojlRDSwLl0cXfEX4ei40LjYini2m5FQdSXhtBC9O6idZ44bYilfd
         IePL7fAJCoVqHylwW39+dX15h/Ss5+AaUkCiNuXqRFrSVbqnqHpz+kcVfKVno8+zSUbk
         z4xnu22OiRflmxABGodRsFHFmzath6jQOYvAazBP0kNXSSVULDfcDSUP++I3D77lnpGN
         F48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842881; x=1779447681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXp7bDYjaL9ZxRokeUkbYdn60HhVaLGWRSrmxm4jD1A=;
        b=iBqOtulFWLGgIZTmrsTlNu/QrWLbp4yiEciMggd5WbBaseaYZcMhy1er5MaxdApb3x
         gNX6VZbP8SPSWqPtjyzDqKuaV9tjiygHsjgx0yDHFL9cX3w/cWuE4J0Vq5a3iaNvR6xo
         IU/Q1lV0SyKYkPP/yNQemI8q3L7wNVJtB3o9M88M2GqOir/zJs5O2PxdYKKtemJTEjjn
         2Od0GZW6Y+7s4xSRx2Zp6vT7kd371tpbkd1GcPcICh2DfkAy+eZmPhDo3d7vo7fgoVcI
         FnMk/XpO5seEHNq6oX3gOo6PTbNYq8ngbrBZDDnnqPJ/Qcvl1/Zw+voAHrwN4fMlSlgU
         pi4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Hk5KiOi/T0tqKtzn+TgU2yYEaQB1XgVp680UNtgASBbnocsA88VfFypqRbgMe9sXza4398qpW3ivd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxig9s4oBmeyuz1Xj9vKTcLegzlg+Tj54krqU+3ItqZ0hjChF80
	qFivO+9ArqrKjRQXR1VIAipOIPH0UEOmDwCYj+2f7YF8lj75xUobkjSrq3ZfODQwRqMu+espsZC
	D2pAkyeKVE768EGgX2xJheTDP6v7P2FMyCnNzwvTXTje6E5DNOIo0nNX6C0YIN0BYc4ocXGyp
X-Gm-Gg: Acq92OHevAsMckdOUdwLdYAc3KkzYbhEV1REv6tJVhXKLGMvApgzt67kXSoubRjM1Z/
	iKiDJgiSUrwcbWt0Mqt3OV8AeuHelmUMVc1jeil0jl3v+U6sK+x+Bv5Oc1M0rpsMYh42FLjimTt
	950gz+Qe8lQR/VTHOiuVfBBJJqyDNyZuqdFkwpIZPqBY0aJqAKUf/y0Pk74cdC818w2oOdpIHwN
	R1Cp308CMvsF4ISLmNHt77zoD294aG6fLQb2WXcQVAaieDdBBr+M8PN4D2xD7Rml01yycREKrTR
	5O5p3ku9gGPUWv9+q6h+aTeRNQgQ2a08DIkcQ7u0KAHRzhPoeuNYMSjMF7u95UuMluAMa5GWVTf
	xV3Ah2Tej6BDxB+5klEYE7f5sMR9SkM2SIXQhpC3fYrC10UM4NGDePSjf6LWK0GCTRED8gPqH5C
	NbfRATQukGcI3/35l0+saZvO+7uNgkmQgskKCBFsHf7S/Blezn4zLJ2D+JIhFx1YWUKoYQP1IGc
	xo=
X-Received: by 2002:a05:6830:6f48:b0:7dc:e0d4:70c5 with SMTP id 46e09a7af769-7e4fa063f50mr2440045a34.25.1778842881538;
        Fri, 15 May 2026 04:01:21 -0700 (PDT)
X-Received: by 2002:a05:6830:6f48:b0:7dc:e0d4:70c5 with SMTP id 46e09a7af769-7e4fa063f50mr2439996a34.25.1778842881103;
        Fri, 15 May 2026 04:01:21 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c6:df5c:d8ed:c370:3eee:b864? (2001-14bb-c6-df5c-d8ed-c370-3eee-b864.rev.dnainternet.fi. [2001:14bb:c6:df5c:d8ed:c370:3eee:b864])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc4cdsm1268857e87.54.2026.05.15.04.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:01:19 -0700 (PDT)
Message-ID: <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:01:18 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C82U3VcW8eD8A5j-3Ss398TSa2kchjja
X-Proofpoint-ORIG-GUID: C82U3VcW8eD8A5j-3Ss398TSa2kchjja
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06fd02 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0TwNQlvJbkE4K8wFdpQA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMSBTYWx0ZWRfX341zpVDKZbsW
 SzwcJaNMWTQy2dmNiNLT5XW6OrrhvSXY8RHhOQfQ3/DZ5qZ72n2lnnKbIGjOb7/03fCYn7nfPEc
 MdD/9jkRN0I2yC0amtiJvQio6hq28jNlrpgKpOtyNDBbW5mdTbA6VUoXx4BIu98LzrojRseyW2I
 pTzU6NGmKoL1V8K/JlsBV/pWrnQ+Fv/c4GVWChaWUv3KGTENEJjUiBhaOEXjFJVa+CvuYz3YnN3
 21C6GUTgOcD1QdCYLHRx8ysU89CyK8L/vvCFoyzL2PP2SBiU+SYfxeJXi1W0XQZSLOjIBQb7nRn
 FKxLLFrQIdnODSeh9oP3pwVyC3we3UR5uUkESpz8pBVr3maYEml+X6a2DbiWuMIO1bBYme+y8tz
 7boQSM0wWuz1oANEmRchJnCaC7TC2k0bu5D4cAogyXW/thDkYfypKfdTDYsUaFiIvwPta+eGIj/
 VTdzkClMhE+ZUsiClAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150111

On 15/05/2026 14:00, Konrad Dybcio wrote:
> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>> C630 isn't stable enough. For example it might reset if display device
>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>> value to make C630 work in stable way.
>>
>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>> index e41200839dbe..e6c67016552a 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>   	status = "okay";
>>   };
>>   
>> +&cluster_sleep_0 {
>> +	arm,psci-suspend-param = <0x41003244>;
>> +};
> 
> Is it better if you do hack in a
> 
> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");

Any clarification? Then I can try hacking it in.

> 
> somewhere?
> 
> Konrad
> 
> 
> 


-- 
With best wishes
Dmitry
