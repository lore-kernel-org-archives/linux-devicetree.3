Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328761;
	b=TNMIXGUQdA0rS2+XT325Z7u3qbILmECPR5VCSl9iIX992MAXI4swRmvwOARRpkAhr4UB
	 fjfVHRm8B/I9rphwe9HcyqpsUlG3u1jGw2hinuMm+dtVdr+w3tr45awQ0G24hx6OgjAKw
	 +/7nk6HcXdcc4TWCl4M9BhcvGTe3XidQ4dXNloeeRMipgHSVwZs8OOiQPkloi9aT9g2oq
	 EnV1PKJ/G/sNM3kZBnnjJinOXgvW/5c6sKlrZoxUGJs0xUS/iY5BX0BFFnZdwltgkzKVJ
	 EpULbU16T4USmqxLWxrqoa8yyvNehXkGdC67YErsjLCXEmch+XyZFQmiRawd/6kTBhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
	b=HKPoQLlDWrzAZtSv2o5JXtO7JqinpMr7IlH7YUKKwc9UjzoOo+EEY/RucvBaV6ZV8Fhk
	 pK9WcI0X2gGHxw4N3tAPmelxFMdOMvUEUD8edOEo6nSYWd89N5pblTK9EmJwWIgFYrxhQ
	 WNNXpf86ySuANJ131Knq4ZvJIfNe6/qbTTJYcm6AoHneyLXVHXLL6awB8CpZqIuOQFaYt
	 xQiL+lbzW3e/g+b/wMNxQ/osYmP2r4pTbRc9OeuFff45kjUeuwo0pDG3OXTe8torB209A
	 /P6I0y41bcYbDHvD6q3BaO1svT2+FyDlqR5a/fApzpaXLpt1jHMxAstYdyl2/GIM5pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LdG1wONl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bDOzzW3Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1732606A331
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1732606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LdG1wONl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bDOzzW3Y
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0YqY3725854
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OTjfUEF9zyB
	1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=; b=LdG1wONloFJ3yDPFOfHzrDhmiPP
	x0mOVAulupDhxkhMim1C2ueTSZbASbj/7Z3AA3U/yBMK3iXJexUVhDE2PBEM/YUg
	32lKZzziSPzUQldzoy0lwtdjkSbdgFH4sdKzVDZIwiyIqYuyob3uGJbGaMns5iyQ
	lzyhScHJJrOPB6ahoE9rXIMwJfULZbXT5dMqd5YtfjognIA4f/vCUqznq4pjKdMm
	vwNHlKKXJsnG7x91hL8TzZWSqV5rCwwWiAVnVBOCczH/HJDWyCp6AZTgXOPCsyg3
	fmdaM8SVEg+DYr7ViUgTVfCPil8AyaMAfVlQetFZ8vw97KceSNK6KgEfMwA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d9xw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:18 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980b637ed69so425162241.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328755; x=1794933555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
        b=bDOzzW3YqodKZb/51Nn8mDdDpIP0CRjEYSKscVJZ/HrnPlMWqSfzRxGgBP0beIDHki
         ZmV79PNBx6twmC15MsuX54brrVBA/3c/mdlN2TZnjK9AQaf8vSCc6rzt2ldxs9UiJjjv
         9a0d3GUZ/ciUutk/7tJZyUEK5LLaHTTDCa72MTBKUp1ZGOVeKUOTPyNJWFSYDjJLSh3u
         tdBVjbBfkhbt6A7Qg7RUhYpjru4YTZZJ8vivZmzadf5sSjBQVjaQRS8uWHCtJH9JtAHk
         idQcRuSqla2nhiQVHOGGOB6lhRKCvPb+r544zXG8sDUA4GUD+EQ0bj/+rj9GF1274vAp
         65Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328755; x=1794933555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
        b=WWFBlQNWCJP3PC9Zai2FgAMcq+iKBE1A40HnpRQSQ3qRzXqE3yb3ilIXw9cuhw2QTS
         d5lXDLetyuYxXrTFyRrm4APdCT8JwdCtZDhAjJmx/NXhhlAY2eBJia6Kra0QQfK2n11F
         vznweP3q9u8CRrZCdliaTR+One/hj4prTLh/J+zA8UnD3+B8R5p1VVIhbEwEk0gvc2tO
         xgZS63QmUowp1zeEuXFgaj5Zh7kJcyArlX0iTQKAeWsOXFfTP/PlOVQYR3WVHrZaIS2r
         ekhAm7mhgBeEIYwe0qteDd2d29nZZD0sxazFywHxv3E8Vxkdm/yYSAzHC9bZPQox9Hw6
         flVQ==
X-Forwarded-Encrypted: i=1; AL+hErHx1SQrlzLIt9gr8HMatAblUttTRh1dUnXjZvAa94kIkveGqVCrNCdDJxZNM/oJAnnErVlH0cClxPxf@vger.kernel.org
X-Gm-Message-State: APuU4Z/7sMLhKD/xpSkpvS3uzTXk5IckU4qw5WS6bazM5ypQJ1AA6Wzf
	6RoqMRAu0u7KKS4MjgXv3TrA8dMMdyj0n3Aparzrm5Trf4GgS33HEJVdoPiIco+GBW/Ql1bE7on
	ReX8FVMwJx06auWXwWGfqFeTeszelCYiVD1U6kDQxFE2zPp38L9CmeLl0SY6wRRK5
