Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938993672B1
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472981; cv=none; b=irVZvbyI6XpAVVPtd49uNjqsaS0DECrqGa5NW86CqvOo3nOTe/NC0LxwuTEpxQMh/cb80y8N4B8bXelisy0XPvPFVwq8QKIerAxd6ccUy0XVPZ1770SGONXaPmeOD4Fg8aOKhvW9gj+7xn4azpgR8gGZ294Bg8QaK2KRqctUPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472981; c=relaxed/simple;
	bh=gyY1XiTKArO3gJDJCSJfjS7xSgApxMt112/xnTGtpAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHQDbsLgA9Sjlf52oldwV03oJ0by7Q9rychkmVEEyZjTaAGMut4DnKISk/fJeNq+6j+mk+U3JpeaWOPITgrJrv+cmWbtNyFlEFT0D0N0mdbKrUCbdN6OZl3isJs2mKA/2v05+X5wwRc6aPOKsQOZX9Ix+s+gTSKzgUI/8PrP0Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kbf/6Gs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpHAVk8V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kbf/6Gs5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpHAVk8V"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFuiGv3005120
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYbCyoSrxp2f0yxvAlcjf3VHWtL27L0/ddWablgzkzk=; b=Kbf/6Gs5EBaOfZpY
	e42nxdQPhPyuAqLIxy2J9TipfdTHdsLkg2bRpgxKX5/AcbOid0ZacorUyQIaBBzG
	H7ndCf//zV3X3gQgMxJ06BGwUv2kEtQMQzuH2aieXYeQJeWtXSD56D7tMcbH4GI1
	OKaVAkJUT1MEEOqRsatYpWH2zB+2dei9OysI1i0Nsb3DPgwy6bfKN8VTg9cNHbQi
	SVWU7qMkfoXKq3xcGep/TMx6g+ci8zU/QgEjHzyUe9+P5txlir0rP1BGYdrsfDr+
	0LeambT3s81BS53Bw+fiqa5jZryOTsDDKZhRqu6qoul2oVjVux43tiySRp5P13eb
	w3xMjg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtbbf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:02:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba115ab6bbso80107475ad.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779472974; x=1780077774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYbCyoSrxp2f0yxvAlcjf3VHWtL27L0/ddWablgzkzk=;
        b=IpHAVk8Vy6BAZNQp8SiU+K1nqor2wj3IFZstqNkGu/TuQC+42Ek2B3wRmtieNnMTU3
         0uKGYGvJJfbn4HHpnZ6qUGXuY5J1edHb+DTm/yuJhwGSsZyUBvuo3babQnQpp4NZqsnY
         x+FTo7js+rubKc8OnXQxRMzPVYv5Ra5RVY3xwIjUJWkH4Vw9HTyuC0Ush6mvSfv42w0B
         L5PEBRWSpyGpePbVCcX2Ef2M9qBkwffByzKJ9ibs0WTroVsdZxcJaqBARcf4eeKSFg8D
         06is6EhAXHoLbW1OrWs8mbnwCLSE2o1NPgBlti5V0wl4SPVQKbR0H/IiOqBi3/4z0CNd
         yq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472974; x=1780077774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LYbCyoSrxp2f0yxvAlcjf3VHWtL27L0/ddWablgzkzk=;
        b=JN/UpLsGdDe3H1ZKnP7kEGjs4kc8TS2fxTiTFsv6CXDMkVMpkoH+MP7wr03uoNimwz
         1gHKpSIN9gBs8vShQP2PSuZKJdaUrZWyhafeq0lT8W+MInfJ8EUTXkLIwyfEgSREkh/s
         Qqq31qUOBOHTyyjSvsJoDPql9KQr+Db29/9YnzGDpmJRMTqbfiHtpWLk6thRnMYWysuH
         cpkWizhnfoiJj6DlXP3u/J/7ISS/FqedsW791pguvzEnBvQed09f3YWHbcr/TaouKESY
         YIzEkhZOgV6q86Ip4WMV5Jhr7kNgTe+irM8ZqxlltpFsSJEBK9yu6u3O1JHUZBAq0Xut
         41xw==
X-Forwarded-Encrypted: i=1; AFNElJ85kkO6nBfRYsPkQlTIQJTv7f8+qHvQ+39IAo1CvQEfgF1mlnaJZPTfHWWrv9PUvim9miOI4B8i/Xrg@vger.kernel.org
X-Gm-Message-State: AOJu0YzHNS/lPK5fThGxetJx7nlUp02QzEgJnCqRNZJ7sQ/JWKw9g5X9
	s148K13h/o1H7VbVu1KM+QpZm8ZXng6ElY5AOp0+yX6zmObOzD4azcc731n/iRvQeXB9JLjWSiR
	AIufhKcHOaGJZsQgGXjBbXMzYh1uZVQSnR1t98BOGQzceoUPVipGi2IFT6eH9cGf8
