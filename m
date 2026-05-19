Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C734DB6D
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169645; cv=none; b=LKAS+Yz3eegCAfVFUUHArKXw9JP8L6PvwHKX4vmcTAR7JjNKdu2NPY/JRowGftGr/YOGTukEkCHKUdJgR71SCSABVgZihxWJgOkFMzc8I42B1z9wjilYLeaQgSwrT/ET0oAf/8g2GAnPUHU9SAQXWV38PMSbfmoWSoPP6CbOAQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169645; c=relaxed/simple;
	bh=/GzJSMoS9msbAtJPMhiojx/3pCxgRir7RfY8D/ogF4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PM/+Ckg+9ES7ekeJasD5fPSVpvfaXIRllmy14KS/BIz7YSJmSyaIZaX/5hdsmC3R5cr/OJazhVUJCyPEwUwHTRypNORqr4iNkVSYf27ojJ7lY75Eo1AJa7aVTRTAeaSThL6duYcJ5LKraxFzzjuwO02Hg0Sn6V2kIN42EwT1uQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTap0Nj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iY6kgxBR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTap0Nj5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iY6kgxBR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4WgEp1252181
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0O0IEIIuy7vAzmzRp9+03b/boaEZMZFLkZCHHXQ2fg=; b=ZTap0Nj57umfjt2B
	kcob8186W3p4l6tgUTyXbxQGnVr34MuzyqqTfIKD38pGP2X+xTHT4UCI7mOQixoJ
	eSZqQN3wUyeHgigsq/bxGj1L0m/EaHrTghaop4drNtpOjX3jhu3vDrO6T+enSCz5
	Szj6ad0TYWGKKi/ZW6zmcGbnqTFEDo9bNU43fcIoxHhivQQhmZdOjncvOJFnxkhS
	Ytwl/55LGF/x87R1zWxLRUbCJ6JjvDglBpam8Ef3DPyjp3AqDlgKg9ZuVUCWXIbr
	TM//Q4bIsU6MLhxkXQMaqIENnreaQqYarGx7Xy3L6h26v6so2rBPHa30PktRdN4b
	SAsEZA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0kj8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso3915029eec.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169643; x=1779774443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0O0IEIIuy7vAzmzRp9+03b/boaEZMZFLkZCHHXQ2fg=;
        b=iY6kgxBRXsDduwU+XDeomAoohf+6+mM/5eZWwxKiAeYQu9Ls3MePYJ5+qFPIGe384d
         hRnKBWKbCitRbyXWF5zeycAaw0nmQaxeBIoS5uSQSd3HdvKbRGJQ74FyDCss3ufDu9kX
         K61rYz8k5ZVBdi3RrtzAvl4xkKtc9qJJlpn0DjhBpyXnJL6+sGGzhk6yvz8s96ss+XEv
         tcbvxxOd5R5jayAmIO5joytoMTiG9Xe7cCmBo8s48S4dSCco6MdLLMs6WQWFFbMShAy3
         bSKpkeKdpi2xNKLtc+KqHRiO2LNeCP4M6/3W4vLXxUsYSIpcNUXgG9PHZfwFggGCTYoV
         hAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169643; x=1779774443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B0O0IEIIuy7vAzmzRp9+03b/boaEZMZFLkZCHHXQ2fg=;
        b=bFeJrIj4UrBjTKYHqgQIHbW0sExptzuYsQ+u7LWZ0hcu3Hs2O5flOUfSuKwGAJXnpj
         uwyk1e+bPrrrIvol4RFLFi+6COJRtBud8HTbKmd2O2I2WoBXCVFJBjdwKRPC5yNg6r1X
         p1gZqjI3rKpP/+oA05rXWoCNWiFgz/jhHf3VHLY5JwGQlz1AfyH/8oaHftJ9uT85+1Oz
         14wo5J9czXzzRsdf+oRk8YdbNe1PTuP8/oqLru3GGiukM/3HdVFFjU23q9ki7FR2Hzod
         0E/INgREWOi0ogeZhjfP3hfnIeK5oLDBEGz4x7WgC2h6z9JaLmzAaDyJVqZ844hUQyt4
         Cwkg==
