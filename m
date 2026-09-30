Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8EC485509
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764416; cv=none; b=iW+E2SZ7sp4vIBIlG7TXsu+75Z52WY/FVJPT7X4lz+Vw2LmER0I8z1K1Ds5e8kSStq37NNKJDH3RZc9ZoTg4V18/yxdLp4kPCMvhgyDq9nrP1sPDy7K7rzDimN3gu7xeeX+EBOkyzIEDYfAtY08h6XRaPg2hSJB4d3TdyHYkfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764416; c=relaxed/simple;
	bh=0M0tFS47N7lhZMQSOrqoFXZxMcxobRdsn1g4U2BMiNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZUD7DYooYOb6KSpFMla57v5WgQEFAT3+EUfrVGV99M2K40RB8sTfeGUotLOyTJOIvePtm05l/BUqokqCfmO3fNyWr7ZBXMCIwc+/Km4UMamfCdopbF4mqcE7nAzNEXOfx6x/g7RBXvWE0HixNRfeQECRVtBlglTlWdgUmbhx5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8udcbDJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHlKVcUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8udcbDJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHlKVcUo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dR5E1556141
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2GcS8YJdyPJLvcVPFTZGMq8aLk5heCCS7anZ9DvINg=; b=V8udcbDJH1dR1GmE
	KPLYTwcnqL+aJzbNNSzAcft/PbbAehAai8PuiNN1CMt6pSMEJofITZEiao6jY6t7
	353MfrvlZmqA7vmUm/zuP2qvuRTDegn/nvrYQSM7vhR/CNU+hgY7uFYGwVWL5mBt
	Y8X6I/fVweeICo94DElyFi1JQL9ddCTQ+mtkkq9PfcIZbVWpv9tsa7aRChuMQq4X
	Cv+2tO0luaVqWaxJO84Yl5/rlEBXW8/elP8ajAQpnokEyDRtQftVMTK7jNPlahFm
	g92cJsuMCYPZM2Oc8+aFIWojko9pJ6cmuhTXWuSwQ6xaDYNfnaSMvbGFwjBM78sa
	vZGDvg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c0sxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939fc317691so100830785a.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764412; x=1791369212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2GcS8YJdyPJLvcVPFTZGMq8aLk5heCCS7anZ9DvINg=;
        b=fHlKVcUop7R8oo1/BFtXs5vDN03Ry8hKjcdlwucmEfo1qC3C1PS0bawx9fuzDXtab1
         VaF/S7TYafI8sNvgnU+wh0T78Pf1G70LPB/bh64AnzcerxFe1y4lfYp/aWzsFioKSVmC
         90KLRacCpWuGh060dD7lIwO+bA3iX1RPO7rvXrzmmjevzFpY4Wg7RAcSb+3SMlp7uOvV
         I+Xlkr6DQeb1bxpWGaAcnrDsC/SVBTg9iL+WmJzEWjjLO9v89C/smKlSsiFkK3fR1MK9
         4oimzya9HYFP0bQsD63iefnYpeUo8W9vk2ph4sMlvnLh54jctn3ha3KCVsHpIgoWiBcD
         sReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764412; x=1791369212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2GcS8YJdyPJLvcVPFTZGMq8aLk5heCCS7anZ9DvINg=;
        b=fp/o8YyajkqDw770vj+RO/JhFe9Inm2ibLcp/wps4OzclJr+vAO+MX5hp8PPHlglE6
         0b618VDgwS0N3oKBHvkuJFeXXGkV0ahYgMIsOma8Tkefaart1ckATrzpeUSTawJbbxOV
         hljlwDnD9Z3orNlyZHMGQ2l8thiCEvjhv8N/DNNUFrRi93qmH2a9v+YFn3Ftah3FiXDy
         rZ0E1p3fjgj6ZVDgzrt4D22hcXfoZSCWO2dyte0DNXljswVY18j0BoENEJClmT+2did8
         w+EfRX+a7bql+NNaHNsr4Jg+lubt0/RNKWBRJIxNI0cKdgLyCkclO7XR45Mj3r/ODtQ+
         DfZw==
