Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D353AEB29
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146482; cv=none; b=BPoTQPj8SALcnVe8U0jul5tI0ENrXJSqfdAEX3JZIWa1XAYEm0UrkL/+21FMwBKt5D/ZoYQJJ4V0VJNzovbucDb6wdsiwPNdmdJ3widGYkbLSqmZTF4Aza8/8vkc2ujUtN2FWm1uVhKU9BVwZHSqg+Ji6cUxMIGrr9rRwuLymkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146482; c=relaxed/simple;
	bh=UlNHe86TgItm1Pzkf2nqc+cCiRLmWYA0DOBpIDV8kEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlFkuDqj4fRCpPJdxic/EZ8vlUwPaPNMs2e+GGBUKXoK4W7oMRpwkMUOlIjBFlSOHPMfx9zt7JYdTMe7uf+Oy6KfwOerkXDDKQvA7D4BEyi6/RASHnpo4GxbF1rRl0D562TRNtLt6YLADd8AaTX1KVqnhhuN8wvSSFIEG46Dlto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQ8+ArJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9THa3xT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQ8+ArJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9THa3xT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bc7j3239077
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QuifBx46ppx
	DdVgn2zY6j1xTnOkl8gGFfoNOWsDvEmA=; b=BQ8+ArJs3cUK22HEGptM6E47aEl
	nS0CctYxNZSk2D62yY0hYMqDrVEjOhFVQHPp1n7YqrOAdRMN1EWwceceRmB3Uluq
	Xiz5Zw6IkPbXD/MUQJYoM3+tA0Rj6vM7t954nZ1aIUQ+c4fv8S4V/wgPP3YDcW40
	YlxCRz6T6ukofU14CdMaoUsIHE6HNF8KYv+0FiVBzw9jr23wgL98PnUEP11JhwxT
	ArYdCXoLvrkoRl3jkHf8vwLwTdSPG9QaGVF+7I2iL9hWj6p3ZrP3j+AHFd/eO6jg
	GjIe33g4oou4s8g+VU7kZGv/6eafcFGwfTIHMGOwBsDzPCoL+b6GJYyo/RQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h0mrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6df0a1e18so62006735ad.1
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146478; x=1788751278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuifBx46ppxDdVgn2zY6j1xTnOkl8gGFfoNOWsDvEmA=;
        b=F9THa3xTFYI09/SFgBvXQvEbMBuzYSuYnXGA4Dey4T1gaJJXiXU3+EoW6NYX2a2Xj0
         9Uipw748CGw31mg955Ha0F8H6GCmV2mtAZ3DRKJ8/SZ9j/VMn7rkzcHOZDOKAI3dlDNn
         uEfVQlX9PkhrdoLicHfsh/VQhzfxHgvUp3ZvfSspsCGqpBcmLq066oi1nG8b8UJlztlK
         MF3GUXDnDRVkelQv+sCNOCFpbgmSlHaLJ0PcmQCm3EJx5M32fZ0mt1m7WNuhIUoHUS5g
         kvdxegQbqrLJdAH22gPEgg9TzqsxMO8TC65uQnokkyHcjLL6syY2EpaWO0RX8/pAP3uC
         JOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146478; x=1788751278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QuifBx46ppxDdVgn2zY6j1xTnOkl8gGFfoNOWsDvEmA=;
        b=nx+oXl5FsEIJqTsxro7coTY5mF77U4eWeDRnxL10ekJ+lnVNbgRO2YNkZwVfUeicLl
         FRZyisnIYwmMsvb9awBVmOfZirodDKjDlL66THGpDj7/UdJ2XiT25pl/9drxXp0BMpVp
         uNiS7k67RpTTiCWLQIxuybN54hlhG4DuLl9nv+pI7Z5wehoQXoZ7gBaaSDnvSZFjeROq
         7T4oAMbHU0yS/jCp4Z2pTBRS3BztstlvFHAF+N8ggmMz6ahAIfQtnMS/tdoaNSIMZLCo
         HEuWLS9h56QjaFAykrO8IDmM8ttA9M0o2KLcuJBMcRqe0xiJqQ/g1YLc0jf5TD4JXAhY
         JRmg==
