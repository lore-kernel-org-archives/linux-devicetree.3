Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5B37E5DC
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 06:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825814; cv=none; b=VcR8QlkK0g29BRsTVd7B3/YS9YU8MWZRfkSwZq7MC+DJkEaNSIU7UvIOSj1/4O1cABCzO97uRbUJCKNS2JhuMwJCxu/jVk80TQBrLHnsIRqYfrdvOF8Rg2gifbMZ2gYkf2RGFNr62uRI7QFBvPWAcWlj6I7gGn26ia+ufaIxAes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825814; c=relaxed/simple;
	bh=yL1mdYdeU4Q86xQ5+DJK/R11hKApPW9BV32LAm3pEcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9FsmdANn/2iM9iyLpYBcvB+jl6FR66gVjOdQc9AnmAV07hY+UdPnEnsJD61Zn6QT4FUaisakdldJOYQAI9j2P7PaXckErxadK/PQD4x40sEQz6Wqum8WCVPRbx9moTB5SBn98fV/ujyHMYEfpqRUWJ2FaMs/GJWCuLkpk56o7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1RiAgE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITpmKjlX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1RiAgE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITpmKjlX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417JAV2430559
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 06:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4hFWZPTgwOL+XjLNG+cDq4GULAAwRZpS1PblWfC2LU=; b=p1RiAgE1p8lfFyhL
	kDtdS+UZZzKTbpZgWmv19fAeW+Jv9IKrNMHg6ta4Oso0aY5X+xuW6wFnh4LgHAlq
	Yl6YEl7vJiAVvDjJJ9Evb8rhhIBUKL5Jm3h0f+bqZ0BkXEzTNL6aGb98nfWLeNYp
	it4F2c4q5orV2WwBBJ/I0X+4c0COA+pOEp/XOY/E8On0Hnba06hgXGf5NeIINp/y
	zfb7Qkq680YP7FxOcjuK8rHSRZ4LiGCbTTKx2N7qjzBOsx5sS+fG03QeZM5ywFl7
	ItVfg6iPO5uba0GWI3xN3OzXdrI9/4bb0lQnAWlRIPhBK4MoIxvMWSth6t1Wdi/D
	W8PEbA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r2ut8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:43:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce14a21faso10408155ad.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785825812; x=1786430612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4hFWZPTgwOL+XjLNG+cDq4GULAAwRZpS1PblWfC2LU=;
        b=ITpmKjlXniQODHO4qxoKWH3W/2Cuq/adsy8FvXUYsQmqFK8nUGIAWML18pZI5U7aNM
         4t2O4u7rGHjqDT/nEwX43JXvA0MwX7mTFH/C6+Lvp3BcnZ0ZVnCDattCzmiwRNebuAtS
         vw0hTh7q8k++FW17kow//HPXH/aVStZQ6DtKqnfsOzZxaOIMFLv/688aEFqNMFUGNfH0
         c9WUeam7So865HpbP6gCkdsBjcw1ic/6XeLGayZ8F3QQ7SAUZ5WewElp0o8b7nK+3AyP
         YdBGjS/3B2sn2ap8U2MydfNRXmkupGZLeFLsGr9Lg2FJzwHlo03bvip7i8m7LverHDaz
         5FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785825812; x=1786430612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4hFWZPTgwOL+XjLNG+cDq4GULAAwRZpS1PblWfC2LU=;
        b=EbPZeZpXDlw5kGEFThJc6RSX3RKYElX87ngN9zd9edOn2bwXtVOPw2Ev0U1v1KhFNN
         hszRyGrVIM9zNRRj1XtGEZbX8VBDu58gTqKQ2/EhGG7sXpb23/BHZjCOISav5hhzIcyZ
         +YLF85eQD6mRZ3Rr5pVRcstfI/rxkXaRsUCU7mwZiii/phFmQhUTgesRopCi7C/0w3+v
         C85IRbxMfWK2ib4QcVFiYcyMnKsmkSFG0XvxwOgl+cdmAfDVcnSUACivTahKjtlJcosG
         Lv5mhwhn3BNYZLWGmsnRqtkspFURyZ+eHZOAtMxG3Ln5otDPRri86nD6QF2en/WteRCJ
         nxFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrp649yEoARgIoBSGeOmoKEVXNY7nl72SAark2Wq8uGpKADSWTQ+hRawsSCvxtFmO/+aYK+6GAn7yVo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk62fFcSA0y6tzHe1+V2ROmrvgYFUGu2oM3dZ+Bpiao6st0OaH
	kJPPvyjuNj+6/l2+hHPEeKaY5dsVZcDvo8Ckjt9feRtSn6Omp1VB1mJgzaAAE2e5YQXwuULAAmY
	l0/23FJ/mDAdmmeQ3I7c30+IbrAlgaXtvP4F64HvaEYTZxgo5uO0M5PynS++kcaCW
