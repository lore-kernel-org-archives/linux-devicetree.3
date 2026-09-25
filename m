Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8055C403E9C
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326025; cv=none; b=Vq9FVbwKsCew8fN8c8hgxQHz6I9xbwRXHJCeuNLh0QIoA4wr2bMm/T691Hi0pwlJh0wUuwyxhPH3zs0R+drpwCevPHfmnnGHGmk55BQpJjjS9ACnj+EHqc+JGDJxx55wUIFf6kIHPamYHpHO19Ri+PFRZRKeQEhEMk9J6Ru9DnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326025; c=relaxed/simple;
	bh=xhxIA7Wnqk3AsQNrfoSlf+f+2hDRBWo7ifCUUnxI5LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hqaFZndveKEInaW9+t9vf28nAJxuFQ7ge4+ZKc/8TmY0mGe7OkAc3fkMgJXitpvu1G7mFQ7gIuCnbBpVZ4z5gZGZljaKvvSeqm5JcK5CTTDJFnF89Qv5QrFoG+PNRowjuBLwsdKEXzczY8jJsgQGaeL/JjnpT7vIxFT13b+K0Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ox+TPQ4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ua0mOtIi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ox+TPQ4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ua0mOtIi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J7Wu601381
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+yDeC3B2RiB
	ycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=; b=Ox+TPQ4Ic/Vkj/LiIilebPImI2s
	OCUTYvJLAE/64M6JYrWbQOyLJ7eFI/03p9DjfB1ibi7Z68F9ShjHa5MRlE5va0a9
	3jpYrph1daX1rC9NcawOYbfTY2NYG23rBYcmC+Wue9Ci9oLXL0smkJlbYGGkopYe
	hsHaMbCB8qt76k9RuPnzcx4RYYTXfnvZlFk3BpXvDzaGyRv107CobCbybUKzh9rC
	PQ9uOQURmJx/uQ8pAw76bWb5pj6uwfk0/zXHP33t0L6mUAbbKVUJl50bp5L3dGA2
	Gy2qJ3FkvO2Izxpa+F1U5ZOASyjyX/GvxJT8VtEqAiu/wvVSHfmEAMTQeUg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrjys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:46:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91431adf55eso8595206d6.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326008; x=1790930808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=Ua0mOtIiZPvM3YgLgGpi8pZ3NTRuXLJ+BOgiI0mdCugxV3M6i6Osi3SgbxXjPw+me9
         4W8cJzI8+rLSGPomAlorxgOjkadtJ/sok0upb4F+4uLnWbqBuO7HjvEPjm+/L2KY5O2m
         P5vXLUeGOXF1n82J4YrkY+JX8GO3hy1zrWhBjGjaLtlneXECOijdXjAeqfosZRiW/U69
         gaLlV3w7mwJQzzJXNrhk3njd48zBkBGa9zUx87GoZOjuI9kVhi4jJR+JMnwLh6hCkKT9
         hP0qNvrgq+RPV1X5L4XmbUv14fteRBLF/BG8ihP0g2gaFsYBNKgacrsooGBEcfWzdwao
         FuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326008; x=1790930808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=jvLQhZMLbjaqEsgd1wCKMXOGf6DmoJlYKz900qzDYL4XSP4yWfug9lXG7CBKTQHft1
         hgPLyNhfGSKREi3FBtKL4rgph/ZoIx+UDIjeTYFv6TbeFaZyam7MldE4Lhn1ihYdDgBs
         bLxG8SlpLcbvfE+tZe1zYJzik/F+IvNHwE4dPQZUyoW7an9neQHo9U7y56bzo4m7fAQy
         WkSPH5m2Jcd+f3sCr8R9+4BiU6p6ZrvakmBJnS9aAW/xdGX/qQJiS08FGQuFeSDa9uI8
         KUZ1VHgReqO35j5LgHcq/7IzyFNsq3jKQb3cxRAhwZfwfmWoTpX/zKtnS0YLshDTF0Ff
         dkrw==
