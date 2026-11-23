Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430884;
	b=1X9Y+uCIH/nRR4VfcWMuY1TbeCt4SjO2BrFbH5aMw+k9bk7c2vpGL5CzxlvbMNTi2sLh
	 wHllQ83uiDGITNIYBN5xuE2EAXcnVuWmVS37lvkEXoR4FxBEScnj7hCYiS9s0kT3sec1f
	 rM5sb1tapdhpbK5jdlsVlU4DnIgPecv3wv3Znsdf+WHUMVKwaCSPDCJYHRHoYQXxHYUaz
	 hz0VkJUj/p44ik0Q7qJ+yp4XiZyLwvmqQCrsDh9mwONQ3yE9WxjrXXHpicX2JvjePxXAN
	 sJfUbZaViGqMjDabdUKvfIOn/PX5zGAx493f5G7vBl+u6lwN5pMOfxSxY9tTpF08EbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1hiszdcfzdCGUJyecppq+zRwkuNF1B1hD+vsd51JBCU=;
	b=zHc1B3VCC3aFYDu70DUk5h6pJruFSsYmYRYh4wUfqQvkLq94hyrrZ95SR4hGXVFoNAr7
	 qnY96yL1Ee7rzcz1sdrjcHn51lHtKZWK9bWoiR50+YauzVGpn5fgOsMt1UoL44ZvFAEaQ
	 bg6KPzUT4Hnzu6Fo5zZwqN294izihH73t8twTbYYpkPBbQt9xAcQiVdupmRgJPaTyFRwt
	 BlHNX68Qon/gtDJxh22lCObk1bPMr3OlcJxVWsNh4Rc2pqSgKSMp/ngn0rEdjFGL5+mrN
	 2GhpYhL85kaB1LogXXLRfdIAtsaO4eKsCvFguHKMo6aF2NiwKxq1tm4qeMOyYO0pm3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KT7cLukP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FiF/qUYe";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7BC606A33C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A7BC606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KT7cLukP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiF/qUYe
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G8Zr2528817
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1hiszdcfzdC
	GUJyecppq+zRwkuNF1B1hD+vsd51JBCU=; b=KT7cLukPHNq3j+JRfLnm2/5LBKU
	Twe3coafXUjeVvnOpn5z3Wevt93cTaTFAWtqddIt0Ojx8ph6H4yD49dMwBvWFlkN
	UrwoUpyXO/4TzPSyCAo8Q1cVyI/lhPglEYTtkiVyx5j23cz+0PDz9Ovvfv1ws6dV
	OO0XoZ4dnaWwvehJOCHQBcE3r5p97nR28cDOIWi5oneNVZIA3EiKEu4+Gj+feEtN
	qVngorI2UY9Rk2JU45/K96r9rei87U8/mld1b/+8I1MbWhVoJ+WC4ZYRljiKfQEO
	ahlw+1HtpRP01j5nc3IAd83szfWs8piFogvJ0IOUfZGsxTxl96i+pER+g9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7rmkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so3012050b3a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430882; x=1796035682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hiszdcfzdCGUJyecppq+zRwkuNF1B1hD+vsd51JBCU=;
        b=FiF/qUYel/l57c2fwjXx9y0+GDO3L0nG9e5tNDAV37PK1OO1LsFtmOBGtNdRr9feik
         RoiaXPyvW8ymePGabd8WdQMimBlssZS8eSjBG57a8GEpd61Rke4UNFmsNp/08loE9yKw
         pMBEy8fCJNTeAQ32TEX0roYRqPBPn18+14wZkYhR7fqs8e/6HbOM/LTOWvDFB4I4ZORh
         RSJvEfN1Pr8V3y68B3mK4uNehwKCvPs20D5nNdeyOOTwdkdPR/r3bB+X9pAVN3B+4/AL
         ZUH0/z/31lPvnpekk/7vmBu7oJQm1RHl6lzbi+DH8iZLPkWL4YX4pl1MyLi3qhpFJJOM
         1R9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430882; x=1796035682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hiszdcfzdCGUJyecppq+zRwkuNF1B1hD+vsd51JBCU=;
        b=wIiocndMWUkYZgH/v+tJ7Px0IF8hvvfNI+Ut9wTYKlVUAsDBXSxS6iNF3wKXNWrpny
         LE+VL2xmWaNBLxiYnY52KjJnak48r3V28A4uInY1WKPsnSrNhsG4L6wWVBgPNzQJZXkU
         mIMDSHc2Jwvtl0DddParSWU5oOJDD4qx9ShtbxEmaOLAFyoXlHESc2OqB0IqwIzgidq3
         HML92KpTYNEAhBOh2wxghyRUHin4wO4tTZ+IcHYh5DIcRBYl2d4bu9NKzQCDnLMcraec
         y76FxSIXCT2FQ+Kce1nfYrikSIWt3WpSJ2hwGT4wlWs20hOT9w5AH6sWmqRnTdGgdD97
         snAA==
X-Forwarded-Encrypted: i=1; AL+hErGRzymAvzef4U0u4DK+nyQ6Bz8axOxodK4xiXgD3R2ZxCAU5wTv3bGova06lXzHN8yc60srCkGBinYE@vger.kernel.org
X-Gm-Message-State: APuU4Z+isAY/9Zw/6oidRAX7oBrV67I1lBjdgMyhUus2ZYF+yM0GE6LE
	wdpwA3McsQp8bXsb24KcivMcek4SSyiC5Qna+LPSDdQaFJUOPMrCH7yM7zU+LiPme2Y6hlTUsyg
	1McAMKwtQrmZOEDYrIfGFqg02T9/gMbuxVLZkW+zNOc3DLFoPcFwvr5y/wq6I56xI
