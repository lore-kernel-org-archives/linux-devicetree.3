Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AD4372B2F
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782351673; cv=none; b=DnqZENx9YxnpfVAgWb7nyr4em1HjdBLS5MBJAyoZJrxfZ/WTNrn+YCl3OdNBrvPlTRCGEVSLDgN8qVFMjC6nYY/eTl7N6ya1p7mUHa0hFd+gW0mR4qcGSQw9tn/AuIWwgSr0fEpXbnA/Sm7qxNe2viYLyH9efOrSLyPaMHAwl5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782351673; c=relaxed/simple;
	bh=lEH/0FVTYKey35oWiIRJMOOR4UYB4BRjSlE4Qwc0ta8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGJk4q39t13GUeoV9dFs6pagvM8wL4ldpjzUMCKCS9wXIbd81gRW3vCncGg8QvsC+3EyxBO4zOz30/JVRtdb8k64ifoE3CZauxrmELVbsFJqaCt0Uo7EEHuVMmojvqZo+TFZtLU48esm3L7UKTyazp2qBCTr2Gnbvp5Adfr3aVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maaJc0gp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs3XCP+B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maaJc0gp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs3XCP+B"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLqcmN366646
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l2IoxnuDNAwtIVygEfamkJMcz5ltQTuXoulZAxcflDI=; b=maaJc0gpDeT/uRtu
	1ZbDSakquHwFQPTLlZTrriiTb0oELBSIJb15sNhTZIAI0UhN+NG5s3LnGIa4UNWp
	eEJVb+atgNPeY4GOpdQEMrJCvNhGL29DoRUxudF+MEscCdfPYZknc0DTySttkR3r
	1IqUqQz1rY4fsgNh1JtEuxDQOTBWjt2CFmJvLdVMzQuAyT9187/RyIWb2Aeg8oJu
	ziBEhiofkgdhzvd7ZLAfS1agCQo2GcwOU7Bz2Y/czSYB/74WB1SmwvousdJw8xOk
	fStwj1Tn2dr8aHDZetfq9Eqcm8gyTvDt1luXERGlA6FinG/8RVD4idRzLimZKIXg
	AvwY6Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar4xwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:41:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2c98c1be2so9673695ad.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 18:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782351670; x=1782956470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l2IoxnuDNAwtIVygEfamkJMcz5ltQTuXoulZAxcflDI=;
        b=hs3XCP+BTqwFx11Pnkq7XaZLLF+XDegoPOLJY7BpNsleOrZbDgxWrEVZT+AUiFpMWM
         LA6pDDGva2ofkMeSE9SUSogpyAbdxYfiRnpLIuXWlpabz5wkHWxWrPlQ8ODGBeyq98zh
         x/a6OvbJ/ojTQY9gP+MxDnOSuUKfwQuOE2LUkiMuN9FZdU/Af8+hoih/p16rR7PYhrma
         DdvImyhga9i069L/NUnkO5BLWuh1hdIAZN99cTSMiCztTgCP/tNLD43wXwDrE+T1UIZV
         XiyFW2DRgQ8jX8E9mZmlCsf2P06W5kDtaoCzZ3N07ohzTDquPp0+HuMxiZwoy3cxvtVx
         jWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782351670; x=1782956470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2IoxnuDNAwtIVygEfamkJMcz5ltQTuXoulZAxcflDI=;
        b=tPaptw8P/4/K930VXwIYnlCxCvbzhaHB2yigYpQxtUaG+SZtxpx27nI6B0KOEP7Izd
         8x5xXMFf3pTSU9I/CfRdCfS4zUYu1bIa7qeGNoVXc1H+FAaTAfLlSo5IBIW1AsfsBT+H
         LYNel2PsTN7O+C9gjZyMwVmm2ttAeYmds/OplTblBjcYPRjTU5BQUYMMzRebyuPcPQ/r
         Sklt0pTzY8CeA4rUY+8A36ufWQv4QTWOFnqS0JMnKFiRQB0DuZ+1Fv7+W6IMP7qHP9mR
         Y0TZdL+SHUalN5DyZAqxvsfmM+katIL9p5c/HjaX1baxjMz3QIvje0oc1I3qmMDcd9Uj
         utzg==
X-Forwarded-Encrypted: i=1; AHgh+Rry5/QWOQcG28YqWCHIgaa+ShamktwxKJ64Ym3xRnnif76ji4AhLURYmPVk2ON23EF/fwxEH9dv/B4R@vger.kernel.org
X-Gm-Message-State: AOJu0YzTG0RWhDYfV89ufHq9u5oNyEB22kCMCGm5XTpGyk6qaHJ8c8BT
	sS/v6OezWr1WiwJpIMfiAOdNazB/73e0yuIzSMHyv+GdRuBQ0rB8B9uqYzVR+JUmVymLK76OPhz
	14Kr6AWb2/s68uTeqa88QlRdkBHg7wdNkrzxBqPXWnLnFZvy6+efccOQuyvy8pwap
