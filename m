Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F863DB32A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217526; cv=none; b=C2EmBLDNAcm55a8sKbs8Av65ikfXd6g6R+JMD2fhprjP+BY1nQjLQVGxZxbjeaXyPKaxhqx68pQHzg9ErCT6MtE9au6eozEj3dkP4PVK+VRxzt1MjtDwTw6dd8dTSSdYpz8lQ7P/VVM5idiEyTAhwo3l+jO4HWcAdcH4FXx4BNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217526; c=relaxed/simple;
	bh=FswLjexa4W/19cOLQDCspqJYNyI5kjTklXut13h725o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+uI3Ax548ZuVKDDi0YnRXGjR8utIis005cACBh32+9OFGnyxNp7lfB+afP+gw+ecWhRH2ul2R/y9uZkYUkHx05PgYqFcL5Tl9fbg9SoGQCB4/1/PlnwjUlzwpzPMehvPRYznYuTtSQzsPM7xXMyxEtTO7FswdmrYcDwEP9N5bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6b8drNk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkyLd6MB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6b8drNk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkyLd6MB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExGMb341433
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHAPpvkbvRI2RnEglKIra6lXC/2fx7JbZmYyoLMJzkg=; b=Q6b8drNkWgalir8q
	qSifjUkbQahQkJKS/9lDriMXkn8wZnsz2aGwTUyi/VwTIhr2C1FrVyAMA+ipaW/d
	6AYFlFl28LHF1D9gPEJ7r8zTwOitRT2hDn97S21/l1zrnaHpE6F31Idgb5i4obke
	EcyQO5GCWeJglRQGCT/d/VIVrud6NdBZ9I3EIoAG3y+DGygCUbcldfFwdH4pQmIJ
	NPHHFilkReR8fs8T/Ncd/uLNIdObCRdGaKuNxbWWg2uzcOE4EJgV6kwp3ggUPOrf
	osZv9xxULK+KfEjxnXj4jzC+IHr9L/OfqevTcnxOPYWgo+upzWK+vGJvfMKKOJS+
	4FZDCQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3v92wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:05:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c823549b1fcso7066486a12.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779217523; x=1779822323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHAPpvkbvRI2RnEglKIra6lXC/2fx7JbZmYyoLMJzkg=;
        b=XkyLd6MBys6SpwD/3YdJErNtOAuoZp60mSiWQkebEfJ94bIp+pTqQyOkUppf5YIy9/
         GRBJY86qSeLSUy9WMBeWbCm8mDF6KibGCbWPSKjol6ki1F69whHvwIVz73dQgW4ZviZj
         4u4ifbXmf4R36IQCxeJzlaniw/iwHlm+tfWjpDGlLplGfdmfipIGZaQ+boX4tjv0fKGv
         7Lo9y0/iwm2OaKxzo1oz5cN1x0c/Pu4uqb2+MFVTbql1AW0AEZ0tQ/rf68dMARSseAP4
         J4JNyxX23JbKWtIw1gGGn/wn8C/XGW51GMN1aB7zfmcZKIsBXxsd18HouV1K1JsvWO9v
         jngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217523; x=1779822323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gHAPpvkbvRI2RnEglKIra6lXC/2fx7JbZmYyoLMJzkg=;
        b=VAMeaCKkdPkkWWdpBOKAWyylE41DcVOi4yfT+niaPikQNXQRJSEh8r7tpYzdArdpXw
         n3kNW15XnjtR8kgAGzifRuUDdHLM1Hszbz4Qi74RYUmkWr/UMcFIDGo0DtAILTPiVBwT
         qgdQF7Ye0eXBqMXrN8F5KorbfdhcBMHBT/BklOg/tcrw9703NedKTDvRf8D1Vj/YOhET
         9C9d+SY/HyFRWi1F821shabTpBund56GcLi/z9vSAROZMYeedwbzsuZf8pFJqw26OqL0
         +JaBoXHZ8pSSwYMHZIVyLYbHYSwj8S9ToI6BSvfqSzrCw3T4xsibbTXi2GVXBfG+Am8M
         prZg==
