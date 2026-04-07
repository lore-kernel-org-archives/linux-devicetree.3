Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873C83A3E95
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561171; cv=none; b=oK0XDf1rkNcb5FesQYh52G0g0JB2/KfUpT4MgS8NJ/Co3NC1IeN1k0W5aVVrHSJLMPYief1OVcKSCBh2Yl8BHtHwMXw2FFt8yT+5uctWjI3ZAEyHyUVnSz6YyZL4OsgdY/hv1So+MU2tBUrEYdXoGt1xRXVEDdf6Qgf3Ul2IYi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561171; c=relaxed/simple;
	bh=TREj4zSRns/I55iGHi5fR98mVeIf0b6KlGroZkFaPaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iUyz3el2SWgwD8W/7yl3LVQRQsQJgl+HSWLcVkplb74paYAeuhi++J3Bij6gizhS8afW4k0nxZ99avNx3g1+MdeAK4Gs/Br8PxOmdHvvDZxvqQS6JLA5Z+hMfZc0w77Hu9+8fW7FVY3gG1I8Pw8jgTya9DsLvqCLqvQjPAliXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7sXjeCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OLVCvFRJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7sXjeCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OLVCvFRJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63768HwO2580030
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 11:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REKQESoHGSr2uVq0msHkBfzv1Re/UPMULOTkZTykn2A=; b=f7sXjeCp3uRHccFH
	1+ZVj2Pr+ACXfk+4EEs/ZxzAq3EoEzgm2U8gHoFwYAt+QLKmWf5gqw6SxkkrdWXW
	nNpYT+/d3TV7a/Z+quUmYA37jXEXS625YmX78f6RkFYimUETYdGD7WmmyooGjLyI
	DIcTdym6Qn79i3mj60bLUXGLpsz5Rss+vLVI7ncaXVBeZuc3CX9wRdiNg5uIZHjw
	VhrFR4iUw2Rj8wLdAui+cZMedqM0+TppbZbLzFpTQHayNRFqhD8VH4WAT6zJZPoB
	zlHHhap1oadRbu6Ol0NBIj9C6vAHxh6IkXbk5Lqbk++xcZmwZHBVIhJ8zLcusNQs
	ApRJFg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf2g0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:26:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9278587bso5216199a91.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561168; x=1776165968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=REKQESoHGSr2uVq0msHkBfzv1Re/UPMULOTkZTykn2A=;
        b=OLVCvFRJ+dATNIjkRYFeAJLVXTd1Z29YpqugDLqkzxpFhMygjOODEIq1fHlrP7I1oM
         pNw6pujpY6QQQm7k568BLzckbS5/dRLcpV9vOok8su9x4zVGuZRqHeLVSs/ReQ32RMW4
         8hE90htVm+StkILjX2fzZWAXvwKZ6aPBKyREwlHauYVWr4fUtvJ9p8C1soSFyRMe1w7A
         hBrT2JczAfqK/2pDsg90dWtNNcCaBWEr+Z+IwJLivpqVLCgw3BBNnAYHMpDDH5qmqME5
         KG7LEenk3/m4A+rjEK2iADtwl9MUs2pzJY9F7B93nhzCH0kDaqGbhvU8OiwzX+u4z0Ll
         mycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561168; x=1776165968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REKQESoHGSr2uVq0msHkBfzv1Re/UPMULOTkZTykn2A=;
        b=PRSItnLyuztp5kSaOczN3iHMku+qAX9bYvQ32UgKMRC7Zs+TxbioDCwIPyRQpWgE+G
         itYKexaiUbGVaR3z2iksZ2AhJ1k1xk3QexlzbyBUJTCsT+LKKtoqN7/G5TiWh7aKYOfz
         5VtH9/yJo4wlcWKLtEnbkd8+OPrtpDSVtnWWYipKa4oyXNvPmgMPwxERryRJwEH8XJvs
         a5E+mYz2bUj72TYBNMDmKCmSoa9QPa8SvAKCLPGgJMVl0Z5X0A9HmClwVyPCdL5qcfqX
         PiGCF19U3FdyJ/aeByw07gOaJnt4MWOhD7KUWK5nwkEWkmVV0atyMDprVstwUPE2R52F
         zaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGXHrQWh0eg6hSpbeREOp49xdG2iUHrf1SYFCdOcE7wgxKcV5L8zyXSEeGUeIztcXbJW3qi7/bukSs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Tm0PHCWhsvA552e2xXrncKmrcaabF1Qb2VyjcSX2RccZfAXv
	Pmph5YSEI13OytXyKAOVFHnr4sx1asthTdb4W67/MnkJeQuQ5uq0Z6Ja/IpOC9z3lTUbAiPvrF8
	DawIU7UZ26v7nWT+2XJHFg+s82UqhFme55ht076rRqNzV5Z++wBorLZrUHPz4CyM2
