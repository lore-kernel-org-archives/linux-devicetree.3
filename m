Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD7F3BBA04
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914936; cv=none; b=UZ+myJvRzi/l7nLHOclxTGZh9t7GG2igd5a66zAZj5GQVSP5wqOTjrEbVYl+8lIrulmwCb9kBhFEvW06jbr0zh0P4kRzzjTRL0LmpKL5kVwytayaaFc+bOusN7ZUDOEwO2e2MBLpXYq6iJRRwgvJkiNysvGru2bDf/3bDmL/zD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914936; c=relaxed/simple;
	bh=FVM24WBqaMagISzpUGWgdhivHwLozYlEFzZscEEqlXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSICBbV1HkcbadkhIVYrLibMnkwpVAtfb8lLQvh/Mp944jDFY+J3+DVveIR+G9vBeLlI4lA2HR3zwNPiPaOBay5WULXBDMHqInyiI8hKV5FKdXu6k3XP1BjtjomqXhzjsfVKr1/UXPbOwWuDp9kf34qrxz5GEhQyp6VK8tSI55c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REvkcG7N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4gR9VzW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="REvkcG7N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4gR9VzW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658A6q1S3275194
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 10:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5JbEetsrM6ridwfrxye3mnM+0f/IzAN2T4I5PfdGCd8=; b=REvkcG7NvDiL94Kl
	bRqk6Oo/yEMlgz59r+gV3Ue3vYVah8ErnV/C6ckxOc8EnHkDCnPbgf621WXpZUlu
	zARNJlus6YhZ/ddBXiy/6Kks5UyOxf8nY1TaMQh+Sg2qtFxcAkBQr4uk0FO+lkdj
	aQhwMLHhbc/M3H6iCdnd4wVFcQ8LWWtt6Ge+MSDFZzeQ6wG4r4rqN6IFFVGWP9kS
	A+1tV0469nLgjFYcqEZCQqK2b4qd+wfdco6hS1XTtG/NInnooRDS3O3zruWcfIVM
	a0gPkiaNEUBbyi9qNhtdCksXX/9WvMBPfIdpjKyRbq66WbV31lBu5D//sEu685ZW
	nLsPGQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptg444-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:35:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso58920895ad.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914933; x=1781519733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JbEetsrM6ridwfrxye3mnM+0f/IzAN2T4I5PfdGCd8=;
        b=h4gR9VzW4WMNfGQVCRKOQotu+pnoq9AcXozkTriLqhE50F39wUQlG5qyuFsV77ZUVm
         iXA4FpPkY7Ch9g+TpkgOKG/7NdvJrFmkSwqgQBrjiH1sKBBCuvcD3h0ftQ4PHmCbyglE
         m8rsGUL9e1xGO00k8Hj+N5asHNmupGemCNLjvr+VtyeZKAdDX97vvsffZ9anh8el6IFU
         AXvzvCXFXfVO8rH68hE4vD+PHpFSpTwJzGVrfyqxYxDmU587Cg2nOOZT4MchTN47HP5B
         2DZ+YYaarggcut7HO5Tlb9tvdUMROD7iZw8cKBjgaZqb/FD6N/fElueqZrrmEhHe7Z0U
         E9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914933; x=1781519733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JbEetsrM6ridwfrxye3mnM+0f/IzAN2T4I5PfdGCd8=;
        b=g34+3OQ0b8EgA5nKwfqQLv7P30zztSkGW06VpA+JIa50U8/lly+Og9ZBh90A/F7NOH
         SJKIwbp3CRQK1vXS95V2CekvENLJJ3cecrBUUUw1zzjKVJ6y40/hrCzcDHPUXlZ2D+Az
         UhNPBWV3wjhYdEUMOcZVM/oHqIgjcOhGwGR0tv2loBbY1IVGHl7DRj9XmciKp+wau/le
         hBmgftSPjxavEPZcWFNHRSjOW/XxK3/1t4wRAjH5ZiN46ZLKSKpv2KoLydCCZu2g5AiK
         Y8V4r29gfQqtj/qBwIuFnbOxIWcrmz367piDhCd3hrzjwWDLybnYc9RQck459VezhGJo
         AO1w==
