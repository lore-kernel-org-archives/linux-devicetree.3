Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742014;
	b=1TvNeWVa0q+qVuQ1rIyzxAfBjt5H31VjjvqTrt71sbD5nhhLoJ0x40Y5n31eTZvBJgiF
	 4rV8hIfLw45d3cJfBqBCtpPTx/WfY9xShlSWD37OfxFVSSgpW8bTyIvIjqGfnxpoKjf1A
	 dT3yYHvKwiZGZreK23foiZbgIRUsykFCp9w16/xjEdSuTpsNbPCi8j6cVP5Gh6NdqJFUe
	 K5zFVFbuXfhYLFR24rVZkU+Aa2KykC1H4RrnSH6ShIzbDpJnRP64Y4an0ksZxxpuZTsAY
	 SkNa5eCDwX6jZTvGJPblq02NwUdroZzEjpEJdkorPu+a4tLt55eNCjcHnDkQMgF/LoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
	b=rLlSZh9B8/1dbkfZzxBnKMW+fDOAkLHwIohkANGiE+s5UR5sCYqnYMTOC/XBKpP3NzTy
	 JlDX5OIBHk2uM74Sfv+HuXDgVR8u/VUL/G9sJPfmYufLSPx7ij/HZ2ZJFdMqXk5O4NbpL
	 Tri/eZGvIj4nURHUw8Ym9Iz9wBS9i01OhuqryhTnOjj+QknHUzuZzf4giLVwW+73DIc16
	 XumVcmU4BjzNJQyb4td6ciJhm0KgcBlOjJ7ld51gJGuLGap+5ie6rdWtOud90NaqmfKWr
	 C8YvRYA0EmnaLVACB/1ClEo+XKV8WtpxsyJgmMtyGJCYRVFYbsm/LB46JghmgUXChUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2UYIqFd;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB8606EE81
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FEB8606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2UYIqFd
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-55651e7de9bso48991b6e.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742013; x=1794346813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
        b=h2UYIqFdlkbGXb8r+nRW7RUmVcFRGiuDeXRFkUkcabOf2xlyGIjS5PP0NCfs0SA+aQ
         bXfoQ/SjRVyC6Q0jCOHP6+iH+xk5yrC2F3Z3McWUQ10v2Hnsb1owzVqSGpI8qwZKVj3S
         ROX2njaoYLCgQrLywZgtPhG0JRStcOR3l6jA2qDXpz2Qhgi9oncRmd/ZSznchyuUhtMg
         HyEDpsLu1esInU3k7O6wdgEHDnRTT6KmUc3oh3hc73iRE29kDnOqwwbZKoCkzzWso6nS
         r5CbirMIiHBG369IEALegsgH5pQ5qZmuJPDQONYmhlDIrqBubi+zzJS5SuGFh18wi6tE
         tWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742013; x=1794346813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0g1OT4dACORpc1EFN+wgx+XwdWT726Bj1M4N83rR7xA=;
        b=0Zfg84K2ckqxDlJya6g5UMbsyxZMpuHRtB9U59z9rpRFc28S3pNFB91niRAfnIubfC
         O3oo2vFUnUTH2oEjJjriI/RLIr6ZLgiwzhimFar+VfyDaIGvJHcCwyVG92sgpfGoycbL
         v6Xs1FWYU4l3MpLO8Bfz6EoDcFJRt/c0n1XXToF5vFNe95avtgHP7VWkRKfOw+KWFNRw
         rNPhEyLnfSrfouJ3wu012ncMToLvwscmZhXAO8V4sCKQvwCVHpNz7AcSUR8LjQmDxLpP
         ub2o6rWJ5Lt3sXHUjE0AeTz0Vp9olC+0z7mzB3jduKn4D5bWoDzOwWydApRvuluqhtsF
         HvXA==
X-Forwarded-Encrypted: i=1; AKwUvBxyeD5GIW8lzXNYuqLKy5Lb9fh6RwZCmvWOyFxQ+mn/iFQ96FeLc1F7aKQTRbLFqtz9utps0Oklj9eN@vger.kernel.org
X-Gm-Message-State: APuU4Z+pPgMfgelvuof7/+BUusnEs376ErZVr4J5GDT3oJPBAioLNFn2
	KZ7ypAYLkAZ7IDXuZEW5okzp92HU1tcdQFbKqZA8YO8OqnV8U6QRlWT9
X-Gm-Gg: AYBFou3ZwUXuZqkllzIWdcbBkRglQtjkA+4Cy3LfHCCkulW5LUA/UVHLe5oqr34tuCo
	uE0A9l4960tOOGNg0f+iaxsqhtGLmRRe60sXBj9V+Caafm0Mp2GZOl7ByftXmzXs82MPKUpa5YR
	J+9PyBMrhzCvnNBHUaVzjsYBkvytHqlZG8dviaeBKf8B3JR4LEV912AX2WlCRNMpI3sBEjyz9Zh
	CumMHJujBr0hCLCTnRX/em4lgxuC2URdy8EVMvhUAuKf9n6oY2X5JsTsjW6nvg5wrviFphxteL/
	ocWdHxSqO8JyZq3cJW95a4S4cMZueTbAE2fkCSnZBongX85THDvAyHHIB5mdoHLBlNTLmz/Va95
	3iqVCDbyoqJQgIrJ9tcsws+psove5g0ROtaQx4xM/hAeabNNjltTuDBeJaMMnM1e2wOd4UCBHAy
	h7qoaySgnTdJ6O+7Kt70+3M7Opc7sKvXevaTjjVs9g+WpTUcctJFRgfW2LrJkesu+H+v/C/AUGU
	tOCDcT+VVvWqiwaq1pxg/sszVZyBxl6M77QcOBBmBlTMm8ee0dKMmCyHn5elRrjIB4VZ4TD6vg5
	ZtQcQcdXpmSQGyI7M4jmJg62MKz1YMkne8Heg0xfbiN89b5lbztTC9dpdVDfszMt5Lxv9P7Nwch
	vSxeHR6B/wOuQAb0SuPHTxvynba0JGrRK1IvmqBlwfuRIekiPLdeKtlsfrb9r9SY71P1gLtvX/Z
	YsuszyWzhiqRtF/A4gNc+n/NdiumA441HnpHM9/UFFqbj0hxSOxFkI
X-Received: by 2002:a05:6808:6f87:b0:55c:859:adc with SMTP id 5614622812f47-5640def4593mr9802652b6e.55.1793742013486;
        Tue, 03 Nov 2026 13:40:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:01 -0700
Subject: [PATCH v7 08/12] arm64: dts: allwinner: h616: describe the UART
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-8-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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

Identify the H616 UART integration on each of the six controllers. The
specific compatible selects its fixed FIFO depth and integration-specific
register setup. The driver uses that depth to derive the shared DesignWare
receive thresholds.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b4b2f85726e0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -550,7 +550,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -563,7 +563,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -576,7 +576,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -589,7 +589,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -602,7 +602,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -615,7 +615,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