X-Gm-Gg: AeBDiesyr9GATq6HYR87dwAPDCoe2AzQxuwjtowVOZHOAg3B/sMh5pEhIFsB/ZvCgIA
	Di6EZQpOk/SqZdPEYZq1YogAzSNkasvEEtxzIhOOWF1gwI+f7sQdLs+TdrtubsgS3s+nG4sdvDZ
	qUDKOnL1v3CvvFCJ+YaN69vON0zJNrUjGKKLximsT5pq32MGIpxokIPkuGZIXfd7vbAPdB5s5LF
	3+TLvT0iIaJtnvypekXWBjk1REzTrsNWVPmFBhbl65sDQQ6MUhzxbwPwOzCFSIBzpph9ncYForI
	Xt601i4BSTd+Ka/ehucFWNoRFH+6Juo9kZu4+HzzIfucZ8vpg9y+d2St6jtlwjyU44NRJ1ib0Cz
	sdqLp5tSWMlXHdIDx1Q31xP5b2BZqqtuUdk2W2M85g5RVCz/Ub5jj
X-Received: by 2002:a05:6a20:6a26:b0:398:dde7:2dcd with SMTP id adf61e73a8af0-39f2ee61d62mr17989480637.21.1775561168388;
        Tue, 07 Apr 2026 04:26:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a26:b0:398:dde7:2dcd with SMTP id adf61e73a8af0-39f2ee61d62mr17989444637.21.1775561167862;
        Tue, 07 Apr 2026 04:26:07 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9cbdfsm22309861b3a.53.2026.04.07.04.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:26:07 -0700 (PDT)
Message-ID: <4cc079a6-0945-4314-982d-2dfe70226ab4@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 16:56:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
 <8ea92c00-56ca-47cd-95aa-dbf49ecf4118@oss.qualcomm.com>
 <a2e2df62-42f7-464d-8833-8eabc7d92ecb@oss.qualcomm.com>
 <a940926f-901d-4907-b029-e4c6fc62625f@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <a940926f-901d-4907-b029-e4c6fc62625f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNyBTYWx0ZWRfXxDpiClc3r5Pa
 N2Mgjb/IajZ+mQsVVZLms7MFIxbAjfgBupd3R7c3d2kMZMedmfLsvs9Oc+EnqA3fUDAh0gdn7T7
 4VGj2q8UMNs/l1lXJiiLFxv02aUXlVQ5wi/IQBzGk/uu/BsQEHSy3Hoq+5Pp/O5XnTa6mSdma81
 wisGAjM5szSrm7xTD+q87bfW5Igv4CSEUYvhYNw0xP2+yljICIocIGlbj+6s9Bn1QASkXRvQjd/
 PJtNxdSRdeNLoqtRVu1ucV+KlHex/3tvCp8l77VatxSQY8PbmzF+BbUIlcMqQTr/nYHPIvPDOKp
 MPxNwjgeMqmIhWTZ8Akd1AJNxmQw9lPGftIlg9qi0xf89fxhaauFBPy9/ukb9TIji/Z/UIGoIVt
 APJXc5AMvLkrBojDrfSEzV8quOyxJYy2OmDe8YRr865QX4zg+/tnrfu6P9e/kkoPIgzUm/05ur8
 k/8u0KzerAjDALgLaEQ==
X-Proofpoint-ORIG-GUID: sWiKKLkUQwsaqAIyN3oZXMD7MoNk8mkq
X-Proofpoint-GUID: sWiKKLkUQwsaqAIyN3oZXMD7MoNk8mkq
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4e9d1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a3xcrG_bGF9vyDdvPo4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070107

On 4/7/2026 4:48 PM, Konrad Dybcio wrote:
> On 4/7/26 1:09 PM, Kuldeep Singh wrote:
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index dda4697a61b7..5e6b659e8719 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>>>>  			compatible = "qcom,sc7280-inline-crypto-engine",
>>>>  				     "qcom,inline-crypto-engine";
>>>>  			reg = <0x0 0x007c8000 0x0 0x18000>;
>>>> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>>>> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>>>> +			clock-names = "core", "iface";
>>>
>>> nit: one a line would be preferred, please fix that up as you seemingly
>>> need a v2 anyway
>>
>> Hi Konrad, Didn't get your comment completely.
>>
>> Do I need to send v2 to just fix clock entries in 2 lines?
>> Or some other comment to address and send v2 for that?
>> I don't see any other comment on patchset to address.
> 
> I didn't see your reply to Dmitry's initial comment about the DT bindings
> requiring an update.

Here's my reply to Dmitry's comment.

https://lore.kernel.org/linux-arm-msm/f05ac643-1ec4-4700-aace-c1a9d0cd9e07@oss.qualcomm.com/

Bindings are updated with maxItems:2 in dependent patch series.

-- 
Regards
Kuldeep

