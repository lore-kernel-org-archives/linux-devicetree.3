Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B483E559B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194910; cv=none; b=fISdl27cpXCt/kXcDhA3wxpekXsAw6zrZ7823HW81I2z9o9M+r/K3nDf/5JMapLEKOZt0Hzf0Or1wD+DUgIBQ0J/B80viSc8MIOjZNiNCI7HEWgZYOwL3pj2U018J1bugZCryn6f8MEOqpZZiX9zkUJs56FagNARGTplimv6FMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194910; c=relaxed/simple;
	bh=6atMquPRfhkv0ylXEOERmlkDRIo57I38PHGnGHtHQ3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cx5VZmbuQNQqreza1BhDnZMDofemNgZA+SXCBg2hPPi6X7+PpSf/t+SqXI+nR4V8NGrzuQijmImGcgPGmguIZ2459RTD1lcjOkMZeH7ni5VKO15AvEEnaauQmeni1kr7/EahCrADwb+oppjVEiRNZDBF1/xHVkVGeV+k5BeWax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kz5hpCGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3xl6etZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kz5hpCGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3xl6etZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNF7Px3663349
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=feRtm2SE11o
	kGy5uEhKVGhOratl/Q0XPxlXRlVQG4OE=; b=Kz5hpCGqyDAn4zoZIuvHi+4TzQN
	b29fxRR77vs611i/QWzcJ+cYG+zA2DWmZWeJBXbvd/lu+5M3yfVQzveTL62lzRbd
	Qwy5r2Nnvq8oDXFfFGUfbaBLviM9lIp4yWeXtFbUZa0MiRqtajn4adQ1Xv0kw30x
	maqvOej8WidxnyZvEHRvjjIAGnk55UZdgT7iyCpAb95mQAdbXqvJyKggszbwfZZY
	KB8nyUP+5Kio9vEEbhMAgrFxupt/Guyc2qNu+UlKz1WKMahOlibOjlKIzWnKKRbz
	VSBDWl0feiGeciL13yVHIU05RdS1WpLUjK/Z55VCbtGdQ8UXJ7/CmPtdjtQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrwms197-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:55:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso882084c88.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194907; x=1792799707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feRtm2SE11okGy5uEhKVGhOratl/Q0XPxlXRlVQG4OE=;
        b=Z3xl6etZKz2wMOSGAi0XSPWA/il0tqOyGEKyxjODG7Nz/DCxbu5QdOZlHOCPL3xKLb
         EggtHQsSYLPvi6LyoAjGH/C8icZIiM6cLWkcpdqDmyeeeVO9p5EK/XMZlrHpzCyHQ2ut
         m1cIGzK2+QtZFPEmeScElhiNnWVpCBXpI2F7/SKNJzH8cQS7bkt7UkJAndFMzbAh9Rkm
         PjlrjpRmQfJuQ0onJCYsoqouUy5LOpX8saBen4q0wlMPzXqmajWYqfmdNgdyEznsN0OQ
         xSkp+U775HCHbMdHBQBKjkwOU9XOx0ILIzme/Q2stzWaytseBstXDyNEqIc51+9HqS6w
         wCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194907; x=1792799707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=feRtm2SE11okGy5uEhKVGhOratl/Q0XPxlXRlVQG4OE=;
        b=YrxQ0t4XyNKFgd95S84l6I+bUOhd2dqY2YLzZN9vCDwPTQoWuBnyBl8X3mai786NF2
         i6+SZm2oTTj5NcSJvwZqCP8zLMs3bK0RkN7/EQPa4o3YbUFvxTuU5zllL8jL8G5wZb3X
         pSUOvmmPEO7OcbkyFs3J6dhgEs5Q37bA6/Y305a2BoX+0Zf2tHqn217qh00tLCvj9I/i
         DCxGHT5EL81NTF+BGtTpi4S8LCMqXvf6GT5UwI3XuGxHFg0KTthrffgFH/Ar9T0E0gap
         LCYxYGiHWgwawvyq1qPwsZFGyTKVJCxyKuBmxkJOgQQQQK5Quh2S5ZKlY91RqdFOSMfC
         vOaw==
X-Forwarded-Encrypted: i=1; AKwUvBytz/WoTo2lR03BkvfNCOpF3k45ueAnCSHHmAhTegDlZSDm3O5j5UhSeMw83ua/WBiJg/2pX/J4uCdX@vger.kernel.org
X-Gm-Message-State: AFq9FYJEscAo7PcyPqNHThRAXlzwNIgUxNFZ7YhyJ0W68AKfv+sE57j5
	7A7YIt0TZS8NqrV4+LpAz0P6Ot3qVrR/CNeqvGdfQ4DIjBT+WKSXASuyPua6vcflPcNdlXrgLQh
	DAZUfRcp+eGbVe9QuCsA9hxSWv3AmrQTaZNx+5/Xqz4Piz14JIXtX1EnccYIc/hQF
X-Gm-Gg: AYBFou3VsJxIxx/BHOIy4dOJea28jbiyMHDLhELy4lE5l7p/lYu6GtJbM9AHDeE2QAH
	v9b/Dd+Sh4YL0bARrBz3xPN6nmzISEa70gwgymSBZbOiTajErcVpx09nlVyuhHT89elW/jw7Q4g
	QWEEl+eQBayiUuyn3+7J4QpT0elDY646hA2DIRRsVnE41+Li/+TnOIQbVFG0Ui0NTDVRCIuukyh
	GSxr8qMxqfdRjU98gmUPSrSTWYJC7c0tTCZmaNi6NhGy8C1V/hUIEjYRyjMTQBgxdC9Ar5x+nl3
	+gTBOlnbJTLXKbrBINeMiO2gaQWL695U1ITh068dZYE2v+EMWTI6bMTVh8KuPHdzDbKwyo1xh1N
	PDGYlusMreaE2kIrQeV7Cju3WjtGAiAre//ON0mz6S4POW9v6Dh+FVA==
