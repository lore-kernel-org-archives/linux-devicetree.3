Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458533;
	b=MOSTn1oHAhbIRvJ6QT3ryznNUNIsei7CEBj4R/FjkI0ipoBaXc6rlCjT+sFgV+AZw7MK
	 6dFZ7LKaSasoUT59HJFWdagtKnow9noFo5a4La+ZZLr+ElXxStuVvzhtiGwnPxNalRgoX
	 zfvbsTMepAG9OFMjqcOc+0ABUHMhM3IDwTGP31XRjw3uotkZizyPot3rsA6W+lKe1Mlap
	 mT/4xy+Xr8pLEv9DdDywlXS3o/UbitDkbR1Ujpp+DnIRzn5IQnYuzx0kCrFVAPetKk75Z
	 cSoX0TdkDZOL2qnse/LjrxNWC6E97s23xay63a0t95Vpn64YItIcpCd6iZN+k+DPOhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
	b=YuWeh6L7NPzmaXf+dSuvTVFNRARif5tMMhzGNDPz1PRXJfCjIw0uPgReahUpjqmjNAVY
	 1iXwQZUYn9rbl+ndxGGBwaC67wd2zikYxuZPcety3FC/9lmd4RPK7OEH59c9gHeEX9jlZ
	 mkl5049l0OBqMgd9ClSSu5klSG/B1MYL5XIzwh5t8wowj4ZUK9s08RJgx5Y68HQ+ncze5
	 ikk1AcbtrBIRg7QmQc/w+oKuxLDkT9jY4g8JZz8p/Nkj9otouyIlFUf5ivn1m0x6LpQ0S
	 TMO2hB/Mcnr9VmqcrfKQ42wdD8SRYYcoYhO+6WmNI57MLfzGHDaD9yvZUTMVldoEkgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrs0eb9y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQwjKs8d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFA9606A330
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CFA9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrs0eb9y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQwjKs8d
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnCF1861204
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mjs3rlDnLUk
	N31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=; b=jrs0eb9yNOPRhUgP+oR3l6ZbbnA
	XB8+idsJKDEa7iqJD7cM08ya5idCY31w0TC4sx1eOIbdKn4zwDsYyXnUBF+CEh8P
	WsYPBDT53QOTRtlXkgUHBqp/xeF8WYGzYpTXRj50EDNij6ucnnlHWYpUhVz1Tf9H
	avtew+NWAJJT0GVd+SiXxQ7JiTQjDfIjPNYU/UQyfHdrqmfnrXc8L8wxpQkfLKDZ
	9lFKYSZOiiqvWUAycaZ2151OkR/vaywddhtMflhLR2MkV5wIjNbHaU2ru5bYPMmx
	YS3RsrvJAnZL1daxaLOJDoHyAfOlRFatZAH/zF97x78EiYb70uqp+CIkM7A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2taq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so4030880eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458531; x=1796063331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=IQwjKs8dahs3/GxFhjLsN5QmRRRvrFQsCKgmPenRMU63mw9FyN+TU1Pv6c7tQaX7+z
         LmgTADiVMXLIr5jIlH9xYRXrt7jmUI702c48w5Lb89LCTcixBeCDi0BZ+jalCJrFlRc9
         y0qBdqWaBZJmMQmz24Xw7kQUatkQrK0kvoEICJLgjM6CsUK6+d8ilCgKrQa7UWBYKXIA
         94m4W1YKfX+1WTZPr9/vuBXa/7QSoZ3/1jd6FiD92cOxnmjxzLUcOhvglWLD04Yjs02k
         AkKI3IQDDzM5B1YlbT5qJCRw5aKavS7O0eT8GLE4+jIpOzCXlGOjiJoaGUZf/8OTi8jA
         1ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458531; x=1796063331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=SoBkgbcY/Zh4R7UvARnizUtKWEyIIglzy0mMw0avN5B4x1XIa2hkAFCRUaDRf3nz0d
         1kMYYutYDJX5VjExmeNEOCfJKIlaBCt5oJtvWLWMlbHGsPLVtQJiB28uXMu02F4Z0WFC
         Wz+nQPF5Q5G4xzdEU8NiYV0NMsHuc9AqJEybmxzhFRD+UDX2yrxbhxsbAr23bsyJzD0w
         d+NJKWln2yZQqUWMBLe6fvSXYlPjHMQiMbjWCdi1+g23s3aMwQMgc7qJ5ZI1vMxl/teL
         Du/deKjLeEilSD0YrU370HDJ0XF9kaX0nlq2cGx4dqGK5BCcz6OXoGmNpPLG7G3xrPmv
         yuTw==
