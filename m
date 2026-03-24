Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1E3E1215
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348809; cv=none; b=PV+NsNn3JI4Ii112Iz6gYXNWTXOg/yUxlBqM3jKfTR3jjAsUAySlUMyCGFylLZGD9lN3CaUNZAOnxkMWhMgCeMPvulkSOZDqZj1rHxuC0kzrvNMDny8K9Ser9+at0Lrwf2/OTYy/KNik+1XjcHE3ODR7oXmNBYvQNyJTKZhIAxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348809; c=relaxed/simple;
	bh=V/t8VE4RIxnv3KlXn6VFkpWMfjuQh3mARrMePng2vJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyhIdRk6chdsGoxZniSPxy+FZHVdptLqfPfxWIOY5Yq6gAGBhymL20pXql4b1799GitadNhNnW9sSTxkeAj+aSTkLww8mYsOCG1CbWl/TqqwtyZozKAMqg5AMnS4y+UrVxwjs7MCuZNV/BnVzIt/ND42+3l3NuGZuf2ePueSWm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXlmTcJi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBxLC+Ki; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXlmTcJi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBxLC+Ki"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9kK4G3634280
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xiLrR32Mkhp9iJsUryaa7C2F1tBnG5NgCMdH592hc+Q=; b=KXlmTcJiWso+drhi
	8Po7MCVRt+eNjoXF9ZRYUBmnzme4Q3Qx/Qmkiabldy/4qPJASm0QEHqlOVZw2Ztp
	zTZuesinNAI3sVHrc0U89UtsDuXwttKnxBGSroZiSRErZdhpU/4pRPgXs3+ElC0l
	shYwHNj9QYqzpVK6DTp/ji1dNzG88oLH2s9Kl7LAS2KAo1yK1O1eQkyDDj9iyzbB
	YCEqRXDxkwoarJ0ksavzkqBrVv+x+rPQqB1Nf0cKp/2b+YdzvFIJ9zKIqs6Jck+v
	pEnrNDf87ri/0qppL4ZbIwDnYkbUBeXw+bwiYmF1225s3Pcv1r8eFVh9MJEmzkEo
	9v12Sw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4mmev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:40:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so50970445ad.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348805; x=1774953605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xiLrR32Mkhp9iJsUryaa7C2F1tBnG5NgCMdH592hc+Q=;
        b=NBxLC+KiBgWvo62gpl3FAM50F0JegNDxerA9j9OOZ1uTV2M+Ww2sY0TGOR20y8UTEB
         ZsaTzi6azmA0PA7uXQQD9HeNXFApaRaI8b8RHk1O+HdFhxpFsLQRJpwktAAVcuQIrCBo
         dw+iC4xhv/w4vDs0CAN894C97/MVBHcpmMotS4RK+7W34aAmpO2ZxIxbHv3jYRH1soT+
         2Cp/+lZyg/VZX3ZuvdSJKn+WjCYFuZ69DT7buo9PA2ssSYEtVAE1zyr0czT/tDh/OZFa
         8h8OC7No2sJ/D1oUZv+q4LEd9kiTOnnULDjrkAU/+ziber4Uj+QCxNunPKelAstoU6TA
         A8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348805; x=1774953605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiLrR32Mkhp9iJsUryaa7C2F1tBnG5NgCMdH592hc+Q=;
        b=Kc9PXFCmtsM/WVFIW48r5Tl3NhuT5IjSNPJZgZXiA9QWieq3hwIx10KmTy/i0caPDw
         5Toj/Dbj3kgXVX4eNLEBuZEgPhJBsgPRVV6caB+LHH+cP4IlRkwUPizwYKg1IO7ag9FC
         SZ/2AneJRpUbsrQ8F0tslWlegV/cq1IrAG52AxYSa8UhYiHSe0XfHO5M7SSOLh4scLLZ
         OTYSaw4sUiu2wkSzvVw/XNB49aF/kh1H/Ee07fBXNBE6VgpmVE1kZhNzbUolS6fch359
         c4AJSnZvvyUbIRBUHWa4n5qkcWou1/lRm7NP/dkGDi6lH9qz3NjH6NPu4ZBxaFA8bOz3
         kjVw==
