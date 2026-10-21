Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592582;
	b=YF9YSJ9nEdZTnjtIr8fDPTLezc4vz6HQ/BEKNrVqTm3OzpldMEjcQqmqdWk3sSrd7R1b
	 mg5gW1jMFnAZlrM2Uba3BtIUpNJK3TWWgpz3K3JrNQm4zJbhV21fahQbbRFEL3Kaym+0/
	 auZRs5AYCKr318tK7XE59SfJ8wtbGbR9m3Q32DHy12ds+PfzfOzolH9Iv8K/K9FDx1Fpu
	 x1BH01fS34jpBOSjzy/7CfrnIC78mbrEgTluvben86ZBArTnt1WevlqejMBrave6j1xc0
	 ERsuwKXLOlKrz3CGy+fBwsGnbDkSR2FvL/vBnq6RJxMVBMju+DpmcFaFsPLnnih3cmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=;
	b=mc4p47vzdafpr5ZCgX6DcVhEWw+ua0GRymUk1Nl2W1P3360PZrRQDO3Kaky38mx8VVku
	 s7nNCdfduAw1AXd0VW27qxPN65XCodX3q1zDIcU9k71AtPQ9UdZJ8qdCBNk0tD2O31NgU
	 5z/SufelZ21qLPO6GupnIFgwViGEjPGYiE2moP/l7KW+IE4Z9kdj3m1RFwxPOPlAW6n9E
	 oUBaHNqUdrTg6ZsNLJnvEkFh86ldsaVxbm9gi1UFOaBRCWCm3e5GjGG8R3236cgTEqiyB
	 QQEfbnRtQcq9Zj7A5zi9fVxCBCYyH6T+PaQzy0URYv5gSqzPpnj7aMWUcMhg1eLBo2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvGsiVpK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMnNeoX1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0867860A382F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0867860A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvGsiVpK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMnNeoX1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF6lK1389721
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=; b=UvGsiVpKDkcm10qz
	U4bRC9zRp05bOWOYEbTOs8DnVk0RSsBKSwZn05DT/AkZ8UADVuoUOJhKav12MgOq
	lfsZ98959ZLhgyOqm806rGvj/RGinHWiVqLqZ6sBaQdcAxkKoHwtrFHMz/Z+uuxO
	VuXYvH75KDK8/sK3tgsiiv+tHz+yeB9W63rw7iJWdBA8BJL8pdbVPdk90YR+VRzQ
	mY1/zTIu58nnWJK1Xr6ZhRp2pZPejlIOqqqBwmH9V/G9s1MsBrAoer89zlZunqqi
	jIoqmfcMZ9V37nALgs2zFSgg3Awp4WzE9rqJxP0HB3vhA1y99ShIKVjiJzDwnk5J
	lq8kTQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajmafu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:23:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c58d35c0aso111188eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592579; x=1793197379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=;
        b=VMnNeoX147TF6yIOdc237YK8E0xD4KxIHSJbEGptzyVHnliTEzSIICzfta8XIBqnmg
         SEgVjjypcRgi1yGq2qgnxom5vNNhHfw9c4iqhCn/Rn7Jlw7mV4iyYjon7vACMI20fn/s
         QxX7G74D2xeYknt2Ez+oJnUxQ2KXi+uqdKGfuYnTBlpL/jDqz9uSYSOk8rRtCiCuxJ1z
         tFaNY7XBBXV3RIwRaBXVyqnjTAVWrsJYIULCvKSV9EMue2zMkq7b+P0lVZHm/M0i4Il7
         ZDgtLDrtmTnyj2zrMsVSVnmT93GZD8847WydAAOkWZKm9ktIhAn8qADEKK8tgpuXRJob
         tS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592579; x=1793197379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=;
        b=guVZTtWWpP2srxWrbt2yYkfm1dHkv/jAE/EMXRHiIwu7M4L3JuHLsgH1ulONIz9oLZ
         +X8DX9IX76ncN/yms+7qfeJUKKDcYHBs+T4Fm/aC7y0XZIQSnpFjQOfzD0viMkOKgqE2
         4XzJdLcnNfPyWSxQbNCtdP1RYVKU1BuWFsAQWPtAz+cGtjldL7gF7SrkPTOubBsiYEah
         anWQT/O37OdZTTD/9KyN0VyMVeHLZqMltoxppKqSZkxuUQ1hw3CYFn0nUGss1nIv3JDR
         resXKSQwdsGM7c114LxavXQyckoqi7YFQBmM9PyFuJ5hE9sUE8PizEXC2YeaS1H9bphl
         gtHw==
X-Forwarded-Encrypted: i=1; AKwUvBytEgRv0MpCeFfFn3aTdLG8Dv6CDM2M4CtaunBENd+0oL13WzdItAwFxhHs4wYyFjipX+XApbF1++8L@vger.kernel.org
X-Gm-Message-State: AFq9FYJWsNCDK9PlO8pLz7CYUa0y8B/r7eTo0Q9oEojBIu0miHsyhiTe
	X6/6SjT69CeNKxGbmdOjrjRB6VUCzKSibLVSYCWwFXOTrl3a+2vSwooM6Uy9mkPbIENmHgR2Ni+
	H36RFt1SfK5qxlZnsHRBBft16AXnZ8iZuCevn7XdYALKvYuQyTXmgf5q6Wwy6/sYF
