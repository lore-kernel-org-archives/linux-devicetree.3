Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038B72566F7
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438957; cv=none; b=Yv2LpY6Q2pEFq4HtOaXj6NgArem6aS2CeoAtj67mNfGWJtIfAUPw3A4gUcG/+ncpo2o8PtVEd1aFaLnREj4L0lLY0u9hRAHfHRIEfRoqPbRarHF9TiZrJndFGvRr8hUfHwArUs01cBV9/kAYgAG1qyzp7tPTL68vFhcGnY7KXkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438957; c=relaxed/simple;
	bh=FUQ58Buz0KTXfDHUt9IvxtvQxDPIY63zZw+nNkTx/oM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzaGdlPWfi/SdiJWhz/l+bAmg8y8+7rFLktVCvgHp7XgS1KtGk9GpmLJqVEiVbGF24F3vdAkHO5ZPTyqHam2qIssSUOmSK3cgUv/0kgsLgjjQsiubbcHJvnwsP4gYnqNBBd/4QZfxFCP8Qd6Tr40ta2iDmKSsRG+esQe//IcbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oI/gUHIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSiZjKvo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oI/gUHIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSiZjKvo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HA3gpx1323837
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PKD760IDJ43/TbT9ovAN8NccWsYNnr9nvVlw/x2cbHU=; b=oI/gUHIPaLvOHB0W
	wJSq7dp8aYAuJF6x+jcuxWvSl1apaj8ddzZq1Yw82kVWkqLTJX8VoyGQcy/PfENc
	6DI/QcSgpjLpeTYfrljdQ9XIkCmzz9eNza1Gzl5yKySFsentjHoIDK3W54X/Y7qZ
	kGBg//o7n9rs6TZ5O4R4ILP4d5eD7KFL3iXkYAUbZ1wdF3FTJN9z6H1wPGROG+hv
	M54dqnLGGVXEnTuIQa+duTCPB5J0ovucwTVc/ykEirhQUtg5BrY8vXKnqKOfm4Jc
	X5ZegTgfXuTLj5LJvewYjV4RyKGNEV+XhuNR+8+sWYIsQVFPnbRT0454lyz3uoPZ
	dozuaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy297a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:15:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so11084995ad.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776438955; x=1777043755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKD760IDJ43/TbT9ovAN8NccWsYNnr9nvVlw/x2cbHU=;
        b=bSiZjKvoIjgqfj4zwURMXJViMJH7GaGq+q4ZIujYEMY6LXm4ng+Ud/+J0jVfoWuskY
         V1spb2INV0PRWeKUgBMdKYXMR6yrZdVmiagsfx15slt5kKNf5WPfQVpBmZpD0VT5W28p
         xQDyKIhvsJdGO7uRttDXRgIxKEu6PjidLGf200q4Q85bh6rd6r3Wt2nGCqq793Qrt6j9
         yDPZtEpYGWie+hHDGflI/lCKizxL8jWriXSg/ig8PhaMOvZSsWkT9kfE7q4HjNivo91i
         yBK3SG2iKtf3hhl2yKhh0sEqiEgUtvlN8iFvW1nOgnxOSSMA+iHOsun1jD5yP/Bg8Uzo
         7lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438955; x=1777043755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKD760IDJ43/TbT9ovAN8NccWsYNnr9nvVlw/x2cbHU=;
        b=soTIO7/QbY3eYsuD4vFjXskruPxUNnCqk18SIsnPUGdgvE4ESto5bffq43yXGcQeKp
         Uc8ZzYZATT91fRD2YdO4dzfkbS9xJ05Lra36+cQmUvfDYqX8kZlaYuOFI4bc9JScwsVl
         9zR4SIdzTYpmmlEG6a9qrr/D+UlHFE+Y2Hdop3T0QaVbubYC8V805RHxjF8QCANeddYk
         yRmtam1g4K6JYGBbVO0Bz6iXRSTLhQChI/21rM1iAZkKtbuO+YLNVnfURA6wxN7vt7Ju
         3b3xiBslLrzFK91nacZl30r84RsamIVHLmiwpCySUlIn0ohqqVBoatJ7cuwCXHOVbGld
         5q1w==
X-Forwarded-Encrypted: i=1; AFNElJ/9Gi3DhiWWVuPMKh6EGpBL8xAkOZrGHfIM1NjbvEbLqwVUefRqW12wux8i+QAAVEZpg/hAd/qpOQmN@vger.kernel.org
X-Gm-Message-State: AOJu0YyO9juS3KpDUxxQgXEmpMLvrRBABdyGhWSG07L1wNHtEdy1gILW
	mjJ0mi1PJ5swMA2eyUqcnzVFjclwMGHALcNZjiuMY2x7u8NL/4MudE2l89tijYOMkDVZvlVrtqV
	dfCGwhEb2HA9QkffeeE2y77GMbeGgcqrFY0/FSIFIqQOJ5bByCAJVXxwadBZRSBC/