X-Forwarded-Encrypted: i=1; AKwUvBxoMFWvuOxid1UnAImpyso8Bxfg+SQKEZRyKq8NowgOg/ttKO7RxHfn6AnG6b725jQ249UlHEvspEWo@vger.kernel.org
X-Gm-Message-State: AFuF++miCXjri8T1T1ubI3aVZsZZ7Wit83LGLPeEDm73TEkjQTdKk/2z
	TInMMR3DYArz+DyFpN0vBKiIoGACba7PNdy7jj6EQdS6q4JQX3lyhPPGIU/Gi/CHk76C65OMNib
	hWMUFkbROSoAOc87oAVW0fU0bFPA3ReyJt2uoAK6Cw7CR+SEKSpR0/V//NkcEttXZ
X-Gm-Gg: AYBFou02mjMJI9DCbYCbWLMdiqUl760rhqB1cqbh0UOAZm0F51jQYnoWrH/o0CWg/6U
	Q88WF3v4zTxTCM/qnwMR8iLu+614C5HdV4Yp45ZvrNYVu3U08r4xc7+x65lWxRlkR+GfVxgvH0o
	pOon6G6GV4nU4AGXXvyq7EQU56/G7gJKGbysIds+6t8UPLqU+xDN+tqTFM7iJ0Iupm6k2BkVHoY
	4gx2wl8OjM2Pqa3aJ3q76SC8krtg5K3L0K/lsU3N/eN5OYzyr74vKyLDiFj9OYg3hVlQfSP8BdE
	yhUcI05ivcMyZqDC59Pk5IcqXEWZqF5XI+wOH5FiQX+CbooLv9OcA13xvLRU4PgCr6byegVSPnj
	vKHS2Z9GIqJZQteOdkekS6A==
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr132045585a.0.1790764412208;
        Wed, 30 Sep 2026 03:33:32 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr132038785a.0.1790764411558;
        Wed, 30 Sep 2026 03:33:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm671766a12.1.2026.09.30.03.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:33:30 -0700 (PDT)
Message-ID: <687c93e7-4ac4-4a97-b139-c1bd257670ca@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-12-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-12-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX6w7tJSlMu5tI
 pDcfrANriFnd/A86k8FDfTqQlwm9urkCy7AF6DCwxTDKgmlId4sQXew8oQPGsrTbXiz/ye9f3kv
 jRa9WHKs0MhiJbVRGuG9CjsHN11zmnM=
X-Proofpoint-ORIG-GUID: NhILqKJ9Uzgn-ZwdjhgKF_zf8o3XUg9C
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abce57d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NhILqKJ9Uzgn-ZwdjhgKF_zf8o3XUg9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX16aG+N111Os2
 sbhISCPNdj0d5abFAayyA0JLfbzSe+iQlEgLLRo4dBP4+mqKQl2E9NRuPf7eB8SfePXveex7jcv
 KcFoqp4X0ujQqk4e2gzV4NZObAED8f6QmgQQcp0Z1tZI8HHO1LWlLtw4Hd3k7wmyqIPKRqTmPpz
 YAykR8QFj+Ve0I4NPJq5kx4LUEFeJBU4zVt5ts0YAzQ+tjmx5IU+iqF3L/+ISvf9lI6yGy7fgZL
 LtIHsj4l4P24sJebMTGLxS7VjilbmCf7jTYVQbeOm0EuXuioONJkuG88n50kEIfuAasRWFD0S8w
 2fCYGnk+xb0/SRxV68zZ8NRetz6HYiu/hgNb/Lib6Xa39qiG8cll353dgQfCiXXPlmBfwYulmaL
 pRumSG9jYG2nIbEqDwtOmHamhwryCYyG+/BVi79V4DKkEjOhe8qxJ5W428J0rZ6b/AuBT8ScasY
 MWeIl8gfVRyFVDdmENw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
