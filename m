Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D728330D23
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776955172; cv=none; b=O92jzLHtdOzfKFEzRupL8ZLySC1HaqpQH2jZiFNHSyKU3PzS17GMWeex6rN/tYuWbztVMxqNZ2fkBOUOkCDURTX2Sn0/ACXQnCWGyhJcoO8oorxfPfq1YkbWiy+Y43V4xI5BbTGx2qutbeB6K+eWD1Xf+HWUovL9Wm7KUJju7JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776955172; c=relaxed/simple;
	bh=iM4FnFbPIlPGBw4rptC+ioLvIwd1Zwc8TNcrY4TW/D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLlmEYggi5Qa+ATZXqGFVEEczdBuZrrHCXblqjSMOzA0Y4VEXtc5NIyN3oogTt4VHz0ViVM2bfMLpNq0sHkks+6z/ZcMEAsmlqIyLGfA4C+OKhwFcOGeVYvaX1Y0aJmjkJN3PhMLJkzio9p8+BdimeXG757AQUrmurUbFzqjGVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3ZWwaiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1LbD8Jj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3ZWwaiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1LbD8Jj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N96W5Y1204776
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 14:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CpYHhIN7XCWTKEEc6vagc9qGPbz1W7/asIFyMd/4dvk=; b=F3ZWwaiP4vw5r4iB
	CHKdUVZJt1z/BC8AKqV6HboLyg75D+ko4kqPf6nAMsWWuttTXbxC6NYaomvgfC9s
	AAOCm39FqWC0pJyqR5sCU+ziclDEVflKcPxLhuW/ZcPoKP1A7dyugFtvpycyHP9T
	1g+W5wgt2gd64qY5Tas0PfXNI/NetlWbKQ2D+Uqq1+gHROSUosRi9Zt22StQNvqq
	nXzS0IxM82CZNleWvKnzvepQbeOZhi5Cob78Qya3WbkneEinGnEaoZogWcz/u8nH
	n+x1dEVaYgF5AJiO2EqlNR3ufbs3wcy7s1VVvQuOqsF6f7hU0Erojd8qs/QImtfi
	ERgdTQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqggn9b3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 14:39:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca154e2b5so77094416d6.2
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776955170; x=1777559970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CpYHhIN7XCWTKEEc6vagc9qGPbz1W7/asIFyMd/4dvk=;
        b=K1LbD8JjqgjiCZIkbFqtsddioq2dIHW2Qw5qUOxYm72YX81laf/M6f83qvy6iGX4mQ
         7THUBcdCGBorJkUt/zkcAlNLLMHudupr4JNwEQHxZMbDDGiHFNg3Rtr9GvPYBwrQpjfB
         dzIb6KURK+DT2uygEAUil5f8DvrosxdQUVDrnd1nxSPWy8XXxjTD2wy5tBJ+1hV23JfP
         aE8DtcB/YJNxWsECzrKGb83OMdW19qM/X0QY+1YN9C9nxvDP2Io2zsc4+VedGOuM/5eV
         ho68k5ZnLtjDckMCmil3hA54sCWlcW+071VqM+48bBFNx+O/DImq1Vk6h3kr1yNT21hT
         fR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776955170; x=1777559970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpYHhIN7XCWTKEEc6vagc9qGPbz1W7/asIFyMd/4dvk=;
        b=lQ9QeL7dgwbXDm693xc3XMOxO5ATCxs7J3ydX0Ynqu/nLM724c1oBdD0iPBZZ98ldr
         4NbbCxNpNuUY3W/wdFflNpgd0EUFeyr3rvuEGnQK3ZTqR+fVgJ4v9iin0ZW88Ulo1R9U
         CeAIuySD4v2WZNSnI2lhPMe8BNiOIu+2lYtP6/hSrQX62BHKYeJT6yoD1e9kHIuqJh8Q
         sZLlHIQdWJOfHAKH8AH+yyxGdqszVQ2SB2+eDUTWdb5+3GOyicIiPOTV9xxJXPti85bT
         yMxpZIrQvRJ36hict8qUViGuXavfnfBNJl22GSOjrAU9hFwKnmMs1O+oWwIoF5KMl8CN
         4X6w==
X-Forwarded-Encrypted: i=1; AFNElJ+FC2c7Z4u8sRupz0x1fbz0uW0qOev9kC/CzHdJT27a9EF3IUEtJ6rxl9tZAoWyeerteU+l4xfpdzg8@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8R0WAtjcehPnaDAbl1Nzu7/X+UytR9o2mLvlgt1kUh+4KlrZ
	EUlAh/dQQpBLKEgMA4IXt+NDBPmAz4STSR8Y5VkEcvg4G7zEsF1D9cSLHhiP2bMy/IUx+lykhgG
	50GFoOOTGRqhX2ota7YuGZweRk3CjKmiTY4PpUGowViehzJyXmHgW7FTqow/RVKxp