X-Gm-Gg: AR+sD11gsFwap9LyAsQ8GTb6NN6kZhTEsxCgBvr3uYEb9dgiHrI9sHn0bF5+1Zk8ast
	biO/zQa1rHkGi/lwFCeCtHMj+ndVmo4XYUaKefuIABIpzJ1ZNr9WP1lUcOperqXTBpttAdqUBqO
	fGB+uIljX7uvi4zXWwHKtB8vYJ2en+gmEmqCUIhdNxJUUdCZ77wFivgawnWhIb3YGX1Ts5ks12M
	cGta0biJqfTjdVYvIYAFFA9rYVMNEhIe3VNpN6X4Ayh8f/bnymD018ZzhCu/RVzoBZ/zMm+M4ZN
	uE0xfMgfEHaZVvRymOTY5Uphtd8aw8HaFvlf0cFecpnaJE9CzgMqDb4/+SyUXCyH5iW2Zx0r0xH
	XpUx8ngSydSDm68yMxggaR+mrORX1s83uTAS4wID3zmlL
X-Received: by 2002:a17:903:388b:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2d08abc8099mr22212065ad.26.1785825812099;
        Mon, 03 Aug 2026 23:43:32 -0700 (PDT)
X-Received: by 2002:a17:903:388b:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2d08abc8099mr22211805ad.26.1785825811627;
        Mon, 03 Aug 2026 23:43:31 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f9371asm1019725ad.13.2026.08.03.23.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 23:43:31 -0700 (PDT)
Message-ID: <c3c01f2e-9070-4603-a5b2-9b404ab2b94d@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 12:13:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: add compatible for
 IPQ9650 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260731-ipq9650_smmu_binding-v2-1-143a51c8ffce@oss.qualcomm.com>
 <20260803-therapeutic-coua-of-judgment-5c6cdf@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260803-therapeutic-coua-of-judgment-5c6cdf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a718a14 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=tA7aZXjiAAAA:8 a=JfrnYn6hAAAA:8 a=e03i7Ra0A83BTa4Xh-cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=kIIFJ0VLUOy1gFZzwZHL:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1MSBTYWx0ZWRfX7yf7lRkJVse+
 E3b1NCHch3qOhEeInt0EFRfA6faPoA58S/Oq8MmnmHmL0342ibg4zGwzYDslL+J1Ck5Q+J3a0Bv
 10McMO3N625i51tDWbwD+NCJ45ndxH8=
X-Proofpoint-GUID: W1nd5GZvN67nDbvVO0Dh8mR-Sp8yAV-D
X-Proofpoint-ORIG-GUID: W1nd5GZvN67nDbvVO0Dh8mR-Sp8yAV-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1MSBTYWx0ZWRfX3JciriwceREx
 yBoenveG5ZwxYNctrsb9WAK7xdJ092P88AVKFjuSHZ9ctl7SRqg3GTl4A6znDzkcnAoKzwUXEk1
 18BFHENTELBCfI9qYKQiPUkIsSXLsUpfJ1quDPfNaM/D3DDo0RuLjJ79YvFL84JmfKywkYEWNgM
 6YLbMxnzvfSiRJn7+jJq8iIc6b5xkk6jGLacnSecRgkXhIJMn73K3u8gYtqKJvr6hcZA8+cgNAU
 7iXDyYp0wH/7P3vYdzmhdgHtwt4INLs8nfSHt407XK0UfLsVfQhwhivNX42fpYGfQZf136CJHsT
 4+m0tddltjkByscaDAwdW2MeGQgKbm3vGIdCfBrwXsMegK1ixvDwMLYwQfLhIabmHBPkoU49Z/E
 dBFyYAIvvbwyYWx0jGRxCKNletg08nbwLYcoyHW8LneODJl5N3Rgia6I4EZuKKZrdSRE74fWFLL
 1npksEfM0Ahn9vBLvyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040051


On 8/3/2026 2:54 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 31, 2026 at 11:01:26AM +0530, Kathiravan Thirumoorthy wrote:
>> Add the compatible string for the APPS SMMU present on the Qualcomm
>> IPQ9650 SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Add the proper constraints - no clocks needed for IPQ9650
>> - Link to v1: https://patch.msgid.link/20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com
>>
>> To: Will Deacon <will@kernel.org>
>> To: Robin Murphy <robin.murphy@arm.com>
>> To: "Joerg Roedel (AMD)" <joro@8bytes.org>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: iommu@lists.linux.dev
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index f2188942f877..ffa33b7f4a96 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -38,6 +38,7 @@ properties:
>>                 - qcom,eliza-smmu-500
>>                 - qcom,glymur-smmu-500
>>                 - qcom,hawi-smmu-500
>> +              - qcom,ipq9650-smmu-500
>>                 - qcom,kaanapali-smmu-500
>>                 - qcom,maili-smmu-500
>>                 - qcom,milos-smmu-500
>> @@ -625,6 +626,7 @@ allOf:
>>                   - qcom,eliza-smmu-500
>>                   - qcom,glymur-smmu-500
>>                   - qcom,hawi-smmu-500
>> +                - qcom,ipq9650-smmu-500
> This will disallow clocks also for the Adreno one, so confirm that it
> also does not have clocks.

IPQ9650 doesn't have Adreno IP. Please let me know if I need to explicit 
about it in the commit message or this is fine?

>
> Best regards,
> Krzysztof
>
