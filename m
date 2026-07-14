Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFAA349CF2
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007860; cv=none; b=kP4tjWUGOKKgdev45fBTMnfHOEA60DuzREHHw73x5XdUy7ZSN5VBKur/kR/+RbhBSKz9DEIiVVNVix3N+/7QbH75gq7taLVb6A7vMFdeDslyoWVHM7ZhLUdrdxWWnI4UqVRtImbovmzBe4PsqTEaiMb5YxmgIT37ulnIsrghrV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007860; c=relaxed/simple;
	bh=IjRSdvKpxNHTgcY2XTiXrloy21QosMu+mMnSPepzBPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIMpMxBEMlCFk8+4DNSPxcfos/9YuNYzr4RetPZ8f7G4Z7XpQr54GLmEuuzuAAj6szbwzw73U7JhloVj5jokZO4Q7ekxFnwW6wu9+6Vs9GjmT6D1XfnGPFI7hkMM1Tgynmnw5Tam6dQjOyzdt7FFTGb/DlDBcxA3kNZvH12HNdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ioGx4hvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXcIlBTf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ioGx4hvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXcIlBTf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38sYV3304328
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuDO+eNFRlMdfIF0TORhgX34sio0UiStdpTpC0W/twk=; b=ioGx4hvNncdMvSi7
	3BpVUZVRxDmhvwliggnB32j975h/OnSD+D09qjmZVJK1148sEmW05hFiN0WugE/Y
	cuFICPSj3Y4MZTdPLSOWXO1FuVUE+XZV6H4hjzjUHZNdBHjhWGYXfAmrt2VmB2ab
	raKj2mvQ5IrTTokJOx6apLpgh1rpzqqbyI3ej/rUbvUpH/cs/Y+ob1b6w5GK+yY4
	3SKJ9esCaHwTTxFa6sI+vWQOkqhZZUesDu8hw3WpuR8NXxYwNFLSdCYReB0+BKiB
	VE1ktKhLmP+ytncuXvutoKNs+ULH3ZU9IWOwmuRp+lEdFsfRtUkaGljOSY2OvGiJ
	OS5Pdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p241c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:44:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce870a060so75237105ad.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784007857; x=1784612657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuDO+eNFRlMdfIF0TORhgX34sio0UiStdpTpC0W/twk=;
        b=HXcIlBTfNTbl0AJw7KyeECvg8HqnY58yPRFqv831uFl6edHMyVtgwo181YlonmvWWU
         Qt9ZdS/bLAE4w5q6rTJhS5HVnbmjP6BjsmZIbq2nGfmJRI4I/HaDBvCCGiJdnKHd/L3V
         NS2oJpK0QxB5phHOw1e69Ghl8NH8JGodZ/AG+gKQlJllcqHFe8olbUzuqNyDNtmWOmMC
         vLqMjgl4om5+U1240EEH+SqLaV+4zxEB1eYDGmTOXrf2dugTB9lRLqPqLlMHp3Ao0o+a
         bezOnUJoMRa8srwe55xfvkAnlVcgT0pc0sJwVO4vufAiSb7I0FIntlGtU4zsS8+jWyy0
         o5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007857; x=1784612657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuDO+eNFRlMdfIF0TORhgX34sio0UiStdpTpC0W/twk=;
        b=I0FyRwPGIwyrj17/AfVuYubs1DAiXz3LmGFw6bAqXXAyTxNhO//I0XEtl9Pwr9dJ6G
         KyFGWIovioQ7EHxsTAIH9vN4WWH05zsLbB+7PKb9iE1cNwyzGJeHqSkioxokTjuuT9on
         GLH8h7jPOKH1EjAXv5tOiAfO+aZN484cGg72MdQacqGey3IE0P7xq/d0BDrnJ5cmAx+L
         C62aku9CNDPmNRG+XRiIcYS+CXrCWFwK3IWltVFSVS7n7/eqrW7mYrCEws+h83Nfpi16
         h8S6T7Mw8dYC/MjZ06tjzM6GPDy2lZzoQKC95gbLZGA+701CvXGJzB+FaSp/+2YNkARU
         pNBw==
X-Forwarded-Encrypted: i=1; AHgh+RrPMOoeVzz9gb9nIRacPj67/AnWXB4XvQbdmjvtNGTm1bJzKR133JjZn7Os+7e9LxNb6mply93MztgM@vger.kernel.org
X-Gm-Message-State: AOJu0YwEN3OfQUTOj0ITZGP+JyON+WrATGlb5tqNeUTB0V2wc+Ss1PLo
	B0ecOzf6YTeb9uG3OwnM3HZWM7U4VC8f0cZWTTalD8u5kBnAqCT7VXuHIdOVGJo7PhOUi/DzK8r
	xz9KiSWnYNt8pqEIkL7YnKwlcEI6h6CII0Wdq+tCr8XTcW5UFa+kgwD6ewRoSxR5H
