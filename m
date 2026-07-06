Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F07382F1F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354480; cv=none; b=ZceyRyCafLNGMQbf9TfGobpGeljpMIOxKfWjvdB3gKTXS9AvLVJjx2BH4lp8vuFooyA52RtwONBXMlFaSzoqHLj6+5R/+QNirwc0BLNGdKm/aHRrSyxNRDNHcGyr8w8Vd5usW3zHlw/rU8CsET+dAOJrwEsb6pA7JhV0hSkGZGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354480; c=relaxed/simple;
	bh=20HwkMC9gwkEM2VZHp9aUv9EBzJvaY9vztOC/M8OIjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Td1qwjE5qFS6HZQoYfMe6+A8n/Vq3imX6HTXnsepqoIAc52uXI08jGKrAQLnEkytx2G7Tqg7n1Q2c/ZKuNkjGAvqFoP46h+h1LpQ+zoMsFUBHOgepPkcBSeuBA8OCygGsLwzGPHPSxemtK/wDAJI1r3PNYODVzRiJ7zPU8gzQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tk/31WvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDbSvW8h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tk/31WvD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDbSvW8h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF63M982438
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GIdzVAZfEz/3bVoeE9ZzBHSMtW0QCEGCoyc
	XI4YxZv4=; b=Tk/31WvDhlds2Tm4DaWGQqfzeVq4CvW3m1G1vWX63KHm8hJeGA0
	T3jW7Ac63ZmhlauWZTjcKVtsgz0eS5qEJztdhS6W0sZtQhD04+P6g/SZRaIYAF+d
	o/m3GIQssWHVTjtjXeEhXOQYdVrLc4D2RGUV7hcAB0H9yI+jx5OQI1YoEyOSJ78s
	FNjNXIVxytAOKngE/0FesoavlqpVyeLVB0LEy61hC7Yyjrj/ZIrYFMMl+Pf3bved
	YswfBv6/Pz+AAsLBbAH3dW1YGvQ2ZK+mhAv2dFZr9a7MSBRpA8HoSONFYYuthORJ
	6SuH1nabpBqtJ87fB7X9IMbeyjBY/BiD3hw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qphtuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:14:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cae134ab3aso55333645ad.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354477; x=1783959277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIdzVAZfEz/3bVoeE9ZzBHSMtW0QCEGCoycXI4YxZv4=;
        b=VDbSvW8h8hOARmIUSreVd1SYTBFwrWL+MZ+MIx96WaVpyM8E6PxqLzLp5qJTgb3fr/
         yt9MYHsmYVBVB0HCZEGfkiBbge5asC20ff9LDGqeoX9OwRrprNbCZI9do3HN7BHqwdPq
         SS3Tf+y0XV7HlzHcVIQUALYf+38614ZtDzna0z00SvlpJAL5I2clgMKI8v4qdGyScrHP
         G3mbwXkXqCQln67ix6nd1+ivmSYy32WSgxC7zLCvnN9n06FAwXrWAUSVlvZ8K9sxYPxK
         pxEre+14rJ1FlZCCWZRTjxZmmoMyJpmi4we4aPRY/VjLQ4u88Xpd3vJ7Yn6+qn/1kfV1
         mIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354477; x=1783959277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIdzVAZfEz/3bVoeE9ZzBHSMtW0QCEGCoycXI4YxZv4=;
        b=d0mcotvFiJqtB16/VzMVnE6n5U0r8Dc31quM1tbMHNtB72GFyIGm9oMOMrFOH7SICe
         HeoghGMm2KpaPTcXe4J0kEZPfAS3N460Uy/yysenuZg+WdvzBcfwx9jL3fi5uzQPtn4+
         DF9oNiNiY9yy1Yq9IHoOAQZf6TcPrE9AeoZnV6AYZlivVpFXxLDNgDVxtqW7dUn/AkKA
         OPnTfGK05T+RFiLtv6i8BMJythQeWp8QrN0n8b+JaqbTn4L5pXVpldZRh/xlqDnrj4Hz
         l3RovO7yzmphFhttoTrzVpgpSl0nKzqyxCviMYRAdhDtbZT2TG4aQA1BwBwx4v3j7fsr
         Rqxg==
X-Forwarded-Encrypted: i=1; AHgh+RpWKQO0GxUZmlmGJD4T91ZhKcz4e/q06NWYdEpx+DGCpPrURldI91nNMHDE57oTEy0TsxU3Dz8svFsz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2mbEdi/pGjG2fcBS9Azp7EZumhu84ioPODy8ykwZ5l/pLcQ6k
	iSOMn+Ckk8prD7VaSUKQKd3lEODGlGwaWeODeKk3XCoPcVrvzx4hZ+TjaR5K+Ine0Kgadtc7K3y
	SyXM6woQpnExfFJMu3Tqe51n+5ZpJYd0MwR+VTvexpNgsEREkGVKktef0tQ5mmj8W
X-Gm-Gg: AfdE7cnNRjkWFtoIGqHY7lNKwvBEvF5vmhFrVfqUCCi3FLyG1+Rcu+aOq5dVH3DFYiJ
	z1filvKb0nZy7bJbYssiRBwZ2NY5LQa3bMSWggvAjTXndJapm9lCDengKXXCzUGBxUsUymCnEk8
	HnNZ5jCwHxFhq14r4GFmtPfztFk7nR+77PsPgU5icZskV2vfLIuJPhcC4+1+p5vxz/E2GRKj/aH
	sRD7GUlivRrsgolqJaSV76L6JnP2tsOX8jMCREXthaJ5tI3Q/CP0WLxfLihI3aMu6QIW8a8l92E
	mD2KsZHRekMg0ejk7rNQms6o6b64njsOVqfc+ubkduxIZtna2LhZz1sCwOxtIspn8sbo7XTN8BK
	za1qYmJTxyAmW6vvdGB1SPjBRv0gUWddi6ZAxng==
