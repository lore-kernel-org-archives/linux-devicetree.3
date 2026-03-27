Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815BD3A7F6F
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606257; cv=none; b=gSP+fXP/ms0OQfgg5nXVednsGkh6t8Ur/wCctJDPser4RJN3YrLVfo4DoInK0sI/lUPG/bIeNGrpPYJERflE680IGFyLmexhAGKnPnWe3K6fqQhP+/HZZVcbbZEBs3w8/cCO5ucaq7buLmJEAsuzN+aRrosSRWar1fW1IQSq5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606257; c=relaxed/simple;
	bh=vrHxpfVQN1sEK0Pq40uAXExUzcToMFU5jlkMehylaB8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HH0eM0W1psmGT/UOeBV2Uo1aDOwc0I9wPshOViJivMs6w7uPXrt9HmwZFkJm06TpmWFZYqyYIrRpGm94kL+o0h71L0r6cgvs5ho1RGf4yrVVXs5NWEOKZjalyu3hsAiX2clLrHyOARt3hRRhQH2h4RrBrbToiNIG1DvAj/DvmxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDlUo5Go; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1I42vQr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDlUo5Go";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1I42vQr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vlB71749218
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDWZMO5h2IQY+cPJNgvKm7ajLI4QyoVQ1qlMtZyf/r4=; b=EDlUo5GoPu3boS5v
	voYrpK75gECrGFw/brUsE5FkrvAmmzWXgB15Fo4rVfaqPqu5JXrQmCx1hT+/Kkq1
	K41CxsAoP6MinJZlzrRIMujOPZ+2l0UieAfgEP3H4t5C23fRz8mDHRIDhrvlitjW
	FTvCmz8ZV9t8cNiBXSRk1/BVqTk3kaLeJHvw627D6akceXAW7bQxi4lGomUKQwlx
	0MXPplm7XKOVzgggx6mxkYeeeAbHhJbMbvUM9gyDiVDTXYTv9PK/m3V2UjJbU1il
	wotIvGGYCHK9aLk7ChpqwzGisCCYoeqkWJoz+Ekxsj6efaVSqTlGE7dsZL2Hlh0w
	PcOrpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn10umx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:10:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b9074bd42so6125771cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606255; x=1775211055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hDWZMO5h2IQY+cPJNgvKm7ajLI4QyoVQ1qlMtZyf/r4=;
        b=d1I42vQrCcMkANQrklbvrtvU/u7zBhD+r9M91G8kMgwBy3wW/H9YcFOIDNcwgUG45M
         HFwXbaOtF4S3/UIeLyXHv5+IFBLsi+NoEnk3FOtYPUZmTHqAtxLIkfeVC+1n7T5OZSZ5
         /zlGhyfDMdTkzLAZpQvYpR1hhsJVzEt5ogyp3Zng6iR3ngOY77xgkdxpLQ775Bxwu6iF
         jzSUx0j7vs1RowTgJVM+0+HkP+dQ7PCoVmovluYOI4vFNuRr3JLx93G+l5CFZ98Vyeyz
         Q6aY+7sl/xTy9kmU5OvGMvKee2kMobUNxwax/uawadPRCK1J3YNu9FojRimvyx/ZkIJk
         EnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606255; x=1775211055;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDWZMO5h2IQY+cPJNgvKm7ajLI4QyoVQ1qlMtZyf/r4=;
        b=is57NXaCKff0UrZscFe0vw7vj9e+Z8uINgyWWTatVIXxG5lFTJHbXVSNhIcU+FHlnj
         VdXKNwrN1K/W+MU7aRVZQHsYBXqii+H8HQ0YEL7k7ten1CdWRyt/9MSJjiGtF13TenKm
         snlh/5or+58iQVD169utivJeN+B4qOGYTsT3KgDDyQTFxQEvWpU0oexK02jwh0F7i1l0
         WFszg3LgLyORecP1fT2/EX4ZKcK0vFJX7wEgwS8c+sgNYT5XXmllK6d/3okWNfdr9sad
         ZSoE+jN+5V85TNltPBNushTyeOkzxD+HuyhDwAf0zey6Y8Yv6nzUk1MbAxM5WAuRmzkd
         a+fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqPt0hCiKrJz+UW1eC4+w67NSdzv1rX8OrsXGnOP+8VpWFjvFnOhiznItfrkjUw5TKXk6pxjxJ0Iz5@vger.kernel.org
