Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17853B8935
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312169; cv=none; b=S15cINYKpjhZwJtdEfsasom2HTVCQ+4Eopa0CRMZ6jXtkhGxOsIyVr0jeOx5AS4cKf0F/yki8ScQp5YjrHaCHmc3bjEmNz0rQ9ZMeHnZVEVRAE0BtTPFbe83E8lTulN63yZXMDgVKyyxBv1HyKwkjjqVM80OkgZ21YESvyABJsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312169; c=relaxed/simple;
	bh=a3+et9cPbocF4+NCPJZ6wV5DhCcxnHYplWO4owQID/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7B2faQjHGRvB6vmvum0ukF7GZ4n7Pdma3TfoDDCz7dXEhyMRyObELNo4UCutKuoGhR/VIILMhyWYQWcG7pQPzpBZ9eEOE/YqVXa0HC/APCzlPMvFFZMuHc/B3t21KlpsC42OHIsP3y9hVt+lePdDeI3R0ttUHBNZDYWZuM/E/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsoPaSWU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fAZPeken; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsoPaSWU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fAZPeken"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDxZ5a2913806
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mPZQf9l2Yx8cErRRrYkPxqjTtFZs4BkKr7p
	TWDEvXa0=; b=JsoPaSWUEBLGINmiNmjpT59Op0tQVAupsQpgdMHLN06WzJJSZUj
	65ILntdgXa5ZYOf3BrMYD3mf+FoTSwriK0SCdrMP5zfgy6lJMS7bTcAkRPXxtGqv
	RdYck8wL7clfpQHuvtiCxBc+iRoG3UjMd7Pd86OdS+4yki4uxpwjCk0DOtX0wC1N
	n8mypiz9FLTlGTL3oko0frEClCLxpWJcAMYgEoJNtZsnMjc/vt3DMchNd3wSS8gy
	nhQhPIqweXHAfaEIfQ7GFkqvrGbGfEDIqKYCWO1sYL6eSOjX/wsRUT+TopzqCP6w
	ea0gSOSbQqPubtf0Rww2iqEBwqfa8NaLfnA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xjpcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:49:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354bc535546so10752704a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777312166; x=1777916966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPZQf9l2Yx8cErRRrYkPxqjTtFZs4BkKr7pTWDEvXa0=;
        b=fAZPekensdXt4G9Tea4hKf2brIVx4Nxf4Xah2KRyZbwamqR8w51YupS83MQi7GLFCV
         2TRgNkOdcggKjEc74jBRq+CrSRDnPnpKH570/fGp+djtZDu+dRfmSLgrB27gCr8K7Kq0
         /8S5/+Apvy5I4D8tjdtL59bDOMLka9QH2J2Sbw+Z6JoLt+oLM3lpbZOAkxq58tDxJNs1
         gPs62St7UexciOgW7FFLq4kI9z1wM+JD+nhs9NZneIPhwHY0sgf0uoeNV4TZWiq58/wa
         152SEI88RZxMNIXZEzaEUd0Ag9J3A0KW5KaSXHMYtrpVdQ4mpng9rZh600PeCiDWRT+6
         f5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312166; x=1777916966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPZQf9l2Yx8cErRRrYkPxqjTtFZs4BkKr7pTWDEvXa0=;
        b=UBY7/6HyNC03XMl/JtGLUUH/iWr52rc6MKa/X7gLmeJ7Y2/hfncI11UfcJSik8akZ9
         Cas//oErdoNUmYtDV6rbJ1UJ1V6nT/UUlTUz3+c5QTe+iZ6T4kTp+wj/7KXBDz5Pv+U+
         F0Wc+w8EEX4xPLlPi9FRsp9qECvcp7iEBhF+tz/TK924RhbK5TtdVUZUxpIR2iZlnKKM
         GYhhmkmsgdMHw6hXJR/yjZeILpmqb+3zjO7G3xouVcApas77uWPZW3DbXNujbb63meRf
         aQCt8qFYbUS2rtCkcRax9aORlaiC1zeW5fVAlrRBuVbU+g+/+ZeEvqX5ahTCEQZCUhgK
         U0qw==
