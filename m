Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB6CEED8
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893998; cv=none; b=sjVlwlJV+gm7T029kAnmJoCZYSPebhM5tq4Gol7bV+wUm07rY32pK2Zka47z1HSfCmehxGmq1N1JCawdDHg7LHcbbqPoZytlKc1DDhNSMiIbX2n9oG0W1hYr/2AAmi+hoEcDtJupKRJduzhf3Rvp8laRhfV52XlH1RTKwAo6AQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893998; c=relaxed/simple;
	bh=EGv4GYvLJhMHC7C7MhV0I+x/rtFPkL/J9u9qJvy2w1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cwd3V8kyZn0KLcU1ZfDE53B4Tmnetjlh/PFPnjCbVeDdzaI3EPJb8nFl8ia4Zx1l0xKWNupScmwEiRUxSGhWcDiq0QafmM1ABTn5ne0CF+rkhIPkPkCh2PR5F3UVvr813x7YImqVX+xSW7BFNJsubXPkkRfHlS/MS90zN6YImVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bx+VYOFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pd5sTjrF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bx+VYOFQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pd5sTjrF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618Ft5U479248
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kH/fZ8T7ln1
	R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=; b=bx+VYOFQD1CqlEeCZqD5nn2mjpF
	Ww9dVBBKuy0uCNvOVRmRcPdAotvYLM0os8OhanhXyRF2CduBM4tW2q3bl2ScZqjJ
	T9p6cKiq9q3jocmdw+dUW3zs7CsPpZxMt48JsvoLOxwKupJe6I/J6xfDrYKnPszv
	q/T1o/VotUz9ozUNUaf/+SVQ2114VdQ7fp9uUXdgSyUXAHo9qPUmrsTU5+ydMjE9
	sLoriBjqsWdgXochZSCMHbbubsMmNfVwG/2H5aPc16gOFHgWwZKKqMVSEokp8Zbx
	yCG2IZkMverxUmMWDxdm/SFpxh9MST4Ot12PZAdJkkaOB2ppMHKGcA4WYcw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tgdtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:19:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84770f89b99so751613b3a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893995; x=1783498795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH/fZ8T7ln1R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=;
        b=Pd5sTjrFIBmMOpX5+7btpxQonUfRW7jWyp7YF68VvfHU9WXUTKBtVyV9nwhXx2rClh
         P/QgDRUGMGsoO5G3AT4fUHIIt4QCp8Fj3ZGvu04GDeGwj2/5/OgJ0wFDEDlXjXO32Qxk
         KUjBaJhWUSTF2LqqaG0i4xvqRLTa3HBx4IMpr6rrRthr6u557AXTF5F2ynwBIjuJ3CHc
         lRrVqM5RWAmFxwR06Pd0JeIuot6A88yWlxn0BG0fsC4P/v7FDcU1m5REYMD3qp/4OYhP
         6ClhhxUtVM2dq11XFzKB3u+glarnPcBy4a9nMCDbjarpiErb9jnj6WHoq1VMWapsDVyo
         Xvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893995; x=1783498795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kH/fZ8T7ln1R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=;
        b=ICEPCcbLvUrXjCIup4LkUsfRIGyD4FQMYYG6FYe4AaCldAVVrVBcA81k8Oiqm664Oq
         jxcaNsfun/9K///O+o5C9MXrID12r2PtfDnP73ATo+vxOjZ520mhCALMZ0xFyGHoMxxC
         LwL5fISrthJGa5a5s4P1O5INw5/4s8+/Fjs+Mplaor1r3/7gIiwQbNpKu0re7bFgWoV1
         B5Bclf6Z5Ov5yYZClCV0YxR94umybMTjb0rYzqUK3eAHOLfa1xZ/SyRmsnDRyp9/rkHE
         sSgWTdUGUd7QjT779wVuQt103S+558SNYJDuo9XSWtIEoZ8som+e4G5PKhU8flHi3dyv
         j5Rw==
