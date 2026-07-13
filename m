Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A428437440
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954472; cv=none; b=ilnJsWjeUb7YJm/igmSiWHNJ8EsLT3+43+t8qhY2bmdNiGqN4tfvTMKKksCijm23TF+XWOWg1JUppXbUhXclVeooxA6buAj0yDiHA0WlSiqQzVBqeONHwgM2sxSiYx/DgrN9E03fWw1ButP/erxppNTfj4E1i8JpHHX/x6vlEjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954472; c=relaxed/simple;
	bh=B3TLsDqArP03LQKcA8ngy2MaXdpHgeOMi+R6ynsdPHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUeBRcqlfZAJsMzpKCrHhoAXeZDAk3eIqbjzIZqz8vXyEYbkdGYpbbrN/eUt5fXwsJ3LxSvLQvtJ5iW8bFZCzurSETa9Mev+g3h6aHtpus/OdWSOdpGKisKZGI7zDkW12/sKaXL8y9HKowrEdnCAMVek4X2ld9ShQv/P9HgDYVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjF8BRgj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fU8hyNIT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjF8BRgj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fU8hyNIT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEMTi1333558
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=bjF8BRgj6ZKnzL4J
	n5m181xdeZhZSjip4wD+XqlF2QndzsNWq52d/Ovo/ruUao5Rd2I8f3Tv7Lch26xQ
	GbnAd2ZJjp46FYHo5PEkmsNf4jdERSjelwepZLfuCuio/UeSgX08y63GgbNEttpN
	37Qw11PWertPHTiwZeJXs3cf1o8KAIhy8fvhdKEaLY9bjxMHXz87QQ2BdKzqnIoE
	6XEladK+UzY4Vkt3BKT4nfVrw1IphI7KqI711HZuFba9N0Vejy17crzAzyq7YKbJ
	JqPpiJazQ02zxQhHZR3Hpa4GRwD9tVqmnsxbqaIZc2Dj0ByWGpX/Pw9KxXw6pQyH
	tE4k8A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8j405-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:54:28 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a0c02365c7so12045eaf.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954468; x=1784559268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=fU8hyNITj+0OEoFaKh0XOrOo7L+Pf/tR3yoiKu2dwD6/eTzIsBiGU16PlBEXlzWnQ5
         1cClShUHb9fh8achHq016YeihhsGuvtFkjkXnyBYbj31K7DLid/9Qqljc2WDujsGcRwa
         qnD3p4WWUkeeFnu0yketG0tWj2oDP/2QpWKpRwa8C3zZpQJShGa3/nWEIehUT/HH9x6E
         Rcza3yFPvprObrQ5xi/rjTAEyw4iC9QpvR3stxsvsfRksyvc8AcaQmi7U9pfKBljyYu6
         2S1hWXZR4QFeOhikId43ZXYq9kjUBjrVKvJszrrqPlJcxAjKdScApr2P9NNlo68ipveS
         po8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954468; x=1784559268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=bIr087EpX5AvekppxOTJVDWBvYxGR/c+Oh9NGpT1pxJoTWgzTlRQLznloV+W+YwcC6
         ajQqdKo5I3Iq7lTRoD6fIx57QN/FCf+z2xQkwxPuqQxDK94Tl/WcxSpFcGMvZY3X0m8R
         sdOpRTSEWGiNfgyMoCXh8RtAg4hnNaWl7jIQwv9VeWzUl4i2Zqn07O0vt2WZuwAqp2Iw
         nOr9msGwud520Xh/wWQrPnO1weBQhsUtnpZV0RN3h9J/SvVy5jK4cYovLD6ahRRk5cWh
         E7r4eDNNOaUlvvPnJeAJC/YcwTiZ/gfqq2WoM/sbAnB991KBFhOWyvDNmuiBvI6Zlrer
         zq4g==
