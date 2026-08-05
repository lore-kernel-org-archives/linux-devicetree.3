Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D633DC4AE
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 19:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956592; cv=none; b=BX5BpSUNZsBg2qPusADCqyPaEDNLV1BiGFOhq7DLeqizjp7IwRSiZCYeYch1KA1uwAG5HSte+L9O6sv7vl9ulC08OUu6W9lkQMZLI4FBI5GWYggzPvaNR3olgpCYSiDGSb53nl/2jAZNq9Wg8GNETmEIsHWfqCPT4gts3Ar3VLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956592; c=relaxed/simple;
	bh=bEVj1F5YOoIWVe1geX55iJ6cIwB4WA3FBQBbriNz0m8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBTrXdn8hLsM+Oy6J3ikKhR9HPEG9dcixmVlm+2XbZ3mzwL3DMepruEw7cfg5s8BSqXBvS3eNkA+TV5PhdmSnum1Rc8b9Z3EnEqXRKB5uQtsVZQpOFAIZGXKKhK0mjOrEE1dz6C4Dq35foUjOdPrwj4i6zyAnZmztL4tjXgwjNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpRrULyE; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpRrULyE"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84867f07d63so1648148b3a.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 12:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956586; x=1786561386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6Zx9MMf0Pg4/4OBtLDCXpT3pxD7pmCxig4VWLsNJ8A=;
        b=RpRrULyE3wEeZ5/5oYXFBF6J+ozttnUe7hk/feU6LjGDE0o0q0b7koLpj6h4jhBd8I
         zeAJEeRCwRaPp7nmVjZWSQZpIn2fs/kjfNkwKbDuAEH8tpVglSAlz2XNzC+FqazasDjU
         XbrF6uhAx62MYz51wXGnKlElQCOasQTafJ6DnC0nHBOmDC2brwxwa3J7KTvDalYxf3Bo
         lWDIF6kdzvEvpT2FpNkXunb/wXfpd5I7SEGYVPr6r747XL6tloKP5WmBww26H+GkXBsI
         KQ587u68iElup/Onqtt2Cfa+XSMpo46DlNLa9XmtA8bzfZCTGbad8ioQRWRoRD45p5v4
         Gzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956586; x=1786561386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6Zx9MMf0Pg4/4OBtLDCXpT3pxD7pmCxig4VWLsNJ8A=;
        b=aVyB54PdSeG1SiqPAvOqL0K2rLQ8Xw1nxXEuBHp6D/OsDuT1Obv4kdVoLx+w9f+SZO
         WpgmnTr3maaSUzikcQHbSEJ2G77UDwEvXcpnW0vC9kUygfC8kiqW7+34b2yxKLgqBUCG
         PyeeBetjP54rcfGvMYe2DVuB42jYd9rdd8pOuXYasE4zOo42VjEdzMQlXC7IjduBTgCt
         CdV0H+WQZIIZUFn7uooUbACVTCFMf33afrglDkOmU8QVnnkpaAHEFl0ySMPGpyrw0JRw
         8wwYxX/uF99H2ef8374XP539+O/b9mgES7R20fosA7BUbdwBXxTvKj034yYBO7kU3pSd
         hKqg==
X-Gm-Message-State: AOJu0Yza/RwRmjO8vMPe6xFnBa7YmliiJLMlevhqAXuBzm5YjbT0lO2A
	Tl4XnIN2Eig9qMvhv5jUK9SCTOEuNVPtgQ6xwSJRGTMtxZAv2UGfwa2CXYZtdg==
X-Gm-Gg: AR+sD10lsIopfZ5fih94yRMfgazwcHCc3ZoEuytYeNFniABNe/l/3NW7iklsSXi/oyz
	vqh2BryLmdVnXlwZPOy7fo4NNsncu8EN3sR/3AfGj5pXbl7zBagJ8BDZuFpe+ectFslt/JYLfJC
	DgwFmGT0tmHYlbs7WeF3Jge5rnLZA0lo/EaKBeB9nltq+XbVHCbxJBi2eP0XC3Qli8i+WyPeKLX
	/Yr/x+KboGRpkBkRNSLHFwbwDheg/dEii3/28jI+YGm9JQAbWYydranQNq9Q5ADn2MQJJJkdv1D
	cxAjBKs2DFQsbNdamtUk/61fPdAt2eszy3BXp/Gq6lWyS0hF9oQN/4HFiE6/s9HHrQtztrH+0N8
	WaNC1ZVGc9ePH11bWkfPCjF4DsVCOMdJn9pPALbh71uMu9Tk84uWvvkw9ZCV6nt9KghqrUqTemh
	hKV3YkrW8AU9GkwHEGSbDAww/hw/TR295qO8Hr0rKrFzznTJBtxek1Htp2RuIrEDlP1P6mHjRKE
	Jj1C+SkvoSMqRhuQsG1x+FFvmjPtoUQU3CMlMg/tYBxc14T1ADL+ouftYVEjFrX6mtAK+MgG8eI
	ftCVkFmIijr8TWSnZWyyNABoNVRR/A1LihdxRg==
X-Received: by 2002:a05:6a00:4fc4:b0:847:99bb:b6d8 with SMTP id d2e1a72fcca58-84f2e009b31mr9523653b3a.26.1785956585855;
        Wed, 05 Aug 2026 12:03:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e533cdasm1295125b3a.52.2026.08.05.12.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:03:04 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: N18U: set WAN MAC from nvram
Date: Wed,  5 Aug 2026 12:03:03 -0700
Message-ID: <20260805190303.7098-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
userspace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm47081-asus-rt-n18u.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 3854db0118a9..5472d7e13aed 100644
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
 
@@ -77,3 +86,49 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.55.0

