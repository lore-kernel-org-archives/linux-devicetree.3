Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17483DBD57
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091537; cv=none; b=HVLjL1laRhGTjAyX3/oihfgAnAXGLgWhYNshHTrfVaT92cDtAZHN24Sgjkyb7rxf0smfLprtMmXbgkHDV3lbvYFaXwOu/78ej2cK4zTHug7S7TB3oYNWBAkAbYYtunO8gWAzRVT9t9BTmfbS4QP6T8u7BqExF7IqlKvjQ0yh+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091537; c=relaxed/simple;
	bh=LqAkmileFaFZ+PhfyT+Aj8fUGsK+xd1jcx2cnju1kxM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiMIfi2W9z6BC/eyhaHH8Y1NVonUNXK4AdbNNNUOPl+3+2f6H7QX6a/tZGUxs+CVsOVL52Xi3zmozHQe5FphJcNOW/0FmQel15lygKGAy8qNbntraOetONwT/HohtG5ttKFa0TE6FWsCOTUS9rdhI4kx5STuSOC9kv8pyKi+Zbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxuTatar; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxuTatar"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso3883638b3a.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091529; x=1786696329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3MesJTCCNQlP4+x64Hx4yUyNd9X6ssapmn5zWFOTB7M=;
        b=fxuTatarzH/l+cgoqB2FVndIaTDWnoPg+TVMKyqixy1fTHJX3yokuV8qM1QtfTGDR+
         B/4V8Juv2+xy2X73WyHdkwVGH1Gs3bZyE2/s6m3RS7m7dsfEhi9v0MclsJxhSyF1SYMF
         KPjkDwTizLJkgcLno/2gmDqQfJ0REK1ipq3feBIa+nAJNkjA9bHH5k6hzI5XuzrUJWvm
         e5dSoyiyAcsPcHmz0TVYxHWVOOWLgz4C10NYo1caWVz54PofLIHZPNyRQMYvkDcspiko
         s+tYBwDTJDpTGPQrCXZ7zvM2ZC3N+ZO8tbTNgqyBtjErX9SlR4C6abi05KtbzBUkDUur
         CRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091529; x=1786696329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3MesJTCCNQlP4+x64Hx4yUyNd9X6ssapmn5zWFOTB7M=;
        b=M6VyVhEEoT1m1/DZIu559c6JbfRxn/HjJL+NZuCX4pXbUIcLs5kQCjebeDTYP/P7s6
         cz2k0buJ2tARs3D3dkmJ6exoJPevvuNGrZGYjXljJPABoy7Mlo+opmPXnfcgtQ934zAy
         tz5nxvZRhpfe3qyRC2fLzAQAw21Oof8YpBgi/R5s5FeemGK8nyhG7HgipESkNS4Jwr0Y
         KJ1gvLo5IoEvMZ/TQoxa5ppOwpvYznLYz+TVwArwH0gTgS+l6QDfzUcj5e45kwsm21oC
         bK+engC8dE92lQKuMWydrndbzPwDYXCAIM0eCxpLvdcLqNnMhDVGD1EyAPl8kB7bNVIk
         D5hQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQZlp+f3xhYdtUIpyAY5vlLk6A78GO88klGv/Zpz2cfL01FRwWqiGrUUM16RuVZ+ry5Rb6a1UndGxw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CZr80gsckrYiesW5WEE1GWIuadwIZFGk6dWl1pXsfuX9rx6q
	IJbZrTe4zKlnoETJwUMnSLfYvgq8imJb5M1apf5Hy44f1l7Hy8Dwk92h
X-Gm-Gg: AR+sD10mP7V7MPkVwLCMNJmth9ElXhjTwAw66WeWgp+Xj6aJDathowDUeIQXGzThTqP
	pYbIpcc7ezTBn6tZwZGAHXM499aLInBmc9LNJxJhVQNvp05NAm6pkSHUw/kkOfjgQzOHgH/r0OP
	4BA4B0bYb8KgjJGUc9RX80eIJr1hzdPdhWiQLkpts0bHbhgQTOIUEilVO19b8gUB7yudpVtT2If
	qJxIJU/t6xBW7a83ioF4HfB6KEkkojYEfkve9a6sCykN5xzzVgN3VeT7kVIgBycag594HpWx998
	PTJOEPg5QYjsTYZ8k9PJpAcMsUovrUMSNiaRtxEWx0ag3T6eIvB0rG+SIuJligWW5smVz1xEXd9
	wyiQh18K6j4FoNJbipsbuLH9h7KtkdS4S60CZyVj9WexXtqsbkF8VPdGj5s6auqxmBNRepU2b1N
	9RjMnLb84o97HgPPWR9aEI0OM2Y+wcNNULdosOt1w19XSaeMGKC4IHPQHIO/EGf8MPu/CyiNmcN
	xIBUSwXDYBXtzM4BF8K7NFbqg/eox6cqViSRmZQnCa+BuYIxg==
X-Received: by 2002:a05:6a00:3d54:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84f2e014151mr23029742b3a.3.1786091529420;
        Fri, 07 Aug 2026 01:32:09 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:32:09 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] ARM: dts: aspeed: santabarbara: Add leak cable present IO expander
Date: Fri,  7 Aug 2026 16:34:08 +0800
Message-ID: <20260807083415.672008-6-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a pca9555 GPIO expander (0x22) on i2c6/i2c8/i2c10/i2c13, one per
module board, to expose the PRSNT_MODULE[0-3]_LEAK_CABLE_R_N line used
to detect whether the module's leak-detection cable is plugged
in.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../aspeed-bmc-facebook-santabarbara.dts      | 56 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 3d35a5a74104..ca5bd805d975 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -641,6 +641,19 @@ gpio@74 {
 &i2c6 {
 	status = "okay";
 
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <150 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PRSNT_MODULE0_LEAK_CABLE_R_N","",
+			"","","","","","",
+			"","","","","","","","";
+	};
+
 	// Rainbow0 FRU
 	eeprom@52 {
 		compatible = "atmel,24c256";
@@ -866,6 +879,19 @@ ipmb@10 {
 &i2c8 {
 	status = "okay";
 
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <154 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PRSNT_MODULE2_LEAK_CABLE_R_N","",
+			"","","","","","",
+			"","","","","","","","";
+	};
+
 	// Rainbow2 FRU
 	eeprom@52 {
 		compatible = "atmel,24c256";
@@ -1106,7 +1132,20 @@ eeprom@56 {
 &i2c10 {
 	status = "okay";
 
-	// Rainbow3 FRU
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <158 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PRSNT_MODULE1_LEAK_CABLE_R_N","",
+			"","","","","","",
+			"","","","","","","","";
+	};
+
+	// Rainbow1 FRU
 	eeprom@52 {
 		compatible = "atmel,24c256";
 		reg = <0x52>;
@@ -1588,7 +1627,20 @@ i2c12mux0ch7: i2c@7 {
 &i2c13 {
 	status = "okay";
 
-	// Rainbow1 FRU
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <162 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PRSNT_MODULE3_LEAK_CABLE_R_N","",
+			"","","","","","",
+			"","","","","","","","";
+	};
+
+	// Rainbow3 FRU
 	eeprom@52 {
 		compatible = "atmel,24c256";
 		reg = <0x52>;
-- 
2.52.0

