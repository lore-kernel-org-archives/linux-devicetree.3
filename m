Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185FD326923
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 04:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790309326; cv=none; b=OFlHhCXe1AI+byQHvHhXs++lpae7gBkfZbwBrirGYdnXc51QZ0aozCLOq97IapsJ8o5gMdweyqU6An4xKucXclAFCbUGCclE9OFyBXflQ/X8tkKbbi+fbDEOA8UX7Hg0Bs7c1/3q5QbSW9IxHEmw505GDSFEBWO66AiCoH6YOtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790309326; c=relaxed/simple;
	bh=+dOAda3zxjmUol975BAwpv4/X02vCxfJi2PJaeVTH0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuSg7Ztm7xw2WXtMy9g6QYhXAy6Wl72Hcrxu3UUsj5jRwNX2oaNMOzO+YlfAEWEOKCWwb2iRUAfmBUb8zManoJ4K2+SyIjbvtrt9ehJzMpJhlh04iuz2/AaYfeuTaNPazMAsEYNaoCf9re1YV2aiebQmYD8zX3rm4QGawxAJ8ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmuYVbRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3IpTb5W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmuYVbRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3IpTb5W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P1kVLC4051895
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 04:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yC18zP13i2KmpC/DV5boNOGnrL3YTVpI80ZH1XUdZTQ=; b=AmuYVbRVJXy5sSo4
	UbuJgB+9khPaiVd0aePcJSbRgHYrJ/sjsYXcbNKSxCkGndfEzCKU3Tst4sM4eN0x
	MZMngQbHIx7743lf5fw5i28pu1d27guytyrqpvUr3VvD8oJHaWa89Osaarb/Gnl8
	aG+OyANgooxpiYhIdWKeoYo6vwSocvyot+TYXDMsfKFr4jkcPUQs3kWZ7H7Qif8Y
	DBeWWcDuZAdCBfYKyBUFgqxevSxVr4R+ZDqEKjTAB6c3B25zXifseRG1+Mje/68o
	3cF+bYK1ZuZuVfQiGFKS9f82D44fkfvF8a0L4g3I3oxhcPqTlZyibquqZnu45e77
	cfAeCw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898sy6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 04:08:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so1552926eec.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790309324; x=1790914124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC18zP13i2KmpC/DV5boNOGnrL3YTVpI80ZH1XUdZTQ=;
        b=O3IpTb5W+Da+KJoVTUeUDCvLG64D+93rVBFmhMdnJskR8ApCckRdq3UctKmBaeNi/u
         fKTBGbPoPVF3l8HLFMjO4rpHZNKZf6GGD4tC44woGZyUQHJQWnad+sQ7h7K1lGVKp+Gn
         pLIrH1RoKhhetC0Rs6CFYnAdNJky3NI3qPEIxDcZjKHyVW4En2/C/LyauVDkmyhClNvt
         sJCvurJclortcan1qJRAyZ50a/EkfFdYDU/F4WUpGncuyEnTF3MjvQ8k0x2Bv1V615UL
         25eeIjMKSOabLSrPyQ13PHGLVtYtoONL/fCRxCMGMs8JP46McNQ7vGSk5cj04Iy3LRti
         uKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790309324; x=1790914124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC18zP13i2KmpC/DV5boNOGnrL3YTVpI80ZH1XUdZTQ=;
        b=cKFtBUkHGXMtIZ5JPCxMXmNCEtzmqNg1umy5Uj8m3V9YgXZW5b31cMxHnSbbKSrTRL
         3+afMi6CSPLAujtLSerCSJgGTzYpe1EZPeCdBrX5e5Bb5HJhCZ0CeTcW3hUnt1c3Ca7W
         U1UrV1bFeH/CKBXhecyreDI88JfmPbUaSxR/AXK3fzSIqvLCo+ZUGCpE2dO2JAEfrW9Y
         dIyRimRImRcK1rdBsERLRHZ3xjXxKT5ssZQNFCPEYaWyAoslCOCtlZnrZskfYhS1oY2K
         uFLjLcKmfk3lt/yCG13H4zHeFoWkw5QI3rSqG0rcp2k5rZc+SxRbSC4JfesUg5G8g5Tf
         uo4g==
X-Forwarded-Encrypted: i=1; AKwUvBxk17HccdTTcxod4DqVfDDVowTLDn9iq/ZYdrUuS0f1F2t7SI8DZo3K62IXZ8GPUnZlMrdaUKckxZMi@vger.kernel.org
X-Gm-Message-State: AFuF++kDlBA8WD+NEpjCdJ1B1HMU79DPtAK3RrNSVvubsx597cjPx1qE
	rjFKnqcF3sRfAHVteC3cms/l+N9kpD/rXl5/dn6ktrf4/W9KPJMWphGuATWYd2kDB+Bm18iOuml
	1AjKYH119INmF+pBbTY8rFsA4uAU4jOcrvFD69oshvPAOKSEQ3NhpNdClTTz//zrfo/M3V39z
