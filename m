Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864B378822
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803074; cv=none; b=SasAcu3lsWRB1K31HmKz37EEcISWb/GDAyZSmZWozHpglvXJSRh/Y/OU+wwiGnrH7pmDKiRhScGgaBSk8NnaIINtTr4XQrGFnpJgFKEYHRfHzjOMA2gNlgKXGfURErHUwTVwPAU2eFWLpzzrzzLk9xRvMeEsdIu2DvGE5TGI8vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803074; c=relaxed/simple;
	bh=+LNOv45vrQbMiDCXtxIdZ1Z4wULCgyg45rbtYEUkz2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9enWMRgcaMoxCRHm5ffInRv6I+zPgmvECFV1oPYg7KFRsubYk+nuhTEnKap8a00nbx8pLV5IjqhymTEoojhMtjG5g4IkEAjjhaU0gmBg+C1Hhc0LVi09SaE5HWxPUC/v8OkPvq6MaMKMfy8PTJkGef6xT9urILgzIIKrrKaqaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phOmhqZv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phOmhqZv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso26063215e9.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803071; x=1777407871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prSl3YomUAP/O+c4YIncfvP9MWtenSiESKpVMQ4hE6Q=;
        b=phOmhqZvRNW3/gvKWq3/PhaBaw0k142a764RBetik1hf+7yQ9283sqgnbursCsNBYM
         ifasrsYk3eHbmCgFiGf1SdPUBItOp1a5J2F7951CTd4l0vb4vrNBrlfqbQsGhR7Xd2Qb
         N4dXl08iKTGYpEBA2z03Oay4nFNWny1xGhF2PwDzCLzK5Ni4BAfbhucwphehzCM5Xles
         gs7YsXVeu9bEGOB3nVgbtnjUkKi3NMcFVEY0SifqGzEMSc/OIS8n3E3QW6h+arTtoWfe
         QAm6WXMFfwB6wGRESLuQWSsgQNddncBlyeeeOfbgeuZMC5DVrwNf6kNChH27ZYMSyunQ
         vlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803071; x=1777407871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=prSl3YomUAP/O+c4YIncfvP9MWtenSiESKpVMQ4hE6Q=;
        b=haPQOdnTOwEeV/K5Z0ukOYEg0fW3gukBnHUofz6KzXS6aPqVGIFyOPWvEip40sHzRB
         p9jf931oCaE6LkvBO2zIAgw79LTu16ULqu9ZsAupjDnb4+pUiV5KQVqIgVKv0z24LBZc
         0sBHgj3EY+ZY17fZOEBOe5Gcm4cWhbOmLyxsd5CnzlFl0MKV7uvGzpQzRBkGpKwRmUW0
         51RVofl1OPnMankTzFjNw9g5EeZcmBZ+UJ40etbr6O9A89FVn1KSzc/LoeR879OHfgJ6
         2z0Pt7QvC+JE4Eoz8ljsevNEp04XUPdUsMlONCcjYUG/mLMm7gZ6qU6vQXOOH3PK9mNg
         R1TQ==
X-Forwarded-Encrypted: i=1; AFNElJ8apcMNm6s6jr0phIBtzQMqYCZMIdj2WMxInSnFXKXfs/vQARU5JIkWg/Dg3N9TsYgwnwuXQWeTWKQY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1/HuNnghNjD1uJwVIE1QZJTeczqJo3SxuQi1lyrb8zjRPh9G
	r1rHVxlyj0nLB2+iZFbRnoSDrOWLYVognJPX2AZcMHajsvfEreZXw8I5
