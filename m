Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213998;
	b=vb65OP2/xIv9jGTKNWEElnjLdZGf53fRgLAwWHoJFkrZ6IlhgGo0uollTSWzaY3iVaGy
	 ysLbw285fQvomgM0OpMRunk0mDRgAAh156GiMHuP1BzX68qgI5DQZwTr/yiKSnRfA//qj
	 Is0UbNejzb6QKWfLN/oggxYGi1cU2G3BA9yNZZ3JvYDSnHoCvi4bjuUA+1VeIQEqoFzhL
	 3VOR10YOv32AewKrMy4UIP/bivSZBP8e4OTiakF9FCaZxXWe3AppLdDBUA3N1EeSZp7UB
	 IGgheKB+sJpqA6un+K23Oi2va4tait/oMkL4h0EIozV8MdpVPXCznmdAyP2AtAFx0mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
	b=gN4ZE1wKKzeNl5mXrBj4yPY8v7HJKhZ3M599uxOWrSFpldnZg2ZTwZhfS1uAAoUTpfEv
	 3emYajceNPAB07AmLxOBA/WpnjKhEcMeKIHR9LPfCh8movQZ9pz20Q41d/Ni2DCqYnUi9
	 SiASKnZ4Syvwq+QIz8dW3fdOm3JK44A3fZkE6VAfS+yDqJhkO2wgYmCJ/tVfvyPHnw1Ey
	 dMSVetK8ZJoJPvN3dnQyoQFEkyQK4FzewV4KpNoiQCXshEmywRGXaOHwEd0Ze6DNYNsmn
	 cBwP2OAExfnTbflLw8ezgz4/zvrMexNZmlEfE5HsWN8JJNC/LTaTzHVItuF1AzMjsUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ep/MW92A";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A/A82y9b";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314DA606A32C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 314DA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ep/MW92A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A/A82y9b
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIkSHt3050424
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Kz1wdYhqxOh
	UGYZF5lOTha66reQmCoEbGUOxnWTSoQM=; b=ep/MW92AMSe70dcCsvjJGLIy8P8
	hERNk/Gp0UUP/A2xMSGQrwIcWj7Qi5eBb5vRgaIMQhAiToPri8NiEBYSfr+POUPn
	A2mj1UfuRSjnDJfn8aDsMD7a7nOezhJP6pZOcxjhmOn78iEWbBYCheNG1QxNO4v1
	0FL3f/sFdKTSwAYeI/t4HZtptRyqdPMjyfJikN9WzOnJoNqs2wwLBGgWLufd8LLW
	AnHxH3QQM4JmR7GLQCC+4bDLD7iRKPh6RIDOtam7ZvRG+COuQn7puNg9b2O4H8tG
	oOQnP+wzwhpgIoZ+8wrtPy+jRUmsacpJU+BObyJeXGspjdsTnBjgIKmIdcA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneurcsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:59:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so1764045eec.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213996; x=1793818796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
        b=A/A82y9bamf9FAiiSiQPeluhOlU89xBTAs0e+JNXIjozNluzNO7YX1nNdsRROWEJMN
         W+anD+DXft7e34tQa+4ddc+YN/8wyGryj5T9gtmO8fJ4zQm5+xNOp7Xe6E7YLbYKUUHr
         qDeyxnnsk6I4T1l9qtIyeRdhjGt4w0mwtQLXqI+NMcZ/DoIdVxFgsUYV4GwRTvTBT+Qu
         VNLtQyY4N/AcpR9KgpDecfsfuqxCz3RblAZxuffcKnINO5sgQ3zOLFbQUQHfZABMpsmD
         OLSVsFBjY8+h7wilDyzjRc2aERI7FCwUaW8jIWCpDflHIm/QXZeEKpUydU+C1c9AO5bD
         EdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213996; x=1793818796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
        b=a/RBBOMatKocAQFbBIJoLpByf4G7hh+h05YqLMSqBr5dnywd2ZX9iiDBumhade1Qm6
         3Sbqtpu0a2anyt7QR0YwZqj9mHlknvrLe5HZAOaCz8YXAq9F4lVhk1oREfv9QXqZM3BH
         j2UGDfujdRe7EUOrELsxjBA35up8bbktZpyQPKNtaitMP+En8HIcKTSDD684NG5PetKf
         bkuXMjs9HkEzFxlTXlIEAfVVdGY0bKzk6HUzB/7M/onr4LLeX32OA2UfQ1tcGtlJOJt/
         mjphESdDTh0zPEw0pa0d6ZGaGyb8p+ducESMPTQHdkijmDLkvRnf8xuJsdgbaQA0WMSY
         nEBQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ4Uqyvl7z6OTcNs0CveCbohdMxKjqFVlDIxoHwUlnf8YNm8E68y0ZMJKTMGfoMJKn4bJzbVLJaw4Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLztB50Tj82+IvmEIdGCGABZOJoCxhhAQzG/GqPD9jaANjQuvs9
	d7vKW2UbM6O61OOpqxiBQxM5ftK2U12ab873zvjw6imlTCG0S6BNdqrScVk37CCARg6zJmDV+5O
	Qor//aSDqXf+EPcf05pIBNC1tAQNqGumA9+CkZ1unKtg90N+VAW2s59vOBJK3Tjuaf05+zlxi