X-Gm-Gg: AfdE7clOV3pjJiq7M48HjZrmBVJHHFYhTRzx6w+WImve/lJc7idp/e7TEuGmo2D3fPI
	sLvgHH+Eokv23Chkp/j5jQXBiFPzBMLMhxjqesl+zW+sknc8PYR4X4ypOdz93R9mpg2cdAlh/NA
	RyEr3qKI27wTwZcIeIoJvpe9Y5UmDN1a23eqEdcFktIyd4+W++74vYc5Kmf4p51kD+X1poaaNpF
	07Mg5O2B51PL9DcekAZ+cb4ZHzeGhbQN1MiBfztNm7QdSqU9qpB8tdcaJ6DIXvr9Y9HOEFrbY0G
	5TFJYJv7YRxPz8CRPl5x9I5F7iXgyuHWsGx7YV6abnLcaCx6gr8LEdHuuEpHrlITS/CKRZ58YCw
	ORit+cAA6gpRgG4etLt3H13iyNkOOVKHP32QF
X-Received: by 2002:a17:902:ef03:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c7fc88e6d8mr5510115ad.9.1782351669901;
        Wed, 24 Jun 2026 18:41:09 -0700 (PDT)
X-Received: by 2002:a17:902:ef03:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c7fc88e6d8mr5509835ad.9.1782351669439;
        Wed, 24 Jun 2026 18:41:09 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ae7a7csm8373935ad.22.2026.06.24.18.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 18:41:08 -0700 (PDT)
Message-ID: <36043887-6bbd-4b2d-941c-bf222786b80d@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:41:02 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] input: misc: Add an initial driver for haptics inside
 Qcom PMIH010x PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260617-spry-greedy-chital-1276e0@quoll>
 <be2b54a5-ce9d-49a2-80e1-60da874350d9@oss.qualcomm.com>
 <4ba2eeed-71f8-4799-b261-e4e2c268043e@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <4ba2eeed-71f8-4799-b261-e4e2c268043e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uEaw2paESL1jYPu9AEfGk-OUg1w0L-cP
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3c8736 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=miLeENm1gDbChLBegJYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAxMiBTYWx0ZWRfXyZ40uXv2pREd
 CWLYMCGy/bQ42miXFFLRp9BgZqv6rD0DStkF3JyNU2hoEsdF0kxvg78VwSCq3dhCUYDfUECDaAw
 23m5TrilPG5a1mzzwv2WntFB7fKDhuM=
X-Proofpoint-GUID: uEaw2paESL1jYPu9AEfGk-OUg1w0L-cP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAxMiBTYWx0ZWRfXygV/767l7Z3i
 PZjqTizNJyNF/f5hk2OLu0shAas+CW2FW147op/eZaU966KE/OVLXn1wBrodIkaZ6EhgjoZbXTz
 c1jynn50m4h3T0rQSeCXEyVrqTtu1cCSu8hPAkK0NIESxECEWUo5n5KbxxCcTJ+gyGzRuaGvNVJ
 hxJL/Dqbym3gJ41/eyIcFVFt6oEXEwy/GcFLvsXEwkNQKp7/i3mb8u1eUqpm22yFIcM258y4v9V
 lSgTUbj4jsth5jYU2ZD4LS1ncb9xpHH2/y8jhKH4eh8Zu/PM1Ni/n1i90qrb2rPH5AKorugHGOE
 vZT1UyT4ttzmdPQsotY24UsFWlLVbQg1I5m9FQKvof3t7Upx73sI04H5Yi/YVKyy883Rsqp96gR
 gofTeeS1YX7/2FLE4Wvj2t8NHeL6nbTvElhYUXH9LXZDkAcWhXXlsmzoLBmISj32an3f4CXG4P4
 /x9oq+yP2xVfZGAtRHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250012


On 6/24/2026 6:05 PM, Krzysztof Kozlowski wrote:
> No. Act as maintainer. Clone Linus tree, apply the patch and see if
> everything works. My claim is that nothing works and maintainer tree is
> broken.
>
> Best regards,
> Krzysztof

Thanks for the explanation. I just did that and I didn't see conflict 
when applying the binding and driver changes, but I did see a conflict 
when applying the DTS change. I will drop the DTS change 1st and resend 
them after the driver and binding changes get accepted.