X-Forwarded-Encrypted: i=1; AL+hErE7wSfy98cE2COBShicmUL8B+EzxACO4Su6s4lmsrMbR971Wcj4D5xfLcMsbKBDiXtJfGWk/bDiNLJG@vger.kernel.org
X-Gm-Message-State: APuU4Z8dueFlmEXKyfR2stw6mx73zYyBVv6tBR5g3qq1Q4t4g888X44k
	RR8j0ygvHI1gpObUth1OMvA/7BStNuEofztWutX+puWI+YhRWfVik95PFCg88gXgc4AIUp1on0w
	gIk43G6f6dMI5fu5O3btAH+4ol32NOWTecQx1nmmjAkDxHZG3PS2412TTtWXCPCp/
X-Gm-Gg: AZFdTZfSbJs2y++9w25ZQgsmbrD/Q0eW/s9cJi7jRGPHEV0HQjcaJHnOKU37VUmOnYD
	Zlv0gsg/cqjcFLnDxQ8nljDlMUeKivoB8AZuMCWIajZ8ssm8s04dQmroKSQV0ovzY1P4aThiXP6
	2s3sAaaHTZt3VTyfx8V60+sP3VbgplPe7kSX9RkuLXoUehPOGb4NpqNF4cqXdDSTKBiq/vsi+so
	fHcPn1bfc8EZ7OjPc68gP/rkBDyggSJcEXZr+aFDYDK2NemCQfwiaAnPvozfz/raKmilqHR8bet
	ATHNGAI8RJ6tGWUcb7C9XHbLeYOLk5KkLfGt9owYzltRk4nDim/zFnaV2iRyg15utbn6aG7cDRJ
	hlQA3XlJtCHncVhXdpHdgWlP+kI4IbUXfF2ROz7N+pyEvRKLfz3F4fQA0N2kJuqJXtGAXeUY+iY
	RM0P9WpJSEfzyghW2wKvuddERikg==
X-Received: by 2002:a05:7301:d18b:b0:386:b4f1:dab0 with SMTP id 5a478bee46e88-386b4f1e04fmr3217103eec.1.1795458530765;
        Mon, 23 Nov 2026 10:28:50 -0800 (PST)
X-Received: by 2002:a05:7301:d18b:b0:386:b4f1:dab0 with SMTP id 5a478bee46e88-386b4f1e04fmr3217073eec.1.1795458530113;
        Mon, 23 Nov 2026 10:28:50 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:49 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/7] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Mon, 23 Nov 2026 10:28:41 -0800
Message-Id: <20261123182847.143892-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX0KS6F4pg3Hko
 flESp1IpclcmuZpuPsib+m6foNaYpeRqWVo02dPHheSLGFlnUaIz6OajbqVBHjebkBAdu52HyIJ
 ZD+qeI+1dkPfMOBUsUfjFS2oR/m3tt0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX71sRxWAaPBQe
 aFwBhY/kB6Wmcw5P9c4+97rLwE7sWKVspvalBwQwdd5ZSoIePNh9abfNl+pNfSh3DLN33TeJXUC
 b9VnsYMye/T5Lw3GrG+Z4GELq+sYl+3VQ/KxFSJP3JCPiIzFOYoWWjJ1IDXr2ipSh5w27hbpbp+
 s/hBZqYvaxzZ/jEY8vY8wykELUChI9UVrTspHBdvzTCmrX6y+LXR+LoVXYdD6lLMBDlDPDVSSWo
 xTzpKeV9Igobn3ylt0qrHhiz359nZgePv83HJZFwXFD+xthpuFurxU23lIqDmgUqYAucK/AlvBe
 IUDat/NgDhfZCwQmQoIg0fxwAIr29jqON19UVBieWXM2bTLHgFE6lP03v6iX0xZn29N9JFWRNPO
 5KgTbXK2LCxs9AkaR9jyy54CMhnYAvBRyJJtkXVwjjHZS7tNs7jNL/NLbU1cvzycoWEtccpc/cV
 w70caigEF1rlfGKDZ9w==
X-Proofpoint-ORIG-GUID: Dhwz5BPwkLYG3OH8MGCLGVJlI6fyl80d
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0485e3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=RJ9lep_nkaVUh_m6BXgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Dhwz5BPwkLYG3OH8MGCLGVJlI6fyl80d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

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

