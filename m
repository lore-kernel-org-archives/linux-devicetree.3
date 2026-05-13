Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CAA3FCB03
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670677; cv=none; b=CwhJS06cGKvhpTwm+EjittvWLrdXu9T2FSDCgukWCots1m08Ulk52mj1vvV1tEFe9BXQPK7SptvyeVSZTRMfb2Xy8ABXDjOvIrQfn3R5gFYxjX7ehepUo8lEGf+f0MQdWrNIgsqEDeciyLdx5zX8FCFDsvePOz3Fd2zaOKg8aLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670677; c=relaxed/simple;
	bh=6/Iy5kkgiDFD16hOKi/Kf/Di/bK0BuO/Zg8iKPfSReU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EK2+gzG48MGhGQYU0t5hbHh/O20PImymnNuJEm8FaNWdpK+mR18SULtM7IecGMa0YHPNVSYb2YIc8xCd6R7CWbrjxIGPzpLCo0U9zbfpsiCa/g+FtJ4uS6COJSAn7uRRhXXJGuNIij6OhHZiInHQ2h03cFTPDZjaCvcCnuoW4Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KK5rhJZv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4jGuqRw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KK5rhJZv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4jGuqRw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6ihcL2965290
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=; b=KK5rhJZvACG3B0wx
	Uy2X38qolVQXBPj5Wh15u3rauFOZUrdEpBSbszwYhRGH9kLCTcAYzRVE2dKNFQOy
	ifw2lACy2A//AyMMLEqu4crINamb331AeIldiV6RTYNMBUbbs+XZdzXZ6HMqYxXr
	mBPL1+iV5CO3n3sPDusl4c8CwYnC2NZ6dpxlc1wa4jtcKV4wSTngx84lBUWpfuJT
	dXp3YRifk4w3E4Dw9oWf/+DsBuxLhrQMkCf4JWH4I+Vfx3CtuxX+RaKjxpLhbuH5
	12vrCn8eFJywkZ0D1Gh1zKYuDHw+uTU3MrLoRo58MWRSOPqvzrR/lTNs9yxaTxCk
	slAfxg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma591fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:11:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5147078691fso152418541cf.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670675; x=1779275475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=;
        b=V4jGuqRwEEo1rDhFYEMpDx0sfH9fUHCgNJyp+/xfRNiWTItWKuGwAcD84wlKdacb8v
         jT6udblbP2OK+wl80KIks9x5pZQMyJ6Aq8KYTXKVvPCeSl6pQaYKkf3Sf4DGp05a0lL/
         1ZuXINEHZyz9BKLLi5BvhmjjcDsjzn9nm7iZvgNqJ3CCBTaDsYCRS40wsh7yQZxAP6v8
         /dAoirQFw9yu9SvcK3a+hgDHFP4G5Vb8XDzeelNbZGc29jK8CQ6boXjOQK7bfD4MVuPd
         AJ5/f3brqmRhIfbZYS+vtBSuCf8IuA9zFGDoneW5b7DlCc0cQ4AwmFdyJjFqiENFgnde
         pvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670675; x=1779275475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=;
        b=Hb2CAYDRuTGW1dJkopqf40qbMD08U4gdVRBVGUyG/f3Ke0iTghKkwK3hTbqimc6VU4
         MibFlBwmWCTMLE3KLDgPGiXjM0FHlMHHjT6+Uo8TbGSC2QyzIECxfasUoJiwk77xmJYY
         2wg8YDWj2U9xbZePT2qd47mjF3zC5RdbRiBitg5YGw2Bckc0+NsSw27fVe0woC3/l6RM
         uKsoLuFrkpf36XgQ5Ades+Ho4RAZ5SVZh0UDcreIrnSOGngAgCFaCqQHqtR0RVS5Ubf/
         5hbHD94nxRX4VKGi2nJ23/G6gLvLLJN99YYpm+vihGj2G+MkYvodqJ1+/fZTxH39BgVq
         dy+A==
X-Forwarded-Encrypted: i=1; AFNElJ+7/5CGOP5pr089m8Eqc0CvBSQxKcSrpcYVHPMdGpbPu4yfNdMX//y+glQgaee+3c6LekfXeWx9NPLr@vger.kernel.org
X-Gm-Message-State: AOJu0YzkQne1tBNerZYb1jUzwyzp0Mr/rczcGCoqPnI8q4LadFgHGB5s
	dw0XG2DF3TjDRxz3KIwAZUilT+sM747kyOu4D2p7QidlufSSSKc3TC7SeWN9SBKzNZVkW9lysOy
	QUytIwSFaK5f9Z0W+VzIRQQ7c0T+20Cvv6V8PBEujTpSXUB/QMOeNLcLUEO7UcaU0
X-Gm-Gg: Acq92OH538Lc3YL1ifyVY4ulIJmjCuhCQOGhRNrdDa4EUIu+ikCPc6eGavqUcRwFd+Q
	MLaEINtSaXhtj4oQ/ROJXGEtYFmzVNkDMIlHLNnoM48W80wMFjP+RkhiK9lMTx3nW0FTX7amP80
	Z08VzbmZsWyyjwBYFiUtqzLrRkhwGQeMzkLUv/8v5k8GXykCQTwHhYLXnr4mmdabKyk1Orqu+ca
	2c9lVVSuXE/YTwItGMRlP0015b5jTSj0Lg3KdBymrKSfGmz1kMQtJL5tvMD1Q7m2Ov/BfiTKKtP
	eirHI9JdtjsIxHX27j91gRvoDJw54HOJm3yE5dVxVsVgRxFnqBmpIDG3qGNVp0w0podzkssDBXI
	XQJOnOZ2qS8U9QoYbEn3PtBqvRO8XBQ==
