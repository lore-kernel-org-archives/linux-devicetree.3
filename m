Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953530;
	b=qEjwKompGWsBE/2z7+YdbvlxYVdDgdBRtacRFQZNeWZiKOqM+PmS28dR0NNgMnW5FzQR
	 +pVQmbPMTtFjyvKL5V7zeLOCCPQTX8y8rd4kwZmcmhYW1GNrjtjtmKxO0bdawCKZE9R7c
	 c2Bnv4G66jn2ql5YK0usp6EJ/ghAVD/C7hrWe5JD6BZFAccZ0MSPNGfEigaWTydscfpJb
	 ZqXLLSR0eAu2zIq5TT739e3gf+E5W8ryCHjAnRV7h7a16FFG4v2cE9WyPAMicgk6Bfbge
	 TRO7YUAgnhok98w2T646V4DJQaJWelMqod3PwxTd1v1TmO4aBq6UBWmY8ip58zvM9QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DGUYjHTjpo+IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=;
	b=h9v4Mow9G22xcCKrrelUv04cySL5FZ5op+vFlYEdJBHSW1d6f1UN4bb1CKSNXBFw7NWQ
	 3/5BRjC4GrYfoMcfxI7a3hGuBWJEIDIKTRAYDJlcrZ+hR/SjrAZu00GkXJne/TkRg5Eg9
	 4LOMOmvbMv2H90moj6oBZZjVnGtw+tkdkGGGw3TlvuXrj2+Hehj94doobCCRJjyuwICLd
	 HYH06wLhCdyiMjmtWlyvkh6O7sT01m4B3YIgc94C1RiDbPZS8ZxSUaapRIYHZqRJSt0Cm
	 eGCAeE/F4J0GweRk3k+vIUOwR4mhigquK0T1PmEE4W3rhKivjRq9fvegUD63/DC4Jcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SnZnrjcJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H9A1NRFN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134A0606A334
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 134A0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SnZnrjcJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H9A1NRFN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RQw93301556
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 08:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DGUYjHTjpo+
	IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=; b=SnZnrjcJH7gyC98opyIQcuwbE1U
	2CqP1qBUXXbPG+cOUi+67jiswCMjSFDKSyM6p134aUUd8hdQ06lIx6vu+e2370CJ
	sHCuDcPXEJFw7xQYmgJYMCuDcezHhj+ksHHCBttIgJjvxDXN+K/O/fev4Q5VUItR
	YzzVnweXdK/GpLQZiaYlYyCYC5/lCpCFaL4NidksoGCIp+1i/1iLBoLhrs1v7pyC
	Et2S5pUZxVaNUTp3GzzQ/Focl+boHzF3MgLnA6b/iTFLEIHblSHUC+0mEb2+vc8D
	C3WbTql67C1TQmlv3oZWbeBFqEH5Q9Cb+IkEr2HRHqoQC3ucRX01Kt3aXDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1vyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:25:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so78875885a.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953528; x=1794558328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGUYjHTjpo+IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=;
        b=H9A1NRFNsWWmhVRZLJNS+r35fSR1kK4ugsL7Av3iTGpcplGwXa4kdOn01rRPixSqry
         DhHt1v1bJdLQZP0rdS8xyRYniio9DM3cd8ZqTbC+4t3QzlHckmOZ4aX8LhxagnRamVpq
         fkGhP5VKJDGMMszRGRmm1azanQQvJ6v9yejxsuMc+BCcLZduiO2rhKBNPoCT9aKSx5is
         jnj8IGUVzFbKy9Awu6qrhw9oOcGVJdqVV8ft9p5ZtB+lnrLc2WJQZCoMg6IFQDbIXF2Z
         OoR3IHLqJ3A9VWq1Ua+WlPFIbr3jwxpozRaF0xmO5mc3ES3tRofxR9YyGfjJP6BapK/G
         7trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953528; x=1794558328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DGUYjHTjpo+IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=;
        b=R9pwvOuojGGqfCpAQGsGrVfP4ud0dx/k5pWuSDeSEOqD5U4E8J8QlTQxgBASS8E/iN
         ThKDP03hlGScN+ZYUTkLcw5KE/G5izILsVlz7uy3DHMNOnrnhkG6CxAzw6WmWzSSnnzu
         QaWJV9rTfnSnLPL72Q3hc2VJPBuAcOqSKfd+7SgJkgifnB5yEFWI9L9HBKYb/a4nmNBx
         nG/5LydykG4hXgmwQu2YFSlsieZ1NVPY2rdoMcnV4Pq83gp4vxkuqGyOm1Uj1kv3vYbU
         pGnEiEyai7/oJqoOzo/4LyQtwKwYqtQFC6WZm8AotAilEqySDzFZilBGoRyRjhh0fepD
         uA1A==
