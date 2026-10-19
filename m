Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B54AA57E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401509; cv=none; b=ZsFaD00yJwxtMQXkm4D1lv8SZ1kkWnsU+iiq4vlvDoBb9V9roq+/yJB4H4Wl+MajhrkdjgvuzeCPZ4Dk0mJ8wIDsyZgNLLMLwpv79nyjEpif5NLrlry4guQYamnuCwN17S28a6i0zcnxQHltwCSoyz05zfyJbASxyxc3cap1KfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401509; c=relaxed/simple;
	bh=Gk4MYI6gZD64lB8jqs+VeFEB9RTHDV7aov9asAEAoqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jdu6n8K8EKqpnOmk3oJmfZSL9Ngxi007W/jyFum9MbLqbYcYFWYRIgnQFQvLq79GztRDTqGy/sSI5Ael2ToCJzLLBXybp7Qe9297ICSJjWVXMJ7ee5qIkgTIw08KyeEGYa6FGydFIk2yg+MH7PJ3S4L9a66yg+bWmLyOo4tlGOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1F8rkLT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+qdsahW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1F8rkLT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+qdsahW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OsU2723135
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myWgXXG8iF+vXRiE8O56/LC4PaTh8cFxHTKQwgY5Elg=; b=J1F8rkLT9jxWdE/1
	J4n6ITLaKA2X20EWCQU35EltVB4BDfssQkPuXts/r2ZfsjeLyL9AE3d/ZxZvGyJx
	+fEH7TySoQdstnsj9Mke27sdcWcfDxyxARA8W/+A14SBzQFMtPcQeDm7FHB/+h5I
	eSXJ9GizIQo6qudsfOf2yRI+MesXAvFEtQ9W3i3MxuNxTpkhjfRW1E36Y2Rb64FQ
	396q+F0yY7vbbLra05IO3kBUnwEwPg5+4UCw18CeEVVHHwiSsayLDqnKKtHFQI5k
	2ShQSYSn0UA8ZuUOYr3p4bzoJkrXmTgACDWSwN1UPHhXMfSz2duXhfEUTKZR6+ig
	W4bBow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65gaqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:18:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917bab67568so68513946d6.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401506; x=1793006306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myWgXXG8iF+vXRiE8O56/LC4PaTh8cFxHTKQwgY5Elg=;
        b=G+qdsahWykpzA1c5ztHMv3UD01YC+O6ttdHSBiCLc8NSnBHRCp8FiohnHAnSvV+Ufp
         d1a3qd+w42KLa7fGrHYkb7m/muNcw2CYyaiFZ+7en85w5xhSQ4w5dCHhrrkNTZNLibGJ
         jFcQ1r7dqs77LBYhpF5oPqlEYT9FMQe/QWWVbXAlxo3OjF8PvoCCiIm15E35dJYm5Wf3
         xAN6BF27pPMq4nY2hAm0qzMqgozj2wzupiAGVwZTmVBWrrCTL4ufFLyIpVi0tEXy2DBE
         Nz1hMDpxtzrADQWgUUXQSANfMCE24pje51CTOnHrs4Xj1XRD5DtuoYJ+iFgOWHXnDPKG
         ZdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401506; x=1793006306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myWgXXG8iF+vXRiE8O56/LC4PaTh8cFxHTKQwgY5Elg=;
        b=hqvo2Q6a/nl6xoivZUadOKpfMH6DUv+HFkc0QETct69It/9367QAb95zOBgwgATjn9
         Jd41NQ4OHdy2Rwt0IRDpgPd/hIaYIFrdzFNXeMqGWV6Oj89zFoZWfRdcMcUYhVIMV9ND
         hfpnSpNngccx9dwLV3AffRk7YF6s7YH97F1+2Q7geqlgMZy7/P/5dGkvWezzMobWabLX
         v83ZmzgL4jaDnLSi0KeaXcJvO14yerkmVDE/MnUgZTFGQm5sX9janFskMnuahSFOSQkC
         0tdxTYAPd/pAoSB1yKTm9ArO9kv7jCKacrHVhfuxr4dU46gJTdvV5MrBM30HUJAm/LPf
         +i4w==
X-Forwarded-Encrypted: i=1; AKwUvBwsuhfSEHDYXT9tqIMchMGJKqiH98XOI8nDE/WkpioC0tNchchMYduOAbVSXYSeLNZfQa512y3j6D3b@vger.kernel.org
X-Gm-Message-State: AFq9FYI2fRu7SZRulL3t2wSseIllYU3mHD6SYtMwHGhjcNQulzh3r9b9
	Oso53NjdrzlSNprB1xGSemsaW93OOM70omX7JBNiPPDIX0KC2r3BOSz+6STPs4YZS7pWBJygbi+
	fA5lQ6WYK6+EiO8ay/CNroKj4tcIR6TOmTdOdx2qBJscbsjsd+d+XP4WAJUvqlZ+E
