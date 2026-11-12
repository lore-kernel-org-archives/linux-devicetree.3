Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472454;
	b=cdLN/mJRwTlxOd7gp096tS3/YNm0volH6Vd3esUcbvHTBKI8zzHHgq8ijmpGJYz357P6
	 SJqv26MDh/fqf/hJSyDFzHNKDs8xGOb/aLviFMMKs0D6nK/2alSZRYpardeGDyGqMD5VJ
	 sMNh0iDImdRHV8up1DSzN6J5iE3OizYNj3GTdoS7pn1vcsI/3gEFLfrLAVfIS6O2faBEH
	 gu4GahInY1oaQJGeNTQ5gMGPIq2e7k6L60fi8ZmVOx3Jp5rbjOn9hgWTBeNVymjGWVbAd
	 en2MPbYU3avIKJF5ZnFGfgbnrAj67j158cPUrJmQtSZX6FetL7FHfRI9hzbM7hly7Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sLmpGIyA/IaBJgsS2Ig830gCZtaBQ/6tjJgsiBIoXKk=;
	b=HAlC5jTbxITsm0bFuRpO+7KuUITyiq5i/4iNB8anpTZCYlb2ZUiK+/VkZi2gnlIEUh3k
	 UAYHvJCJ/C3Ls5mIgVzdE4aFvRBq8hlEdLCjrT1Y8eQS2h7WEo9nX707sWjabpFSGGDI7
	 00F1aAi0/ly2H9v5ZMA5i9LOPeamLKqlGxwcQjuH45XOwTijUPsqqPjyVU18+4MRjcpTa
	 5xcxHzWpNw/WT0oyQPklJZuGDOu5IfOSDeUxxI1J6NMOxZPosz8eySLp0nGsoYbbluxiK
	 hDeLvPpW7sJRT+LO3kqk8ViyaW6c2U6OpMM/WLrBmT4gX0iVHD/Ov1EZ9IEvvK63fUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hfIB6rFc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IkClvEG7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E7D60A380C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E7D60A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hfIB6rFc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IkClvEG7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53jnE3476753
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sLmpGIyA/Ia
	BJgsS2Ig830gCZtaBQ/6tjJgsiBIoXKk=; b=hfIB6rFcBPDKJUqQdCNK3FcgX3W
	giHJhgUUFYJBOOq/OkLEneK6hM8v5Fa0kv3eygZMPuXBtOwTpBYSy1kfIVq1QQ6T
	jq4VWtCVzM4M2E4F+CxjcH29UhuxS4C3yDLCaYwSkxLQaWsA51LnkY0qvpv5NkZc
	n2iVmeHISLBDaubzad0f9qTAPGht+qU7kn6uso0hgfbM3rmb6Ek4BYcgT2M5AwtS
	M/xZ9Abfq21eq6VY+fYP8onc77l4QH1qPgO9dI9ALwOO9+ndIDS7Z3SqiEs2PHOg
	jezrQAdjyxYqo0H/GlSB1ytsWMzgOPzYKvRXUlNNYVkLwEg5Yukqq33dDUw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugq10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5f6002170so184270a12.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472452; x=1795077252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLmpGIyA/IaBJgsS2Ig830gCZtaBQ/6tjJgsiBIoXKk=;
        b=IkClvEG7o2d4srgt/rzj/OdHLHsQtXRjCkPSlg4AwpReAAu9PL/c4jiuwG94ROLNxX
         K7s8Fs2WgOS4Zp7Cqp2wfIXfZc4cdCbzIn+b9PB1dwUx+YHkqQW0oVYZ+pqDAUhDPWgs
         RZazruzEK+3LB0u9Sg/+vKoQh4R7FeACuAHkR2yDVTyjoZoIhkjqwCfSoungEePURdvd
         1qPtnHtOKMi5bJn9wMVs76QD9Xy3UK/9dS45A9snuJoFa/s1nL1koj5RtQJj2OI6OCyT
         NOENi6tJUXWDMwTaZxTzRkAjX2KCZAKBX4qGvkkawmdUi+y5pm+SF1xO0ZEtuyPUxBpK
         i1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472452; x=1795077252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sLmpGIyA/IaBJgsS2Ig830gCZtaBQ/6tjJgsiBIoXKk=;
        b=CGNoSEfB3Rq9yyEDdwqHkrhMMj3jIWFh74ErDTUlkBWJF6rKLjNRI0VOehXNbW41jw
         5oaBv7AMWpNnPKs2y/tEr0IFKQowv1qUf6QgJjMW6SnNNHKZjYuFgH4EALdJWuTZee1B
         qly+hkTUsk+6FGLJddTLRprfAWyFEuuloJ/LboZJsumJxUlyUaMB3rcOPmJoRQzae3VT
         NIM/fa2CkkIDMuusKKIp93BIlL49NHdPqIYG51rK55uTURkn783uSNr//l0hUrKYu96H
         nFRQN6tb0lVRGl0znfS5GwnzJ9mwv0ipcAXuwNgaJfioc6661oHzBKheiaaIEYt+0r9B
         OdYg==