X-Forwarded-Encrypted: i=1; AKwUvBz6o4IuvNX/Nfn6JlteaKznQ03UVmlOtH3pQLaRCGvLvgx630ep1K8b7XdU3v/8EQG4BZT6+b+4Vbti@vger.kernel.org
X-Gm-Message-State: AFuF++kNDfWegjLv02yCHDpAuU74chQ+DVSzNHV9oqWx6YOouDtA6I9W
	fFYWPIevb8p0X4obx6esc4A+0w/ptO7z/05i1H7raEOHjOHWxS+XL1fi5I2cAdlQfHr5J/WSCif
	m2O9l2KbybhfSmbFTJ2fA2fYDbTZMROR2461uMeMrVrkLsL3no+QuHc9ev10Qanps
X-Gm-Gg: AYBFou1KZKLaoCLf7MeyM6urTgu2b/TE8iDeCQKyla+dzZwIcj/rz8w1E1ZDlLBo3nv
	t8ZgKQNcU7uryZambuUzahufljbx5GW6KrfVDa5w5TaKVNkRGBLCyqRivAkKWsKOlKYV3+IWUOz
	mUCWHjqNJVwG/0kLHrBwkcAjpWaEWe2HtoQzYmrr9NxTDcPkx2DLTWIrhBl93Q9QAlpcPaxBMKp
	4FOy3iQaP9pLO7eDMLawKuDrJBvv24CJHzfCwzbqOXOYM1miW/1RTDAYFw7GD0r0EcgLkAVHAMr
	bLj+EaizqCj/JG+wPCVYlRn7TouNmd8EiL1POYboONItOLHzTzpEXpMhhVaCS095fAJiat1LRU8
	/GHTI3+sVljgcYM+xfWOa4GT7LL3DG+RuhaImDHTO5trzBdQro87b5z2IoE7H
X-Received: by 2002:a17:903:1a85:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2d93fa3dbb8mr7138015ad.19.1788146478135;
        Sun, 30 Aug 2026 20:21:18 -0700 (PDT)
X-Received: by 2002:a17:903:1a85:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2d93fa3dbb8mr7137135ad.19.1788146477515;
        Sun, 30 Aug 2026 20:21:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/6] arm64: dts: qcom: nord: Add support for ADSP and CDSPs
Date: Mon, 31 Aug 2026 11:20:58 +0800
Message-ID: <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a94f32f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=AlwbD0bXu83CP_5m_z0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfXxohX4N24CgvX
 Poj0iRKNjjkKldI08bbxlibpS77wWTBqLXEVq/KTW5xPIJK9i3bphoBuWChGbmnQT0XWqLjyvQF
 cDSJ0311UdPPk/lNm2YTuuf1mlm41PZs0sJqu+b0Dvvoc88HswSWHAso0WzFYZyIM+lGfEwt0Ir
 uAJxlEnzXfUUXz+GbQeMBQ3y2bH73zsvW+rRoJTqwaKeyioKmRXOznwvAc69P4mwM5FvLf/2txu
 kYzuQ66QbhSPmEVmCQuG/z4cn5ZwNVonM4UjhyO9kpNIxZwSitGzceZRVQMcxYRMJiWIZEGjUSt
 W/cylOxltJSWB8zoaFonrTTihjzftFXRtJdAMiIlgji1Jw8v3cgLlwtSgfqfAnEbdTi8ge5Yu1x
 IBl5GEAdcNHQ2PkWgEeGmkODan25167XBJJBBXtJEb7YuNZGkXrBDG9E5IWI8eaexBFsg2cngRK
 HjyVxgz8xxpLIJ0wZTw==