X-Forwarded-Encrypted: i=1; AKwUvBznpcZBgUpgz/7ZXKExnjTPQ5Ricjv1LRFLUhjqpdXww1CVlojTtBEKwOvwk89akfA7UVltS4Xw+5xM@vger.kernel.org
X-Gm-Message-State: APuU4Z/EFCbqzIk0arvsgum7+RG9wYdCyXFv+6MBZNMUgHDyUWkFigJX
	YiikrWr5/8SzlruNfN3/z8voe8Yt9UTcKmELlM4Ax18/bzkcp+wZCl2pq29oWFxh65E/FMDbni4
	TA4Q7u9HygwIrfYntIERTFtiTQ1K1AdZ8CfvfkDtPKkpK6a0c+FnvmB1LCEMsq0Mp
X-Gm-Gg: AYBFou1h0gcnYAODo7qNn5Yo367e6zxIEo2ZcULDVOOff2wEKSVLt07QTBGTznZlBIx
	zUJQx9XvkIxqOmPi52bNNl5NkAaMv6NuQGGahp6G5YMPYITSrtS7P5CpqRwnqx1rwpwm9cVHDEi
	pyIhtS5De/AA2rW/NAp1o2PeVKnyLeds39OLaArl65tlkx2zzwOhBhpon3/wEYXFdSi7X4A4MeU
	r/CPgfKMnR04JEZ0w7q13EHimnpa8+f7XWkdY5O6fCfz0FWdJ4Ia8FAeCRbJL8PKGDtOqftZ+TK
	ZCeaVJzsYG+axoe88MkITAHWjt2xZr9ZaFmiw9mN5BGubscIxpyCYl0ClWjFU7mxVAoK7uccdto
	WE9+OouGQ/UP50VcxpmZq2hhaaR5GMNs2C2v/WXaAjB98LwwFQJmsBVERWEwjXl14Knx5ugIA2g
	==
X-Received: by 2002:a05:620a:800a:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-945f3537d9fmr242643985a.66.1793953528355;
        Fri, 06 Nov 2026 00:25:28 -0800 (PST)
X-Received: by 2002:a05:620a:800a:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-945f3537d9fmr242641685a.66.1793953527874;
        Fri, 06 Nov 2026 00:25:27 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:27 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Fri,  6 Nov 2026 10:25:15 +0200
Message-Id: <20261106082522.1448390-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXzxvvrP6Hcrl2
 fNOIJsbGHxgAV3DLF2qiIgHi6iKsPS0HvHMcYBXDVFbIvDcbc3MyjGO+DVLxAokLp1dlqdRRdnp
 28unxj7w6ANlv6oLMonevSFxlsuc3hDXieXS7HQ7b6g5H1QJdjySzH0OyCZjqYpqA+fLsDmf37A
 w2QROWgcL5lgi6g8dysp1283X7y8rlEvUBKXT5gJGVWfy2syzA+LLIA1vkz1IJWDrE3ZJilLUV9
 OCASwSl1YRwbAIebSDsZ4aoF7xn/mr2/FDPobKFe+1nMtTsO6CEyDmrnwa6QOUOdCerkm55xV28
 3fMCD9VA35KPwgq4ahqqknlSaFDCESvdBWt3kzhgDz2lBegMMqSF1Lj+NiBO3CaQ62MciqOx3re
 7+IHyqN/d2AhksAuiPGd19jEAv2yqC+hn3s+Xil31UISfxQLsLUpUaSe7DFrofv4d/YInvg+vEb
 HN5CS/B3TFhSmXvnqwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX13G2cazgs38i
 adsxYKPR+4KJJekzLfZe28j64WRNe4ZcWs9jNrSl2SA9KJ8ftUQb41BeqOdagFwDYqu1QNZmu+C
 hnLRT7ozJyzIam/Ie1uID7oM3b767j4=
X-Proofpoint-ORIG-GUID: VS_gapF4Q3tiE6iOBYwiTQfrCoEKEuVO
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed8ef8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=oIy0nRtpyz8z5AVKuhcA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: VS_gapF4Q3tiE6iOBYwiTQfrCoEKEuVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domains, IOMMU stream, and interconnect path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 0000000000000..86b17575600c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,193 @@
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
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: bus
+      - const: config
+      - const: cpas
+      - const: camnoc_axi
+      - const: camnoc_axi_src
+      - const: core
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
+        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names = "bus",
+                      "config",
+                      "cpas",
+                      "camnoc_axi",
+                      "camnoc_axi_src",
+                      "core";
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

