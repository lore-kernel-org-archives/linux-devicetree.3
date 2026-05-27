Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CF93939A9
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897347; cv=none; b=QZSUE6Y8cdoEV5kHG141LbLxmGlxi3qfcYKBFNc14Lqm5WHpUfcgbV3POeqX9WPD+V926uUk1nNwk8vUJIYXB1fNb3DnRnBTJntx7weFtmfy0putHQLR/Bi6TEd2CKHnWI46FbCw/uuA0FYzkBpmLhJTHPaYz2WXDz47+sD2uYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897347; c=relaxed/simple;
	bh=ODfMe8YwpE9zm6WOKy1yvRuBsZs9KnzIUkMMO4tFT3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idj5qFeV1CFMy/BKn6o6XR+uf7MoOzxQUg2I6DNJhaVNc6KDTEYYHCWz2bMYeaJgnd/F8mchZUNvhkCnmpq6NLczBrimCE1bfjXGcH9WjBeS3L/cHdml+N68LIp+Hp183NkmujlPnY7wl0WQurNa8hkLMPQmXn++EgnYDJmtZ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WU9qjH8r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEXyDDh+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WU9qjH8r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEXyDDh+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RFUglJ3830824
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=; b=WU9qjH8r9ZMfZOvn
	xGk4nGQujRa2iT6mIbQ1Cn30NtUcnlZJ4X6H7BwmDPOLLg1uSujPOw2DN41JtqUF
	lO9O1qTO8PBGkt/5Jop84u9pmUu9JxqBEBGagBdU/1RkvM9f/YH5VAlQSzS0VGaL
	pFItSV3y2fheiBIWirki7YqVNv7lWVw5wfPNnhG8RleKhxGgIBWpBRm3ZSHZggxG
	KZUD2X97IV4J/3zvXOfY5j4jExBArQ9dVPZzTMBH+IHCfmMvMUdXi0OBXsQWDJTM
	ysohmQUHK6micIWZ+R0Twtb4bIXMtygv9LJS6nwAg23zBejgsoP7GlskgNpXwHQW
	zDsCnA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edn17kaw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:55:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so10980142a91.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779897344; x=1780502144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=;
        b=VEXyDDh+54cZv1Xfk+palgHSpMRy2zUrbue58PZdGS2Swyz0hixE0q4Z8tZHVLJOv1
         Av/W/nx6CEAi0TyH9isS6u6zAEtH1I541z34hkWEoKMjUygvonfNxErrBL5xKflth7b+
         VsvHIqeOMbojCD8wA/rbuiovcFxrgy7ULzgwKqM/Nx/cJ4GQfczc/Xh9xuqZxyWOXNpj
         gWslUZjVp3YPgiwwnx2tQZ7TbiMZgP33lR3xarCn7pAk0WgX69xGQ0DuHwnzyF8IjF7a
         RVpTDLbl6DxdcxvWMNyAcZz4b+3WquMoFf4TgwVa4qy4C0M1+xNlMdFaaGDouyLaQvzo
         CrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897344; x=1780502144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=;
        b=mbJJytCtzj+nn7wLA+OkGy4Fv5UzVqMp1QDz8p7/59u7eIqxc/c39JXIrJa8RRH3yO
         vw0ypzYt26d5j2UpCODr3iGML+uflEquz/oY0v3LFRC5n5WNIog0zaTzBWURP22wRT5y
         ZKjIC+9/tMmjtxNkI1DObUmr8xbLI1O6vqu/mOyM578WRvt1yMT+PRO4o3YJA89+sm8s
         Wpuj65qArFU02bzXlkez3HGBrnc7pXjMpc+fLchMht/avuGnCFWwRxo7ky8JcF5cGnLA
         zd5FaSVkFQKAKiGQbr/SgeRl2Bj2rLhnr9ysMezkwnYk02eu33p7kG40YkdOM1yPzO9c
         TK7w==
X-Forwarded-Encrypted: i=1; AFNElJ9fy4vK7SSombndXfOzqF+pTkn7ldHS7otZofRyjAXjDJzbds7Z9aHgTq33oIGPLs3OjOssvQdITzYA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3nvA8+ZTsVjDtVA8ChEQqERptZ6kDPTx3TKICwkKWMErIlFZ9
	p+GKNz/Tkz1s7tEUqrs2uPCdvminifqX67meEUqZX8YG19Rx2E/es6FACpCB8fJEkFDhO3AlNdS
	Cfzus/Y8oyxI6LM0NPwVvj1KmfBaU7LGpyaETYhwkRI7pLd1JGDvDD3csr4QPTqlX
