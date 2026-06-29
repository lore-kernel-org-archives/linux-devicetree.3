Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E79B3C0A03
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716228; cv=none; b=ddRlEOxQdBd5NmhFaF4UxpHWcXpJ7+/D7Gp+LPlo9EBbZaP0jxWP+5FT//cPZAYbcxVezJGqve9LTvN+Cjdt0OAlS+G+q2th2xRLj/Pnm1itYSTGcVB+jG8hwG2TIsk40nT8p1+iz/FxAf4cW4KW/BNYFQFFSNhh3SuVMjnDRJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716228; c=relaxed/simple;
	bh=BtkPFNWwQb2PwuusYf/8KN3qcU9Gir40fUa8c/oqJ5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VtUXQg0wqLdoSmUApiHbDw6Rp0ttc/z9pfHBVTrqgWKMDWCQmBGaVBcZu68+99RWZ0lKAsNN+iU5/TwVcUS4Ied3DCaTNV35hhIqnaugPVqaveQ11q7gtw9rm4RST/rPHczapJOVuqfgHLJYH5NtzIhtO7ccs1/n8WTWPnFNuBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giUQhWBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSXn6gGU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giUQhWBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSXn6gGU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sQlE2143297
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xOux2gDggREnIc5Op1Tbz5
	VNmuHn30UOA4c59Lv6Txk=; b=giUQhWByJkMkmkHPncSBlK/cyD2BmCue3wQBYq
	yZhoLgsoHppyLJC0d8I3gc778X98oq2/voWWPMorovgyoPInub1k5PLB7jubcYni
	iVzM9sjOqm0FjTVFio1Z3PEK8T8nJBL4XXMSnwwUCYUaqiOgu70Yv0XpkIVqAKih
	O7OjsgVdo4cJc2XGG2e2CY2nnqB8bKrt88BTutjFAVOVklkyFUB3Zv17aJHDG8aX
	1lp8hcNylwDa9s9BKceta+7wsxaTELPwnwd9yiRwumdJAs1WybZNWYxVg7So6CMO
	76NEgYMQZvfvdVnqPvDwVPCvbtZdNnvuDBjFVvH7ILBxyicA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8n67m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:57:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ed53abff8so342875eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716223; x=1783321023; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOux2gDggREnIc5Op1Tbz5VNmuHn30UOA4c59Lv6Txk=;
        b=ZSXn6gGU0Q3r2sf1zpJil8r1FZwwvVFM36yS7DTeQq1PgVt9mppOD3pkIIQOIE7po/
         xmv7zS9aNPoUX9XKn1gLjLOgLrDva8ar7+Wl5PPLGD3/Ip50TG+5+8x6ApoQX5/XcxVR
         NZEU6A7BFNPEsZgfn/WmrPE8a2s9KqK1QF/zGdzAURpn4ciMr+BmHHq+zoLa+OjV+hU6
         qauDu3366VRInT3ht51YNnyadC586s54zYICxo84X/ZmFF7zpGjEWiGtwRWiCZ8FG2rI
         hV3ApuyeDr2H9K0wT8OmR8RIV5uezqc8NuSltR3yuLoy4SpfvEdxdkpJmpNDypma2D3j
         CAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716223; x=1783321023;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOux2gDggREnIc5Op1Tbz5VNmuHn30UOA4c59Lv6Txk=;
        b=BWQQ33A0Hn0Xg8ZvA4gmVc3OZjDSfBfFHJ4P89d+TqKtWeXsSSv0iXnKPrYifK77uH
         m2zDYonbV9n3DipGHw2dCPIdi/jBosHVwvk/t+Mm2b5/qZsZ/zeourshgwmGKvoM1pxD
         A3bYcUNqoQYro+PT2LQPExSZ3pkC26hZlPFjnZBqRDIBP02/3v4gfR7thMQKcQYByPxK
         GV6M7vg/p5L9I/e3EUyHJn7aKFO5G3NJlGA7JXH5Sii/Hfz3cTg0I0ceDZFSyf+ypL9a
         zpubiNcId3NfsRafDQBkMwAfyzQRwu5wL6V9O3K/xOv1QR3cNKLkiZJXGOr+G28rzBYg
         Zu0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrqmgNfoG4nz9cN9BgO75c/J+hyiR/c+qTV9rCaJMXnxjmSStHVtjpm6cv7a4TkBgEt7l/Pmh4PwUa8@vger.kernel.org
X-Gm-Message-State: AOJu0YzJdm0/gctF7pQr9xj7Wtqp4QtI+//5BS2yhPqqHCJg9JF9w/q0
	6VqhUsL7yFXmPzqnit9posD09T0PmzJjj3adnYCVRbQRgbCQfQmc/dx3pjUBnPZybz5rd1il4Cl
	VQrgoodJxK5Lqfo2DsaGkvdJcf3J815tx9fQf8pJPL7HHHg8J1DClYa/SWQA3LN+U