X-Forwarded-Encrypted: i=1; AFNElJ+Uo0jhBl/50UBvOjROgRSY7PV1nWF5ErDOy3zNbHurPi1ha8M/a96Ev93ailUIlJ2nzyJ0NRg2NuA6@vger.kernel.org
X-Gm-Message-State: AOJu0YxDH4j5VQ+Wywa9gQPgYUo/wFjK7TZ4BfGQvp7g/k9pe4PZMpKj
	iJzvkZbDwRZ1+ODyrSEKQdnSf5Ah4S3pxNm0UTRucPUu3WOXJq+GO/3i+1rwbtZrmoV6Lxuhswp
	ATCXICO3ETT8oV+J4FdxAY2KUba7MoQXJlRsBwaKHVrc2cD2gFCV0xctwXBmYvrtE
X-Gm-Gg: AfdE7ck8NURwV5vi9rJS6BXDd1HM8Xu4r1vZygZhjF6ZoFh09y90lAZ1r0rNTVuu+F3
	5TlhajbESHXk281mP64gNKH6C3sQJ8MlVo2CtbZnDlZd8Sc6zKPREEZbnQTP5cRK6cBi8a5PiHg
	/FET0CtbaRGx6FiUfScbf/iZ3VQvH1JkL0BE38R37qj2m6HoubFmUdfVdkMAN9V8/byDGrt6uDZ
	EHeHzWhZvHPmTFaDf30ELh4MyFdYevBKXZvXNnSVeOj/qWHWxbECBxDrcRqLKyX1swGgmxGSqPp
	1m9bQvURTKer8FaxcynKsSkW3AYW7R4jkkSh2Bug6L2QiJLpy0a+K8ANIcVBkVU8YzFhn7bNTE9
	Jks8UtHXuCWzRNTtCzUsL6i3ycq7mCoUA6Jo=
X-Received: by 2002:a05:6820:61e:b0:6a1:805b:5288 with SMTP id 006d021491bc7-6a39a6cd0e0mr5745418eaf.33.1783954467629;
        Mon, 13 Jul 2026 07:54:27 -0700 (PDT)
X-Received: by 2002:a05:6820:61e:b0:6a1:805b:5288 with SMTP id 006d021491bc7-6a39a6cd0e0mr5745375eaf.33.1783954467187;
        Mon, 13 Jul 2026 07:54:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:26 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:42 +0530
Subject: [PATCH v7 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-4-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: zcQ92ENKgM_McH6Rhnwo2ft-T9XndvBf
X-Proofpoint-ORIG-GUID: zcQ92ENKgM_McH6Rhnwo2ft-T9XndvBf
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54fc24 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX0B/Kgx4/Uc2P
 kWyE86oZNOTbuZdTTGTDgAXpJzSyc4VEdF/zd9DnuUkzt1KliKQrnfxeWPfL+zvyalQesYuIkCi
 Mhzm/ShWUBOUHEEK1H9IDnAaDfFHQkA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX5QBvB139EhFp
 pssF72hLy6KGyCcD/kadbKSXQPpGm4dUuDtHS2wzX+cbw3X1nqKQvcS1jseZjmfan9R9kiYxeTm
 V0gOaySZxYQT8MdVTnofZRPdLW9ienqE8OTg2eqQ8wZ7//0MN36YvYA2xjuJb75YsvrgcvjHkCg
 GQSTCuvnJ7GjES/erByNKI7ETpzTvkQGg/6qS5HhswgNv6k1oM931lvYXlmrR8TcvTgzsm3381T
 eh3MZ3hrpqgBNe4oK0qNaL+HGcRYMn7NXuZdzNKAnd3+Q8h1M7Qn3kwAYcC2kKgdxGNKq2p+Q45
 ZFvQ+deNcvHsAx7JljCVEEZ7kAcKwCHdxwtlReyBTYxQRSkvVdW7EHZWf+429T08vPtOQdwZqn9
 WmuE3/ocXL+aBmbVWEhQwnyQSveEqjhuLtCcXp+J4YRF8VV0OlnzvZ8g/NznaUD8b+niP+XIf8E
 tnmBbrmH9ageSic2DCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 4d8d109cd304ef0f5afc5c3fc7961a6156003d4b..08898f1d74e4ef0a3921eb7cc5f13d14bd02975b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -41,6 +46,7 @@ required:
   - clocks
   - power-domains
   - required-opps
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1

