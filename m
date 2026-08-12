Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763EB37F307
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519666; cv=none; b=OkNCsYnURKUuJSTbR7qycmScslSNa9cG9YbDNmPRTvwHywKba85A5oZvevY5Dy6DpqqTIqeoZ9iikE04rcXi7BqIqVItOGlikHbL69h6d1qP0KJheUQ36srreyVAlZXlNf4yftjzQd1O+LmP2f5qAHQ6+o1ZLKUtbPCwXb1wKvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519666; c=relaxed/simple;
	bh=oiaWagE5xaYH7iMDdYzFSg50r7mFMXYroGJqTuc6O5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzkcdTt74x4OohygSmR1ChWzE/Qvj0y8MrRedb1COlTO41/j59rNZPHGt/mzEnZobI3AjkFnDzOzjdlr4YIpaBYLyePlm2QBUaoXtZXhDg16twez41FAkEKzZSsmb0fpU7hyS1iMGDn9n9kUY1lb0R5aGe4ia0MQGlz7YWx0/OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMi+Eoqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHCzeMTL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMi+Eoqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHCzeMTL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62P1a2641583
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+mZbHkGXmAXG4NbvzFIayuY+86nm/e/EAUA89q/Pvw=; b=OMi+Eoqaa6N1tHIJ
	Y8taCfkOYM3yzMPDyawoLYD+F8INGl5W2hCGc+uxYuSWL9uFM818T5LFcmXVeUui
	jfsbLLhXOKumvRhx59gD8Z5Y6xVf8YxbSfdPzeFN3ywAaUaMdRtVnwHXWpoZbi+H
	RKsDPJlHVY7XbbUSwmrG9wM+sISGN2wfNd5vvnaENZD7Si9eb1Si1COt23xcAYuE
	ZTQDYx0AIMbkxM9W39o53HbKbjbovJaFYCcnWposRwJu7cVS6DIKShRrgqQorwuE
	j/R2k3bOwFiqq00c5IHmhsd9P0Bq47dO1xP6BxX3G0k9Tr0cRR8PLd1Sq/i0D+eu
	+DcZyg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049mm0uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:27:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so900783a91.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 00:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786519662; x=1787124462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+mZbHkGXmAXG4NbvzFIayuY+86nm/e/EAUA89q/Pvw=;
        b=FHCzeMTLaFr0zBVEqkC8ggoaMn9OhoHO76RXjioHFERx/WSXQO0QH43rKJkcj8+O/h
         rQlY3w79zXfa4mVM6yxi3pIHiAsUNgEDvIm5ORgwovgXrLPTcb2ViGwi8r90VIn5NjgL
         ULvR/UzoWvpeL91M3SOqA+wlWtR8+LoSzABvenW/N1AF32HRQJw/l6vcxFjLXiow4ht4
         289iUI8v0YvOoTapP6mQ+WRXt1p+6W+2NmN2QN6cA/KSC60IRDwPrHkoHUPTdI90u28O
         eXrPue/ULc2iVi9oYJHUdP3dykcRoirx2NwMejNmBEJTYMoAj6mwglJEQ42N3THk90XJ
         EZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519662; x=1787124462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+mZbHkGXmAXG4NbvzFIayuY+86nm/e/EAUA89q/Pvw=;
        b=WfsdPpM5cAL7Nmh+MNgmpw9Tm0rnisJXs3Hcw2Bi6qf8UtrieJYKeCWrmfkFXL6c4j
         6+hSmPMNLzenlxWgaPy+ipmhGt2MMS5gSiENcyGTiwn9MO1DyOV/l/w/yuuH44lE3cRV
         MPqNw14hCReHsw1vpuXm4vL0EFDhZMDOvYLg//WVqM+0bpf7i6CjBj6lMSOYYX5EA5BJ
         fFmgNyjzxqYZS0GQKnqVwE4mIqevq8KLYd3ByCIQEbWMA7+cyKeyA3tncRN+VGHz+ymC
         /h7GatJ5N3uQMB7ex8QdqH3ryBIh9LoSt2GkubRzgf0/Y3z6URPIK2ZvJI+y4OQiT/ep
         MAYg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5fTvryhG0OiAs1Xsn/m0kPvhyRT6VHtIdhdmJ6rfievD3FuhyeNhaukHwMdLeBSgiUzRQ8kK2eYWf@vger.kernel.org
X-Gm-Message-State: AOJu0YziiWU+p61cKjtdL6jeI008uh9v8X+jpogY+jNfWxFidxQvm0oW
	dcFilcdzGmqXmk0XUaJVG+Hs79j7n8Ph+HQHwJDtyQhkgq2fsBkoHWHYUDod1ScT9moR9x2Cxqz
	h9Pa9YEFFwWTSWhwEQIYjmGEs6Q2WrbZyfnlBsRTQ+7VtBXHHOVnjtM4aYMU2RH5a
X-Gm-Gg: AR+sD13GplHnpUJvILycLyWolKImNXM5nHtyz9AhH/sJtvEqBs+TUlwawzwL/Wug6cR
	GR7/o8IKaci05VnuEwlYjJKE4CD3evFxmJk9UP7CQGq4Erzm7pDbwTGZ4QE0iKBaAzPTd+3Qx7K
	2OYY2ynANITemR3C9qpJVSEljRCRrjHEBtCmYogobl3Q66nZhtST6Ar19tpJwf115NqDhiqqw9b
	PmjIddINA4bGyjvRakdsVXRaxWuAWFg1f+n7KGflonEid0peYFVYR9QDICjo6dMfuVRBFaMiKTP
	QFmYKgg2MGXx6Rsv5aEDx3aBPe1NHkuJ62TdHHGv+hYVNhkpsBERhTUuO1pp/pfct5hR1VG8pl8
	iwrC6XxW2ncg0pTBtawdBeFoyQyq7Daz66ItTDLT5oQso36s=
