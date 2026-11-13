Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600044;
	b=5kw61v31siIT5H7tE36jUm/h8Yq/A+V0Mptr1RN9q+NvNvLilWbVqgTURhvLcpuEaawz
	 fRlcjCiRxMICDpFn7+9f4qtY9e78JkZ6pa7YYutvxsS5AWtog+HYAQJfC48RsacEZa+tO
	 UY243Cxs4Njg5tU+ZGTJjTYfvJrh2yU96mOE+57t25p1MDnCP46r6g+SdULUZutlMyHK7
	 zAxWa/ozKQtbGhQuz2q1icNiKbuKVnW2Pec2M6355IFI0KW4wElsF55475L9DtaJBzbWZ
	 Jzvy6tJgPQT31fY0C5y5cOaQKtvs2CRdUtOG+AjqY9I73sUlUBaiGDC/3OBIdSOyGlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7ejFrWAYoc6NkM/mKIjIDoKcqitp0rzGdrJbpvWUuvc=;
	b=rO4yaJNIggSBIcCIEl9nYJMAEbAzG2DdGLCmHh0mylpnvxxYO6SdznwLTpL5EymXfizF
	 w4lpoxZYLLyW5JRh9u72CwBQucyawAJnx1bkMI4I47/86WSbg4BKSOyrrKOh722P2T1KR
	 7PNvP2mNKAwyDjoYxBM2L2UqbxIWUjl6xUL+ijAukOFQDBdXeK0QVwwSYYlrrxdK7U+Fe
	 dDZ0dFmvEESZ9mozz2fAHXoIZfSLhop7x7Shzc9khhDVMhKwhe8w/TCvKyNQoqcmtD2Hg
	 04XeeiXoVKyTsrx6IQkUcQuxJAag5+60k8dVk1NxLnECx2h54ByueBWb2J16NrjFQGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBrcpyBj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YTr9/kNh";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95278606A880
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95278606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBrcpyBj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YTr9/kNh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ0AsC625440
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7ejFrWAYoc6NkM/mKIjIDo
	Kcqitp0rzGdrJbpvWUuvc=; b=dBrcpyBjwPI+nGMgipVVTixGkyHT3Ddw4WsHn3
	BX8GGfrs0Q8cYrPZ9VJWsxj0U2JBPKqXBpaZt7DPobtZDi6uhzckcsZuFvWhQ1n/
	9R5gAkocZRPJnWIlfOJ3xBfv/KGRa4+r4Srt+kfKHtN0Eyqyg2d3/ept6u650u5f
	tCs1G+ZYPP7HtvvL7IcPKIF6sReoT+SkN41Tw1QMBcmzQrVxmPq8/qKhb7Tm6un+
	UhqsgSEFgts9rvmZHFduCUt7B/2oy2pMtw10ZZrgSsoAvih6tbttHQtuwY6VuU1x
	Q2sU8H2mOS7lAyhohbFAATi715kaNO4BIJTGlXCRBmd1/3Og==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mucqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:00:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5e8574384so202032a12.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794600042; x=1795204842; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7ejFrWAYoc6NkM/mKIjIDoKcqitp0rzGdrJbpvWUuvc=;
        b=YTr9/kNhA74NGME/YHX/oX24ZbgOgT9Tzln9QlS7F6EkNeryOY8/eI67pzP9bsaILI
         7zOzzr16mmTUPOhEppusTj68XuPjpGXufWupJpSWNqJ0BFB91xkXhX8XRereS23fDy9F
         64HwUlUMWWhB8oTsTdKcyiHVYH2NNoCMsDbkTQydbcFx8zJQ1UmIEX4CEL+Z8aAJNP5i
         XSauUZ9yENCr9aBXuUIk9EIy5LSWOrU2b6uwPJKtJ4e+bsJQ+mxH7oH4HPWY1j7LEifI
         EAqVcWRBuU5oMeUyAFR/p8nX39MfWx9OWzCL1Ggo22mZaLB4BM610iiWOoIBPswU6+aN
         4srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600042; x=1795204842;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7ejFrWAYoc6NkM/mKIjIDoKcqitp0rzGdrJbpvWUuvc=;
        b=I5R6gIPWMxb05mTuQewpJY29ByhthxS12SBpXYsr0usPzlfNRZ6l3dgs9Dix4SKp3n
         KpynPfxkvPisMXD5nZM7TeXp7rrJLNxaHVxjz9PtqrBW5qKOi7brfn8zZj/0b2oTVJnh
         Dj/5pr7NXuAQwrrdDePdKRDF+/r5t1weQDIOTb6eGHPK3vT+ufeEbtMDGD4tiJSNRLjM
         NirifUP2vRJDE8cdhK51vV6qW/yormOjLicctlnAfus75cSvSyqykr8rq1NKkaWKfV8H
         TfdTFcH/ZZqWhGrJvG/fWGFqVSwVBSEmFc3ZGQ3JnnjCCLvLHBVL2kUuBEMCnb/ksxcW
         xVDw==
