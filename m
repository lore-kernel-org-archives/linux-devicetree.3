Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E5538750
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419180; cv=none; b=jHV8Gd4bE7AWqLs91CxZjYVyeDnOCBbPFaYN1ZeQ2alQt/QUL9QUAth/ec6nUvFAQkEsis00kmPIZlz8A8AeaTy38M3MwyVMvynLRTPGILXv6ee7wqsunhS96lVS47c6t4Qfn3PMBLNmN1d9Z0zfsdG+nUFOVFJ8ICvca0gLIUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419180; c=relaxed/simple;
	bh=ONPu0LSZgxyp9psRZyyn8XpJ1SMTJpbgpn4VSE9H4+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPa7tToshwsSEUNnt47itQ3I1O4nCdg3Eew04uJ/vFK8WLzUpmcYPLe/TU3zIgIVsF1pDPSlBJQ1fdQFKsZeRZ65KbvqT88GcrkfC2hRXEf0juTTUjdi5AMFi6bAWOZySiW3jwc+lGZWy5fVaeIcCWRu3cHRg+jhR+tZV3FQdFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QaiJDf49; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlrUfrsg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QaiJDf49";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlrUfrsg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0blo2081552
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWGWXMtOvG27GNt7xGpQwwrvj+GUUH/RacL4BSQYFIE=; b=QaiJDf49e//iZOQn
	Iwuvf0sq3rziCnKjuyATzR8sZiSXuFNEhPC7jHeDVonMGJoaRGa5mnoxuf49pAy0
	Z97k+eiCru6zhzH8UI5e0c3AZ0CWunssCV3SLSwatEvPSYTM7Je7AxmFr1iP2bAS
	tfgBFr/JQFB9X594DFSvAhYQNzpB80kj97u/zskuGmh4JeqhQzCqBQvv31LmHQtM
	2JEk1vADoTNM/JcfRezpDykabTrfaN7Vne6mW17+nPSRh6v9hYsJh35eeIrMhJeB
	PfGdBz2LuhTgwa8hjBco4wRdGERbHQez6xA9s/NWL8c+bITbCAsqJBy+/2ktEXCs
	3hAoqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rhhqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:12:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so827641785a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419177; x=1793023977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWGWXMtOvG27GNt7xGpQwwrvj+GUUH/RacL4BSQYFIE=;
        b=MlrUfrsg+c1uTp/ldfmxSKzugodfNG0vYYxwuZz2fMZ5E76rahspj574o4d9/merjB
         xV14bDIXMszPRgyrMr0qgOUz9UaBDNIJf1VkjcID+q0A6aRgauyZMoWFRITMItvlu8ll
         HjZbG/jiVSXf7S2LqGOz5mMcwlrOu5X/Ky1ORTmEQF6DivTwZwQSWRoNKVoDSLz6mJkp
         Rvh8N1gQDrVC6g26SCCETPBP4aheJNegpmmn+MbEF+c67QFuM8xlIrZvqETpCWe+d/8O
         DWOoawx3I95eYT2BrHoQZdG7pGGwIwCefG6yucAvoYI+a0uOF+LSJoVrp2umRBbrDEuL
         GrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419177; x=1793023977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWGWXMtOvG27GNt7xGpQwwrvj+GUUH/RacL4BSQYFIE=;
        b=JYO8o46Vp4QtwR363CsWiEEhANDEWjRFozLR8YxrZexCwclgMVADprMHBefgUjVmLH
         G/zJc1+onXUqwGwszTgYXW5gvW1JQ6Y+U4ToWwVgfnjFSLWb+U+xHkZE2+2k+rediLNY
         Y1il+ZkfxSmXlp5yQL/gPq/Y252qe8MIdgmS/Sbudx2LsRmeCpvQv3GRPRxoNjO0aUGA
         h1k1N+SQApkG5Gxlg+EaaH1aK515dMmXZZvBQJ3C4i/TSsFYDJ+KJKmQt13EQWpVyCs1
         yDhP7loNanCA5dWlPNSgpA+vN59u6OnLb9AUyao7y942IPSNMbbtIXDZ2fr/tU0GzoT5
         D9ig==
X-Forwarded-Encrypted: i=1; AKwUvByMLz+kFrkQNmW7zacDDWzaxz2kxbS3Ncr7y6aKoAT3asGO0QwGd8/Vw5MAvkjkdtC8tBI231x8rZvR@vger.kernel.org
X-Gm-Message-State: AFq9FYKWuFwVhBenqx8uCcXSRgUygJatgm9S5dFeLTEBntCufDryKZSz
	gsDhfWbH51Oqu6KAYr8mT5HHF4y/vs8zlCZxZKqwAbUoJLQjk1mjejlSQVmvyToL7fyrRrB9tVu
	spmc0KEbpJcs19+THEbGz4rVzRSi/9r8a498Dm5HKCn5f2KBr6ieJ3ITw8qTydsrKcwoMj3UG
