Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421212;
	b=OMigbUMwRPnaSGAM0LKyhcdnm5G561m/uzm9pKbrj1nfSTz6+T2QTGwRm5fZrMnXHs2e
	 nhpYMFDOsUKAqhilkAYJtFDY+ihidCtpTtg3RtDI9jixyU9gdSD39WZlr+D7n+XJhmwtn
	 YuMljOe02Nk9Ktqr2K0OCrn1K0B4dqsm2uFDOEtVUUKl5ixk5q4YviFNdUeb7GdPQ0+b6
	 IXGyAJdSVq4uUy1Z3HGzdM2nbZqkPntxcHRF3suTML2IcbHI4L2pQK5vN3jNG7wOJ8DKj
	 bWfpjaCo942Ayx+Artq9HEXPWdYgqgJGGFkQej/wuSHvKPcADTiumxu8idVnhDRGNSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=;
	b=s4PGFL7mWJtN3Rq+zv/w8YWjPS5JKx1HIYd3gn9og67snBUGXE/zdTYyLFKcE0WmXFq3
	 Hj2hMBCNyDviX0I7f118jnLqVWAV9f5/kP7K3MVTH0/b/NySnM9+WokpmMaWV6stws8CF
	 K01STSbWXVMof9BQouXzPsIcrcieubHPmZB+51ku3rVMqoqrlpzSn17o6mUnIMOk4Sqj4
	 0RDXGJHKq9g2QrGXPOoLpZGif3z1ovD7gzYUaIRRsfnSsJmKr3Pfn9aTgzunAHuZsr0cP
	 D+SZdDn5DYgH5AArhkvkO7SiNv+IJd2ZfN+2qnQViVif0tROwGr+lAWJsJUtkRRJRmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f5fkMIlC;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8FB60A263E
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C8FB60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f5fkMIlC
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-820ff812cd8so875256a34.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421211; x=1795026011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=;
        b=f5fkMIlCcGP3QcFKmf983uDMg6thLNK+GGR+TEYm93GIwf9yQUlivy5bcoRIqE7dfk
         +taMz+ppiCNk6aMfhp5UAm91n7fvjMNmtA7tDdeo1ziFDpwROKxL+lAkEor3Rovu0aZF
         Xf6+lDU/2BiM5bPikxrUBCvfuH6Nd6IQ4uA/NnVHe1KbMmGP07UiXfjjwf+A2+6oECJm
         nB7KJ+qsgAnLu2KLPDsRME6NlZYcw0+/asE0iUq8de//XPvs569UENl16rm5QylCCxnh
         f1E5QmVxJeqi5I+PKvTQncwfS3rMdHAeoontY/EO3scu5+8J7I+BMl3/nHCQ7OOGik5A
         8fWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421211; x=1795026011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=;
        b=LFgf+V53GR0W19BLWXbftaolvxkq2FPPfVnoFWTl+BxQ3NcHjaVrK86mxZiyW2i92M
         saM7qgS0waQigGmknxFA9rDfMmnfhRIrYt2aKJfxlO2WnosZgWts5NvXnZjYFrtfXirT
         FzdtB+S6jtrYu2PC4qUg9aDR+Tqqwb9HUojei9//LFvH/eQ2vHZAkA5+J9oKpkLt/bGZ
         fw7sU0WR1zbdSPvl55A+DzAfF1hnZn4FH1TGOV6h6OZ/4F+7MDOrdjCc7673/KJ6qb+A
         cSgHc7hAgUssNWUV1VJywUau2mUCd7ys9IPoGMkBPorHOFbfbOnxn6MkxFoLXUn6Kjs+
         QRbQ==
X-Gm-Message-State: APuU4Z8IoeX0QPJxLHP52l/gOobLKHAMtIu3GFEPmjDcGFGgIYJVlRFJ
	6kmyrQRPFT9Wl95V9IEJKZdyvP7ImRr5AxJB2609JVlY8OM5quBX8g2X