X-Gm-Gg: AeBDietTDuTh9AZNkmeAY7/E4hyczS/bLQhG2E/cq1tUKOqm0CCzqURGAj8stxnWcis
	qSqG0RZaFn5n3QZbn88C/ZSnw1pJEivNk5EOGq+nQpR/WKRgrsf3Qu4w3w6W/00lVjLpHVXGh3m
	kDrAjzebmQRd6JC90jtE5MJAvQzYDUOXLTcPey/NGT8qOlchF9/4WAtafUXGUtas9gbxjjWHQrz
	bUSHVzi9oExwb7lzROqILMSCe+GGnfempuvsSXZMJiMpuFN/OchmnrCyqt0HLLHlm6+rdUzs7H+
	rjlYkKsmytKOJojZ+5rMDIQk1YhUqNGAZkv7Uznq3DQOmLJxV4JsfbTYw4ZEbV2kxOREdGTIerF
	jrICmlR1ALPm21MLofGQ4F/B9j+YYSlbEOEkugAui1RqzFbbitrUkA6p5sz9NcOw=
X-Received: by 2002:a05:6214:5295:b0:8a1:478a:e58a with SMTP id 6a1803df08f44-8b0280fc448mr435352216d6.36.1776955169791;
        Thu, 23 Apr 2026 07:39:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5295:b0:8a1:478a:e58a with SMTP id 6a1803df08f44-8b0280fc448mr435351666d6.36.1776955169283;
        Thu, 23 Apr 2026 07:39:29 -0700 (PDT)
Received: from [192.168.1.10] ([122.175.112.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b031f65a27sm150708126d6.16.2026.04.23.07.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 07:39:28 -0700 (PDT)
Message-ID: <22faffca-b4bc-4e43-b33f-2c5a7152a218@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 20:09:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
 <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
 <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
 <94a977a4-0664-48f2-9aae-821119581d6b@oss.qualcomm.com>
 <af584db7-8d21-4dc1-aae8-0496be27fe17@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <af584db7-8d21-4dc1-aae8-0496be27fe17@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A0dqqbH0ySWZowzyMvBSFyRxjOwPRXLz
X-Authority-Analysis: v=2.4 cv=YZeNIQRf c=1 sm=1 tr=0 ts=69ea2f22 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=OUBTGm/turYs4i8w02Pk3Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=3i_xxtmr_Qu0wC4MHgoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE0NSBTYWx0ZWRfX6ogq/jHTuePZ
 PYhVKf0md3RhWL6CGKEoCH6JV2o8cx3PooEEvYoy8D3ih8IOIHsfY8WfnL2WiqViRuRQpSTPVU5
 M8kLYK4SbqIHhED6rxfAb68SPcWVoNIkXs9TKeczKcxdMWn69nRbuz7f9obeSWUXCVmtEOYy4tr
 3kPUDLXB+nvAgLe+LKKC+/kRoQj13xL6Td6OARsHVhWuEXiL8IJs/MgUC9J3Xey/fe+ZCOe7vWh
 GhYRQZFaklJlVjo80Zw/6sVRRgeMHvHFhXZOrzyyoW2ccV2KnBNN1LQ9j09nrk6WmVQcooPXfqQ
 VueM4Rhim4lL1DHrMh20e8bYdOyc3i3/5XFIZ1baAImBgACYbFDG35XE7Fk0re0Gkf02MhGx4U9
 c1C+UM2jAgoOcguYVAyeTmjwPXH6FCitqlHgXI634rxNelX4myerA60rqRYUgcYQY/DzjfjuLmR
 kp5ZY978PI3w+yrGi6g==
X-Proofpoint-GUID: A0dqqbH0ySWZowzyMvBSFyRxjOwPRXLz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230145

On 23-04-2026 19:18, Nickolay Goppen wrote:
> 
> 23.04.2026 16:08, Konrad Dybcio пишет:
>> On 4/23/26 3:06 PM, Nickolay Goppen wrote:
>>> 23.04.2026 14:05, Konrad Dybcio пишет:
>>>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>>>> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
>>>>> assign it to the ADSP FastRPC node.
>>>>>
>>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/
>>>>> blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>>>>>    1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/
>>>>> boot/dts/qcom/sdm630.dtsi
>>>>> index 36b419dea153..af2bc29ccdad 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>> @@ -2458,6 +2458,9 @@ fastrpc {
>>>>>                        compatible = "qcom,fastrpc";
>>>>>                        qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>                        label = "adsp";
>>>>> +                    memory-region = <&adsp_mem>;
>>>>> +                    qcom,vmids = <QCOM_SCM_VMID_LPASS
>>>>> +                              QCOM_SCM_VMID_ADSP_HEAP>;
>>>> Please double-check that, the VMID used to be different on
>>>> older SoCs
>>> Do you know how to check that?
>> The least painful way is probably to add debug prints to what downstream
>> calls hyp_assign_phys()
> 
> I've found in drivers/soc/qcom/qdsp6v2/msm_audio_ion.c the following vmids:
> 
> VMID_HLOS= 0x3
> VMID_CP_ADSP_SHARED33

This VMID looks correct.

Just had a look at the downstream fastrpc driver code in the same tree.
The fastrpc node in DT[1] is adding a "qcom,fastrpc-vmid-heap-shared"
property. For this property, the VMID is getting set as
"VMID_CP_ADSP_SHARED" in the downstream fastrpc driver[2]. The
hyp_assign is happening during daemon attach call[3] with srcVM being
"VMID_HLOS".

Thanks Konrad for highlighting this difference in VMID.

[1]
https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1699
[2]
https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L3602
[3]
https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L1999
> 
>>
>> Konrad
> 

