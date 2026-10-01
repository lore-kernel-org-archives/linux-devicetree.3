Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4652FE2D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867876; cv=none; b=C0loSQmPWKVI7D3DKYkMyzskBbZhIVqIcNZqEikQkwy21Yuwl0R4nQt8Ju0is+fajPIum18eiC8Wk5rrTmffAhkaTTgoWqdULgEdPiGsgBBjmjO6sRg/JwfmdS05ABWm3Ir9nQcWwXDI2xDWPD4EpynxssjLeM2mTMcumX+/Id0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867876; c=relaxed/simple;
	bh=+wyIIa9tjF2+Bi0JIZP4NZjVeg5LIjMjNGMnev8Z5cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1nhbAY5qcnlJbr/TvHx81x0F5IRvgG7aOo2NqWNE4OaDhainG9RxWGtWPsjXHub87sVdtfOdniNgetoCdZhq8KzdSirWsuYA6h3b01cB4IozfVwhWSl/E1CRE9YDy+4vfcDEMBPRl5PgN14dFv8nJnhfkYjnG6WUFe/I7o/fYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoKm3mc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbu81M77; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoKm3mc5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbu81M77"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjKYB2825847
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWMTINqa0N5ulufu3L9vttijrNrWMYu3iwE5P+gD2J4=; b=UoKm3mc5KyORTjOQ
	k4KkcGnoJjMLjI0ElVghWRTCWyHXSwicxwwG0n6+AUbuFqNtSd8rPmaCpZNHZ1Im
	8JTDvtiS4zh8B0wmzo/RVmjl9qmnifNlwosHFdgpF9c0OqRGVIdozQN0R00DdVcY
	EmEIf7ji1CcFIIQrRbTZvN+lT9rYKIIVRBu/YwYYgye3PbuM0w89H7xOmWOntFly
	lfGSeNC6TwyZjgHnc1VNfd+Jmypn6XSsEvgRFWVWihi2hCxasfAXoGVbj5oOakF5
	+ZDEiQAwUmCK5nW45LgpqRE8REytn32nryHxveGIGV7UwaNKLbtdU3HzvKHr0fXG
	QYqoHA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcft8p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:17:52 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14318be7d79so2991804c88.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867872; x=1791472672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWMTINqa0N5ulufu3L9vttijrNrWMYu3iwE5P+gD2J4=;
        b=dbu81M77JTJvDhoP+UJHVNA+wM+YPPlwBUUeL0dsV89QYk+WGs/D17GkTHJrq3Uav8
         1KYwuyMCvk7WfbHsKTr1gXkjolYKYzo/gTcIvbe/PJ6PIfb65kLCXjnSRfhvvOD9wO3o
         Op6OCzwOTmIzEe76JFgSU+aUT+yU8369RW+iJZ2hPHmxUdXW8Qe81iq5n1JC/zSvkn+H
         spe5OCG3tHAvcB8DFcCu5TPSi8JmQGUwpSGltU5Aub5mOYps6AvKzFF1E6/u8cWhGpR6
         giYJIBhYC3UoInwd8N6kloKfczYCxJ+SW/nHb/mvcfwd9rHRZ004SevxRSxW2estqfJa
         dkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867872; x=1791472672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWMTINqa0N5ulufu3L9vttijrNrWMYu3iwE5P+gD2J4=;
        b=GYg8Q485zc3jJNv4nbfkrlZN3Wx+XXCl4JHhy4ou77yUGsXMycfdRH6mCKz621NSj2
         9htwdg9JM7NILn3j5X8isrke5N05s9xEtYNzVJQdQ+wWZHi5rwR15DyofhECgia+yenc
         J2vEF9krAqqBLHxulzspR8RgYfsq+E5AZwpu/jDKJn1FxyQfH6UCIMq52Awv/9Y0+N/p
         fR9MqlsdRW2J92KwTfR2UVmRn87/60uHNnxYRBDHKkDB9JcDnxOS0ENEx5h/NaeKzjpn
         DuZ/1x3h/75hhQHGSWj22a7LKew3pLhD3pbUT4VROx8/U+liEHfChclwXCskMVarWfxO
         bshg==