X-Gm-Gg: AYBFou1RdDmPyqkI+lXyMlOWkEOwhvcRWV54HmSJN+k53J1uBPjtHUnM0Xu4VMxZgxT
	X0gE62DQBs1ofIadvoh2dHRLe6zOBT+Wm8yjwJ5ErvZW1DaD7v9wgPXsIU/XD0tH0s8UOumPZwy
	l/GkCVUlfjsVC75m7oYdhVBKSGRraU45VPATGWsjNFOSbYPX+9ohMBxL0JC4L/yNDEPsaFitwlW
	Uy7CAYoR9Q0gt7O6AQW5QC/5mqufYAVQAdwg7ESGU6goDDqGatN3Zh35XIHh6So5cvldnzp7cmw
	8JkmD/kGgs2YJ2DWXowtZmvdWwja5R2PxmN2BdKtkNC70T4jgzrtXqowiP6r1ruUcwkSuDWJ97z
	QYnkSrpD+1oRpK1Qb++VzU2bU0xykw6SSH+uFEImw5j3KPxTebFq/SKleLZL8F7evkp1VEm5P4+
	+TZ8a2Ag==
X-Received: by 2002:a05:7300:d088:b0:351:29c8:643 with SMTP id 5a478bee46e88-36a20069caamr3976360eec.18.1793213996152;
        Wed, 28 Oct 2026 11:59:56 -0700 (PDT)
X-Received: by 2002:a05:7300:d088:b0:351:29c8:643 with SMTP id 5a478bee46e88-36a20069caamr3976333eec.18.1793213995448;
        Wed, 28 Oct 2026 11:59:55 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:54 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
Date: Thu, 29 Oct 2026 00:29:33 +0530
Message-Id: <3d056785e2168de7fdc238d274d3d993e0f52464.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX1dXDXU7Vjb8c
 nMv0nauRxryE+7ixNxark6eNmHlPEuGu0Hku+m7FT+l5vqTokRZjPDsQcsPTrTBqMu2p73dofEG
 tcqkKd9/P/70ZY8jTCU79mn9UWF09fdc/MePYD4SjJrfCjZ9MR7rqLDEccV0FMr+IJ1kJhSHq5/
 TK1NunEuyi4JFzvnv8AmatlEZeNbb/14y/ESXL3sGKvYsUqRnAvWbrZ7zZ+evmTZZP8RSqqqwfj
 cnvlFYLa5DwfhOLwKw0b8rlP40Uz+YsxQJZfxQpvFklCVeX2AZ0lSpntXTv6hFBif87GUijiwfO
 TDVQMzSF+B+S0Wj7mInpXR7+wPtjUmPb/KA4lAC3YAdiL81NqIQnkF8+O52b7h/G2iGTMklkHE/
 fN9VYWjlX1HyWvHxn/TekxC5RRXc964w6/mb9GWFCeV2neoXRKuYL6tuM5nRKURsqUa8SrVu7It
 uAoS9660MRfPUZcEqdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX5Zy0JU7Qq9VK
 1Z0KKNFBo0Nzov1M64c2LH8sGdPF8x8riPnxcGu9Xok3BVtwl6dlgs3fS0J/PRjMQwyuWAOSql5
 oCtUl74jopETw06uK8Zpd2jQQiol2lI=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae2462c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=HmkRj0nT5UQon3SBszkA:9 a=bBxd6f-gb0O0v-kibOvt:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: UwMzwGMqz_jS-vxQRr5anDJLmFi4qVor
X-Proofpoint-ORIG-GUID: UwMzwGMqz_jS-vxQRr5anDJLmFi4qVor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

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

