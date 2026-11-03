Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742018;
	b=IbH6JGwerr/Wqs08sEM6buZss9dgBjfctmFQqHTQaRCsIWb2kxc8VBaLVkGfCNQJ7zRg
	 Z1AgctD1bZ79/mRV5xXrt6MlSw0L9aMewHcT20qQe3R42nQ+dP7T6v8Uor7yidqsPUyFs
	 f+zgXvMdEK/GX6ktVQqY3H+zKOGzX4Sb8eYfb0T4TgoXN4Ikwy1kP9VnjjdIzX5yzQ89B
	 AVJtD7PNEldNjV4Heel+RkjiYkkVz/0KMZX/FZdcJRoiLClm2t3zI/owUZ2aFR3ABQgkz
	 zjRnmOcdDX6HEckptYUWcWKfNa5Mv52m6jKsvtA9dk+KC0s8RZ8ftaAu32DVqchaV0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
	b=Eo/47sN86c3UfZfqjKUDzcr6/KWvieu48akmsKdR0xgXKLkNdMTOn+Bdvu5ZggFW5g8b
	 cFa+9fxoMT1cFSL4Jh7PpUipjlkTlGbXnrDqz9kpvLKsmOPHsJq3J9idVxcOSZIFiZrZo
	 1hZe5qij5O+ohdDeLuv0uJ9EStQIeuBiZhhvY+WCRQPwY/poNC+4/ELQZYRPqAQsWvTZa
	 3vFAIBJ9ab2S78vTjqTcfhIKU6gzqtBxmFLp19bajb2D+ebs8n0QC04/VgRf2LiOJuvjr
	 6K6rTrXVChWgGiyYtHiFa+LyJAGNKxf96q03RI8ah9lXc3c+6ZPKSeiOFAmHGACAG5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=furl0n9h;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F003606EEB5
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F003606EEB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=furl0n9h
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4f699fe49b3so52719b6e.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742017; x=1794346817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
        b=furl0n9hv3AfBCJWZBPeQMseF/sjLJddQ/67YYA48n1IV+Qkk6TDED1J5ac5L+sWU6
         CHOlDo7v6NSLP5LWMIWBimRrEkQF/bs/Fx+GFiN2jzzpNZAhq+PY8cKbkNMt1xPNPkmY
         sAe0/PoLMwy+25KOqOGNcoZu9xnhOC6uM/o6/XYp0dijzFCr0bFs+293HK8KowZMTXxr
         09LHP+AMCkiwHwWAAoNjgvTDnpWfQJRzWtK+PfbknEq0uc9my/fZxYDTkzWTMxk2Wxq9
         HLczZoMwKvVBOU4MVMpui0Qomvggyi9hk+RceG3kG06Bx0/j+ObaL4W5LoBi6S63RsOU
         8UmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742017; x=1794346817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
        b=2q/fn2iAgGQLXwf7TiVSVaNPh4mJNuHvaIgAKKcUGRqbfjZHXt8HR1NV9FgXnNKsGJ
         y0bAFuvEnFPL8gT5fHI1nXA3JqWw95+LKVBgYn28Y77fMfbxPKSYVE3CRSnnVgs/iQ0c
         RaLaOWVcPAZmgj6OGzc6GR0vDR7d+2Ie4VxTjiD42FDv0YSCy731Zu5ZsiWNo3W+e7s3
         +IH8o8KMihvOfphKoZNe0G2C3bRAKCA6se0M5lZdr18ctM+lRML/GR1uhQmrlbGikwEA
         W0CfcYiB6hBAEJ5xU8NGB3tTazwyj/xmvUnQIOctAaF08E3Ou/aqgXVoy7LuqEFGsn/p
         xUJw==
X-Forwarded-Encrypted: i=1; AKwUvByloDDYamIxR7oHHOtn3CVtrYVP8H9xXKN6MSOniXV1bTTgPBDBZGb29kk2fPVUQ+uUan/AzjdGGXWf@vger.kernel.org
X-Gm-Message-State: APuU4Z9y2A408K36XzkGEgrugKvxkMe5ctanuq82djpuSG8ddjTGrNXh
	+3vv2wYsmRIUpzG/Bodji+OK9UmWm0oW+ds77iz6tbzkWU+ptoOvUK+Y
X-Gm-Gg: AYBFou3KfNpINKb2OlpKVNK4UM8+DrZVZUK67FhIFe1MMoZlzkaqnKv/Csr+ADG5B2L
	jpp1hFvp4WLRF+4txVc+ZCtw9zCZyup1dj8sVAfU/KP+4cfX9AV4h6Tzo6PeBzz5cdA4hgu4Agi
	2I4fy+YmZqrbZ/4d+yIQjLOyOlcCwZjLOPakuwb3p+6JHlyax42zN4LytI8kH2nb7xoATC4Mhsi
	mqiEYsj3MNFBiajAX3UxXkNh3GLfyAMqIW0meWfnF3AHZzSMLwScRVBDbJgS9USRMYxbyfP0OMO
	U3En7xzS6XojhRUjPrccKIe3LA4SReM4OzQehLX3RFqTsCSVsBu7XeqsFCdWJDZSFv+FDrCTxHC
	ZSuJmELhfMHRjvnR7QLnjPumzHAb8wXHGOBGRZf4MtWs9TP+GX1kjgnsZer5gOAFNGqaETMWQmZ
	UyYPbgsJgnwWzb9xLKDz70v29ZUXHKHL7RYtajmn1XDnWFU3L/2Lt7QcaxqXWMhp9jNzRCEEGLU
	7uAJOcJfgeUn5P5ddUFpwdPNu5WjtTl0Cgao6/bqxi1vpZXAbh2NN2k0gi427lzR2xtVAz079uN
	lDOqguvRsXjz8klclVN3FOw4Yz9jVTKYQv62f0Nz/8SUuz22ZhhUmz8y8L3ghdPPjbYBTN3nsqf
	cYjlFlP2MBFQU/seMa5e148XWa+FHC3Yz5FoOIo1Yke5kpKLW9bi43H5+Xwtz6KBacVtMkt/oqT
	6jSnfsf1ZWZUfjcXrfZ60CtPTx1ucsoqxKFipdCnIo97LjyrXOLUTJ
X-Received: by 2002:a05:6808:66c5:b0:567:605a:b8a6 with SMTP id 5614622812f47-567605ac3f9mr743665b6e.41.1793742017040;
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:04 -0700
Subject: [PATCH v7 11/12] arm64: dts: allwinner: a523: describe the UART
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-11-c9e248d685c1@gmail.com>
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

Identify the Allwinner UART integration on all eight CPUX controllers.
The specific compatible selects FIFO-depth discovery through FCC,
allowing the driver to derive the shared DesignWare receive thresholds
from each controller's FIFO capacity.

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

