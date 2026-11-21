Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220827;
	b=ThLk7MIr3fLDzArvG+3eS04rE/IO/zO9R0HLRl/sa6Tm+xtfro9L5MDLeT9wTUv75KHZ
	 IxMfbQBTUe2D0FSrasM/tyY/yw2fIgvxJmcP01LcNUzlBnkSQ04doKZz1xgT0VHRoDIdG
	 Xc1jjZFbvldIF7qakSq+OdiMgJl/r69/+4Faa0wLdXFDYnrUnS2XtzhneQiLw6VaWDy4o
	 V0O//LMa/7dwyuCM1OMQ2+SccjBVpzAFzgzY5+6oTbMEs6e02jvy2rcRSSUSLJ1qQFqy6
	 5S/Fmon6hpmU8Fs+H9Oe/ujGdVv4vpE0deSKK5jzrbkZs8sww7buGmHjhc4FV/QhUHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LYx7WQ2dST+Wao6Q5mfg9jnAzXBRpmGNPpjAkBgVZCY=;
	b=M+3G283UFYpAWTo0Zoea7im5sorV5Ev/vYS7ACBEHWe+FQU3oj7LemLtmIs4hKGAA7AO
	 iRkfFIjYPpy89zjvCbsM8RI9e+upna+4gUPKoL7NPeJhsUP+NebKJHEEzRY53FKKAdCk4
	 U60N5rnTwtBeZ/w45m1pX9eAzEu2CycGK8bxHSzWukHaO9bPjhzlkjwdydNoR7quNC7Uw
	 ewyz9JsEXxWMQOUAvUkwHcHRw6oBiCmK9rqbVQAIFJXYNt+WB2RS0XE8QdUoUO1GuaZ4E
	 9TzFkNgBVXLlHK7qKbnW25k7cSiCWgPxPj6oFXP1HMurqQ7lruSKJ7hCkWCwQWvkxew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHNBACky;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1C606A6A9
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F1C606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHNBACky
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso700953a91.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220823; x=1795825623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYx7WQ2dST+Wao6Q5mfg9jnAzXBRpmGNPpjAkBgVZCY=;
        b=CHNBACkyqKLHvLBcJ+eQAVc8HJnmtwiqzJpdWExtzcb8DIQVHFrAVTzqlvugp7c2gL
         snyQHvlnD+leaBNmg+vc7xHSzShv90f0mot6rCGXfSd5640QkyzhDLiR57EmrfwlJvRm
         Vjnhc5HYvEAVyxfR8UaWIC9waDNrZZZ7Y7yiBTiMRXHH8sL+QMBYOg5oo+L1+d/u5NgB
         dDNLmanfWl6+wFIVlsiW1p2xGPGrbEcg/wwIK9s5KUCe1yMrRvgSK9Ql7uQvSZOaXLfv
         SRfZiXv6g32oFyZKx55CC/gYWMnWqiy6tsNtszsO84zYwdO4nZR7hb909Drg6N6Z8paZ
         rmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220823; x=1795825623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYx7WQ2dST+Wao6Q5mfg9jnAzXBRpmGNPpjAkBgVZCY=;
        b=BwwmMrZIcwQ32KCwHomLM3jEnPTv+FRmWRUju0WchMauCYySIoW6aiQ7iGCg/02vNc
         AeUKX97PD9JR5e0jAJuWFqZflKus4/QH6mPt22751oqnDQWAsWQ7HtwhzdhEufIQySwW
         Rsvq0/n3CvJVX/0EmtY2ttHdkLdvyPPoLQY4MFQTCn0cDiHiSoGhqzC6ppbQeJwph7x2
         BthEOXzGfQSbbm5miLQzkywJgjczj2RO7h7XyPB7zPNaYsCxAOHqd03Ttfs1BPYIrpVe
         wmyoARnLQnAy7OzodKFzcMRt+NUSJyMPeE/4Y5Pa1Q+O5tqeYBBvbF1p46mdbuVxN0Mf
         mn7w==