X-Gm-Gg: AfdE7ckh4FSnG54w53TuU1dpoJaQJu67xGsHLDLX6+/+6L2wcKhbveWHhBbttuL7IpZ
	eTHGg3O3fC9NyLdEgVoFrtKWWTpQg2kyDbX41x8HG0QcBW1QUTeZJ+saT2sFmUzd6wkHaR4Q6xW
	W77zzO0DpcIHnLFOx6CFc9FAyVROIXwsv7VsDxR2QSbeDD2jmBiciZZGH+BOsZ2VX2xaQLvt49y
	OmM/eR/+ms6h2vS7td2PWjWY73Kjt8sXK/FvMNMTePgNdZ+OG1oUi8fsY5lxo1pZvLPw3VRiNNB
	IY/F6RNxan9cDra5yShfMCJrAHWZCcPyuJq9Z240yKcHottnqfNwaj9Rx0ORLNUBA/MItsFEeUx
	nE4uIDf7vRTEEVlm0xVwshJQG5cyt/6HzPdgVsjQVjUR4m16/9+2avJa/qLgO2g==
X-Received: by 2002:a05:7301:6003:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30c84f77b05mr15366615eec.29.1782716222308;
        Sun, 28 Jun 2026 23:57:02 -0700 (PDT)
X-Received: by 2002:a05:7301:6003:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30c84f77b05mr15366587eec.29.1782716221797;
        Sun, 28 Jun 2026 23:57:01 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c6c2sm44995600eec.10.2026.06.28.23.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:57:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:56:53 -0700
Subject: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADQXQmoC/02NwQ6CMBBEf4X0bAldhRRP/ofhUNpFNqEUu0I0h
 H+34MXLJC+ZebMKxkjI4pqtIuJCTGFMAKdM2N6MD5TkEgsooCoq0NIbGkiy97Os0RUdWKVr40Q
 aTBE7eh+ye5O4NYyyjWa0/a5I82qv9cSvED/H5aL28s9ewuXfviipJFpdtgo6Z/T5Fpjz52wGG
 7zPU4hm27YvrJsaD8IAAAA=
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782716221; l=1234;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=BtkPFNWwQb2PwuusYf/8KN3qcU9Gir40fUa8c/oqJ5I=;
 b=QnqI2Z0FwP7IqQVq1stRSgL3Kmyg9mkoHLOBdkzpbuoDBBSGghBhnyoHaLBqYkrOJfrh+vpgx
 a/mQgHR0MfwCp7N0ENAXOw6pmh8hAexhgtVK9oM3H0P1619SRkyGQzp
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX4OOD1eC58qiS
 CKVXqR9zwKfwXIcNLiS8hNZrHOVkuR3vChFaTLTofp+0AvaLKIWK4i2j6wlp3Ilfno4EFf3jjoS
 bzYZirB522A7Am5F99RLT1izQE7DAQU=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a421740 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0vWZlYpcnXXQiWOWdZUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: SKDM68G6I0LRojLeqqqLVYgvZ8NlkNHu
X-Proofpoint-ORIG-GUID: SKDM68G6I0LRojLeqqqLVYgvZ8NlkNHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX6Qubaw9pZOB/
 U3h3ayUOVgjhvKcVr6EZ+7T06zIqTpnJGVw3zZpjb3axb6psEgeTqBzItNhQOoueSlJ0PSPPGhC
 L56d8ipxLdAs1wt07ChvuVIauK0/3Zydkp2I8HZSMKTz+oLMA/jS2EYHJxhoFEWxJx0IhkYULuG
 hc0SmRw+Oi/63FR8fJnAfIKEsYeEpR+scxC0JrJnjbEfQFHg8z7tPkamA/nXi/bXfFxBcsId4mx
 hY1NJF1IGa7fI0OYeeXp/c+KigOZk7UnuPbaEf3G2QqqeVb+Ex/VSL+sLDjvNwaNe3HynEUu2Ou
 sKMTsrUk0nsmRBLPVx+QQMgQHrx1x9iBapbXJViFVp56BvFYCiiGjHYrvo9BZ6HX2MS8zoy23wB
 pCXJ+DyNVjUPkTK8lqdId8yDyuHfy5SbRQvUPrAtUDZ2Mvy6ta/49c/ReeSwOPfss2p2kdc1B6Y
 yFjSgi4Gjvwxv67C8Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290057

Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
which is used to translate device-visible virtual addresses to
physical addresses. Add compatible for it.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- patch rebase
- Link to v1: https://lore.kernel.org/r/20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..c48e9de1a2bd 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
+              - qcom,maili-smmu-500
               - qcom,milos-smmu-500
               - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260628-maili-smmu-9ed0f2c189ad

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

