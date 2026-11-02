Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649335;
	b=fKMHhWiwC6pEsROpYLEah0zOJcBm32v4MkylnIDe1eLy4ofEUeTTh3YC2djhwZz+WUGl
	 aSgAtx9BmsGFzndVe4B93oTqYu/bNXJLD6L1UkDQn+pOeCSq0sQqdCpvOrJ6A4BvGAtpt
	 UC5zII86/yq4zXRtbsaBppyTIn0XeN9VtJ5RWeaatYKvDp+qM/9qd9UY0EuMWwAO4XY9y
	 UpMZ3om2xfx7/ar7mZiPRjctGk6fYS2pK/ucykeFNJcYr6f92Xzed5T6FfzUgFSg0T7zL
	 JygjoYQgHekv6wDgq3EZHbyne9UNzU+/7iHBX2OykTb+7d0v9h/sQAZHIDIYHioVjoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
	b=GybFzGylBPzmhkTInixLSwem1lgjCLUn602ZW0VHK8JFVMT15eEYEIhguHJ61QkuYEY/
	 6fEsmZZkN8qI2LzMC8NjzByRDn588Cwf7FkcTJvhrll9P1BmC3v2d0Y0UWZOEBmv9tY+s
	 +GdBy8qSXekNMZbEjmKOHp3fHg04RMyit5Eejttqwv7FsnX3r1ea7TlfH7UuqEWt8qtSn
	 2aBiSYwx0PJTTV34MIE/T0maVlJOOZdQP9+O/3DMOrhh2SlsqnVKmRTRJWHqF8nVqSOba
	 bbDYoohbehDEg2L5Vru3Ga43Bt2FHsLFsEmpHGa2cUmn4hf97yxoiSmCa21x7MHJ6Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0v2zrD2;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88D608362B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE88D608362B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0v2zrD2
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a85c656c58so2076026fac.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649334; x=1794254134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=n0v2zrD2lqLetQ6g3G84j20Rrtg/R1EP9jN/aHEIfgZP25z7gO2ZiQxGvXCAE7GDlB
         61uXlfWq0KeXatPXZrGQcxfx5KL+qjl8Ea8WM/L3qjtgjFdav0xCeQmqtuo+ejzDfhpx
         ZOL8zs/i0qg5II8JNtCgUXbfm5Jm2IJwsRRbNHAHl90VZxkVOlJVtM8GdtM6oMynlics
         0uFSph9+DjaLchzU0sAY4XQtKaKLVol7oUBYq5ozo6dXkvpkhMWXaTyvLOU+BTE/Ze5I
         d7hmoEYvvJIvxp8JvzIee4YiwllP4XOaLmYYcacxwt65DI3unOeBTyBdgIMxk0iQDoht
         vlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649334; x=1794254134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=q+hCH376o14sEYcvgrzVp4dla9xzIcIuhgid8dUhQ5YKQpw3i/4WZYnlJCcmgiMekq
         Fiqhljns8M3P+2vfPlkZXREqaaCrkCLrbLddaPWWkqw0OVYrhtMrg7O7rsxlkPIKcfvs
         tpfxjhq7TABrSoyuoCiJiqdfn30U1Xwx679ee/k42sZbutPv4LFvJDshppG1h34QGBxv
         UUZgmAS+biNvePs+yRPxiBWReh4duLF8ljqpbx5Ub7ttNcJb8+ry9+sZOwU5O2F1Fx45
         4Oggi7Vxu34SroUPNfUNTmF/7/Fkqvy7Ep9jAGNdOBZeLV/8QFseH+v1c3NeehyHDYW3
         tBwg==
X-Forwarded-Encrypted: i=1; AKwUvBzueiUbCX48nBwaxsVeArJS5nR6kvz6i8/RJUJKnQiyhyTY/r2sSdaR6nwHC7+20KAVuw4r522NOvOM@vger.kernel.org
X-Gm-Message-State: APuU4Z+AHeioIiTwPx5AIo9HTJ1daVHfwiexLTPX3gTKQnoSzUwXJ6Pp
	wWg/keOF0hPz8aE3YWZkvnTvJ68npmT8a0EhLBYBdFHJtty1+66Df8An
X-Gm-Gg: AYBFou2Lyb3Z5NyAPLJCJUhjM1vz1IPo//hE3Fg+ZSuOsyrMSxbjBIqnK7mNV/hVvLw
	C1RfcNenWqlB/pvvXrWY5myx8YS1VK75EOszWIue3mOD3nNT6BCoJR5tvQLwzho9hkQ2w+7hmc/
	20nx8JFz53h9vg40Zf9yzELR91y7jsobi9TxPjncDXf+CB7WJtNF1KxNsWuj75+r31nd/2m8J2W
	c0yFJn+Zb0N8ogrzl+TJYE9op1YyatPap0j6lSP8fLRRK+VpLhI9aRbwnfc774kySOcuKI6gjuy
	N9Um36b2Qv1U53SJyCgv+RzIe66LIye97ya46f9kLt4RsGF0JWkZvlItm7qy2SUJcWha9txOw2a
	TkaRptsLdncjRkdVyTtop9E5G659gzhRex3Giao3W3mC3B7GLSwxuhhb3r7fPWTtkFLWRVTvEP5
	En8cZMHFcFtAsOymiGV/wOToW0LQfhyf2tKPZ9fI6vD2scjpG38ylt9ZKQ6NKazGNXgFT3nom5C
	26ZaHK5aNaOEHlXDBn4i7qN2OjeId5oPdgYtUYbXLpRmih9zy23sSJjKdkMCclmREPmtGScMo+Z
	sb1FOXhyZXpbS7CAUaBVQkljjLy4bXyWVc/qzhFDi9zIH7Mya6ir+J7/+271+jR+8342uoBZhB0
	BU+LXSu0XvPUEnkvRkUeja9HIP99xDJH5AwVrwgRf9AeWYJnfJ4dtGlMlux80S8Oj4Gs0ggYQm4
	qwzILN4hjW2+u+IgdHDOq/lyx9NuW8Awd3v6TS1CsRXi3heipmT9HTp3Kmga91DXCTJIo/aE/o
X-Received: by 2002:a05:6871:6687:b0:439:a524:a29d with SMTP id 586e51a60fabf-4a9072ccffamr6663890fac.1.1793649333719;
        Mon, 02 Nov 2026 11:55:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:23 -0700
Subject: [PATCH v6 8/8] arm64: dts: allwinner: a523: describe the UART
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-8-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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