X-Proofpoint-ORIG-GUID: OIb3u6ZsPsU3bFTgXJd6aaGs8Vud0xbh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX9ijqICKn9U/p
 s1BlptK8rDoG7Bv6CfxZnVZ0VuagaJimSxPtZuGl8cOp0fZD3Fy7zfNB0g41HyF7oUPRtxkmoyN
 +Ri15Dgam1kUuldwQLz8iQ4dK65G8YI=
X-Proofpoint-GUID: OIb3u6ZsPsU3bFTgXJd6aaGs8Vud0xbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310026

Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
on Nord SoC.

This includes:
- SMEM memory reservation used by the inter-processor communication
  infrastructure
- IPCC mailbox controller for inter-processor signalling
- AOSS QMP node for load state power management
- SMP2P nodes providing stop control and fault/crash interrupt signals
- Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
  userspace offload

The embedded variant specific power domains, XO clock, and interconnect
paths are filled in nord-embedded.dtsi.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  63 ++
 arch/arm64/boot/dts/qcom/nord-ipcc.h        | 144 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 884 ++++++++++++++++++++
 3 files changed, 1091 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1a2f61a2c952..a03ee16c9cff 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -363,6 +363,69 @@ &qupv3_2 {
 		      "s-ahb";
 };
 
+&remoteproc_adsp {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&hpass_ag_noc MASTER_HPASS_PROC_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_MX>;
+	power-domain-names = "cx",
+			     "mx";
+};
+
+&remoteproc_cdsp0 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&nsp_data_noc_0 MASTER_NSP0_PROC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_NMXC>,
+			<&rpmhpd RPMHPD_NSP0>;
+	power-domain-names = "cx",
+			     "mx",
+			     "nsp";
+};
+
+&remoteproc_cdsp1 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&nsp_data_noc_1 MASTER_NSP1_PROC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_NMXC>,
+			<&rpmhpd RPMHPD_NSP1>;
+	power-domain-names = "cx",
+			     "mx",
+			     "nsp";
+};
+
+&remoteproc_cdsp2 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&nsp_data_noc_2 MASTER_NSP2_PROC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_NMXC>,
+			<&rpmhpd RPMHPD_NSP2>;
+	power-domain-names = "cx",
+			     "mx",
+			     "nsp";
+};
+
+&remoteproc_cdsp3 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&nsp_data_noc_3 MASTER_NSP3_PROC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_NMXC>,
+			<&rpmhpd RPMHPD_NSP3>;
+	power-domain-names = "cx",
+			     "mx",
+			     "nsp";
+};
+
 &spi0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord-ipcc.h b/arch/arm64/boot/dts/qcom/nord-ipcc.h
