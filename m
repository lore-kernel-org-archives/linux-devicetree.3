Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE353DD52B
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964453; cv=none; b=faMB0XFs05MzxGzhFmddCOTRbjVU34TeK+ldyhs8UHnFPMCskFE9arWFq3qWHysnNqbUgdgrWzFCtUyYecFfsiAVktXeLP6CtDQpm8yMNhkqvFtxRj0/Qa3+zsRZTVxlnlIeKehImUwjyeHdaDhJLgmTGF/qx5Da7noyyw7+YIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964453; c=relaxed/simple;
	bh=haVptpgq27xoiy5H+ghFCWo2lm0Cu97MuoRlma08mjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WA/dqBETvOxxee8QXK9W8e5PjqqETTXJKgLiAvAbf91DLkB17yi0TTUDnM7E3FORb2JVJYUC7Ho+TzSz+AxpOHTnRSAHlLQzHR9jwb6B7V3gweFN83Qa24oYEv+D7KbZu2hFqQaPRxAE24EZH7ZihszyxN5vPnGDulw5N0ESY54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMGiYZgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNsIcwG+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMGiYZgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNsIcwG+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454Y2Vc1150992
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 07:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTrt52egNPme2cgLBNhr7G7/5o5IRugC+NSDZDNUkq0=; b=hMGiYZgVRzlLM5re
	EWl1vOVARYnltt3r26HnMW1xGYcNJ1XUKURvFr10miEPXmjDieegVRFp2qVkZadn
	9f0/DoXHJ1AiwJ/h6XbZ3aHFvIrBEvLDHbs9UEu3vLY3P2ybtSJ/ZAFFBUMzPD1y
	+F1sKGusrTjwCnAgcg8O021nKdPhpSEwuS8csbWPFNxdTSMqJIYw6vrKdBnQOM93
	lzebNuBHIlRok8m+x93X4cl+2Oy9JMDM2GW9937UYZzNKbO8LGiHzx2adskZzaQg
	2BSaPrZ0ak15pQd291keStRGp5jKZjYq2K3A1kKiyDk6lMCaId+PnK5Bk7ahq0Fy
	A7XgyA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscybuk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:00:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3653638874cso2334289a91.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964450; x=1778569250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTrt52egNPme2cgLBNhr7G7/5o5IRugC+NSDZDNUkq0=;
        b=bNsIcwG+njMzuIRlMjiGUA/Xrv5FCIh9OwenUxw7NUhGtk5Yo51JYrMPOjRsDRcL58
         XPnddI4TMGTwkEpOKFrhfSN2c01+PDre+QeUe+QN/jisbnjAd3i3BCAtpXe6NW9Gt+pR
         TdIaGJLRhzbGjdiS8rH1Wq1ec/a947sH0vx06/I8tS3uxN9/Y54RFLXrkjdwQlzgpgx5
         JnKr2TKSVzhhgYtZdisfbox0XquaCOH+HB3fnytbVxv3MARkqr/ggeKLdrtJV5pRmoMJ
         O4ug7GNo5/kW2c0ItxDbGyAxOCgPNBtFsXvb4qqf34p83Id28Yw0ojoob4rDWAO4lAqS
         SpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964450; x=1778569250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RTrt52egNPme2cgLBNhr7G7/5o5IRugC+NSDZDNUkq0=;
        b=rCzQQnm64A3gjxHdAtVMWrnS2LIX4nwMxKT7BbvZR4OT3t4Tw38Ra8UYs/3tymskKO
         kb7rmFFV59u831G4oddHoFscjxmwcYz80exuk3J9mBYd3AT5MB/EnIe8VQL4KHi40RvM
         Cj3C2uxttxcwO381+HZl3/GUEQeOnr8pJIWm10tF91X9rvLvNiZbZ93I5svZ8aQpOTNh
         Gqw6AeXBIsowNhtEe586YBWRhbcJeoFTXXL0wOvCBAQYOvnMihGCezmX0VSC6mknVZhe
         nABnqpTUjqdWKL/+5NkzFo9CE6gh7Kmi4U+7GtZQ5WXtCbotM/H54oaf3taYsh4yywOm
         8fww==
X-Forwarded-Encrypted: i=1; AFNElJ+JlWcE/lhI1taLTCQ1LZQOo6AkZ1Uuw+8NE+EZtj7RDYADjazG2ZBGmVd4UVjj0fu2bAEhVARMxQXC@vger.kernel.org
X-Gm-Message-State: AOJu0YznBub5T2IPcZdgQ/mtx5hfkOv7gw4Gjwsj1Wc1twiHAUARPVvN
	1D7Dh3ESy5HGfiToeoWViisQrQItmuLoycLj4jvBA4fMccrtPJTLtJA10ykSNKfha4VFlLuiaMa
	eWFqozRJD8rC2rGVWFVyX4ZFEiDneCJHm0ddMe45T/aHqXpbRbfALxlLSJqO0w9fL