X-Gm-Gg: AYBFou2J2XCbUQ7sQS+92ioY9Pm+2Hpz0h83zaIninccRyh4a2TmxJos3sqSkUW32QK
	wFT4FsMqKtjzQKLcw1Ukv6cIyQ1fHiRZKw0Dym4L88zm2Et7y9M6TySGXporF6zNQQlmJx0CE+y
	DHHqsFEMM/jRRB7m1afPjUu3Fjry/TzGU6GZKC5lq/5faIjr4KMg07E7tEemWe5cc3rpfQnSFfD
	bP1gbWLcjIuoYMHTJXYA3HE0xhPthyJJPEnuSJ7MHxPKVvjOQ9cxrRUKcssNBLD8l+qcPSQIOzx
	O+5tiR1FPs48c727qDmCeQfNI3Ld/J+NFgBZi9e51sN27MQmZVAnwpQz8/QnUeHZhyd9Znn374c
	39kMp5HuzFFDO8esVmnutMzExHAJ4p91D5xM8rS0=
X-Received: by 2002:a05:6102:6ce:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d301974dfbmr1202056137.0.1794328754847;
        Tue, 10 Nov 2026 08:39:14 -0800 (PST)
X-Received: by 2002:a05:6102:6ce:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d301974dfbmr1202039137.0.1794328754273;
        Tue, 10 Nov 2026 08:39:14 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:13 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 10 Nov 2026 18:39:02 +0200
Message-Id: <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: n5nHe-OLvnQrUeDejbjbJRdNUBxgJRYV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX4iRsANuaVkzF
 7r4FFFPC1Kj18ok4GMD8aFfAiOAEVrAHx16fXLU6AkNcjLWQDJoeEdorbc6wzHux4dzbxFwJZyw
 2lynQ601NcePN4UJzPMCRdtr8aAhAtQ=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af348b7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=o1xkdb1NAhiiM49bd1HK:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: n5nHe-OLvnQrUeDejbjbJRdNUBxgJRYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX1QUVczcQ4yQn
 u6UNA0JVqIdGEXUPJ0lDfbdLNDYCzOo3WGvsbnamT36MkuSCD09HoVPc0hV4cjaLeFz3o4aZmep
 KQbGTUZiZTb3ko6Rudan0ch/rW2khDCVKw/ow8a92NeGPPGnCdfezYSH4LtE8hQP0vihh8Eub9s
 CfVasvujLGLUPR++FympErxXYdKJjtiK8LjzfjEwfJdlfyARAB70W0xBizY3gk3OEvdUnNbZD/n
 jHxYiNMVTcH2Z/YArVpWUN10w+wTT2B2LehU6qYWUj/habmbOUF7ZMpszX/GOyR3zGezMovNdL7
 KQQ4OV2OEZyEk3rWsTbgq9EM9aDuYKYDvb40VJc/LF0ekOQteMv9ao3P+Uh+KNPWBBh8T4lfioh
 v8MNOPdxAZPhB1P43pvPSbohXioSIUqwqWRC5z8TstwWRRqMnGeQ3adjkuW20yJY5PnOD2RlKwj
 6CNJv296moqPjp5XaaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domains, IOMMU stream, and interconnect path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 0000000000000..112580f3df10b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+  The encoder is a standalone hardware IP within the camera subsystem that
+  performs JPEG compression in memory-to-memory fashion.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7280-jpeg-enc
+      - qcom,sm8250-jpeg-enc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+      - const: config
+      - const: cpas
+      - const: camnoc_axi
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
+    maxItems: 3
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    items:
+      - const: camnoc
+
+  iommus:
+    description:
+      SMMU stream ID for the JPEG hardware.
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - operating-points-v2
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-jpeg-enc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Titan top GDSC
+            - description: CX power domain
+        power-domain-names:
+          items:
+            - const: titan_top
+            - const: cx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-jpeg-enc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Titan top GDSC
+            - description: MX power domain
+            - description: MMCX power domain
+        power-domain-names:
+          items:
+            - const: titan_top
+            - const: mx
+            - const: mmcx
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jpeg-enc";
+        reg = <0x0ac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&camcc TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "titan_top", "mx", "mmcx";
+
+        clocks = <&camcc CAM_CC_JPEG_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+        clock-names = "core",
+                      "bus",
+                      "config",
+                      "cpas",
+                      "camnoc_axi";
+
+        interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+        interconnect-names = "camnoc";
+
+        iommus = <&apps_smmu 0x2040 0x400>;
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <100000000>;
+                opp-peak-kBps = <262560>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                opp-peak-kBps = <524760>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>;
+                opp-peak-kBps = <978600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <480000000>;
+                opp-peak-kBps = <1095600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000>;
+                opp-peak-kBps = <1095600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+        };
+    };
-- 
2.34.1