X-Gm-Gg: AeBDiesX4xaH5DIY7kIJ3cyd6ZK7JGd7BJQFfRWIa/H3HNe+JAkCbrXHvBIX4hHCK97
	tN4+IbMDHmLGR7+1UeaEVnO5oVB19mkOowaTqgdBGwU3sX/hY0GaW7Mbb0wMrWuLPhAv1TMvsIz
	HQX0TwozNmSwM3/rD+MbSylsMXsjiwC/j+/ZZQJwUdVXZqnU5WUMgSyZnCRBH2zJNTsWtOLAhKk
	4vlUP1q7//Q25sKrhAzw6yyztfB4IAYnCId1BKx+VdAl2Z+oNQhutRsAJRsUbqoSiZmlTmqSv9+
	EHErQyiSO+unOcXivf/QnAiV7ibalnXTj6K67oWOdaJoVT7f2E4tOqEYGmrzjkrG68eqC6QHyoy
	hR552ckkw2k+HrWbntRsBoMChf51TkTmxf3PsplSnYuzLZ6SIbGvDn4iIQk+Q5wUuy14iQ43OId
	Xg1mAy5AYzMzZ6ntvLroYqkOuhQwniXNw1MRFIXcsB7PX5
X-Received: by 2002:a05:600c:c0c8:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488fb787bfdmr213701545e9.26.1776803071290;
        Tue, 21 Apr 2026 13:24:31 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:30 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:15 +0300
Subject: [PATCH v5 7/8] ARM: dts: Declare UARTs on zx297520v3 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-7-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=+LNOv45vrQbMiDCXtxIdZ1Z4wULCgyg45rbtYEUkz2k=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXfrQzEUhybTMkuA5I94/3Ymni5D6AUZPwC
 aINr5DnuqWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIQLBAAh13d/JcWPxwb69Uu73n5XpfiUQ8mnSS
 jTntxCjqPXK4oMz2E6WWElqupU9dACH3H2OwKhUt4gX31WdDFm5uhI/zaXfY0IinGaI3Zvm8nVJ
 ySf/MATiAvZ4zlu1Y0SrQIcYLGtu+/ZNa+C3OziXKgQndPs9pHGQgrcQi5WSYoGYGIugmEUJgza
 9xgnC6N81uTZ5JHFF5AO43J4EpHi/sdgcMzh1HW93NAmKbMfdJA7eRyj70Qg8sOU0DSMrLY6gYl
 WGEfZ1JdnKuGovZpgCzN6bjOPUpS86gq+1sm1S5uUkQdrsYkDHYjD5qYcYOVw0P5/92/ZExfaTh
 wTPr1DzMeIMN4hJqcRwbK4mPrMosRnfPnvf8Rm5bPP4BAZZUIsKacTAYBMCTmB0Y/uywOsbFyul
 bFEZBPdT+6FiGmozmvdzRVcsaKI4Mt82WstZTJPzzxKiESlehgZ41wwJuzydwGe+foprt+IW/+U
 guJu8ff/D6qrdW/2jM1BxM2amnNfJYj8huLkoeK0iOFVNVCWKGu/Sh3/wBe4dP8pgQXeeZ/ZTzx
 cfRPkEnGBQ8vu3E8D7uEWyf8hK/eXqD9WLskT5FpXn/vHz8sVZWuc5IjMf2c+w1bAdrKAEiTGQR
 GIcqUtRIb31dHmISZVwQ6G0hrTHPM99QmoF5IvKMQGWRREWSsPOI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes since v4:
* Declare all uarts
* Remove the UART aliases for now. I can revisit this when I get my
hands on a board that exposes two UARTs.
---
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  4 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 39 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
index ac20215fddef..1700f46aba86 100644
--- a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
+++ b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
@@ -16,3 +16,7 @@ memory@20000000 {
 		reg = <0x20000000 0x04000000>;
 	};
 };
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 903050c684cb..ca65797ed926 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -20,6 +20,15 @@ cpu@0 {
 		};
 	};
 
+	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
+	 * been added.
+	 */
+	uartclk: uartclk: uartclk-26000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
@@ -60,5 +69,35 @@ gic: interrupt-controller@f2000000 {
 			reg = <0xf2000000 0x10000>,
 			      <0xf2040000 0x20000>;
 		};
+
+		uart0: serial@131000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x00131000 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@140d000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x0140d000 0x1000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
 	};
 };

-- 
2.53.0