X-Forwarded-Encrypted: i=1; AL+hErEO9Qs4tttZz+Ffe9fPVtEE33CteNHUvgJofKligLzEdEhu2PGVkr3a15IMyUX5aSWIpnjr4VTLhD8q@vger.kernel.org
X-Gm-Message-State: APuU4Z/vDtodJEeZ8W5HdaWVhbdxpV8xSXy1+2qLO50d9NBetvltw0a0
	aYH0xDWjydI/thK7gHy5HGAP2GNpDlhVYw07N94BFUio5zo6z+1fUPY1vGwz7mCO1pDpk96op+v
	u/4Lf+Mc5qrSNvCcx3N+XW0t+NtKaN3thbvqja+6D2oe/TaEykPDS8ecKtzT7/9hD
X-Gm-Gg: AYBFou0RaZxisaEtTkwPmkBy2jzdr72fKwcua/ssqtZPH7H15w+NCoS1LDXWbdsDgm2
	nsHcmUsKwcpAc77UVLb+JTDsDH4+/+OVGtepG83WSvJCa7YHwsKNLwsOaSg1PMlF8NSQt8IHZka
	UZzi1DLo6zXl2O4Sxz/EXV7AyS0mvlDYAAdSdc696+RNQ7vLWFItCrRHoDk4eRyQhGIX8rr6W2m
	wfnF/FBg5+3wqGyAFr/Ay3cMpAhlAnYr0HKYQHQpZXY00sgiiY3yTFsrZig/KvNSyM8ZE4TkAs0
	BXpLcGTj2WF0MYWfxTT6IYqiO8AxWvuvwkq96ZUk4bUgAOCWMN+LinkqO9UWnoaqF8QM5+Uvm88
	K3Z7dZjOuu52FXI6mMlF156Le5uM2gVrx1OOxYukUrCtP6fPRC12/PSo6O3h/JmK2f6S0Om33zk
	zDwAxhaEfvFwbpTRROyZe4vehvnhMWacAqrOLy2OYxzUWh+L+QZzcJkqy9B6wLR1Wetdeie4Rcx
	9b+XXZVloh8GJtGNWk9m4n9qRlZ
X-Received: by 2002:a17:90b:568b:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b1b0815b27mr5457006a91.1.1794600041468;
        Fri, 13 Nov 2026 12:00:41 -0800 (PST)
X-Received: by 2002:a17:90b:568b:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b1b0815b27mr5456920a91.1.1794600039985;
        Fri, 13 Nov 2026 12:00:39 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm5848240a91.2.2026.11.13.12.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:00:39 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 01:30:32 +0530
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8"
 DSI touch overlay
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF9s92oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3dz8vKrE+PLEstTijMSi1PiUkuJ8Xcs0S0tjkzTzxERzcyWg1oK
 i1LTMCrCx0bG1tQBDjajNZgAAAA==
