Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91693B8BDA
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913380; cv=none; b=hAeQFiUIKOXk/y4BNZpZB3G7lOnopwvCpxJI7E36AbqssQt+chKRXjkGINZb3ts+OrLOAwNk3wyNqiY1Ry2o2MbMUVZj9kbKv3kTtnW9uFyFavA+IudQ2EFQvacnVGOh1DChx8kwfSQhAN6B6i8tbS8YKDt9W4PQJbeZD5oZlzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913380; c=relaxed/simple;
	bh=dXrFtWZiquTbNHiSJWN4gwWuKVrE5L4OMb/ZitvMUxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPfc1MhvzNks75C3wkPLATt0QsvJvcs7ke3rRfcue4y2ibsT47ROiE8KqcAr0DzYcg8DHMLASGwFZafbhSbdICBENPV59LSKCNLEJtBbIo3tD+z0oOyKX9hpoeiEWGfUDuoPUAcieAVqnz/YXptjfCcu1W0OBB5OxO7w2O7iVpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQFK3V6R; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQFK3V6R"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso33496515e9.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913377; x=1781518177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXwjXcSk5MvZ7BwLfwPes/qcxy57EKErAjh+J+ytqQ8=;
        b=DQFK3V6RsElF5lUULwuXJXpmriZMhvgIbs2VdfF38DTW52H4CUNwr+SgL8ZAL+rWcg
         ykcWga0f3ySqdYP5QxuNDfm+xCbbVmtTtjCI959E1zsxLfeXsCoQGFK4qjLzPa1sg6+3
         A+kTWi4q9nO05Tdumzx22RTa2NkOnJyHuAyGbny6iY1lHu3/P0WntH0W7vQxVQPQW3jC
         l93xkLM/Wvej4YQ14hDKjeLXvcK0JDM1D+mIE4s01Th9BVZ9pDcfYJT7jdLbGtoNtDHz
         KeGozqaFrwxS/7nDtMTXMIQY6NBPWFOo9rYBrmbapEzFwhfLsDpmluHBvKpnCSUM8DQC
         J6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913377; x=1781518177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXwjXcSk5MvZ7BwLfwPes/qcxy57EKErAjh+J+ytqQ8=;
        b=kUZYvp26BaUugsknEzgEJh2piHF3Y352Ffp7Wb7FtALEMJRIf8Ym7gw7EA62sf0N7o
         +dHCo/gmIAkwpL8u6u/84NyNij+Jku88N9cOWx9PXn9Ls6xz9GuATc+j0U36XYzBZtpj
         uOudGpTGAv0a//VqGG8icdzzXy9seNmA5PPcMfqMKeykvttsmBztmn3/DF0W3V7QPfcj
         tP1ExZY2OLBw8TPyu8EJQOXhvPv3/sMMeLmbEQZ0HIHNldtEormu3G1JSQZ2iyTA57M8
         3DTQYTLx5Kp+8MtUM3Fr0sR1fDrhPtHZSPcheHWQQXG1q6H2imdB3CpwlF6pWxBvhyFX
         7rtw==
X-Forwarded-Encrypted: i=1; AFNElJ8GiSPfk7IzxynJn/T/DfyWUPn3B8fzRx7ACy8GBb4hBugHZdmGRUpsv8XTNURbgB7XkZD/ABFeA1qJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyJHeUdWL/jkErJL4O8HUL6t4yM1A7zOwKKu6cQYJDCLw2d00ER
	AswjdnxjTCAbaPqXI5VDgCBZ4BDyG1bzseUB4Zm1FS6Fn7coImrfzab7
X-Gm-Gg: Acq92OEkntKsN5MNOvkmgAHAOX0Amzda1jn5QliUfdUmL5YGy2flH+0Y+EM2RU36dev
	cIcIviTmkXXDK2ZobYhW9mOYCzC4+Gwry3Q9SAd8Px+/UTT5wI135PB2ehIgrKlsy3UCTgWVXgM
	sE+e11NyXbSIaa9qP3BzSy75Hp+IIlYnClnyOj/Z+dOemuKYw5gi7egOlmr/jz5//GUhelto/uG
	8UaZo4gSdraw0bGuc+RSsB+f1kjgfpyX7SwvVQjixSa27asidGIVoEielMS6Oszs6SDg+vMMQLV
	WIjLvS37nN1mzHV1lnF99o2L6CQQgCMDOOG9aVHmDHlcAVj71pj36t23C7awWQOi5PH3FzdmF2F
	HbKCKb5nDkPTZ4aglP6JZo+tt6tIyw2RrVVT6eXf+JilJX4otlV1En+473Pwvmlp+XWvlU2cX9X
	sFzG4MmoUGdDWNEF4wMmWCjAtEnShcAKuX/crZmmu/kJkGxjdf/dYJlU/F/ty7O5KxjjSEDAM1i
	OPUUq+868soiclxNGGePEQf4b4uVILXu0rL7OHF8wivNQq1
X-Received: by 2002:a05:600c:1c29:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490c2ceb6f6mr220547035e9.8.1780913377253;
        Mon, 08 Jun 2026 03:09:37 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:36 -0700 (PDT)
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
Subject: [PATCH v4 01/14] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Mon,  8 Jun 2026 12:09:19 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

