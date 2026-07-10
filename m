Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E99372B57
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690606; cv=none; b=LASGXpSnU31ysLxq1j0Gw2fDaS1UFEe3kVaBjotyNxzfRgwCXT8+YxG9vgtdBUQcP16vPiqGuxHtBWVJWYvZiNGtQfUqv+Et3CcserPWNvgyTgC083NwlhD+oBeRJXU3lQTsPJL69TKMA/MoZuq9MYJKH5ZGg46aPsWaaocIShg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690606; c=relaxed/simple;
	bh=560S0t5MFs+Puicfa0vOlBipg/JOUPnOJyV5iCkNDFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hb9uYSvIRdWQ0uYu04IBvHewY0LXfcklJkBU+gqGpZMAiO1sbe99tjlOpXrFnXgbzJ0cdopFAD0DywiRFzzmlyTY20ClSfMtu4OYrbVGDwMHG8bR5DGYvHa/InatH7vXOfYNgiZTfuL9O5mK26woM6goz7coftBa+yxXxp6wBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWoS3LeD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScxXT3JJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jWoS3LeD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ScxXT3JJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6aSD871684
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feZRSEEsyFMh61ysr/36LiJibvLNR3LeMy58K8LaAe0=; b=jWoS3LeDHGko/0yB
	DmyB3fAcuubSMrl3KAxjkWcFPsaTFsF8oaeMfaTJIPuH03huvsJQxynPHkNPI19s
	UzEKIgOqMVOYbXXuPpTAT313UPTFvO3Th5Rp3WP6v81mi6O/VZSvQmPIyJDhLY28
	tnxPLKOWNB7Joo/PELVvJlZ4vtfQb9U3rnXRckKikeiH6n6+hgLHtiNiWA0Ippsq
	O8+QCuuXV6oX4B7931VhLLezd1yVvAEcAWGavgjc0L0t3H8GTgRRpO1dgRgc0+58
	G98g1vuqZD0zQfntgQ1dwGQQNU78UO061DPFRm82TXZL+gquOs7sw6BqvZEZsznU
	qgVoJw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8mxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:36:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso1783392a12.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783690603; x=1784295403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feZRSEEsyFMh61ysr/36LiJibvLNR3LeMy58K8LaAe0=;
        b=ScxXT3JJLt0gbOIAfZKlxdonChU/lMIY98y5CQyHpuctcSVOwFJ4ENbc0+P+RTWMAH
         NloqpwQRkKrV6MVBV8xgX0snJYGxS2vkBlZ0STdEGjx1sVvNiym/QXHRX1o/f9jTyLM2
         FEJUGCdLYgh583owb3JLuPB20/uDti7Cybrr+naeEtmWBr2OaPPN/9hHGiYqnRsedU+E
         BI4wZGyC5ZKQF+SXIY1BAWNEAUVUILPk0oUE72DYAzj2UJSBdfiLaNQ26FVqryBgNmoT
         YZVcgE8AE7Ac0tmdLvMG8KSVxZ4dAsWSTl9/yO5SEllv5hBW098Pbrm+oXJp4yrnW3T4
         5OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783690603; x=1784295403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feZRSEEsyFMh61ysr/36LiJibvLNR3LeMy58K8LaAe0=;
        b=rnJDAvm+fbITprrhajKt7zbaM+EPK0/yiZf2xMmZcVPAmkSy15h0lLjfKwZn+FwP5l
         WUdbTtRf1SyfuEYUOwAeNQfwFtSHTr/AE16+tNoiPThJXSnm1gy+MODCgHnmirbTf/CC
         tElyS45SVXZ5X+fkv6ExiPqQeI506JcAi6ps/4jAUnJrGQX/dYZfq/I1fIO1Q75CTB0l
         uX8Opzlx9JZ8vpIxC0rDwIYDat6hpDzMtLBjekUpV0+cr++h9ZvBz/GX0qto6oIv8kbL
         NuzMn+FhetceYGHAW40xQHmUNaQbMB6acfc0OCwDpBV5J7C2nPIWrKym/yeTc6eGPPKM
         Cavg==
X-Forwarded-Encrypted: i=1; AHgh+RpSWSDvPPBRvrz8JBizkV5kGVBTZCunHi8ebGlPqhgx8dCYVAzp+aaCpFBxPeAStOsbzfh5IxKyvRgx@vger.kernel.org
X-Gm-Message-State: AOJu0YxnbtGVn0eHWXAxBYNvMt9BXFkLAUk33G4SwvNpBSTOpuE7qERu
	N3Uq15+7cPKMSYxpHIy3Q5g7KxJIKrpZUZkkRUW/AIg9C4k9yWcqWpNwesA968qiIRTcnwfV3m8
	SxdrEYeCO1U35mTf3ij5ZA+xo3IMBa0TEEEC+A2mlW4ucWBXRUc2eTCNxUyK0DbZC31AMVbQ5