X-Gm-Gg: AYBFou1EE+UV/LNcolaYDK7gnWmFkS/Qs/E3N3clnZi4h0ptwZn60lPoKXOATMQxjRt
	YeTJbUYjW5CHQGgm6I0TiNr2ZnmjemOghcDhUc+XvWSZ6YE2js9S3NLickC3KZlSuglTM5w3n2B
	M3aTMEy6oHaxdxziZQObJxTDyzn/PJiZvhMKSyyOfLVsJ3aFwvrzmKYecrbBc9BQPTTUHorWFS8
	eBnVddCxiiVWSR5YlaLwNvBrcPTqWgteDaTWPQXtSBiJ7h3HExhA8L20vGNMIT0y3ULM7SnNlUF
	wC6jlLU/S5P4dzKMNu2QYI+B2vkBRtP63rNkC6/4FCpcUxukI8PeewG6wJeuwx4/Gr3ecjvVp01
	pxAXbfDHBari2Ok1KAm+iZf/f6Xo1cha64uAPyCZP/2ASSSTnuCMzO5iPhVQ+yuqQy0jmhZiHTT
	4fXPd5rXkzYvId
X-Received: by 2002:a05:620a:230e:10b0:93f:2ae1:ea06 with SMTP id af79cd13be357-93f2ae1f225mr732440785a.44.1792401506016;
        Mon, 19 Oct 2026 02:18:26 -0700 (PDT)
X-Received: by 2002:a05:620a:230e:10b0:93f:2ae1:ea06 with SMTP id af79cd13be357-93f2ae1f225mr732438985a.44.1792401505515;
        Mon, 19 Oct 2026 02:18:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm15893441fa.25.2026.10.19.02.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:18:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:18:07 +0300
Subject: [PATCH v5 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sdm845-hdk-v5-5-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3676;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gk4MYI6gZD64lB8jqs+VeFEB9RTHDV7aov9asAEAoqo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1eBR1tmWG6zeCOvuonHAaCMIEV+WWzn8XNCgn
 J3Xj+NiVOCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatXgUQAKCRCLPIo+Aiko
 1RwKB/4rsmEwIX1nmfiibiHGtpcsn/dIQigZZreg6kpuVuey2k6J9pekhos1EGi5T1cgdwQzpOG
 bM9QpvZLUAbpYqrktU71RTHjeE3zTo4Y5HQgr0MXZifrxrImmsSqISxSTmtv3BvGDRwWX+Arbml
 UA73hnRMUhag9G47RygcTMZkcbntOT5ubGrQPqiPvcnzlfTxOuEye8H4ZbHf0ZvMQysHarUTTsm
 Q+BngOQ/U3dvLFK+qdO5Xnew3QK7A/MXxhaemB7p0Zhbgo95mcpHROUNIpJ0juVJdBfSp6p4ps6
 zvZA8gewXZfJM2i0oC0kQayPPifZJa64x4UuqU/t87n6r9f4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX4lkvMUdXRofv
 O2O1zv/zc8mXSYaUwnK+m5IjBHYelQfmq2UltSz7dFPlKKz1LRTt4ewbjJ2m9oXfbtcFHoZLhcM
 7vNVSsZsLWb8ihg4fwxki+ZaXiZthxc=
X-Proofpoint-ORIG-GUID: v1tMUAme3LN0yPA5wmljyD3SygM_EuV1
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5e063 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YEx-fy-UkOsNpVOY4JwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX5ucgYbUUCpQX
 uqej1wAGfrlzz4D4+P+cJh13pH1B53SUxKbAkrqcJxS2xGaj/K7ZrtQVnb8kDXWr2dGI9pGezCV
 VTxpR76yfr1kfs49D54EtMfl30shM2X/pG85DXPbZ3DpkhvORcw9q12usVAfMi9nM4sAuTBRRsb
 M8+m6TqqAZNQsS218LeJpbg6wuI+dNFwS6bisS9YvDXu2YslhkCh6lWnhNjSTKh4jo5HUYUoUbq
 SCdEBRHs0ny/coYDluzks+kyBOffbsb903arlFfBjT3UoQRt18UgdzJYXSgr0IJcWJXpBAvpf4j
 lkk7/74hYeysKLHr5+nu1W5jzIeHgf2hZ0wdY6aecJdXbE7OU33z3cL0pArJKYySx2YBG/YB8mH
 jzz7JW+fcsbPDUl5qA6ysle0w8NaktjiGwE1kLcNrRur+YwlJm2eeXGmFQq11aTXoVuCT7Z5PPl
 XSslB1dcyiHmDrW7IZA==
X-Proofpoint-GUID: v1tMUAme3LN0yPA5wmljyD3SygM_EuV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

The SDM845 HDK can be fitted with the display card, carrying a Truly
NT36850 WQHD dual-DSI panel. Here it is powered by the PMI8998 LAB/IBB
and WLED, and it is mutually exclusive with the on-board LT9611 HDMI
bridge.

The configuration follows the vendor kernel, with the bias rails at the
5.5 V default of the LCD mode.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     | 109 +++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5be99934cf9f..85d06a950b4a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -356,6 +356,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-hdk.dtb
+
+sdm845-hdk-display-card-dtbs	:= sdm845-hdk.dtb sdm845-hdk-display-card.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-hdk-display-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
new file mode 100644
index 000000000000..1022ab096170
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Display Card kit overlay.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/dts-v1/;
+/plugin/;
+
+/* Disable HDMI bridge related nodes (mutually exclusive with the display card) */
+&lt9611_codec {
+	status = "disabled";
+};
+
+&ibb {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&lab {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "truly,wqhd60-nt36850";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l14a_1p8>;
+		avdd-supply = <&lab>;
+		avee-supply = <&ibb>;
+
+		backlight = <&pmi8998_wled>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				panel0_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				panel1_in: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel1_in>;
+};
+
+&pmi8998_wled {
+	qcom,num-strings = <2>;
+	qcom,external-pfet;
+
+	status = "okay";
+};
+
+&tlmm {
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.47.3

