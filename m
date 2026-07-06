Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D043031F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330513; cv=none; b=VEKSz+M5kQ9S0vXq9aAZASyLddyCcV2EyOZLEi8WQCAnRwL9jFX5/CN/ugD9zef5Pk4KV6XEZQhPlDAjXcImMbIHgsacGVXPr9m/ykgl0rjT77A8jiRsMYFj/6IXb0x8xI/L44DJJ0Lq3Yk1UbcBgOsbTsYTErNQFZPOYrM7RMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330513; c=relaxed/simple;
	bh=Q4v5bfCa3zcVlX407NKJzOWwffez90vSERchrwCoa0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kW1kIa2Ht3gUQyVuC/qyL24Hw32Ucd+VsEVcrAf4/TvUdYHkSFNG+OCO0f27W0SXmAeC5bcxhBG5L5MqwMpL87CmXeAvYTwPex5aRr93K2gWdHoNeOWzBAk+4+LP/FOyuMrA1ZESxNlg5eS45lJmtebba593RNlBvBd/Tt+P2D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qo1TE5Kl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qo1TE5Kl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b27c7451so34209005e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330506; x=1783935306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XwcD1YM4S5mxZpb6HPRyUkQ1D1PQTfgU3TqWz44TsM=;
        b=Qo1TE5KlYt2wbqCv4MLMn3q8r/FQgoC324VtUbe7KfZxdNo8NzV/QtQSLc6Y9qTx/f
         JMqOxF/8RKAyiag1NgokI/UvNmQKy/KnRRvuJxT6LvIeAZ+Tals4pSrOtj+nou334SYM
         Skwj5znsRcbk4Ilolm38tEFr+h3LTUIIZEbB8fVrh7paf4Up+JxakEukPeEsp1Smrlps
         AaWYoHgslMXbR3e2DjIPUIGqkBXJFLR1jkEi3YE81BXrP01JzRnxwB/C8q68ERsEm7mr
         fFD0epGr5p5K5dKeqjeXhmWiiWq3Qo9x7HSquK+Zr1Fqx4Kj0jnGvqOJTpDjFR7HA7MI
         bliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330506; x=1783935306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XwcD1YM4S5mxZpb6HPRyUkQ1D1PQTfgU3TqWz44TsM=;
        b=ErGmqcjIzOkeGJ4rvZzCAVx/SpRCWO2T8ruPSHiF2DG3lqIdWNejVQ9H5pl+bAwCXu
         o6vmWBNzXXQVOBL2ykMXwJ0X+qCFDVWFgoFFyNPMCN3I+qqU2qAh7zdUoMEVDTG6w+Yj
         Fj+S/vkRiYo35CzLefteDrSo65Dj8jALnKuJklCpLNqoNS3USaSltG8Fmfs586c5+KQi
         GPKeuW+FNroR0aHeJPbb0Ge7xDS9DSQpBVYMqJWs/ZSTeBrttZBWrc7nxpD+v+cagnGw
         EXdlsK9QnBU3U0oIzMbNyYWoNLJa/xe0YThzAjMEwxMQ+M1Wd0Umwo6wrM/zDBjmcDHD
         TQvw==
X-Forwarded-Encrypted: i=1; AHgh+RqhUaOkbr8soy58S5QJB8u2o4sASMyTbx/SssAcVWaZ991af/ZrIr3QlOWB+P8jY/T7guxGFMMZ0wft@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4P/807NhbxsXGswq89m56nPmqe1XurZGrdOg0+uJDukZGeCom
	ZPHIsNKkns/lyFOMBajHOhox1Goba4cvz7BLuhwmg9jRQLvCOXv2jwWk
X-Gm-Gg: AfdE7cneQ0GBZwB61FXTgU1zqUeCKq9Wb1440qnRDpwX0ti1EkLJF+AJQ9950b9TOdO
	acSPzIeWZ5gTySMppPNjmqgmeeduW6xMUM4tKoMMOcaP/8JsGHRMTaHbdkDhJbtoK6Xr9Eg1bQH
	ml9m1dptEWPNl4ZNVCUcL+uk0pFRFIb1zppbFM16iLOx7lq/FC83jg3+7ckPE221NKo9QD7P7EV
	GlrP5UpF3nc2CyUjtbRAVOTGaBBJ4/Kn1CIfG2Hto44y2G2wm1PmzfRs/vJ2IzUSAroPcq7MBCf
	WJIyd4xIaYipeEQmKSygsyBrpD89PRT9mP0JenG9JPYQTI3UG2+UMYsqazyCNAipkQ3eg9kWq2u
	vRjRW5vvxe9TiFv1G0XQ6BZ+PSCmfSmktbVL7g7tBm33r63xW4fuYYypUhZaN1yBkXmFMSdp4Bs
	vJPpPCWV7okbmiYGKu5knITBZj8jf4Nht8SlrI5NErpjEyFb4PhEZ51q2emkJijbGTMLVZeEeaB
	A0yp2h38ksinMBqH81CH4RowQ==
X-Received: by 2002:a05:600c:37c3:b0:493:d3c5:6c32 with SMTP id 5b1f17b1804b1-493d4b50573mr74590875e9.6.1783330505673;
        Mon, 06 Jul 2026 02:35:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 13/15] arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
Date: Mon,  6 Jul 2026 11:34:43 +0200
Message-ID: <0b02e984925f48a2b22f46e21d7e237fa9558679.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index c98dca8e7889..ddd4651b35d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -168,6 +168,14 @@ pca6408: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

