Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456DF3148C5
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882199; cv=none; b=u31aa4wl87JH+MduRDtwof9EjG3MOyAOJMarpqtLK2QtrcyzDg5Zl7a9d8Pn/Gdf2Cg3HpMr43malrSHPhRbUYFn1Vj/spc4BitR+NE/Jmso5WJBZv39NvzgXn8JVQoD8pVpT+eo8EQ785C11STEE6qepybRAKTWXqc9VeclSqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882199; c=relaxed/simple;
	bh=6qhZq5b8SHzeShtJuS8Tcu7cHC/MNTPAlUlPHtvyRtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HllRE2xoJtrnQnkosh+jugBm7lKghzA9y+AcddiD4DAvCNqxo+lLLDbWmIXGzHbOGCJP8K8Yp9Aimp5+FFQjgOGOIJPAp+J14AlW0GUr/l5LWOIt6/MGQMxZ13eHCTYjBXStsow02+Moo4xoDxZ9P2huB1J7pEeCwk1OCymhwKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDIHqyMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yvb6vStf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDIHqyMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yvb6vStf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DwcU3506352
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 08:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U0ALeNEYrXGxdjvOn7+l1nFE6x+LDkz4A9/
	fqiCXiKc=; b=nDIHqyMvsKhz6nN4+XM9WgrC25a38Rb9BsFbcY0BLOmDFsR66da
	DGVdeVY5j6tAxE+SMX4AFcRR3i7nUg5li3ogxVBHYyaoNkSXoOq+bScp9X/uFb3U
	wV8d2KiWVj6RugqfKrBccuVmur9IaW0M5EeEFr9lp3MuRiomTOk2I8oWZ4k5r+3P
	t5ufCZ9XTu7d8Ev36d6uP1GEciZwoadODp9EprbkiKSlq8NySSZEMe31puWJzUJI
	iKKLmg/iiDB/YIIjDNpnd6xoZx8qzcHhHv8Dz5I+339YKYLNUzhNHtZ9uLiDNHzX
	KzQZSnObum34GmBlbjR5420vBVn2rZPqTTw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfd617-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 08:09:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso5902658eec.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882195; x=1778486995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U0ALeNEYrXGxdjvOn7+l1nFE6x+LDkz4A9/fqiCXiKc=;
        b=Yvb6vStfwlAL0n0PoS4ZKB0PYpuIdLhv/PFQSyWRetjA3hm2oOS6EWqAj47Yuhv9rc
         x4lHJhU4zGtRhivjJzXYRxIPskGoRzF1HMNSMrnfCu1Xtqdx8BW5Bx3wwNKY5UCQ3JWZ
         n/GALJtOZOXiAod943hPLe4ydyZA5/C45WRLFeHjrGRS8A47mBJiLT+AVWO//Bnr5eyh
         tN28XxsAXStyFVbOscf1g4u1UzGHm8CJOprGYWvIB2C1dDlDNwyjFW4x93e2g+UhajSZ
         Afyg+BBcvyJjxzswZCJLvDCjUakiw8XrOorSyRgi2ZLIUNJBX4jq+Hoy9taskqlmNUm/
         244Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882195; x=1778486995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0ALeNEYrXGxdjvOn7+l1nFE6x+LDkz4A9/fqiCXiKc=;
        b=J59LK3HxFT4qZGIjtAEbBSauQkFvcnjHHW0wk+Jaze/Dg4ej/OqrfMH6VW599I1uDn
         FL4ifUAKIRZmdOnnhXQtFcu0qIrymrIFTSahlvka/FOsBlJg/iSp+WFXXPaZY70Iyd1t
         E7Ve5HA3PSNvBDSKYg/d0g2kRCjyQcZ1OvS2pktpKo2gpfPp2fDR+MZtPkEoMgGIkrPX
         foeuE4Xvr/2WJ00dWeij+iUz+TI/dUiNd85prfQi0xhpX66v1VSZxxst1GEXjh9dIY+G
         NncOq3sNzh7Af78tP9iII5DMjN7OJ0stmyYCxaFkHAwwn8m6rbzqCWqkPwF3wkY1kOhV
         WHLg==
