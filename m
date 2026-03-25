Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5453C3D16F8
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439737; cv=none; b=FG1kUlmaBdfVvsBSHBg/HyKrzE1TsSUzcz0bBL6MrdN8V5bMC6cWnQ3PrYFGgQq+BAt02qWdpVD4A7oeEGJNw3n3jkjh4IRNKMv0+WiDmmskdoBlrS4siho9JoEUTGh534fJrcNJdfkUL6SqPLB9DcuZu84aiAScQmXd7vmdg/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439737; c=relaxed/simple;
	bh=tr97VAsx+STGWIgq9u0NL64qefYSNwCZv34gxQAE/Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZfCpWoFrmddP3AbIUqhOOWKysWzXCYCnNVYTHEvVZ/7xPtKT4/znlym6u8FieV8fbstCGmmBIN3KMnroeKHJb60J1MUwnF/J/c7fWZlEiVDznO9smAnIhoI6pBVoAojrqFcheQYeCeF7IiCHG8KiGVQ6mHmkPJT2gAm3lwx4cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ne8Wmpnb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ne8Wmpnb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso53847335e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774439734; x=1775044534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdN9cflUTNRosGOiuG2K4soHcCdEwWx9Mv6NnPQ9sVM=;
        b=ne8WmpnbzA89lPRSREHituZNihCs1MXg7/VAMnz3yEfTzm4dYQhRqkmCNhVOfzsJTV
         C/FNGT9CqZnqWxKVSCi+IDHPM5ZentOwRasPsRCxCfWYwMcHTbsHZnkyolVhsAgz7Dbu
         3Pz1/hgiXgH97cmKZBno8D4pGNmzznFLeWESiNtWKQFe7ZTEgHA+XhMYEiwGKbF9m0Fv
         rsLZtx3fdK1Dfp9OlxOqjDvwL585WcFzehOa3GHCybRoUpL2jsQL93ttyL4RnSKOXN4s
         C4pSr/WIiXC4qr6D3PJTrRNrBTJcY5/OXXw/QUZhc4jl9Q+jUIKlc7KuO4vxwKObvivT
         WpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439734; x=1775044534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jdN9cflUTNRosGOiuG2K4soHcCdEwWx9Mv6NnPQ9sVM=;
        b=iWKQ25PW97437/iDsbXbL3Fb/xAHM8yeqChIttBfyS49J++6vzkayyBnMuLmJf9CFw
         wlTOL2pELSi4lp3QsACMGwxDFcShwoU20GGYRjHiiIqJav0yiphfTmWLnAQctESI3c7+
         14dqWRDkN4oPoutthMn+BRT/hy8xNr+Rd2YyCGdPk7jAq98QpfZYHXmkfCMpv8LVsisD
         P7hgnIH1gSZ5Pe4goBxR6t9cMhoFw8xJIoZg37Or+0uIBcSLNODeNub1NjJP33GDklvU
         40pZKWKBGY85M+7mEqSNzhqvBPlfbqOkJMmA5Mp2oApyqUmtzdqMiWralzz9o/E3VrJq
         e4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUSMwgpZxZjK9jDC0jgd6izJgCUDRm/DiIi5TyPNYe6QlvLxNo2yjJ38+U9aBvrB8KeM3GgHG7ZaVkX@vger.kernel.org
X-Gm-Message-State: AOJu0YwR0eajWFfLIwXWokaYSpqnd2SEQyvNgwGClFClYGa12nElHh67
	8mcMbTqHDmmNuiOimiahjLqbQRhDGkIm4li3Qq6/LhErLyzWUxh6J1h0eQHWN4FO
X-Gm-Gg: ATEYQzxufv2o1V9OKXir1mZiqDhP49jxe1ATus03hufAImNsHCp1vBlBwlkGCJHUric
	fhe/c0TFXBVUU8oNioqeD+KzQw5QDHxBOLzkDwh6GNyEfUC+mnF77Z8KgT64gCOAsLwjzPxZ8eD
	9ujo5rqc3/57Kh0WC7YfYP6EEnwUhb31Y1DuaAEZDA5v4UoQ5MRSq140eR2Am1od+ud4Zy6Avqa
	UX6fcugFnELgasnxBbKQRcDFtllhoF3ZHjIlPYrCaqHS3H3MVZP+NQrDxD5E7UsK9kyR5K0oUIZ
	X66L0rhq7mHzJKzPNVUbKhchmV7PpN7UYtFTwRSZ821BY37xSaH7XXQ5sMZ07qrh8xrI1tv+2oO
	9LQpQG4BjPQzo1mbbBsOXLHzpBnqm/5Ux0vyJ/gcPEitd6vAbwfy2E90yuWI086dzArybxQ4tMl
	9ibgpNZ44bKy5nM5mMc4cTwmaFSE0rXg18q9C4wUndV88xYxnfrdjH1Z/JlwjDoCmBIFSgRaj0U
	pyVarw7yF3U7zQ5YW3fAhFEOcIsRMMp+tm97A6YBk6GB08TNq90lkxZBIvCMZxtIZgmpZY0A2eP
	cpZrxKaNd6e/fh/MmnZ4
X-Received: by 2002:a05:600c:3b12:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-48715fc3286mr51267335e9.1.1774439733479;
        Wed, 25 Mar 2026 04:55:33 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c44bfsm147878035e9.9.2026.03.25.04.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:55:32 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH 3/3] arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN
Date: Wed, 25 Mar 2026 12:55:11 +0100
Message-ID: <20260325115513.707914-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Franz Schnyder <franz.schnyder@toradex.com>

On the Toradex SMARC iMX95, the WiFi UART signals are shared with the
JTAG. The WIFI_UART_EN signal is used to select between these
two functions.

Configure the signal as gpio-hog and drive it high to select the UART
function by default. Add a label to override the hog in derived
device trees.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a90edefc5197..29e3f5bf867b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -451,6 +451,13 @@ som_gpio_expander_1: gpio@21 {
 			"",
 			"",
 			"SMARC_SDIO_WP";
+
+		wifi_uart_en: wifi-uart-en-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_HIGH>;
+			line-name = "WIFI_UART_EN";
+			output-high;
+		};
 	};
 
 	embedded-controller@28 {
-- 
2.43.0