X-Gm-Gg: AYBFou0iviuhK0Ixlwbl+8jAdO7okFp3KKA08tERQE0NrDviV70SRMLpwgINT7mVvkA
	UqkN1B8ETXLk+xE0Es+jHqSzXIRQA7p+X79mlMs+04Pb9/MaFe5E38iLlIdJ8sLYyHKpjrcFEUT
	0C+PGKA6EdR8wFw7MiIqVDw9XXstxMg+Tpf41dMtGIArHD6d1kAwoaPl6LZJC/XUDQDIXOnPgB5
	NnWSruQBkkW8sl3OuhLmmU07G7zNo1cTziQOLUfyN70XyLhy114y78veWWKv74pNloDSRHnapts
	PqZsmRlmJbw25iniQiWR+MQrePreNn6Lpxv4IThtDtOTjozqKrg+oMpeRP0mKRuukpU2+PjsCJc
	3iv/FJKTUAbBv5arJ+0IbFS/Ldu8dbqaZd0Jc0/ShSNk89QYM+wbk5+rVBlzPmU4skwiccOIZwY
	F72iKkr21mPfP8KKsDZXFyXntyUYbhvDQICZ/2j1u9xvDDTqWywuvgk3wrLY2FjIgYT3KZeVuyl
	n47MPjXJEXukssmcRhSxnZfhVYhmoDHejWLZQHyUxi/s7+FMQ5VutbmWtHNVqHL3HK02Z6eJ1Mr
	a5m3SujtDHID5n44HTYKBHK+RlpIAlHfDwWhO5ooYwNENRU+z3hvhOxCbjtGcZ93vmA/GMn0JmK
	+cqNYFKH38wYSsOeD59s=
X-Received: by 2002:a05:6830:410b:b0:822:527e:f653 with SMTP id 46e09a7af769-860f2873418mr3497542a34.13.1794421206253;
        Wed, 11 Nov 2026 10:20:06 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:05 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:54 -0600
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8173-amazon-suez: Add the PMIC
 AUXADC
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
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-5-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1624;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=HdWvFN0Bi8Q0rbvoIQxbOy8Qqy9TBXeblCz/hYCaNOc=;
 b=UvFfe+0GNgf41aG/dgO1cAx/OHNQZPN8YTQnRZRWrp3VGqS+hjyqshurUxvY6rTsopRdJ36hE
 4HIPzTzo7G3Bhra+u2cvMi769b+xIiRwgt/1s3ljGRKqqhzOF5zEQTN
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Describe the MT6397's AUXADC and the battery pack's thermistor on it.
The SoC's AUXADC only has the board thermistors, and the charger has no
ADC, so this is the only way to measure the battery.

The thermistor is a 47 kOhm NTC behind a 24 kOhm pull-up to 1.2 V.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The thermistor numbers were referenced from the vendor kernel.
---
 arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
index 7dc0d818a44d..07a1ba7539a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/adc/mediatek,mt6397-auxadc.h>
 #include <dt-bindings/input/input.h>
 #include "mt8173.dtsi"
 
@@ -87,6 +88,15 @@ thermistor-2 {
 		pullup-ohm = <39000>;
 		pulldown-ohm = <0>;
 	};
+
+	/* The battery pack's thermistor */
+	thermistor-battery {
+		compatible = "murata,ncp15wb473";
+		io-channels = <&pmic_auxadc MT6397_AUXADC_BAT_TEMP>;
+		pullup-uv = <1200000>;
+		pullup-ohm = <24000>;
+		pulldown-ohm = <0>;
+	};
 };
 
 &cpu0 {
@@ -471,6 +481,11 @@ mt6397clk: clocks {
 			#clock-cells = <1>;
 		};
 
+		pmic_auxadc: adc {
+			compatible = "mediatek,mt6397-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6397pin: pinctrl {
 			compatible = "mediatek,mt6397-pinctrl";
 			gpio-controller;

-- 
2.56.0