X-Forwarded-Encrypted: i=1; AKwUvBzGJUUtFm9hODlUoIHeqHmLEH5/8I5riLahuoXbVtVLi4lao9J4Y0X4MHk8l5BPjoC2/JUvqURM9eUA@vger.kernel.org
X-Gm-Message-State: AFuF++kG+WnOhBe3r9U4npaQnfT2sh+NxtQElcRtsatVQ++cSRlVowuO
	yHJ3Dbe5S+Hbc30WcGg5VS7sl5TQCJ9/u/nTHMyFAj/h5ckhUpOnpZMDR+2WLZHivN4V5k7Uhyb
	UBOBsVylM5ht1HKx31/wjc3FiRXRhsUnZr4W4c0SJmfdZLbtwF9I6pxk7TGDbqCfg
X-Gm-Gg: AYBFou1JLgxJQvzFvgQNqIdKY89oWGQOGkSSjkP4wyiQJX2PcDDgwmvYY9SckK0TbDl
	EautWSvzNYVqSgk399uEeQS/IJG2AbCpZffDcSwcVCfnK7nlxRbJ/SBIctEMCkTwH/LO3uyL+oK
	A+WpTnyEmdxMCr+tQGrT4gErJD5qrODx4bTtfmGCE7rMTA3RoemN1RopxdGvLEoMumz+pDc3HlH
	gYmaZQybk7rWxWDCMWuoGINHx+zdd0xm0TToqcBWN3zuPKuQzyQom2hEMV8s12Rn271wdDHOknt
	73GzCN7ii+921UBLwqCJRB6jf1grNYQqJSAGCFjAVLFMOaHq5jMk5Y4oeujp8eOyzj+nM9xyJt9
	/fQjQta4kh4QBpvSciEz0W/6ya+NYjXvObw==
X-Received: by 2002:a05:7022:5f1c:b0:14c:8461:b3ef with SMTP id a92af1059eb24-14d3261c72dmr4319228c88.24.1790867871753;
        Thu, 01 Oct 2026 08:17:51 -0700 (PDT)
X-Received: by 2002:a05:7022:5f1c:b0:14c:8461:b3ef with SMTP id a92af1059eb24-14d3261c72dmr4319190c88.24.1790867871043;
        Thu, 01 Oct 2026 08:17:51 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:17:50 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:22 +0530
Subject: [PATCH v4 2/6] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-2-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=10626;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=+wyIIa9tjF2+Bi0JIZP4NZjVeg5LIjMjNGMnev8Z5cc=;
 b=1hzl9owsdXpgiiN69cQl5dCbfWul7EbKWwllWieGOOEyUsDkF3rHElR3k8vULYlzXM/I0T+CQ
 sDW7Y2PW5G/DkWQQJFzi/iw9/sYrUAyulYf0p9QYdsvK/SOawmdtVEE
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXxYEFPR5jdYVD
 S64zzrb2gfaEah0Oor2I5mZMK/Pm7eaMzgwRSQ98k4OIsdB1nClV85QAWo5B4tCkE4qfjFJHbXS
 +iOGiGit/K9a4kSsQv1ks9W8JQ46xFU=
X-Proofpoint-GUID: 5UyT_q6n47nqJkloxE84WoG9C3D7gkpi
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe79a0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Rh-vyvfIvcITaNYUV7IA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 5UyT_q6n47nqJkloxE84WoG9C3D7gkpi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXwXk/Za1AwhYG
 dPrOT1f94S8ejYGVv9MTqF6hZ3LfMuaM6prqBeXBYemMgFPVedlnORQJpAu0EmJ8R2eYYOkXeII
 jrihyaHvQnx4FatCzYas9rDZFsMdpqNEkuzPsjTS08kLiP9e1QCZE4hXMApObFf2EIds6o4uigQ
 lwAZC6J/oWUH6khl28UM6xa2Hmzq4jSapld9yRoEjER0Ojf5zSxyAtAicwuvrzNbVXE1kqcTVV1
 /q7xI6VJek6LzvybK8GreDYkK1iQg+LBF3+3HtWKzf9fBazB7OZCl9JnorNRQSmqpIWP1RYTgHE
 3JpuaWnsZAOcNCMDxvBMITfS/gzB3x+eKM0D4YWBkAlj3cYCYZCzDWXvL6pwW7zD0TDAcipN7Jo
 Gbu20HfUPpOVFYSysH5yOG7iAnCTfF7Fl15OQdP/r2sKWxSEuPkslziTzTF/3oSdoFLq+tIprdt
 wPVXYkBV/yYwibwVHPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Kaanapali SOC brings in the new generation of video IP i.e iris4. When