X-Change-ID: 20261112-monza_waveshare_dtso-9f9934f7aa77
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794600035; l=5122;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=fWD2NzVvpEJkiApuE6cd9ftuuVf/b/Sa29Gdt8SUQCo=;
 b=qfzO9crN4CCZ13v+FOXmerULVwDvaV0P7RAkEOoNvHGm8cnB+4KbLYrakkWMOT92pRkokIeGt
 XS5/0lB6J1oA3a9fc3+klwMjO2FFpbPZ0O0mVowhIhij8zMG9RD6HaP
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: 7VdGe12DuBoKwlQKZEegsyprN4Y18hw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3OSBTYWx0ZWRfX/XHS8TkI9woC
 Ul4rJ/H4Xl0PPN64ciRImhMWsghdWCbWWhfPliS1PMVr1p4vq6At/aRbikLlGeLsT4Yaue8R8Jb
 FBiluwte/xwyxNrQPruax3+TGPcBQyfXI3GFsjl0Pd5uQwdiDGjANsi6tAw0ttxD1+mLKpamztR
 5w8Hpsyd88jEsxmHY9MUzCDxAt2yhYweA2w21ETmUOEDGKDdQAQpvvxexgiezY2gURPU4mzoWzX
 q4z5XrpZhfztm4DOlMNUeJQl3pKnQeYYuiRGE4N2/oR6YHJ0Aa7TdZvFp7i2JGXszjJLwb/q5QK
 2kX25nQGjtmO1y5LZaoZwnvYgHoUcSYGjBDibqiZLaGHDyK/9SdOkRqHl1NUItp0eTSFdl4pjyL
 1YhnUrUWhUGVzgZ6LWiciKPl34+9YYT8vZodsDaS8tUasLnBRDh87REcvbgIzb8Dx0hYjqBW3BH
 huY+XcDikwR/4pV/T0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3OSBTYWx0ZWRfXysCq89r6NH0u
 +XFGDCykxwxtLs6B/O9fZBGW9INP94KRHoQG6al9N66v2lPe4nDqi7SUQ7NTsEKodwiqSLSCz++
 BPQCXeZisWv5gjsJ1/Q7HtnWafunnrc=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af76c6a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bXpNjNPP2SDK_YsUSp0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 7VdGe12DuBoKwlQKZEegsyprN4Y18hw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130079

Add an overlay for the Waveshare 8" DSI TOUCH-A kit on the DSI0
connector: the Waveshare GPIO expander (panel supplies, resets,
backlight), the Goodix gt9271 touch controller, the supply regulators
and the JD9365DA based panel.

The expander and touch controller sit on the CCI0 I2C bus, so enable
cci0 for them.

DSI0 is shared with the on-board HDMI path, so disable adv7535, the HDMI
connector and the hdmi-mi2s-playback-dai-link sound node, which would
otherwise wait on the disabled adv7535 codec. HDMI audio is therefore
unavailable while the overlay is applied. Add the hdmi_connector and
hdmi_mi2s_playback_dai_link labels to the base DTS for this.

Co-developed-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   5 ++
 ...naco-arduino-monza-waveshare-8-dsi-touch-a.dtso | 100 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |   4 +-
 3 files changed, 107 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..faa0e0f7b867 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -83,6 +83,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
 monaco-arduino-monza-el2-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
+
+monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-waveshare-8-dsi-touch-a.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
new file mode 100644
index 000000000000..003c5bcea497
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
@@ -0,0 +1,100 @@
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
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&adv7535 {
+	status = "disabled";
+};
+
+&cci0 {
+	pinctrl-0 = <&cci0_0_default>;
+	pinctrl-1 = <&cci0_0_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&hdmi_mi2s_playback_dai_link {
+	status = "disabled";
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vdda-supply = <&vreg_l1c>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+		backlight = <&wsgpio>;
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 9ac2a04b302d..f518db091092 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -51,7 +51,7 @@ button-home {
 		};
 	};
 
-	hdmi-connector {
+	hdmi_connector: hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "hdmi";
 		type = "a";
@@ -113,7 +113,7 @@ platform {
 			};
 		};
 
-		hdmi-mi2s-playback-dai-link {
+		hdmi_mi2s_playback_dai_link: hdmi-mi2s-playback-dai-link {
 			link-name = "HDMI Playback";
 
 			codec {

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-monza_waveshare_dtso-9f9934f7aa77

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

