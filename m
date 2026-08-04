Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE4242AF92
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827121; cv=none; b=YF57X1DgOWdsKEbNRO6Cve1VmvXhqnd/1QBCgzQEqvwlhW7om2a3cukwotc2gx6hxCLX+mp7iztLqIpzuRkznW3EcQbUh9VQmlsVQItCek54qsVl4qvt3WGpMSXvU3knErhE4shYNSfZU50aLzyaeO375N2G4t0lxYeazOuS/MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827121; c=relaxed/simple;
	bh=yKkOBIWDLVzZbrFG3yiQLyXNfyi/iupP2ISmcl3yvxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i1VB/Jp0P1A2a//lDNfjxR7As0SrygOp5sEbj8h2mF+yGI9kR0FKmTfXJQtp+Z8dowBn9dQpCgR2pnrQgHwfU0mZnXAmEtNfvz9rp6alEfSyFXhY/r1ddpMY1uXl8RKT8IeOwoFzwOvMm7xA6kr/hPGT42M9Q3QOrz7G8orTKoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3j3+7q0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3j3+7q0"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e347638adso4882201a91.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785827120; x=1786431920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=;
        b=j3j3+7q0fFi59wJIt2lJipImnOPmmhKt1LXwPGccfMMvwLiEvvz79ibCI9H00nOpHX
         QTTFhKDbWb7p/kTqzv8VeLTGZJI1EMJobsIL+o0j0r/vcqggKLsBHXr/9WLWpMwndnxI
         e3Sw76G+oiGDMBVvTKXmjUnI8NYgEKOwe/yl1/NN0ac/6ldakmWNOeSdrbeY/skobZA0
         ANNMF379tdzlmQyi5dtH6OzuOBwsbKjn8vBG7Mb3Yg/xa5nDwbYpx2S0lPaYs2VFhLuF
         i6tWVv5RQz5OlxBR1H5f3kTTFs0Uv2io1hXym63tsB4JTFt6/r3x7WejGBRINxfFwMjK
         8jPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827120; x=1786431920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=;
        b=bkVz3uKml9Fqo/dqA8Uwk+bzQ9OrxPI2ytlQ36JOhJvtU7A82GD9Es42hAFvQuQjuq
         SBT+e/0mOoRO1GgFkqoNTnJGbA0jqqUWJt+S/0xpGzvzUZbMs95mweSPFP8a63MjwxUv
         FghZapR0E1XBEgWX/BvJWhqVTVsKn1R7OE5VnsDSkSsyBk2hmodpi/+8STQyQurvEAtB
         Bwgx+dNV/eAo5pN9oecr7ikPwqli2yixPe/wE6Y9vOvMjEnEQH9zGncrlpMY9WE+Q99l
         qvq2T7B+A9jfaSCyOyJGdA4E32EBhvKCpoHXDwor7kSdrzf+oV4CIq3s8lH/m9VgyJ6N
         pakQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdgsK53T0PlkTAp+xj5f+bDhMQxyp15EogoCI4lG2sxE1XFdZhz4qRlDWkznKp7ZFibvehgE0ceZ4i@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1rBtvxnJpGty4NwuTaUhAt7OZjhzI/AdOKwJik+d4AbUcQXQn
	ISEbnYnopW/CqV90K9l5t641e3mcN7mKCD0krn8sAVHD4vvTz5pYgv61
X-Gm-Gg: AR+sD13seNTqsWgpEtnMjf84OWI0QSUzdVtYGOTiTaHGun33r0ePrqG29YQ0mP7pYlr
	crl+p4sytghHBEFATgDP+TKUk6mG+VSxe65zbr7tIR3szM4k4RG2gpboFuUT6l3+UU5ZMJF4K0L
	sexszMsSVE8HgZKlrKtfMD4nLyG7xCng0xG8RqR5FuLyM9IkCGbddXy3RCzwTxShVcMHnTktqai
	pOzZEZ9Ka2E33YJQYbB0Hi1RJwMrmR+gmRc1bLNpP82BHwZMAH67t/l0WmeI0CbOFu3TCZnNVcL
	LExIzdX5uRQb9TdMgThycm8gZPGyFoJhKxbat2wmMC4GbsmkYO5/osm8SasVqP1lKs9v4jrFPis
	H8O04iSwIQL8CmHoCcQOz5ZRgLsL6/M0wZMV41rLbKeAhy0kzaN0DNEcX0ibyVozzA5tLQphxa0
	6aYAYGeETHzsopXxKg1SyrLPsej+JIFGqK4SMnsMGazeaQC0aajufstC8Bt5+5gY0yFqcLczAWY
	fqHdefwvc3//Sf3C8dUmDQ5tW4uRK2VgGqXGfayTve8L3M=
X-Received: by 2002:a17:90b:4a11:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-38fbc4055bdmr11835563a91.2.1785827120151;
        Tue, 04 Aug 2026 00:05:20 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfd8ff8sm859815a91.4.2026.08.04.00.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:05:19 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: nuvoton: Add WDT node for MA35D1 SoC
Date: Tue,  4 Aug 2026 15:03:51 +0800
Message-Id: <20260804070351.1846165-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804070351.1846165-1-zychennvt@gmail.com>
References: <20260804070351.1846165-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Watchdog Timer (WDT) device node to ma35d1.dtsi.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..14fd17cfdc5a 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -82,6 +82,13 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		wdt1: watchdog@40440000 {
+			compatible = "nuvoton,ma35d1-wdt";
+			reg = <0x0 0x40440000 0x0 0x100>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk WDT1_GATE>;
+		};
+
 		sys: system-management@40460000 {
 			compatible = "nuvoton,ma35d1-reset", "syscon";
 			reg = <0x0 0x40460000 0x0 0x200>;
-- 
2.34.1