X-Forwarded-Encrypted: i=1; AFNElJ/XWCtLAwqAZRGVMPKvBur/ZUv63Snqu/jbw4/IWpqq1+xCNmSUf3sm8EFIfMmRiwblNuwkXEoSuLJO@vger.kernel.org
X-Gm-Message-State: AOJu0YwgGqG07UbOxqiWfeDgkvFHCh4KP1bkiRkp8WPE49lP8E6QrEwS
	dzsRcIU8UchRdMtfIwDIg1YY5ykSTOVNxzgCi8mn2xl2R6Q2u8jny4qqqGCPvhhcs6C4M0J2YI+
	B81gSVM4Wq3fAcuvk+U8BbiFvkeym5hOurRbjccZWljvKo0mGn7uQDsFVJ+PSN71N
X-Gm-Gg: Acq92OG4p4tWhqWIwCy/LXa2OGeVY6snPxkIDqv0gmm1fDiabMMbft1Wr5idupggniL
	+/mGmWT+h5xTcU6nl1OjutTkOrlCiya6Qc6NYeZOVm6wfit/2mkcLrSRagHoi7ckomrvI11mNf7
	MEQkY6UPM/hPVxY6DOSlaDJ/jCS2bm+IqMdjkvmHYaNOgdSKzE/cPwi0VeTfecGyEXbXBeG00Cr
	3Uio21NhpclpaqbfzfwNNN3KTQpwMK7VMm9DxAAqIU1DbTdd9+2nBM1gCpQgGB6Mt1GtNOaNvu4
	WGotB1tbsr3g0hBVqyFqGCnwbUkumKVDzedvAlvxkSMKzbewLllg0ybUhUah6BzQuRwRqwZeS4P
	GMr1pfMkipGCk6S/qucCJCY8htJiuaWXloBqAsG+opiClse6+jivk73ITHjoYL1M=
X-Received: by 2002:a17:903:15c7:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2c1e78acf24mr169901125ad.0.1780914933145;
        Mon, 08 Jun 2026 03:35:33 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2c1e78acf24mr169900775ad.0.1780914932684;
        Mon, 08 Jun 2026 03:35:32 -0700 (PDT)
Received: from [10.217.222.59] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166396fa9sm177600475ad.66.2026.06.08.03.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:35:31 -0700 (PDT)
Message-ID: <fc0e48fc-0cbd-4f70-840e-674b29260a1c@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 16:05:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add support for qcrypto on shikra
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dwRXZ4KZZHNPakZJONPsi_4zg8nJ8Ub0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfX/BvMDGyy40P3
 snEajJSj9MKuJxfV1LEQFFNiO+sGUxKFUvj9CCiE+CuuqkfhsnffBmgKPJcRosFSJDIVi9s66wZ
 XbgPnKJHJQ2ua6/e9xQzZwpz4EoN8rFinszImzsG25zJFjTntTblun2VjLm+L0qJMQf1l8r5EyC
 RoUjY4R28ICP4u+xZT21id0MFcaUtEAqyEXaIJoMxNZ04rh3vmzHvrKb6SfcfQD0xu/P7kQAHH4
 ef0ayyjNwqPMiLa5Gpxmdn2vIygvXxCX86as+kmydWsspfRvCKCnDxXB4cSv3o6BObIN510txKi
 MHNM/4jV3RyqqlZNtHC4Ysrz6lPER5ZGwuUd9Sre5e+MtCcWaS84ZVTvsOt5G9RKl4r8vwuUY/7
 bl0i6eU5VHWEbXCevzyE00Q2zUUgtPOK3fHbarndFARp0siaz9eNo6hVExEB1GxWPqflx1butlm
 9vOmkSmRvCU51cPr6zw==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a269af6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B3AD-90MoOjFDUla1LkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: dwRXZ4KZZHNPakZJONPsi_4zg8nJ8Ub0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080099

On 15-05-2026 00:53, Kuldeep Singh wrote:
> Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
> Shikra bam dma supports 7 iommus so update dt-bindings accordingly.
> 
> The patchset depends on below. There's recursive dependency so referred
> to base DT patch here.
> - https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
> 
> Validations:
> - make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
> - make ARCH=arm64 qcom/shikra-cqs-evk.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> - cryptobam and crypto driver probe
> - kcapi test
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Kind reminder, rng/ice/qcrypto patchsets are sent together sometime back
in single series and please follow here[1] for discussions.

Please consider this series as inactive from merger point of view.
Can still use for already engaged discussion.

[1]
https://lore.kernel.org/all/20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com/

-- 
Regards
Kuldeep

