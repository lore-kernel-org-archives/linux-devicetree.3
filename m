Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299662;
	b=bwJ+AMY0NsalYtuFQkusz6LouDuedK8zpctcilYCYcH7xzQznrsXOnBsyqERRzhpQiUp
	 800flR1g9x19ip4mZanoPeOnGZiB3BR7tlb8gEXPI315K5rYXzCM0Tt9rBygwvsAbtKmH
	 4ryY9Lwikg5Hlgo45WG6cx7QixCMHNsd5cleClhZApM5qCsr9r75Jmu+dQ1XCA9UhnsD3
	 5aiLG2EsjXGJUlaWVpBpilmbPABkWZdseX6Rt8rfT6isyjE3p8mD//723mUicP2K9ptDG
	 d0MfAP09hvQfJxohi7nN/qk/G/CbTINLIU/qlBGvVNYNVOnkDz4+/FveeR6OGJautMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
	b=jDz5TuSxb0Yyda+CJhInFOcQimyFhnfMGSawKdU9nOx+Uew4Ym/Jh+eF4IPxMWGKxzpA
	 71K1p6E7whBlXGkuZtsD5cq++GJAz4mogsjCqL/ZWXtNQZieuBL9tEnnesfeUmcRqqnit
	 1mS6d4JV5L8H6Gl3Y5hRmxEYtoUljNxeyYr5Ftm4+jXxBEK2nerxIkzTdzuwNozR87cAH
	 TGYjQU1v3gwP+DzxVfWuBRkGsh16XeWcIpsh6kBgw3AJDv2Sf1Bm3owQevyQwZ599aC4W
	 Pgk42F6fOHk1nNp6IgeLpiT+I/Vrrk6O32teY9WlUP4tnd5JNCnxGoTMPJHkMOYifPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgEfCHc9;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900F60A3828
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9900F60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgEfCHc9
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8451a619da7so1738301a34.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299661; x=1793904461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=mgEfCHc9QsNK6XJOqY/q5OKZuaLnKglqbASo7K+bPQqZoyQcG6lWwdIFZf/XSYB9j4
         cwOZaDj53UstQv4V2RAD3ngIfPQJ/F6nSJcBfUh399Skq2gmSaH89w7H/FvE0L3L/1wR
         5YB01KQs+CQJ+BxLiQ1vdkIQFzJLwllQc+3fa/P8yJNUEGwoNeoGis8mlwKY0zoU4dBA
         bQAWa3oaWYS5shZpNDT7ZDn6fZ8SVVYc+z7ZMYN43ala+9W94C++qbPUM2Q4TiOTgr3W
         aSkbvaVUBlS51Onu+WdJ97L9UbvICJ881cNT1HYpnpkCKVsMBOsnoo+X5FHwp8ittDiA
         iXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299661; x=1793904461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=O9k7aNAAyythEfrNBHKQ/iT1TdJZ9xnRtG7okQk/jqE6mAwxnufrHplzgxbv1mnhib
         LDuCbhECuK4OGqDAFi2OkzTIr0vVojanvjBd1h9kJBv2u+dl0AfwWyS7/q50zGS/T9p5
         VQmmIn7Ci8iZrreDN3jTcCau8i/l2vlLF2lppkOWYLZ4lRi56UGR4M/mLUkp3NrSH/Dg
         u8ItN4iqhk1YiZMIQGM6eT+fzhZ5fxYusD7hbv8TK5nXwNcjFyp8rUSjc7lv5hVaUZmh
         8xmUAUp0rTgdUk1F7UZtHrW3b71mg4ld44AcTkFXgWJL9phRfHcmTatO5qKvqkPW4jzw
         hhKg==
X-Forwarded-Encrypted: i=1; AKwUvBwWmxqyyssmwylh4adSuU16awHcPXVk04V43WBjK1kUE52uKfv/rkqMRIScGWQV26WPieOe7PDOZxkp@vger.kernel.org
X-Gm-Message-State: AFq9FYLt/IMxdH1qs8rnGWsMyN7ucDKu3Rzo2ohLZjZRZ16AHjv1oYkk
	PsKNe2vDr3UW1s5wIK2gFunl83ZBD0Nrwf4B4iahXHC9YbNehI0/6ER/