X-Gm-Gg: AYBFou2kf6/3rSsfdorwfNvBIsg1TdJbWsFsb0nanZJbqoCYV0TFVWrCKoD+HmvjmLN
	TIkvD3SsQ8SkmIxzor1c/UPvWbLjc+xoRa/Teug2JNNZElZg7vM8uuzm3EVzU36ZE/OjNPix9uI
	o0RBT3M7MSxfDeUc+8mBmNl95zcZXjiBIqXviNaqhtaUdc5UiR9sCkruwe5J9Ah80ajxBtaoQsI
	5bFxCtTqaK4YfPRttc0lmbOeeseWygZnyj1FKmLUZycZO9Ay06qnlWtIiXJDdHpq0SGkAuZonga
	Er46vnGsruWmSbq7VxWsuOjADy0ilzZlnDOFunrLjeuwbvGWnt1HMdnqJeXb/l6gx73/4fF/QJJ
	XqKh4kzuIO1UOcDLBxQqNri0F0v7wfaiktyoJOMVhi0GSAGhmaOb7x33dH7+R/MxR0pQQlJ8l3I
	hsZv8AG3Fmvyw8
X-Received: by 2002:a05:620a:4153:b0:93e:6100:6c1e with SMTP id af79cd13be357-93f29cf7a21mr1330365585a.30.1792419176949;
        Mon, 19 Oct 2026 07:12:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:93e:6100:6c1e with SMTP id af79cd13be357-93f29cf7a21mr1330359985a.30.1792419176280;
        Mon, 19 Oct 2026 07:12:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm2015922e87.14.2026.10.19.07.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:12:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:12:39 +0300
Subject: [PATCH 1/8] dt-bindings: interconnect: add Qualcomm MSM8998 NoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-icc-v1-1-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9681;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ONPu0LSZgxyp9psRZyyn8XpJ1SMTJpbgpn4VSE9H4+0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Y11fh10WLzDUx1nOMiNfZte2Mr1/n4Cg9Pu88svfoJ7
 R+1vs7qZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE3jiy/1OpD41+f/73yzYB
 y5ytFx6wFYZ721wpf9E99Um84pJ+42c+3JuSFb1iLiR5HzvR1cNa8HRzlJivnZBXctjKB0eK+bj
 57zd/EGapYq6waOa7qyXXKv3lwMzlM37tj1PvjKx/yt/VU/HXQ/lWR+ZHbd5jU9nqah/vmLnF3j
 IysDtd+j5DeH6O8mv17eUbCvYq7fF+3xu5JuXPrpMlkV+f1/7+2/wqVCSL9/CsnOqtv05ZRRUdC
 bETea1ZFP1mY0LKC87ysMMWkw+qSG3edW3yyind886wPxQwZSi9uW7tav/zt2O0Wi/ZHVlZ4CFW
 cTrHrKriyU21znXzQuocEu0V4vfcrb50vej6XHGzgPA3AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: RlBTjuQviR0siU-1g0Mq22Cf6_kV38qo
X-Proofpoint-GUID: RlBTjuQviR0siU-1g0Mq22Cf6_kV38qo
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad6256a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8 a=VwQbUJbxAAAA:8
 a=VEq_dQRechr_YiBZk3UA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX0eahIptqomJV
 A8OTdHSMT/oWChk4H+AxD11d6UK1Z5FJWhgZFpy+z4luz3a71ctbjlyUvuL39ttZ1oy2oKrHHuT
 L2hDDx1n+XHgbKKz51qsOgOOvEZpVVLsgOyW9tnKRNjZlFVCGxGffxY+daPIZyOUeuHZCXiORb/
 fQ4Msa5A8iYT1ZVbaXS8nlSZDrGp3lBT5ybSrnRmMHffBdpq0UMOlpwtasUqCojRRjWF70fe9Ub
 o/zT7ELCm0e8mhN3NaU4adfffooZIc/UiuahshssvKSGdyFTJhrWFMZU71ZUHyxf6DQ8yntU2th
 xzv1waW4lv8Ls8gL02tV/UkfuSKupWe0kau0BcVRH98hAd1M1vtdS/vPFw49aYMC1m/AR7pjVmw
 TDf4CwNQ7cuGjnym52z4AhAPSC7J8nowQ44fisoYhY7QPD7A0I6LjJZGkshdl7tjAAmriLcitwr
 iLCBni5iEC+iDGpJnKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX4fTqg5fIEaOS
 eMS2/hP/kav2NNLYZp3Y8SBGD/TQMzzcuo0tL2e96KsDRPYkaIouAowQk/kh4+uFVW7gRaPBwo7
 2z6AUzLR/ulTHnyUkRpyYk1bK8XoPdA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190056