X-Forwarded-Encrypted: i=1; AFNElJ9SKDwBMNkGACJaH/KV88udRDCoggD1FS79Aiu2c175q/LoLFvGps8KRf3RIBDH0zshu9RiQAaufiC4@vger.kernel.org
X-Gm-Message-State: AOJu0YwFXkYyf6SaW6ferOkKHnDDjQonL8ATThuh3c7+SmPGaqwt4yWs
	qFRGObAx6rCk9A7zgYV5Bm57CLukzgumTjJQvHnOGghj+YOKpstpfXZ4hNaHy1BLn9RrA14QX3B
	9OZ4CGq2VNRfphabkwdaOwuLJcM0jYQcpXTiw9zMRxyq25+Ry5BnnqKXpOFqpMSUe
X-Gm-Gg: Acq92OHRUBLfpMQuCZAHjnzwtzoB8CTp2UblsPqoB6ylGu1gPM3X1v8NmSXSTnOCEIg
	EiOK0x7wy1nnGtwODEN8SGyhyexHfmFHYjvQg5BEvhLTVW/vjlaSkp/cl2ROwIo3fSSQw+dWw4n
	mTZYsdcT/U/ndKDfpmGNDt87OHRpSGW7vm4cJ6pqR+NzrVCizM7fBg9EuJy93ni7w6ygJV4haY4
	zno6hZMkQ1sqP7bpkAcztpcYcWpZ/VRhMP1zCVzOPB9PTVKD2OB8me1hN6CuaYoB0s+7NbpObkS
	26goL/QzehVx2VjM6gPA/GCqZzRv1ZK/uaclgBSdadM5c7oXbVsSJzxkDG9qHaFxV0LCm3hSaPI
	TvqGGo1Qoubh5jBZxpHpX89ERfidvkE375RvNvX5K/MQM3AVWB0x9rrHswf6jKFkPmQCz
X-Received: by 2002:a05:7300:8b95:b0:2e0:1f09:d924 with SMTP id 5a478bee46e88-3039813cab5mr8494399eec.5.1779169642590;
        Mon, 18 May 2026 22:47:22 -0700 (PDT)
X-Received: by 2002:a05:7300:8b95:b0:2e0:1f09:d924 with SMTP id 5a478bee46e88-3039813cab5mr8494379eec.5.1779169641875;
        Mon, 18 May 2026 22:47:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:21 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:12 -0700
