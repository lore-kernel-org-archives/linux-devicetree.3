Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C333C25C80E
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615059; cv=none; b=Ek7Sn9Mf0VSHErtNh2XNrGozdJ6tnGVfj0XvZltwJgDFyknb4225zJDhuQH4OZxZ5WshgVp3YpclrYJWyABF0YNwxvwSGnMHhW18IYvkkz3GP2ZumSBe2KaQTbiwQi10qX32nK6kP3XBS+ugvCJfxkttj84JfSpMRE7Nu19NkKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615059; c=relaxed/simple;
	bh=Qj7nElh8Dxw2oCGhto93gjgUW0SgkImRKgctY43R//U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PFDjKa+WcSSn/VwG/ph1vi79jjaCSCZW+7jrzafAXt76ZPBlEBL/cq+z6JJYNccQo58OldrxR7XAi/gjSTRXcjJ34YXaldN1fCdZqo+t9OEHdNhVgrqgRMzTq6AZDrH4lVD/I50yro5PPG7XzFurf1Q1GmnKe64AKoI8L1Ylw8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lT1NAqza; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVYQON1I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lT1NAqza";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVYQON1I"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACTaY3474725
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ef5Ji2dDzze
	Kj36vpeP5fZdbDYLrkWxDfp9sewJA92o=; b=lT1NAqzaVk8DXcX0Z8muBay5nbR
	sgT8bMIaoPXQNX4Rlj3B84lQolsmQUp0VSTEaPIOkxUgJu3ne82cDor6Yag8jvHq
	i/aTUKYOcWPs3+MgdlfEMrdLBpYNCUM7sgdIZuROcdF2aA7QcPAU3VNPyRvpaEcA
	P5GEUZIz2WgRb1ZGotDLPsqOj1KuildFR+g0C2L5S1Ro1ZcS82etA4fE5g1Ik7a/
	VI8iA1+QEswjwCEjyYwcPfSPu56cAkESOE0VQnUYyZYJkgdpLH+kOXQhQRfNrhOG
	Jx/SaeMtune8wt0BCMBTjNZyEcYs1RqztpAVtoYLo1M0WpM0CWFH0BYE2yw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52t4r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:04:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6afd85980so837855ad.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615051; x=1782219851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef5Ji2dDzzeKj36vpeP5fZdbDYLrkWxDfp9sewJA92o=;
        b=JVYQON1IEMtaHYLPCT7m2nA3XKq+bI7KUFwzypoBPLKbdMGBa8PFsb7QlEIO9NrnkV
         Ei9g6Q5sGTzJ4hflsaBTzdYeWUsKcpcBit6AJ0rTV6mO8WYnfrM2PcxnkmhvIeIo6TaD
         4W4ePSWSul4Oe30KKmOH6GKYA4vgYKFlED1v3KH4P46CiDveSjRSPTMUB7Kih2ksL0RR
         0oXW0Q0Pl+6xWq+64dSLXg0vXTI7TDe0qGccobUOjTujAOf5TMDoD4A6MrIXY79cEr0Q
         IGLZk3AdwJpyPnR4GgSOGJbKECIGOj+UYBm/01unSffJA7Fv+H7ybSRFbkt9AefawVzV
         q++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615051; x=1782219851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ef5Ji2dDzzeKj36vpeP5fZdbDYLrkWxDfp9sewJA92o=;
        b=c41zPHMN6DOtNFUC8PcDVzcM+U96GlzGs9+S+Rp4WJA9pBepqeVHs8owf8GIx6xSDr
         U1ElyAvcEbUFJwE6Yasz6Qewscj7whWcC69+WL5UbefIJUa2KdJ5r1Kg9PYplB6BMCEc
         Yn7Vh2Pkj4H+B3Cwu4N0bzfEtWhbDPirQa1TR0QCilGxACn8vGisi7WB7AMX/7zVmcQ8
         ooLShDRd7OwvlYba5qTRSA/+lMq+9F0i5Wm3FcObGjl88OSQoePXHQAFKWRNh43uJgAr
         3EuZjzBeMvKJwzvFAwsRLkJ+A2eS9yUd5duIGtzMwUClHKKJfmpjmWVgSWSy174xr8HY
         HP7Q==
X-Forwarded-Encrypted: i=1; AFNElJ83S4SOqSaKFDAWnR7MPAI5p3caFUIKgOUzgcPRv1UFSUL3BJ9k4R0FDKbSykN7LReB59reqyVZPIPr@vger.kernel.org
X-Gm-Message-State: AOJu0YzFCAyr5McMoTe7CekYb215oDzgk+TGGulkX1nIF79GzhBcdisB
	gvs40qN3+4599K6mKD7Wu/UwFx/H92IL7OkF0oQgu6s8yApudXKTsOHWcP1/u83SOcPiW+semXx
	rxdsJI07Rzu2l4WIN3Q6V/H60lYvbymdwB18XJEhRn3297Di+N8VaTM84lLdBt0xS