X-Gm-Gg: AYBFou3p1Maj5FGYvQIR0EgMs85U2830DvW+MLdbaB4Zxxd8vaD36oPQYgCNZzZqcDn
	qCBuKNaXUKSK6j4Di/sBYciI3hRXmxqAMwzyNLEuIbYMaFf3uoSxFZK7wWSzGKZiEjCNT6lk2m7
	siUXFaf70PFSAxL1Sf4Q4rJ8IFHm0lZqSmwu2hw+mK1KHn992u3pBsSKMSMgKH55dJ1O6KZ0mH1
	uQLJpvA0+tiP1UCuiRVrvw+B1JwSSW6iL/E9Q8JRq+eJZts9Fe5afGL/kNaF0EhiNjJZTF2j6UL
	DR9AYpMmwGKhk/g9X7vdrU7c2fZNdZCt9Xus4uyVo9gjGDyxy2Lx1GN9aTUntGW5sHoLeIW0jDz
	3FF8II/qBAQjG7Z4X3eXg4IpZ3A6PSQCZJXVU21hzaDQ9lmdAJvwnJTNCB9dGThhk0X6sNumgHt
	CsEU5aosfBYUsnfO9KOhHN+tlflRyTW8Tv4fWSuZb0CRYiOcAS7eeakONdXl9N/6xn2zUK9qzu1
	R9zSvkPTxH5XxlmtCv3s7B1qnoWCD36vgFwj8kZY9MUOk/8+H3qgDfIgauNdDDp7cmOyyieWqx+
	dN2dKVrZnr0mB6KGcCBSaxhOqNIXlnNNNp5IIuX3IUSg9QL6Adf5cVLGn5bjWShcN2U9AhkhJil
	oHWdAUoWths6j/nZ26PYG/Bk6tdeWPyH4hzhkyCuHNvXkd97YEg+MCR7ztIzqLEFv5oaDwzcqT1
	w1Znnzt/sszP74Yynb8mMrZtnRvczG8U6OfV6nKbN8NzPXHMBCtoA=
X-Received: by 2002:a05:6830:438b:b0:822:a76e:95c9 with SMTP id 46e09a7af769-85d364642f9mr40665a34.14.1793299661366;
        Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:29 -0600
Subject: [PATCH v5 8/8] arm64: dts: allwinner: a523: describe the UART
 integration
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-8-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Identify the Allwinner UART integration on all eight CPUX controllers.
The specific compatible selects FIFO-depth discovery through FCC and the
Allwinner receive-trigger mapping. Each controller supplies its own depth,
so the same compatible covers the different FIFO capacities.

Retain snps,dw-apb-uart as a fallback. The common SoC description supplies
these UART nodes to the A527 and T527 boards as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..23340b9f58cb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -390,7 +390,7 @@ wdt: watchdog@2050000 {
 		};
 
 		uart0: serial@2500000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500000 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -403,7 +403,7 @@ uart0: serial@2500000 {
 		};
 
 		uart1: serial@2500400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500400 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -416,7 +416,7 @@ uart1: serial@2500400 {
 		};
 
 		uart2: serial@2500800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500800 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -429,7 +429,7 @@ uart2: serial@2500800 {
 		};
 
 		uart3: serial@2500c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500c00 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -442,7 +442,7 @@ uart3: serial@2500c00 {
 		};
 
 		uart4: serial@2501000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -455,7 +455,7 @@ uart4: serial@2501000 {
 		};
 
 		uart5: serial@2501400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501400 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -468,7 +468,7 @@ uart5: serial@2501400 {
 		};
 
 		uart6: serial@2501800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501800 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -481,7 +481,7 @@ uart6: serial@2501800 {
 		};
 
 		uart7: serial@2501c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501c00 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