X-Gm-Gg: AfdE7cnho2D7FPVi3H4f8JKIIOFZQfRFPMpsxZciNWwo+62ChPWrhdG1e0QpkTcAQsA
	DOQRPuCHaWD8NqiR0YpD6SxpKvqMHS8c2+psdkaHpiG3PtdrWUTivSkkHfWeWNWEFrx+rNOudSS
	yjgWRLdkb0SDa610071mwIPrA/izFsCP9/A2mO+xxhmAmKekY+zdRmSwYNbFWwSzuUtzFmKOQ4F
	0kixryw8lxHuNJswd3G5oAttoq400chK1loKv0GBtHKrz59NNgFFILxZzyonWKFP/+PDoBlLqvJ
	BRX30fUYVXiHckgj5AlRfafSz/ZL2D15EbyA0zEvpms/pmeMXC8zv7E8DEv5ukq4Z60VgcKq2zr
	iLOsRLLSmO9xAXBLdtx2tcddm7bRbvmne/nKQN8DujYTd
X-Received: by 2002:a05:6a20:3d20:b0:3b4:e4f0:94e1 with SMTP id adf61e73a8af0-3c0bd0f9dbemr14518544637.39.1783690602884;
        Fri, 10 Jul 2026 06:36:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d20:b0:3b4:e4f0:94e1 with SMTP id adf61e73a8af0-3c0bd0f9dbemr14518495637.39.1783690602425;
        Fri, 10 Jul 2026 06:36:42 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm74501495c88.14.2026.07.10.06.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:36:41 -0700 (PDT)
Message-ID: <f0fa6acb-2d70-4154-96e0-09e88af129e3@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 19:06:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <7GAZnP6jPoRrcDnaVzeaB98cONLhtvbiEXV1yD5MJJrA9pCnC9lmlSiCGA8vlDezSXADjmFiqo3ZdClO5SxCFA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DUOAsYJW7Kk8r6vaDXHHq3_l5Op68S1b
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50f56b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=5i2VpEqXucwHfqzRn4MA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNSBTYWx0ZWRfX8oIajsIyQNd+
 SnFtU0Wagud2d1cWEvw7pyr57cDLRItDbJIeIi+VBy64svvrcl4VsYbXwz4+7uuxJu8jENtDLiu
 LkbSyeSj0T6Kvfkj4iQH9JB43m0GBZo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNSBTYWx0ZWRfXwRhpNFJiEhGd
 h4W8XTgA+5JYKi9d5apEDDogf93q7ZrFF4KgYJOW3c24et6z9h45Fqbl7yFS9Cz+SCo3lalHj50
 wGdaTrrdMZgVviQ5I04hVoRUsyLQD2R8K+Dh16yOkHhbIcr2yTCmrkDVqTcndoOgjM6oiAfv0mr
 4N3Ynvb37E2FdS1Rtbu+cFRCftAZf+exwhvHVCiX+YaI3ejAKryHcXDMZXGjMzxshWyNUZsWjBV
 qojYTXzkCTQFOQgjDov72UCAiCHs7vBohyZBw2iC8Y0vv9mRXJUpBS3n3/u+Z9FxzikoPKxMosM
 ubffVjtGR+0Xhk0r07pVgkxP3JEaPej98eeZGEK9XmH3BpOuQZSW3JXcNfbrJse67v383kyVWoF
 ssnklzZT9Kn4Ie+mGqxTs/gHw01C6yMx07wJ0jB8ly6sCHjCIlYdkK5htfBnG3KpbAWb3P/ACsU
 SF79Fz5RoKlr848DPXw==
X-Proofpoint-GUID: DUOAsYJW7Kk8r6vaDXHHq3_l5Op68S1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100135


On 7/10/2026 4:05 PM, Bryan O'Donoghue wrote:
> On 09/07/2026 13:35, Vikash Garodia wrote:
>> Mapping a stream outside its expected range can cause unintended
>> behavior, including device crashes, as reported at:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> Daniel, who reported the crash issue, have also raised a patch to 
>> workaround
>> the issue. While the patch partially handles the limitation, it is 
>> inefficient
>> in a way that it keep iris hardwares away from using the 600MB address 
>> space
>> for all the different streams.
>>
>> To address this limitation, the subset of stream/s are now represented as
>> sub nodes, so that they can be associated to the respective addressable
>> range.
>> In the past, this limitation was tried with iommu-map approach, with iris
>> driver dynamically creating the devices. The approach was later concluded
>> as an hack to avoid having sub nodes. It was discussed in detail in the
>> discussionhttps://lore.kernel.org/all/c7b956a9-d3e8-4e18- 
>> b780-5d08f5cd2ca1@kernel.org/
>>
>> It was agreed by maintainers to proceed with sub node approach to address
>> the VPU hardware limitation.
> 
> What's the addressable range with sub-nodes ?
> 
> The original problem you were trying to solve was the total addressable 
> size - this other problem here segmenting the linear allocation space is 
> adjacent but not the same thing.
> 
> Without digging through all of the patches here - my question is does 
> the original sub-node addressable space problem get resolved in your 
> proposal here ?

The proposal solves both the problem we have so far - total addressable 
size as well as which segment (or range) in that is _not_ addressable.

Regards,
Vikash

> 
> ---
> bod

