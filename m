Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826A02F8E93
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620386; cv=none; b=DkXTEeSfBK+6eP+CZQwtg6LjSPIDJiu75NLtsaBN2QIxyjkNzKK6Tw+/y06jF9Saex3HL2dOFvrZr/YX+X/iz3JRli9mBuJHziWvsl3MA9DaaaG0T6DO9dx13W8bSJWoxTZNr6m0xbcIbycq8O2si2E8630JOcNXKhVZUTxeYYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620386; c=relaxed/simple;
	bh=rRF3WvVGBMRkgRj1HIzJTk3VKiCPXFQfaGTIPQAuMkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X5bbxKcxogr4PLrwSTfqVQm+iA0upGuTuZYxk4yt0I+KC07ndWT+Jj8kyUukSAi6d6StXdewl3vDngiG4KNjt8i8KBYFsKyaUQwX9TE7dyip/23waYYHFbfnANW7u64yb94Ibnbtz4n4MlC/Q0j8RMkF0sz9vyQu/+v4+70bC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cycuExxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S34KaefC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cycuExxz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S34KaefC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D938Kq2326306
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 11:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SK3ZoKqUrxS/GmffAsbssI
	QE4S5D1TB6WAIzgrqE7ws=; b=cycuExxzbdIwc+zJAz0H2Ed7geLQekFT8ZOITT
	T9Ov4NPAqI8JgoTPHiwPYVxI33+w5NAbkQydkpk2e40mcIcK8NbaAXp8iIqd6J4n
	YbdOrW8/TSt2shkBxHp9zAjS9UkRXrCEct6gm4J/vUgeWHsaH3DmO/aa4Mhg5zGM
	sD75A4QKEUown7qQyeGkLlr7VXVic/6AKE8w9lNL4D5SNdmGaxqqS4NrKjEXCgRq
	W+mSe0lZUZEiaYhhJmrSr/wNJAIUMqKTJtIjr5rL7WxZ7pFYbnUKVS5QcETbXy3I
	YcDlD9ANkmzZhufPXwRZ/cNIZ4A59nzNPiOpMn8wJFsicK4g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0wt8urf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 11:26:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84865f326efso723297b3a.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 04:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786620376; x=1787225176; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SK3ZoKqUrxS/GmffAsbssIQE4S5D1TB6WAIzgrqE7ws=;
        b=S34KaefC1Zx8MqjxURHBNLzfQw2sVub9k2+woX78L44NIxvJb7sEn63GQ9efJbQRW+
         7viUv4CzlCxtlGuDnO8N3NhPliccsk3Gh7JTuZEYD3TAOoQjZBqZUum+VuwQ+VER0DQ8
         khswxLxl70PfQYq7BSbae42Lv8jJiClcvBUHajE4WPtbSsZ4p77+zm4qXDBI9LG2WqF4
         Sy4ozx7qL0zi1VwHgcI9AZIIF0ZkBU9Rlo/4mj8bQwd68Jjzu5uT4vFdQ64MWoh5esrC
         3DKcgybTkT3qXHA6AMI05jSQgQOrEwOyiamyBD5UqrJJnH6LjJFTx+OcoPqH0HZcQ80P
         lmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786620376; x=1787225176;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SK3ZoKqUrxS/GmffAsbssIQE4S5D1TB6WAIzgrqE7ws=;
        b=N4G8mQdXkZh7b97pRIujVum5SgE2mYik8DYPf7bAQVvv4j3bU55/8UoOt6TBpixlcS
         2M9VV7V737XQnLsGhSJS1JUeWgd/AKDDtoJaXYVTdxfHHy7t9SuKv2cQzcdS3kPgdKMU
         jB38j1a1DvsbbWEl+it7JgAp+vyvQhQCB02QqGXhiQhssx++VCYczZEk1i0pwdeqhVbU
         mBgdbuVW5Kne8Ykz1aX8Oj4CZvcsD6AMs2HR9gjFL1hD1ujq/LSFaV1KQSgQnfnS7U9u
         zXSrWgRi0RjXJGflrKfQP/nwVO17zaCT6ptKwWN3jpJdENk1mKa4D4HqaBTisTyUrVuw
         7yaA==