X-Received: by 2002:a17:90b:164b:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-3930128c13cmr2772479a91.7.1786519662319;
        Wed, 12 Aug 2026 00:27:42 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-3930128c13cmr2772432a91.7.1786519661859;
        Wed, 12 Aug 2026 00:27:41 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f908a82bsm2506965a91.0.2026.08.12.00.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 00:27:41 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 00:27:31 -0700
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-hamoa_tcsr_qref_0812-v3-1-dc7627169c6d@oss.qualcomm.com>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
In-Reply-To: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786519659; l=5198;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=oiaWagE5xaYH7iMDdYzFSg50r7mFMXYroGJqTuc6O5Y=;
 b=XLEGaS4f8Y7jNo8gMScl0pON58w8LqY2bPOPcEH5NOGKzU/NmlcLN4Wo5IuBw8pXG7jsTF6u7
 hd9Hex8UzGZCiwsEZNct8xoTkyOOsA6guyim82p9woEwJC5YotbrYkm
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: hB82lnXRFFxDKo-AWDiKnE-y9w__1Ijk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1OCBTYWx0ZWRfX9UomJNmvA5LF
 iPNIUfyYe4sBgVNL/EWRXongW1oecDBbZx2saU4xavTjcvnK/TW87AW8yrpWviJUwrLzOvBIEo1
 4JWNuySWLbGNW4jo0Exv0YfW4wn2NMEm7q+GZXalF0ji/VZ2b5wOSBH/pHdccbmh+PwFYzz78gP
 LW6QELOhqq5ND8L4l+0hHBsAZdMfxN/mNsCLBiG1pY8tkMWBS87c+f5Kmr+kAh0u+vOhydbdwB5
 3HHF0PX1e87nrUo8HqGvCGhKCnqkige6WJkoxlCvS7lFdE5O3DN01QRtWjGD7x7rBrqlemjubpA
 lZSnI5luzWk/OGhYXMfQCmAVwN1FYSLVdjbAW+3tL7foDBXUaCa2nT9t1SzCi1PribnM9Aiffyr
 p6vpTt57EzjSC/2goW5AARuAfiKbpSGgZwjuF4wWCaKrGaWDRmSsuJnZzGKuvMtgr7t7s8RvDsC
 GixRMRFefPCN9AGD8aA==
X-Proofpoint-ORIG-GUID: hB82lnXRFFxDKo-AWDiKnE-y9w__1Ijk
X-Authority-Analysis: v=2.4 cv=FbkHAp+6 c=1 sm=1 tr=0 ts=6a7c206f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=h7vBL2y6IXGEaNZ2pKEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1OCBTYWx0ZWRfX1tJ9fLKEy5HL
 iu2Bir+Vf2tWnLNurK9KQcxgkSXClGTmREMeXVCf4BdioMFjf9IfSW3pwQ8sfeZowySFyzTYJ8b
 mM8YTJaXx0lAiaxyDH6+tF0eNTm+ivk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120058

The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and
requires dedicated LDO supplies to operate. The digital control
interface for QREF (clkref_en registers) resides in TCSR on x1e80100.
Since QREF has no dedicated DT node of its own, these supply
properties are placed in the TCSR node which acts as the control
interface for QREF.

These LDOs are required by QREF to provide a stable reference clock,
without which the USB/PCIe/eDP PHYs cannot work properly, so they are
marked required even though it breaks ABI.

Add a dedicated binding file for qcom,x1e80100-tcsr and document the
supply properties.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 120 +++++++++++++++++++++
 2 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1f3332275c17..f199655790da 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -36,7 +36,6 @@ properties:
               - qcom,sm8550-tcsr
               - qcom,sm8650-tcsr
               - qcom,sm8750-tcsr
-              - qcom,x1e80100-tcsr
           - const: syscon
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
new file mode 100644
index 000000000000..92fa416e7270
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,x1e80100-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on X1E80100
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on X1E80100
+
+  See also:
+  - include/dt-bindings/clock/qcom,x1e80100-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,x1e80100-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qreftx1-1p2-supply: true
+  vdda-refgen0-0p9-supply: true
+  vdda-refgen0-1p2-supply: true
+  vdda-refgen2-0p9-supply: true
+  vdda-refgen2-1p2-supply: true
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+  - vdda-qrefrpt0-0p9-supply
+  - vdda-qrefrpt1-0p9-supply
+  - vdda-qrefrpt2-0p9-supply
+  - vdda-qrefrpt3-0p9-supply
+  - vdda-qrefrpt4-0p9-supply
+  - vdda-qrefrx0-0p9-supply
+  - vdda-qrefrx1-0p9-supply
+  - vdda-qrefrx2-0p9-supply
+  - vdda-qrefrx3-0p9-supply
+  - vdda-qrefrx4-0p9-supply
+  - vdda-qreftx0-0p9-supply
+  - vdda-qreftx0-1p2-supply
+  - vdda-qreftx1-0p9-supply
+  - vdda-qreftx1-1p2-supply
+  - vdda-refgen0-0p9-supply
+  - vdda-refgen0-1p2-supply
+  - vdda-refgen2-0p9-supply
+  - vdda-refgen2-1p2-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fc0000 {
+        compatible = "qcom,x1e80100-tcsr", "syscon";
+        reg = <0x0 0x1fc0000 0x0 0x30000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx1-1p2-supply = <&vreg_l2a>;
+        vdda-refgen0-0p9-supply = <&vreg_l1a>;
+        vdda-refgen0-1p2-supply = <&vreg_l2a>;
+        vdda-refgen2-0p9-supply = <&vreg_l1a>;
+        vdda-refgen2-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...

-- 
2.34.1