X-Gm-Gg: AYBFou0lOqlWOFwp4eJBVYn+t9js9IQEkcigRDo6tWP9gBCESVxj12H2LCxSkNvWkmx
	Ktv/SI8dgxhYjo5Sco4N76La1Ho8o128ToPmfReUfnb4zhrF7YGUIo7zrrRWvxtgGBy4Iq4YZwB
	ZPZvUpQhSYUETjKX8ZL/kssxgo+PfbU68JdFb8ltDT6ATd1BUPpHuaakWkdUEwUc50xaem73ebE
	+SI5+1ZEk1894bofyI+c9RRmQAUDsqbgnCSOGgk3iXjT4hTvjeKma+oocomHMn1NdstqfjKKSiB
	uXv3eczm7ZJKMR1iv6Q0iYg2J1Ae0Tifs1AbyQgZdYzmla6/kX9QE29ZJoBRV7/nEm23ue74Dvs
	xjYNKPChf9ohU3WeKA2DPD4vcfTuqXj0w3M3psAwGSRrtQdAclcrHWMfBwAxvllqZyAACHs2opS
	9a/nQ1GrEi364ruwfeLtnK9KRB+0myBFAZizA2C2W6ArfmiFiiL7Q=
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id 5a478bee46e88-3685522022emr645168eec.0.1792592578363;
        Wed, 21 Oct 2026 07:22:58 -0700 (PDT)
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id 5a478bee46e88-3685522022emr645109eec.0.1792592577677;
        Wed, 21 Oct 2026 07:22:57 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:57 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:50 +0530
Subject: [PATCH 7/7] arm64: dts: qcom: shikra-iqs-evk: Add Waveshare 8-inch
 DSI panel overlay
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
Message-Id: <20261021-shikra_display_overlays-v1-7-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3852;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=UtMVjHRombnci1ObQ7ST3ZaP9JWmZT8/3KRuats5gMA=;
 b=C6gZaY6cbD4x+C+mcjef+RVS4qVqqHkTqnGC6IOb/LFg2ed19PeZybw3NdlOh9qE9frNR0fDn
 20+NX8Q02+JDOX6QlaGXswMEKYWt4atEbMfIh1kXi/ljtid0ZtcWwTQ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX8/On90MOw6rm
 tyW0B85SYb1pEl5ICUv64ZQhgfY0A1ehE7+6ClBRCu9+G/h5FJkTKGB2JMXXlU3ZHqgN3wwtqqL
 +NFaJTLP9SNv9wdpo1IWoSb6txklute25h6xzDQdC6ECWztrTVmFcHF/FxKrPJZFdpGCwCe7L9C
 evv1M+vDg856w58lJstETk3rBx6keetLjH/BEkwc6HdJ10bU9z1YDjvFjEckcHE2QXD2NPG4hMx
 xYSJNVno+Ns5A3N+YhfrEux7dOVhx/nVD5gswUH1OxWS8LykW/eGhpBLmu4NNs4A55HO49vEv68
 TiXr3GYFEdGlW7jmnsB0Iiw9P0VkNtbHGTmM4GjDQeWY5+CbSNoJTWNES2q/OUHEKY8WvY2c9Hi
 ugZCOnJjWFwLSLccWjscdISTvCKGu9pT8kalS8CBTxpojef+DChHShjfxooWwF2fAtLNLG1x0oU
 SaadbppAfSH+nzFiePw==
X-Proofpoint-GUID: GV0W5jeA4ekXJvz5Z6PpK5QHhwNQGuh0
X-Proofpoint-ORIG-GUID: GV0W5jeA4ekXJvz5Z6PpK5QHhwNQGuh0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXy5acGaWqn22T
 Q7qYJN0yTcJX/yYKptlE9zl4t2y/GemyFrMHv0/Ay6gpztvocciQQ2O6Ef17uzg4EE7GNsaZOqo
 KZ2ipsZt4leYxaY9hldRFd0WRBE9+oI=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8cac4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qEeDTSk_RORxmtoI1doA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to DSI
22pin on the carrier card.
DSI0 from SOC is routed through MUX which can be selected by DIP switch
S1016.5 ON, for enabling this 22-pin JDISP1 DSI0 connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C4 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso   | 77 ++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6d64e7ce197e..2d25e3cc81f4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -383,12 +383,14 @@ shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
 shikra-iqs-evk-raspberrypi-dsi-7inch-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-raspberrypi-dsi-7inch.dtbo
+shikra-iqs-evk-waveshare-dsi-8inch-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-waveshare-dsi-8inch.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-waveshare-dsi-8inch.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..d0aa115681ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,77 @@
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
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK Waveshare 8inch DSI Panel";
+
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
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c4 {
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
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
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
+	remote-endpoint = <&panel_in>;
+};

-- 
2.34.1