X-Forwarded-Encrypted: i=1; AHgh+RrwZY3/nP7URUflFNmR4NmRbY3+G7jKrpgGbUfB6vKpFK4j4AqaIILGO8AYVHM1H7NXEGoBXgSPjIpU@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8vWLpPo9+KywbQKGTzVx2oH1mYi1hijYNRr4FotXy3Lc5ltC
	A2JCy4OVof/FZ/1HRT/2oJqQTV/oiV+yy9My0F36G0l1b5wASE7IJbU0Wqq30kdnVJw3oLq9+m1
	zSVdWgJbXaPQpfAJ/6mK5h3MwHsGa5AQq7nWQdQuOvhN3KZD7V5GDjZHhA5dxtgW2
X-Gm-Gg: AR+sD127kU2izzKttYHC0prBWsOmrOote3RGPNY7G+2ohV5KEtIXZvBvQOMmgzNRzGU
	wEpitbR2F92hdcUC1A+TkZ+iAdE9/xDbvv7ec9Gb8d1NQ1ulj+PSjSOoUDvZZdW/JvKA4qDUKOY
	f/FEm9kTX9wdynMEwAiAuhE0bnmZrC1Ra9/SLZzwX0SEmj9Cj+tRFDXggQT80BUTvMijQOHRqqZ
	OIILjUce0Vyzw2sxaGavkeQAEzs6dUC3hMTiupaAIsZ0Su1o10iabWLo1XfSkOuJTeFXHPegTN8
	4nHcMiOLYG/Cyx2QslL+vRRaB20EdE4l2hbTVTZGuexp2wFV18C49wVHk+MqaO93fJxtk3P+oMQ
	2Axmj/fE3EYzG20RVmhVYzqV5YgZtNn/Goyp9
X-Received: by 2002:a05:6a00:3d4e:b0:842:2419:6c0b with SMTP id d2e1a72fcca58-84fc6ce250cmr4905681b3a.10.1786620375831;
        Thu, 13 Aug 2026 04:26:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4e:b0:842:2419:6c0b with SMTP id d2e1a72fcca58-84fc6ce250cmr4905600b3a.10.1786620375284;
        Thu, 13 Aug 2026 04:26:15 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef7234a87sm826692a12.29.2026.08.13.04.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:26:14 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 16:55:54 +0530
Subject: [PATCH v3] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-shikra-pas-bam-dmux-binding-v3-1-167a3fb50d21@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMGpfWoC/43NTQ6CMBCG4auYrh1Cy0+LK+9hXJS2wERbsBWCI
 dzdwsqFMW4meWfxfAsJxqMJ5HRYiDcTBuxdjOx4IKqTrjWAOjZhKStTzjiEDm9ewiAD1NKCtuM
 MNTqNrgUmZFk3FRcFVyQKgzcNzrt+ucbuMDx7/9rHJrp9/3MnChRUSotKcZUZnZ/7EJLHKO+qt
 zaJh2z8xD7J6jfJIqlF0RgpckVz+oVc1/UNDOTOzCABAAA=
X-Change-ID: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786620371; l=5048;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=rRF3WvVGBMRkgRj1HIzJTk3VKiCPXFQfaGTIPQAuMkk=;
 b=EYQXqqlIyZ3JjT4pgrLYz4XimBKfP1eAbbSTSlCOIwPxEVdWGJ+CdD9Nu/U7sU7iaRLsamUDd
 FaLMldae35fDnOMIjXA00hhuKJQYi5Cio0t+Vx77tQWCRA2z5aNwuj9
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=YLqvDxGx c=1 sm=1 tr=0 ts=6a7da9d8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N7Pdq4FjaXXy2ge2MjAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA4MCBTYWx0ZWRfXxku8Lgn6mlMQ
 Pjg9aXt4saWmZ+pbh4mzRiVUZ9KANtFfQS0fXrMDpFKbodrH9j1gfSngrHyl/uVNYMPppIHEhSi
 oeu26YWc6Na7pAJphW3SPTjY5X0pFUucLRsxXlC6pH7ZDxMbpE5cOMiBQobX3Jqq+m+YrtmDeBi
 h7KafQatabpVhdtohgGOCb9xa58ZHRs5URAtjEfMv8Bb/+43SwYSbvqicDcEf3ZOhMLdLgzWXt4
 Y4YpTMBnMRKtVkJENiC/yZ2YszbztTVpFq3z5uXQVn3Y/gXvKZ9cnLloAI8D7yj2E2ZteScg1lB
 ncfRBwe/6erjAP0mfR3IK85ZCjfbDN6TwIoN7MXe54Q7yx7IzsrgmeJawJO0Kfdq6LyUFxj9TdU
 PYVc3I25m4adCSVPDYbMPlXRX9Jkj/YAVLV5wC5k5V9tTEUc2THNuJTMecVb2KTOBgmqKaD3lOD
 MZTBfJfrL8fP7u1E2qA==
