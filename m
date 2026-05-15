Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620EE3B2FE7
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851845; cv=none; b=sHDAhpQFMay9BKbT0xBC/MtuIjjmt6dz+B4j3fj64m0TIMz9u4fS/AAAzIQbVaKUCOKvtM8ArWNaKo/aYaW5/kTUJIA+sCSfJE3YW7wwtVZkAA+BXISXAf+aqaYYLrg/wDU3eMaKcPut2uP9lIut3RxMvDRd/llYF1STCwsHemQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851845; c=relaxed/simple;
	bh=E3Fh8rz3WYe2ohpm+DHKECMRr4K1QHvJv/ifilJtXGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxkXUWW3XYZsZAK70qAMtZpfvp3OtGk4HUGrZbRuZZNspJ7bq70FUIXaXJMv/wmAmdOzL3eStjqSws8fvCVzjl1x2iRzNorsaHaz0oosBnESkHH9wKeOwOsb0C67TJ+q9I5ohrbgMDRdTqwsU5B2UuD6vZAFip9pepA3V6bK7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ooi9Fdk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9TBHDTw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ooi9Fdk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9TBHDTw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB7DH33200311
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bNBPjawQmJSnV08ZoyTHF4GbC57zg7+EEAvYbW1jGOA=; b=ooi9Fdk4FtLbsM4X
	cKhHYk3K18NMUCkkpPFmubAdUK2LhChC8Roo+7ztd4me2ZUswHCenloPVM/Nu6pm
	cv9HTdq023eJiZggnPF0UVJvzL5DntK6DjmzGWtLb1JGEAV6wVkkYZS+ZttyGDqe
	dljQ708hOUjAyf9CIH0i7QSRbKy4QdMLtBs1oATVM0z01x4ioyD9wADN85jMhAlw
	sTI8cV7TFFJWLOccQy4xSqrVXbczdPw3YJ+pu/UWDh8E0MEd0VmMliplqy5l9qZ6
	DyYRswoq7Uaigj5gMCNwmMBrl0EzKObIESEQyXRecjGFY/hoXeKnnB5TdhWWMYp5
	c0x8Mg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qucf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:30:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babbeff9e4so11095205ad.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778851842; x=1779456642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNBPjawQmJSnV08ZoyTHF4GbC57zg7+EEAvYbW1jGOA=;
        b=W9TBHDTw5u8w2KILhpHkw2/ijTVW13q6HdooJtejzLzeDBNMR3KRVMEwNT1ebffEkm
         iFRs+9ZK0LvESmTSZYaWxBNevrgklhVkNfyTW+ZqM/3sneACsF95x3dq5LQllz/SceaZ
         JLEgH2grspHPaMwznP5ankF7evhxhBI5UJ+J/8dAGySDsQySCJrxReta14c3jO6kY0Mt
         KiTNn3rfTU8rDabCdf1Ju/tAuI2+Pwc1GbtAQWcGSgbUMGOyFdwZF0cwuBaPVNeTOxF3
         saRHEbse01CSNrvARLNls8wErbydEO1lDbXdhTPJcbqpimLhhwIGAd57PhlnONfZLQUT
         vSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851842; x=1779456642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNBPjawQmJSnV08ZoyTHF4GbC57zg7+EEAvYbW1jGOA=;
        b=g3r2W18Ly21d2CWtb5cl0/jDnSOT2VyjxfEBKfN+vPmyoLgHJUplzgMTYRi00er1Qv
         9yr61mx5Vt+fCoHsEuVTjoamviYWDSrD/lIQg6sMxtaZ9DuoBTMwtHGYQLDrNdKVOf/e
         s3gfffQnCHVVw47Uj+BV4pDhWpfWXrPRgzhkBtRvA9psnstf42hNeaMr/CbPprXion9/
         SSy9xlTXgfKxQ6hnVucMwT77QaphstiVvKra9EywO9G6+9UU9FZjxLAxcWX2BPlyy4Ks
         wN3/fA0AOAtrRPF3jGew9ccDVTETuTAPsD4xzsjxBS4vNt7MFrJ28O4l1PtVZ+loEJ04
         mNuA==
X-Forwarded-Encrypted: i=1; AFNElJ/HAtOI6ZdmKYQUwgA/kkLtgpZyFIZJduB9qfYS5Wu+mnNVvosV0Qc92ZkS/Fp5XlSpHuHSi7/dL58E@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Hi6gTk18emYukFn1f5k5gc7tRWmzcmVgDYROnaWr41+dtHyQ
	R5vHw2PudQJKBPmJqbq3WUskRQly5fdkohWx1nPilHr5uL6cln7p6tvPhLVzDTuBTN8B8ftbnR6
	oarYEeOaY0/mL6WplpjHWzbf7DNQ15kGR12fwac4xqjiFWLKytlzkOf/jcI/KmMpl