The MSM8998 interconnect provider driver has no device tree schema, so
the provider nodes it binds to can neither be described nor validated.

Document the eight MSM8998 NoC devices.  Unlike the older RPM
interconnect bindings, the bus clocks of these providers are RPM
resources handled by the driver itself, so only the interface clocks
appear in the device tree.  The MMSS AHB NoC has no register range of
its own - it shares the register space of the MMSS NoC - and is
therefore described as a child of the latter.

Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,msm8998.yaml        | 192 +++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,msm8998.h    | 133 ++++++++++++++
 2 files changed, 325 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998.yaml
new file mode 100644
index 000000000000..0a05dc620cfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998.yaml
@@ -0,0 +1,192 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,msm8998.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8998 Network-On-Chip interconnect
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description: |
+  The Qualcomm MSM8998 interconnect providers support adjusting the
+  bandwidth requirements between the various NoC fabrics.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8998-a1noc
+      - qcom,msm8998-a2noc
+      - qcom,msm8998-bimc
+      - qcom,msm8998-cnoc
+      - qcom,msm8998-gnoc
+      - qcom,msm8998-mnoc
+      - qcom,msm8998-mnoc-ahb
+      - qcom,msm8998-snoc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+allOf:
+  - $ref: qcom,rpm-common.yaml#
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8998-a1noc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Aggregate1 NoC UFS AXI Clock
+            - description: UFS AXI Clock
+            - description: Aggregate1 NoC USB3 AXI Clock
+            - description: BLSP2 AHB Clock
+
+        clock-names:
+          items:
+            - const: aggre1_ufs_axi
+            - const: ufs_axi
+            - const: usb_axi
+            - const: blsp2_ahb
+
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8998-a2noc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: SDCC2 AHB Clock
+            - description: SDCC4 AHB Clock
+            - description: BLSP1 AHB Clock
+            - description: IPA Clock
+
+        clock-names:
+          items:
+            - const: sdcc2_ahb
+            - const: sdcc4_ahb
+            - const: blsp1_ahb
+            - const: ipa
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,msm8998-cnoc
+            - qcom,msm8998-snoc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: CPU-NoC High-performance Bus Clock
+
+        clock-names:
+          const: iface
+
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8998-mnoc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: CPU-NoC High-performance Bus Clock
+            - description: MMSS NoC AXI Clock
+
+        clock-names:
+          items:
+            - const: iface
+            - const: mnoc_bus
+
+        interconnect-mnoc-ahb:
+          type: object
+          additionalProperties: true
+
+          properties:
+            compatible:
+              const: qcom,msm8998-mnoc-ahb
+
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8998-mnoc-ahb
+
+    then:
+      description:
+        The MMSS AHB NoC shares its register space with the MMSS NoC, so it is
+        described as a child of the latter and has no register range of its own.
+
+      properties:
+        clocks:
+          items:
+            - description: MMSS AHB Clock
+
+        clock-names:
+          const: bus
+
+      required:
+        - clocks
+        - clock-names
+
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,msm8998-bimc
+            - qcom,msm8998-gnoc
+
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
+
+    interconnect@1008300 {
+        compatible = "qcom,msm8998-bimc";
+        reg = <0x01008300 0x77d00>;
+        #interconnect-cells = <2>;
+    };
+
+    interconnect@1740000 {
+        compatible = "qcom,msm8998-mnoc";
+        reg = <0x01740000 0x10000>;
+        clocks = <&mmcc MNOC_AHB_CLK>, <&mmcc MNOC_MAXI_CLK>;
+        clock-names = "iface", "mnoc_bus";
+        #interconnect-cells = <2>;
+
+        interconnect-mnoc-ahb {
+            compatible = "qcom,msm8998-mnoc-ahb";
+            clocks = <&mmcc AHB_CLK_SRC>;
+            clock-names = "bus";
+            #interconnect-cells = <2>;
+        };
+    };
diff --git a/include/dt-bindings/interconnect/qcom,msm8998.h b/include/dt-bindings/interconnect/qcom,msm8998.h
new file mode 100644
index 000000000000..3eb571e65554
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,msm8998.h
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MSM8998_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_MSM8998_H
+
+/* A1NOC */
+#define MASTER_PCIE_0			0
+#define MASTER_USB3			1
+#define MASTER_UFS			2
+#define MASTER_BLSP_2			3
+#define SLAVE_A1NOC_SNOC		4
+
+/* A2NOC */
+#define MASTER_IPA			0
+#define MASTER_CNOC_A2NOC		1
+#define MASTER_SDCC_2			2
+#define MASTER_SDCC_4			3
+#define MASTER_TSIF			4
+#define MASTER_BLSP_1			5
+#define MASTER_CRVIRT_A2NOC		6
+#define MASTER_CRYPTO_C0		7
+#define SLAVE_A2NOC_SNOC		8
+#define SLAVE_CRVIRT_A2NOC		9
+
+/* BIMC */
+#define MASTER_GNOC_BIMC		0
+#define MASTER_OXILI			1
+#define MASTER_MNOC_BIMC		2
+#define MASTER_SNOC_BIMC		3
+#define SLAVE_EBI			4
+#define SLAVE_HMSS_L3			5
+#define SLAVE_BIMC_SNOC_0		6
+#define SLAVE_BIMC_SNOC_1		7
+
+/* CNOC */
+#define MASTER_SNOC_CNOC		0
+#define MASTER_QDSS_DAP			1
+#define SLAVE_CNOC_A2NOC		2
+#define SLAVE_SSC_CFG			3
+#define SLAVE_MPM			4
+#define SLAVE_PMIC_ARB			5
+#define SLAVE_TLMM_NORTH		6
+#define SLAVE_PIMEM_CFG			7
+#define SLAVE_IMEM_CFG			8
+#define SLAVE_MESSAGE_RAM		9
+#define SLAVE_SKL			10
+#define SLAVE_BIMC_CFG			11
+#define SLAVE_PRNG			12
+#define SLAVE_A2NOC_CFG			13
+#define SLAVE_IPA			14
+#define SLAVE_TCSR			15
+#define SLAVE_SNOC_CFG			16
+#define SLAVE_CLK_CTL			17
+#define SLAVE_GLM			18
+#define SLAVE_SPDM			19
+#define SLAVE_GPUSS_CFG			20
+#define SLAVE_CNOC_MNOC_CFG		21
+#define SLAVE_QM_CFG			22
+#define SLAVE_MSS_CFG			23
+#define SLAVE_UFS_CFG			24
+#define SLAVE_TLMM_WEST			25
+#define SLAVE_A1NOC_CFG			26
+#define SLAVE_AHB2PHY			27
+#define SLAVE_BLSP_2			28
+#define SLAVE_PDM			29
+#define SLAVE_USB3_0			30
+#define SLAVE_A1NOC_SMMU_CFG		31
+#define SLAVE_BLSP_1			32
+#define SLAVE_SDCC_2			33
+#define SLAVE_SDCC_4			34
+#define SLAVE_TSIF			35
+#define SLAVE_QDSS_CFG			36
+#define SLAVE_TLMM_EAST			37
+#define SLAVE_CNOC_MNOC_MMSS_CFG	38
+#define SLAVE_SRVC_CNOC			39
+
+/* GNOC */
+#define MASTER_APSS_PROC		0
+#define SLAVE_GNOC_BIMC			1
+
+/* MNOC */
+#define MASTER_CNOC_MNOC_CFG		0
+#define MASTER_CPP			1
+#define MASTER_JPEG			2
+#define MASTER_MDP_P0			3
+#define MASTER_MDP_P1			4
+#define MASTER_ROTATOR			5
+#define MASTER_VENUS			6
+#define MASTER_VFE			7
+#define MASTER_VENUS_VMEM		8
+#define SLAVE_MNOC_BIMC			9
+#define SLAVE_VMEM			10
+#define SLAVE_SRVC_MNOC			11
+
+/* MNOC_AHB */
+#define MASTER_CNOC_MNOC_MMSS_CFG	0
+#define SLAVE_CAMERA_CFG		1
+#define SLAVE_CAMERA_THROTTLE_CFG	2
+#define SLAVE_MISC_CFG			3
+#define SLAVE_VENUS_THROTTLE_CFG	4
+#define SLAVE_VENUS_CFG			5
+#define SLAVE_VMEM_CFG			6
+#define SLAVE_MMSS_CLK_XPU_CFG		7
+#define SLAVE_MMSS_CLK_CFG		8
+#define SLAVE_DISPLAY_CFG		9
+#define SLAVE_DISPLAY_THROTTLE_CFG	10
+#define SLAVE_SMMU_CFG			11
+
+/* SNOC */
+#define MASTER_HMSS			0
+#define MASTER_QDSS_BAM			1
+#define MASTER_SNOC_CFG			2
+#define MASTER_BIMC_SNOC_0		3
+#define MASTER_BIMC_SNOC_1		4
+#define MASTER_A1NOC_SNOC		5
+#define MASTER_A2NOC_SNOC		6
+#define MASTER_QDSS_ETR			7
+#define SLAVE_HMSS			8
+#define SLAVE_LPASS			9
+#define SLAVE_WLAN			10
+#define SLAVE_SNOC_BIMC			11
+#define SLAVE_SNOC_CNOC			12
+#define SLAVE_IMEM			13
+#define SLAVE_PIMEM			14
+#define SLAVE_QDSS_STM			15
+#define SLAVE_PCIE_0			16
+#define SLAVE_SRVC_SNOC			17
+
+#endif

-- 
2.47.3

