Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EA73DBD49
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089276; cv=none; b=P4QTWV5qm5+OsczpCN49IkEdU827gZFog5yO3cTjq8IeaD6eQg/zSYO4qge93PoC6MPW/Mz9COwIK4v5hBe0YaubNLmt6R/FHDKnBdHuEprGKs9zpYEB5XKxXugn4nUv+IdqCDPgjXED5zaJZBter15jqGdt4feXvl3RensYG00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089276; c=relaxed/simple;
	bh=DQeBUDvNNGZc6Uir8xeAY9ErKWDMp38iSK8aZbPCGrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DH32nrgOfeUbLIWFZbuWZkJvD5K7Nx830mZONZjf1eDK/ZmzJz0eFFVRvWI0TrQuQDAjy98/u1EQEdXzg5n914qjzLVu7ZVBz76lTV0QKKTKWbvZStVw75r1rVXjuF1FxwQ2ShVf8CvGkNtQ+sDNU6gn97/+czYAz8ugLNs2X0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExgKfyF/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HajOQKxg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExgKfyF/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HajOQKxg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i2G33151943
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tV4HY9ZnY5FGjZHgR32ng40+lVhKsXil6i71ZkDu+yA=; b=ExgKfyF/B6d5N4/K
	E3elJAuK68eRJAYBJs159Bw8pCqMjyxm1M3HK4mitAuE3IJZMGSinauVYlUkwugh
	PUPIP7KI4xiQZAHMLAYWZSQDj2tC7Fivc/uR5owrhpnIRVqZJAPUB1i4u2cQfBia
	AwzaF/f6x82dCfnT435+BL2ISq647d33+7LLhljyrdkTR6T7RzZ/kfoRpIjFH8h9
	f8/Zotpp+uMdqWsr7kB7dnFF3T8bAl/c9qagTh75KWa68m4bJ612LeF5viPlY/gS
	45/j/1/CwbCYg3b7BXOnWXVGqRUZXBCGQLBO6A6hIELEC8kq0s2l2fk8iW0Izwa1
	Inc/SA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnet439-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:01:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b54cf2so4815347a91.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781089267; x=1781694067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tV4HY9ZnY5FGjZHgR32ng40+lVhKsXil6i71ZkDu+yA=;
        b=HajOQKxgW44fWdr+77hGyUYRhTZG3qy1soT2Kg9xotdFviypb1ad6Xdy9pFmGmQyZc
         gy8Ln9Y7488AmkKCFY1jDrOfcpd8gqAh3uHjSoeZiqn7v8vA+hLWKI4cOldzgdUbamCn
         IHFATe+0iKQifeZBwfnhVsvJObG1ELoIVjWctMiuv4N5nDDA8NigHsceXiKVqJ561rYu
         n/JVGNBVnzSCTUh4nGgA5fqZ4ZwcCXSTneqmyhvXp12BhnGzR191mGOx9/Wbr1HRWzED
         uM37YKnxhoEQ6bejdTd8DVvJe2YnlP9FEyPlOKncPoGx2XM8dJoYe4YTfh+8YvMpAN7G
         LSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089267; x=1781694067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tV4HY9ZnY5FGjZHgR32ng40+lVhKsXil6i71ZkDu+yA=;
        b=B8wBZXEq9Uvq+H75TVLbKaTrUDLEKWQrQIz9D4UpSUa6cbORiOXQDMeUvkfrYALzIt
         1rMo5Mm8FbxnsRKKLz4XQNAyNmZq2yHkYzSm4dsId0Du1TK+Q0Ww/i2j7FztcZ4HyrSy
         EaKzYqMCR4JhpSWSlt3bTsgERBrL/1x5hAmDgRMXtUntqgBdW4OUaGWO+4thNNnsj/nb
         hfvJJisdlmIaRSve8QZmwXxNw/loBFldhO0J1VF7vSPHQHWeGjen9wAyq0r98TkDXGcB
         9+iRDwF/j31ODHh0ICohQ9/lfw/aStUGChv0RjKMG8C/GhQADnQViZKEv2HdNKHd0NvT
         RWoA==
X-Forwarded-Encrypted: i=1; AFNElJ+goIN56+UZDdF2zOJCD/wxNaPqfIWpbkeJqUz4Inxg1yWHG1hTroIYDLoinMFGzJkjwkjKNuv0XRlg@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ2cSzEj7ze/iNlwcGi+asOKRwF4G+UTDR9P4fKjE9Nv5eom5r
	lV92Vcs3oUk9EmI1xFqO0t+dcYpm19YuSZIwmBSWve9R3YyWzGgVZJ3Is4cwNcXj1XI/NBV3bRa
	LGEWOT8WlOsTTu8I8KqDQyTbbSAImewdveCCgCs6rTS4IiT47fb32M4gewKsnZ4h5