new file mode 100644
index 000000000000..8bf9b0875b6d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ipcc.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_NORD_IPCC_H
+#define __DTS_NORD_IPCC_H
+
+/* Physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_ADSP0		2
+#define IPCC_MPROC_NSP0			3
+#define IPCC_MPROC_NSP1			4
+#define IPCC_MPROC_NSP2			5
+#define IPCC_MPROC_NSP3			6
+#define IPCC_MPROC_APSS_NS0		7
+#define IPCC_MPROC_APSS_NS1		8
+#define IPCC_MPROC_APSS_NS2		9
+#define IPCC_MPROC_APSS_NS3		10
+#define IPCC_MPROC_ADSP1		11
+#define IPCC_MPROC_ADSP2		12
+#define IPCC_MPROC_APSS_NS4		13
+#define IPCC_MPROC_SOCCP		15
+#define IPCC_MPROC_CPUCP		16
+#define IPCC_MPROC_A78CSS		17
+#define IPCC_MPROC_TMESS		18
+#define IPCC_MPROC_SAIL0		19
+#define IPCC_MPROC_SAIL1		20
+#define IPCC_MPROC_SAIL2		21
+#define IPCC_MPROC_SAIL3		22
+#define IPCC_MPROC_SAIL4		23
+#define IPCC_MPROC_SAIL5		24
+
+#define IPCC_COMPUTE_L0_ADSP0		0
+#define IPCC_COMPUTE_L0_NSP0		1
+#define IPCC_COMPUTE_L0_NSP1		2
+#define IPCC_COMPUTE_L0_NSP2		3
+#define IPCC_COMPUTE_L0_NSP3		4
+#define IPCC_COMPUTE_L0_APSS_NS0	5
+#define IPCC_COMPUTE_L0_GPU0		6
+#define IPCC_COMPUTE_L0_APSS_NS1	7
+#define IPCC_COMPUTE_L0_APSS_NS2	8
+#define IPCC_COMPUTE_L0_APSS_NS3	9
+#define IPCC_COMPUTE_L0_CVP		10
+#define IPCC_COMPUTE_L0_ICP0		11
+#define IPCC_COMPUTE_L0_ICP1		12
+#define IPCC_COMPUTE_L0_VPU		13
+#define IPCC_COMPUTE_L0_DPU0		14
+#define IPCC_COMPUTE_L0_DPU1		15
+#define IPCC_COMPUTE_L0_ADSP1		16
+#define IPCC_COMPUTE_L0_ADSP2		17
+#define IPCC_COMPUTE_L0_APSS_NS4	18
+#define IPCC_COMPUTE_L0_SOCCP		20
+#define IPCC_COMPUTE_L0_SAIL0		21
+#define IPCC_COMPUTE_L0_SAIL1		22
+#define IPCC_COMPUTE_L0_SAIL2		23
+#define IPCC_COMPUTE_L0_SAIL3		24
+#define IPCC_COMPUTE_L0_SAIL4		25
+#define IPCC_COMPUTE_L0_SAIL5		26
+#define IPCC_COMPUTE_L0_IPA		27
+#define IPCC_COMPUTE_L0_GPU1		28
+
+#define IPCC_COMPUTE_L1_ADSP0		0
+#define IPCC_COMPUTE_L1_NSP0		1
+#define IPCC_COMPUTE_L1_NSP1		2
+#define IPCC_COMPUTE_L1_NSP2		3
+#define IPCC_COMPUTE_L1_NSP3		4
+#define IPCC_COMPUTE_L1_APSS_NS0	5
+#define IPCC_COMPUTE_L1_GPU0		6
+#define IPCC_COMPUTE_L1_APSS_NS1	7
+#define IPCC_COMPUTE_L1_APSS_NS2	8
+#define IPCC_COMPUTE_L1_APSS_NS3	9
+#define IPCC_COMPUTE_L1_CVP		10
+#define IPCC_COMPUTE_L1_ICP0		11
+#define IPCC_COMPUTE_L1_ICP1		12
+#define IPCC_COMPUTE_L1_VPU		13
+#define IPCC_COMPUTE_L1_DPU0		14
+#define IPCC_COMPUTE_L1_DPU1		15
+#define IPCC_COMPUTE_L1_ADSP1		16
+#define IPCC_COMPUTE_L1_ADSP2		17
+#define IPCC_COMPUTE_L1_APSS_NS4	18
+#define IPCC_COMPUTE_L1_SOCCP		20
+#define IPCC_COMPUTE_L1_SAIL0		21
+#define IPCC_COMPUTE_L1_SAIL1		22
+#define IPCC_COMPUTE_L1_SAIL2		23
+#define IPCC_COMPUTE_L1_SAIL3		24
+#define IPCC_COMPUTE_L1_SAIL4		25
+#define IPCC_COMPUTE_L1_SAIL5		26
+#define IPCC_COMPUTE_L1_IPA		27
+#define IPCC_COMPUTE_L1_GPU1		28
+
+#define IPCC_PERIPH_ADSP0		0
+#define IPCC_PERIPH_NSP0		1
+#define IPCC_PERIPH_NSP1		2
+#define IPCC_PERIPH_NSP2		3
+#define IPCC_PERIPH_NSP3		4
+#define IPCC_PERIPH_APSS_NS0		5
+#define IPCC_PERIPH_PCIE0		6
+#define IPCC_PERIPH_PCIE1		7
+#define IPCC_PERIPH_APSS_NS1		8
+#define IPCC_PERIPH_APSS_NS2		9
+#define IPCC_PERIPH_APSS_NS3		10
+#define IPCC_PERIPH_ADSP1		11
+#define IPCC_PERIPH_ADSP2		12
+#define IPCC_PERIPH_APSS_NS4		13
+
+#define IPCC_FENCE_ADSP0		0
+#define IPCC_FENCE_NSP0			1
+#define IPCC_FENCE_NSP1			2
+#define IPCC_FENCE_NSP2			3
+#define IPCC_FENCE_NSP3			4
+#define IPCC_FENCE_APSS_NS0		5
+#define IPCC_FENCE_GPU0			6
+#define IPCC_FENCE_APSS_NS1		7
+#define IPCC_FENCE_APSS_NS2		8
+#define IPCC_FENCE_APSS_NS3		9
+#define IPCC_FENCE_CVP			10
+#define IPCC_FENCE_ICP0			11
+#define IPCC_FENCE_ICP1			12
+#define IPCC_FENCE_CAM_ENG0		13
+#define IPCC_FENCE_CAM_ENG1		14
+#define IPCC_FENCE_CAM_ENG2		15
+#define IPCC_FENCE_CAM_ENG3		16
+#define IPCC_FENCE_CAM_ENG4		17
+#define IPCC_FENCE_CAM_ENG5		18
+#define IPCC_FENCE_CAM_ENG6		19
+#define IPCC_FENCE_CAM_ENG7		20
+#define IPCC_FENCE_CAM_ENG8		21
+#define IPCC_FENCE_CAM_ENG9		22
+#define IPCC_FENCE_CAM_ENG10		23
+#define IPCC_FENCE_CAM_ENG11		24
+#define IPCC_FENCE_CAM_ENG12		25
+#define IPCC_FENCE_VPU			26
+#define IPCC_FENCE_DPU0			27
+#define IPCC_FENCE_DPU1			28
+#define IPCC_FENCE_ADSP1		29
+#define IPCC_FENCE_ADSP2		30
+#define IPCC_FENCE_APSS_NS4		31
+#define IPCC_FENCE_SOCCP		33
+#define IPCC_FENCE_IPA			34
+#define IPCC_FENCE_GPU1			35
+
+#endif
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..03703324f487 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -4,6 +4,9 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+
+#include "nord-ipcc.h"
 
 / {
 	interrupt-parent = <&intc>;
@@ -685,6 +688,13 @@ qdss_apps_mem: qdss-apps-region@87b00000 {
 			no-map;
 		};
 
+		smem_mem: smem@89b00000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x89b00000 0x0 0x400000>;
+			no-map;
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
 		global_sync_mem: global-sync-region@89f00000 {
 			reg = <0x0 0x89f00000 0x0 0x400000>;
 			no-map;
@@ -902,6 +912,117 @@ dump_mem: mem-dump-region {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_ADSP0
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_ADSP0
+				 IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <443>, <429>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp0 {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_NSP0
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_NSP0 IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <94>, <432>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp0_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp0_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp1 {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_NSP1
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_NSP1 IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <69>;
+
+		smp2p_cdsp1_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp1_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp2 {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_NSP2
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_NSP2 IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <133>;
+
+		smp2p_cdsp2_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp2_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp3 {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_NSP3
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_NSP3 IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <197>;
+
+		smp2p_cdsp3_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp3_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1518,6 +1639,103 @@ tcsr: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0xa0000>;
 		};
 
+		remoteproc_adsp: remoteproc@4c00000 {
+			compatible = "qcom,nord-adsp-pas";
+			reg = <0x0 0x04c00000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			memory-region = <&hpass_dsp0_mem>,
+					<&hpass_dsp0_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_ADSP0
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_ADSP0
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <2>;
+				label = "adsp";
+
+				fastrpc {
+					compatible = "qcom,nord-fastrpc",
+						     "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu_0 0x09e3 0x0000>,
+							 <&apps_smmu_0 0x0a43 0x0020>,
+							 <&apps_smmu_0 0x0a63 0x0020>,
+							 <&apps_smmu_0 0x0a83 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu_0 0x09e4 0x0000>,
+							 <&apps_smmu_0 0x0a44 0x0020>,
+							 <&apps_smmu_0 0x0a64 0x0020>,
+							 <&apps_smmu_0 0x0a84 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu_0 0x09e5 0x0000>,
+							 <&apps_smmu_0 0x0a45 0x0020>,
+							 <&apps_smmu_0 0x0a65 0x0020>,
+							 <&apps_smmu_0 0x0a85 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu_0 0x09e6 0x0000>,
+							 <&apps_smmu_0 0x0a46 0x0020>,
+							 <&apps_smmu_0 0x0a66 0x0020>,
+							 <&apps_smmu_0 0x0a86 0x0000>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
+		ipcc0: mailbox@9007000 {
+			compatible = "qcom,nord-ipcc",
+				     "qcom,ipcc";
+			reg = <0x0 0x09007000 0x0 0x1000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#mbox-cells = <2>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
@@ -1637,6 +1855,16 @@ tsens7: thermal-sensor@c233000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,nord-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0x0 0x0c300000 0x0 0x400>;
+			interrupts-extended = <&ipcc0 IPCC_MPROC_AOP
+						      IPCC_MPROC_SIGNAL_GLINK_QMP
+						      IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc0 IPCC_MPROC_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+			#clock-cells = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
@@ -2071,6 +2299,662 @@ watchdog@17826000 {
 			clocks = <&sleep_clk>;
 			interrupts = <GIC_ESPI 848 IRQ_TYPE_EDGE_RISING>;
 		};
+
+		remoteproc_cdsp0: remoteproc@1f300000 {
+			compatible = "qcom,nord-cdsp0-pas";
+			reg = <0x0 0x1f300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 499 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			memory-region = <&cdsp0_mem>,
+					<&q6_cdsp0_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp0_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_NSP0
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_NSP0
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,nord-fastrpc",
+						     "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu_2 0x0301 0x0040>,
+							 <&apps_smmu_2 0x0341 0x0040>,
+							 <&apps_smmu_2 0x0361 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu_2 0x0302 0x0040>,
+							 <&apps_smmu_2 0x0342 0x0040>,
+							 <&apps_smmu_2 0x0362 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu_2 0x0303 0x0040>,
+							 <&apps_smmu_2 0x0343 0x0040>,
+							 <&apps_smmu_2 0x0363 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu_2 0x0304 0x0040>,
+							 <&apps_smmu_2 0x0344 0x0040>,
+							 <&apps_smmu_2 0x0364 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu_2 0x0305 0x0000>,
+							 <&apps_smmu_2 0x0345 0x0020>,
+							 <&apps_smmu_2 0x0365 0x0020>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu_2 0x0306 0x0040>,
+							 <&apps_smmu_2 0x0346 0x0040>,
+							 <&apps_smmu_2 0x0366 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu_2 0x0307 0x0040>,
+							 <&apps_smmu_2 0x0347 0x0040>,
+							 <&apps_smmu_2 0x0367 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu_2 0x0308 0x0040>,
+							 <&apps_smmu_2 0x0348 0x0040>,
+							 <&apps_smmu_2 0x0368 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu_2 0x0309 0x0040>,
+							 <&apps_smmu_2 0x0349 0x0040>,
+							 <&apps_smmu_2 0x0369 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu_2 0x030a 0x0040>,
+							 <&apps_smmu_2 0x034a 0x0040>,
+							 <&apps_smmu_2 0x036a 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu_2 0x030b 0x0040>,
+							 <&apps_smmu_2 0x034b 0x0040>,
+							 <&apps_smmu_2 0x036b 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu_2 0x030c 0x0040>,
+							 <&apps_smmu_2 0x034c 0x0040>,
+							 <&apps_smmu_2 0x036c 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu_2 0x030d 0x0000>,
+							 <&apps_smmu_2 0x034d 0x0020>,
+							 <&apps_smmu_2 0x036d 0x0020>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
+		remoteproc_cdsp1: remoteproc@1f700000 {
+			compatible = "qcom,nord-cdsp1-pas";
+			reg = <0x0 0x1f700000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 500 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			memory-region = <&cdsp1_mem>,
+					<&q6_cdsp1_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp1_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_NSP1
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_NSP1
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <69>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,nord-fastrpc",
+						     "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp1";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu_2 0x0701 0x0040>,
+							 <&apps_smmu_2 0x0741 0x0040>,
+							 <&apps_smmu_2 0x0761 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu_2 0x0702 0x0040>,
+							 <&apps_smmu_2 0x0742 0x0040>,
+							 <&apps_smmu_2 0x0762 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu_2 0x0703 0x0040>,
+							 <&apps_smmu_2 0x0743 0x0040>,
+							 <&apps_smmu_2 0x0763 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu_2 0x0704 0x0040>,
+							 <&apps_smmu_2 0x0744 0x0040>,
+							 <&apps_smmu_2 0x0764 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu_2 0x0705 0x0000>,
+							 <&apps_smmu_2 0x0745 0x0020>,
+							 <&apps_smmu_2 0x0765 0x0020>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu_2 0x0706 0x0040>,
+							 <&apps_smmu_2 0x0746 0x0040>,
+							 <&apps_smmu_2 0x0766 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu_2 0x0707 0x0040>,
+							 <&apps_smmu_2 0x0747 0x0040>,
+							 <&apps_smmu_2 0x0767 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu_2 0x0708 0x0040>,
+							 <&apps_smmu_2 0x0748 0x0040>,
+							 <&apps_smmu_2 0x0768 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu_2 0x0709 0x0040>,
+							 <&apps_smmu_2 0x0749 0x0040>,
+							 <&apps_smmu_2 0x0769 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu_2 0x070a 0x0040>,
+							 <&apps_smmu_2 0x074a 0x0040>,
+							 <&apps_smmu_2 0x076a 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu_2 0x070b 0x0040>,
+							 <&apps_smmu_2 0x074b 0x0040>,
+							 <&apps_smmu_2 0x076b 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu_2 0x070c 0x0040>,
+							 <&apps_smmu_2 0x074c 0x0040>,
+							 <&apps_smmu_2 0x076c 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu_2 0x070d 0x0000>,
+							 <&apps_smmu_2 0x074d 0x0020>,
+							 <&apps_smmu_2 0x076d 0x0020>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
+		remoteproc_cdsp2: remoteproc@1fb00000 {
+			compatible = "qcom,nord-cdsp2-pas";
+			reg = <0x0 0x1fb00000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 501 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp2_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp2_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp2_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp2_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp2_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			memory-region = <&cdsp2_mem>,
+					<&q6_cdsp2_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp2_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_NSP2
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_NSP2
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <133>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,nord-fastrpc",
+						     "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp2";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu_2 0x0b01 0x0040>,
+							 <&apps_smmu_2 0x0b41 0x0040>,
+							 <&apps_smmu_2 0x0b61 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu_2 0x0b02 0x0040>,
+							 <&apps_smmu_2 0x0b42 0x0040>,
+							 <&apps_smmu_2 0x0b62 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu_2 0x0b03 0x0040>,
+							 <&apps_smmu_2 0x0b43 0x0040>,
+							 <&apps_smmu_2 0x0b63 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu_2 0x0b04 0x0040>,
+							 <&apps_smmu_2 0x0b44 0x0040>,
+							 <&apps_smmu_2 0x0b64 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu_2 0x0b05 0x0000>,
+							 <&apps_smmu_2 0x0b45 0x0020>,
+							 <&apps_smmu_2 0x0b65 0x0020>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu_2 0x0b06 0x0040>,
+							 <&apps_smmu_2 0x0b46 0x0040>,
+							 <&apps_smmu_2 0x0b66 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu_2 0x0b07 0x0040>,
+							 <&apps_smmu_2 0x0b47 0x0040>,
+							 <&apps_smmu_2 0x0b67 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu_2 0x0b08 0x0040>,
+							 <&apps_smmu_2 0x0b48 0x0040>,
+							 <&apps_smmu_2 0x0b68 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu_2 0x0b09 0x0040>,
+							 <&apps_smmu_2 0x0b49 0x0040>,
+							 <&apps_smmu_2 0x0b69 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu_2 0x0b0a 0x0040>,
+							 <&apps_smmu_2 0x0b4a 0x0040>,
+							 <&apps_smmu_2 0x0b6a 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu_2 0x0b0b 0x0040>,
+							 <&apps_smmu_2 0x0b4b 0x0040>,
+							 <&apps_smmu_2 0x0b6b 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu_2 0x0b0c 0x0040>,
+							 <&apps_smmu_2 0x0b4c 0x0040>,
+							 <&apps_smmu_2 0x0b6c 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu_2 0x0b0d 0x0000>,
+							 <&apps_smmu_2 0x0b4d 0x0020>,
+							 <&apps_smmu_2 0x0b6d 0x0020>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
+		remoteproc_cdsp3: remoteproc@1ff00000 {
+			compatible = "qcom,nord-cdsp3-pas";
+			reg = <0x0 0x1ff00000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 505 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp3_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp3_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp3_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp3_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp3_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			memory-region = <&cdsp3_mem>,
+					<&q6_cdsp3_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp3_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_NSP3
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_NSP3
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <197>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,nord-fastrpc",
+						     "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp3";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu_2 0x0f01 0x0040>,
+							 <&apps_smmu_2 0x0f41 0x0040>,
+							 <&apps_smmu_2 0x0f61 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu_2 0x0f02 0x0040>,
+							 <&apps_smmu_2 0x0f42 0x0040>,
+							 <&apps_smmu_2 0x0f62 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu_2 0x0f03 0x0040>,
+							 <&apps_smmu_2 0x0f43 0x0040>,
+							 <&apps_smmu_2 0x0f63 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu_2 0x0f04 0x0040>,
+							 <&apps_smmu_2 0x0f44 0x0040>,
+							 <&apps_smmu_2 0x0f64 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu_2 0x0f05 0x0000>,
+							 <&apps_smmu_2 0x0f45 0x0020>,
+							 <&apps_smmu_2 0x0f65 0x0020>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu_2 0x0f06 0x0040>,
+							 <&apps_smmu_2 0x0f46 0x0040>,
+							 <&apps_smmu_2 0x0f66 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu_2 0x0f07 0x0040>,
+							 <&apps_smmu_2 0x0f47 0x0040>,
+							 <&apps_smmu_2 0x0f67 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu_2 0x0f08 0x0040>,
+							 <&apps_smmu_2 0x0f48 0x0040>,
+							 <&apps_smmu_2 0x0f68 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu_2 0x0f09 0x0040>,
+							 <&apps_smmu_2 0x0f49 0x0040>,
+							 <&apps_smmu_2 0x0f69 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu_2 0x0f0a 0x0040>,
+							 <&apps_smmu_2 0x0f4a 0x0040>,
+							 <&apps_smmu_2 0x0f6a 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu_2 0x0f0b 0x0040>,
+							 <&apps_smmu_2 0x0f4b 0x0040>,
+							 <&apps_smmu_2 0x0f6b 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu_2 0x0f0c 0x0040>,
+							 <&apps_smmu_2 0x0f4c 0x0040>,
+							 <&apps_smmu_2 0x0f6c 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu_2 0x0f0d 0x0000>,
+							 <&apps_smmu_2 0x0f4d 0x0020>,
+							 <&apps_smmu_2 0x0f6d 0x0020>;
+						dma-coherent;
+					};
+				};
+			};
+		};
 	};
 
 	arch_timer: timer {
-- 
2.43.0

