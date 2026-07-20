Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAEE4307B7
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559886; cv=none; b=LEPM/VVsm/qyttV3ZjS+0j0DV6/BQwoyVgMY2W9BeqRX+yt7c5E+GG/D8boCH5dXunNGfwHoWg6fEpxq4TnmpDkEhqNgn55u4tLrbSLsBe66LrYjMFu/8Z6sgFj37aguO7Rnj9GgpUnPL+8hbh+efPFBQtRb3vT+55LffjAxflE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559886; c=relaxed/simple;
	bh=oMagsyX+2dR4DN2yvNKHPofyVrpb9t1Cz+dhKF+/ZvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emJQwuWXCgznaaIQ8vG+9HZ9qZo0VlTyexN3/EveGPRE7AXw7X3LjHF2PbTL3nRnYqGwP9au9kVhuD8W2A7q56FP0jY29/pnwVwYUqTTEmvWSjQ/rvU5sUO+2KQsQrvYkIgq7GaqpMELIZ5J/I1qP47ApdevaIIU91FuYhmgbSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HATFA6Qc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ji8Dd3RB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HATFA6Qc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ji8Dd3RB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDrJus3860457
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 15:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqrYdxLLIem1IFbnRFUVolmOzfJaw6zfSBftICLCkFM=; b=HATFA6QcVb7tPtV7
	Ol5XMGYd2mMhLmiqN8qM0I3zovGcLPrRg0JRqhye5Qk1Zlvc5c/lZC4TzTWI4Zw1
	KVWkPTI7zg8LmhJy5LOpjLn3mEzgC55cLGVyJ8TrfCBvuAdMsJYZjD476O8Hq5HI
	82BT7yhbD+VKt9sb6i65jBQd1WimYeV83ftebapiDTWjC+3vSQuoS9KbXHqsEqks
	haW+LpAvMcY5EG+Lre+8JsaTzPJsVRE3JBQ48NJWd+MhDoC1k1JwHVyI83Lg3zRH
	vGeb+A66H7G1dr5P0Nw0k2CKBgMDB3Dfampv82uzBZjfI6G+AjI7hGmPliyvHt1H
	h7NMSg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg1x30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 15:04:44 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a18bd9c3caso9520171eaf.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559883; x=1785164683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqrYdxLLIem1IFbnRFUVolmOzfJaw6zfSBftICLCkFM=;
        b=ji8Dd3RBFS64sr3pO5UfJplYk9bPyqhfwbNKdvd4pbqdzL2pPQhe8XalenMaJBfks6
         DG/3cBha7+g6BGO0+WEYWRh3gaxBWQbd9/KUfVeYkRmKoO80RZsZjDgODfCrh955PrXa
         VK+J2LPtk9X725EkcnLwmawdF8N+I4HE484uUaAc2rlzeoHGgryAbZEywwx/XGYhEP3m
         K4A5uyT5dUzAlDuMige6t/fgcMnBpEXL0HPBQNXcEHtSPNtZ2X28BmRlVIDhiRohTfgR
         eMXuKwqn8t0XhxZdsCdDM0ffFaRs9knUinU574jqUEZsMqRsMVsZnkZiW7WmvjBh4BXX
         4/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559883; x=1785164683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqrYdxLLIem1IFbnRFUVolmOzfJaw6zfSBftICLCkFM=;
        b=hnFS7Jsu2qY7+qJbIPu7U1txKhqD6ss/hN/V7Tx+w1MvK/fsRWhplrmhhQ5JL/MtoQ
         ay6BfEQddJJ4eac1bpfr7GNGgdmeIb+g/1WZmfnRyJqPadHhRAhVX1/0bD6WXkMNvlnq
         Ra3V8ro96A2H9OP2zi6HS9JYnoSfD+NOi3fYsio+kELYmpGxu4SdH61KSQzvnY0VqZmv
         Eh3H7iLVntly75dtydN4nlSQNzSnl/IaCXWFvliZXfcSmO6X1zFsuY1kEGWidYcOiTca
         nBmEEcTGe7qffsIPBe9iAeEe1ZSKMo5WgBwOAcPlteeCaGPJ374HSH5dd64Rtv4X/SZK
         Zrdg==
X-Forwarded-Encrypted: i=1; AHgh+Rq09e89i9LZbOLmoneDabAPGshclnJlrSRkf/qCnxcEvCmKanJSgaPLIuUbNSMGxn/6rUo5M+RoZ1oi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp1Qoy3QipzebsMmxKZJCwMpM3BH8Esi9NHW+EHeSwm318Cyxu
	mJ4EQd3oniXBo+9u5gNKL80jbFgZAH0FiJ9bHULIXj4IHcWz0aXjjFaYXqvqiEk9RiCeqZpa3N4
	uk9BlMHpT7Y7kx4YmzBzOWyyVSS4pcDI8iUL2Ky5A0udxWL/dWyRecmgamw67bMyx
X-Gm-Gg: AfdE7cnCwH1eDNH00rNcri89QwOIqowaQ0MSQNxtHiQ7Hmmfy0SUYZ072PmM9FfuTBl
	IiKzYJNXCSUQSMu1lXxG8OW9RHI8mv9y6SaE0z/du+UErJbFCXKV6P+etAyXLnw9RceGy57OD4i
	Eo6Fx/kiJoNrOwmsRJUtfiL8Q6xCciUICuC9TeHA13OAFHyjxP+Y0PoKvnkQv7vSJ8r3XPcC8lb
	Lkm+G2qnf/wAkobpkFqxyI0ZDIK7KjVYObjCl4mA5zDLykX9A0/yEdGCt+sYpOqZHCRtZHs554E
	OXALTTp85M4ZvmODRBG1OekKiL9Hax2U63EeMEbb7xl5r/OH/mx9zoNfh1GvvEEk3oSUItHIEst
	xgZXEGI2r1+Sdp8e8MC4u9D0cCNpbq7LwL2mBR/EmQpBROa9kzLVGQ7cGFVFYWEiiuIKLXagk1k
	W9AUNz/VhWSyNlPEwHkocQsLzdj3hk