compared to previous generation, iris3x, it has,
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- additional power domain for apv codec.
- power domains for individual pipes (VPPx).
- different clocks and reset lines.

Update maxitems constraints for clocks, power-domains, and non-pixel
IOMMUs in the common venus schema to accommodate additional bindings in
kaanapali. Kaanapali platform-specific schema defines fixed constraints
for these properties, so the common schema now serves as an upper bound.
As a result, add explicit maxitems constraints for the non-pixel IOMMUs
in the qcom,sm8550-iris and qcom,sm8750-iris schemas to preserve their
respective fixed constraints.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-iris.yaml        | 227 +++++++++++++++++++++
 .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
 .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
 .../bindings/media/qcom,venus-common.yaml          |  11 +-
 4 files changed, 245 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..02b3fa3b5e11b863cb354240915a2de2c2beb3e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
@@ -0,0 +1,227 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The iris video processing unit is a video encode and decode accelerator
+  present on Qualcomm Kaanapali SoC.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-iris
+
+  clocks:
+    maxItems: 10
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec_bse
+      - const: vcodec_vpp0
+      - const: vcodec_vpp1
+      - const: vcodec_apv
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 3
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 7
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+      - const: vpp1
+      - const: apv
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,kaanapali-iris";
+        reg = <0x02000000 0xf0000>;
+
+        clocks = <&gcc_video_axi0_clk>,
+                 <&video_cc_mvs0c_clk>,
+                 <&video_cc_mvs0_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&video_cc_mvs0c_freerun_clk>,
+                 <&video_cc_mvs0_freerun_clk>,
+                 <&video_cc_mvs0b_clk>,
+                 <&video_cc_mvs0_vpp0_clk>,
+                 <&video_cc_mvs0_vpp1_clk>,
+                 <&video_cc_mvs0a_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec_bse",
+                      "vcodec_vpp0",
+                      "vcodec_vpp1",
+                      "vcodec_apv";
+
+        dma-coherent;
+
+        interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&video_cc_mvs0c_gdsc>,
+                        <&video_cc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&video_cc_mvs0_vpp0_gdsc>,
+                        <&video_cc_mvs0_vpp1_gdsc>,
+                        <&video_cc_mvs0a_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vpp0",
+                             "vpp1",
+                             "apv";
+
+        resets = <&gcc_video_axi0_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&video_cc_mvs0c_freerun_clk_ares>,
+                 <&video_cc_mvs0_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffc00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0>,
+                     <&apps_smmu 0x1944 0x0>,
+                     <&apps_smmu 0x1a20 0x0>;
+            iommu-ranges = <0x25800000 0xda400000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1943 0x0>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 420000000 630000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-533000000 {
+                opp-hz = /bits/ 64 <533000000 533000000 533000000 800000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 630000000 1104000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-800000000 {
+                opp-hz = /bits/ 64 <800000000 630000000 630000000 1260000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo_l0>;
+            };
+
+            opp-1000000000 {
+                opp-hz = /bits/ 64 <1000000000 630000000 850000000 1260000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 6ee9d23554cffb30c92017ef99de15c2493455ac..81d35be565f9a9b2129fea0dec1c9a76ae81da6c 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -81,6 +81,12 @@ properties:
   iommus:
     maxItems: 2
 
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 1
+
   dma-coherent: true
 
   memory-region:
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
index b6d5ded1aae6a1a6836c2c24b1dae548cdc6f9d2..6c1ed1b9fdde45fbcf02625e6e08bdb5b74f7d07 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -43,6 +43,12 @@ properties:
   iommus:
     maxItems: 2
 
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 1
+
   operating-points-v2: true
   opp-table:
     type: object
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 68d5e592a028c5eecde04ce72cd5ae6815ba5c82..85d015d8b021af27da4e81ae8d890d3d855c690f 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 10
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 10
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 7
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 7
 
   '#address-cells':
     const: 1
@@ -64,7 +64,8 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
         maxItems: 1
     required:

-- 
2.34.1