X-Forwarded-Encrypted: i=1; AL+hErHv2S4uxzoeTa6zreiwgYnaAMCn5q/oHUtPNpeVTzz4FBxFpcVYtp9fM7EwtqG01y2HdIXYo7xtsqa3@vger.kernel.org
X-Gm-Message-State: APuU4Z+35vNtSCW48duN0hnQ2SwvBXoRs5loTSA1eBV5TJbhyCs8j8aG
	adf+l2pCsHSTPqPzSg99peMH9gHN3M0wdmyNg1WIej+iqiPU8jICQoDt
X-Gm-Gg: AZFdTZdNTzX5cBs9ZtwZTP7M5R8QkK0n+W+z+fKLc/E9Q3eVf5FLgSgDfu+yr1VG+9s
	Ad/tEIonFM8brKxW28bSNbwhKv2SoDwiZRiktjqkQiNq994OYh1w9ewEDeXPl4zpMmMpLUbbdS5
	yNOvRpwXtgbOFWNi1zkhtprTP/+GP79qXA8OV1DrQaKANvL0dO3HzS37IJCrxp7H5Lpl9LpfNtS
	ttKk5QMqSdG+lOyWRwsKw5/xw2uuWFLAR7oaRvicXNCRF7L5xUVLGKj4VgJurVChOM6NA+qgpSb
	DBZxtBIgyjJaJ5CYd5TepS4OHgqSYH6B598Fk+sYF0G9vgsv4ga/lp86snuUBomt2V5N9e+6Z1T
	FfCY8qAcq8Aivy169n5wM15c3CgaIhvQQscU1I9t4FRKyQB3jjxcPczxSqP4HVjsytD7Cl4s0sU
	nd7p1ZrZ4VrFs30iKLWzP4ub+cp+iRByGzDty/7rYUipcDzqMiE/+IQzJz/IqC+Ie2zo2MTbhTG
	u7DBLJkl7DiK5c3uFX/IgAgHxiJ/VNs3LbqGKGFHDzA8zpnjkXUaklBX0v+VhmNHwdMSwsPB09P
	5HYLwI9guAOU57oHI0bVzudMRnuKRUKgnIfNfXUKknb+YNfNmMmX3VmGoGnA9Yy7Oq71Ac7sF35
	z+pbdYWfoBD2gMMGysXDg3TXJQ0ESRpoe2JptJHadlj9J5W/tVmmqrdYeNagK/TskP8TJwhP1G3
	yM1w==
X-Received: by 2002:a17:90b:3d4d:b0:3b4:691:d073 with SMTP id 98e67ed59e1d1-3b41c95b0c2mr4589920a91.55.1795220823173;
        Fri, 20 Nov 2026 16:27:03 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:27:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 21/22] ARM: dts: BCM5301X: use gmac2 as the CPU port
Date: Fri, 20 Nov 2026 16:26:01 -0800
Message-ID: <20261121002603.25254-22-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Port 8 is the switch's IMP port and connects to gmac2, which is present
on all Northstar SoCs. Several boards with a single CPU port use port 5
(gmac0) or port 7 (gmac1) instead. Switch them to port 8 and assign the
nvram MAC address to gmac2:

- AC87U: the MAC address is assigned to gmac0, but port 5 is disabled
  and port 7 (gmac1) is the CPU port, so the interface that carries the
  traffic never gets it.
- SR400AC, Luxul, R6250 and Meraki MR26/MR32: port 5 is the CPU port.
  R6250 had no nvram node, so add one. gmac0 got et0macaddr through the
  SPROM fallback, which gmac2 (et2macaddr) would not.

The Meraki port 5 fixed-link only repeated the bcm-ns.dtsi default, and
bcm-ns.dtsi already describes the port 8 fixed-link and links port 8 to
gmac2, so drop it.

Boards that use several CPU ports, and boards whose MAC address is only
known from the SPROM fallback (Buffalo WZR-600DHP2/WZR-1166DHP/
WZR-1166DHP2, BCM953012ER), are left unchanged.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-luxul-xap-1510.dts   |  6 +++---
 .../dts/broadcom/bcm4708-luxul-xwc-1000.dts   |  6 +++---
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 18 ++++++++++++++++--
 .../dts/broadcom/bcm4708-smartrg-sr400ac.dts  |  8 ++------
 .../dts/broadcom/bcm47081-luxul-xap-1410.dts  |  6 +++---
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  |  6 +++---
 .../dts/broadcom/bcm4709-asus-rt-ac87u.dts    |  6 +-----
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xap-1610.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xwc-2000.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  |  6 +++---
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   |  6 +++---
 .../dts/broadcom/bcm53015-meraki-mr26.dts     | 19 +++++++------------
 .../dts/broadcom/bcm53016-meraki-mr32.dts     | 15 +++++----------
 15 files changed, 61 insertions(+), 65 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
