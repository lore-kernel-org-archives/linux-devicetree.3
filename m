Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142352;
	b=iDyw81UA+SXKBWuPz7V3SYD4q0ZM3FuKDT6YeaWA12pwxS8as7dd7us7IbfeK7Yufaax
	 z8tierEMJk3hecdhYvAIZOX94v/9PGDIzgSwmNPl6QmHCX9fnLPENHrGA5sl6l2eFrEja
	 kjY0rgqvhMLuji03epoYLacuIUTTC+X3vs5D0Vyrqy1JKNRfb1KHathp3WDzfGQF5dBBg
	 Xl+OfZrXG1+oeMSsQlEvUrrCnvvJiWHtlZOLThqo42YMgH7IKc/Pur/8YueT1BieWg/Ox
	 +j8SJAhsLGnxt02Ce3pnsjkAzawyndZhNKkNZ9H85L1ELcjBaQVXWvkOAOx2z/0wgXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
	b=4KQGR/s6k8+5fSH258za0Z6lGd7grnSQyUTUMhuiglKQn7GM3EyJwzc1+xHi77K8OfdX
	 KcWdIjkA0lZwhlPzyLFrxVcq9h4JIckjij/QUzj1SD/o8OELav6ZRwHish9xLLWB2xHVk
	 kOqi5nZTjJzTIUQNyi4O9lXGHT96ifVhl6Upi1cJa7cr42nvHezFddIbMpxF5z7gF4uDz
	 CMIqPkOLAUbttQzXmjYoNYLS4K4lveKhRpSn53MejlOakOF0VnjI8xOYTRCLYTTmywfwc
	 CFydluFyr6hj0YRJYyB6Mv3mxyovEtbAjhBzgG7TtAwpXAqV7cFnbJnHoV2af7ny9tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTwMwLy7;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0BE60A260A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 23:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B0BE60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTwMwLy7
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-84a2bea315dso269632a34.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142351; x=1793747151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=BTwMwLy795IxvCyCky+Pk7z72sJK4KBOeoJ42+6BedLYvg4oYFf+UuIbuHZeVxfPV2
         d7qDMlLQwwJoUyXj4N4SloDAXHaD/sMxnFnnHwmGm5SGzsbOhk9pSkMD7+EJaAF2meNi
         ZglQOSlLrUTmTSi81d9XrdJsx3nUArwdyvaQvpbEBTKEVuFpX8bSgEu7zf4SpyPw3O3+
         /blqviH0NHF55bmYVE8NceW8P+/Lw26dSFz7Nh8NyTIn6LKYBUW7HbLtXkjvWAcLIR72
         CrcNuhoX55IZHiBPKv85D4KL4Imuphy9RddAMviJkZCMvYtFNbcXvcF7WtoqvSK+qCnn
         GP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142351; x=1793747151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=mldsmMMeBc6j/oCMwzVYvChxmp3ZR0jyOL5OcNghc/uN1slMR/XcPrTPkTnYDYD6Kr
         2tbGpuPfKPRyZbp/9vL6MlfnjHNFm1R/p1oEENKhMF0ora2WDW2LoVOc8yHzf9BW55Hx
         +UujBiz+StU8kwV4mLqu4KFxbVdxO/zFdah/LGOzM4ERK3Ukm2VFbMo5e4QCshyPP9hR
         dbkmjTDq55XklizkldhpzpOB7NLp2yEL1qfgg0H6/XFSgJvOkoZb0oEdZVnNyUoDsRDQ
         qGBY5Sd/4EX7LKLUcyRmOVKuiWwgeDOdbGSFWdiSmxeOt+ICBr8V2ow0arvGHdS7NMkv
         zITg==
X-Forwarded-Encrypted: i=1; AKwUvBzxBEelqBMYv8n9yzDQb5h5FPDdKD+Nh3Tw/cIVjBQr/1hCo+D9kB1RokOnOgEqu5Z0tbq/b0XyuFi7@vger.kernel.org
X-Gm-Message-State: AFq9FYJzu/UOpv0ZYFOtRqmrYX6FQUhSgJPd4LD9Qv5A1wkRoIETcwCq
	AFaM+SUbQ6ORbJfFI04pjs5464lUbyHXWV22nDX3mEq6s31JEJ9mDD/o
X-Gm-Gg: AYBFou0Y2gDpv85QRwURidEHhNMDroZiRBQiL6Ao9shFvDRBMrHPSv2cLqeBiTnf1yG
	aTvAqXwPrN1cEKpzpVGl1KPEF95QEXVbqdLNVIlytzUfQ88f7FqeefB4JGp/Os780ea5KIbaIpo
	Co42Q6+2n3UEy/Oi6kCW+f86C2kXXVgnTT8xtPTvtsHt8SNt/p0pFMTUOi7XHi3j+h00g76Tb6X
	x1B4sPYzPLPd+ndpAdHwcmxXIjYiHBDPxOiVnx6cYySMwYiMrYG6kXJ3cnaxNlNkg7ErJXdxZZ8
	WVXAzujsSCRQDDh1wlZE56vmGq7J57WWr1M7ipYrYNJ9kL0ErUlhvDxn4dxD7dekDGzxvH202WY
	2nAY5B/YfGRPRP5YNTwT2kjvWkiIfbN1lhR7zVh/DqLGwMgZGosUQLdUEiMyUo/PX6ipDYCJXJw
	GUkEEK84RNjZ3r/kk6mivkyTjTkbjyOMh8tZU+ChqOYp0GB+yZ2kaGoYshpO/Bkzm4W+aToUWBk
	3ONJ3KvvTMcXeaPdpCM5BIg0T5MRwrxecaVmgkObP3N7Tob4jPZLeyqYvRshnhq+ptP3FSu3mcr
	PBMhLW4sricqC/NYyVQCW2RqfshrYmiwWJPOf0+TQrsHwoG/DLa0nNcfBDoMQWHLO104j0q21y1
	ugecV3mFmLuLfQYLf5XWXkSsfdiotAfZs0wV3NL4AqtpbI0ONTUfKYnQ1tqjriSO5iPZnpQTDvP
	u2UA==
X-Received: by 2002:a05:6830:2406:b0:805:8b7d:d8d7 with SMTP id 46e09a7af769-85abf964f20mr834577a34.7.1793142351612;
        Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:33 -0600
Subject: [PATCH v4 5/5] arm64: dts: allwinner: h616: describe the UART
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-5-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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

