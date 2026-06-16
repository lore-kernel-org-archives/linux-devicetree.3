Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7AA25C80E
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615061; cv=none; b=bl2ELexL8NC515tCuG4NiyfdKPSlA6Lhs8CWbw0GrSqJGOpXNqHzYoXQEo/vwnr/ElRziyZBl4dTbtSdKILsAhjRlgVGmwy9Dch99nnS0PtPz5H6OWuErmYUtewLyAhSK9IXEpfycSLtK573GcWFHwHAwtiQ+Z4gtXseHrKWEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615061; c=relaxed/simple;
	bh=EGv4GYvLJhMHC7C7MhV0I+x/rtFPkL/J9u9qJvy2w1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UOKgOglHWswBacViHmGLeTgXOSTHMIQ8UEn4nsEaKQBwlCxuufQRJ5YtHz1DvyoOSBZwLtCGynGcyCaDT1mTa5S7p3mweGKfRGalpWZ3b01U+sgbEpVWVgibmHEP1Gic/1wa1TUHUxxiT8PX0I52uqbe4FnVNakswma5A3d2zqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdpqrQFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4Jq1AqU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdpqrQFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4Jq1AqU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9jeE2799422
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kH/fZ8T7ln1
	R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=; b=MdpqrQFZcYbZ1SOj5C17F7N1TED
	BJ2tSDM5B8ERWZFa8aAXHL2oq7g08xkL0rirj44c42rX7i0WxBvCXtWd9a/pqsX8
	H1labU+9vQK/l85gpLhPI/QfFKd1PNbFmkzCQ+fdhQJJE916VpfgtuuDM5GollRv
	kqboL868Ccqv6asg5q2/puOPy3f1y1gCTGTcPSBa39PEqPHDmNmUJo5+jFwy4lqS
	d8zGy/b4KyBI2yvhxjAVnQLynTPJa+NTeVUJVqWX9TDjHwfKc2YxvgFt9MqlqE/v
	1wyr/nv0yQshEnbNkgr1GpOXvwoBqSV9dNv7W1oj6mmjcB6F7eb89Qq/4uA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7swmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:04:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so5673880a12.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615058; x=1782219858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH/fZ8T7ln1R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=;
        b=O4Jq1AqUEAjBokc/PyK/I1XErSop/ANcIGx53go/xDHA+aI3tlF8j+CYpOpZgxhsgw
         Nw1fQuuP8tkotB/OyhnIxj4g91x530B67lIzg5qyclCNcdj8Fnx4M7BOZxf4KI7IpI8J
         vBySSF2Dm/00l8su+dl+7QABTJ5SNurJam0cqa8eqthJKFxK29XzzBnelSIUSF4MpJgg
         lAoq+UHVNJffbh9bv8uAJ5TBJcUMRTa5MHC7Le4AgUZNHgCITPe4eN6b4UDcp2T5I2ND
         bp2y6tmCUxVUg4v097HSOcHNp2h14caawNl76fnANTd+vBvI/jYXSKP9hv/Ph+DByJa8
         jMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615058; x=1782219858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kH/fZ8T7ln1R4X/+bGcOqOegxTkdS2ob6yNZTpAWS8o=;
        b=JvtVcMJtmKLL428gshkc9Cnv9AtxFfvT9QfZTcp7Q8cRCpmuopBSR6Q9wXzzqYd7sh
         EE5YjKHCqoJkm3iCO8M16xEpbhQFvlrzLKYy1UHE9XYeKetgqSCkov4V4IE6tcfC1psH
         fH+DoFjujuGVuMYRCsoZhMjq8MunA0olok/cFTUiUTR/QsZxdpJZ4WjAc1D8idz3K9cH
         c69Ln6f/39NWhs4LYid2BI3vXCZ1gdT/I0QYQskpyDtBgYO2rh2kGGXn2wonKdu3+alX
         7wJBIrtJtC0F6tBxgYnhw3lKjJLGyuwQIBZNzYXK8XeWSil+e5GvTfX9EDZk/BMvSmGv
         kVKw==