X-Forwarded-Encrypted: i=1; AFNElJ90/ShEpw62E3VWH73WBwPK/j+i7DIoE2tviLTe4mAu9XFaMms2vPsHRCgAtuvAmmlznKrRnXlUlmkD@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTUHG8tPMtKgMDb7IBiC35/4Ek1ufcmqwuEtaUGAXULBtXFbh
	elaCmQbM/wjUp8Oyw+3UOpgV4ZkM7xMxvjUWkMECukmfNFdjLCrwyxJlyZyCVAx23iMuWqreVwL
	+igl3zElWmrqSsJlpA113Jve5mTEvM1ky3xHICMgXQP27OnANVhe+0FTcg3O6mfoX
X-Gm-Gg: AeBDietxPpF9QCuDc1xt5/kNGrdCXrQr+jgE76s2hStkh8Nt57Xu09sf/FwG70SBXZX
	VmcMJptf79vZS4cyrxo/UocYJSMKBRzq7poiu2SN14Rr5pjFLl99UW6g32BhMDGjS952vM/QCe0
	5sh5qHN36CEKvO7kmI5w8hIaO2CE/jeRRYdwnX53KyQdydQDY8y8K+pWi0gIiqiGdWcej/S2Tpr
	5PBHDk0FfHQq43f20z4SEePLw2e2kMKkBcNPIkYwL2ADs3e89lvJkYN3gphSGuxhHXi9Hyvsozr
	wNXvpWBWV+b7vqLE1595yiSHE1jZWXA9C75mFwZAgehX25ni7oafIBNcZw6rdnBHGpTbDQIft31
	euwlcTVV3VFN596bOzP2O2GxwPZ8Z8jCMlgiVRrWGLwo521ByeKHwHl5UuWCvSqhbOdTnjgN4jN
	QreAshYbCUr8dbzz7l
X-Received: by 2002:a05:7300:570c:b0:2de:aafb:fef3 with SMTP id 5a478bee46e88-2efb7bdc7f2mr3480647eec.1.1777882194503;
        Mon, 04 May 2026 01:09:54 -0700 (PDT)
X-Received: by 2002:a05:7300:570c:b0:2de:aafb:fef3 with SMTP id 5a478bee46e88-2efb7bdc7f2mr3480634eec.1.1777882193905;
        Mon, 04 May 2026 01:09:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71bccsm14247134eec.11.2026.05.04.01.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:09:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: arm-smmu: Add compatible for Qualcomm Nord SoC
Date: Mon,  4 May 2026 16:09:43 +0800
Message-ID: <20260504080943.825496-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xg6YXdJ3LCI91gPrU_d3GVClWAbSxbZz
X-Proofpoint-GUID: xg6YXdJ3LCI91gPrU_d3GVClWAbSxbZz
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f85453 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gyBjFjMxxG6oYBEMJicA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NyBTYWx0ZWRfXxVPHveBTZf5i
 wrFky3ykhK52jfR0xMXQ50A/hmLOuXHpzILZea2JFNhTwJmzRGle09JqdoIe+HK9LpE37mhcre5
 VxEUAu1rvWK+XLgT09PYLwDlAf3fwQapaL3JkmOz0KNysxjQE9kW0LhqVsvY/jE2FasOv+3jwbI
 wZ9PjuimPzzCdZFuKfw1BCYnvBdbkK1hjaFctibWGu4evx3VAII6GaTO8iUjcgstGc/2wbjB7Xp
 EekcIRjBEqHyI7vJyUOtak0w9Z2LEIUILmzwrIgm5sqlgBFkXX1biH3h6KrpDeqAmo3YwUi9y77
 0FhjqfQ7NVjewD2l6HQEQro61vwzKnjHv3Vaz4+l3ccTV5+LH+82/ENpTl4MoK1XJNhyyARjnnQ
 RY9zUKMwlP4bbtecmsRYXHQB/yWxVfa7iVD856xQ5xNV/zxD7/+yTZOAtmiJrrlm0Agm9TBGoEA
 tKA2Uo5OULhp2LjF8tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040087

Document Applications Processor Subsystem (APSS) SMMU on Qualcomm
Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to expand APSS and drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427011728.231026-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420022452.1239665-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..bf29e453058f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
-- 
2.43.0