X-Gm-Gg: AfdE7cnOPAY+O5UA+VoukTkvoR3dfGa9EVUQr2bwJBj/ZKS+yHvwvfBw4fDAVfD9Rsg
	HmBwMyzjs6W2xKEOlTbmemB15Wd6CNvefr2eUUyioZ+TZe3x3ax02xdJHlvIec/QyumqADDY4qu
	AGcn4omOGE+bZWy0G1+VFrZ2XAsw31KGz0AA1DK/OhXAKQrkClB/LSix+paYmN6PEJPtIve8Nhq
	cNQjCiBnmCABSUfiUAFKtUbhQaK5DF3nDU3GA4glC1OGyxIa+tkLMhIdMcqC50SQ7Kq4dP2ikq6
	unmUvBD8Wqz7MSbi2BYWe92Hn3Q9skRPUVpRLi7CGsKXLZzSeTOnw1R4XPKia2xP4xyWXOgLJfp
	ButwgDRUBZPkeGJO/ZnLaZhvX94yaKhC9LDUMqcimCqDS8ziS7WSugNIm4KY0jULvLm1Zl6hQKP
	04vCn4
X-Received: by 2002:a17:903:380f:b0:2c9:c18f:7446 with SMTP id d9443c01a7336-2cef143b0aemr11672655ad.27.1784007857047;
        Mon, 13 Jul 2026 22:44:17 -0700 (PDT)
X-Received: by 2002:a17:903:380f:b0:2c9:c18f:7446 with SMTP id d9443c01a7336-2cef143b0aemr11672275ad.27.1784007856591;
        Mon, 13 Jul 2026 22:44:16 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb6e2sm111538675ad.3.2026.07.13.22.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 22:44:16 -0700 (PDT)
Message-ID: <aef05058-848a-45a8-a082-a484f167e872@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 13:44:12 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-maili-smmu-v3-1-b48de6f5ae4a@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260703-maili-smmu-v3-1-b48de6f5ae4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1NyBTYWx0ZWRfX7LKzl/7HPSww
 m+lDQWDobg7wVB8yhpH1OqCz32deIUe8aumfsLgb7bxRUeHSijoUfi5a39oU7EivyRpwm0SFjnz
 4e2zWXeCI/ECd8N0S08KMTEL9COdmps=
X-Proofpoint-GUID: RTYBwccQx6VyX-qo2YbxWbchUf4c1-Sa
X-Proofpoint-ORIG-GUID: RTYBwccQx6VyX-qo2YbxWbchUf4c1-Sa
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55ccb1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GanE8jRN9TD_0qqWZfcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1NyBTYWx0ZWRfX3KVzLHbCiuDI
 70d2IwhsCY96K6Kq9ct8rt6excMi/ois4VXKitxjpaut6oMsL7PFFZtfXuQk8NVQy6sWBqRhbqK
 MqBrrPi8iv6Rc+0LIohR3jtGK+RPbchD42730pE+WB5YAeDR5fKU5sJYB9lHVIOp8xB02A28Pbk
 pTeNYkSb13nmG2sm3XRNvARA6dvAi94qiN5rAVrU4RojtTXXQHETeAWZxtsurwVlBhmAyW/KfGs
 d9CzXJAkGILuC12E4sg2p3Qj2rkcOjN7fcHE0sbGGdXJ+L1G0EMWytjaNE/n7woJ8/3f6s8owdj
 +MBYDtLM6keGZ3Nr4QiSrbWOq2iIqvAHIW/5b43+5DB6FH8nDG08sZ0Rq+mhOqIeWuBJ5GWIr7c
 uRqGBybGnrpLcZv9nzacV35QpG9eRgtpubX+CSGn9kKgklRU6tkPLqxYL4qkhKEDqIbiJOTRSou
 aUinjoKLAUBfj6TDnZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140057

gentle remind to pick the patch.

Thanks,
Jingyi

On 7/3/2026 3:50 PM, Jingyi Wang wrote:
> Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
> which is used to translate device-visible virtual addresses to
> physical addresses. Add compatible for it.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v3:
> - add smmu binding to the block that disallows clocks
> - Link to v2: https://lore.kernel.org/r/20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com
> 
> Changes in v2:
> - patch rebase
> - Link to v1: https://lore.kernel.org/r/20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index a701dec2fa0a..fd095161f6be 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,glymur-smmu-500
>                 - qcom,hawi-smmu-500
>                 - qcom,kaanapali-smmu-500
> +              - qcom,maili-smmu-500
>                 - qcom,milos-smmu-500
>                 - qcom,nord-smmu-500
>                 - qcom,qcm2290-smmu-500
> @@ -621,6 +622,7 @@ allOf:
>                   - qcom,glymur-smmu-500
>                   - qcom,hawi-smmu-500
>                   - qcom,kaanapali-smmu-500
> +                - qcom,maili-smmu-500
>                   - qcom,milos-smmu-500
>                   - qcom,nord-smmu-500
>                   - qcom,qcs615-smmu-500
> 
> ---
> base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
> change-id: 20260628-maili-smmu-9ed0f2c189ad
> 
> Best regards,

