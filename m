Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909203ED3A6
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013600; cv=none; b=CWsQIAbQL/hQ6og5LedPkI8CgfWkqhaBY21GhBaLRJvXhjr1Hxll1QUK/JTszmnmHjB686mnzle2haYfccATdZ4zUYL+4FCWIKadAFb8Hyb+MmYTrwvIcehzvhPvAqmMaSx6E93uwnhM4JRJZb/HoVEaJcZ6aZNKXsi3KRPj8IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013600; c=relaxed/simple;
	bh=6HhvrEpv0MEgcFSVY8yifMFZe3jZZUu5k8mCNQpOdEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CH7T76wcyxegHziKIKDDaHADJ9AT/Ws0/t1K6LpSPTEo8koXjD8+mgk0VnKJ6OfMJ+W1M3c4u+BFHm7sRckKdzZOuHv7CIKuwbAPuLpH6LL9OHXTVvmZ7rFTvKvnac4CF1kp6qwL2H2pTDB98Kx7xSa4moL95VnbGBnxTaHT3uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5pxErwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcsxGbl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5pxErwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcsxGbl4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E77RrA3932429
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rEfm0CzICJn
	l6NHWsWnylP4t4zmHNza9499lYz7Lvlw=; b=e5pxErwfrNoZ5jr8yc/TgPjIYGJ
	31pIaD1z5WYXQNHnUSTLzWp/0RPL0oDQFXFtDa29qB+Bobz/VaPLsuWKcOLsTyJ1
	gXX1pPRgIH9YK0evuMnvVgbl8oWfb/lwDV2iI+hOg4aXs9+4ByGEPZcRfCWNsxjD
	BaOA0Hg8cSMzaYKKohd1o3+lxjjWbIs7lKxwaw02KGiO9mlnR6fJJPCnwZbwtcKY
	vFAbcXVbGD5ysACjYE+Pm3rhfHPNIzTOHj6luSr9uBJINWhkozD6Oe2r5ZdcRC0l
	axya7yH5cbkM6DowjsGm/9CLOqmEC32iD9D2/k4tf/Z71bTvUmqpZevpPkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq01da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:19:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so76786175ad.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013596; x=1784618396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEfm0CzICJnl6NHWsWnylP4t4zmHNza9499lYz7Lvlw=;
        b=kcsxGbl4iPlzVXixpdx7LLYYoBi2JgpGlT/UvHep2KdHUFS1fgHfG3I8ymHwRdVcbw
         rzr1WX2cFMV+iSPDeY8mPWbjaoi+fg09DvKzgGz4c1kYw6qs17mXOEJvXcGHx3zBdpxg
         0UdXr2ofqL6pTaiUs6Bfvnk/9Rtz8q5FTU/nViH/a3se2ghyqnkJWPu7Glc34uNlfnqp
         ox/iKebVQNXKHbcEDFx/Y4SkBmaGHYrC5YRK8APxOsQY37eE7u9Qubq7tjZtVuGgpchx
         LbPABI6HiV6h/G73xRdOhmkdtqtQ7i+YEruCaugf939csLa3f3KLxXr9miGH+jLtjTSW
         KiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013596; x=1784618396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rEfm0CzICJnl6NHWsWnylP4t4zmHNza9499lYz7Lvlw=;
        b=C2Y0QmxI6vXdPkV6KyXFzpzfh1P844OlqlWsmqiTaA/vTvbSmPFGrI4aHUad90aeAg
         HdmnFv6C9X7sLBfscaXM0KLGZt7Tw2050N4O9dRbJxaZlLwr51RPzAMHPPX2NPNxcNQY
         Gr95xA8b9NVvp2H1nngMglcq8xsQSExp1Avyeq6dLxjcyGLXiIDSMX2OYLM3krBegHsB
         Mf6e0OX1ahSxIqu9uvCiGvudHg1IgD3UHHh7Loo+J0ylYeEoL1SPqsPnlxqtwCveatZU
         p8aLZGGszT6zBDhtrOiUis6H2N+xna20sKk5Vcny1+hbFE8B22xxyr4gAIdrS2QMqUMr
         plmA==