X-Received: by 2002:a05:6820:2917:b0:6a1:43bc:d0b3 with SMTP id 006d021491bc7-6a536804679mr7525257eaf.27.1784559883424;
        Mon, 20 Jul 2026 08:04:43 -0700 (PDT)
X-Received: by 2002:a05:6820:2917:b0:6a1:43bc:d0b3 with SMTP id 006d021491bc7-6a536804679mr7525241eaf.27.1784559882951;
        Mon, 20 Jul 2026 08:04:42 -0700 (PDT)
Received: from [10.190.201.105] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edaf99b337sm7924913a34.21.2026.07.20.08.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 08:04:42 -0700 (PDT)
Message-ID: <782d626c-2545-4719-9833-efbc9ba82871@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 20:34:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
 <581659e3-9168-42b2-b715-943808d9ae2f@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <581659e3-9168-42b2-b715-943808d9ae2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX5dv00emJkwpL
 IPwmaflcWLzDQCUEiGq99zzu+zluDmfofwITx1vvkkotQxZ6sR2uYf0PRIvUm8Y5fv2rfZ/LUEE
 +kHqVY8kYTCCPtwW+talw24crjnn8aQ=
X-Proofpoint-GUID: WyXdSzi3KeSoS5Lyh7PHV71Mm-fh1dcT
X-Proofpoint-ORIG-GUID: WyXdSzi3KeSoS5Lyh7PHV71Mm-fh1dcT
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5e390c cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1TCdPgPjFHuVKpGW9psA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX7Pbl27JeyOQW
 89l8Jp5pKy2Ekwng2o0e36kEV2AOVTBUtOIUlnzl7BRFEqJJpCqV6gGqKrTovn1XINlAlf/u/4h
 g/UUJ+kL6POa/da5ANlavZ3R1uclmt4MVJk09HJGw0f57SATIj3zoyd4B3x2a3jDqELx6BCi3HQ
 uYQQDoPc7qHH4pkts+ypcEiKsrYBRjNG0rtMy/J8etCddLmnmdKAoP2gYN3J78nJyO5r1oTQ+bK
 ZPjTuUqcIeISiBVJZuPAj9LdMp6866wWEuUufm3fUxiBbjzk3YM65HjBzRKsGj4s54WB1DgoUGw
 2Vx9tFAAlUTNrwYsb2KQdVVW7H9/9oWPk0hwZdGw+EoicpzqNvys1LA/NxLLdxt2YraUGBBdW8G
 UCHcgLSQW0d1Cbs7u75/dbxwAGXwP0pBcxKfGxjMe+psZHs6rD/hWd5lFGlwOkWV01OlclBz5ZC
 jYarSPKbhBfxFCiT5fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200167


Hi Konrad,

Thanks a lot for the review and for catching these
> On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
>> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
>> with CPU cluster 0 removed, leaving it with just cluster 1. As a result,
>> the PDP mailbox and SCP low-priority register windows are updated to
>> match the reduced CPU complex. Everything else should work as-is.
>>
>> Add a label to the Glymur cluster0 cpu-map node to allow its removal on
>> derived SoCs.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur.dtsi  |  2 +-
>>   arch/arm64/boot/dts/qcom/kalambo.dtsi | 29 +++++++++++++++++++++++++++++
>>   2 files changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 55d91c696a3a..f2feef362be5 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -275,7 +275,7 @@ cpu17: cpu@20500 {
>>   		};
>>   
>>   		cpu-map {
>> -			cluster0 {
>> +			cpu_map_cluster0: cluster0 {
> 
> I doubt the code that parses this will be happy about not
> being able to start from 'cluster0'
> 

Good catch, you're right. parse_cluster() in 
drivers/base/arch_topology.c walks "cluster%d" starting at 0 and bails 
out on the first missing index, so deleting cluster0 and leaving only 
cluster1 means the topology never gets parsed at all.

For v2 I'll delete both cluster0 and cluster1 and re-add the surviving 
cores as cluster0 in the Kalambo SoC file, so the scan starts at 
cluster0 as expected:
   /delete-node/ &cpu_map_cluster0;
   /delete-node/ &cpu_map_cluster1;

   &{/cpus/cpu-map} {
         cluster0 {
                 core0 {
                         cpu = <&cpu6>;
                 };
                 ...
                 core5 {
                         cpu = <&cpu11>;
                 };
         };
   };

Does this look right to you, or would you prefer re-pointing cluster0's 
cores in place rather than delete + re-add?

> 
> [...]
> 
>> +&pdp0_mbox {
>> +	reg = <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;
>> +};
> 
> Are you sure about this change?

Yes — confirmed against the SoC memory map. The Tx window is the 
NCC0/NCC1 mailbox instance; dropping the former cluster0 moves the Tx 
base from NCC0 (0x19980000) to NCC1 (0x1a980000), while reg[0] (Rx) is 
shared and unchanged. I'll note this in the commit message.

>> +&cpu_scp_lpri1 {
>> +	reg = <0x180 0x60>;
>> +};
> 
> This is specific to old firmware, at least it was on Glymur, I believe..

Right, the size was bumped permanently on the firmware side, so this
override isn't needed anymore. I'll drop it in v2.

> Konrad

