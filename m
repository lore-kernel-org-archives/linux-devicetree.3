Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EBC2253FC
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061582; cv=none; b=otV/6NXqpRe/ewK7AS/7XZnUrBhUeIr/oR9VzB7Zc4zq8Rku+y1iqmoS1dEkuyop0Qzhdhj5XRzca5KL0ffP/bO2/lIdxA9SqmIrcICterYDh6HAqnA5K7mtc+fnRwFSFdCD42iC2/ti1/5k4EyEEd4r09gLyqVQ00KUbcSKMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061582; c=relaxed/simple;
	bh=37ntqnYxbt/tnoGEfVBaNuji1qCkMWieDHTWp7+jFXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ajqr2/pGXtZ1NDw8UG/jmGGP4HLInjZ/ZAHbbjLhdlDBUlGJJ29N1QjZIrb8Ka7lld6SnzY0yV7kI2OuGOrC0eYRNWjeW/JD+gAUHt0gs4r5oFV9rnVwCc2F0qWm/gzkwkZ3mRacHCKFzneFUAX76FWx/eKI+8VrC+zh7moqjiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKTbSHwo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewhgPXPY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKTbSHwo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewhgPXPY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6JIvm3688005
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9AXyPY/o/ozfLjxbr26E/dTeHhi5BgDJRfDxIqtSHo=; b=bKTbSHwolqdvs+QB
	A1cE4zZOkumIOmhOUXJM8kZaGHsKgY68iu65CqxzoeKZ9eDizAi8hyFexSj0QFmd
	a6/KO8W7E25TXRq7UOMKTPXddTS2twp0CyVLR+JZAEOV+F8vn1x7OvJjIZab50yD
	6sSdPYhH4clowS5NRTdTrNTQhobvzhkXpkjn8oyZv7RLxYK+VcozvCTKapk6l+Ry
	mTIwdZHj9guDC7wfZfXK4Qa7mcWXXKqgTqFgmYmVrYwB7NVewv37vhHOw2FqPgJr
	wnS6GSssisgjGkwwNiCGd2azN/4NtFFrb3XHenfLswdeYyTUjIHe1UIPkBIT0mrc
	eq+UIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhv0vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:26:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so5479283eec.1
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776061580; x=1776666380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9AXyPY/o/ozfLjxbr26E/dTeHhi5BgDJRfDxIqtSHo=;
        b=ewhgPXPYtgDQyfgJh8hA3ddedjC86ex6K2u6wXUFA5cPzKtdcDgFe9uG4w/SesjZNN
         /W2RrtWnFiA/2cWuLC5fo2vb2gwpgsnkPT5gnobrClub6+3zkLYjt9k/gSPbjHNoCqNo
         tZGH8c/AIem5j7rjvlRW90qdjnQWPUXH0fNjgV601r3DM+VGaOg1BqMOQw559waQx1cM
         YDkXQoUBxMujT4K586v7AMBxghKghprp4R6AsHcXW0onKajTtXm7BcQUV/SPWjDS7BRM
         ROuMoKw0Ah+MI8Gajh+K/UDQSTw1nkcQz6PgMjmaQOLREeiJYtcGtfAs3T665IrK3/gA
         kDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776061580; x=1776666380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T9AXyPY/o/ozfLjxbr26E/dTeHhi5BgDJRfDxIqtSHo=;
        b=fWwOLW71EZlyb0G4EqJy4k2qv4UM9FV86pDpCdte9yuyH0O3wmQjPjyVLb9qAvbTKt
         F4PSRcKWHJtjDz4IaNkDCK1xyP6n1bYapBjbTDCrYnC6QGr4GoPeEwMw3CIMkVT4KIgp
         FPA7EeQb2dHPFFSAhmN6tYWjUCfIrxoFFtpUDmGdp7HhntxBJw+WDKgWlUfI/s97MpqR
         yzZtGta30bfBkwNtixmgfbEsbX/tv3Ui9YXwVqm7SRt4NI5XiBR0t984kHGEgNF22x++
         pkI28Iq5/WAjukEIRckr+xZeNWs94BxROEI4/S1zD1527+YeMicj7PYRSSAHwvc6lr1M
         xToA==
X-Forwarded-Encrypted: i=1; AFNElJ8OK49KIALhJqt4+EPg7vN6ICFvxnwqaHZNA71d0lkU2BYEHWlGwfHYil1YNUHoYdfoa/NFfwycVISb@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGGpSB0GlaAyXPueLj9He0QCyENCe5o2catGmNQhm4Nmx++mB
	f8pVmY0t+xBcz7tHQIY/Us/OkmWGisjO2BYZiOwI5pjULtvdXaIdEEHZrL8hxAhtH6l9Hoj2OJO
	DRk9lpGqY6Jtvtewbu06z7LGVHBknLdV9LygHFcuxDN2DdrPMg8cFZoS7JH7xwVgq
