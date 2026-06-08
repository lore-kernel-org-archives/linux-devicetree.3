Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BFD3D9048
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929696; cv=none; b=mqo46zgwpLxsleqznlGLNN4xllujEzMIRQM/wmedPMFbmASADBnVfy9KMqA9H47YSOQJbY/5Mbet4g0gQVvlXa1Jp9kUAcmgAe1lrBgMf9Wl+GxU1pVoQhpwvhAzK64u7cU5MaQ0CAzIJftfrChMtgnXYLb0Zs3nQvpQnmwG7UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929696; c=relaxed/simple;
	bh=cMeUXQZYhaxl8CjW70xCdkk9iC5nfQTb1mViDk//cQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pc3EyMnivxoacf8WubPyCLpChE7Ua9LOoBkGYHaN5eMypOEWNNi2IZ5dXwpBmsUXEvD954ZYuah+YoxDJl3dpJNgZxveeTxivIEajrhPUpg2rDze2AQPLw2iLunKOXJAFAsmMFiyOuHulKR9Kt7tjd7sdS7SykF+9JqR7UVhqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PymzzjVE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PymzzjVE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b7866869so51233385e9.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929693; x=1781534493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWTK0vPDX9/u7hsXS3gp6N0x4YihiQ+Mlh3rTBzALqQ=;
        b=PymzzjVEDIeVcIcaSQE2pGX9bdHEGNli9+YMflw+QfjMkc3hRrS/T1xhJxhuXxGTP5
         B88beS+5gInC1qW6jxp9dZ4wCOlKTf5HOaG97zU5D9hzQySRE0heMiXU7GRD3bh3u6ux
         CyAHBrVfV49+Xh9V0njU9WhGbgXoahV8yc84PmwOOBJy+PQw67JMesr9+eGl67EFMaS2
         HOX0laXQQWZFAlimxYNC6w3Rt/9PW/wYZgFLP/19WEHfzi+k3tTK34gkFEMs75kmqqek
         jtrUzffBH8/LTfFJ50sOi7il6ZthbPHzpsfhNJ5Qem1f6SqZIpgte9anlMytirxsXncA
         kfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929693; x=1781534493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pWTK0vPDX9/u7hsXS3gp6N0x4YihiQ+Mlh3rTBzALqQ=;
        b=b+oMs1lFo3uXU6rcGyndWr2y4pt7w8ndoJZqjMBBwLc//uQzAxP4DWsOnDSQHgqYQ+
         ZwalJh68V0jzoW9VRF8UZWSgIpYXv84CwxYiVIYoVyKGZ3/3slrr68Z1LvKvL4xRY8Rr
         p7BbaAwX3s5zxcNcqcn2OAVrrzWjIfNeYocAtYEMq2M3qV2l41gW7OFEDJJsDdBmyKIK
         pRDTbmKPssZ2da+v1BH9/o+LujRXrA2djU4LGoTmZyyUh8XPJhbehlA3OrPwZ8SwlNqi
         3t8dGjSoRWakjqGNsOD7oTCG+PDs9HwiYDzfPRRUKuAddGriU+8rRoIadlTK9ReChaq4
         RmeA==
X-Forwarded-Encrypted: i=1; AFNElJ+swkpGpLAD/hD7trprQ/6iBpWpDO7mkb3q/KV6e3/NK3oDjjD824QRlKPnneHL1P8Z6FsxMEVtMYVr@vger.kernel.org
X-Gm-Message-State: AOJu0YyUxJBNrByFEljwJ0R2t5svKRnYyX4oPhnzxRuNMIipHT3g7Hj1
	0pAFtgVwOIYgOf7O2LvGJyx4PRxbRmoLjNwdAOoeLoqUgPKBJDQ0IbbF
X-Gm-Gg: Acq92OHQ223lYrPkj/ydiLa6zDk/XAiY0cE1OV7JXX0KayHGwjqYoz6oiIKY7bDvRVm
	vNC/vK9BV60Z4+NIzKGhNJL99CTqwFyTSB6Cp277Yxqn03MiZqUnEAWr7dF6wVl7sytxB5wwpUO
	HJFyP1QQDtVJHP2vd+irr9RmYkQbpdwSm/6G7UZzo/3CzZPk+VJA+BQq8hKoc3WSzkTpTNQjDnT
	t3xuHzwUT4ncvnmEvEIkhA+ZNh8qTMzxcrS0Ig4zKHkEwwD9SHReIv+zFLgRR2TW11pdWCBhPGn
	sEJXtKXLurCRrmEuVR3L0mR9q16LdS6qTq+RECNVFt5hScUDoDR2fK1VQtGSLkJxIv8TZeSzb56
	Hi2u58T3UIEwaSLIR1/0CiOnx2TAkNkWOaSD4a2rDgHeTbpMQvNdYIvfR57UdASx7VFvvjS925Q
	0BpMHCTCxG6N5WFLHIQnvpUoukWssNxRPf0jA5SdjIBmQExS96uwwLPzWWM01tKuFfaq4gblh/D
	TwDhgPzE02/EXuY82d+A9cwG8nkdbQJNlxN7zyj060bi2Ha
X-Received: by 2002:a05:600d:6444:20b0:490:5466:8591 with SMTP id 5b1f17b1804b1-490c26e1acbmr190687155e9.12.1780929692574;
        Mon, 08 Jun 2026 07:41:32 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:32 -0700 (PDT)
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
Subject: [PATCH v5 09/14] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Mon,  8 Jun 2026 16:41:10 +0200
Message-ID: <77a60c287ec6df2915806f80024b3d13a7905198.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index f8a4b5b2e9fb..387bbe3454c3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -327,6 +334,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