index 72e960c888ac..3375b234fc9b 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
@@ -61,7 +61,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -83,7 +83,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -91,7 +91,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
index 750e17482371..26ac2f2ed5a3 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
@@ -68,7 +68,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -86,7 +86,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -94,7 +94,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 2bdbc7d18b0e..81c2e6652a27 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -26,6 +26,15 @@ memory@0 {
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
 
@@ -83,6 +92,11 @@ button-restart {
 	};
 };
 
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &usb3 {
 	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
 };
@@ -120,7 +134,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -128,7 +142,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index 03f4a6d37a67..60661dde8ca5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -128,7 +128,7 @@ &spi_nor {
 	status = "okay";
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -161,14 +161,10 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
-		};
-
-		port@7 {
 			status = "disabled";
 		};
 
-		port@8 {
+		port@7 {
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
index 0198b5f9e4a7..2b152115d03e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
@@ -61,7 +61,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -79,7 +79,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -87,7 +87,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index 73ff1694a4a0..b5664216dcef 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -110,7 +110,7 @@ &usb2 {
 	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -146,7 +146,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -154,7 +154,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 2fed02ebb1d7..4114c6eda1ac 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -71,7 +71,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -108,10 +108,6 @@ port@5 {
 		};
 
 		port@7 {
-			label = "cpu";
-		};
-
-		port@8 {
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
index e374062eb5b7..00aa28a2e70e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -65,7 +65,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -105,7 +105,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -113,7 +113,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
index 3a33705c2969..04420ebf056a 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
@@ -59,7 +59,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -98,7 +98,7 @@ port@1 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -106,7 +106,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index cf95af9db1e6..765b74919fcd 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -65,7 +65,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -105,7 +105,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -113,7 +113,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
index 992c19e1cfa1..eb4bdf8c9c7e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
@@ -55,7 +55,7 @@ &uart1 {
 	status = "okay";
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -73,7 +73,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -81,7 +81,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index 4d0ba315a204..d5436d70ecbf 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -105,7 +105,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -145,7 +145,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -153,7 +153,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..64d3634d130c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -76,7 +76,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -136,7 +136,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -144,7 +144,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
index 08abfdc63d18..890945a5690b 100644
--- a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
@@ -58,17 +58,17 @@ &uart1 {
 };
 
 &gmac0 {
-	status = "okay";
-
-	nvmem-cells = <&macaddr_board_config_66>;
-	nvmem-cell-names = "mac-address";
+	status = "disabled";
 };
 
 &gmac1 {
 	status = "disabled";
 };
 &gmac2 {
-	status = "disabled";
+	status = "okay";
+
+	nvmem-cells = <&macaddr_board_config_66>;
+	nvmem-cell-names = "mac-address";
 };
 &gmac3 {
 	status = "disabled";
@@ -137,12 +137,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
-			fixed-link {
-				speed = <1000>;
-				full-duplex;
-			};
+			status = "disabled";
 		};
 
 		port@7 {
@@ -150,7 +145,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
index 45bd27906f29..d6dc448b2849 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
@@ -104,15 +104,15 @@ &uart2 {
 };
 
 &gmac0 {
-	nvmem-cell-names = "mac-address";
-	nvmem-cells = <&mac_address>;
+	status = "disabled";
 };
 
 &gmac1 {
 	status = "disabled";
 };
 &gmac2 {
-	status = "disabled";
+	nvmem-cell-names = "mac-address";
+	nvmem-cells = <&mac_address>;
 };
 &gmac3 {
 	status = "disabled";
@@ -178,12 +178,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
-			fixed-link {
-				speed = <1000>;
-				full-duplex;
-			};
+			status = "disabled";
 		};
 
 		port@7 {
@@ -191,7 +186,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1

