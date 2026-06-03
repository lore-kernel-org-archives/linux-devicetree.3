Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3848648C3E2
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497462; cv=none; b=tmL60PyAHK5w39KAwnKAqp1EUrZnh3PTDxYwvgW2e2Su5JKLuAoeoH1xxoTzNnxn8ab5lm1xR0N5ZPow6WmBtt+Y7DeM3uXDnTxMn9vvJUBR2UIZjLdt1IB07qRHhLaq7AFsGLQ/zqm9KrVqy2Y6MS5+mr16uB4YGaHxJCmAqBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497462; c=relaxed/simple;
	bh=gRX9YWvTLqFGNIkTB28dou3D98Jv5aCkUXjaYJYXU+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOmmtcKyShFyA0WsYjUG1E0NE+8JQFi7f7/cag+UKNDALYkxGEFAdR43tBz/7zcOM0jx84jXgB9hH6Koh8g4/hD6IuYTop4zPw08zCztWupNrNcaaS28tPGc/Tn8PlPBVDGPUOcp8czP0sL3BesLVMwc+A+QqABT3y1y58CUKuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YF+vqBA+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YF+vqBA+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so129348605e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497460; x=1781102260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3i7F1X9p+/0lWqZkki+er1i0WQJXJNWk+O9bJqudV0Q=;
        b=YF+vqBA+HfUZADtCQ5acdqqKE+U1BGQzQBHYHXaEeVjhUioJMkp+6L8WLUaI63kFlQ
         +sZ5qjoM+aZult99k16iczxzuM6z7jw590Pkss6QFUcoSQworV+TtLZ8vtizbkPw+Ak6
         bZ5xYvbdO9MhGOUzbJkiwX5sl2q1N4OwepCUAUOU6WLATchOLiq08WwN2dgmA4VlAwbB
         FfQfRiFKnRl7u3D8LG070+QKrEjl/s5vaIZ54wUjAITCDfCX+hprKbyGclr/OxGkfBHh
         QJ8UCc7z1ZonlyUPgL86i/KY/IJLkEfwk1JUmA3hXhTS0Sg+MNpPTuB+KtXm09GX8yj1
         OTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497460; x=1781102260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3i7F1X9p+/0lWqZkki+er1i0WQJXJNWk+O9bJqudV0Q=;
        b=KPLK82LOwm9D1reYPNasNsAY89I5BAAu8W7biZsU+HasZR1VMF+PTE1lh4VBhD64wC
         WEiS70loOAxCJw3/mv8lKqGFtl9Ecrcy8Wj4BUQ9VQG9rLA2/+6Co1REAOIt05Qei1Y8
         QHRys/2DX3A2b7OqeTFlIEkqPFcKZtTc51GPSXPYsL6v5ylvX9pbmLNJvE4vU5LKPBDK
         dHZ72w4ds+gGmjfhR6DdnLiUedc+bY/EFlrDXDhgqpCTXb91pBZIqnJev6pkmI6kkXTV
         bJlBd+L+bNu7ln4iE1MbbH80qFZ6oocnJumPCHP8mrmX7koap2e124mkzGRhY5ANZO76
         KzlA==
X-Forwarded-Encrypted: i=1; AFNElJ/sLj/QyqTJU2btLKw7KoDYS9GqfLhRORtZo7/qFNpvI3JsoAiUqGw8RZr1zYnwuJELecQd2DuVkEBW@vger.kernel.org
X-Gm-Message-State: AOJu0YyTUx+SEoeyzPlyCyt6AE43S9Xk1vSJHPNEJF/443qAh4sfBduk
	sC1ViFQ8ZlQYlNcCvo8nROkpc6HEubR8OOoottKQOoakeKKbLY/zvRItKyiSig==
X-Gm-Gg: Acq92OH9NX9+zpTdoZbfdVHLgeRsC9F1cPt/+vlfswptLPwGN3BL9pjvqdBkxNEZNDV
	hSV4c+hUp0oTOjTOqs8QlIeETvBRTLry5Rd68SLLprVTrawYN7O3Bp6F1af/itBO+ccVAovY01y
	VrpbA2yC84Vy3PXGjRY4gGgnnQFjOlycb/2ffoDzZNFTDuTRuwV4RVLgIDS/fZZAGI3zp9OjsiQ
	hNugpFpDsUOdFWovF6DoILAZZKg952Jklw4bJ0rOijm+tiBE8Fd1TOms5zgspbea7KS8koNF2Mp
	RN5bMD9a364ahP6c+I3cEjOIJT3jtTtbNqwhN3fzuybl57lup+yCKSa8MfqRDyQAG6qU+TbuQub
	wJZIiDCYizcKucJjucEJbWeR+LBcYPOTn6hsz+zzDn3vfL8IyrziBpb8FfrFyZeNkRk//e2T73/
	v9T2G5J6DGxX9AQvsT3yCLYFwt5uEzZLueU4rUQgxtRQfsBnCYuCXVh74xIT5Ja9UjmVrI5T4bJ
	DKNSz7KitA9Oem+Qm+yWmdR5oPk1peK4mdWqt7EQPpmAC0fEyul7/wsSIM=
X-Received: by 2002:a05:600c:871a:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-490b5d3fd8amr66017905e9.12.1780497459695;
        Wed, 03 Jun 2026 07:37:39 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:39 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 12/14] arm64: dts: imx8mp-var-som-symphony: enable CAN
Date: Wed,  3 Jun 2026 16:37:19 +0200
Message-ID: <164f8be4e0c1260130c024a47739de6cc96f94c8.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the FlexCAN2 controller on the Symphony carrier board and add the
corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Add FlexCAN2 controller support

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 28424c2405cf..6b2aaf6bae07 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -106,6 +106,12 @@ &ecspi2 {
 	status = "okay";
 };
 
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -357,6 +363,13 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
+			MX8MP_IOMUXC_UART3_TXD__CAN2_RX					0x154
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

