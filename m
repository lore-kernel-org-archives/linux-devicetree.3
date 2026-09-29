Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4634EDCDD
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717721; cv=none; b=HLpQfZurYig8VjGxr8QsFqBehSlrnBsS+a5YcrwXz1OJcK/WaIxLxoa7/76N6cRu3FmtoeIfokQc1cGPCswZMu9ZrFslvK4nVCm78RimxSe1Kv3HNVejyxerL5rKbD5Bm1MzA3V3JjyQgIEJVEKF1FXYjveHx3FY56JjzZVQlnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717721; c=relaxed/simple;
	bh=NS67m12FohtVTM0LAceMS1EJYY9P5UQk+hL/TSpoW4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CkAvv/vWZgF+wJBYPNO/Wnj+Mph/LbbOFyxrrW8WmTvYffu5YOwwDnfqb9cjD3wqnURaRfkN2OmTmkm3ZfFmLw7hlfu4L8d2jBKEydVAVpLjJfZdE6g64ChWLBWMtthHV3G/NljpdoN/8zBA7xZPjLCWa6w4lGXL3t+3l8sGJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/1nLxeL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OhFQ3Fnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/1nLxeL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhFQ3Fnd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THTmI5826667
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mjs3rlDnLUk
	N31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=; b=K/1nLxeLKcYSOxfqweu66c3+R1p
	QbVy+Iu/N3Uv/tIvQL3P1IdYDW4f5g2qsi0jInw/n7+nqih3o5G55Bc8UXRd4QZN
	Bh1u1YgG+S2HJml3sFEHmvFsHJ8VeLcbbjIXGilmXr8wkdaYKor7dd1/bE3RPn75
	WI/oG01P+QNmVVaJj6kwwpe+vPQCSK09wIvENKbbJA2I3pbYaD7WJXCt5OkpE4kk
	pzYYcRcRTFd9WlRSSjGV4rIdHQjOK4WTV8Y9ewDwirLoHHwwhpa3GOcNf7LQQ4AV
	TtRS/Rb9R2yn4+2ULGg/ECOmuGrNTCycm/sAK6Zm5iNfttMuchshr/eJEVw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0hsh0x72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:35:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so9274097eec.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 14:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717717; x=1791322517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=OhFQ3Fnde+X8RiPmzF2tZEPg6aG7CH0/5Xoj1+kHOJvIluaCsjX3aWSXqEOLrYWdnP
         PZVPuN1+0Y339dGauDBXVFq6IUVcWQKh02fOhWcfrhvMi0cPsEiMChBr5058zjD3bEz+
         0e+AiD98O8/U9tp+4uF15ODFDnsJrNgO8VkKSPrrUayAD+x9A/RS7ehvxQa12VDdfHHI
         FlLNVYkF4Na4JgkZX5yxEf7RMh7eDJbHkBCObg7uY+w6dnvHuagDbZF3c4tXdVR1413L
         TVQ8Fa9CNPXG50rdEVk3RPTzKGpNdRp9fTvLTgzpF/KIB8/Wocein4508EKR75BKrBms
         ghIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717717; x=1791322517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=AP3G5fgtObUq0EJ7Z7mDke3D6J9ti9mGNRU1CLjWEs+8x91ghZSJZoNiw1SgVFUuWr
         dCjlI/Z2OfM0g+xAExNKvS6il3ydp5CJTeXu2w7N2+CMeLLxMGQ7dRBbw4FModDIb4GX
         EdwPQofBQE2XgrBnaRK+E9ApB8HYkGB5lZnI5PGpiaFJLi9gP/eY74q+vXiEmjESjytr
         F3aLdWr68QwXk1fremxYht2Ou5xQyWKSZYVAhMYmUioKDPk3Lpu64nLDiDontdC03/JT
         2Ji5wx0HRlDr/fkxhRyFu/oyHW95p3CmiF3Ap0BTTNox9oQz4GGPMV+xvOWoMDNrBn2c
         XIFg==
X-Forwarded-Encrypted: i=1; AKwUvBwr+LRzPviT/1nIEAdTOZZQQJVn2cicd63MM18FNVSNsHrXdkvwgtLp+aisZrTvKbKOK+kn9kSVn616@vger.kernel.org
X-Gm-Message-State: AFq9FYJy1oFNNfMVChKwSPU6/iNmHETCjbFto7T2NAQNWEnqba2JPfvH
	TH65DtCHxgnddouBYXP/wTQp+G9SaCAvk6a868Ub8zRKPL1RuKPzmyFYQKwR4MpaZXS/U1SfX0E
	ifBOOIxUxiy1NQVIh7JvdAOoRcwpREO+LAr9v4LlotXvp/L3ONBiHXS+DKeV2yloq
X-Gm-Gg: AYBFou0HDuYGINJZauL5p2S77dqpvW59XTwO0iAbicqE4p66zwQzb3nv8IzZCtUUaSK
	X627YNIn0WAh4GSmnYthm63QkEO8tEwxxG1qpfbWVhqQBs6/qk7xzhngtX8exKboIwiJWn3ejSD
	PdmIpjpQzkz2+ctO5M2gS3zoFAPGDbbVUpqRZsYcsLD7s5rRoUulYgcjXr7t29AQCSoHxICm4wr
	ilfZOtzkQfVZLsjGuN4rnGezYE0lDY9wqB4PebJcTUKZk4zjzEnhEhE9hSVv/iMniJ0cmn67FoJ
	zN4rEdF5yrI6ykN6ye7ZVCs9R9kMkPlqKv2m+2vS/YcOisDSkVjK4JLLnpskCCo3vl+WkAPrNSW
	9FfhL7cNoIJOkBMU24Abn3NbZbkrxe/2+RscmPlKPXfL1o0Lf1yU/
