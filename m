Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340399;
	b=4+cI62A+C73f2poAMZCGQ9ZBRUxfrEKpikQ1KvNsuUqlFtI12mhy8E2XgiegtGnEEwFu
	 ZXbbPXi2lxr0/gxH6Bw1j/YfCUsNpakby+xwHUq+ovkiRV8lVsTzQwyeSCuQWRBaAcxk8
	 lhlN2GjE16EobSNZfk1tLh8jzluS1rDb6r5CRngOgFO/x+8RSEr+l+Fe4pEXpIu1fQbe1
	 ZrP+Ufu5tXRhGGzNjuX6ml2A5+waQ51vW6JppdrLHx7gtLpmHKNhk4dMFMlvaeQOItLL4
	 GqKOjo7ZcVaQZE2E0eaDEVTtsyijW87/azkayKfJ+Ohy3z3FfaiNUbl5QBRqbOF9jmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bMjomd0jtFOusb4r+jQiPm04tLdqb5W0DB/94s0Gjp8=;
	b=jeUXLMR0YUA6K+3iRtq4H3CeTfD5hzgYfxAcNmcGp+V95AWZ33m15+b8mkJMTJ5lpUQP
	 gcxgmiG3rACPdDEPsb1ekBzLJBA076IJjkHljtitzZ531PlZ5laevUdNxQsH9wvRv290G
	 MlBoDP1Qytk3qtTk+UtfxQhaWsZbXfPhrMZSZi3kqbLVBj0Rdl2b25eu7Kq2y12SPS62R
	 lVmRb4iz6UMgJxTQxw9f/VmLR5w+3h48iZBXCBVrADPb/Q3u81fuSNBuG2kgXUxrSWvVA
	 ok0HgGzyH4kQAsUyU9tjPRfvc2i/oKUfw45HHoAVqxJI958rt/0tbaQ1/V2vjxOBMsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNmq6Glf;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1157606A320
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1157606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNmq6Glf
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37605faade6so74703eec.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340398; x=1794945198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMjomd0jtFOusb4r+jQiPm04tLdqb5W0DB/94s0Gjp8=;
        b=KNmq6GlfCII17HZE+AJjaHUons5D0oj6okIngpx/wla3vWVEXU5J9gr6TLWbCSCkNv
         0Vw+wgVtfmfckoLXVNaLvezuUTj87YqcDM/+tcgED8kk7TZAEa05Ga30rj0riDh+obd8
         vNqvmLLkqQQZCEgfwMcOk42iCUM5WeZXR6CPToOmSQ2qW2q8AWk0y+hxGHvM4thiJPHv
         DBpr8+lGdsG3sHWTvY2pilxDdGXQhJ6jGmqOmqaBolLw9Sm72No8hoDcbQK+kXa1KfU5
         6vk9zBIDasMCloANO3SG915OAxGrnGZwRK1TY/L7976gwnutBSXU2Os5f6x0KohUx95F
         BLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340398; x=1794945198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMjomd0jtFOusb4r+jQiPm04tLdqb5W0DB/94s0Gjp8=;
        b=StQa/bYZbW3kqdCDnLDL7QNJyfoT412j/E7o6gZpkJiunpQ9JkhqJrKa5LVfRbC+NA
         WG/xC+Mr/DNwSlfa+K4/F2J+2RitvDzkW4/AfxOFfU06Kv8+73D07+sfgV3ma0gNuWz4
         H1+gsyx1e/FO9WFmQFZIk9wctbUZJ5YHcVqLI+PnUpY0Ja3VB9tQWFaoD1293ZexUnjn
         E+nAKECZ3obviGossYV2RcAn+btmrTO28bwuhtoJrQbc53lP3pqd5uG2ETIRY2yGePhn
         0uEh/0xHbwhVWg6+V1IBMjVrIWurnB1nEROcSq681SHEe6BKUxYoHM78+hpAkpt93EJj
         jBYw==
X-Gm-Message-State: APuU4Z8E+EcfuFO1mUfZOZdT67tM2/sllhqlb7dLhfmKlILl3guabhUH
	a06zgOv/2e9108med4uf24hNHu1KzKyo/OgI2ctpok1Yw/FDB7xyBmDb
X-Gm-Gg: AYBFou0g2rb9nKRQJpKPuZmJXT5fxlWda7hijdnvumCc0QTQ/QUimVUQpAEjHL8jRtk
	BIjwFa/htw5ks03R6kl8k74uFlcN8rNj3vh5HVPJvAT2yunKBWiinGEKY0BbO6COIQpDgZWBuev
	eS8LkfQLb9lDjHy98zOgVwpQXGh2sdOshge5VUGaIjaJlPFz1i/+9j5mBHgQ1fvcgFTO0rPZJ0I
	fDlK9NQN8kWgUMdHf1af0VARUYRwXKIKGOlPF5OTECO/+LpPdzdjVC56xP4j0JVlVaGWgVC/chB
	9xem2+1Z5b8CvSE8eouMw/C01Lg9QQUGM4jDN6LmTwjnvUWA2IB3lV6cmcZR3+vO8MYNvN0QIVt
	6FAVxFHPIoc9aAWwOpg9D+ZEQB2rk5u8ZXPn7c+nAxOEsQIEEi8zfZBOV2SrCagAdxjRt3L0yTf
	g/LQkInfLNTYhRnQ0VCsi0t/2v/QjICR8nR7aDpA/iZd+ukdrNbZbRGsVx1gvAaMgI0q0m2tGZM
	lcjx81k7oP9n0QhRittwwBdo0oKLNyid5ImjD54zrLlpLpwHt522UULdj/wr6qn4rzqaeosxMUM
	b16zuNzsB38Tmd/VyG020xdoDxIRGUK6z1XK9VYBbcnHKZECEVoZ4FNj2cXx