X-Gm-Gg: Acq92OGTkXomMdf/P5oVQ0Fh74Ybrpg1CbbL89MtRSTKLx/LzM8IFaCIWzMZhwEhgCO
	H14b8qZPxc2M3LxBdS+SIGZUVx/TW3ozJpJR3oB/hgebXnjkajotyzh8aiAA5WmSOAJgxfMesBr
	0ZgD9FbYx+pKaJvkQlZOoKNqQjKa9x+IDzDN+UOX/Spo6HVETsJS16SItQIsJR3hFfP+KMjio/R
	fzbPF1dKANs9RRk/HVpmgBWKVoyRRKslJV2OrqXHSi2gKsRSQM7+z1FcapEddZL97zDvS1UNPXq
	g5Yi4m07YYhAJSEER0FAIkovquWl1RpPP+J+cokSkeL7EjgckcNb4SahOQ9QXBdY8FTj5ORyqVD
	kvWv8GjEtbZItp/58ZEcsUamBlXzrJZkHwLwlR0bc5W0WRMJp17bAEjxHksM74MzPdu6BSB4J7W
	aTrw==
X-Received: by 2002:a17:902:f78a:b0:2bc:cf06:221c with SMTP id d9443c01a7336-2bd527d773dmr69792275ad.21.1778851841896;
        Fri, 15 May 2026 06:30:41 -0700 (PDT)
X-Received: by 2002:a17:902:f78a:b0:2bc:cf06:221c with SMTP id d9443c01a7336-2bd527d773dmr69791705ad.21.1778851841358;
        Fri, 15 May 2026 06:30:41 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.84.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6b8fsm63057275ad.46.2026.05.15.06.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 06:30:40 -0700 (PDT)
Message-ID: <b8f02a31-b175-4dc2-9b2a-5765774b4d88@oss.qualcomm.com>
Date: Fri, 15 May 2026 19:00:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for IPQ9650
 SoC
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a072002 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=pcck7Iv2+kD8UxzcD71x3w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dvW0RAlsEONp_D_cdWEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: hSqeCniTJCwDXFrVExoitPWdnqDlWqx2
X-Proofpoint-ORIG-GUID: hSqeCniTJCwDXFrVExoitPWdnqDlWqx2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNiBTYWx0ZWRfX7Yr8WQ/qLsX1
 mqKD3x2KtYa7Yl6vCMRmzDUC6Ns1YYCJ8vF7vzSg2y/a+IStYKFAC1JxyWgNep4Ltuh/PJokC1F
 UuSmk25iFdJB4rz4r+XgLeqYVoW1mfu26mQgEM7YU6fbHr68BjSlXPV0aJhIenGq6mtzbO0HmMn
 kJrJamOWG4dtHsasHydNFsf2so5Bknn+tvfleAco6Cx3YxU5X6EOjKtNUpz/tYW4FjSFkfBqgyF
 t9gSCibVg2jh9JxsHGZNUHZafKS7bYF5UT4zELaA1aH3pWWRM+1ZWa3jEbqYwTbnaOONpOSMxEb
 fzKvJ8hawcu+3ddp6jOUGatvrPWzemmDMzvQmHcK+2kex/y4YrDKylP8OMPtukjiBXIaCCDssN2
 D4uYrZIC6SBZstYSxqK6e6jDHzd96ZOTVd6K8p+Qm1OPdI7v5cdL/jCWkAZ1ehljRm+2q86b8sm
 5seOuBKqloVjF6vyvtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150136


On 5/12/2026 12:17 PM, Kathiravan Thirumoorthy wrote:
> Qualcomm IPQ9650 SoC include APPS SMMU that implements arm,mmu-500.
> Document the compatible for the same.

Kindly ignore this patch. I will repost along with DTSI changes once it 
is validated again!

>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547..226f16711d67 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -37,6 +37,7 @@ properties:
>             - enum:
>                 - qcom,eliza-smmu-500
>                 - qcom,glymur-smmu-500
> +              - qcom,ipq9650-smmu-500
>                 - qcom,kaanapali-smmu-500
>                 - qcom,milos-smmu-500
>                 - qcom,qcm2290-smmu-500
>
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260512-ipq9650_smmu_binding-36dc05d39860
>
> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