X-Gm-Gg: AZFdTZe4urI0OQeAZNY8+gR+yP5M0Si0pVSlHDuhnQOmutnOSDU7roDZGFPgY4ASUnm
	PoQ6ykgEMWL0eTJ1+1UBIQOqddBxVgfey7nWph1x4ZuXIQ62jeMK3qaGgGt+LAu0EIJYPQqC87e
	6RcRON+6FGQG634BMhQ702UYXAK+TBr3VtA0vaGUR5Rp6faH9iSNkn7q/sApuU3nlZlgCAynCFb
	uMZYyUC5Cpb/xPrVveOVmFyuXsJY+s6CdS8cRc8XTylfX8rEvgfDNjKB57x6iXD+5ChQ+B7wmor
	KctyXR3pvzbDdJcVympThYvpWb2broCPBWLHLOO91ZzP8Ix2AHgwru2WezTDphU3OUqvQuKdO1S
	baDrXOMiBj1Iay+BYiuTtHVw+aTlDLvjl96NS4O9M6lhda6MxyJdTpQHZmDeDarEiXMJXo/v/ap
	x7XUluSQ==
X-Received: by 2002:a05:6a00:4c15:b0:880:b709:cefb with SMTP id d2e1a72fcca58-8c87ca508damr9415766b3a.45.1795430881949;
        Mon, 23 Nov 2026 02:48:01 -0800 (PST)
X-Received: by 2002:a05:6a00:4c15:b0:880:b709:cefb with SMTP id d2e1a72fcca58-8c87ca508damr9415757b3a.45.1795430881475;
        Mon, 23 Nov 2026 02:48:01 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:01 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 04/11] dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
Date: Mon, 23 Nov 2026 16:17:19 +0530
Message-Id: <20261123104727.1539149-5-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0419e2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=HmkRj0nT5UQon3SBszkA:9 a=IoOABgeZipijB_acs4fv:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX/8hsGIyWpIVu
 80IRFuHnsw1d4JD2DJ/1R61y1rvG2jxeXZqJQvBZhXWD0kOwh5ciVj1KIEGevulXyZJBhyNYTXd
 2sGfdllz/9AP+xiVtoD1qzp92iTO8Jd9LdDhvkHInfmw3RLmxL6i101DMeSAVIzGSdkVHB8uRfO
 WDmVRioHeI+vFFA6mpVwr9PhMc2ZMzXBeaQIVRcyhVMagI25t20ZJnrSAyA8re7qbjgbZZGV099
 MWQcGWsw5hqa5jlENswIuU2IvrTW8XHKwM4QAFiUpESJ6FOBCip3fhdrBMH22lsvPw6iKhSiE2d
 z8PMS6Ua2GypCSX83pCZemWa6SvTxj0onrmzuOJ5XF9LLUUriKY90Ee4CnkhIsP3G1K2lyAmOB/
 VHfcPu6TNB4/ySOfq/ydj49zIxRl6so2yr9CuTX2anl6ZyoDEMdr3hbSHz0k2z5chnMjFQxCeqX
 ry+qedKCHnin+FurYyg==
X-Proofpoint-GUID: Lo-S7r1HFTwyyvt2tpyG-3ZaYKiC0aKT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXyBseo6qBBSac
 uSSL6aJm4LUWithW9WyEIToO8rHC/XSq6fBLFnkTOliwHmu8L6QdCuYWDeTpH7Hm1/W0DXOeYRB
 ZZLzYcXdyLpnwa+5kEKWg/Agr000Sa0=
X-Proofpoint-ORIG-GUID: Lo-S7r1HFTwyyvt2tpyG-3ZaYKiC0aKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

On Qualcomm automotive SoC sa8255p, platform resources like clocks,
interconnects, resets, regulators and GDSC are abstracted and managed
collectively by firmware.

Add a new binding file for firmware-managed USB controllers where
access to these resources is exposed as two power domains:
- Power domain: Controls power supply (GDSC) to the USB controller
- Bus domain: Controls clocks and interconnects for data transfer

The binding makes power-domains and power-domain-names properties mandatory
for firmware-managed platforms. Clocks and interconnects are managed by
firmware through these power domains and are therefore not described.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
new file mode 100644
index 000000000000..50361fe97c7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
+
+maintainers:
+  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
+  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
+
+description:
+  USB controller on Qualcomm SA8255P automotive SoC where platform resources
+  such as clocks, interconnects, resets, regulators and the GDSC are
+  abstracted and managed collectively by firmware through SCMI (System
+  Control and Management Interface).
+
+  Access to these firmware-managed resources is exposed as two power
+  domains, one gating the power supply (GDSC) to the controller, and one
+  gating the clocks and interconnects used for data transfer.
+  Both are SCMI power domains that are only switched on and off, and
+  neither carries performance levels.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 6
+
+  interrupt-names:
+    items:
+      - const: dwc_usb3
+      - const: pwr_event
+      - const: hs_phy_irq
+      - const: dp_hs_phy_irq
+      - const: dm_hs_phy_irq
+      - const: ss_phy_irq
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  phys:
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - phys
+  - phy-names
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@a800000 {
+        compatible = "qcom,sa8255p-dwc3";
+        reg = <0x0a800000 0x10000>;
+
+        interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                              <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "dwc_usb3",
+                          "pwr_event",
+                          "hs_phy_irq",
+                          "dp_hs_phy_irq",
+                          "dm_hs_phy_irq",
+                          "ss_phy_irq";
+
+        power-domains = <&scmi_pd 1>, <&scmi_pd 2>;
+        power-domain-names = "power", "bus";
+        resets = <&scmi_rst 0>;
+
+        iommus = <&apps_smmu 0x0a0 0x0>;
+        phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+        phy-names = "usb2-phy", "usb3-phy";
+    };
+...
-- 
2.34.1