X-Forwarded-Encrypted: i=1; AFNElJ/hMqO2qqLH8bXp2a2qphMuUSmWk1OFwa5tNVjhRQ49wt7D0BBZxtnnxFPzC6e3FML6phGtE3vNaLE4@vger.kernel.org
X-Gm-Message-State: AOJu0YzQXT5y5FU5vHwt05MugU8l9v4MdO0N6P7a27RK4fueJO8PNRmT
	gdejZUptdBn9X02gqpCLX+BYkK72oQtBlWzndZHtXe8JSU3+dUDhBfrmIJDv9iGmQt7HNnHdiVr
	I2Hh4RILUMqJd62NODXob02tW+F4JFWJpTVjaKeUaFhXCgmJKLkeFc9wDDGcCC1+x
X-Gm-Gg: Acq92OH8moaoZKFKmIYhSZKbrXW8b+28qhA6UHwwRgfMZ77ijJ5sh6LtaUvDyr5K/ux
	BAL7ZVepJquCbnIJSoSpbboGTr35fRCnh5ZJn20voGK7hxt4syJ7LBJRXxFgyEyjmqaNNPhsdOW
	PNDHFWqRnHev5tBNRyoNyiW66aDZd8WzB4wwbeT+SjXvII0S16saa98ZboQYZCgraAmhhRpThIs
	ICbcOL0MVZVTSDiKPpGdYqpZIYayie13osyWY2pPQ5Bj47I4vlYTDImMd57/45+U7ivsp8p96+C
	hJ0Teaxc9ANMzce8iDzwwb2ry1HFN+nQrCXz2bVSfiohoQkRw1BcxG+FsXYSek0jMe4/JfJWnXd
	8O33CTThYJTpN5Smk9n7xC1oqBMcb2d97MM9n2l1ZmCB4aNLpxWWEEapf7vxaijiF8gK+JDdXKB
	eu+gqvdfxrX1kiqysH8YVq5CF/Vou1NvPK5iSejFI4w7AOW/Ox6/Q=
X-Received: by 2002:a05:6a20:9188:b0:3a2:e089:ae56 with SMTP id adf61e73a8af0-3b22ee36135mr24018340637.52.1779217522696;
        Tue, 19 May 2026 12:05:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:9188:b0:3a2:e089:ae56 with SMTP id adf61e73a8af0-3b22ee36135mr24018308637.52.1779217522069;
        Tue, 19 May 2026 12:05:22 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19794e6esm17423401b3a.25.2026.05.19.12.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:05:21 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Date: Wed, 20 May 2026 00:35:09 +0530
Subject: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power Management
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
In-Reply-To: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779217514; l=5161;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=FswLjexa4W/19cOLQDCspqJYNyI5kjTklXut13h725o=;
 b=R/5ABYELjlk9wnZSNkHlXqO9inFOaDo6atAm1JPNGo2b1bxoEK8e21KAIv9zuc8/jpap//BlT
 kOHtpjS8SwAAsG92mxeQQh3I5aLQaZRx85GVpGmQrV5W3+HNmLHna9W
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-GUID: TpCgLusrcFGfzzU6O9UUhRKethDd4G0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5MCBTYWx0ZWRfX6F/GUvcjvtkg
 vWISygN7F6xoYmV9JRZJLVvcblDWKafMAqyYjQzrApy9lIEPd/oO+afEwF+ARtT0Ii0mz0hosWO
 1V8dgLFsDhVOXSLPDr7Pi4xzji9MyM/jC7ZO0pMst/RDQsH4oj/nrIW27wByDzbM6umJMk7tL16
 2Bj8EZYYBL8eKZHTGS4/gMHJhV2FcpetGHD4Oo8FwIeNyDDPnLesyJREz+fDkMDw3kV6qk9FMh5
 lutp/ycYN8pFB5E0w2qBRhd9SDtORIV4t/WVP6b9rPzk9n2aTVgbHm51zjbMuZv9fi5Sraeg9Tv
 ko+yTIJFicWDkNAOFcHEVn0arr3Q8QzghV5bkPBkz0EK+s+6tMMe8/xXR02jRUedez1AsnOkqoY
 1+rSuWniWVRdQ9ksHAsZsXJjbl2yqfl7CICDsbp2aOyPZlJXKzh/kWxncUD9BZ6hVho6SqQQeim
 Dm5M5vmw2J8sn3vnuXg==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0cb473 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=85UeY_1I7I5IrrPC5DQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: TpCgLusrcFGfzzU6O9UUhRKethDd4G0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190190