X-Proofpoint-ORIG-GUID: QOgMxQdGan274JJPxjToqwLKkQYIOHOD
X-Proofpoint-GUID: QOgMxQdGan274JJPxjToqwLKkQYIOHOD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA4MCBTYWx0ZWRfX293ZdL84+3dR
 jrsheIhcHDFSGZaX8AmSbVAevz7p0tiK/xogdofdXQgUxuqxkWgXOZxKbhVuz9rQKrgYGzYNkyx
 hEBt3cjMC3pH+JpeRBfAoTkYeibDK6I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130080

Allow an optional bam-dmux subnode under qcom,shikra-mpss-pas by
referencing qcom,bam-dmux.yaml.

Retarget the example to qcom,shikra-mpss-pas so the new subnode is
exercised by dt_binding_check.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v3:
- Reword commit message to keep it scoped to the binding change. 
- Retarget the example to qcom,shikra-mpss-pas and add a bam-dmux child.
- Link to v2: https://lore.kernel.org/r/20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com

Changes in v2:
- Restrict bam-dmux to the qcom,shikra-mpss-pas compatible.
- Link to v1: https://lore.kernel.org/r/20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 61 ++++++++++++++++------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 253b14eb2b598f0ca91854c8ff4d0b785090e621..dd779b595677c0aa58708b4fde725e64d8918434 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -44,6 +44,11 @@ properties:
       - description: Firmware name of the Hexagon core
       - description: Firmware name of the Hexagon Devicetree
 
+  bam-dmux:
+    $ref: /schemas/net/qcom,bam-dmux.yaml#
+    description:
+      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:
@@ -117,6 +122,16 @@ allOf:
         power-domains: false
         power-domain-names: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+            - qcom,shikra-lpaicp-pas
+    then:
+      properties:
+        bam-dmux: false
+
 unevaluatedProperties: false
 
 examples:
@@ -129,16 +144,16 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    remoteproc@b300000 {
-        compatible = "qcom,shikra-cdsp-pas";
-        reg = <0x0b300000 0x100000>;
+    remoteproc@6080000 {
+        compatible = "qcom,shikra-mpss-pas";
+        reg = <0x06080000 0x100>;
 
-        interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
-                              <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-                              <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-                              <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-                              <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
-                              <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
         interrupt-names = "wdog", "fatal", "ready",
                           "handover", "stop-ack", "shutdown-ack";
 
@@ -151,17 +166,31 @@ examples:
         power-domains = <&rpmpd RPMHPD_CX>;
         power-domain-names = "cx";
 
-        memory-region = <&cdsp_mem>;
+        memory-region = <&mpss_wlan_mem>;
 
-        qcom,smem-states = <&cdsp_smp2p_out 0>;
+        qcom,smem-states = <&modem_smp2p_out 0>;
         qcom,smem-state-names = "stop";
 
-        firmware-name = "qcom/shikra/cdsp.mbn";
+        firmware-name = "qcom/shikra/modem.mbn";
 
         glink-edge {
-            interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>;
-            mboxes = <&apcs_glb 4>;
-            qcom,remote-pid = <5>;
-            label = "cdsp";
+            interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&apcs_glb 12>;
+            qcom,remote-pid = <1>;
+            label = "mpss";
+        };
+
+        bam-dmux {
+            compatible = "qcom,bam-dmux";
+
+            interrupt-parent = <&modem_smsm>;
+            interrupts = <1 IRQ_TYPE_EDGE_BOTH>, <11 IRQ_TYPE_EDGE_BOTH>;
+            interrupt-names = "pc", "pc-ack";
+
+            qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
+            qcom,smem-state-names = "pc", "pc-ack";
+
+            dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+            dma-names = "tx", "rx";
         };
     };

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