X-Gm-Gg: Acq92OHBv28EL93EsSYB2K2FzihtaQU8xcJsUMAyfMW6vem9R/XQjHh8i6uhZ48avCJ
	l6qKKW0AgF9uzp1j0UZgHaTeMfQpQ3nRGnc1fnamXPBZC/9F3UlDIPrAW6lfxDS5WC8pE6vOXEC
	NwFJ2xsO0xTiC0KJ+spFASK6ERjcwpdSPcqP6sdz+b/KuPkPpOLTz0pjI1zZErv2FYwCmFjG11N
	Zu1jy4SWke6NgwkYIc9bPFZ6pQFz09j7/mwA90dncoYmhhDxEgT9zAOp3ksAVvgqe2OVp01XYld
	YR8oAOvb7mBnMfyrkKCjLNjS7Rn8MpbWk4FRKsWSoazjJWO+Eo9q4zAYkfSZE8ZVcxDK4gHH7+2
	p+JbHiiT/q9iiBZ+PjkQhdkY8J1ux+gPrrxgJndd52YPPD1uIxbu9N3to
X-Received: by 2002:a17:902:cf08:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2c69a1b55d7mr39233955ad.29.1781615051566;
        Tue, 16 Jun 2026 06:04:11 -0700 (PDT)
X-Received: by 2002:a17:902:cf08:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2c69a1b55d7mr39233265ad.29.1781615050999;
        Tue, 16 Jun 2026 06:04:10 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm134867235ad.23.2026.06.16.06.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:04:10 -0700 (PDT)
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
Subject: [PATCH V2 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Tue, 16 Jun 2026 18:33:46 +0530
Message-Id: <20260616130347.3096034-3-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfXyOOt/L+ONqR1
 m6VnmENrxLsUOh++9s9DbMbm+WptiS9dsrENAwJUzAECCbqxqD/VLkTe24zi5lYZmkjGK2zoV0c
 JiFLj1GP4H1f56+ZBiewlXXMsaqseX8=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a3149cc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MGA-IAg3UYKhKOWSYZAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX6hBWVCgrbgq/
 9vcIdYBG+zPGT42q+hY8oaBiod8zAtvo527zAMntoBgVjYABp8MZ5rIbQlt4j8qhU2bg5o/ftiV
 dbCiuucPzn5eqG1vteD6ABKR0WqO+sQyWn7IbkJn/DDCxjLh5Y8tWnSbbx6olSCz/dj/97DZNnD
 jZTs1UQ3+bHBOFhl926Rz6YeJrJjEUIDHYP7S+8rnnUOAQ5BMRvGeDCnSCzADI9D67qrNoPVeAo
 JGYLikrIDXK08FFzD9eWCtCFSuveWd7hoR9WjK1HX+QBn1lGbDEkAM/tUBo6QxomWL5uaLyz8SE
 hydWYb9vNyLt4pX3iDclspawYfUisoEhyrtSV/7WNkSfjSYWJLfF+QkI5oJYGqo1fqpH7sgQroX
 9nVA6lc57+M/M0OejlFoEtAN3+SpcTHNEzo0+PjLfSTlxIOLst+p/dxDZEbXlsXH1rX4FQ4gQGC
 c3CMXRiapwjV0EUBBmQ==
X-Proofpoint-ORIG-GUID: ZRkYVDOqjhhqjsbk9m1yRGAJnhVvee91
X-Proofpoint-GUID: ZRkYVDOqjhhqjsbk9m1yRGAJnhVvee91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160133

The monaco EVK board supports either eMMC or SD-card, but only one
can be active at a time.

Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
to support SD Card for storage via a device tree overlay. This allows
eMMC support to be enabled through a separate overlay when required.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..3c5983bff00c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -69,6 +69,10 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+
+monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
new file mode 100644
index 000000000000..bc4ea12587a2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+        vmmc_sdc: regulator-mmc-sdc {
+                compatible = "regulator-fixed";
+
+                regulator-name = "vmmc_sdc";
+                regulator-min-microvolt = <2950000>;
+                regulator-max-microvolt = <2950000>;
+        };
+
+        vreg_sdc: regulator-sdc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vreg_sdc";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>, <2950000 0>;
+
+		startup-delay-us = <100>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
+	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	cap-sd-highspeed;
+	no-1-8-v;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc1_opp_table {
+	opp-100000000 {
+		opp-hz = /bits/ 64 <100000000>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+	};
+
+	opp-202000000 {
+		opp-hz = /bits/ 64 <202000000>;
+		required-opps = <&rpmhpd_opp_svs_l1>;
+	};
+};
+
+&tlmm {
+        sd_cd: sd-cd-state {
+                pins = "gpio11";
+                function = "gpio";
+                bias-pull-up;
+        };
+};
-- 
2.34.1