X-Received: by 2002:a05:7300:e9c5:10b0:33c:e74:4624 with SMTP id 5a478bee46e88-34c63afc496mr775814eec.27.1790717717155;
        Tue, 29 Sep 2026 14:35:17 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c5:10b0:33c:e74:4624 with SMTP id 5a478bee46e88-34c63afc496mr775765eec.27.1790717716443;
        Tue, 29 Sep 2026 14:35:16 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:15 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/8] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Tue, 29 Sep 2026 14:35:06 -0700
Message-Id: <20260929213513.2401005-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX4Js9QX56JNdW
 Xxz7STadOTGsVgExfT6srX8pdp0xCM9p/yXoZs6ecipgx3wP/i0Kxo1AG0WckWWUbKNkkgSfBlW
 NODeEZISuupPj2Q9RiMrx+CZMnANgUM5VCpMRNDPwelaIro1Flo6g6RvcduvaIvir9e5yZS4p4e
 qTeV+0DhcR+kRV43wcL5+4Tj9fePEBDSosnboPclfaQXpeGKj9aMctXgIR7kiBnxw0Q5DqlRRoP
 EADRZfZMCSw7U4eIX6QOcM87Y8nf7HVYpDo1GlReKCEIkY/F1N/gxh2KYZjf17vipzO7cHFIgSK
 CIN486T3qStt80CVzVXisUOyw7P26AU7g9nyuWyR9Q+l4/bSoeDK5ZJmRZxbdR2t+IA44Wc7EaW
 Sbbfh7sS+u2uKGvfzMRSKBzLMoJJfnp5fxLXr418C7Wb+bNWUO3bwSyl2wjtgubvPHtPDsT9Xow
 fB6ptsEzqM0TvZ5gUZw==
X-Proofpoint-GUID: HL198aqfuSBsGzEtOt-9H4CLc5g6ceOu
X-Proofpoint-ORIG-GUID: HL198aqfuSBsGzEtOt-9H4CLc5g6ceOu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX3wZvJSctn4ux
 vSkWBg33JF1Bt/0y2q9Dt10yrUx6PL6NvxdXs1xPXTw442bTWLGAvOb21HFHTB6+WuwfcYf38fr
 F3gigqLPfmOwj0JWMrGXTLwqTvagw8U=
X-Authority-Analysis: v=2.4 cv=cZZHPXDM c=1 sm=1 tr=0 ts=6abc2f16 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=RJ9lep_nkaVUh_m6BXgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
EUD on the primary UTMI path only, while SM8350 supports EUD on both
primary and secondary UTMI paths.

Each UTMI path connects an independent USB controller/connector pair and
forms its own role-switch domain. EUD routes traffic based on USB role.
In device role the debug hub is inserted, while in host role it is
bypassed.

The existing binding models EUD using a flattened ports representation.
While sufficient for fixed device-role configurations, it cannot naturally
associate a controller, connector, and role switch with a specific
EUD-routable path. This is problematic for role-switch capable ports and
becomes more pronounced on SoCs with multiple paths. In such cases, each
path forms an independent role-switch domain and requires per-path role
awareness.

Model each UTMI path as a separate child node with its own OF graph. This
representation is used for role-aware EUD routing regardless of whether a
SoC exposes one or two UTMI paths. Add an SM8350 compatible for
dual-path EUD topologies. Retain support for the legacy flat ports
representation on SC7280 for backward compatibility.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 138 +++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..90dc104e4475 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,92 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: This port is to be attached to the type C connector.
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^eud-path@[0-1]$":
+    type: object
+    description:
+      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
+      to associate role-switching behavior with specific port connections, allowing
+      EUD to manage role transitions independently for each UTMI path.
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Path number
+
+      usb-role-switch:
+        type: boolean
+        description:
+          Indicates that EUD relays USB role-switch events for this path and
+          performs role-dependent UTMI routing accordingly. In device role,
+          the EUD hub is inserted into this path to enable debug
+          functionality. In host role, the EUD hub is bypassed and UTMI
+          traffic flows directly between the PHY and the USB controller.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description:
+          These ports are to be attached to the endpoint of the USB controller node
+          and USB connector node.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB controller.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB connector.
+
+    required:
+      - reg
+      - ports
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-eud
+    then:
+      oneOf:
+        - required:
+            - ports
+          properties:
+            eud-path@0: false
+            eud-path@1: false
+        - required:
+            - eud-path@0
+            - '#address-cells'
+            - '#size-cells'
+          properties:
+            ports: false
+            eud-path@1: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8350-eud
+    then:
+      required:
+        - eud-path@0
+        - eud-path@1
+        - '#address-cells'
+        - '#size-cells'
+      properties:
+        ports: false
 
 additionalProperties: false
 
@@ -77,3 +160,56 @@ examples:
             };
         };
     };
+  - |
+    eud@88e0000 {
+        compatible = "qcom,sm8350-eud", "qcom,eud";
+        reg = <0x88e0000 0x2000>,
+              <0x88e2000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eud-path@0 {
+            reg = <0>;
+            usb-role-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb0: endpoint {
+                        remote-endpoint = <&usb_1_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con0: endpoint {
+                        remote-endpoint = <&pmic_glink_hs_in>;
+                    };
+                };
+            };
+        };
+
+        eud-path@1 {
+            reg = <1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb1: endpoint {
+                        remote-endpoint = <&usb_2_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con1: endpoint {
+                        remote-endpoint = <&conn_2_hs_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