X-Received: by 2002:a05:701b:2807:b0:14d:baf5:c411 with SMTP id a92af1059eb24-185118edb00mr1677824c88.14.1792194906858;
        Fri, 16 Oct 2026 16:55:06 -0700 (PDT)
X-Received: by 2002:a05:701b:2807:b0:14d:baf5:c411 with SMTP id a92af1059eb24-185118edb00mr1677786c88.14.1792194906193;
        Fri, 16 Oct 2026 16:55:06 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:05 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy schema
Date: Fri, 16 Oct 2026 16:54:57 -0700
Message-Id: <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B4osQ+tM c=1 sm=1 tr=0 ts=6ad2b95b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=o-k08rXiG_sRaRb_8WoA:9 a=Fk4IpSoW4aLDllm1B1p-:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX9AJ3/rnvvn4j
 9Ww/8h7hsNpk/P1+OWRcGTMBG1CnMNYLd17cEAeP6UKtszVqQZCE9s0LEpHjQOn1w6Jqbb2qGx2
 v/HUFBwpf/mhO1qsgYY8/ywYH9zHro0ltN/6JQZa5aAJcSb2jVbBtx41EQHWDyCs91erSx9SSB8
 FJT0dxb/uA3Z7MGw1jRPX16SHpLLvjUBhhz1WD/izoJhE3i5agrIL3FILvA2W6QC3BJi3AChFsm
 v4kblI+BqJxji4G3oEhKWijGymjIAiSa19cDcX+U6RsrXD0UmpgPLLeS+EYsPZes8gCAszx2iac
 Qn90UOa0QtLyAmfGSwovyyx5qB2Mz3byjBEW0bgXWiBKRmVLx8MyI4ePG7DZUIy+SkMBtmTEyMM
 njPYbDAZ+HBTueSDxUoRqNn2Bpq/cze+Eih36cL5UXur+vcqBWTm5pON3FjOpXZxr1OFPMh51tB
 +4V7Uvk4MZ9QKvLI/RQ==
X-Proofpoint-ORIG-GUID: WcvGqewqZQu08Z_r5RVp8JrX1m5P_p9j
X-Proofpoint-GUID: WcvGqewqZQu08Z_r5RVp8JrX1m5P_p9j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX4k0jPlEeFpPB
 zNPvcWJHNl63HGJvTcLdZ0X1YN062EegHKs3LRhLRX/gRi8pfNja7oVnVxBu35IcOharbKlN7Fv
 EE/VicTvnrw2hOrak5h4kb84aGjtaC4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

Add a device-tree binding for the Qualcomm SA8775P MIPI CSI2
PHY, modelled as a standalone generic-PHY provider like the existing
qcom,x1e80100-csi2-phy, so CAMSS can consume the CSIPHY through the
common PHY framework instead of driving it in-line.

Follows the qcom,x1e80100-csi2-phy schema's shape: a ports/port@0
sensor-input endpoint carrying data-lanes/bus-type (D-PHY only for
now, C-PHY bus-type value is accepted by the schema but wired up by a
companion series), a port@1 CSID output, and a mandatory
operating-points-v2 table plus power-domains/power-domain-names.

Unlike x1e80100, SA8775P's CSIPHY has a single power-domain: the
Titan Top GDSC, matching the legacy in-tree CAMSS driver's
sa8775p_resources.pd_name = "top" (drivers/media/platform/qcom/camss/
camss.c) and the existing lemans.dtsi camss node's power-domains =
<&camcc CAM_CC_TITAN_TOP_GDSC>. It is not OPP-scaled, only kept
enabled, the same way x1e80100's own "top" domain is.

The PHY takes three clocks (core, timer and the shared CSID CSIPHY RX
clock) and the vdda-phy/vdda-pll supplies. The core/timer naming
matches x1e80100's clock-names convention for the same pair of
clocks.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
new file mode 100644
index 000000000000..b66ec2f14189
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8775P CSI2 PHY
+
+maintainers:
+  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
+
+description:
+  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
+  CSI Decoder on the SA8775P SoC.
+
+properties:
+  compatible:
+    const: qcom,sa8775p-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+      - const: csiphy_rx
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: top
+
+  vdda-phy-supply:
+    description: Phandle to PHY supply.
+
+  vdda-pll-supply:
+    description: Phandle to PLL supply.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Sensor input. A single sensor is described by a single endpoint
+          with one to four data lanes, numbered 1-4. The clock lane is
+          position 0.
+
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@0)?$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  minimum: 1
+                  maximum: 4
+                description:
+                  Data lane positions following this endpoint's clock
+                  lane. Positions are a per-port logical numbering, not
+                  package pad or ball positions.
+
+            required:
+              - data-lanes
+              - remote-endpoint
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the CAMSS CSID controller.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - operating-points-v2
+  - power-domains
+  - power-domain-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    csiphy0: csiphy@ac9c000 {
+        compatible = "qcom,sa8775p-csi2-phy";
+        reg = <0x0ac9c000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+        clock-names = "core",
+                      "timer",
+                      "csiphy_rx";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy0_opp_table>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+        power-domain-names = "top";
+
+        vdda-phy-supply = <&vreg_l4a>;
+        vdda-pll-supply = <&vreg_l1c>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in: endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                csiphy0_out: endpoint {
+                    remote-endpoint = <&csid_in>;
+                };
+            };
+        };
+
+        csiphy0_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+            };
+        };
+    };
-- 
2.34.1