X-Forwarded-Encrypted: i=1; AJvYcCXDgSGrQ7EDvgEVvWs50wrYbdKxKQUcIxxbswL0H8JbxBHreqxLgvmYsuQaw3SfPVcXzOyJw8XqMVoI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6wzcybLLEbA7l2XGm7kRpLAbU5RyiaPamM6EU1uar0yDj0HKo
	B76EUnU9eNP0DHTiA4CZ7AliK1g1JcYAxfF6gNpKRsXUbn9SMaxru+e3lwnqAwuKcQLsa3jc/5Z
	fn6xKgtjXHFl3a1ORX+MM707+xXEYI9sOBe8ImDqwDlA2hA+9IYx5dLIgnB+jgJ4X
X-Gm-Gg: ATEYQzyXClOCTl7LShpWEiNhQs9g95tL47+X8CCR5VpbB82oi2dEqbHxzwHFDIs+Dv5
	g0kX6+RS7K9uToRtHUTJVnmPF0mePT9Rq4Rf4jNk7HzXtYj7Lf6LTFVGM00ZL80htLlm5oj/TAR
	wQFOQMfTsrJrEhl6+V93KDh+WerdPAF/oPU3jjjT47nuYUK9vFjtAski6QKp5G5/52ZDaKaKqpI
	cg2jqUEC0Di8hwttB8+H57F+zROjUzNzCP64vBxbwSgW7HqGtD5rpecV7QMc+58JkbQtftGrL9y
	LVDSCoTG8TO3Qq+2HBMPFavbj9dqnSHxuK/puano6kaY9D2Cz2krTHz7MxDYmGosnAAuqYJHe30
	RF3VNc5F151NhjK6wb973989flmdAp9CfOr7YJDEE1y9P+0TYfVZ6
X-Received: by 2002:a17:902:d209:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b0ac1e9a37mr4064515ad.14.1774348804442;
        Tue, 24 Mar 2026 03:40:04 -0700 (PDT)
X-Received: by 2002:a17:902:d209:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b0ac1e9a37mr4064185ad.14.1774348803929;
        Tue, 24 Mar 2026 03:40:03 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c766255606fsm1101544a12.21.2026.03.24.03.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:40:03 -0700 (PDT)
Message-ID: <d66c16cd-0460-4813-803a-dd298f3d7581@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:09:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] arm64: dts: qcom: sm8650: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-10-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-10-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dz4YTi7eb1AhMvXi0ig4zSX_AjptnASW
X-Proofpoint-ORIG-GUID: Dz4YTi7eb1AhMvXi0ig4zSX_AjptnASW
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c26a05 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfX65naP9iJPJ/U
 Ypqni8H3a/PCdrBM5H+UPNrct6FGvcRzOSTr7XfuzCzYJchqVOj4NmkWtWByjR+jNmS2CrTEJfN
 dny+I1sIxikBlWPij9wf5zAc0yfeOcPXXBzjEg5E0kCbvp/1dWfnESY5Nh4qekn7ZOkZOX3ase3
 4GX49ORHp0JBgSTkGHrRRp42IrsReaT51rSyfy5tWw4QzrfXdYU3wYi+T8oCitpgcoj+UAaNB7V
 uZN8jtAP4pJgk+i1s1N1KM+AcDu4ncTMoLXxUcG9KEKsQ946P4dH9/EusG5qfR68P0geM9+b1OK
 9cPGWkMeyVjn69pRSz0UiTRq/ThHJTgQieNZcgWF33C04Mp5dwBAfj8ZEzCVzlztfv9E6b0jZMr
 FGFb+o0R3P1h48p+6YVhPQrqNUtG8fFn+XrJDFvtJ7L99e9w5hqb2vSY2bgisRLs7aP8LEqA7nk
 TyY5GalKp9lO9PtgEKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240084


On 3/23/2026 2:48 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8650.
> 
> Fixes: 10e0246712951 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