X-Gm-Gg: AYBFou1ucv5IS5TLGj0dEY7HnLDX4xV+ckPSfMAjYnGiY7ZtT3jo0j6656JsEcO6CBA
	MHoIAsJl4oyKuuZbZcEUgc+TYAln8kTkYoVU3SYWf8C5Y9vKxpn96HAmc7khCOCTmqM9vBr1dVs
	zQ6eA/dFUdo1v75l2dq7DpVLEHzhvLkKLT6GG29AYlSxd4iBSGPIanxdB9S5zPvYPce3au1ubeA
	DfsNRvAVG0JqfmMzMkGAc25PKy72K5z33cUPTLocReFafUOOCvnOgi0v6zGAvV8/KloaexPtuMd
	KZOjbIbkRKp/je43J+MKQI68vuEHkEU5mRjeNn4C+M44V1Lsds0dko4OM4cuHU1qUFCQKdj+q3z
	KEqDZd7/ymo0eDsf3Km4zMxKJ/YYLFYLH
X-Received: by 2002:a05:7300:818e:b0:327:affc:b506 with SMTP id 5a478bee46e88-34004e839e1mr5134621eec.15.1790309323466;
        Thu, 24 Sep 2026 21:08:43 -0700 (PDT)
X-Received: by 2002:a05:7300:818e:b0:327:affc:b506 with SMTP id 5a478bee46e88-34004e839e1mr5134580eec.15.1790309322832;
        Thu, 24 Sep 2026 21:08:42 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm2812641eec.0.2026.09.24.21.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 21:08:42 -0700 (PDT)
Message-ID: <050f7d22-48a2-4114-babf-7cf21c4bc08b@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:38:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <20260921-nord-v4-1-ed05c6e09240@oss.qualcomm.com>
 <20260924-lumpy-robust-fulmar-1bfbe0@quoll>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260924-lumpy-robust-fulmar-1bfbe0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAxNiBTYWx0ZWRfXyzlGjW3GL4Y6
 R4UN57xDyxZj2G5sv0SRfqwdWAmsl/LN9KnFtyRng95UNlc22dTKbwrGMEXJ8nPwg5F4YGh++3a
 eQEMvMZGj925zkTx5WpEh+wFxFmN70P6kCaRUTfh0Lxb8BbeQswyPye/5SYtnGQSgRFyPnUbgzR
 XOUcr2mTtTE4QdD3jl75AcP1BzHUPXYrzTCVnguytwfTlQbvUMMKlXZ8/MfLOwVnYqQCyXQn8eJ
 C2wUBlnJJzMXlzpcPlboCD1IYF+mJ2Z8Io6WkMHRwO/bcD4pgI14Hetp7SeapykljZkroLxPs3+
 R+sqRsrWExx3iKvE+3hUu3I9zndA1WqWw4RU0xjdqzyuxtbbfcohB1LpKgO8rccOJSWivqzISPO
 7M/7ZpbtKEpaKQIwt1ZEZR4fGHx8S6Bt7GKyjSw+ju8gEK8QAntyHA+Flxxf6F2pam93/bHDOog
 8kft97fVxax+NYcgB0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAxNiBTYWx0ZWRfX/QTQSM6nwzRC
 MbjEdCvA0ZvB64kAHCJxnXd7i5oh2b+kJQLfyHq86xUEQEa6gM+xgeIo7JUt+wCXp/gcIPF+xnK
 UEh3DxL037njgwoevHXvr21Dtwf4RBw=
X-Proofpoint-GUID: xpzICvWx6Bf_DCUBfWOPZa39OEX_yEuy
X-Proofpoint-ORIG-GUID: xpzICvWx6Bf_DCUBfWOPZa39OEX_yEuy
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab5f3cc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=l-6eX-iZw65OgPShCm0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250016



On 9/24/2026 6:52 PM, Krzysztof Kozlowski wrote:
> On Mon, Sep 21, 2026 at 11:07:09AM +0530, Krishna Chaitanya Chundru wrote:
>> +
>> +  vdda-pll-d-supply: true
>> +
>> +  qcom,link-mode:
>> +    description:
>> +      Reference to the TCSR syscon register containing the PCIe link mode
>> +      selected by firmware. The property consists of the TCSR syscon
>> +      phandle followed by the offset of the TCSR_PCIE_LINK_CONFIG_MODE
>> +      register.
>> +      The register value selects one of these topologies.
>> +        0 (QMP_PCIE_NORD_MODE_X16)         — all ports combined as one x16 PHY
>> +        1 (QMP_PCIE_NORD_MODE_X8_X8)       — port A as x8 and ports B+C+D as x8
>> +        2 (QMP_PCIE_NORD_MODE_X8_X4_X4)    — port A as x8, port B as x4, and ports C+D as x4
>> +        3 (QMP_PCIE_NORD_MODE_X8_X4_X2_X2) — port A as x8, port B as x4, and ports C and D as x2
> Same question as last time. phy-cells tells which mode you are here.
> This is duplicating it and the register value CANNOT choose the
> topology. If it does, then phy-cells should be 0 as topology is defined
> by hardware already, no?
phy-cells does not describe the topology. The PHY argument is only used by the
PCIe controller to identify the PHY instance associated with that controller
(for example, phys = <&pcie_phy 2> selects PHY instance 2).

The qcom,link-mode property serves a different purpose. It provides access to
the firmware-programmed TCSR_PCIE_LINK_CONFIG_MODE register, which describes
the global lane partitioning (x16, x8+x8, x8+x4+x4, x8+x4+x2+x2, etc.).

  - phy-cells identifies which PHY instance a controller is using.
  - qcom,link-mode reports the overall topology selected by firmware.

- Krishna Chaitanya.
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: Phandle of the TCSR syscon
>> +          - description: Offset of TCSR_PCIE_LINK_CONFIG_MODE register
> Best regards,
> Krzysztof
>

