Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A163672A9
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 07:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238329; cv=none; b=kwlkRhvu9OMpewEGkmENmX8sYBItWOQL2xWeQTFrKywIALAg+MEC0K46jJCN4nAnlIN4KcfDw7uLaoCpjwj3xW6n8DIbChkeUb8oJa0AHN8VqT0l0K49nngWrBhWqqCqRso8/HXeU7/4L3I+eda+x/0X9ourYCCGdC75qyYkYVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238329; c=relaxed/simple;
	bh=Xsqlm+rF7jIXTcXnCSKMaVUBX15NQaxokCbcRbwJDbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WCoa1WXys/P+6qzWkOw9ebbGNRuRZl7WPGCQRhnGYVSq7hmXNp6vtz9/iEzbyT7WhNzKRzvFXMRAuwbvdu6dFYUzUXs19qtKDCiVnRxU5jv2Z/Bmz6f8MqBc93jWnhxxcNq6VDiVtdmvchP673DbMzB3tEXkpWqOzbXvhI0CvVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYGdJLAR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYGdJLAR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b27c7451so26531025e9.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783238325; x=1783843125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UY6T/viKs724YCtcNe87O9J53G3jzdQBIfSFXtvLiY=;
        b=hYGdJLARmwxCbLPEIWM2rTWsbsaHXjiAF6n9sxu6oR9+ZmVlcAQhb0H8gAE8/xSpw6
         4d/ZgTzE4FG3VQrZnSixkuVxv1A8rICCKEEVnhecWRYPlhlJ67ECL4GewCi/y8Y2kA2+
         xUkGXVv9402JLEn7qJ3hTjfBgjNr2/wrbIMk3q2LfapAWghiL59zPPO+ElaAgE1+CJcy
         bs964wiwxz2eVDQPqO52lpWHqEWya7Bzyj8zlnotqOwXobWjDmDm4WWraIOrqDs+muzC
         5KBlX3TJSHTAIFsBvuzatpJsbYrnsPRIY+X97xFZCOhBmtHXrdzc/nJ9o1n11BBQLbyo
         D+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238325; x=1783843125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UY6T/viKs724YCtcNe87O9J53G3jzdQBIfSFXtvLiY=;
        b=BmsG6hYICH/7NB85iTov8o2r6Jlx1A/OVVV/2oP2P0RQZmoehZmwwFx73rcsy1mxyt
         dr11CuF42IOXS1WBJkz/RnrFaJhslqfI6PhvtHirHOQ4hj0wLKep94TgLq/l4KSuoYFq
         drbmzyvN5wH0+ZnsaG9diXVs6USif5aHbm480mIrmbP0aqwyTgUJSTO8QV7pliPniM1w
         jlLB4mDXM6Feijumqj9WG7ak39Zvy9sV/2fEEzQfFp5e6Ecvfrm+pJlywWkz2udlVKB8
         6V/LfzH5GahN6YQGUM6AF9TGMc1e0AO9e1INjcdLfXG9+UhKr5MhberqGU8KxJbKP5V9
         CeSg==
X-Forwarded-Encrypted: i=1; AFNElJ9auAaA5+KlkxGx5v3P1i1cihyRu1Cx+3BlLQXukKRaniqe/HeLlRxJbqusxDFP53fbnzH4fe1f7kWo@vger.kernel.org
X-Gm-Message-State: AOJu0YwL4x7LWWu/PBxzSBGW8v20wiRFust0qiP97y4it5fq2OPaNeBA
	pbT64Pj9/z1YxAcA1xiu9Hq8P+gEWGaxCulhAI571lA/KoT4kQaPSx28
X-Gm-Gg: AfdE7cntcM0hrODIoyP7ZjPmlZ/0iKpnse3ObS8CPE420JJoITawuCtUVRqMzlt6Tf6
	rYjOMVPU7gIYcYKQA/m9qgQV/m0immy7XoWiMxonAZ6M3EIbj665GQcEeLCXGd4MBpYKPy+FBC/
	QfPbRTsKzghGnIvHBV9mElL+BUX4oxHz1eRWpg+JKegoi3QTr9y2rig8hAicswMBySBMTpC/9V3
	v0Fd4EazzLnVMAX36MApZBL5AiQ09EoKbiINyN+Pfrp8GuW4BHuLzqjz+xI3dzdrusRasbjawBy
	91xPStz68skLBp31AFnv9QaCF+t2yuYwt8mPX0kLW3XgNKVkYUViYQ1L9hQybhZISIbyyF5rHmV
	x4LJFIsugHt6A4rWeJ3x/jB3GWo7psKHJ2ZQFRODcuL/dqXTaJiDICON5pw1pTVUM5JjR0Z8mbi
	HPGFYFF2GSaUe/JcYH2u5Z0ZW4/6I3P7HfSw==
X-Received: by 2002:a05:600d:8444:10b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-493d159bae7mr37777895e9.18.1783238325038;
        Sun, 05 Jul 2026 00:58:45 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm305769765e9.15.2026.07.05.00.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:58:43 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2 3/5] ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for CPCAP USB PHY
Date: Sun,  5 Jul 2026 10:58:07 +0300
Message-Id: <20260705075809.1793784-4-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
References: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the CPCAP USB PHY interrupt mapping to use the charger
detection interrupt and corresponding "chrg_det" interrupt name.

This matches the driver and binding updates for DCP detection.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 6b1195c2a768..51a858021541 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -125,11 +125,13 @@ cpcap_usb2_phy: phy {
 			interrupts-extended =
 				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
 				<&cpcap 19 0>, <&cpcap 18 0>, <&cpcap 17 0>,
-				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>;
+				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>,
+				<&cpcap 13 0>;
 			interrupt-names =
 				"id_ground", "id_float", "se0conn",
 				"vbusvld", "sessvld", "sessend",
-				"se1", "dm", "dp";
+				"se1", "dm", "dp",
+				"chrg_det";
 			mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
 				     <&gpio1 0 GPIO_ACTIVE_HIGH>;
 			io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
-- 
2.39.5