X-Forwarded-Encrypted: i=1; AFNElJ/qTSlhFcTVjvS7+yJGxiBIwh0uVcX48u7j0a48S8Uo6A1vkqBPrPLudz7spTbaIplNmmkFKt8uXzbf@vger.kernel.org
X-Gm-Message-State: AOJu0YzhgzzIXedw9iXXinkdXOwGQEF2KeR57fXXYWM+99e/fo04ztHs
	5VT5QyFl6VP33Ss1RfChqk5+AXhcIwSPg63Pr0jnKPRFysgWxdVrei4EVeWmXB+rDaAKiVkL58A
	5mGRxP8zbmyB3aofNdPBQAMmMsO+9FwJV3yUf/OWcS0La7uhmgh4n+OTXatVsnfin
X-Gm-Gg: Acq92OGsuHxLt9NAJNiKU3pA/HhUjAgHdt6qLNkeNK3fcLn52k9HDLjT1QFULJd/2kv
	SXxRuP7H1pgHMtiCY4Mvy0jlCZNg128P/R2cStJ+1VpGcscbiJyhEcuLNpfa4iuU4UaEc9TFsCk
	n/nQNQEmSlMAOAhAjIqMRcF7XX4IVgv9QxAICniPHdpfSa2ljkWuj+7Wov3LISJFIfshp7L9/Nr
	76ZT5Ux6PEYYkIcaeWH/Kyd/6NPybTleXtclBpNbt1K3RNTLGxkC5NKVLeg0QHFZQtGyavq4Qx7
	Yvrot0T4YKvsvD2Sv5r68CIO2rGzcLhIKyi7RNAxBJnJD0INll09HiY6AR3ErS4L1W98uWvAZSP
	eAaqzg01HrxAZVFz+DKg+RNS/nPv3lRz9vw+wp3Ev4yKuvoCSUCHLsPAv
X-Received: by 2002:a17:903:384c:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c69a10fd7emr42852785ad.15.1781615058038;
        Tue, 16 Jun 2026 06:04:18 -0700 (PDT)
X-Received: by 2002:a17:903:384c:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c69a10fd7emr42852175ad.15.1781615057590;
        Tue, 16 Jun 2026 06:04:17 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm134867235ad.23.2026.06.16.06.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:04:17 -0700 (PDT)
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
Subject: [PATCH V2 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Tue, 16 Jun 2026 18:33:47 +0530
Message-Id: <20260616130347.3096034-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
References: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX2wn8WbvmkJzz
 gYrrIZk0hQOMHvfmsX/xHNVOrlzyHA7Y/twXV8y/u+TuzYvY4wacG6xJ+1gAP73NVuK9b9hdBcr
 dnNDI1B5YDfISFtVro0/HTfTZ8OXPgawEuFP0ECKaqkLy9Qal4BLtR/6MJZQTrsFMgZO1zbBw8i
 Cm4bIlyLkOTs56sPsd93RcxWiczhjeGqstAkICqfcwu4ncgtG2OhDgz9WZfZxEs/Grg6gru/zuG
 ZHrgQtfhZvMYi1GeYePqf4/5bUdti2h72oESQDj0tTxo+OWjjvLros9c8jeKUpsQW33YLAgsdYn
 E/5gBoUkax2Uxej6U8MZ7VSImHJyoI8R2ubtYo2O7qXOmNAKOfG5Nfx4gcsl7I5wY3iw3p1dKOO
 D95GjTJ8Wdgg5AHMOuCkGNxpNRLg7nZG7e4rzLy1SIACO1HN11h5V8nbZn+vixw9f9H7bO0E80c
 rqhh6dk1q8nBqzgywng==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a3149d3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FCMv9EZ1guwIjbhFI0kA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: gVw_BfAXgGLu6W66XeXigyWvQZkx6wHX
X-Proofpoint-GUID: gVw_BfAXgGLu6W66XeXigyWvQZkx6wHX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX3eUBw8kvwuHz
 FZNRHpZxQCrSZZRw/5GgGCZTB4IYZ5AxQ9xtYSon7CHCETAURl7JvG1od+HiC11ANOe0i/VIWfC
 V0pvvJXDvJTS5sDVSzFyub8oMhsBRQw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160133

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

