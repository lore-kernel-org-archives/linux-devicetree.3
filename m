Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AC9370D49
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379192; cv=none; b=PmQAX5kEw3a4CcGpXTm8odVndlf17obpG7VtdohI1DoEvyZVOyh9T9QTTs4M4gxsZbRbBr0LiBmkP0TCGSHVMiKJCiD7qoti01XyfAhVj2aYQbH1RfG9YyL/xLVCT/zsK2gCt843AuT9KrvrzIqyMAfw3xTMiN27XX2PFLthbcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379192; c=relaxed/simple;
	bh=JuoEZYzB3ObkgBG4v8HcpqypIuLamvT3Y/kB13uw8rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y42JftVN5yMnAXCHrT1cbkXvAfS5Ts28KUx5rfrcoey5HL7iHqJ+ufdUCwQgvQziyxbO/YB+4LVS2UErNAl/Fp0DIw3PZbTiTdNu6hJjGOha9tCF+aekPDMiHIEfads20GkfOaL6pmmSqSWY8IdxYgC/YvEDcEfzvxBCnkgCWoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiIatYA0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7sdDVAJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiIatYA0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7sdDVAJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pbPE1345898
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DM9epk6osFgRPk5W+PQdPweHVapvFSWj1NjJgY66wWM=; b=SiIatYA0T4hkxr6e
	ucHbDYwdTVTv8KDasRQXBnTZ+t47/e+aUrsicjfLp/pp7yTZ63EbHyFAx6WWGay3
	cVqPNE02YsQ2Lga/MjgSmC8O5DFuDpBrmQaWQftEXoJUEbAKDq9wCQuFc84M9OCE
	1LDJcY+wNTM7tnKcNdno0cRdLWIslvB0L7Ml8WPFlRrnIwcVmgSfsCsNGBQoocPy
	Tw51x+WZwJOv7zue/HZvHFbv8Nd+/ni0o6RUVDTSyOQUuh2TBW/yvHPLqpRs/jFY
	lOCZ3VAHTyJIItx/DQ6t6QcU2bnSPffDIC98p803RwNMF75NrtOM1QwPEX9fCEaV
	xf4gSA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7jm3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:19:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37ca93a9253so1460459a91.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379190; x=1782983990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DM9epk6osFgRPk5W+PQdPweHVapvFSWj1NjJgY66wWM=;
        b=C7sdDVAJNfnAj2+TNAzBVK3RtTZ2Rr1Us5No4RzLz4sKRXo9OCX4Wa+X4puqslM/Vy
         GD6So3/ycT6xZINRVyMvRJOH7VQA+9sog0A7mtgzfULiXduSek8ElajZItcJj5gsctOZ
         E+K9CxPljeCW9eD6Zs8zx6TdtkGQvbuyVjadEAafOxvtPZ9Stbs83BzQRlRLG+ItbY3r
         5bqJPyVme3F7Vty5L5qxpGJZiK7kcddKEKnW2ks4Nq3cFC4lOY2bzpcn4LOWTjF1Cvih
         mZqP1bJD5B9zS82Rs7ndeShcn70B8t30oalZihavbeR4KsUGAokQS9BSMue7x1qmocWm
         ZGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379190; x=1782983990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DM9epk6osFgRPk5W+PQdPweHVapvFSWj1NjJgY66wWM=;
        b=gaaecxBq0AjciQLWxK0w+ohScbKED1/rfIgN+9UsmDa6T7dZvBNJbCCMkusNx2mxmr
         12UuKuNo6eXFShuFXTNbg5jS7lxJTPlAaQko20eBdzXoNxgH9VWwIK6kI+M/RF0hwur8
         g6iptja5k6RIqNoeRZ5DgiDXNNzIWypzaO7PXUt8gDoVCSJHpW+PJ2Xfge+MP+YY6qnP
         FIOjiMJZx5oVKdMGFslHiFTA+vV9Fa7/vYGTKQvCAucy9wfnpHjjwITqTGj2UMEpq2nP
         Afy4pfRnlhSbaCK7Fc1zQ4GGLkNhHU0qacGmVxOIcqqfSJnH7peEW8wjJmx7kxzsxFdu
         0H7g==