X-Gm-Message-State: AOJu0YzRsNDk5uFV8+ujlzQ5hxeRX4ScyOp1w/nUu4vQs0n90Bd4wH5T
	8KRAV5yA/WqH7sml79cGfdM9w9QrQ6LwTY5sIGf+USSsjW4tHjDLv2RXGcxNkTVATkFnquYpi0l
	OmPFTRr39sDuqsc59qoku7/ETiQ6pHlOKlCPw5TTa5VLcOt1+D6A34eu1mqdzkmQ/
X-Gm-Gg: ATEYQzzIfsZjLUQercmac6xgRthl5QEbqJ4ZV22ZoqcdZm7TagFP5nQ5Tz/qmMlHjoL
	XQ9/8RCHpj7Q3lLUXqB/NB07kQLIX7gC5STA/EgUm3hFM9GDfTx6Sd+XByF3abwCKWCTjuBgtrM
	hbt/hSNNJ4e7ZGnH2oRvm5wrK7z3G5lcXMGzyiTzBWXRRi7E4Chb2vQONWKg1X2KCiNYQftPG2p
	dpBKnt7I3GKXM3aKlZ6qZ4iuRbm8TAQzgJjk8ZKd2Y+BRUlhTL12IJhw9aJDmx3fWfv0rz68Hyw
	VCDlE1j4ehu2th8pXNzy7BU3IEf7FpUFJ9NuBUVUdSwdTb6Dya5JjhQ2D4QWpOJlYn0a/1BxXw6
	p3yxwzITB9m4wVNQ8D9fehIxcbPYuw7TuKdFTYQzy9Bhqo1fLJuIwkY4UjPTGSX8xgh7kGUuujN
	RyX4U=
X-Received: by 2002:a05:622a:82:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50ba393605emr19878321cf.6.1774606254836;
        Fri, 27 Mar 2026 03:10:54 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50ba393605emr19878101cf.6.1774606254407;
        Fri, 27 Mar 2026 03:10:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203eec9fsm219026466b.42.2026.03.27.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:10:53 -0700 (PDT)
Message-ID: <c73b1887-6304-49a4-b6e8-a162d1bd55c9@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:10:51 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX+X0a+lEpL7zE
 5HYtNhQ7Z3V98FQ/IPBE2XP+H2yGxF64qArfstY5F0AtP1D/hDtwNLPoFE3lELfHu69TEAnyedz
 Gz3bdsZzXXhIKAWqPypfeliHgh+t47f3PETGeUfGJxMwECzmVT/SWHSon3dDxkNg7f7HvsFAMRR
 o+Tamgllw5OSyR8vsHAHqvoMENuoaTm8sOHJOrFLbIsc3Paf7igyu8LZhPAhqhrwfGlbMDxfuWa
 a78jbvKgTjbo+MlqG0j+7HuRDdnRJRSXLTZeOdYm/XPEMuFemWD9FXqcwrJfOmyqFGHCAM5lX+d
 nWGhNpbSu8A9RH5v9Yj4Ut/Vcw9DP+hVj6/tGIhDiRNPDlXnVeQwhV+QMlKDuqeh8kQUZEqjQJI
 h7l7ls5GHOa4E/YxKlOrbp++CXVI8xBauOkmIbXT/ocyRLvbq+8+u+QWfiW1KIgFIkD5diGklzP
 q5FPQElcs4iyvkzQRVw==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c657af cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=-gb4YIgPANaGSZa7PYgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: QyYNq2hP79DvM4wAvCOuJNPPhFC3OSVh
X-Proofpoint-GUID: QyYNq2hP79DvM4wAvCOuJNPPhFC3OSVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075

On 3/27/26 11:07 AM, Konrad Dybcio wrote:
> On 3/26/26 2:04 AM, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>> PHY devices.
>>
>> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
>> capture those modes as:
>>
>> - PHY_QCOM_CSI2_MODE_DPHY
>> - PHY_QCOM_CSI2_MODE_CPHY
>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> 
> Does the _PHY_ DT node need to be aware about this upfront?
> 
> If we have some sideband signal (e.g. the sensor driver specifically
> requesting C-PHY mode), we can simply throw all this complexity into
> phy_mode + phy_configure_opts, all at runtime

Actually perhaps just phy_configure_opts, because phy_mode could be left
as "MIPI_CSI" to reduce complexity (while still carrying info about D/C
mode in the latter)

Konrad
