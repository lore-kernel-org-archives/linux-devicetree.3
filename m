Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353248;
	b=EB4ZgkkAdwlhF0+m2LPUs4c80rbpUo7u+NZfNMZXWw+Mpuc3de+hLgVmflWYmYY/U+vE
	 W8k28B9GE/Kk6fWnuoP21cJ7hkOJubSzDuQFTp8jYf8194s48VElop9f1x1EUJIH0tAoT
	 V/oSzL7K41IA2nyBJuQmyDY+yKxxuZZ1eJCs/48bZAicaVsMbbLhTg+2pV/teuP4Q8p6i
	 MLbWw1UY2DRIfY1KNHei7C2UBc8FPWyJZX13dgu7bR4eTGdOIORoam25Tdqxj+CBrwxN2
	 Vyb2+JMT+rklcjITIK/oAcihMZkwTaCG+LdfqdKXSBp6GmcFpDLZ5kMVUBnHfKvhiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
	b=pmi7KAlAPOxUHleGmRzG9+ojDMrI0C9bILWBPp1QTFY2MYsFJTCxMFxkr0Nag7lcsYpc
	 qYFJibDqjzBEJzmadmIizSYEWxveIdocwpBL/Vd5eb8Z97EREaK5KJj+L6pGLQFbi5fuh
	 NHT/9A0GYEbIU/kxDWabS36lL3mdh7JYRwKt/n3oIhrsqhmIXTyppUo0WTCtBTTUQMY9e
	 fX66Ha3P/I/sPzD1X599XoypnkCvTI+HjpJtvX+W2p2Nf2iqq+yRV234I4v7pebSVn56O
	 LUkrjawCgQgQ29pG3Eb7AcSdvKkfVP41zIATNOWZ3j5TqnjGlmt4rCWdFjCcv2doJiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3rgTHgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ow3G3RKQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB060A260A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBB060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3rgTHgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ow3G3RKQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FAdK2134764
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=; b=F3rgTHgni0gIhpe4
	f1Q0Zr0u9Nj4IUpUrGQrjOVgtwU2dLrDdLFzNhCfik+ko7FZFKRQgHgY/d1bkF+Z
	qKn0Rh3oKBt6j2bP8blcF6gG74MktCoIdOofa8KZGStz0TtHXa3r77hktP9Kzahl
	Qa3hVANHwEJD8FSJUUrBOAmQ14IeZxo24o1XNOpTcqV0z1xsYcA/FAFOI+LOHJ9D
	8GHsHgclT/XvHh4zYCOFeP/tna80QVcweSsH1yQJkrFU5RwV5X6sJbKgjaCyGafK
	Ybzssa/SNwR1TPaAOtH0fFGDrQ5Bz3B+268EpFgkunI9WkqoKJfpUqJRNHBuunp6
	ft6L+A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj8qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so1006337eec.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353246; x=1793958046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
        b=Ow3G3RKQhGYaki2dHl05cntsV/0OPoJdHkjF2rjm2Ihkl9NrrylZxVyWe2EhLsviQH
         8AIsaPOxJRNWDOM9fcj4+Awo4FlubNYSaJoQ8UFGaiWvU/LgZzXugDC2FGdEblDYxt4D
         uT3wV6mAQ4f4EhX3lC95hUQWp9Jl4/JoH3XpQCBKs10tPlLtCeBjLLBMSCKgEX61Bj5Z
         JQgxaDw3ktTr9Ys118hZSyZZuFnFI+S+xchyFfztLj9nRGoUX2a1szIjqkKTmFL24z8e
         8mf+kHl83CPmTk3lt7tX72f9JXM6ajN1epb01VXasnuCtRTlw2MyNM4Bq1vKoP8RGi4n
         ALlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353246; x=1793958046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
        b=G+rJYMEy7LNj87EfIk86HlkXqfNtZ0/T5d+1eCKhq9+wxBTBu5fFSvmhxP7a83Lan7
         WH/Ri/i10kXO9EKJdPZkiPDaDJC9O8e3ZqlxjW2CwLOprFHBNq4kSBGgpDGeuvoQMWd5
         O2W+cbDb6MD2sceGqsDNO52ZdmS4QADBuaBc5hEkst1gONTxmxEB+xbPMd5Ax4lCIlrF
         UQrKGmOLuMMMO5dC5lYK/piM5g04gT6Dh49fiuR7m/ex/joUQHgkKu6a9rSTFboBg5Hg
         hfsZgFMRnIFVckP2ad7n8wTDiczkZ1bG4eyPSGu0uF9/MBNr57VQN/Vwhvb9f15tfAEx
         4BYg==
X-Forwarded-Encrypted: i=1; AKwUvBy4kBEnNfKs4QIPhpf6ah3NXNaxhsjLTNE4aLJ1pGySu89T2XPYi5NnrGswDmjk2BnLSXBTduAnZooh@vger.kernel.org
X-Gm-Message-State: AFq9FYKo+W4H95C+hppn5h6HuT8HFe0kBumIiUt26rwexcuI2hmRlpTc
	+TIQbrlgUP44AggE2aTqia6BT/1JdynxrOw1BdjYQw1sl0656aEWjk0dDd9xYX7ZucidMZTchfY
	tXrfCKclnOIkQYHCqKrE+7VATlCx8d7qeV04fY3XnA3GTDKbalgIrfY7yEZ7OFtPR