X-Gm-Gg: Acq92OEvk5OGaSvLpB7GRBbmLfwbfP1K8nvHtGRe3Fx5R81eKPLiTh3rauBEyTq1hQt
	NoO8OoTPqW1pH9TRVsMS7ZRmVF4HyLo549WZJ/s8ZNUomaQzvV7p2B0euV7jD+l4hOUNO8Py6b0
	KD0eG2CTGOBSgrsjLDRAsDFlw3m+e2BQZRp2afxv3s2dJg5Y6FRpaEWseYfmTa1t8ptKQhNVIR8
	DPUhNOf6y6nN3DXi1IzzRanhkqaMMV2pN5ow25el/qlU1Yf8x4Fd3U0cNpo54wjtPBc807t+23l
	/dyt4l7Z4uwup1baz4lqlv5NMCNm5cDJCKUoVv6d+fMvj3uPewa8hOx7Y1AZ6oVNrkeCiR+dcHb
	jeCafxopRYwSvkFLELd9YUjGeo98DjLzeWcTv
X-Received: by 2002:a17:903:1a10:b0:2bd:2430:eb7b with SMTP id d9443c01a7336-2beb06cbf6cmr53141145ad.12.1779472973785;
        Fri, 22 May 2026 11:02:53 -0700 (PDT)
X-Received: by 2002:a17:903:1a10:b0:2bd:2430:eb7b with SMTP id d9443c01a7336-2beb06cbf6cmr53140605ad.12.1779472973267;
        Fri, 22 May 2026 11:02:53 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58ff106sm21193645ad.74.2026.05.22.11.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:02:52 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 22 May 2026 23:32:26 +0530
Subject: [PATCH v3 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779472947; l=4361;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=gyY1XiTKArO3gJDJCSJfjS7xSgApxMt112/xnTGtpAM=;
 b=3hw0jq4U6PlOsygUfYiXLFHUOBdUHGipF5u5OsPsLZrj2E3lxCbBDryNt8DZzBw0Y9TPqVJOe
 cUBb9e7XfLRDkr6i4wecDON2DKyFAnSKvdbYj3ZGtiJSUZi4dvdzu7P
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a109a4e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=s31jhp6hv9j5UOuNascA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE4MCBTYWx0ZWRfXw4vdLSq9Ejf1
 xriGiR8fVV7hQRCyrPBQZN5CuNeB7wXTzBc1e4ZPSMhSOCs2gLZ+K6z6LwswdVEzhPugKlY0Yg5
 Mbq5dZTRZKUt5ptxbc7ALGFLlmQ2d0RgXS7hATjmDsroNKYMewPwvP6XZxHX2QZyC6vUfDubPP5
 yIMjNVLuhmICX4fn2gMDsvE5xZD60Vzb+lfrOfo9wYfuWu+onsYmp0HUy1vGm/s90eVu889aLWv
 fCfKVDbrNEak/RRgJdUW15qOvmgFFxvuLYSvA8dkDA5H3gyFNGKEoZwhKIRbDP+Gh+lpzu+r717
 YT1RQ1GRuZxWrINbS5SJ67xcVEidcm++/un1g08PJ6bEK3TCHqKIrnIRmB3MtMcu+vMMoNhTJDM
 v/4LHT+VMbSJRfa6P9Z/02sMzJ3X0XXo4+rir0ZOUxfKwqPc+ZdSOUdLuazibZWB5t6K3Z3g8LJ
 hPe5NDo5WfVI+FSkmkg==
X-Proofpoint-GUID: -lPkSoC4yOyXara-_aCM-DXv40IvIWVD
X-Proofpoint-ORIG-GUID: -lPkSoC4yOyXara-_aCM-DXv40IvIWVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220180

Add device tree include for the CQ2390M variant of the Shikra
System-on-Module, a compact compute module integrating the Shikra SoC
and PMIC for IoT applications, designed to mount on carrier boards.

  - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)

The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
regulator definitions specific to this variant.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
new file mode 100644
index 000000000000..97966cff8896
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm4125.dtsi"
+#include "pm8005.dtsi"
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
+			gpios = <&pm4125_gpios 9 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm4125_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio9";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&pm4125_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&pm8005_regulators {
+	status = "disabled";
+};
+
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm2250-regulators";
+
+		pm4125_s2: s2 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm4125_l3: l3 {
+			regulator-min-microvolt = <624000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm4125_l4: l4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l5: l5 {
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l6: l6 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm4125_l7: l7 {
+			regulator-min-microvolt = <664000>;
+			regulator-max-microvolt = <664000>;
+		};
+
+		pm4125_l8: l8 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l10: l10 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l12: l12 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm4125_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l17: l17 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm4125_l18: l18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l19: l19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l20: l20 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+		};
+
+		pm4125_l21: l21 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3056000>;
+		};
+
+		pm4125_l22: l22 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+		};
+	};
+};

-- 
2.34.1

