Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769420;
	b=ySQG/5cxuOhd7LECGtYA6n0zl7ikdLNdFcf5ZswqaqMvh3jfO7x+Qh9+zvVypRHIRSJT
	 MbCTp1AjJEQrMb3Ywvtw3P4B2gY1WBW70qkDmBZGkEFmDumUwoGxkRH/bmnTvm0auV92c
	 J1wZfofzwf4Wa8GKPImLQhS/eQcPLeZA8FATiB+EV+kETIKae5nNhErdLe9jgOrJrjiNI
	 DER8e6FTKh/KMfZT1eIplrylWDYo4asDzFUL5ALevQX6Ve93iV0K+2jr3rvLHytLXC2G9
	 CRmqz21X3FxvBDEwlm+dVG+O237SsBBxOkQuz84EA8fL7vndSYzxXQsil6NK1YuhEhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HLfKmdXkOrxHqp3BSoOqfQOqkIGmy3ntNb8sAp8+qZw=;
	b=xYkEJPFW2Fv0VIOfZDKUA38iEi3j/Utlftldv0NfOq1t36Yacdo1l6v6DC2n2pM1WofO
	 CVXiqiTD7Sjww6S5tB+tBOXiL3IgiwFe1dxwMVjPzZgPR9zNY6PpO3KjDiwv8d+YlpQCV
	 cFb7CCWvPLlkINPavX+L2BJekU26eRexdkghenOIMuFYCpOO35z0UUzQWOT/7x5ZIQ2Jf
	 GE7m9sh/FFfuVWCWleTAO4AuwhP5TBsIbstGpKhr2MMOyoKWYwxd4XePMdb8ZaoBFCeh3
	 NeQ2oUbRFsq7XCEb/GGcpnhbLoy+tRJUAN/F+GTlMmRR3bsYftct7zgQgXEFRvdL0Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="K/OMN+fo";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=br4LJa5V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D030606A329
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D030606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K/OMN+fo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=br4LJa5V
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GeJI1475112
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HLfKmdXkOrxHqp3BSoOqfQOqkIGmy3ntNb8sAp8+qZw=; b=K/OMN+fo24vlwuHO
	uUTqUuHY2KVonk/t8UU1k4Hpmq4rdPvR5sWR67FN0MlXudC9WpVaWefB3482dGu3
	gozvJU9+YFI+8q2gKZeXyVQO0rPvv1YOpeEabXvd3ER3TAe551MhTwowH0Tqxo1L
	fUkrClWwQUnrGP0KnLe3VhWgq59E3yoDRIl1sKltBxXR5n2E7znaNj/5a9zIxNWR
	FGFPiUOuo6G2090C583cfi71JLpjQsMR71vzACzwSJeS8LVYTebgNRghK2ke2yn1
	biv589emSy8W2M4+IfrlBkYYQlzJaYkGgGIB25fjmBovsqlRQocFK8qBrQBDpC/i
	UcKduQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4ht5dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:50:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd750de6e8eso284365a12.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769419; x=1796374219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLfKmdXkOrxHqp3BSoOqfQOqkIGmy3ntNb8sAp8+qZw=;
        b=br4LJa5VnASKE6sOi2OYu7dqwvibAum62drBSGOf79sNMpULKNU3VOV750t4HwUx3K
         4ddLXWGzL4nrbsc5bNc/VQEBIIHMrpsjIEaiVDtbI3x2BQCEL2RZnlEGirTb7kop3ftC
         GgHw4fgz0RMI59J4b1T9auyoarKra6lBr/y0yPgUB+WjgSyD0orz5DLEZdm0mP2c6xNX
         sgA6WFwGQ7da373K/5kSrN/nxpG4MUnuQvoAmSfZUG10c4YjaziPl3uT47if9YdHCuVW
         TXeBixl5tys8Ipm3ncuEIYaWFGfBzdly5dBNJQIoNBWQYubyzUNcRIVKbso62xR5MPC6
         OwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769419; x=1796374219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLfKmdXkOrxHqp3BSoOqfQOqkIGmy3ntNb8sAp8+qZw=;
        b=C46vv4XWTEvHRQhCHStNR/v2/QKnN6jJG2FC7JvZ5kCkwXfNScD0WbsVMPGQYPwRp2
         jiUhP9oAvr7ILaWIbCBzmzCaqNQcwgJFhASVh0GhqXQHZfH4fgWlq+uJPSiTGrhHSWC3
         MFPLwNnlMJEGyRw/WTGuILgB8HZYWPe7KVOeulkuIVIc/RfbgeTBwXZbZeZsFb2ISU3/
         op7Zn+3GYkxKiHunacbEk2pUuqjcX3mPCDk6A7gA6fJlfDaxGkWnoZ6yVBD+zstt6s4B
         StA3V8nooRaIppcyY9KVY9JdF2Z/+kET4a5Gl4uct8198ZjQptdL9KEVJSWZceuIIMaY
         D3eg==