X-Gm-Gg: AYBFou2pOc2o+ywihHNz/LSAtXiQo9l+wHQspHhHXepca43zjY/zo7IUSqSUJESLDCW
	qjgU1kWwgDLY0QqoCMEHxpge5QaYJfw0StWrAZH8ij9EKuFoNIOgCTVz5s39bbhVC6P2VeP9hGv
	UK/zJTqbI81NSR0mv8VeJXcu7vWdFL9eXemsSW0m69gRQ2tGt9V/K59O1oiGjbxLNkM3iHCF9Ds
	p0yFdeWClQ8R4IiTStyGhMBR3chxdwYk26IJPUFXhT4K01PsuGln9p5OqchlqxDMN4YWaE04mgE
	ci3r2IeeX9BT4cO4R3rhnCby6HbqEtuwd5uy0TDreBw7x9wPYHmINfBh95QKqYPJ/6Jy9WpvTft
	DdTHlR2yST6gxguVMUqm/6LzabhNkfiqK651FfmjxCaFUnXUYSxrDu0AxTRVgHNEoo1RVdv3W11
	zCj3Sg
X-Received: by 2002:a05:701b:4283:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1ac5cb1a303mr2508156c88.15.1793353246032;
        Fri, 30 Oct 2026 02:40:46 -0700 (PDT)
X-Received: by 2002:a05:701b:4283:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1ac5cb1a303mr2508124c88.15.1793353245491;
        Fri, 30 Oct 2026 02:40:45 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:45 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:10:10 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
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
Message-Id: <20261030-lyra-display-upstream-post-v2-6-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=5139;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=CQGqhSxfLwiW9diGzvVCOt4ve1m0nZXLdRNBE6mgRxI=;
 b=n2ECvROy1GlU4o3TO7BU0WasQyEsMLsenhHIyPK6/66gfTnqxgh8lHELbxYQsRNXvUjhxCNBV
 r44LnuA86GYALZdnxupCxmCpuAZZ5gJpJ5KpNKOkxNvC4j8DSfkICpS
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX2zVEqvL5p0wY
 8+4Wq0rvft8/0G3bdqUomMMkI4RnPmrR1kF4Sdgq9XDlWLPCD8dImQlXIUQQqI1LKueoZPgf7Uw
 qpGA3psVYxQV1oaiFsC1KKRq+lZPWUPrWaHIVfIFUSqSPrRsqGmVr8MNz/oqO6lJJMSDAADMJv1
 jccBiLcme8JI2zXW4CJW5kXY82kkRkGGZ0U+Lnr1C/uOTjrr1ntfcEcpbqkCIOXlTa9xFkJcdSy
 zAGj88M4MuPxB9gM/UUevgrEfockk3b4aHyq3R+5+rNa4B8oKEc1leFGtkIxSfm2vioWyZV86gk
 VUCiwXyVZkaeYI5KnuCMHgg1tQ0hEy+rbywevq6fpO1fL4rocIACTCHWAj85uPTvLPSlWMxo6mu
 6gKHZkMAqvL14pil0Kza/oyHk7V52l4GyUALQ/SsptL5d3nqybDrXrXY+/hKAjDfo/bXOUN/bdR
 MNUkYo8mQcGSYTI/s/w==
X-Proofpoint-GUID: rI_VbOz0wLi73jqkxx9u8iAe6kxGwTZT
X-Proofpoint-ORIG-GUID: rI_VbOz0wLi73jqkxx9u8iAe6kxGwTZT
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4661f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IIR7FofeaqIF4eDoK2QA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXwsKq33xFTXhO
 TpgUBsakA++Q4V8tjmskVbn8SdsT8hAEyf3o3hhyCLUoS4EgoLKAZ99K4Lru11YPh/geq2na3Na
 lcbmeoYAntcjqlENOyqKTidyTjpQkF8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

Add a DT overlay for Qualcomm Talos Lyra EVK, to enable LVDS interface
when LVDS daughter card is connected to DSI0_B2B on carrier card.

There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C5 with reset and interrupt connected to
GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
GPIO on TLMM GPIO2.

Disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        |   1 +
 3 files changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b6a61339914d..012dee96f700 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -468,6 +468,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
+talos-lyra-evk-lvds-auo,g133han01-dtbs := \
+	talos-lyra-evk.dtb talos-lyra-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtbo
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..8c592e6317c3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-gcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	bklt_pwm: pwm {
+		compatible = "clk-pwm";
+		#pwm-cells = <2>;
+		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
+		assigned-clocks = <&gcc GCC_GP3_CLK_SRC>;
+		clocks = <&gcc GCC_GP3_CLK>;
+		pinctrl-0 = <&bklt_pwm_default>;
+		pinctrl-names = "default";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&bklt_pwm 0 100000>;
+		power-supply = <&vreg_disp_3p3>;
+		enable-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_disp_3p3>;
+		backlight = <&backlight>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A - odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B - even pixels */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				sn65dsi84_out_a: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&tlmm {
+	bklt_pwm_default: bklt-pwm-default-state {
+		pins = "gpio59";
+		function = "gcc_gp";
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+	data-lanes = <0 1 2 3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index eeb8e903b03b..e5c2ea9e1e07 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		i2c2 = &i2c2;
+		i2c5 = &i2c5;
 	};
 
 	dp0-connector {

-- 
2.55.0