X-Forwarded-Encrypted: i=1; AHgh+RpM0asAN7gl+gk/kBqQuP3NU4ozrkZiCBA3RTxmx3qPC04qbP/nutFSRnKh416XjLsKTxjTvEF+sO5Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwpcUxvCZ/VaXLD+pRKfqaztgwFriFy3y9L5KppNbyzWAcGHnxm
	x3QutX+pLKydNb02ZSc9C+ZGYKvrf+yfpQ4RdROjKpiYUCNGUdTT3xuhBjUA6LgwpO7SSJXGD/I
	4J05a35HuHDNqeWwHx3TCy2CGgUQ3Gzqkc/FH61IyIfRMvBofoA0yaUVjWeYzcHPO
X-Gm-Gg: AfdE7cmGc175kH3/RQWc+sRiHZLCm8J463/3Pv6m/5sEQwvKFQ84EqqF9qIZJb/MRbZ
	2h0/SsOdPr7TJP8vQKgJDHbSUjnMDogi10FrHIK7Y2M5ImuPtQKcEkTYTcED6ADyVaoT+kFjiqr
	goD4PjzWYImaXSiIdJl3mCyZBYuyS+KO82vsJ8i++sdhS2XOFcDqPHfVOgXbXrL5h6cZZZLoXzV
	h5y4wC9teJ/u9RGfj91WOkzfShlKQZLA3W0ccxzvDJa5fvQ3FfyyBo+qLkttJmFUtjQ+PIu2Z+c
	l35ri+uDAhgL0L260gFloeZIuG5Cj0/Z6u/fh4tRqtzhmV5RAW4CF3Lk/Z81g6scoCiR3T1MYe8
	wQfePKRA8YIyORksNaylawW8xlnP5jlFsxC1RG1ufv5UYeA==
X-Received: by 2002:a05:6a00:21d2:b0:845:e1a3:106f with SMTP id d2e1a72fcca58-847c08f4d3fmr558514b3a.53.1782893995284;
        Wed, 01 Jul 2026 01:19:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d2:b0:845:e1a3:106f with SMTP id d2e1a72fcca58-847c08f4d3fmr558480b3a.53.1782893994756;
        Wed, 01 Jul 2026 01:19:54 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa65bsm3611542b3a.21.2026.07.01.01.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:19:54 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V3 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Wed,  1 Jul 2026 13:47:15 +0530
Message-Id: <20260701081715.2580329-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TFH9H5z4zlgvN3r4lfCKRb8JAW-wJNXZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX7DrWYz61wdo9
 kue538rVZbhY5ymBcIGzEDssbdClFUPFqV/aB2n8SJ+d+jjaeA02Dx0FNqPmuBAuzEV3NfP6Wd3
 5QR7BF+Q77kGthlEDqg+s4B4i415P7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX8B2sBwL79J5G
 dVLtFasgNyAz2+MBMdOOcpeBneFQhCcEh8zqFEemIVzHIJhe826GRscg86x6s5wrbQGY9tF7AE7
 NoT9fdwLyOyVS1jEa4d8HpjAS3mpijVUfstfbA8GUDL+WijXlbStcnR49ZERYO+AhBBhE03QIfP
 Q1TnFqHl2oIbzeGckdNz6QXr2+0CeGob47E3Q2c/u1WLEt3euMDTlRMLczVQR3T8Bzzl0m1oyd8
 gDESkd3VbnfiCgJOJRERi+fB2iLQnAi8TO/pWCNvkXNE0DjSES0jQ7SRFIREofRyqaNbIM705PC
 nHzNz/eGPtj+aR3SJBOqu89yQaIkTSCqUvfrZhz1JnoZKR9uMFPZO/FBdaiCocJNxPQCuZizg/f
 vw2KN4+RSLmSTHsW5dG0i7j0ZkN+4dCV1BurvRm7GcGewsk2ExAxxwULFS/fPE/C9r+y4BXRaAn
 KFvHv8X+sj4pFX4cC6w==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44cdac cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FCMv9EZ1guwIjbhFI0kA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: TFH9H5z4zlgvN3r4lfCKRb8JAW-wJNXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010083

Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 37 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 3c5983bff00c..e9a21c83001c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -73,6 +73,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
 
+monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
new file mode 100644
index 000000000000..cb2566ac6923
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+        vreg_s2s: regulator-vreg-s2s {
+                compatible = "regulator-fixed";
+                regulator-name = "regulator-s2s";
+
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	supports-cqe;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
-- 
2.34.1