X-Gm-Gg: AeBDievIaqhjGJVF6zutgRObkGdbTKd9K3mqdtu1RZpP+oq9a8U/DDItBWXPwYDny7y
	gOA2SoJvlfxSl6jcXaqpDYrTcH2u895VSIEeyR0uHbeEmrBTGP/9OF/pWT88javZChsaV3DHSsD
	jY79WNwiFHpQHlka643HXcQlJnX0pldsVjzU2KbSJQer7oG2ebwGCjU8+wtwJvxPLKy3aNTwBmE
	MfElnOBujkjBpU5Vk5rc4RmkdXvBqObbsC6ZaBc0B0/9kKzbdF4Kt4n4N2wRWRzYeuDxCf555qg
	ygnvfoEGWSnGQrkO+v2YMGsAcyYmjHM4hhy50GVYU5k9WAnVlEkTa/qQI3kyhUi9VmkE+0QqbmV
	X6mS7sGPFYdSSXZ7tyqhkNw5wb9VPRKRfhrSNhxquL0iAdTvbONqoQoojViwl4sfO4cfd
X-Received: by 2002:a05:693c:2c96:b0:2cf:28e8:d784 with SMTP id 5a478bee46e88-2d58945c9b1mr6043577eec.19.1776061579822;
        Sun, 12 Apr 2026 23:26:19 -0700 (PDT)
X-Received: by 2002:a05:693c:2c96:b0:2cf:28e8:d784 with SMTP id 5a478bee46e88-2d58945c9b1mr6043560eec.19.1776061579289;
        Sun, 12 Apr 2026 23:26:19 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm15260935eec.14.2026.04.12.23.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 23:26:18 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 23:25:56 -0700
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
In-Reply-To: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776061577; l=4060;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=37ntqnYxbt/tnoGEfVBaNuji1qCkMWieDHTWp7+jFXY=;
 b=h6UmKLAVvuw2ViAHtaZJ0N1KEw+2AZsfRlJ6f9XTCia8lln/Ov2M9UD4AHf7YtyeyzuSzL85A
 4Rk+pFMhoSpDN2CMzdPm2prdQeo1NHPSOE4T/BZqD8B57IpE6RgiG5w
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2MCBTYWx0ZWRfXwW/DZO0MKQu0
 k34tHX89LNLExQKW74UINHUXVxJ/McJ0fVeI765KMMjcWGjPLckVDHctRdL+AhCytlP2s1rKI3+
 RmUSBlk1g9V7MpWHpuRnimO7jzH+ApCXG+xxTzq2mezTOCMz8ZeJsuDbaS4cKFxWnpTezDSg3Ir
 QnJuf2trgRHGwOsJ2JKYuJa5GXSqmxjwh/8Dlo6Z47F5GwsGXNGlVpP1xiutL3Dltoyh/Rv0Byh
 CBr4ZOJ0rT0xGLbY20PQTtdo2Zg6P5DvYUrWJB9uwajB771tvsuSXQzcSEbtyM3zyX5ya9BM4x+
 mNMoszIFz6EphIFQFGHGvTIcGzI1NDa+3SOowivU7w0XP/em0suNbo2U8iLMAfrITFLQEx0bBTt
 zODIRyGV+v+IDVQx9pf/QaInAU1I+5px1H4KVYuogDEMp3ibJU8QcNeyft7ZsXwjk0aUks+oKuZ
 VJMHukzewPlcOerPhWw==
X-Proofpoint-ORIG-GUID: REyaGAai4g73Kgkj9dXi3I1p_MUpwwyj
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dc8c8c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HOj_8Gw7N_1wnwFbGYcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: REyaGAai4g73Kgkj9dXi3I1p_MUpwwyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130060

The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:

1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
   4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
   follower to form a single 8-lane PCIe Gen5 interface

In bifurcation mode, the hardware design requires controlling additional
resources beyond the standard pcie3a PHY configuration:

- pcie3b's aux_clk (phy_b_aux)
- pcie3b's phy_gdsc power domain
- pcie3b's bcr/nocsr reset

Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
8-lane bifurcation configuration.

The phy_b_aux clock is used as the 6th clock instead of pipediv2,
requiring the clock-names enum to be extended to support both
[phy_b_aux, pipediv2] options at index 5. This follows the existing
pattern used for [rchng, refgen] clocks at index 3.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 53 ++++++++++++++++++----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..14eba5d705b1956c1bb00cc8c95171ed6488299b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,glymur-qmp-gen5x8-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -68,20 +69,27 @@ properties:
       - const: ref
       - enum: [rchng, refgen]
       - const: pipe
-      - const: pipediv2
+      - enum: [phy_b_aux, pipediv2]
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: PCIe PHY power domain. For PHYs supporting
+          bifurcation mode, this is the leader PHY power domain.
+      - description: Additional PCIe PHY power domain for PHYs supporting
+          bifurcation mode, used by the follower PHY.
 
   resets:
     minItems: 1
-    maxItems: 2
+    maxItems: 4
 
   reset-names:
     minItems: 1
     items:
       - const: phy
       - const: phy_nocsr
+      - const: phy_b
+      - const: phy_b_nocsr
 
   vdda-phy-supply: true
 
@@ -183,6 +191,7 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,glymur-qmp-gen5x8-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -201,6 +210,21 @@ allOf:
         clock-names:
           minItems: 6
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen5x8-pcie-phy
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
@@ -223,11 +247,24 @@ allOf:
         reset-names:
           minItems: 2
     else:
-      properties:
-        resets:
-          maxItems: 1
-        reset-names:
-          maxItems: 1
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,glymur-qmp-gen5x8-pcie-phy
+      then:
+        properties:
+          resets:
+            minItems: 4
+          reset-names:
+            minItems: 4
+      else:
+        properties:
+          resets:
+            maxItems: 1
+          reset-names:
+            maxItems: 1
 
   - if:
       properties:

-- 
2.34.1