X-Received: by 2002:a05:622a:4c6:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5162fe69df5mr30505441cf.20.1778670674767;
        Wed, 13 May 2026 04:11:14 -0700 (PDT)
X-Received: by 2002:a05:622a:4c6:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5162fe69df5mr30504851cf.20.1778670674284;
        Wed, 13 May 2026 04:11:14 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8cd49fesm72081355e9.0.2026.05.13.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:11:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 14:11:02 +0300
Subject: [PATCH v2 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-llcc-v2-1-27381ae833d5@oss.qualcomm.com>
References: <20260513-eliza-llcc-v2-0-27381ae833d5@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-llcc-v2-0-27381ae833d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6/Iy5kkgiDFD16hOKi/Kf/Di/bK0BuO/Zg8iKPfSReU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBFxLIuV63/iI/Rminez/2Po7jQwgsFN2vpElI
 /kswoYGI6+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRcSwAKCRAbX0TJAJUV
 VotGD/0a9Fs1IUXIJdbDPqavOWyVvNmv8KTsF4FGfr9LTNbDGTYyMnjxPCIqkijI4zEPLa67PJC
 S/5nwpQlCaWGbJjN2T6i2ePlFnA1LvlJ242fAEBN2BKKREtiPRvG55YYn6yyfDwEv8JcqYcOWHn
 VFpw4p8abgRJXlQM7/zjTrCO/jYQ/xYrF4yYj6z/I6cvBdpBdgvLfogYRTbk2RLTOyftSwBQTvH
 os9QTCPtK7mwYVThvj134E2cMcHi+qEnwDEG7QGUE6txgIbT0Ip+YDy2FljW9rrl87piltiMiwm
 Ah0NKUa6Uw3DvZN0xDkxdV7B1jwYGmuQSLJ9+KyVc7UwOxIs1ujaW7IZej4DzPm7zGhI2KnAMgd
 81YUTWIpOvBnWjY1K5eUW5cYMNH+qhwJ+zCbzfrxzUeTyBhrLgTMIYiHc5OGq30+slZCqHuZ+O2
 JgeW7FmoXsIDVzFagh20sVMGPvnlMHZkxfpJNBK+obX2a6KhExrlZeWcIlMAAzN1OuowQQPkqIX
 z4kq+8PFi7f18IRN6+jDlbfVH0NsoB2H6nMVkYMzTgQ3idbZqSz4cKSTyv+YXnCCBA2dBJaH/y2
 ErR484XQPAPKU3e9KY08+L1lGR+Yhp6I/H7gazAejFdlNMoS9T3bUFzOxvnkfZWb/dhqZMDZ721
 ymIg3UtuXr3aXXQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfX98ABs0xi0YvK
 9221MLE6wufxUogS9R0AQ2q/YnGdtxRQN6bICKBCkFd9wbJhSqVTyhXDcMuW1twkkEW6oKk3u4Q
 JDVzT//ua3bUdjQwgsDRqbkFAA7RDEm72oEO0r6bNG0dUaoUrtghBLbvskG2rpdYVE3Kq/xKfuM
 z/C74OFSB9R2R5BXnupYayQ/YLz0gOOn+vyFX2Ylxie8kjxqBLTs7QtrANglf4WbneKDe9h3Cp/
 OOFwXzfVr2rnjD9FYIDUAw+qSLf2q44rG0GUC3HOfyZZ/2/g1AOByXUIUVIrkEieZfCyQumx5MN
 W03JRSOP3tPcQzAvzwnZ3qPum7XzZZYJvDalF0JawRJGLQ7/cO98qTLjAMHD/0N+42TD9bUykMj
 PR7BRUeQa+XTMvkByWT4mRvxQKgXPYx015iftT8LaBQxEP1DHIwYtJWIjLZpOSmMFVkdZIwFBrp
 k3/ytFREqf6YbkCdQPg==
X-Proofpoint-ORIG-GUID: Iy26_BOpttvvgNya7QG8AU4vSoh_LVGc
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a045c53 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rhu6fYff1SmOIWjBxU0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Iy26_BOpttvvgNya7QG8AU4vSoh_LVGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130117

Document the Last Level Cache Controller on Eliza SoC. Eliza LLCC has 2
base register regions and an additional AND, OR broadcast region, total 4
register regions.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 995d57815781..90f5a54b76e3 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-llcc
       - qcom,glymur-llcc
       - qcom,ipq5424-llcc
       - qcom,kaanapali-llcc
@@ -341,6 +342,27 @@ allOf:
             - const: llcc_broadcast_base
             - const: llcc_broadcast_and_base
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC2 base register region
+            - description: LLCC broadcast OR register region
+            - description: LLCC broadcast AND register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc2_base
+            - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
+
 additionalProperties: false
 
 examples:

-- 
2.54.0

