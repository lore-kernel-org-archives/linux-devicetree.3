Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D797E4BE44C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646110; cv=none; b=H6WTkRUEuwzrfSgN3foMQkt/FWT6puvXVo94gCsQjfEOug2RjV2Bl9Opi7LfirMend11c6r+GZd1u1I4GkwVzczddbKFEr39NrVNPfnm0Obk5hoNpa2wEt1ResZRf4Lcg4CNro6GGvXpApDK4Vz5xrZl8ocKmfRIzPRZHm6My38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646110; c=relaxed/simple;
	bh=jIHPRpMEkaV9mAQmwuXnsCksTtsHuY/XKo46rkvTq0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gcan2olmsbt+J9OrUqXpTxCp7Sc1VqsmCn+22C0cP8Nq4/C4OhJKBT6Lt4zlyXsw2Fsd2Q3OgnZcgwFa4qed+SQZx9VA16/mm7at9ehmLXxtgb/QwhiWuV1RBez/vW7ah/8DdrE+WyFvmpunpBFn5vUY8oHwHgpCsDSBGeNM+ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjrDdsTx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnaXaCia; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjrDdsTx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnaXaCia"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zb8Q576974
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=; b=TjrDdsTxQdgQ0Fe6
	iF/oApQJbeCesnvfww5DZwnFxYvGmYwT3yMd9GxwBEL2LsBdeL2pY3jP7eJeoWyP
	yZyRTFtRbfcNTuvONto32nENbn9I9OcTQ65BNw1P1neib/hh/pXdt6/lX6E1ThZp
	R0hbxekVaHHJ0eVLpVH6+eJx8V7OuLNO6o9t+W9d+cmvPEpYSH2e5x15nKWU9//e
	BBN962KmWhuOSWkV5fIiIT6f+2lYedlwYNkFZQPWsTJdHVnIP6TdTohgiQKozfXc
	oLuwdCe0zOXFxk6FwpS9WRASyTY8ui2LTiE6c9QQSUxh7FW+uP+f6y314M7nvqFT
	QsTdQQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw1sch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso745313a12.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646096; x=1790250896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=;
        b=RnaXaCia2fZsWvb7Yka4+5ozDnOEPfzUBqPE+QCxDxcfkk4Fjx971OyhOGdJWxqhfV
         jwIwZoeBwWU5AEtAfDf/aPio8DkSQhmuFN9IKep3OALWJlQMLT4ho2xxfTDHd0zPvRpO
         5lkSOzCjBfzSVMiYFjpFw1gng8PfVBZGY0ZK7uk3zcjpdQP1zuF5FsYfMXhEZx63fU6l
         B4Gprvgc/YgPQ8zuEDBEfrO/lTdnkq777IA3hwrkG9hNsqnyi4HkXNfATPwB1LTVJlr8
         M1lCH1eIf5N4ey0+iz4wfpaXEgprjDcFF/8i4xsU4oV35n7Tw3qLqM1Ircl5Irlc0pW+
         d4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646096; x=1790250896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=;
        b=GM6G3lwGmE5P22qwGx7AU58m6pBwCGY3PfX/vsirSSD0DIm91B6LitKRudmsZR/4QB
         lsCmMm8YEhI6sY4YEdC9820rHU9YDSbuTSQDB9SI8ocgIVH3VNsN1YdOYAutgZjLJaZi
         nt21bU3afyy1Hfn1+ZxIoLkWTK0xi9NQECx75HnxEX/o/QqHadeUqlLO/1Y8s5ImVQ7N
         f9dHis+ZF7pp4lOiibIxk3hYSMsUkLdS5Y12GOOvyn79XVHNKQZy+WaJPhnbVWHWasTf
         SpVdXvuhzyDjH8yy/NCPuP/xfR7sovdn4gt3S8owyYhPUrvnFqrzN2aQPHgy8a/uqWeq
         Ci8w==