Add documentation for the CDSP Power Management driver, which handles
Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
Power Mode (LPM) transitions via MPM handshake, and provides virtual
regulators for the remoteproc driver to control CDSP power rails.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,cdsp-power.yaml         | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
new file mode 100644
index 000000000000..f0f89fdeba4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,cdsp-power.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CDSP Power Management
+
+maintainers:
+  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
+
+description:
+  The CDSP Power Management driver provides power management services for the
+  Qualcomm Compute DSP (CDSP) subsystem. It handles Dynamic Clock and Voltage
+  Scaling (DCVS) requests via SMEM, manages Low Power Mode (LPM) transitions
+  via MPM handshake, and provides virtual regulators that are consumed by the
+  CDSP remoteproc driver.
+
+properties:
+  compatible:
+    const: qcom,cdsp-power
+
+  reg:
+    items:
+      - description: MPM (Modem Power Manager) register region
+      - description: RSCC (RSC Configuration) register region
+
+  reg-names:
+    items:
+      - const: mpm
+      - const: rscc
+
+  interrupts-extended:
+    items:
+      - description: LPM (Low Power Mode) interrupt from MPM
+      - description: DCVS (Dynamic Clock and Voltage Scaling) interrupt from IPCC
+
+  interrupt-names:
+    items:
+      - const: lpm
+      - const: dcvs
+
+  mboxes:
+    maxItems: 1
+    description: IPCC mailbox channel for sending DCVS responses to CDSP
+
+  qcom,smem-item:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      SMEM item ID used for DCVS communication channel between APSS and CDSP.
+      This is a platform-specific value that identifies the shared memory region.
+
+  vdd-cx-supply:
+    description:
+      Phandle to the CX voltage regulator. This is the actual hardware regulator
+      (e.g., from MP8899 PMIC) that supplies power to the CDSP CX rail.
+
+  vdd-mx-supply:
+    description:
+      Phandle to the MX voltage regulator. This is the actual hardware regulator
+      (e.g., from MP8899 PMIC) that supplies power to the CDSP MX rail. Optional
+      on boards where MX rail is always-on or not present.
+
+  regulators:
+    type: object
+    description:
+      Virtual regulators provided by this driver for consumption by the CDSP
+      remoteproc driver. These virtual regulators pass through enable/disable
+      requests to the actual hardware regulators (vdd-cx-supply, vdd-mx-supply).
+
+    properties:
+      cdsp-vdd-cx:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        description: Virtual CX regulator for CDSP
+        unevaluatedProperties: false
+
+      cdsp-vdd-mx:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        description: Virtual MX regulator for CDSP
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts-extended
+  - interrupt-names
+  - mboxes
+  - qcom,smem-item
+  - vdd-cx-supply
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        cdsp_power: cdsp-power@4ae000 {
+            compatible = "qcom,cdsp-power";
+            reg = <0x0 0x004ae000 0x0 0x1000>,
+                  <0x0 0x26018018 0x0 0x4>;
+            reg-names = "mpm", "rscc";
+
+            interrupts-extended = <&intc GIC_SPI 65 IRQ_TYPE_EDGE_RISING 0>,
+                                  <&ipcc IPCC_CLIENT_CDSP
+                                         IPCC_MPROC_SIGNAL_PING
+                                         IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "lpm", "dcvs";
+
+            mboxes = <&ipcc IPCC_CLIENT_CDSP IPCC_MPROC_SIGNAL_PING>;
+
+            qcom,smem-item = <503>;
+
+            vdd-cx-supply = <&ipq9650_s2>;
+            vdd-mx-supply = <&ipq9650_s4>;
+
+            regulators {
+                cdsp_vdd_cx: cdsp-vdd-cx {
+                    regulator-name = "cdsp-vdd-cx";
+                };
+
+                cdsp_vdd_mx: cdsp-vdd-mx {
+                    regulator-name = "cdsp-vdd-mx";
+                };
+            };
+        };
+    };

-- 
2.43.0

