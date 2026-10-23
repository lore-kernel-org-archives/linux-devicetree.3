Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740843;
	b=JLuis16dR3lks2B91GSthNHfC+z1TTQJBiu8PoIuGnDdEGskGyH/n1xMUWzJC+42p5lj
	 X9Zicum2k7AWcArbQfeIPBYS5RElEwsHO6cqZvzRyar+jDZvMMMDQ33fyb93yGMLnm+YA
	 NlJweds45wVzSjyVAC/Yq+C+rmNUJOkasRfBTi76H9iPEUYbWcudkrhFnx1AqGSuVaYwU
	 y1qY7cUjL2SLAEGhMbPEgDFsP55xZ1POoGeBDXE9etNQ7Y/FoXL9JR/gjhIq6KcKVns9P
	 r34iaepgiUGA6wpAwpHAQTK6X+xzWeq0P7lwGeW9bSpNSyz77aXr0JtslM9gzw3P6ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
	b=bQrjMd7Iu9Hm0Q+GIe0rVS+dED0OTxnOlAa2IJM8GvCsQCx0lGkxG9hCjdGKgmQZqhSl
	 +VcvsSsxyPMZ9+tas0SLUDMZPhdXfG9iVgbOw7C6CVTfBWfA9ENM5XXT7FsKPnbygFSv1
	 52QnG2cDKwYSLLoW9lavb4Nig3i9kdOojvyz+JOxuyLx57bz78Gk8111tT44qyh2LhvoT
	 2hFMDKUxWfiW6rIDEyur89kQ2m6v5zFnxxDT9Z5toE8hpD50C3+GIWMaXZ8EKah0K9pj7
	 IBouswKAXZvxT99yIwpdOhYqvUH46j+8EJkNrA1Db2qGC638Jyzhq2IkHqXeshIPMFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AE+5UgD5;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2E3606A33E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A2E3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AE+5UgD5
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4af81963f35so446656b6e.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740842; x=1793345642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
        b=AE+5UgD5XLmund89M9O1VO1HJzardo2DXQUzwyptN++zcMGy12TXIXqAxCCwIvBzzJ
         Dp3S2aCqBjIDQhLAMjRR1ulBCzqKMiiAt5eTeaAvU3ky6iB4k+8lR5T3wQmcdUTzuu8D
         AIwf/du+/mq1+p53YUS7iHJSK2hPdd5Yj0ZJnjTvx+hxwSv39IsVwJYS+B9Rf0zZ7I+u
         nV9eL8e3upF+441sry0/P9AN8XRaJFlsoL7dnKjLnMerhUHWSPwErL2YRlNSJUscRnE9
         FP8KDdo4TpKlvJBj83bJgD33SXd9c/LH8lhMYe4U9b0njue1S9fvNQZjSEUJhqxTsKZ5
         zUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740842; x=1793345642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
        b=G0K6qY+X1LfONlBJnLl7om3dOWXzvEJjctohW9/Z0qRovJvvq1Ojv3lpNX6cHgcIy4
         /ZbRvgENi8BonTpwSJmb66wkGmZFve/XkLIrNzSYp1boyIabk1U6SRcffeBC32rtVRqQ
         sQYQuFzKacpKBwx/a/Tsrg+EwsWwQtvuL/VCc77tZEw1BuASQGxXWec3ULqWWJ682qBj
         yOow8p8dcs4H8fiTIvMsB087mJ/Lkbf+BFEyu3SYzpM+Mo64Dv2AlGkBJz0y2rXrBunU
         WrlHaSYme2VJscK0c52HUndmdLRqA/ZnG505q9QjxZljY6vdRVc+Mhoe6z+lpXuMXxlw
         Af3w==
X-Forwarded-Encrypted: i=1; AKwUvBx2jtOnMRg6c+VdNGvPZoQbfRuZnSFyTG3dqVovoi0vrC+4LOEFeMQLYrhxfCroPlRoUkxeRmOQK6L4@vger.kernel.org
X-Gm-Message-State: AFq9FYLGkWsZQqXR+FZzGjq4LlpTkoKR1FXe64WQnReXnBPBODdFT3VY
	OJQP6AVbZ3jhVlmMBwld7dkaMy+XJBQ4FgHJvcwsUBEpUKUSo5h/x3ec
X-Gm-Gg: AYBFou2Cl6X+2HwJXXO/OJJLnTUB2CdzmuKEOHLGExGsEX5JGDYgIEkqgVAf7/Saez+
	OAqUfSiaTxlNVgoYuVuRZCtI+t0arJuteSdPNH/S7PwdH8J5XeWGeYGycQ4zJWbsjXqhxqCzEJ2
	SwyVGkWAerxkz4S6rmbTHk9FYGrdoL+o0L0/uBOryZ2OZfhy5fmgzWtWq11pZdYXKk3p/tm2OK4
	BNZMFdYPCa7tAxsIFkqUGOekWL9lBHbp6AvLP9HDdPAAJkFWz4a0xte+KQnD+/HdsqEIXSol+uk
	OqqEqBZ/Yu31peqK8Fwbo5P26MPOzozdhA6F+iJy/5Unw5P4pkSYNt1irUGzxT0pZPmlmRl3Su7
	Bc3+XDWeefzt1TOCNWFmRARwazZO7bZhIzBK4nrV/rFo+qCfKoPNNFctb+ZdvHFgv9TdxMlODgq
	iGsLwRmmp3Ox95kiek+MN5t4I/PRZqQsbX+XDNeUVTz8EjMF0mJbMLLToRPjFgWbKW7PiJj/jUz
	a+HToQiivykJESNHFsElclW/Qx0Ku1oVxin7hjCMoYbaTbEqAlDlum26arsaafQJLU2ftHexF7+
	l8ATX9ujFxoS/ahuLuXHXg9vXbuKMsPMzfXq5aoBIby84Gl5dcV3evZjmtPZ58AI3LOQjLAlgIS
	89dGsz4yoxbw5TQfWyhJHM457b1tDedEXnF/3asqyD5QedXCeNWxfxL3a8aB8OSmgNvfe8CANKQ
	Jv5Gs=
X-Received: by 2002:a05:6808:5092:b0:4e8:3707:d4cf with SMTP id 5614622812f47-55be7a45f4cmr859576b6e.0.1792740842142;
        Fri, 23 Oct 2026 00:34:02 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:34:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 01:33:51 -0600
Subject: [PATCH 3/3] arm64: dts: allwinner: h616: identify the UART
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-3-e4a3bae2eba8@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
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
index 1598e86259ab..6905c9eaa249 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -538,7 +538,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -551,7 +551,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -564,7 +564,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -577,7 +577,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -590,7 +590,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -603,7 +603,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

