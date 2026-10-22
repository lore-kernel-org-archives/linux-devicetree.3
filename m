Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693879;
	b=C9CzyE53vUlubSLvusaulA3nA9Yy4xDTfwvYFmsOzAI93lNehwPAb+alJUpTSknXCKM5
	 926ripLRpdYy5mHbpN5L1N7ggo8XcEtgl4B7ZbnNV/6f1RrB63MDlNPFjKjiN2+LgLxs0
	 9deuqHcmO8aWzcsJhl/ZxK5E4OpwLmaE02HqDun7r8aJunxl9Q6vz1qDFSKZ3Ih5/MupJ
	 i+6oXu7S6igX16/aou7sEtkOPJuaCFCec7G+WSKKnM3eXL/vQbNYT6f9S7gdxTH1mbpYG
	 GPjsmIyzYi54gB+sCQYRvZsmQmr0PjqwlwzWYCmZibvEkbanKGeOtdj2mrRPtZj7uzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=;
	b=clNvBFkZrrvEjJqo3OozBiai/dst6TKwrwgi9oTdsqxT7vip+YTfuNa7m6TyrF4zaKSP
	 uHzV9Mi14SPOwwvoiLcfGzJLGx/JmpoSxWUJEs4Ira6tH0IZjPxByOXHlqNfbOyNnCBkP
	 T3WgrL+PTl0/hEPXmHAMhZ5qqfNlk7RiLBoc9gXpmVF8udvapI9tM3Muwt0IjA2pxqLN7
	 wRhbrEPk1ItLkVqQHzM/He440z+CjEUYiqvvOgtU75XG0r146pMjbN52CaKGBWNVXe6qQ
	 yMLDD/xKrlyw0+Vj3S+7txPEiCY2gHdbdwFjwd42aYiRx2TsUBitpECAfos2Hoot+Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kPmO9+Z4;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8260A2613
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 18:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C8260A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kPmO9+Z4
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso797185e9.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693878; x=1793298678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=;
        b=kPmO9+Z40SjLwW+NbtNSrA0cV7duKb8LaXccOn99DNPGE3BGI00GBVHA4EJDThDhWm
         KD+59eelIZeJd5MMRynf3Toi0GuZUlntpXZbTHfcp8fZeyF4WFckW9Sxj69M5nph4M4e
         cNNHwaikPehm+wb15Dz4b8ai9CjXeHyhXuDWjcc52y/jh/8Taa6mxNmLm4cIRq2Nk61z
         l09sJy/9j2trmQPdMi94uvMfHuwP1KENO0GdQsvhUann4bhfaKGdr7vP5ixZV327VS12
         3zlzATUStLfc0TLcMc78unIygy0QWhtMG6DvHF7iGsxiCmI7noR6Hu3NHUxGdXZRGL5o
         SgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693878; x=1793298678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=;
        b=21E2ac5Qly/g+ZRIhkc58szUzgftBO+Yoq9bO6Etat8MqvQ96KWXpmP4u5TCcJPXp5
         y1xGctrP1EEYo2v0xHxFBByaTk/JkUYxObvmBiBMqHhOWxpxlABdPp0WauuEkcU93hIu
         2Aefb+w9j6oOqsmx1xKH3yQLrcJxtb1CnxTU/SQtLbNVhtJQoq5EYD1A8bEWVn0B2/sS
         KjKKxxKBp7pXSuYKNzbrGBzLc32nD8L1zKnipZ4sdsV5QSg5wxw6moxvt/h9y5eRG92A
         QeOcH3EJ+bIWHAxnP9ei0i2l6g97eiqeofRQ6Y9oE+x+CGNX3pM6vsjUNAkgJOtX1hwc
         C7hQ==
X-Forwarded-Encrypted: i=1; AKwUvBymqGy8pl6DZMUJspbXJEKfT6FRCqMUm/AVal+lAHJkBGRbii7h2+73dG5UTCi03QndVyEVsaw8G35Z@vger.kernel.org
X-Gm-Message-State: AFq9FYIjV9vWgFf7UCVbZn4BtAeImmyEWVxPo3QvJQ8y/eE4zHXg+7zt
	slbrgwcCM7DEDtj17rmMc/UHLbMpC/X+5ZLD7AUZM8G+RQBM21kB/6NseShcdj+r9mE=
X-Gm-Gg: AYBFou3fwo9wr1wDVmhkyWlrz5Td8zHueCKvpd0iEQW5inv4u3BG5VHrzmSHPZsfJMj
	iM/XLT/OBXx5H5EuKW13wEx7YOe19f511xS6CLePnE9buimD5JO7yc8ED7x2cEO6K+LA27MIod9
	XjdqE5UFcWkkL4PKP46318QRHNdaczl90JV4CdHrKxAt7Qmq21smUyk2cs/fkmAbBhcg30hS17g
	IOFyqA4aQ6wasLDzthFLvJDi/xcBx/r86ED93qMx0nHCqrOGDM5/gwDYx7i8xm7+fx7nPurmjIM
	3eV/Jh47wOseMjCYipIKpQu1vOJZXznULfCd7mcgvSLMsIY0GyrRepTh02vze67iMH3iSGKNzzJ
	TifUKlhYHr30XVIQ0ImuD6A35tsZplma0C+0HcbvAJ4erXegdcKflscrzYOMV5PdC6icpAa+N9v
	p7Woik78KpqD628+OYu2glbowCo4QF2rYly4zPrH10tDfnnJ+NLwBxR32qGyXRMWn2UDWyxIKMS
	sbf2qPDa8GK/6h952vACRvW6OjJBFR6VrHGHOJhYXV1AkNssNQJo9CU845RtV4jKXeHBVLJ6N1k
	km+IDm0bM04jIiH/LPyv/D7Np0rOBIYlu9RE4z5RkDg=
X-Received: by 2002:a05:600c:8b8c:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1fdafd5d1mr136430265e9.13.1792693877622;
        Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:27 +0200
Subject: [PATCH 1/4] arm64: dts: amlogic: s7: fix the GIC CPU interface
 region size
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
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-1-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The CPU interface of the GIC-400 spans 8 KiB, but the S7 device tree
describes only its first 256 bytes. The GIC driver then disables the
split priority drop and deactivation mode, which needs the GICC_DIR
register in the second 4 KiB page, and warns at boot:

  [    0.000000] GIC: GICv2 detected, but range too small and irqchip.gicv2_force_probe not set

Describe the whole 8 KiB region, as the other Amlogic SoCs with a
GIC-400 at the same address do.

Fixes: 1b753fcfcff8 ("arm64: dts: add support for S7 based Amlogic BP201")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 64440df4f542..89b75bec40f0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -121,7 +121,7 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x0100>;
+			      <0x0 0xfff02000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0