X-Forwarded-Encrypted: i=1; AKwUvBzbewMKjuRP7bd3b3qmX1KXBVCeDxd64jUs8kpkbayM6W5QvPNm84lLwS59KgTsApp9QIUE8v+xYkz+@vger.kernel.org
X-Gm-Message-State: AFuF++ktY/VpRoE5W4AlAd4TXB0sOidsUr3dZP4lpekGEj9e/CXKnmpW
	MlzWcBI9C3U80NHUPEP9pi+6kFuryLacPZp3QhNHhf9f47MvupBjVpFuppcVFBi+nfHyM10w+dA
	yV2/3bAyfxdnhHvgtblRJMlYlnBW46la1QHzLyt/U7K4rDqDkPZapliUHU8RgBss/
X-Gm-Gg: AYBFou2dXudQfYCNPoICdQDHcMfZwyjsJrhk0WrT7wm2+PMp4+wMFcPpMRYu1hrJudh
	Fbw8c46DmU5571pBUhs6h+WsW+awRGx9ejYnWvIt62NJ33zZkQeqB0RggU2/EEihu8gTovbwiMB
	h3r+OBFmJ0DjiwcoGq/2Q03DJ5wEEK4oFIV3BCSdFCsKpWr24M/jidh8Ai954TPx/kSD8/nBVkC
	UJE0qfJqgmO/Bm+KiZ71hM2JKkygoWE1YCLczf3Jv7hBrJe0avxGi1WRypyP+lkzSKh+Xd8OrFi
	iB0yP/JXf1DshYoMvVy/xOuTB0CJLFNe0+0M2WaLgmv9gHZqepuDTMv+ZxqEYTvJiUrBNvCWUPB
	sSX2nCdUnDBon1HGhfJ08fhJ8pe3SkKUdGw==
X-Received: by 2002:a05:6a21:7d01:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3dd5f73c983mr15880972637.19.1789646096533;
        Thu, 17 Sep 2026 04:54:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d01:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3dd5f73c983mr15880923637.19.1789646096135;
        Thu, 17 Sep 2026 04:54:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:13 +0530
Subject: [PATCH v2 05/18] arm64: dts: qcom: sm8150: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-5-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=986;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=jIHPRpMEkaV9mAQmwuXnsCksTtsHuY/XKo46rkvTq0U=;
 b=mdyAI+9wdGhhqa9FSeWfBG0ZLp9n3A7owGqgcmyDh7SDZ3NkSNWvZivPLcKCBU7veSsG2PDql
 do5xxHjz4MxDkUKx6hIvdrhB75srv0wuL5ZcdQ6u56ll6z84pkWad7E
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: rpaXntoorgqjAfjTC7rutm6sG3fUWHeE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXy/hlIKjdigFh
 uLpKrArwPAJ4ZIVlfgAaCBDlNv0K0WAa0qVBG1zH05KAQeZQsU6dr5sOxsoRd23/rxr/L3XVhdp
 I8QkFwtBtp8OGT6SPczqkgcwMkIbQB91/fJjgnZ9KtewOVIBgvUXDlJ/nLlvD36gq2NMz7gLJTE
 ppcLuGpge8RNPd7/bJ0myeQHkUDPTwfs3+3u3qfnlwdXo8t63HSB+EKqTvARRiaHd+9VevLdTKf
 elXp/Sm9diUShMG9fHGT6AuzNNttDpF0fyCE7mToILJWQx/ZcbF4cVtY4zrQCzmaZ49jX9wd1DC
 +Op/Z7u1WgUq1kO/xNsYdasBz2yV9E5sYBy1B5YWLn9XWnsnboZpQguGb6/nv4Bcz16UY53e8B7
 MiE26oxGjTwDwZV1qH8eETfv5VY+e61zNLSH2zdsxFlYXLMCEUo8Ek17tfmPoky2aZAS4Qb8Vzg
 ZlP5BWNzazVF4PWb0FQ==
X-Proofpoint-GUID: rpaXntoorgqjAfjTC7rutm6sG3fUWHeE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX7uSGNQOSNU2e
 pP9tBbupLy3IncANi94qzqQUxMF14YNw3SBtXNv52Bz7LRR5xwHJIsp9nubJDQ4ZQ+xUcuSuQE5
 L0Jfo1XviV/l3MgfcEi9IE8tbO88Jk8=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aabd511 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..74df5cd86f04 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

