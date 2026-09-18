Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709FA4195A1
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789735031; cv=none; b=B4R0W5OgfKY7J0wvxZXSlcFuMPOSPm7gS5O9wMwtjmTMPrqJdr5kiBDzcTacOwrHlwErfP/2v8TwdQKg3YaPZ2mdbqDR+Bby7JvguhqDMF32V8rAtyybJmIks7KAhs1Fc8+Nz+i50Visoe7gRDC66yzgEZkHidoOVEsPzfAWSiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789735031; c=relaxed/simple;
	bh=x0Hsjck6fwiGjBmD4BTaV7uSs3/mId3DYyzS6qMGzL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T8etw/rdJY+9zk0Lmr3/xL8vv/oe5jKlFzrihXyg/ytqJSGuiP69dOVKtQN/QppVQRZvhtCtHzhHUqJZRaNrZtwEKEeTFy5C0ZuZyE7e7ePj3P0tVSUcej8vlii02U0hAeB9vDikmdtCALBWW9agZLwL0hE5p5F8w3FLa0goY+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQTDllXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dwccf3pu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQTDllXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dwccf3pu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA4A523209047
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KoSwLOQDyVXoDI2yhKSH9B
	n+jDhW3ogPztYMI41HL68=; b=FQTDllXs467UR0k+K2OouqMmsFcIwTuKH9izjj
	dIla+1/HZr705lDnkgUXV969U86Spn9H9aIuTnDIvg+OQ3lyco689jGfpFh3smVY
	sp62YS83kSal1nX3LUnN1l2mCPJx5UxsGPQ8YVdkp4RRxuMNloSRKVg718eP4upJ
	Ik+c5NmCcxR++A4VmFGL/yXs0XX8CCJ6/awiVPidKi6fSLNOFrhXPWPvE/CpmHCt
	saxWU7LAla+qTWJcwdXYXoHtepUPjBNNOi/LhxvylaTyK0xR4ABFiN1pMG3UL7fy
	scZhvS3X8TuvT7rBNV8e6ZxppGGSVT48Rb90TU2ZEB4pKZ3g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dghrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:37:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso973537a91.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789735028; x=1790339828; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KoSwLOQDyVXoDI2yhKSH9Bn+jDhW3ogPztYMI41HL68=;
        b=Dwccf3puoStN4Xj3xHFnz4RhyEpscn27E3uiXx/uD5morWYndXSHexkGfwEtxUtwyT
         0eWrKcr/WydSE7AjvZ3tUyhDAXiKvv1VeU72MxsmxF2nnWQxOirFmh5/3fh9XStIFGFN
         p3OW2UsluWB8KOyetO++4QZ/pn/9hoF0mfRsPosmG6DBXXqTgUEF1zq5pOjuWYT70SKo
         Nt9SfouN2Vg7E1mvVnA+utz/sOr6/PMskPTOpSQHeIagRDY+Dao6BYUiItyCoGbZAtDb
         bqJXIdFecx1CWtCuV/EiSyTCbGszIeDaMVl73mogVlZrvO7RF3NSixEzR4spSPni/af3
         TO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789735028; x=1790339828;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KoSwLOQDyVXoDI2yhKSH9Bn+jDhW3ogPztYMI41HL68=;
        b=UuyJ0KV7nLJNZsgnqILStO7Wp4pUuBhD0jp+nCFusJOEllxSmf4srOAY5iKfLtpBYo
         l7xnwCXS/PgIjCDx5k6cQ7PcQRe4t9uosqPIEVVP0en7n1hNqKlmvWAOsgJ1nVNsXLE7
         hbuEAD7mwSwR03ghPRSeEWIaSdkl/+mrgygp3HbBINoXj3x6tEtLNNISoDNNY7/2ZDt+
         mBr7eeOHHR5yo2u9gCujFzBRij1WI0Xu+8IFotEy5IAMmH2rNBcXmG6cgOKhAsqf4lzK
         DNAFa7UXwLBJOQ8+kroNX7Igyl197RUNLjK8kgnpWVND2RjflNHz86L6stcvGM+78NKQ
         zXtw==
X-Forwarded-Encrypted: i=1; AKwUvBzHOtAJCs/3lwcYx3QQBwl6TKZk4qsIA9EVA9+0o1GxGFRj32lCFi1FLzhW8EuGEmTmFP+oHxIBC78O@vger.kernel.org
X-Gm-Message-State: AFuF++lJ79TQtkW2SPqY+LndWHhlFM4EYrqWUVFExc6eI7VYgMXBVxQU
	YQOhuKeNZGcSrbF4B70yPGYZMYL9pxVtzHzdrBSCXASGyVvYS2SaWlNsdG1UQCVHVwRxkkuCfbr
	v0l3niqS4JLbCt8nvN0PUdYPOvBR44EE95mlswSlMLt0zFfpVSV2p+T11adVZc5XJ