X-Forwarded-Encrypted: i=1; AL+hErELDlXMWFa6WxloaWH0pIinOrBKUUDTAW/RXUIYCiMTsI6t0D8ptiyNMZrJwb4vsoJkmx6l4QAvK4Z3@vger.kernel.org
X-Gm-Message-State: APuU4Z9tQZduK+GYXwgHUF4G8TOM9X5W4agXvsfhoQYX73ZTXrB4vWrX
	jXvEb2pgZCSjby6To+MSVRLeVZoy6IZiz3DQ+reeFmCs7NWqFOUTawi/nvWXOcVhamfb0IDspFq
	9Cf5Seuq2HHEr0LaNru1EAxAl5GMWyBRnSC6hCDdo88/s5GuWXx/LC6x2SCnsnNyI
X-Gm-Gg: AZFdTZdpqc3OngR9Bqn+2WisKphO9U0TmlezraN0DMV6ek5dI47TvxSzTp6GCPNB64p
	GuJP0ueMmX/pjFHDHl8USrA3Q3B5rpMnr5fx45/r6wM7YAThmMBz29LeMywFBHEV+xcck0wNcyD
	R/u5BXXfzWrU722IEcuCcDBdbU9gHnAjbl8ltw6LrC7hgKJB/EKf872yFH7Ms5z3l4J7RU1bUi7
	jE8JMlcSjeojK0XD/8t59PzPW+DvnR5eJMmLhVfmE44oM302uHTGjN6mZo3xjQ7idJTpCVhijKM
	h7LfzgHFlLyOBIAlJSITumfXHLpRmQVdUsOJGtV3YKKJDU8yxjr7sxBdk5r2+FtG6H7AG1Rretk
	MKwe6iGsYsiTFEPW5KPN5LI0alGBIhdg/HLfBYsLBhh/0tUCTsaXfvf40SILGwI4D2q/wn+VIbX
	IQUb1qcmKVUsuX/MaFHVfo2322VrX78UChkhNCkavj3Hes+dfFNYBMbjLAiR6h7O7maYINBcdZd
	51JE4g6NcOb0b8YVJ2f8i7di6/tIA==
X-Received: by 2002:a17:903:4586:b0:2f0:3cbf:743d with SMTP id d9443c01a7336-2f03f16db29mr372607125ad.4.1795769418664;
        Fri, 27 Nov 2026 00:50:18 -0800 (PST)
X-Received: by 2002:a17:903:4586:b0:2f0:3cbf:743d with SMTP id d9443c01a7336-2f03f16db29mr372606715ad.4.1795769418150;
        Fri, 27 Nov 2026 00:50:18 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:50:17 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:29 +0530
Subject: [PATCH 7/7] arm64: dts: qcom: eliza-evk: Add Waveshare 8-inch DSI0
 overlay
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
Message-Id: <20261127-eliza_disp_all-v1-7-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=4338;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=SwOJkD5k51eMYdmiVGocyS7PkkS4YfIBvna4bjROP+0=;
 b=6aUHcSgSuJ2hsUNECxOSGw9D8wbA1xO5InaER3fUVpnz2ElDvR4FtbWwfJoz1A0wEkWGaAzOS
 hw6jGgbFBEZD47RBYAd4aEdKwqb7hTNXY1QeHY0BmWkh+d5e4f12svL
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX1hkKamtSDtTz
 v6Jt8NA5CwuHDByjmBN/k6YLTG07H8E+lhGNra6ZYIzywsLAE+X2Lv264qQntDjWEPX0Xx3ZuSq
 8vpTcGpu+zI+1ud2XuE8QOsZ+lghCUQ=