X-Gm-Gg: Acq92OFv8sETbNy1DfSOzktuwyKVAbOFuq5Woqo8tz4BX/viOFsqiBvroK3lcVEoNdD
	wtkEnrKo/jikfHJH8gUSx89gwHJBYEiNBBKUP/FQICDgs5ZaoMdz3j3oTL1uvgeFzukAUI4ljkk
	IEQXjeAl381jNi0qxIORqsYNfnjTe4OyhukLxU3SFLw2EucvjrHGI7LtjRdq8lJ/2UnQFUU2hvH
	Av/zqfPMcr7JpaJjHhz2l8LMD8e3RXcZVq9fUKY6WAshWkJD+daFn33/RxLors2IZz4s63TNyVz
	ONnld6RQwneJlOGxvVevdI/CtxtvxbOAqQ0TX6o91ConDw+FzcWNUVjxkSuWTs3ncyEyaRZJdlS
	L5eiZG7g6B+K2FSFbmtjzj+t0yxM53Bmw1KKZ
X-Received: by 2002:a17:902:ce92:b0:2bc:a52c:c8fa with SMTP id d9443c01a7336-2beb076ead2mr253425315ad.26.1779897343616;
        Wed, 27 May 2026 08:55:43 -0700 (PDT)
X-Received: by 2002:a17:902:ce92:b0:2bc:a52c:c8fa with SMTP id d9443c01a7336-2beb076ead2mr253424805ad.26.1779897343045;
        Wed, 27 May 2026 08:55:43 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beff36894dsm1264135ad.37.2026.05.27.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:55:42 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 27 May 2026 21:23:54 +0530
Subject: [PATCH v4 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-shikra-dt-v4-4-b5ca1fa0b392@oss.qualcomm.com>
References: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
In-Reply-To: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779897312; l=4539;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ODfMe8YwpE9zm6WOKy1yvRuBsZs9KnzIUkMMO4tFT3E=;
 b=jyYeXsEL0Bq3VtQJhwc4rgTZTSMqWvMGcrLs8kjWOWBSArHZoDD/7m3I9UTqNjdmpgWOTDU9J
 Xt6s/sxjLkABhszm5a2pHyGBWlTP2T7No2xluZ5mUuWi5bjuNwhXpy3
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1OSBTYWx0ZWRfX1VALk2tsQORq
 FCKVG4ou41kmoT77NFwFkyhW9cMl8QgdJrR89Rgg/aFeYbjwPvaVKf55BpzrHXEjwiWYFYw+SRz
 lVlUoBfuwpCAKOORpQLA3Iid/LeOYX7K4/iEfPFFD0oGYgbx7jn6kA4QHWjmpFEKATKOXWgKhkV
 VO6ADmp73QEKG7gRiWm+ISiNsiDILFyKpKOFMD0Wb5rKwemaAjcT+CmhGDi6tXjirVQWHf6WnA6
 nK2eh/dpLadFfwSu/VsuL8e7Ag2Mv+MBECkMzGJQzZmUtR56A3fCcnkFOSQv5Ji6kdtx843haqx
 eCHVQ6wj1W3gFQUNLPcWQTCt5ydgxwX1wsh0rQvVHS7dAmjvGg941navkfAhDkrNOZcsYSeg3SO
 XE/+DMH6Qavg51s9sdicLqgnKpc+AA==
X-Authority-Analysis: v=2.4 cv=R6Uz39RX c=1 sm=1 tr=0 ts=6a171400 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IZjsGcCFCfEoDLf82CEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: TE7GzuEhjtQ4kzed3loM00PhVmddbrRC
X-Proofpoint-ORIG-GUID: TE7GzuEhjtQ4kzed3loM00PhVmddbrRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270159

Add device tree include for the IQ2390S variant of the Shikra
System-on-Module, an industrial compute module integrating the Shikra
SoC and PMIC for industrial IoT applications, designed to mount on
carrier boards.

  - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)

The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
definitions specific to this variant.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 170 +++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
new file mode 100644
index 000000000000..73945bf42112
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm8150.dtsi"
+
+/ {
+	gpio-key {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_n>;
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm8150_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8150-regulators";
+
+		pm8150_s4: s4 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s5: s5 {
+			regulator-min-microvolt = <1574000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s6: s6 {
+			regulator-min-microvolt = <382000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		pm8150_s7: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8150_s8: s8 {
+			regulator-min-microvolt = <570000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm8150_l1: l1 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l2: l2 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8150_l3: l3 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l4: l4 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm8150_l5: l5 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm8150_l6: l6 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l7: l7 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		pm8150_l8: l8 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l10: l10 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l11: l11 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l12: l12 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <1950000>;
+		};
+
+		pm8150_l13: l13 {
+			regulator-min-microvolt = <2921000>;
+			regulator-max-microvolt = <3230000>;
+		};
+
+		pm8150_l14: l14 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1910000>;
+		};
+
+		pm8150_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8150_l16: l16 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l17: l17 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l18: l18 {
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <728000>;
+		};
+	};
+};

-- 
2.34.1