X-Forwarded-Encrypted: i=1; AFNElJ9GbAGU2kyG6I0lQiJ2Q5WONxJzsC0z4liSF5n0wFzvwWiNtvR1ev51+wlPWKwGqfXONea3o/bUnqgG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4taDNWoHFyieBE3H3rrs8n5zW/gaKo4Misf3ykEA5kDWQZvaA
	ZBDCWxiwvyljUPL9XsCF8CkEuqVOigGHl/wH1vrpvMA7GCqPnfYX2k7GCE4C5JzdH91R2awv8Ee
	lqS0Prgl5Vj/f5Omk2MSDqxxVmb4UGR0agx6FeRbypbwz/86nSEQFtYZEXFZp2ua1
X-Gm-Gg: AeBDietKxl8kzDP5oGScKkiJSPbDa7hElSAFKNkSaGYenP7dMVHoZSwfDsTsrlV8UKx
	7/Q0u6OvbhpWmEHIUCA9eBqwJ5kyRQmMg8yGtCkqXk6ml9Cvi1u1xascKxbzD/pcEZJylOfExq3
	PPvBTlNjYilbuVpVD3sromSk/g0oeV2IxfWAwUxgIWtUN9lQrRNRvLIsTRJDizz/ds6MTGOQ5nc
	2kCjsHvYv0/9ePtigcPYH1AXzJvQYhJc37aNyhgv7+xpgvzgiCdp4AESEGxH8MP21iRP25gKkqH
	LTWYfrpgVnyQN7GtHWzPc8q0NqdinS1OTqF10aGNCHngO0h4/GKn7COzHwktR35SY/Y9seSc27b
	JA3J3eCYl9LJL0D5z0gIhoHtVZPEL85LzV+/zFruDXclLrm6pazC9QsHBHCE=
X-Received: by 2002:a05:6a21:6d9c:b0:3a2:e8f1:b86d with SMTP id adf61e73a8af0-3a398df00bbmr395896637.31.1777312165786;
        Mon, 27 Apr 2026 10:49:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d9c:b0:3a2:e8f1:b86d with SMTP id adf61e73a8af0-3a398df00bbmr395849637.31.1777312165225;
        Mon, 27 Apr 2026 10:49:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f9dfc8sm27824123a12.12.2026.04.27.10.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:49:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: qcom: Add Hawi compatible for Application processor
Date: Mon, 27 Apr 2026 23:19:15 +0530
Message-ID: <20260427174915.3639641-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GXfFQBKCuNVuev8UmIh_gKRghwIA_zjs
X-Proofpoint-ORIG-GUID: GXfFQBKCuNVuev8UmIh_gKRghwIA_zjs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4OSBTYWx0ZWRfX3jHsmXmMsg3J
 tRHDLhQn8BPpTE4CFlKoR7hFFrLHarZB2iu4jwsjgwDITauD+TXKwHMFgyWiIyqbKH45IyaA2g8
 yNjeIGgxsWCJj9lFrXgeSCRqtC5We/VUHRxG5Fd/oasTN9WLoBhFD9flTg819NlacvsWB1VCP56
 xEIUKYoMNyAU7WTtQ9Eow6NGIZBNyHlj/bDJv9MGoQPtMi1Gm7ZzPIuxcNWHmQh64oy3RNppsYg
 ZAPvcaG2vW1kmBiHCz6D/j6CZlg3XdDOQLAEPNHnbP6ib9TK0M8FNBp1lCeebTPT0G8zjyMhQiP
 NdyL9vN0CwI2iPOULn4wVmWHPER5sz/IYDFVhpFIchnf6aUo5hIxGJ2D2Mk9BowrYiMzKzy09FR
 xE5yI2IaANnLfg18ox8P3HYuqrsfQG6/4aq2bK+pgKqXn9UgX7YGimtQWlPEycdmJbkvvSRmv8T
 gdtLuV/5D307xtfQkPQ==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69efa1a6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Fuqji3Hwj9YOp--83a4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270189

Commit 5e8323c3d528 ("dt-bindings: arm-smmu: qcom: Add compatible for
Hawi SoC") was intended for the APSS SMMU but was mistakenly placed
under the Adreno GPU SMMU section. Since that compatible is also valid
for the Hawi GPU SMMU, keep that commit as-is and add proper
documentation for the Hawi APSS SMMU here.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/20260422083329.885979-1-mukesh.ojha@oss.qualcomm.com/
 - Not a fix commit after discussion.
 - Not removing the earlier commit change instead add one for APSS
   SMMU.

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..07b71b347205 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
-- 
2.53.0