X-Forwarded-Encrypted: i=1; AHgh+RqudJ29jy/hchmVTIyU5TqUX8ESejrurg5VbAzmTIFsiq8VxN+hdbtFBCtrx21CFyCfooAPeLqy0lB6@vger.kernel.org
X-Gm-Message-State: AOJu0YxmIR384CDWlpttn75LoSEMGkYP/a/X1bTa+1HjN+8q5toj6JL5
	R2n5sVy6isF8VkTRFVymdhs0Dg/le3Z+njssmHVnLIqNr6crns/OvW7qDA/WbzLaAl8vX3IODmG
	qava0vqke/D4APqVYMBjE8pV63MVhct4kbaT0NdbJLh6gjuGW/GaiCR7EgcRw/Zhe
X-Gm-Gg: AfdE7cmmgz96Bf8RCBdMema5DgmTwBEg0du779gGh7Y+mqAoi07SBOBUQhGjJd7MyMO
	dNUQT/WLJn6ESXY2o3uXWO7LiKV11ARUu5O7GDEXHISKvghpyMtTMX7DE+4P21+0hN29D2NwQ9Z
	D59BvQyyR/oT3iXHbkP3vMMtZGgyORiNhLsBgop57jhRmQbXt6aV6bty8XD0ctsNNXFDSdvzHe0
	FbkKMGpq+pOTSSoNSoa8SIbJYwRgbhJlO3NWqqqwYvGpmpRqLsCbH8Q/wY/ByYrj1w2l5zyjPn8
	Ymu80BkOgeUOk4hhtatLbBzNEDoAk7e8/gJrmDv8ZLJ2aLO8NpoFLAw8qnedjnzYtCdEE/Mlj2L
	AO3k1htvDXNpWOb7YPPQtjjjSZxNoQfGx/tFsQA==
X-Received: by 2002:a17:902:dacc:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2ce9f05872amr121278735ad.38.1784013596094;
        Tue, 14 Jul 2026 00:19:56 -0700 (PDT)
X-Received: by 2002:a17:902:dacc:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2ce9f05872amr121278235ad.38.1784013595451;
        Tue, 14 Jul 2026 00:19:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm113037435ad.39.2026.07.14.00.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:19:55 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH RESEND v10 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
Date: Tue, 14 Jul 2026 12:49:43 +0530
Message-ID: <20260714071943.2036353-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
References: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX8aN6024/rlFi
 ClNvNlSn6d2l0Bjz4VkebgYHatzVkQpBNCVikbeXVTq0nnCFHGuI4xzSrLXMiG+vKK/vvUWRk7d
 Zczd+u4MgtQD5INLtsl6zk2WR3uYqV3/EnWoWgcs4UmktpKHWEil8sKrzJ0iFsHAj912btBYAxi
 uPKGxqZe/elwdgIf+JBpdwNAaJrMIr/aZOFQ9qEAmqM69CmwRjHj3Z8/zMdNRmRRFLQ9EL4Hw/a
 9IRfsmBuI8p/ZwYXo9vPVDJyMw7kRZqtDfcjWGCdTkKOCfrxLqAP9XLTJVa/osO+9E6IquvwwwO
 hy6C8ORgEOkbligHlk8m2ZKll+cJ0zGXZghEt2ITQT/aTbUccy3bDjtfRQWhBk+aPSSPv9D/LKh
 ezXrDdKmT3tiLTGC1g9gyVMNikrLWRtYW3DcNweORs4cpXby1i2TV154npZHGF3wKo4pFX/MmUq
 v/L8UF5v3XBRoIPBpiw==
X-Proofpoint-GUID: 9MTF4nYgGgXAZU6QBbt1xFCaqcAJ29Pb
X-Proofpoint-ORIG-GUID: 9MTF4nYgGgXAZU6QBbt1xFCaqcAJ29Pb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfXw4PYa4Xm8Wl5
 hpP+ML+LIIpqrufcMrjYsojESSU/L0BOC9jEzBA1c8WswEfbtYZLQODqQiOjwMSyZ0jZ+RHSMlg
 IkJ0KiOp7c9wmW/QImCaxLtlRlB++JM=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a55e31d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KWviAJoEAPtr9-UugcUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140075

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
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 39 ++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c857bd7991b..22076579a50f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -164,7 +164,11 @@ purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
 
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
@@ -176,12 +180,20 @@ qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
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
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
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

