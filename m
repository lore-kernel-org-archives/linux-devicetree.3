Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D0D43784E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509485; cv=none; b=KlVxUi6iMmUl7LuuYsdD8ce2f8oXFTlCAJO14fAl/5cAViRk/GurXEn9C5LaPkj0CaxjxkRlYge/bNnei+cNrkAtDRwR+rjih7T1UsZ2mfFQJi9H6tb4FEurT7sB65UaGXuCa8cgfYlDARvLdjD2nVOuRaC6IHEnmfzjyWJOObQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509485; c=relaxed/simple;
	bh=OHh53Z+dDBZ93A60zd+H0Xey0RUcchyzj1Bze3fWvW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZkrmjoZcW4KoCGsvKwIPffGsgFD/mtDZwjyIqgPlDxQIj9atgTZKNIlU05RNNI1pGjb27ihkrSb+grRamtqaRvOaH/g65ZEShQytSDGBfxU6NafI4wR6qO+pAb0I9GvcJJtaWByiOr71DQ550YNhY7WIE21tltV51ZWeofh4is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=n1/LvCF4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="n1/LvCF4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-474560436c3so514995f8f.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509480; x=1784114280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egpcAQdW/SLTTZ7EKezQRyQCSwkm0Zu7f8FvgmBPrNw=;
        b=n1/LvCF4CflI9e+UmMNlcQSqwlFPSaJ2neypRr7cVdHQlD3477uAZ+pKQrDYiZtHQo
         XzDdaF7pb/4Zb7j/COu9BW5cIofbl/2ryb9zXDzyxQpoM62ZiVYxxy6PdzeOXlVpHKV3
         8AM//E8yfaYr4qkVwOT74PxNv0/nS1hwT+j1PP87JUE8SMC3Q80LI7x1GJG7xLk2ND6d
         mAuO3b9yk4q8KIevQv7F29r8K60nN/BulvWgR7lcPraaHsVxQvqxYTlIlWYOEmsXos1O
         610rEgAvs7K7q8TSGmc9DcAUYaMhnSrUHLwe7kEW9t/m3jN9oybL/1MRkrffKkzizpiE
         C/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509480; x=1784114280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egpcAQdW/SLTTZ7EKezQRyQCSwkm0Zu7f8FvgmBPrNw=;
        b=brO3ip9ZQQ2aXwXmgG8yAuc1aWm8IqrtnCucM8+GgdU2PipB026EZiiMcznvxRARHo
         RhDsfMZR6SzpWH+g+32G8x4iORt7B5hfhQNROaQEyKAhftkLvjzW76mVtoTFcjcF+How
         3NdLqJsqEYbVGkWsKEFBXSZ7ksOcdR7sL19JZ89ZzUcyZRPrqnqILOrvB6ZbuXD7N377
         0341cevNhURtR83G9EiMCDPoL3NJfSerp0JtX53YX/xZNlj2JtIjMLADhTJG8pmCI2dH
         xT+43ScRqQRnmvMW4SSOF69iBNjhVcvaMt/RmLFH8ApUOZYKvUbHDeV3xh4+GDrXbQbG
         wVMw==
X-Gm-Message-State: AOJu0YwWpkRt22I6b6OSbtssYB+eXpjf7Wbs+SsplBUhtfHKDe3iykAP
	MGO1Tm43+WSTUyI+svb7WLsTujUYZfCdG8PSc4e/B3QH32dyRpk6hk4v4ozcslOdOmY=
X-Gm-Gg: AfdE7claYBBHkooWOrVsfZO3B05zKhQTQN+nofI17HMpvjKczu65tdpL0guIVMMG2+b
	Wq6TCtkzhFZmiPDE29MK9tYX6FFpwDiZHmKD8XQwinZL0YoEVMo8Waa3odLDyvR5qR0e413xNg/
	HWpiBmnDyvB1pa9F0vmfs/C1HcFylc49Bkp4jeBDi8Or8QHP7wmkCy2MONLcZwJXYlJqe3qNSut
	pIBy+490t9TOI9Dy/OULRvDeTWLq5zFmT4CsWT+bvhUKpWeaCxb7SZR9r8U6CcDDzYoqmbZLOhl
	/ZzKVIK6mM5ZT+31fkI6jOfpFxhi7Lkh0v7PlDrNCFZcEaAhgYk/USnIZ2hgOjGX1rA6TsNvn6r
	5XnhMR+lJJzrBkBKZs6Ro7SL6jy3H5PJNjGetNPXJROK0INwSls3PVHQ+wZvCqQJEj0Br7VtkdA
	jgudrsOEIbp2knmeVJWv8WyZ6yhjvD83vBvNHuGBJ3vwJMbQeKgvsJ3sY+WLJ8rdiBMUwWox9pT
	vUUf3VX9pyvnOPNnA==
X-Received: by 2002:a05:6000:290f:b0:473:c18:f2cb with SMTP id ffacd0b85a97d-47df075637dmr2204598f8f.18.1783509480468;
        Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa (host-79-16-115-126.retail.telecomitalia.it. [79.16.115.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm37867694f8f.31.2026.07.08.04.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:59 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Wed, 08 Jul 2026 13:17:40 +0200
Subject: [PATCH 1/2] arm64: dts: mediatek: alias all enabled serial ports
 on Genio boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ccaione-genio-serial-aliases-v1-1-bf22229e9383@baylibre.com>
References: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
In-Reply-To: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2

Only serial0 is aliased, so the remaining enabled uarts get first-free
line numbers. When the console uart defers on its clocks, another uart
can win line 0: console=ttyS0 then ends up on the wrong connector and
the boot looks like a hang on the serial console, depending on probe
order. Alias every enabled uart so line numbers are stable.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts              | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi    | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi    | 1 +
 4 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index a30ee523b0b5..c535de34dfac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -24,6 +24,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..26e24431d467 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -33,6 +33,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcm1: backlight-lcm1 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 888248a75e93..51f12328a1d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -17,6 +17,8 @@ aliases {
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index edc5539bebde..86e487fb1832 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -22,6 +22,7 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	chosen {

-- 
2.55.0

