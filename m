Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649213;
	b=O1pJ0fhTopi1iGi/l7eWHkm4GNkYarVniea8ZvEXNxSKNcXxoUdu2geAMXfeFKHegm9n
	 4OHevk+p3jXZnZfP+H/ggzF3qyf4/ZWkOmjqnKZcUqaUqoU/26XZXlTtWrhEbXo1Wn7Zr
	 tOy4IGAY/OHo+CodSvUOrapze0rj3UpX/J5xmFeuNOSjl8pguX4cgk46sZW8CQ7hBCBD9
	 fQSg+z80gkoXywlMAzJXxFmuNkm+Tk+aAM8qMEazIvEGT/4kHF0IBLSLHqxhAHMRSfOg8
	 XNz53ajeNqps/b5yVyNasYWvgEXuwpalI5cPZmTCOQdpsasDMHG6TxQDN9GIx57+CXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7f/afSnO15hayW9629dG+dsshQNBLmVWgINs1QselwE=;
	b=zMXQPNmz5bkHQ2v5Gr+VUAXSI4XynQubmu9tIVL05Gf/5GXYNpouQAIdre6K5OdP2AHf
	 ijEN7+CnKzBVV2B2PGJUVViDBYUSt/AAWigd1QdjRIDYPKEAQetMvSPopOxkp8WZPq47m
	 cEiMzRBoT3JkWlZM7g40kAxGNJrFawXI5k9HDns0H1Dfxdzf54WNJYLj0cZmvRiWFAOLk
	 9fEWS0NR8LOq/XnudyTvpbGCSpy7Nm750CVZKnKL8wnAyYdqqLKUMolN5MvfhagdLs/mz
	 LUe41+0yv4diV201JntdLgB9ovBW35kJJAl89wB0BlIo+TUsfXIagM7i7B9FnL0JgOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kbOaESfH;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A9E606D806
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A9E606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kbOaESfH
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1847815f8f.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649211; x=1794254011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7f/afSnO15hayW9629dG+dsshQNBLmVWgINs1QselwE=;
        b=kbOaESfHOMY626Igcuy0ZYezGQ2G74bCe9kqAXY9wKdCr3mIrmueBNs1OENJzuaLbP
         otFje8FX/hRf50lXxXqgnb7mLox1fb7sbaxCNnCoTrDVjzBLHj8wLactklUaQy31pJMl
         t8iePGy05xOCA6tQyO2rULtyacL2INXG1A0NSJApQEY9immEPnG0ikEDg1Prfwn9ohch
         F0fcmfwdC2Cw3BOXK4SpOx28wawaY4/aQtx5OzMHi8W3BfkYQW8dAR5ENIjzOZ3m/ERO
         69DmUbrbz1Hf+EcJMNa8H4LQScoK3WzDdk/OnRXLVMt6LlvOFRMwzAK3NnOxdVY4+zIW
         TkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649211; x=1794254011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7f/afSnO15hayW9629dG+dsshQNBLmVWgINs1QselwE=;
        b=lr9g2WrfLoC0J4yxZQ+uhZf8knARA9DecdVpCoM8uISreAOa7iQ0B+srEHv+4pixa/
         YHzmWtcnqGXRGHpBxbKLqgXjbu0kJiKavlIrJbKZPSTVleytMWj1RoMmfYW2a6c0I6g2
         njondgvslDRoVZlrPPy/cQ1ACRjnw8mP8D+yf83+4Ybthk2FEVParpcVr0+VRGuKJAlZ
         e2jGJQQtZP/PnSd9fRhhZVHuuicBW7UJvN2LdYhqgI9594UJXKjAC9LrcOBs8ZPgX3gu
         Lb2k7XinYNL9R09fYd8m8plMJ5XEX5fJrssgAPQT2GeoEyjtTuJVnxHB8q7bqpZASsa9
         MVuw==
X-Forwarded-Encrypted: i=1; AKwUvBxNo/5+zs/CdyeO+/3Xe5IyphVG2nwF0+y2bs/52UE5ueLLtKPMXbB+FHnMQQuFT/wtmtPRMyjdHb/m@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xt8VNb2PVrEDFOf7zPNb6OyiE34PJOrN6/gY9v1ij+wMecY30
	g9TDAfdaCTwAttXnuSHdxlRqt0zjiket1KiQgNclvwcEeUHVZNF7+BYgXrMAZ/lhnsg=
X-Gm-Gg: AYBFou24/les8GeGxcCc4HuDQD8ph5zhg2lnZW9rzBid1e59199L8nlyvIxAJJC+hRW
	prHb2JAUPZUKJU67huG54Og7DPcSv6v5Kgemr5XmVKUvKZXi1ZnTqsotrpOUJolbkuJIB0qbD1k
	lKyHxka15k4DqIUFVRUmje4U/Mt1jJXhohN91tNnnzSN3RcWkDMMiAVKQXomq3w16tEAh1fSe65
	4qEGiZMdiwl8PoBCN5miaDd4iDMIkZEHq1rtbIM3w+3rVj2nBjOJewGBDtY8HVp/bBSZtaIyKy6
	uzvCPSWXa44oUvaUSbPFbyl1C1wJjTLtM3t0Fj6I/9CbqfFQEwZxpT3qC2898QrLz2gFkLAHOKV
	bSWWOC9Pp2TYq8xZ0jyfi0ZkcC00iixNJJEsAMpzUj90FHpKnM4bdVAmUHpd9KiYv0kC0N7fu4/
	MHkNh+0BSDZ0hPPRW4KzKhuU2Yc+JkiTTjOY1vZApkLsdFlGFHFkmSiL2K3pfWVQp16cD4DrU2G
	ckLWAHqcl6hJyL3Lf3m/A15qtZN4oAkVlwD/mc2a/18JX8mDuCT+Co1DoFQ2am8PAHHMZ/8/Jq4
	rkyTheq2i3nXMELl1sLrjISNp53z4sIPN6pp9Y/Zj319ApS8XwDYvg47qLTYotSsmuzsdj5FCAH
	gzPC8ONWil5Ed4Q9juCLlApjGvA==
X-Received: by 2002:a05:6000:46da:b0:48e:73dd:855a with SMTP id ffacd0b85a97d-48e73dd874bmr15997035f8f.51.1793649211435;
        Mon, 02 Nov 2026 11:53:31 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:31 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:48 +0100
Subject: [PATCH v3 2/9] ARM: dts: omap: dm816x: use dedicated SoC pinctrl
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-2-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1157;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=fKPEsKCzv++RFN5u2bDuWS6LSClWwdOaKJr//P58V+M=;
 b=I+VJBZFPeuOC6dZiMIx+ofqumWARXfAbmku+/vywjiPGFscrrRHCMe45QSz37TGQ3hlsrboa4
 2i9XJN5sOURCYIyX0iXcOUjIyRKAHdlikFVLmW3aM+mjlyewJ0/KKqT
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

In the TI Sitara DM816x SoCs, the pinctrl configuration macros are not
identical to OMAP2/3. They are actually inverted between Pullup/down
enabled and disabled (third bit in pinctrl registers). Using dedicated
DM816x pinctrl header to differentiate between the SoC families.
This changes the effective pull configuration of the dm8168-evm NAND
pins. Tested on DM8168-EVM with no functional impact.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index ee0090f7aa64..261ebca8863d 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -3,7 +3,7 @@
 #include <dt-bindings/bus/ti-sysc.h>
 #include <dt-bindings/clock/dm816.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/omap.h>
+#include "dm816x-pinctrl.h"
 
 / {
 	compatible = "ti,dm816";

-- 
2.56.0