X-Forwarded-Encrypted: i=1; AL+hErGTRPTXC5EnmDmB/aCoNqh6Ysh/dZ0BI77PE87/tV9lI6im1KbTR5xHmiz1td4rclDFXnQ1jHQGyzaX@vger.kernel.org
X-Gm-Message-State: APuU4Z8qMaoU6ypwOuTDgimGEkTpJ+eFthJpaoYBn5qvsjcQaD1h2Bux
	iFQQ4NevmnkNKtiC6RlH16T5+1FawZI8ssddfTgoMqnKVLKFOXkT9IL6uv+r0ShtWlTA46i4BvY
	DCiy069A0oY8Nv/iHshuh64GX+gLr8x9DbiIE0F5nRuD8MPeRN1K5S17jnElGCPUt
X-Gm-Gg: AYBFou01wMeMnJ6p7WDRkcsyYjzKPqvquC8ytzXSI0Kl8ewtvWPeKQ0aGR4pDaIvbSG
	9h6K2PRYQS2aNeSCVtLFWGZ78+DH3yPa/Rif25YpKh0/2XlEPEVKbr8kmM3CAHX11FfHcuMgy5W
	LbG6Nj+fTx55M4+HeiJjRFUYV8Qdo7yiGg8EagxBJncIOD8tmwlDxQavbZUv82btahKlkWgPnXv
	VdDjZp58bqbGFSJzu65g/HylHqiH/kJ8wlphr7DoeL5agNtxaKyajvHNZQj2n19Qfz242NHINsj
	uPDrx2RaazwUsPKz7FexC8k+eRZ3MbK0WWhd/8Qvgt9PcYepeVdzAj+41hDpg/XYr8hdk5tkJ+U
	pc84+uqI5kR3h3x8iFc1c/1rK/cWvO+5pQQHw5Hx0rzkg/7dBjUR/sBMQ7fYcUXzv0jEyvUkEym
	xm0A==
X-Received: by 2002:a17:903:1447:b0:2d8:f4d4:7044 with SMTP id d9443c01a7336-2edd78b9bc5mr77017515ad.3.1794472452232;
        Thu, 12 Nov 2026 00:34:12 -0800 (PST)
X-Received: by 2002:a17:903:1447:b0:2d8:f4d4:7044 with SMTP id d9443c01a7336-2edd78b9bc5mr77016855ad.3.1794472451516;
        Thu, 12 Nov 2026 00:34:11 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm29351705ad.13.2026.11.12.00.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:34:11 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] dt-bindings: PCI: qcom: document the Shikra PCIe controller
Date: Thu, 12 Nov 2026 16:33:52 +0800
Message-ID: <20261112083355.3884737-2-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
References: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-GUID: UT1Dy64rBtq603qlzxeXi86EuSgM-ZHM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX5ZvULjwJndB1
 JG+cj+0i2d56MH47vM7JQ3TNRjGSBE9FieWLQBdjBY14Ri/0DjwV9Wf20Sz7veOp4v+Q4ZHyxBm
 Csq16GGMCzA0/jkUZLHhFG3EmqP/A8g=
X-Proofpoint-ORIG-GUID: UT1Dy64rBtq603qlzxeXi86EuSgM-ZHM
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af57a04 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=jfngk-EiVtMkUzdUJswA:9
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXw+aCGy1MUp//
 o13CVpBP9A3OfZThAooketKOoIKbSgCwvsz5AacCCx0cWOl+FUbYqCse1hIvlmPrgOf9QjqySLX
 zfGjWc9o4lZrQ2aoi0epON1SWEWx+hAoecotKk2LEKKnP2abwLC43nLyRwlHMSeunfQ9/5h0gEy
 RIJWTLgrL3Du07izNybLSa7zSHaZNXUCz0IoA7XnuGK+Rted9EfkX4eBFoSob0DLiD+VToihx3q
 BXNURx4q42CrVfQKwNPycMM4exZcrZKHYqr+08bCMxU/cwPtK2Vn+KKpcr2VLKHDDaCT1qeiWvk
 Fdco7XKSjfBsJgfbxN15czmCge7mCPpYbcdrW0/H3xIiCL0QSmFpc6wiglazDG5UURwH1t0SwsH
 PM1oNUpoNwANaCg6xOfU+Q6ukliLYnu95Eeevb7RSo0c6rs4gc4O3YdVPYrCDwYEUHZlvO9XtuW
 LkYRAFobT1Z5EXRtbQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