X-Gm-Gg: AeBDietOSwsI7ZrWCBA6K/hUdrkgSlkhUCas2k2lBaxnEk5e+qs8Kp3eMp7p2TMvYE5
	3Dr5mJjp37LhwerkeDNKBoMjklAgfcDm4fqL2zvhkQPB0NIXOzjxN4CvnqvooLIi19g90fHiU50
	gOkkpXTnizdALJES0Drc6nH/O7Lb0iqTw0yFRMbDxycaFLnu9iAHSExOysn1p0iGhkr2PYgRWhP
	4CF0PqNOL3yl7J7raFAAGWWHFQThiv4s7oNXlZQTP7Sw7kNtVqTuel0r2iru0nKlAETPeiNzqz+
	zgGJUoTVjmGn7clWXCsAUnG0YNLX3aS/K9hdbPk8CoPRnG80DP2ER60PxxREqH2aW7GsHxSCVlS
	1MKFs2bFiFpPaHcXn2k0huw5onw5iyTUG0l/KsZGKUqIIx/8phmwQpVHj3vXi+qI=
X-Received: by 2002:a17:902:b493:b0:2b0:c451:ae8a with SMTP id d9443c01a7336-2b5f9eaf437mr21404315ad.13.1776438954488;
        Fri, 17 Apr 2026 08:15:54 -0700 (PDT)
X-Received: by 2002:a17:902:b493:b0:2b0:c451:ae8a with SMTP id d9443c01a7336-2b5f9eaf437mr21403775ad.13.1776438953588;
        Fri, 17 Apr 2026 08:15:53 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.36.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa92c428sm29382555ad.0.2026.04.17.08.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:15:53 -0700 (PDT)
Message-ID: <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:45:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w-s0DpiO4cFRnLlRYXUOLwwM9oTX1TzG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NCBTYWx0ZWRfXzx1vbRRro5Hg
 bgViNihqYwkKG5eifRSZrf4ngbEtE1ui790RiWKxpVTJavQ6oSdITEL8VsBLIpdOy0Il98G5Tti
 7vW1X3c1yTXxOXcthf5yUVb5PRizwFWrHxRSbmYb2WuVKYJGHwSYVcQDd4aWnULKorGOpPmhN4O
 KxzvC1wRAwchLBKL6rYvglII3faDDO9kEWFXd1QQzUIcbdZdK0cnYLGVrsBL6wTUIKAWWihaOXf
 ZFKJQv1VE6L7OQVtmtRIm/wnkHcNrfz34fy90kTZW6wkVoEIG8a3j1Wpc37MJfru7qxaBpVS+py
 riBHAB48B/LHR+2NPgYNugtkFYtZEgn4sCsSG1jvmFd5D9nOw2YWaHcbL23/cb1GwxizepOs11C
 cVyavy1woAs8/OJbBJmqMEUFai/+/bgbMxLG2l8PIKC66MW1TftoSIqLyOiQqr38+/+hlrdLSky
 g2e/TJ8QVM9FEPiOGxw==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e24eab cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=XANuBpsXGvULjGEGCPeV4Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Gv3PURsRAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=uZtfZZKPeAmlM9mCzUkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: w-s0DpiO4cFRnLlRYXUOLwwM9oTX1TzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170154

On 15-04-2026 15:22, Konrad Dybcio wrote:
> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>> Downstream [1] this region is marked as shared and reusable so
>> describe it that way.
>>
>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
> 
> +Ekansh some insight, please?
> 
> We're giving away that memory via qcom_scm_assign_mem() anyway
> and I would assume that making it not-"no-map" could introduce issues
> when the OS tries to access that region
> 
With the current version and the upcoming planned enhancements, I don't
see any major benefits of making this as not-"no-map".

With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
entire memory-region to lpass VMIDs. and un-assign it only during
fastrpc_rpmsg_remove(). There have been implementation in downstream
where this memory is dumped in case of SSR or audio PDR using minidump,
so marking it `reusable` might make sense there, but that dump logic is
not added upstream.

Upon checking the DT, I see a bigger problem here, this memory-region
looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
Please correct me if I am wrong about this point.

[1]
https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500

//Ekansh
> Konrad
> 
> 
>>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> index 4b47efdb57b2..13094b5e9339 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>>  		};
>>  
>>  		adsp_mem: adsp-region@f6000000 {
>> +			compatible = "shared-dma-pool";
>>  			reg = <0x0 0xf6000000 0x0 0x800000>;
>> -			no-map;
>> +			reusable;
>>  		};
>>  
>>  		qseecom_mem: qseecom-region@f6800000 {
>>

