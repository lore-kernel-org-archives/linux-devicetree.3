Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1BD3B2AA
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158812; cv=none; b=sxIkzj166nva+d/VaLg2y0bYJkH1FI8lSyW+XO4LFiBhXlRNSgtopyGKyU4Nl3Szg4N5wkAq4GJDAd2xREbjUL1DkX+UZiDhO/iINRlewdhvr5yNyctGTJxmbF4EbsrW7tE1pPaVNBIVRhDfZArDCM92C90Bh5Mb88fa9omfT9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158812; c=relaxed/simple;
	bh=Ek4lxIShcSyB0pd0h/GUygXqYS185zwM+r1cAebpYe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0vuHLBDGj9eiQ/icTtkstTBsLxY0kwqRAuXiB5icSOQExb99T7520rMi5fFVTL1VERNGl1KTQH2covh9EG7k+we0v+kMQ3ZoCLV/c+Fi9011Tt1GzTXdwZ9crQ6YnQ7OS8mLRkKzn21dm9Nc7CrtA+7AQwhDmPRjXAp/WDPy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7X/9bzc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7X/9bzc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceab75934dso15677955ad.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789158807; x=1789763607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcoCt3NplqcRzScaFBaJvGWmYj7kzQK/tDyE+wQSVG8=;
        b=Q7X/9bzc8RS5dS7OpsMpqittsnkdtYFD52qkpPOFqKMjgw9hB6XP25ESHARcld5VWB
         DRL4QDxVmrtMwlZs/w+ccbkG8ggItkpYD2wI3fj8lt9kkvkkcv9P2oXlDYseVy58JHhB
         dDxyMFy3W0xwenSv3e2T6MqetXO61e7jJDjSvEAs0BmpnnMlMEh/xY2Q+Qg1YYds3FV2
         uCcsisJntcQmo6FsMJMFdpBb2twyCn8Q4hIcS0oItlw38RZDpm5mS3wJSWKYq6ImeJhC
         RJEeck8AbXedTrB4EconuHNSAY0x3U0QqVJ92At9NJBI/7MttFOKd9ovXHMLrhFZpoQA
         baAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158807; x=1789763607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcoCt3NplqcRzScaFBaJvGWmYj7kzQK/tDyE+wQSVG8=;
        b=Q/Ned+imepRd1qC1a7l6vqcYkBxgDq+bXBgD1dif7TT3P6REpJbOqKmfFEmtTYnsIa
         PAz4v3yKa2hbl1uNl8udmkvH5yQOYB5glWv2qFJueSjFGso7ziu35KaNB4bgNlBBCMst
         RN8+E2jOKUCX3tiT8C26dB2xNWTJpMwCYvC+akQTjRDbtoNc8pvQUjZ5EnDvocLXdCEE
         e07WuRo8eDVzTGa4+eYUXOoLZtycmJW1rInZ+d1xAp/1nK0/Z10CWPoLxk+SEp8B7vcf
         Bhqf0gexWSbwpQwCFoXYk8aN66jWMWg7rmp5jgTzsWPWEzWzJ9L2jrnsbAOhyXoXfjuO
         QoIg==
X-Gm-Message-State: AFuF++l3qB/QjtwO6DjEIZYq6HPJCE1OkJLY9lN4TQ4ehD8S7rJxvDYm
	34T69OHc1ou7gDPYQv6fQzlp6kzMOXaXgFYiPy/e0i2rUrv9mcJ8CfzMUI9ICQ==
X-Gm-Gg: AYBFou2IdedzC1BxoZMXRilGKNmSP+b8qaOwFm8BbqqS0j1NiSSqVsv+q+fr6+4TIfe
	NY47MSkYH5nP4LlQh3wBqfWCwtXNI1xVt7N6Ts2pQifzomxbxRqSNNH5WgKMwrz9BJD9a0QuF0b
	0eUE00tv4PXW4ehUjf/AEkk6/BQYIElj1Ab8WDtWVv8oZnu6dsdDXLLDu6QEy596wb/6WuR0beM
	S0+sBGHatvta0R9Vbh3ofxKoUIm9QSbW05J09Dt7GxN+6vAAco97dFehSAgW5bCBWF6H9n7AnP8
	gn80YsK9MQ8lH4EHMufy7FZb4tpcYbYTSyW+O+3XO2zQSSl3FCH3mYES5fbdX1nTQnNK19j43GQ
	Mjgcwq/GjJCvu0fk5cyQdFFurHilodpJQzh8dGX7oEVP8JBZUqS3tOBl/4IWUm4onvpOU9Zz7wb
	zulhuHpw6Fe8L3MYJZN9bT/zf16cK5DGDhMZk4NTxtQGB9K2YM62e8bVfSXMX5uKfju6l8DanvS
	xGOH4YKjdBHU5oG8uRqsEODFExuJC2hfERtqHoLvBDpe/lpuNuG5pgrAGdxBuYkpk8uYipQwpo/
	i9NInvf6LkFzJZSPXiPcRCMhk1i1P0Czu0yvmo9wlw44Wxzq
X-Received: by 2002:a17:90b:3c8d:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39d9bbdbac7mr10334495a91.5.1789158806647;
        Fri, 11 Sep 2026 13:33:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1879699a91.1.2026.09.11.13.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:33:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: N18U: add nvram node
Date: Fri, 11 Sep 2026 13:33:24 -0700
Message-ID: <20260911203324.104422-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set MAC for gmac2, to avoid having to handle in userspaace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: set gmac2 instead.
 .../boot/dts/broadcom/bcm47081-asus-rt-n18u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 3854db0118a9..5874e6b606de 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -77,3 +86,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