X-Gm-Gg: AYBFou019Jus2j3lHDGT3TQe+4xocn4Dyt+j9FlOVPb9Ffi/owvzWXPtwZmoIaLhkFJ
	rEl+aZa+FrVWfkgSxH/cSSm5j1h+IT7akBRGrtshUHcqijxpBqgQxbeS4kHVG/cBhFZD+7nn1j2
	GUBMu+7m4nl1qcPzTm8jnYMEV7nwc/5hUiQaKzG8rh10H4zvzsCY0PXMsxmnAQeQBzk2sSBsuqc
	hKcSLN0MmkBIDOJsG0cQ0kF+RhexHe6TTaTyP0xZi6Q95fs+gqJK31iIXfJRsrzhtOV1DStMzhQ
	NH27YtPdHZwlDt7yMjkbeRG/fIz2ebSxM1PAvt/HHWmZvk0jMV1HwmUQpF/t0WsdhFPnhqw9Db2
	Tad9Zn/Lw7RueKg==
X-Received: by 2002:a17:90b:3bcb:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39e54eab3e6mr9995093a91.12.1789735027885;
        Fri, 18 Sep 2026 05:37:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3bcb:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39e54eab3e6mr9995035a91.12.1789735027437;
        Fri, 18 Sep 2026 05:37:07 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a53a70bsm3104829a91.11.2026.09.18.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:37:06 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 18:04:17 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc
 SMMU mappings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMkvrWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ML3eKMzOyiRN3UHCPd1EQLSzNLYwvTZONkJaCGgqLUtMwKsGHRsbW
 1AP0o8qpcAAAA
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789735023; l=3512;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=x0Hsjck6fwiGjBmD4BTaV7uSs3/mId3DYyzS6qMGzL4=;
 b=Rvg5PIljTCvCMPgrHbv6vNzUiGtOwYMQ32DsDb/VPRbkx96JaJt6R0iupYGN4i2e2/KzlabW9
 TAoHahDSX/tCCAABjiGA7ppZcyk2+GuUdR7QGrJTCqAsh/figQ0Uiro
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3NyBTYWx0ZWRfX2cJRwBHD4mBM
 5bAS0E9XCdX5mK0VBtP8DZDcVFLJI2xROO5KW/SmkSc8wMa5hc5q6taQoy6+kSLQoLmmg7Tv/N5
 Kl9vucqzPmueMChM3U6sITPlIuheWto=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3NyBTYWx0ZWRfXw77h50RhUGSM
 G7E/8m2G4ZwJqM2U/8EGTrid8LByZ7q3N/guEhmNmA3+s3hyWzCQwAUnBbIlI3Yqgyrzkyo4vl2
 PWgJAEenT9jsCEwB97YAD5E2I3EcJUJKYTifRic5BKCk8Ev/Ei0iYV0nAPp7gyYGUNXymFVpFEB
 WP68fXw2feXG22qx2LKbr2V9sXofKxr0BS1y5fxVPYi0OxVIMeW/dzZIfxVHp7HpAsBbvY9OMCG
 i9xYBQ2W4ARH2XwaQegpiQDuCl3rLkuTwUIqP2rPElBp3DFtCr7s0NK90rx9MDCpTPXFMtJ7v1H
 EyUQdc03m0Y2Xt3gQWFLfaM6Djmm3Aw6PALz1M1+nC2FzZMLof7mv9dexaBbaSR5my4Q0zDVmcq
 shhjPwkEWypqYfVKBsMESIjU+9pr2HUf807vmpvb35kP48lShiFG1+PszMFf/QOWai05Z3ZJ+Pn
 QhOCA1fNpIDop97LFsA==
X-Proofpoint-GUID: JsLwS46_bqlv3Cfvx2qnAW-dZRhW6p5r
X-Proofpoint-ORIG-GUID: JsLwS46_bqlv3Cfvx2qnAW-dZRhW6p5r
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad3074 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=f9U2glbQm_qsoaKGCbYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180177

Shikra boards currently boot Linux under a hypervisor, where the
remote processor firmware IOMMU streams are managed by the hypervisor.
When booting Linux directly at EL2 without the hypervisor, the IOMMU
is instead managed by the consumer of this DeviceTree, so the firmware
streams for each remote processor need to be described explicitly.

Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
devices to produce an -el2.dtb alongside the "normal" dtb.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
All existing Shikra EVK board variants boot Linux under a hypervisor,
which means Linux typically runs at EL1. For EL2 boot without the
hypervisor, remote processor firmware IOMMU streams must be described in
the DeviceTree consumed by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
produce -el2.dtb artifacts for the Shikra EVK variants alongside the
regular dtbs.

Komal Bajaj (1):
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-el2.dtso
---
 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5c19f945c785..686d37cab02f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -359,8 +359,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+
+shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+
+shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..d2f3186bd47d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shikra specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0200 0x0>;
+};
+
+&remoteproc_lpaicp {
+	iommus = <&apps_smmu 0x0360 0x0005>,
+		 <&apps_smmu 0x0366 0x0000>,
+		 <&apps_smmu 0x00e7 0x0000>;
+};

---
base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