X-Forwarded-Encrypted: i=1; AKwUvBwsME/lwnWq4Xcu0st2dEpeUMRdDgN78HScaPGdtN3mSH2GvzMNTmwWCCCHtxqaWOgGEupE3/hTQdtR@vger.kernel.org
X-Gm-Message-State: AFuF++n8pKF1b5m0DLwRcAzaGdZaVvczIAiKeKhNuWFOlAsAfUe+RHMH
	Z2JbUzEEu04azIx0a3ZZVikMfN4tAn7Ywxzm74oA7lP+P5eKGp29PQQ8fjutmjZ9uzGL9ZNHYvt
	9I8afjeMsV7TUpltDz+LU8i/9QO5Yt7rANwwTEIRHiozHlUPrYvWwoOHtX+TOuUAx
X-Gm-Gg: AYBFou1g3fxK7szaQ7szfo0PmBuoUTsfyh7/IjzZjwqy6A+UffeL3v3XcVPeK8cNOYW
	Ei+n+bAzWEGE25MUCCcm1Opxd2P2Ww/Puu2p9ggAvYonQ0el5IS9ulr5gleD2AimmtLob86b6Qx
	qcc98Tp+TfwWOGlEAVeJ/6M04NzIfLh0/9BJPE5ag8ovHZhhldx3o7s8Eh9/FMdQg/5u2ICruFC
	w/V0uoacnpKRH5Khw/gDKynQzcK/GnzZ0goLWdL2B5sdCiMJjHFxG34nStZ8dDZXJNDnZ5jMFMM
	8sQ8KW4Ekt1/3DjD5s4PCfwI2rtY8mirKYV/gzZh1litVQ0Z3Kfuj5HBKvk/Ay9z1J0I/c2w15o
	+mfPIWC4UiV2z
X-Received: by 2002:a05:620a:40c3:b0:93a:c102:1123 with SMTP id af79cd13be357-93c43bc8ee5mr325647985a.15.1790326008359;
        Fri, 25 Sep 2026 01:46:48 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93a:c102:1123 with SMTP id af79cd13be357-93c43bc8ee5mr325644585a.15.1790326007881;
        Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
Date: Fri, 25 Sep 2026 09:46:32 +0100
Message-ID: <20260925084635.112399-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XkobZAO3qUr5gtl9IfxP2IVPe9ZRWd6W
X-Proofpoint-ORIG-GUID: XkobZAO3qUr5gtl9IfxP2IVPe9ZRWd6W
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab634f9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=yiKMOllxs-7wBVDooBUA:9 a=iYH6xdkBrDN1Jqds4HTS:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX+wVr1HkFDwB9
 9XwX4kBxprXEvgUyzdSCNBNtxxFeEqEbO11N5YFwPwmgid5BlWSvebpxl+QF0UUSyP5chRPZyGa
 Xcpv9X/OeYVmYSPpgpnYc4uYTnP3wnY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX7bXgrW2EZZBe
 7ChSeemOlheYj3IzmxtTSeGSiBmZpBz+gDKghFp6xWuTOhYF6WHBUC7fH2wpX17cM7CZwYnOvLz
 PPfsUGThDKVNfK2lOw8/qJ1RwoG9G03HUWl5rROJIhEUBidktGyi3OB4JaoXcULayXIXEFOGUt8
 gjKsY9ecxmEV9iVZwL7ywuzM6eiUwJG638JD2cT3YvTKRYRMzf7Qqv3zY9MRWv0W5BRuGEg0ULl
 XMJtXY6PFal5LNbu7Vucx1FcZxowDhtrL5UsQMS78NEOE5BTS66C/T/3r+U6uQ228T61jZ5qwEE
 HdCAldLBttEA9Qrdd26c4bKO8RBo4cV9UuK9X8OCKGarNCaTYUQFppaX/kudbu77vVaWG4HYh4+
 jePDTsB/UF97HXlPPbkuF0EtoIPL2zBSTMwDtUNFKel5FtzX3lKbSrdgbm+VUjBpDeLmvYhnIgx
 FUTiCFaqO6S9ie7vEfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250034

The LPASS (Low Power Audio Subsystem) Audio clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 50 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 16 ++++++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
new file mode 100644
index 000000000000..c047c0174a93
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-lpasscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controller on Glymur
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description: |
+  Qualcomm LPASS core and audio clock control module provides the clocks,
+  and reset on Glymur.
+
+  See also:
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-lpassaudiocc
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
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpass_audiocc: clock-controller@32a9000 {
+        compatible = "qcom,glymur-lpassaudiocc";
+        reg = <0x032a9000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0

