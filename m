Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69873C9EF1
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896845; cv=none; b=Rd7utzYDBKtsWMRCaMyE/sXuZ3wlnWUSvQTCEoT3G2BelWYxuTETIax3zSG9SkgTUOoGwQgONX07RRBgcqFoKcHw8J8p7PETnWyIzHNgaRYP1qUKdIN1MhIam9bIImKFnK5spjEMQmcZdjj2Reovl6JmqaO5qIXmONg38fnL/y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896845; c=relaxed/simple;
	bh=PKv6mMi7V8bziM8kz/nBz/UZlKW+5RA3VoFJbhSl3m4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6eMiKdX+ea9q9GVbPcw06SZgc0BheuIaOWkLclfzEjjmMgMamQqSabw7RPH713f8uf5H88zQ5XTDoVCTZH4kkteK9V0WbtK07NYph+lhORpfQKPaP0GYhPs/xGtAz5gqFlnRXAPOo+U9jgqN2hv7YLJQbtYTlX2LZuai8Oe6ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzP72+O3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPFscAhP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzP72+O3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPFscAhP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3JcZS674416
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfgZb3K607EC+ZxdTTCmIsNTVC6Kq7MXQmzTNqj7NMk=; b=hzP72+O38lgb9bKa
	7Cm0GbTm3LAvwZffMt26y6gO+dvtL17UswQw6Rq87dmmBGXtchm+nwpYE9bXB4L6
	IsvXI08Qg/LytfBkRrwgbM129qj23ZEowSxL7Ih0fbD8ukEzSYFEzM7BYer2L0HQ
	QzKJxUkL5bTAl+BWwRAGzZ58u1Bk3EuZutMCD9hskWhSzjxzlqQIRB0m02O25PH/
	vYqk++2N8W4UCxSgeMu9FXTi9jHkZvZcTbgAh5Q0asQAJugdJWbpaOYmn6xkEdv0
	O/rml4QYAvA5MYI5BrgvICodXtgrLyezrlQMGoiWBKxktRUv0QJ/mtKt+cciboZU
	wkpj3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatnc2dnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:00:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1376338a91.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 23:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787896841; x=1788501641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfgZb3K607EC+ZxdTTCmIsNTVC6Kq7MXQmzTNqj7NMk=;
        b=MPFscAhPtB//YBRxHMRV6gGHggjU8gQjXOuHV8E1nTUz2lrII0KKUNpAzBkxezVwAp
         DrOX4ucbv112F1gO83+Of0HO/01aYetMydvar90SBu699BaXDXPvA+2xrP9e4Hw15iTC
         uyNJ4ICSJswh4z8eBOr/J5FCKGMnXC0GnRaCKpNg4zygSwi8UsLfHlmxrPTqAWNMj3F1
         31tgtn7TCljGw2RCRHK6R7JnDP2eyePqB6kBrwUpRpKQo8fKvCy7vMueW/CA6cdM2Zw7
         4t89tdB9Sj1MsjZK+yfsKKQsYkv9Ra6fDmJ2k9o1SXrNBKo0P+RpItCxOWcLIHMA9qP0
         mSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896841; x=1788501641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfgZb3K607EC+ZxdTTCmIsNTVC6Kq7MXQmzTNqj7NMk=;
        b=qp4DMjf5kGsmqvxuw9WVJDzOHlE6XSlK9XIXqKeAThnBKj11CVfqSPw+OEoNeI/dCG
         BG22GURjfjHmkwe3Xwtvyk1IdVuQBR/8NlWo7h3oywi9OcHLmXpSSbreGlua0a08wAxf
         rIrKcI11R5Ox4KdIcZdD3ScQnpTXdCCznmoaDHWB/t0zeUAfnAdzuxCYGcQ8p4KXGknh
         jBcjTiRnqTkB0ZsIS21nxl+Ny/LvNyPCoWR5Gf1C+K1OGKVqToZ+fByMWtHMtaBx2L9I
         VzQo2CGxdlnmZ9NfwTfX6+RDkBwuO4AWkO3qY+a5m8aZiguz+tPd3N+ihRwCMgtfwOct
         PHqQ==
X-Forwarded-Encrypted: i=1; AHgh+RosqL5klYiGcf0fJGdD6ghYW+v8wzkO6XhwAOyZ4Gb1IdB8EIhRxFb6YkryGyMZ7sItWnPNLtQ/dgnp@vger.kernel.org
X-Gm-Message-State: AFuF++khG/lDB0qj8hsRCpqHwYEesNpFTbI+ozoknaUXUwYl5a/IDkca
	dUJNYTqQYLBmaRz5sSaceLB/l+TFj17lDyjwWMxHoJvGppoizuzKPaTDyoCY8AAhQMsCXp6VA0R
	XkP4iTCLu75UVnapW6F/nDoEQrv/Ob4OsCSqapAOZVTa/G4+bx51uT9n7TrP+2aQW
