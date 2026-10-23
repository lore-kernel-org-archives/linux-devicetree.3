Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790381;
	b=rRpLdTVsn1CyNdug0RIIucwM1mDkaltXjv6qZVG1bY06KFXFnJ7f8qQbMbUedv84PDCy
	 57li8upRGEL1esqD3tUHf/WyRd04YnxffbM1wVb71oaEgClmMtRCjvkyALu/eIjrxnHwy
	 HWd51Dr26f5s/NevSqExPxWdXY5r0/ALhOKlBvYh9mCjtSY0xcQEaEIkfBLSzndmA6A+c
	 k1HdBR6blWQlllkDoF9tgz1Tc+sN/bfjczGld9m1nrG1QOUSQ2AaS5TlcP5kKCZKfp1Ot
	 QEv4DLcx3Pychrng3eMncQkC8jOB19SQ3OCtBfeAQL4tlf3XNXf6BalPSFw+EmTgPQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
	b=NaPvZ5X+LGSxVoMELpXRhIkv/H9yAAep4SJ4ek19DrTOlpzMneD1npa5XAselzGKU4iv
	 f5BYJmok+irpHIcKYbJr89wF535VzymUxnLj0OSefsYIDJInpI73JBEJr+1FBoZPs0QZ/
	 ZIy2b+DxAluga0EtnwW/hVQ/Vnndh9ZbDLnmbbbUuLBR/WrB0XCz/2qB228mSO2TmIGL0
	 hdiqFVKtrui/CsYh1ZqsDQktcHfI12/B90mJwfWgNWJei57N42TuiXrRbWtRI433zst9g
	 8GsW+DcyGh1snAcIPfo+23j9nI2/8m1fSjHFwGMCLaHnRM4xZu23Istx+3wvz1Aulew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s84EnQUw;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2CC606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2CC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s84EnQUw
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f84a55e31aso839762a34.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790375; x=1793395175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
        b=s84EnQUwh51TN5JAgndhoT5KOgs7U6N6XwybtUOHCnuENP+4Bfe6YjQbzPG8sQOAN2
         beWfQi2nybUsKw4r7MRV9hgxTFMkRoMvNECYToehWpfrzilR2AYpg/x8bP2kr1jxOkKa
         mo49KYtmW7X2mzthF58JQyNvqzFkksImrrDnGdCqW+Lfl1tKy7lQIXyn+FryfmvU7mQM
         h9b4NzJ+/PY9soGIaEP1g6u+DfvsZJikWsb9yBkmnwPNCi/7CLCqqjP/PGIkZcTgguQ1
         tyPIHy+LB2e2RDXKV1VtL1LPRmeWSu6f2daZ0qqMiAf/2UE7ZfP9eItUxBYZJdAI3Y9o
         HHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790375; x=1793395175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVsOr+ec2L55sOlcfZggstu7WJwFcYb+XFa3A0v3Vtw=;
        b=W/ZiKYJ1/m2z2ZHRpIhFWXi/SRPTbJgu875Rtj2uZ0litduAlV3yEa30idOsdlC8UE
         TPcY/E4oSSpQ+3ytKBgE7r3h1kaLC4JVvQtwhLmqwpxStao3OIbSO1gEc4KpHz7b3VtS
         6zgkcD4O5F6polBWgMjEwLpLxFDLA/LB+NRbvHQ4NoW9Tjh1h6IXPrGjD4UBLquIbZ6F
         1qJhE0IWh5Ej90E5iEp5bpch8ZSN9cF923Ccgm8cscvsRNp7YquNOmiPxICmCcd8sJxm
         x7+G2/zxAv9Hg14mkb3JrCW089aNBCQcolY5wTC+vvadfFPQO429u2QGbvjdfvIOHOnE
         N0qg==
X-Forwarded-Encrypted: i=1; AKwUvBytydj1w4Q3MIeeXx2Fssvu174+vC2GncU6i88JVlk3l/YTPbJ6w0zVdmnbJUfw/v4648ebVVrACJwR@vger.kernel.org
X-Gm-Message-State: AFq9FYJy+8qeMIeMKZl8PKO5nNH+6rLvnkEjIISRwatr9P3Rh2MZeVcc
	7wMeQRUirxS81bNe6tek8WkKCScFzvVqii6BI7+4cSlRSUmXAXJuG/hF
X-Gm-Gg: AYBFou11i2a8hKEZ3rmuNCr8/VLUEx3VmcNeNxQ8BW8KVeVJdYTJXmrhldkZltbRc0n
	KkY9qRBIbi1LTDDRC6ZJRHH801PzI+eeaqFpNWwFGA3Q11nv1i+PyBUmWGfK0B5xH9B2CZoRXBq
	TxZtUmOR5FV5gS6T1T54SIFn1L99lJ1a5gMT46ERCYEgQOabwcEMA3hd8UsbliuFIKfaqmiDyJF
	B1/E817p938roY7ZPTFJ14p1Pojp6umnXXHpkAVlgWDRDHC/4tDrYH378EvdVi7cvMSPy81B4nH
	hONqhX9Csy+VkIvYkVAQuKedGpDOhzhVBNw21dIv+tLOXmbcYg6lk08AWPYud8ElLCMhGaOjvdo
	5A7VXJYKKRlDSDR6zwonlZtM1Q6EW3BIy+xDYqt/Hg8OB7EC4RW97qkNdjGykiJPD4H12kryGFj
	rjqBQvi5oU4wKYJwfzC3kBpjZQv+zRkojyvcfn4omcYDQaixrZu1YBiiLrdAHj8oRA8j73rUK+y
	mD+oFcBtJmAO3HchcS114/OlS6YBYH5flRo2QsTxzPzNAxrZ9y5EBHxw8XoS43fwpX0e9BIYMbe
	pxQ5oYTkIRU8yVaDrz0cx2hZda2XdMPsBbZvR5HIWqYj6xYX04Vl7qP7xjlZhyk3kL8XNt7YvU6
	DK0DecHnZs0O/UpG26Y5b7yqWPmS1UjCK2tluAHkN88yfA2BwM2QVNafxv6QRjVBAGr0x8ffHkG
	OF4A==
X-Received: by 2002:a05:6830:906:b0:7fa:5c49:523e with SMTP id 46e09a7af769-850fecc32fcmr525089a34.23.1792790375055;
        Fri, 23 Oct 2026 14:19:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:29 -0600
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h616: identify the UART
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-3-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Use the H616 UART compatible for all six controllers so the driver can
select their fixed 256-byte FIFO configuration and register layout.
Retain the generic DesignWare compatible as a fallback for older kernels.

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