X-Gm-Gg: AeBDiesoMc7fGufoDQoa6vyjdgg89OMo99kpytp8Krryyt0XYVDcyo6LNafF3cCb9wH
	rSavAfT+yhBuAcv3Xb0JX8z8Kz6n4JqrzwF/gBr22/AjmrUISZ1YJdDX9VfRnEI+1Tt6HVTLl0h
	ap/XIjWiHFKuloX+/1ZhpD5rmTwv8llkg4GxVHtEXIic4vafw4bKPEGmfksZR9L61IXXDytPy0q
	6KeUwCDnMrFfM/nZ6Iz2SiYx7QZR4NhI7x5wdOXzNdv3Rna1rThiOXGXt2gKh16GLGeeIGyzfQs
	enRBDUGi90Ho5ivdvAkaU4bley6nvc5L3n7jl4wFbE58Yxr5MyxAvseWmT3YhTI8ebrCxAJ5sbR
	ISf41zlvBdCZJt03eamH3UDrABZDTtgMfsh+Vs0XXFKexrK+Zp6TWB2T7yArr55V7YQ==
X-Received: by 2002:a17:90b:2f86:b0:35b:e593:b1d7 with SMTP id 98e67ed59e1d1-3650cdda08emr12089766a91.12.1777964449789;
        Tue, 05 May 2026 00:00:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2f86:b0:35b:e593:b1d7 with SMTP id 98e67ed59e1d1-3650cdda08emr12089665a91.12.1777964447971;
        Tue, 05 May 2026 00:00:47 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:00:47 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:24 +0530
Subject: [PATCH v4 03/13] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-3-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=7373;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=haVptpgq27xoiy5H+ghFCWo2lm0Cu97MuoRlma08mjU=;
 b=bZy3G0h1U+GGLGRzzqWucm2z2f4HazszlWBN8ifukLxO6srlCJmuuKKlud7HiHRbUW3vCoKeB
 6QRPnOjseFnAEcNajLkVD/Oh6Okei1pzRlxEE2V7Fmqrb8Iuh0FLYUL
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfXzzD9Jd8rubud
 gzpb05kUaRdRMPXIxtFEurqS6lcQHnDgvueC495M9GaP2lPy8Clb6QUYOpJqf26UbgEN8kE/FKi
 z+J14IWApkMPU88Bm4tEg/969P891ioTKqvJDC3Q9LCd4jNIr3xixAL/wjjL5VttCHI7CwdUg2H
 90idZru3GG5W259LzwriDpPS06DnSDlyHNaKwyfKNnUA3j3QrLNZO6NQXuq0oToRMw6uZhfOLoW
 kJWsItOSRHncgGx8+WxOgqb2uublCc/TvKR4wf6GirRiBRiDgnvQiDoYFVvmr+ZdzIOrHv+/dah
 AAgKTT9pCzHv+qKOH0kSaWMdm+ONm2rcVMzOr49+ISZcgNtYqgb5gP0DMH+ZN3VR8EjGYVo9rrk
 MXYPuZwigHRz+fXK+2uLPkgkQjg4mZg6XV9iXVO2ikt0ZUwVd5TdNBOHC626CuH7ErQLKouKyT1
 KOIWaDVYf8Tqb27hWtA==
X-Proofpoint-ORIG-GUID: kDwf7_4n4IZGYo6d_wZXA0upcPWPQxDd
X-Proofpoint-GUID: kDwf7_4n4IZGYo6d_wZXA0upcPWPQxDd
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f995a3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UwTKh30HLDACofytdwoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050063

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 205 +++++++++++++++++++++
 include/dt-bindings/media/qcom,glymur-iris.h       |  11 ++
 2 files changed, 216 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..8ff02c302b07
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,205 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: iface2
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
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
+  iommus:
+    maxItems: 4
+
+  iommu-map:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+      - const: bus2
+      - const: vcodec1_core
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - iommus
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
+    #include <dt-bindings/media/qcom,glymur-iris.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "iface2",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommus = <&apps_smmu 0x1940 0x0>,
+                 <&apps_smmu 0x1943 0x0>,
+                 <&apps_smmu 0x1944 0x0>,
+                 <&apps_smmu 0x19e0 0x0>;
+
+        iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0_clk_ares>,
+                 <&gcc_video_axi0c_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core",
+                      "bus2",
+                      "vcodec1_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/include/dt-bindings/media/qcom,glymur-iris.h b/include/dt-bindings/media/qcom,glymur-iris.h
new file mode 100644
index 000000000000..dcaa2bc21db5
--- /dev/null
+++ b/include/dt-bindings/media/qcom,glymur-iris.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+#define _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+
+#define IOMMU_FID_IRIS_FIRMWARE	0
+
+#endif

-- 
2.34.1