X-Gm-Gg: AR+sD10xX4Vfc2khR4mSeUVQGCxu8NLytPXv8qdrRMGGSYwiYj2pj5CPcOMeirq4zbT
	r6kYuyafsyIBGrcB1ll3vh/DJ7iN4EyFNtIlX8WtLhtFZX3akS8dXj7DrVBTlZrj54+T5HHYAeN
	tzvYj0VKguZFwwM4etofsrsD7CuoZiCGBMl/OhLeBL3eiZiopeShXVuDBsh39ovYAiJ5J33sOPJ
	3zSiShj9ZyKoJlibor1AgwpgefEQCx+3eJwDwqO7tfndoWr0ujPFyW/MYrDKIFuId+lt/pxfSph
	i0OKYS60qFFr306Ztx7MXzfxuB9A1C6f495pBYXQtqRZ7jjih+iq3ReoEoNYi4LRWZ8jFdkWiNo
	LqS8zOs5LnyI+ykQLRw6wcVzlT5vS+qkbCQaEyX8WiTFDd6M=
X-Received: by 2002:a17:90b:544b:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-396d0fdb939mr8532404a91.14.1787896840604;
        Thu, 27 Aug 2026 23:00:40 -0700 (PDT)
X-Received: by 2002:a17:90b:544b:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-396d0fdb939mr8532298a91.14.1787896840081;
        Thu, 27 Aug 2026 23:00:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm1759033eec.16.2026.08.27.23.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:00:39 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:00:33 -0700
Subject: [PATCH v4 1/4] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-hamoa_tcsr_qref_0826-v4-1-663c9d30468d@oss.qualcomm.com>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787896837; l=5301;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=PKv6mMi7V8bziM8kz/nBz/UZlKW+5RA3VoFJbhSl3m4=;
 b=62827RoEitkPq2El2VR/nsvzINQBORrcSs7lWoMjwnc2W9uZfzQ/ODmLHKqSedoPCVqgfDgDq
 Vr+99bG17pvDHU7/bGsDKrNQKD26xYnvGWIfWe/RM4QQzQBnKPeIo7q
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfX7is5ccjEpQi9
 RyLM6V0ZEqYAJdz/XLEOMgMKWNLVH43fvGr98QuvQVd78HzTFzSrmUkmgtO8UopgFQLouU9n8IN
 tRNlU+4VrNXwp0fh9mpcPgRFmGgZEfzU06DR+xwGRTMatpkHkcpmt1pDZsEQBUhjgPTa5yIRVZ6
 CI8cyrA15R4JvAUf7MDnTI45MIjY0m0y1QkDMw3VKChMM6/CgyWLk2AE5jpNxj4U2KZYwAMzZ2j
 Vrclorta6Mkvpje02fvnvzHxxAez+zs8+91l+kTFX15qBb2diCfK7Wp8JoWavMuK9su7dSSeHR7
 OdFBxKBbxxwTBoHvcfmnKcmVNXMlZS7tN53yF8ydkAfzKbqE9rdZt+Zu5JgrMvfmCcAAw9w5LPH
 OuiVFRZKKh2S8ex9fQSGi9EIdnU85oMkcQ1DdGtVmMNNvu/+hG2LXrerK7E+c87X+8zUKx3NdfO
 rfuofX6jLvTHl1ZujuQ==
X-Proofpoint-ORIG-GUID: GD6bHXnDmLjAlSZROW5zzcDxMEesRCwA
X-Authority-Analysis: v=2.4 cv=HfUkiCE8 c=1 sm=1 tr=0 ts=6a912409 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1jFqek8pW4xovbWQFpAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfX+C6yythUOck0
 FmMSYrhb2osnCy/3bcvcY2cXW5YZT8whiNf41wvgtX1PST4kUi43nceUteL9XsvZwQGnNBh5bhN
 9+Wj27IliQCK9eDxmD9JGWHEApRbv9w=
X-Proofpoint-GUID: GD6bHXnDmLjAlSZROW5zzcDxMEesRCwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280049

The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and requires
dedicated LDO supplies to operate. The digital control interface for QREF
(clkref_en registers) resides in TCSR on x1e80100. Since QREF has no
dedicated DT node of its own, these supply properties are placed in the
TCSR node which acts as the control interface for QREF.

These LDOs are required by QREF to provide a stable reference clock,
without which the USB/PCIe/eDP PHYs cannot work properly, so the supplies
are marked required even though it breaks ABI.

TCSR does not act as a reset provider on x1e80100: no driver has ever
registered a reset controller for it, and no consumer references it as a
reset, so #reset-cells is dropped entirely rather than documented.

Add a dedicated binding file for qcom,x1e80100-tcsr and document the
supply properties.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 114 +++++++++++++++++++++
 2 files changed, 114 insertions(+), 1 deletion(-)

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
index 000000000000..8163c679fc54
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
@@ -0,0 +1,114 @@
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
+  Qualcomm TCSR clock control module provides the clocks on X1E80100
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