X-Forwarded-Encrypted: i=1; AHgh+Rrnx4RJBM0G8o2CT4NrwpKN+Q4IsvYGcw7cJ+O+xMsQssjvTITHQ2lByU7zsPW3i1kJxlWh+LG9BMKT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg9rTiIcf01NMcHrGkn87Cc+UefLL14OkRgD5Ky8MBExlQaisE
	ty054IqZtQxnG9lNn7ORhu1qYQUywrBXGhIWybhOQMZxONeNN0sEDDO/TfuxNZMWHCfV9YOZsZl
	wvhNNqpxxNqmL1UjtcDVw9TcPVv8Z7iIn1IhMxQgd0SdJWi4qXa8q1Gp0FYzC3iw/ezJwiXZh
X-Gm-Gg: AfdE7cnB2KOrKw2qXW6+sGJw3LIM9ctvP+f/decUWo9hrD+b3Gwo00SgFfx0bG2sFAi
	+OvESAO+P2fbC8vvHb9EDXGlm2aIPvopBUeCL8oAPHrS7fD4qPfiooi1cIE1bcujFafe1scqSFz
	Ti2CLRJs3LJC8pMwPEe7o5j+Gn3lGqUC+pK+LAHj6V2DsIivspKUZfhE5p8k3oTyLzKwkLpdHH+
	NM3arevoS4kOg02kub0/aM60ikDTrhNJAIEOtgoD9mCAAFB5YDz5XmkJXLRUNtpv+56n5W0fB0+
	GVWXGVr9pz0lWDVoBTloWdZ1fM0G9mSew4FyBrWvaSGEb5b4rfSkWH7lrKCTqqqkXzYi0YPJZl1
	R0TV/Zo+xcaAfLiRS1kNPzNzbEkZt8zzAxUJFHg==
X-Received: by 2002:a17:90b:3a8f:b0:37d:f921:6ebc with SMTP id 98e67ed59e1d1-37df9f381d2mr1774271a91.7.1782379190062;
        Thu, 25 Jun 2026 02:19:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8f:b0:37d:f921:6ebc with SMTP id 98e67ed59e1d1-37df9f381d2mr1774239a91.7.1782379189596;
        Thu, 25 Jun 2026 02:19:49 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3dfdba5sm1559548a91.9.2026.06.25.02.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:19:49 -0700 (PDT)
Message-ID: <9160405a-25ff-438f-9ea4-e2a6f5c87eb8@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:49:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
 <0fcfe7c3-ff54-4a72-9529-8f55d77814ef@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <0fcfe7c3-ff54-4a72-9529-8f55d77814ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfXyC9JPQ1LgCbh
 F+db+VlZVl8cVVC2Y3+Ifl5pfspILUh0jUYR2l/4218AWNbU0pznxgKNtQ5ZrD6S0PLwUV+NC27
 Rf9/XC3tszdPsiefQgO/Zcp28h9uwTk=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3cf2b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2ecveFB43z4dzVmMHVYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: xArXo6ugKp3WNa6a6ZsQK2L8o_1-lxH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfXwGZ6zidw967D
 EGi3ilXmtCFNMx+xGtYM+CKdAo3OGj4iI31BamPi/+fkvE7uNvjdU4oB9PmrCLbGUashIX6cptd
 Sj/8Mhyh0U4Dd+QHW5kov4BU5eqdoUcgujbesEpCQJDqBghKMQa+/S0Nawd3tM6QRqELOdBkmdy
 Y+bHWZ3sBjkQufFmPnsrvuFnPDQtWMujFkWebz9fwjFPHafqBrXyhK8N2lQoYlbIolhLa7ZWOww
 g9VHrSqokcLoV7tk2TAkXpyx1Vxa4OqFEqw4xabP4Df5y1REmttYiGn3MNK18W4xAZaW0Sosn/n
 WVwGV9klQVK0Xa/2CSqpJUuSBhwluyiUcI3SxyIuqQlAnA0C1/vD2A2I4VtJd7D48w+ibKMZdtF
 ENyx8SvSD2GNa01f6pzrcJTUtSM/m4VrmyTUjhSsm0r0CIuEZudHF9J5VZq3khVGZITY9594vk8
 gf2JIaZR4q3CKx73URw==
X-Proofpoint-GUID: xArXo6ugKp3WNa6a6ZsQK2L8o_1-lxH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079



On 6/17/2026 6:42 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:
>> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
>> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
>> as below on various SoCs.
> 
> [...]
> 
>> -	ret = pdc_setup_pin_mapping(node);
>> +	ret = pdc_setup_pin_mapping(dev, node);
> 
> dev is enough, we can get the np in that function from dev->of_node
> 
> otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Sure, Will update in v4 for getting np from dev->of_node.

Thanks,
Maulik