X-Received: by 2002:a05:7300:f797:b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-376850ceb37mr593617eec.2.1794340397850;
        Tue, 10 Nov 2026 11:53:17 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:53:17 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:37 +0530
Subject: [PATCH 7/7] ARM: dts: ti: omap: omap3: drop redundant ti,omap34xx
 compatible
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
Message-Id: <20261111-ti-omap-dts-fix-v1-7-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=3535;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=BYon5LDCHp9dtQh60TtA5CEBqyx60kTVIJ4v97FVd/E=;
 b=S58DoGXGcWdkV+aVPGpG3paMqKurohdzVxoPc8uuX39+HJMn/z/MkBGIFLsYmSuooUlFisMVt
 MdTLz9HD+qOA9S8hyk/CD65Ncqg2ZT49bJWNAAQYTTaS1CPtP1VxCqF
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Commit 6ddf6c91e6f8 ("ARM: dts: omap3: bulk convert compatible to be
explicitly ti,omap3430 or ti,omap3630 or ti,am3517") added "ti,omap3430"
to but left "ti,omap34xx" behind. Drop the redundant "ti,omap34xx".

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts  | 2 +-
 arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts    | 3 ++-
 arch/arm/boot/dts/ti/omap/omap3-ha.dts        | 3 ++-
 arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts | 3 ++-
 arch/arm/boot/dts/ti/omap/omap3-thunder.dts   | 3 ++-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts b/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts
index 0c6f14963e5ea..0a32ccc84e932 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "CompuLab CM-T3530";
-	compatible = "compulab,omap3-cm-t3530", "ti,omap3430", "ti,omap34xx", "ti,omap3";
+	compatible = "compulab,omap3-cm-t3530", "ti,omap3430", "ti,omap3";
 
 	/* Regulator to trigger the reset signal of the Wifi module */
 	mmc2_sdio_reset: regulator-mmc2-sdio-reset {
diff --git a/arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts b/arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts
index 94f6b7931e333..e231209be3a15 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts
@@ -8,7 +8,8 @@
 
 / {
 	model = "TI OMAP3 HEAD acoustics LCD-baseboard with TAO3530 SOM";
-	compatible = "headacoustics,omap3-ha-lcd", "technexion,omap3-tao3530", "ti,omap3430", "ti,omap34xx", "ti,omap3";
+	compatible = "headacoustics,omap3-ha-lcd", "technexion,omap3-tao3530",
+		     "ti,omap3430", "ti,omap3";
 };
 
 &omap3_pmx_core {
diff --git a/arch/arm/boot/dts/ti/omap/omap3-ha.dts b/arch/arm/boot/dts/ti/omap/omap3-ha.dts
index 19e471eb3b4e1..d4d883f588eca 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-ha.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-ha.dts
@@ -8,7 +8,8 @@
 
 / {
 	model = "TI OMAP3 HEAD acoustics baseboard with TAO3530 SOM";
-	compatible = "headacoustics,omap3-ha", "technexion,omap3-tao3530", "ti,omap3430", "ti,omap34xx", "ti,omap3";
+	compatible = "headacoustics,omap3-ha", "technexion,omap3-tao3530",
+		     "ti,omap3430", "ti,omap3";
 };
 
 &omap3_pmx_core {
diff --git a/arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts b/arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts
index 1beefc3194224..c2b4c707cd9e0 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts
@@ -8,7 +8,8 @@
 
 / {
 	model = "CompuLab SBC-T3530 with CM-T3530";
-	compatible = "compulab,omap3-sbc-t3530", "compulab,omap3-cm-t3530", "ti,omap3430", "ti,omap34xx", "ti,omap3";
+	compatible = "compulab,omap3-sbc-t3530", "compulab,omap3-cm-t3530",
+		     "ti,omap3430", "ti,omap3";
 
 	aliases {
 		display0 = &dvi0;
diff --git a/arch/arm/boot/dts/ti/omap/omap3-thunder.dts b/arch/arm/boot/dts/ti/omap/omap3-thunder.dts
index c87956c59b083..a0cd06d4e39ac 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-thunder.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-thunder.dts
@@ -8,7 +8,8 @@
 
 / {
 	model = "TI OMAP3 Thunder baseboard with TAO3530 SOM";
-	compatible = "technexion,omap3-thunder", "technexion,omap3-tao3530", "ti,omap3430", "ti,omap34xx", "ti,omap3";
+	compatible = "technexion,omap3-thunder", "technexion,omap3-tao3530",
+		     "ti,omap3430", "ti,omap3";
 };
 
 &omap3_pmx_core {

-- 
2.56.0