Add a dedicated schema for the PCIe controller found on Shikra.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom-soc.yaml     |   1 +
 .../bindings/pci/qcom,pcie-shikra.yaml        | 192 ++++++++++++++++++
 2 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-shikra.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 179aadc86a9f..72e0f1a824c6 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -43,6 +43,7 @@ properties:
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
         - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - const: qcom,pcie-shikra
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-shikra.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-shikra.yaml
new file mode 100644
index 000000000000..69463dae9f18
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-shikra.yaml
@@ -0,0 +1,192 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-shikra.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Shikra PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm Shikra SoC PCIe root complex controller is based on the Synopsys
+  DesignWare PCIe IP.
+
+properties:
+  compatible:
+    const: qcom,pcie-shikra
+
+  reg:
+    minItems: 5
+    maxItems: 6
+
+  reg-names:
+    minItems: 5
+    items:
+      - const: parf # Qualcomm specific registers
+      - const: dbi # DesignWare PCIe registers
+      - const: elbi # External local bus interface registers
+      - const: atu # ATU address space
+      - const: config # PCIe configuration space
+      - const: mhi # MHI registers
+
+  clocks:
+    minItems: 11
+    maxItems: 11
+
+  clock-names:
+    items:
+      - const: aux # Auxiliary clock
+      - const: cfg # Configuration clock
+      - const: bus_master # Master AXI clock
+      - const: bus_slave # Slave AXI clock
+      - const: slave_q2a # Slave Q2A clock
+      - const: sleep # PCIe Sleep clock
+      - const: throttle_core # PCIe throttle core clock
+      - const: throttle_xo # PCIe throttle XO core clock
+      - const: qmip # QMIP PCIe AHB clock
+      - const: ddrss # PCIE MEMNOC clock
+      - const: tile # AXI SYS NoC clock
+
+  interrupts:
+    minItems: 8
+    maxItems: 9
+
+  interrupt-names:
+    minItems: 8
+    items:
+      - const: msi0
+      - const: msi1
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: global
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: pci # PCIe core reset
+
+required:
+  - power-domains
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,pcie-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,shikra.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie: pcie@45e8000 {
+                device_type = "pci";
+                compatible = "qcom,pcie-shikra";
+                reg = <0x0 0x045e8000 0x0 0x3000>,
+                      <0x0 0x60000000 0x0 0xf1d>,
+                      <0x0 0x60000f20 0x0 0xa8>,
+                      <0x0 0x60001000 0x0 0x1000>,
+                      <0x0 0x60100000 0x0 0x100000>,
+                      <0x0 0x045eb000 0x0 0x1000>;
+                reg-names = "parf",
+                            "dbi",
+                            "elbi",
+                            "atu",
+                            "config",
+                            "mhi";
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+                         <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
+                bus-range = <0x00 0xff>;
+
+                linux,pci-domain = <0>;
+                num-lanes = <1>;
+
+                interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH 0>,
+                             <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH 0>,
+                             <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>,
+                             <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>,
+                             <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>,
+                             <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
+                             <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
+                             <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
+                             <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
+                interrupt-names = "msi0",
+                                  "msi1",
+                                  "msi2",
+                                  "msi3",
+                                  "msi4",
+                                  "msi5",
+                                  "msi6",
+                                  "msi7",
+                                  "global";
+
+                #interrupt-cells = <1>;
+                interrupt-map-mask = <0 0 0 0x7>;
+                interrupt-map = <0 0 0 1 &intc GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH 0>,
+                                <0 0 0 2 &intc GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH 0>,
+                                <0 0 0 3 &intc GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH 0>,
+                                <0 0 0 4 &intc GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH 0>;
+
+                clocks = <&gcc GCC_PCIE_AUX_CLK>,
+                         <&gcc GCC_PCIE_CFG_AHB_CLK>,
+                         <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+                         <&gcc GCC_PCIE_SLV_AXI_CLK>,
+                         <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
+                         <&gcc GCC_PCIE_SLEEP_CLK>,
+                         <&gcc GCC_PCIE_THROTTLE_CORE_CLK>,
+                         <&gcc GCC_PCIE_THROTTLE_XO_CLK>,
+                         <&gcc GCC_QMIP_PCIE_CFG_AHB_CLK>,
+                         <&gcc GCC_DDRSS_MEMNOC_PCIE_SF_CLK>,
+                         <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
+
+                clock-names = "aux",
+                              "cfg",
+                              "bus_master",
+                              "bus_slave",
+                              "slave_q2a",
+                              "sleep",
+                              "throttle_core",
+                              "throttle_xo",
+                              "qmip",
+                              "ddrss",
+                              "tile";
+                assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
+                assigned-clock-rates = <19200000>;
+
+                interconnects = <&system_noc MASTER_PCIE2_0 QCOM_ICC_TAG_ALWAYS
+                                &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                                <&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                                &config_noc SLAVE_PCIE2_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+                interconnect-names = "pcie-mem", "cpu-pcie";
+
+                iommu-map = <0x0 &apps_smmu 0x800 0x1>,
+                            <0x100 &apps_smmu 0x801 0x1>;
+
+                resets = <&gcc GCC_PCIE_BCR>;
+                reset-names = "pci";
+
+                power-domains = <&gcc GCC_PCIE_GDSC>;
+
+                max-link-speed = <2>;
+        };
+
+    };
-- 
2.43.0