X-Received: by 2002:a17:902:d4cb:b0:2cc:9473:9799 with SMTP id d9443c01a7336-2ccbe71f6abmr13213615ad.17.1783354477151;
        Mon, 06 Jul 2026 09:14:37 -0700 (PDT)
X-Received: by 2002:a17:902:d4cb:b0:2cc:9473:9799 with SMTP id d9443c01a7336-2ccbe71f6abmr13212965ad.17.1783354476316;
        Mon, 06 Jul 2026 09:14:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm86083468c88.9.2026.07.06.09.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:14:35 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v9] arm64: dts: qcom: kodiak: Add EL2 overlay
Date: Mon,  6 Jul 2026 21:44:28 +0530
Message-ID: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bd46e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=OmtaVqwek3-yi6n--wEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: NWgbs3DbMNHJTeQ5XZDKrUgInvrGtsEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NSBTYWx0ZWRfX2VNh6hDdaFpR
 +RTl4qkIf6hDW/q/ucxUppwCPya6lBclHloZmsh5Z8mPRZLeRjNjsXoHm3QSM6yUyryLgNXQDOf
 bKZY5TfmEff4dLTmdtT6I2ijrhLNpWtJDHv0ZZ78w6+WiJLa92lr5OZf+L87F5h9JV4Fefm1jYV
 HeWVZ4jhrjVCtjzhc5lK8rFBkT45e533kFYH7kwI1+0Wdq3+oz/Fye9dFnCd4UlgEdGzoUo8IxC
 P3ppvOhzmgSlkTR2tydPdaAyFdwThWz720ZtDMvBvd8SDrKJ1oPp81Ok0kEcfyncE8TepmBQWuR
 c9gmo6qhkGomj8lVnPNSsg6j25ff1382TbtrytxxNOh4tImcfHfqJwMhg2FsQJVmH+ktC6E6wi5
 C8E/UFg4WbwZzJ9+ORzGpUUHihv9A6+knVqNdW4+VXJL3OCEi2AMn+yTDx/0D5MtF39G3M+ONM3
 z6aE9otfoWO7wqGyTsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NSBTYWx0ZWRfXxrl6fvm0KInA
 7odSkR5CibWaQD5jYoQC4SOAiHv49uQo2JSmbyPOesiEf8IKYyGsWyiyL0JQcI1mT9ol7AMuKuA
 uDW/nMby6uizBuWUtsZnxMDuMBBnvWU=
X-Proofpoint-GUID: NWgbs3DbMNHJTeQ5XZDKrUgInvrGtsEK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060165

All the existing Kodiak board variants run the Gunyah hypervisor, which
means Linux can only boot at EL1 on those devices. It is possible to
boot Linux at EL2 on these devices [1].

When running under Gunyah, remote processor firmware IOMMU streams are
controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
consumer of the DeviceTree. Describe the firmware streams for each
remote processor in the EL2 overlay.

Add an EL2-specific DT overlay and apply it to Kodiak IoT variant devices
to create -el2.dtb for each alongside the standard dtb.

Note that modem and media subsystems are not yet supported due to
missing support are not there. For GPU to work, zap shader is
disabled. In EL2 mode the kernel owns the hardware watchdog,
which is enabled here. For WiFi, the wlan_ce_mem and wlan_fw_mem
regions are needed by the WCN6750 firmware.

Remove the erroneous deletion of wlan_ce_mem from qcm6490-idp.dts
and qcs6490-rb3gen2.dts as this is device memory and should be
present even for EL1 configurations, whether or not the
underlying OS uses it.

[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
 - Remove reserve memory change of adding copy engine device
    memory back in el2  overlay file instead do not remove
     wpss ce device memory from el1 configurations for idp 
     or rb3gen2 device tree. [Miaoqing ]

Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/  
 - Added a wpss copy engine memory similar to chrome for Wifi to work.
 - WPSS does not have firmware Stream, so that was removed.
 - Added wifi streams similar to chrome for wifi to work.
 - Removed this patch from Generic Pas patch series, can be followed
   separately.
 - Moved Sumit as co-author as part of modification done to the patch
   in the past.
 - Added some more kodiak's board variants in the makefile.

Changes in v1-v7:
 - mpss was disabled and will be enabled once the dependencies patches
  get merged.

 arch/arm64/boot/dts/qcom/Makefile            | 12 ++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso     | 41 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     |  2 -
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts |  2 -
 4 files changed, 53 insertions(+), 4 deletions(-)
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
index 000000000000..37a906218d17
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
@@ -0,0 +1,41 @@
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
+	status = "okay";
+
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1c02 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..6ab1bbdc0a62 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -25,7 +25,6 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &video_mem;
-/delete-node/ &wlan_ce_mem;
 /delete-node/ &wpss_mem;
 /delete-node/ &xbl_mem;
 
@@ -1148,7 +1147,6 @@ &usb_1_qmpphy {
 };
 
 &wifi {
-	memory-region = <&wlan_fw_mem>;
 	qcom,calibration-variant = "Qualcomm_qcm6490idp";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 9c24802e476e..c3eaa196a473 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -26,7 +26,6 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &video_mem;
-/delete-node/ &wlan_ce_mem;
 /delete-node/ &wpss_mem;
 /delete-node/ &xbl_mem;
 
@@ -1464,7 +1463,6 @@ &venus {
 };
 
 &wifi {
-	memory-region = <&wlan_fw_mem>;
 	qcom,calibration-variant = "Qualcomm_rb3gen2";
 
 	status = "okay";
-- 
2.53.0

