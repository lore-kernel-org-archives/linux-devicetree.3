Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628C2423146
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475113; cv=none; b=FzQwpAjRdTdi3giFpCg+Y3qsFoCW1Ps1jVJsSt645PganF6eQxPdaSFSDKrqt2PwsFhoNYXRRZHhzE3F9G6HQSVZjYGISkH+WRUgzmQPUacXEztwnXHLuReZk7z3g8WOadi8RZWRCw0uuKido625mX8sOVy+lbuYkCmUVY3sgZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475113; c=relaxed/simple;
	bh=LZNgjFG9EBOVSjjHWPD7UZZD7Fr0Nzu8jQlkaEa1S00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9+ajI/TrYuDk35NHz8W4ZwFOpw7NkIHI0sod7sr0Ap1gC3g9ZIwK/xWiVWqbkJUnRNOsw0Di/AUpyRCJtP5zI9ddQDF3a4kBPW2YtDBO2dRp3vX3NLRqkKHYG7VJah8PedcOEXVW5TNiWMlRxhvfTA/XIYsneovapCYQrSqzcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWfv/gUt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWfv/gUt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so125033795e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475111; x=1781079911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0tFFJBB/axW0BcqywiPixOQX9mP9lGcY4jX95Arkc0=;
        b=FWfv/gUtKMnRDTqM82hd+axKqY/nt5L0hSb8nCDd/wXjA4f/JV4ecKijYEUh1kAgz6
         K+xVVVLdC/cy6TdYvvxjUdEtHWNf3CaK6CvjbScypARLFahIreL6CqODuaK+B0SokylV
         YtrTcKFoyYzUpMOkhcAPnXJz4myfuhuq/Rw5FjI1y8s+4HXiOe2UneCXxrlrmn7FRmjc
         1WIxQNuK6GN+vnW/tbKFV8/K9FOieguNQIbnJt7Iezx5bHO/i90UEvVzSdyRUOW2O5Yx
         dvXYt4xp6zmk+nfk3okvR+I3wsMghFJHGJtWkLFaczk2/pX0CjriKYBceATjTDnWohI3
         ytxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475111; x=1781079911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0tFFJBB/axW0BcqywiPixOQX9mP9lGcY4jX95Arkc0=;
        b=iuiRp5ivDCK44WIyDF6LNs2VTb8kt8JtyrJiK6d4WDU9baD0Pr2pw4qQrlA15SpMhO
         C9aC+RL/LKRd6vjkwus/CygbuTZyLVP3lCCyLl1UedHxHf4D2bTSKhElL+3SZ3NwUd2n
         82q/bLIGpObQky8w0Sg5KffSGUC6AHUOx1VB8cvg13NBiN7uzdGJZpidB06t6jJ6Kkln
         B58/McxAESwb5VBoLNzakRZCykRY8yeggxEvO438wf7DTIKzmelU2QsGfzJNsZDf0lXS
         lW2Ekr9fKY0t+8U+4JqJe5d1xZUZ7rXyGBIDlMnw96hIjt3BceGEwyffzRVcOy0duXNg
         CHwg==
X-Forwarded-Encrypted: i=1; AFNElJ/9tOVNhxSGi3A5IpIkRux2vlBgzQv0ACSuQo3hLhupN5jzyVMpP8jwh+WT6DUWcLJQzVe/nPUVu0g4@vger.kernel.org
X-Gm-Message-State: AOJu0YymzKNflcvZhB9MKi0j4ugY8BH7OiSFulcck/FqjUUR0YRCgx6T
	Qi0gLvgOXbeYEeEzjS8cDr3qZMaqMtcEIWfLXm+FcrEyNmJGJ0Ac+4An
X-Gm-Gg: Acq92OGCcnY1AeJTbyeVIU3aU+YFoMV/JQwcQ0a4ac7XH6syJ722TsnCzFbPXhJKwNo
	p2S2d2zQAj6CNCUiQux7snlE0DqSkFh1anPxJXTCvk3gQ+ZEzkw5zFD7704F1sxBSURsrCZgfNP
	oZ+swX5IsX2fYL/oOKWuzbZppg5dL61JGw6EydeiQWAARR7RozHuhpU/RsD3S5r//eGbn/EvIed
	P21O99y/bttjQg7eVUxXV4jcT3mrpBqyEfMonMozevZU5l5N6+P0ZoF5Yh3+px72tmruwEYZocO
	v+Z6J5bVFTpG2QLstDytxrVrH4KGfb8ApzyDV1Dzz32CbyWcgufE7K7QatN4s711jZqTC7t/jq7
	b7dUibR9eRe9vnbcSm+Skrd0o8FKPY41hmFRrsT9HZLvcjsVbSqzoe0sDCIQhLgG+G8Ymi/MMrL
	bKp0B3EiBM7Qx8bXqJ4TN7LCuT950lZHI6zKDIX1GWvrYGh/6pvp+PUOFvbpBmOLDNC4r+yDi1/
	Irk2k9aTy7x8enYmuVtFQPDsPPwfmycpp3ruYsnUfoU6wXY
X-Received: by 2002:a05:600c:c174:b0:490:b258:3576 with SMTP id 5b1f17b1804b1-490b5d1cf1bmr38390695e9.7.1780475110617;
        Wed, 03 Jun 2026 01:25:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:10 -0700 (PDT)
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
Subject: [PATCH v3 4/5] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
Date: Wed,  3 Jun 2026 10:25:03 +0200
Message-ID: <39bfb7ce8a40d041f2f23344eadeb641a1cf9275.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable TPM3 on the Symphony carrier board and add the pinctrl states for
the PWM output and sleep configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx93-var-som-symphony.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c835394468ef..56f8744c861a 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -320,6 +320,13 @@ &lpuart7 {
 	status = "okay";
 };
 
+&tpm3 {
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-1 = <&pinctrl_tpm3_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -442,6 +449,18 @@ MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
 		>;
 	};
 
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__TPM3_CH3			0x51e
+		>;
+	};
+
+	pinctrl_tpm3_sleep: tpm3sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__GPIO2_IO24			0x51e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-- 
2.47.3