Subject: [PATCH RFC v4 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Add glymur-qmp-gen5x8-pcie-phy compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-1-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=6963;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=/GzJSMoS9msbAtJPMhiojx/3pCxgRir7RfY8D/ogF4k=;
 b=KgruVv6cFJ5PFUCqlCf6ohCZdOolIp7KX7leRvFDn+Z3pnbdwhuShekuUrmk8p48yUcIBrD/Z
 NUUzCxoL1fZB1aKAxH/vkl+NJ4PHcd3fVDuFb7xeQpt+Rt7uohKQgcU
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX+2MHbUzlG+Zb
 9XsLCqWHsaeGDZswa4kk46tqW9LrudEDNO7M6NseIB9NbZzIq+PJwDZ09yoGMeHerhed/pVZmP3
 GjlLv7UgU/gz6EbUNIoHpkM7+F5t9vt5HH1owqpkjPKi9IvQ84KPIrIsSIN9unf5K7PQijjdHXo
 qd77GN/B+K7rP+QVNyNrykPJftGU3uWM8IPu+RN2R6fx6plTpabr2CNTse/ZpFa4VUrNQ2uC97V
 Ii4TQ8IyiVj5I6XSAVNxkX44F5XZKT4uRMAvVZaY2yjkaTrEBpwsn9zujz2bx8QhDObkaDOGJEe
 0Wyam7kU1/pIBV3CG0FaxpMUfjdSTX0qdi92/c3Jf7ahRKyqawjXRW3V2/h2lOnuecaopzWCRkc
 Qu4uMigco2kVM7GaliEQuK6bVuj6WSFZD5oAKD8YpJJTyDAAAs7Hg/HYXLULziIeJARdntSsBs3
 oQPt33Gw8kjY1lFGg2w==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0bf96b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3VQrzie0oMwTYjLhUJMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 18hnFBxOHyUNEm106T-W-5iVSQEIbFsU
X-Proofpoint-ORIG-GUID: 18hnFBxOHyUNEm106T-W-5iVSQEIbFsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053

The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
PCIe3a/PCIe3b controllers. This block supports two link modes:

1. x4+x4: two 4-lane PHY instances are exposed
2. x8: one 8-lane PHY instance is exposed

Add qcom,glymur-qmp-gen5x8-pcie-phy as a multi-mode PHY compatible and
document the new link-mode property, which selects the active link mode
via a TCSR syscon register.

Document the required clocks, resets, and power-domains for both PHY
instances active in x8 mode. Use #phy-cells = <1> for this compatible,
where the cell value is the PHY index within the active link mode.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 140 ++++++++++++++++++---
 1 file changed, 126 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..5877e40244ba 100644
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
@@ -58,7 +59,7 @@ properties:
 
   clocks:
     minItems: 5
-    maxItems: 6
+    maxItems: 10
 
   clock-names:
     minItems: 5
@@ -68,20 +69,29 @@ properties:
       - const: ref
       - enum: [rchng, refgen]
       - const: pipe
-      - const: pipediv2
+      - enum: [pipediv2, phy_b_aux]
+      - const: cfg_ahb_b
+      - const: rchng_b
+      - const: pipe_b
+      - const: pipediv2_b
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: PCIe PHY power domain.
+      - description: Additional PCIe PHY power domain (if present).
 
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
 
@@ -98,13 +108,29 @@ properties:
           - description: offset of PCIe 4-lane configuration register
           - description: offset of configuration bit for this PHY
 
+  qcom,link-mode:
+    description:
+      Configures the link mode of the PCIe PHY. Some PHYs support multiple
+      link modes, such as a single x8 link or two independent x4 links. The
+      link mode selection is performed by writing to a register in the TCSR
+      syscon, specified as a phandle to the syscon, the register offset, and
+      the link mode value.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of TCSR syscon
+          - description: offset of link mode register
+          - description: link mode value
+
   "#clock-cells": true
 
   clock-output-names:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Name of the first pipe clock output.
+      - description: Name of the second pipe clock output (if present).
 
-  "#phy-cells":
-    const: 0
+  "#phy-cells": true
 
 required:
   - compatible
@@ -130,19 +156,40 @@ allOf:
               - qcom,sc8280xp-qmp-gen3x4-pcie-phy
               - qcom,x1e80100-qmp-gen4x4-pcie-phy
               - qcom,x1p42100-qmp-gen4x4-pcie-phy
+              - qcom,glymur-qmp-gen5x8-pcie-phy
     then:
       properties:
         reg:
           items:
             - description: port a
             - description: port b
-      required:
-        - qcom,4ln-config-sel
     else:
       properties:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+              - qcom,x1e80100-qmp-gen4x4-pcie-phy
+              - qcom,x1p42100-qmp-gen4x4-pcie-phy
+    then:
+      required:
+        - qcom,4ln-config-sel
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen5x8-pcie-phy
+    then:
+      required:
+        - qcom,link-mode
+
   - if:
       properties:
         compatible:
@@ -198,8 +245,40 @@ allOf:
       properties:
         clocks:
           minItems: 6
+          maxItems: 6
         clock-names:
           minItems: 6
+          maxItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen5x8-pcie-phy
+    then:
+      properties:
+        clocks:
+          minItems: 10
+          maxItems: 10
+        clock-names:
+          items:
+            - const: aux
+            - const: cfg_ahb
+            - const: ref
+            - const: rchng
+            - const: pipe
+            - const: phy_b_aux
+            - const: cfg_ahb_b
+            - const: rchng_b
+            - const: pipe_b
+            - const: pipediv2_b
+        power-domains:
+          minItems: 2
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
 
   - if:
       properties:
@@ -223,11 +302,24 @@ allOf:
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
@@ -237,6 +329,7 @@ allOf:
               - qcom,sm8450-qmp-gen4x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
+              - qcom,glymur-qmp-gen5x8-pcie-phy
     then:
       properties:
         "#clock-cells":
@@ -246,6 +339,25 @@ allOf:
         "#clock-cells":
           const: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen5x8-pcie-phy
+    then:
+      properties:
+        clock-output-names:
+          minItems: 2
+        "#phy-cells":
+          const: 1
+    else:
+      properties:
+        clock-output-names:
+          maxItems: 1
+        "#phy-cells":
+          const: 0
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>

-- 
2.34.1

