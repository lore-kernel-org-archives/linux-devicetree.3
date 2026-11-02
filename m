Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649331;
	b=Piqk4Z6xYsiOWSemO2JgNORpMzLzW24K/toGhFnbNaj4UbvFqdmcQ4tNzYsYKXq3VtUX
	 wJh3xv/ESPu/PwEKUs1dEopvDoUlDqNIf0XOuJmncy62ld2lj0LtE3ud/aI6mGhZD4cOP
	 wg7dOg6FyiHBBS7KcC7hmjv8iFuRXGBIXjmgXOjopFcbTTQew3Y1e4T24bofnm+b72oDz
	 f3Ufst3N4NpVfCfe0sWiY10R8qxvvmu+N/nHV/+PUpxO3gZgCjXjLAf9FJnCdt+WmdZ8O
	 4oQjqCc8/iciEM66Gmz/rgPyypwG6NUrq4Ik8Pw/Q+4hVK/iZ61KVqsUL552/GT1G9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
	b=ePIFZETRxcU9y4BvaqV4k72y+6woQuianlOWEwD/S9yT6C2SIr05CWbw2cuwajWDA6Vj
	 1/gcEf2obw6GPPFSBxhl/CBMnRVxCQsBdei80kkXLRdPxnVFXRuE4bxswNZP+U7Pxr3Eg
	 iHB2ilQlhSIcOimZfwdhowETEawq29onJ2dg7n9SXMU4eHmBnoRXhIIrs5jpOCkKzHn/S
	 aiL3S25G+UDpS2UXWj4wzlNECk/K8c6xayg5oU47s4X8ZmcpaGybRikCsKYEwyI00/8sX
	 LyAVm6AgUeUsYH9E2dqxqeZvw1mffd263+aFrBcaF9rmuZEt3OiyNc2WKymFwn7vCPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/VHu2Zp";
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA276082BD8
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA276082BD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/VHu2Zp
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-43bf9548df4so3294314fac.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649330; x=1794254130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=W/VHu2ZpXW2zipVHX/rXepXOiugOQtCaQnYvpUHnQkWjuFZfbFX0eq42B5jR6wADzc
         h4YjznTb2sYaRbl5uNBwLJgB4U9u3WReakR5px2gq0M3QEqxD/svXvEs5Mf9uvy57UYj
         H+LHqnhM3vq5WsVC2aUXbXX0dBeTAzRHCRxOuEdyQAYMdesUNkn3EZfYgAJhdHEsMaTn
         LJA82YROAkMOcidx5K75HK2IR0HUUsj/8aPck/+3giSmxK3oMKYmJTwjYo7/x5Wx6YUj
         DAGa+SiPKyMyxb3zgroXYtOYgayiHnZnrDCBWKLwFFLOnb/5yeoidrd1fMzXm8FfRxgh
         KB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649330; x=1794254130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=yMYhG2TtAY+coclN+xUmrtNB1N+pU25QldMVmcjogfHd9HZGWPmRUzpzCuaS3425wj
         0rAy0N//NVZDnc9ZZmJO48pCM4NVbyMSV65EN86/PE9Br4nx/Qu9ezYh0Xr3VELFJdAP
         /v/ZQAlnjNdoDGpz4ZgIZa73MtfhrxV8ODSP689A9BDIij9+lerGXtyVZWyii7t+2C9r
         8p6R5hz17rM8I+w6W2kEzvShLw1qzJ/c1rioefsmEhLB/C8GcrtfhYmpLlJXHbp+2nCw
         l6ZnjpcZMcliZaGICnQMg/mcbzJMYYBlpNnYfwcpAxQzrq9FWUy5wIvZVccMv3J5opfB
         fZoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnFQ1O2JlMB9DYZxtzlh02QcvyN//vTJAN0Gs+tjPHtb291sEGCqFbkUJY8YmxJ3JdYkAUPBdTPrDS@vger.kernel.org
X-Gm-Message-State: APuU4Z/kyiR6xgczwhJ1862jY872cQhLBEBn5HnIQkGJZviAMrxDIQZs
	KiOcQxH+1kv5ghSJ+3fBDqVhRXbElnSL0XNoGLz91d4dpNEcNjQ4MtL0
X-Gm-Gg: AYBFou109RQbmDesySnVhVD34KZZ4gWghoJDRnKxDj4yu5ZENHtEN8RvuCvPe6ytpbh
	y/yl+RhySHvDj4eVNga4ibePfkycg+NOjxHntveqngF/8NQfKIp/a5YsyvtyhPPUd7Sjske6Ee6
	CpHk7zgpQTSAUUypQ9P+ccb7snWzy5PqYC2Pp9dAcH9JW6WbnOHC0+okF+/HXgvyt1EkGdy9Rds
	7HNTqObCxs3Yfb0dLAD4GNUJwndlZllAPbG2rLcQeS0ewlNjlLDW5duG/UZoPHGDYAT9kwEIp/+
	z/lzCSrIyA9BZDZsCrAc7fRZEY2/wMeCg80kFDLV67oAL3ll+5ryjqlDc872hYraP3sAQAaRvjQ
	9bx521bhkemSJYy1CiciqQdtHLh8paaOyHk5j1wIVU+GbG6xzM5OHzaNToYjTwMSLXSsue9EU8U
	SJAKznYDxtjn2cTpBCijHVIgcZ1yQiPNei65RgdzgzloF7wUqkP2GZXBLukWpbTDiJ/xmyUqs+g
	Kry1veAhoxqQBDr9842vqTjmuc9YxmRqqirXgD1X9fsTZ2JOwaTtIPaJW/Tjb2SXuMA2icruFKO
	JyHs4KUvYgcg2B5S/kZ2n/cjh2TsNb1m98vusmAJsjN9017UR95kKeKUOB7V4aYGLHMksTWSRxZ
	zZD9ZFcjeP2pSo40IUJP1Vz6VwI2QKSTiQoA7H4m2yJqMvIsRmrGTY3zxkHUW4MF1iX0BHay0qZ
	zDrucWTzi633jsvh/AsYCENmk05GVfpE80PXKvZLdE4D3Ev80se+MdbJJ/mI9Hkgdw3hgO4sXc
X-Received: by 2002:a05:6870:3d86:b0:4a7:4cd1:6f37 with SMTP id 586e51a60fabf-4a90764ba69mr6695598fac.19.1793649330169;
        Mon, 02 Nov 2026 11:55:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:20 -0700
Subject: [PATCH v6 5/8] arm64: dts: allwinner: h616: describe the UART
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-5-25afcb346b0c@gmail.com>
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

Identify the H616 UART integration on each of the six controllers. The
specific compatible describes the fixed FIFO capacity, register layout
and receive-trigger mapping.

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

