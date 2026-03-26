Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED53FCB25
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535859; cv=none; b=nUt7Xy7syzMnkbfowhDPpro+MEa1BWvu0BpeMQ1ofK16Mz1rJXPnF/q5BsHlTtXnEcHEhA6rPzC8hNe6QWD4WlO2JEO4bbA0RJNNy0xVHqB9m4zJjAM4J8khOUkqU9AzPNX1HkLqr+tR5/6iNlTXw1Tu32vHofB+uJjm7iCMrtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535859; c=relaxed/simple;
	bh=F0duyRcsT8AH6l2yenI1qefeUWrcLVZCaJdSuM5TBZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSjNQ9JuFvprEXTByvDYTRMhXsF+QO4+nb+bPOEhPQ29W7KDu3AHH7sRHj6GB0p/SeNTvMen0jsLysKVnES9jRB/HkWOmAy0NWL/dmlJfKuiAeNfkrc4599WzcG9gBaCDnnzQoDNETngmpymfk/LmlTVyH23JrZc9mCqPqUx0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+54T2h9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+54T2h9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso11073525e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535857; x=1775140657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM0UiIcJttTcdCI1/5YlbfPbmrdM8cHS05utyZNdE8s=;
        b=q+54T2h9bRYpWCGv8Ca/5FMaclrMf6aUOVC29tfZbnTrxS67K466yBt0CyeWVwF4s4
         pr12krpXisdEWO1SBKaPNTBMulamEgS/DD325IV8mcJSr+iCDvejO+XSgjMq8X0eeI98
         KUhvN/LLThUzYFWr9ZMdFqvDWJwG9+Sr5ABtX3fLIdS6ElQTtVSRfle0lQmB4mmVMaD7
         vhG2UByyXt20IB85nZWaOPLSFas77p/i8gHKDoUhHbNcLTgobEHXM00ESw69tNAU2SQD
         o63c0OeWQDbV1Owg9rPBRKuCOqh7lSnKy6myKOXAQKJQljvzL8Z+q0/kfDaya8WTM+GY
         F3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535857; x=1775140657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mM0UiIcJttTcdCI1/5YlbfPbmrdM8cHS05utyZNdE8s=;
        b=OzQAXpmFDB90+iaU8HCVmxRzV7prakO4AsHv+bB4QNv9N9fpdIF3e4DUeYe+GPAEqq
         an9aVNM3u0iatA7u8JjALr8LJHO4Hz5to+jfYrWd/T9fkYBtl80i2WQXnAJ0VxmgD3i/
         /HmMR7yuqMctYwb15+rbTOaV7Z6KY+rJqzec86QC7GyTMxSqaNavMWDL0LgiwvVaP/+n
         C+zSwFfkfEb6Nh49bV484GH5Ciy5de82poIHB+EDqhOK/w4JLMalwCs2sxmJIXInqNBd
         u03ue1XuaBJfWnyuO+auh4bvtD1+thc1MAKc1F+pBX1gb82zdts151NF2ATLXmJLAN+B
         gFeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhfKZYhFHhKDSlzodXRgrHNSk1HyW3dHHtDVPTcoxAqdppRISLU3W4rvBrQEL0baWk24uthMjU+auC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/CfGXpXr7OT3bTfAZ0ooMWzq/Qx7ILT7YCIF93udSocUmv8x
	jD4pXlUx2GejKSrKFqzRusRjDQQM1wxHDddJCt9xoacpU6x+wKFURxQR
X-Gm-Gg: ATEYQzz+DzKMvdTxUMgO2LrPJ7mzbOyt9Xw30V2V/in/RiDfdb31LfBwv8GWiMQZ4gG
	d741XLJUGRS+k+qQlr3NqfH6zZfvc3hhuDsYLnBLrG7sXxXlGncb234elz32cNsCDl8PAf4dCst
	MgwYeSOfETUmN+uytrbRyoTiZAr+pX1f0kG9SjPJy52Ui9U94uWPA7axZXQGheY3V4uYwJaMrvQ
	gxw8euI6FIZW9MX2rfSZaWGUZVx3f46xj1ia/7BtwDUOsy6tmBLLPHAqthoJeaObzeqk9mxZSlk
	bUwKlbdjwp3FPkBJTGLHxFY5DUex1dsvdknCdf9qKa2Q/9ORVKY89bllcJvDfGj/2NYeScjb6Jr
	gnyQS/RJrMfT/oymc/IZaEnICQlykZt9TfY3+N7O2ZelpC4Qm81G8fPtw1vs9n5Iui4Gc6haJkq
	eHGeBXEMz1eRQmWocZt9mX2d3YWtJZ6sttkYT9ugdwmeuZPSCz7zv8GqP9I45RBQ7tLYNBeETOv
	cNcS2Qx0XqSWdUpA9Dtf+W2Y5KEBUmI2cEwCi4dI3OrlVUEADmp9/LWbiEwiBB9eHy5LwmtNP9i
	L6KVDQVbNC8lU2AuEvn7
X-Received: by 2002:a05:600c:5296:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-4871605ceb5mr124171915e9.16.1774535856243;
        Thu, 26 Mar 2026 07:37:36 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:35 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN
Date: Thu, 26 Mar 2026 15:37:06 +0100
Message-ID: <20260326143711.143462-4-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326143711.143462-1-fra.schnyder@gmail.com>
References: <20260326143711.143462-1-fra.schnyder@gmail.com>
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
two functions. A GPIO hog is used to select the UART function by
default. This DT file is going to be used by both Linux and the boot
firmware, and the boot firmware will configure the GPIO hog way before
the Linux kernel is booted, therefore there is no actual race condition
between the Linux kernel BT UART driver and GPIO hog probe.

Configure WIFI_UART_EN as a gpio-hog driven high.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: Remove unused label for wifi-uart-en-hog node
    Add explanation to clarify the safe usage of the GPIO hog
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a90edefc5197..8eef26eb0f87 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -451,6 +451,13 @@ som_gpio_expander_1: gpio@21 {
 			"",
 			"",
 			"SMARC_SDIO_WP";
+
+		wifi-uart-en-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_HIGH>;
+			line-name = "WIFI_UART_EN";
+			output-high;
+		};
 	};
 
 	embedded-controller@28 {
-- 
2.43.0

