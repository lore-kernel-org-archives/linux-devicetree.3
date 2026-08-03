Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B533FC5A4
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759063; cv=none; b=GwdHCEo+RF/p5ouD4uvWgfyj8gQHy4qn7cCA8MXk/E/yvrTfyC+Fm8EhnOi2Yiwkgzgg13FgFM4aShfcblca/Z+x5qzX5XInbdMqkGZfxl9X2eoO2XV5ZGSOEtkEZUlC8UwJEOrwrdHsUTkjL5nas/bKlOB0DDUEYyCTeka2lp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759063; c=relaxed/simple;
	bh=eapvQgo8pNQQNd2K/3SVJ/aSu5mhy9jcUrVO5vs84q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tldqKC8kVgvGQiPEdvs/ch6f3vXNjme71cinsLIsSj4Ktj1a9ukr78t00+g0OL+sCYBDYhd5s6JG+U9LFuSEdFeBjrEUS6JKL9uxaz8Wioxgkt7p4Gqv2KMR1xEhcR99Lmj2pfbM44S3X/NDw+5bsNlW/zScZP9N3m/1eTd3QTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6RWblyr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IE25ZPLc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6RWblyr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IE25ZPLc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4bp8305436
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 12:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yYkaGrN7Ag+
	hJIf5NRU8YRBfAeSXDK2yPw95IFjcl/8=; b=b6RWblyrsat+5s0eoqfnvLqTB1H
	821SKwzyxB4J6L3Mlxxic5Af/dSnaoizkJ2ChpJ2deyTAjJZCAKgOcz9Iel1YtPm
	72cr36qNTz1rK7XURXtkF9f+RZdRMqIncM8BTtXDQsyR2HTUo1DbTdDNOnWEweOL
	TxfYuLbLzpgTQ/Xdxo42WfBoadZfsCU0OHmUjOf/OzOYtod3+OUd//SKc6+CidY1
	xtwSFvc9Tl74ReIZWr3WVFrRBwYKdFCqWjxHkAv3IJ+ukXXJ/fiGk37E+ZRvJlUH
	c+k850c/DRmfpwbJMgxH6dkrmYfq53xBvwhTwQuR20U3EbQI5o3s5UerFfg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb1fv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:10:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1705241a91.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785759057; x=1786363857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYkaGrN7Ag+hJIf5NRU8YRBfAeSXDK2yPw95IFjcl/8=;
        b=IE25ZPLc5zLH4gbp6QI+QHxbQa7vqli3yGumwvk5qTx3IiheBXtYKQxga8jbatzWHB
         rIRgTXBTV7U4Z3y72hRcInzYXJAHtLV8mn1Sujbf1OxbsN3DYUIQ5Js5tM1S8aKE61WM
         DMX+4OZYdx4KUokkBsB6ozP60DaWSqPrjnHXnnh4+EtnYy1eedoR0Nt+NQ/zi6uOIrLl
         KyKmJqtWLa5ukbYd34nsLWDBq9Af5q58M73fAEk3JJYtDo/XnkN/hBSGr77Oz21jE1Fv
         YO69zCNw1tWEDHQuMsq/mccMijYPADm/0dLGvVQoR0Lv/g+fEDQAy4oj2qdDIMVn1PkU
         jNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759057; x=1786363857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYkaGrN7Ag+hJIf5NRU8YRBfAeSXDK2yPw95IFjcl/8=;
        b=HVVqq8whq3tFFOgjps24AkTrp1pqw/GGe79YYRsml6KQBCbCWrYmE85ZGTH9rb7p9j
         J9tMmTQIrbCiuFbK7uXzOJLuEILETbhzu7nCteSQ/cd3jKbysSm3LZ1WidRK2F7hzSE2
         99PvADPR7/LMwDhkeaTR+yt1uwxbt63EvHBR/XvJntIDHD130/xOYqktSsvvQOKF/ZVG
         TBS6KgujKnmdFwhR249jCPttpUnyI9giLHoHKnwxHNOfWEV9lC7Z9p70DVGYODLZ8/Qc
         kwLXYiNgh+7fLTDuUOkJaKOFGRmAolosnGHAOMOaCAXXMfnnHxFStk0QnBA0ZkJZGxGB
         YQXg==
X-Forwarded-Encrypted: i=1; AHgh+RpFpxXsg26ybYegJ47WmWiG6YADH3vxLpWzJB8/YTON2U9923j9nh/SW3PA+qbOOqKgSxiRhqEdjsnL@vger.kernel.org
X-Gm-Message-State: AOJu0YztGEZYPoVQad8X4CT/7n6OUXdQBdsBx4GL2tb/fERF6X23EDtc
	eLtVHT5wBB1pX+BFg6fCsxEjZqcB/rneWs1Cl0XUhkvd06h0DKs+wO58DC9wRR83Hlqq9Lyiu17
	mEPBYDUszwlRIrWrjEyEs4LhAn29oAcAF7EjVh3etI75WZH+imvFU+Ut0EP71Ko6o