X-Proofpoint-GUID: WO_UR6oPwO25Gt9iGoxsu1S3dGRVD5n2
X-Proofpoint-ORIG-GUID: WO_UR6oPwO25Gt9iGoxsu1S3dGRVD5n2
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09444b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TgV4GMnbXGDTyzeC6gUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX2VI7utu25jAe
 SzeopN0hQFxKZ7ltAv+zAaT0OsBHXfh2PeqA3KJONtwYkH02HG5oKsLEtIq9tfABI41Y6oTY2f5
 iThkyhYlhr1ckFyJctyGqTEpORPCOmvSVAJCHAJv/yK3KD12eDkdtbarodLzZijWGmrfS5PhnsZ
 hzTF9GLnxmwWr7Lq2Vd79kCX/px7LlG9qvgyh3vQOQi74SKwBzl+rFWidieu9p3YHz2HqrM1R9z
 n9bvzs6pqoUderjKZLgGKl4hWpb9I/FZa+/NVRkJxZ0cW+5b3CzTmgnuBdhBJr194rXPKHqUaam
 Z/h5RMTrlALFJNVLQpnoJ1Ma5GFDkvgqiZQGq6/sq+EywQhfGlu1VfCOwaAfiqFgMTYxaV2Qbhu
 E7WZStFgIaoFo5dRTVGLPS82F2CQul2rem9OP+uOuem62ocBzhdKqfSwGHfKKyT9mBUVnN6/SVt
 JSlBpol2AW2Gy2HmOyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Add a DT overlay for Qualcomm Eliza EVK to enable the Waveshare 8-inch
DSI touch panel on the DSI0 22-pin connector.

The overlay disables the default HDMI bridge path, routes DSI0 to the
panel and describes the Waveshare GPIO/backlight controller and Goodix
touch controller on I2C8.

The Waveshare DSI0 22-pin connector path expects SW3.5 to be on.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso   | 87 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 9183f7c608c2..1d84dc4d81da 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -17,13 +17,16 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
 eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-raspberrypi-dsi0-7inch.dtbo
+eliza-cqs-evk-emmc-waveshare-dsi0-8inch-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-waveshare-dsi0-8inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-waveshare-dsi0-8inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-raspberrypi-dsi0-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-waveshare-dsi0-8inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso
new file mode 100644
index 000000000000..1a61d28187fe
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso
@@ -0,0 +1,87 @@
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
+	reg_panel_avdd_dsi0: regulator-panel-avdd-dsi0 {
+		compatible = "regulator-fixed";
+		gpio = <&wsgpio_dsi0 0 GPIO_ACTIVE_HIGH>;
+		regulator-name = "panel-avdd-dsi0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+	};
+
+	reg_panel_iovcc_dsi0: regulator-panel-iovcc-dsi0 {
+		compatible = "regulator-fixed";
+		gpio = <&wsgpio_dsi0 4 GPIO_ACTIVE_HIGH>;
+		regulator-name = "panel-iovcc-dsi0";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+	};
+
+	reg_panel_vcc_dsi0: regulator-panel-vcc-dsi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc-dsi0";
+		gpios = <&wsgpio_dsi0 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_0_connector {
+	status = "disabled";
+};
+
+&i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio_dsi0: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen0@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio_dsi0 9 GPIO_ACTIVE_HIGH>;
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
+		backlight = <&wsgpio_dsi0>;
+		reset-gpios = <&wsgpio_dsi0 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&reg_panel_iovcc_dsi0>;
+		vdd-supply = <&reg_panel_avdd_dsi0>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+};

-- 
2.34.1