X-Gm-Gg: Acq92OEFReCXO7+CkY6pFU3P6VT3Kis1I2HCOKNLDk+1RlpiTES3+SyBlsSfI8/nG3/
	9yLbPIO1GGVqUe4FnlMQ24/G80JiaA5PJYUyx4bvS6283hrP2kcEA7WsXYTja1H5eOk6tgopSMW
	Yzi36QZgTKU41ZH0soGRdNRVlfSonivMpXlnL9GG3/zniP/j2VzfTuEgGrvFncXMHI5w5hKlQry
	8kS96GGl+wP9zV/Ou0YirsVWsAefe8Pq/QX5CEKTlMIFrE9u3YBzic8ESNBKw4087/Y7oZG7tCq
	r+mnCiDdSQibHGlqU+g2PVC7uUihhtkYraoi2ioTvRkGZWGS7ryNR2+Q2HK22f8JdpIKeDT4KBp
	C9fnZ5iEJqwczmYO5TJRbjO3Ev7uPeG76CW8bGIiFz89a4GcMLBD/Rq0a38O1cUx+UIpLVe2KPr
	JFpNdRGm3wB7yKzLabJGVOCjsvR2T7tK3i5KF7VBSA4Gl0CyweBfI38eDaObvLyd6EGmM=
X-Received: by 2002:a17:90b:5787:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-370f0284a87mr25709374a91.14.1781089267259;
        Wed, 10 Jun 2026 04:01:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5787:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-370f0284a87mr25709301a91.14.1781089266711;
        Wed, 10 Jun 2026 04:01:06 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376246afe17sm3535131a91.11.2026.06.10.04.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:01:06 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:30:53 +0530
Subject: [PATCH v2 1/2] dt-bindings: PCI: qcom,pcie-ipq9574: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-ipq9650_pcie_binding-v2-1-69e27a1fbf1c@oss.qualcomm.com>
References: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
In-Reply-To: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: feR0BNItJIE-EpKRSaWFvQI5TprYLi6W
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2943f4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=txNWhIGMMpap704yvqUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: feR0BNItJIE-EpKRSaWFvQI5TprYLi6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNCBTYWx0ZWRfX3DG9P8b3Eacd
 d1DtAoQSV29sAY9/02bpE/h1hl4VYUrjW9JLnnsuseKEpCWnY/LSVHzpmSscAZNjq+KNzF3ZaXw
 aUYy95QSMDe0epb2Q72ClGcsttxxk5pabgJUDuDbqm9TPLKExKC0XNPTBTxBARkHt6hWY0XLL80
 oqI27H7hHJzJ+AOgDHtUNJG4Y2IFZtB5V/P9dtgRq8qigv9NKksuZYN/CLdvGm6jByqXVAaWAIi
 60CdwAukU9pr1UdHjIIqsygBHr1JQo8AKR5NIue4FtsN9DVuG9zH1vpH63HHCjsu72gvas3Quvh
 NqOs0P0urXBjOBlPueX8BWah6xa1RU977qEwcHPnHGCxGxgtc7aE60IBgOnECzg4TQnNxgeMmPY
 AHa6CyQq/Yj4/ldqJ/ddsiCMm8psAiXBuS0H/cbcvTpe/FY0pwTIu1u2BvncSechycigXN/Pw/b
 nlkbzIDlChjBc7xLRyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100104

Add the IPQ9650 PCIe compatible to the IPQ9574 binding, as the IPQ9650
controller is compatible with IPQ9574 and uses it as the fallback.

While at it, make the global interrupt as required for IPQ9650.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-ipq9574.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
index 4be342cc04e1..e92acddb969e 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,pcie-ipq5332
               - qcom,pcie-ipq5424
+              - qcom,pcie-ipq9650
           - const: qcom,pcie-ipq9574
 
   reg:
@@ -82,6 +83,18 @@ required:
 
 allOf:
   - $ref: qcom,pcie-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-ipq9650
+    then:
+      properties:
+        interrupts:
+          minItems: 9
+        interrupt-names:
+          minItems: 9
 
 unevaluatedProperties: false
 

-- 
2.34.1