X-Gm-Gg: AR+sD11OCeWVM03Tfp6XGSl0B3lnN515pVoVEG57N4V/nnN2WMJhf2Hj8rpZwENuddq
	Sf2HXpSoxVRcQL61D1bqhsY//x6DGHfVvRlVNtpX+FPjXfaqLUorOSUGSHNaDP0w0ptJH9G/k0n
	iIbDXOWyV3M41UK/W8e5o3cQnoLtKmTVsuNua6nCRb7LR4CJi5EA/LVN0V+1PzPZ8RzXQjYrffy
	6GkYQCiAuqTzD85O3Bhdc4T8ZTOsVgTBc62yNUhP5Qf3fEcJjbHT8xmuXS2I7Md6jb05RJ0sCrD
	Q7QPdUvL8nJ65zJhkyI8/J4MU5qoAE0ajp/fDXi4OPJQXhxb3FLNgJwcHaYALWldJxChyQsABS1
	g+fK61/MGr+o4RjyO1SvprO7G+Og=
X-Received: by 2002:a17:90b:1b46:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-38fbc560f00mr7646262a91.35.1785759056521;
        Mon, 03 Aug 2026 05:10:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1b46:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-38fbc560f00mr7646243a91.35.1785759056038;
        Mon, 03 Aug 2026 05:10:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30a3c75sm3864076a91.9.2026.08.03.05.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:10:55 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v11 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
Date: Mon,  3 Aug 2026 17:40:42 +0530
Message-ID: <20260803121042.3313824-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dAXquOrcKQS0fNuH1pnQwPkrPR-hL2BN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNyBTYWx0ZWRfXxLDwQYI49KKW
 KVAlagI/7+7FpdRPWvRc3NupNP2E3LZmv6iuhyCnZFSD7Na/L9Czo5hvFUXyikZLCdM8I+qDYRA
 h0QiaN25hc2F0Wqg0Ksa3AkPJp7tWJM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNyBTYWx0ZWRfX5sIgRGRWHv8d
 sprzj85C0EqHf7Sqb2P/Y0G0PvED57JgCG5kPbCpiKWvMU9LUHJRkp5JycRJ1EW2OjQAJiEurrD
 X0+1oxDf5zY3WXnXLTMuJma/OzFdLNJaDjKvjRsuG/UxM9r3jfg0La/RUTPDpq4OOtEiEYlMJyS
 MMBb/34MdWV/dSR030tydT4D8CpiEFjrBVpeVZcfF8d0coRL2FBG+1Tq2ohEYoFIL8jwlccjoz9
 CBYbCdxbjFqhsQzKr6nY6wHlB7A7XPzlF0/lXg1rhcOF3PdOvUhF0UOkDG7O7xPuotIbGC4s4Lr
 QTN/r4RAILBQaylQzB4hPLDxu24/dwXUOpQ8qzQU0nKtURUQZZAj6O9IBEtObLimwI9eBHw1qir
 Lg+h9qYou2cQSpV81gQ7OnI/ljThXrMQrBdlkREhJ+lSx1jn4kaUEGxa1lpJEuf+FziQdCWek4M
 51uk1jTVFaNwFnoGiQQ==
X-Proofpoint-GUID: dAXquOrcKQS0fNuH1pnQwPkrPR-hL2BN
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a708551 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KWviAJoEAPtr9-UugcUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030107

All existing Kodiak board variants run the Gunyah hypervisor, which
means Linux can only boot at EL1 on those devices. It is possible to
boot Linux at EL2 on these devices [1].

When running under Gunyah, remote processor firmware IOMMU streams are
controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
consumer of the DeviceTree. Describe the firmware streams for each
remote processor in an EL2 overlay.

Add an EL2-specific DT overlay and apply it to Kodiak IoT variant
devices to produce a -el2.dtb alongside the standard dtb. Modem and
media subsystems are not yet supported due to missing dependencies.
The GPU zap shader is disabled. In EL2 mode the kernel owns the
hardware watchdog, so it is enabled here. The wifi-firmware child
node describes the IOMMU stream for the WCN6750 firmware; the &wifi
node itself is left untouched so that platforms without WiFi are
unaffected by the overlay.

[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 39 ++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..c62a68a57f96 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -165,7 +165,11 @@ purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
+qcm6490-idp-el2-dtbs := qcm6490-idp.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-particle-tachyon.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
@@ -177,12 +181,20 @@ qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
+qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb
 
 qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+qcs6490-rb3gen2-industrial-mezzanine-el2-dtbs := qcs6490-rb3gen2-industrial-mezzanine.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
+qcs6490-rb3gen2-vision-mezzanine-el2-dtbs := qcs6490-rb3gen2-vision-mezzanine.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-vicharak-axon-mini.dtb
diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
new file mode 100644
index 000000000000..8daf7f02fd75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Kodiak specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1800 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x11a0 0x0400>;
+};
+
+&remoteproc_mpss {
+	status = "disabled";
+};
+
+&venus {
+	status = "disabled";
+};
+
+&watchdog {
+	status = "okay";
+};
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1c02 0x1>;
+	};
+};
-- 
2.53.0

