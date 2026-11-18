Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980915;
	b=CYBSbJKbjhPz/LqLKgcBVIw1I4qs/tfjaafw05ZOEFJEEoJgh+5+UJYzRh1NRvwnpmeV
	 W81l+aFtnPHwk7+5hAOsG/6PUju+wlkfaNUC4wzZ/G0cnuOH7y8CtcL/nvUklfPHnradt
	 H0lB+pm8RN8KmC+O99O4mJJkkA9bYPjhQ02x5xaxmhfrbpYHbayAJCpY7HVEVqjikEGLJ
	 mmtqsNk7lVATVoeBZ5CwTRKalqOHaEp8rT3ZirF3p3IMuItZLMViXVT4iS5aY0cZlPtP+
	 nqxz4ar2H5l761YUR2yXlHup4uQuuk1sRMo8l18qCpiLkeY31GtJo831Q1YPbBsAMqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ukXvWoFTjvnuweEWwqjwjRHSL6p505SyI8F2lDlJaBc=;
	b=OHdSPaor8Fw+UKmTmjIBBc98SODoBZRUXsp+DxDb8d/tMDkSC12LCNzsBw2eCK6Mh6AJ
	 /rYjpeNGHGI3iD05C02r1ffL54GC5NcllO3GUL/wPSZeESi9pU3wWwhbkDHRl0zZkK7+1
	 fIt7jlz1CMwmjrT6RN1UDktmL0bTRhXIEshrfH/dIBAp43jCieqnW+6iPxEE+PKd0ch3K
	 P+uuBZiXDJDwW89VIaSMxNmg0/btn2qQnbYACZ3/TtBiMni0HWPzgdzbtUEdEaPAO7y47
	 hV6sKR+IkMfQRG43BCS9rnHRKnDCbN1wyoRMbx23zYhhq6EgvwNhUwqSxVE9mA55Vfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XOt/UsJs";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4D606A33E
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C4D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XOt/UsJs
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-372bdb942dbso806290eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980914; x=1795585714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukXvWoFTjvnuweEWwqjwjRHSL6p505SyI8F2lDlJaBc=;
        b=XOt/UsJsWKbJxOR0DZMO26Np7RFPQEUyJKdAYLqF0+pm5XzlhJ0awY/qSThcXD4aG0
         VVd5EJ2er68oe/uobK6b7QFkfj5BDiqX6o7cxo4+tDQgC1fJK/S4iF4Ag4BwtZ4lc456
         hNjiO9EwpR/X3T2u7UzqzptOHQbyW8A/ASktRBhEJEhqwo/3BaOBdLsyvlEnXINBBN7t
         LnjlMcNVz/DJeKc1RMEQ9X46E4JBJIgfKdbuDIKq1Q0zvUiysSjjoz90TfDS59HAhJ48
         s9YK/slREN1pnm7fgDwfjNFTA1jZXPwk7H4e7Mm6rj7QJs9DYnFJjMaYGKxig4efMqJx
         44rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980914; x=1795585714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukXvWoFTjvnuweEWwqjwjRHSL6p505SyI8F2lDlJaBc=;
        b=ZRQoQ2AFKHpB/UEnm8j+g4gSCeClzjD4MSlgU/oBuBMX9hvw0UtKU+aIWrcAhsLtyV
         5iCQBQygWx7rWaSXmuQUJPzzkGYcuPus8fcMHU80TC3ONkr5tXFDqzDUsY32P9lmBc2f
         sCIMz7DCho3gM/qZV2thym8F8BD3CikbxjkuhnmJ5xeYJiPRtSNf7eEQPJhup6rSGy8j
         8u4KyxqYaPrSwSW36mEGg1iy7J5lOdlvDfm59OWGne0AgHH0jJUIpzYpVmhFvsg03QdD
         MGlidNeuR4AX72qhmBf0dooye920cu8nfBw5cxuN/4aKkTfgnFggObN4XPgDcWJnIKxj
         dfsA==
X-Forwarded-Encrypted: i=1; AL+hErENvfpIwoC+bL7g4llt640n2QjxsqgjDwyM0IJrJteihWETEAwUmsrZ2scCLepXj/Pm0xQmUG69/vPn@vger.kernel.org
X-Gm-Message-State: APuU4Z8N7do7mh8+xM63E8eojJKCy8pA9TEoU/0ju7ypyHStzEO2sOiB
	x4RKpsyfDKty9kiE+T8NRp9bkiQQm9KuQqfVcF73G8P1p1AUh5pV5IC3
X-Gm-Gg: AZFdTZce7WOZlwZ6rU4KBT6OvSQPQYXSAfzRIZkb7T6Omb7D5Rk7FLgAXu3ixq/w5Zb
	q0p9q9h1JQRoXItPIhMRQV0ynqrqxf67N5kv79diwlbwMKB01Ykjq1aBkaRm28uW5qLCefZ2U2Z
	XfOVMSyqWNQ6b3xQjnk5JgGastZZbxQOJXwcGMgAJ9HrJvnXlNy19mcV/0yhhCyeqqBV+dM43PN
	zg5yZqmAfH6OMp5EQONAKm/yJPAoCTjUi8PcIJx0sNjLzyY+1JkI1BBoVXws8QkZSMt/R5qCWU2
	pnWqs2kOkxggmuQ8thKkS+iDNzob8yKW5d2Mu3z6yRc7eJQwafAbqAv7PFCV5aHnjczS0kwUuMU
	hQpPTRrFactfuDmDRxLG4ym8MCniURfObCkOc7THyZvtmGVAhPZ7ejDe6E833DsyvHD403RgldB
	HNqTI+D4suPvg1axJmJtj/ImNGc9UHyb6Snw97lZcfP81p+f11p349a0YITglUCx4GZrNcuuVI1
	BTgbk9a2aBhEcODtuw88TXRtDpok4c8W7J+QTZPwCW8BUxbpJegzmZdCGCt9DZqPhbuVCN3pqkQ
	j0305c+qO7cO9QLyK6jm12niSP/3DSLa/mFrehMn52Gf2kvnYxTikUiDjUJLLDkerDxDhcw2146
	bE1Dd7MOAmsAazRxlGRE3Hvv8wPCMI0hy4X2vLUQF5a/shXVGOCDW6qR5+O/UEK72QUfAMVuFJz
	JYAr7YDynjDc2wD05AbUAXAmw=
X-Received: by 2002:a05:693c:821b:b0:382:1eb3:4c43 with SMTP id 5a478bee46e88-38281020578mr1654436eec.11.1794980913820;
        Tue, 17 Nov 2026 21:48:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:33 -0800 (PST)
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
Subject: [PATCH 12/17] ARM: dts: BCM5301X: Luxul: use gmac2
Date: Tue, 17 Nov 2026 21:47:53 -0800
Message-ID: <20261118054758.132233-13-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
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

Use switch port 8 as the CPU port instead of port 5 on all Luxul boards.
Port 8 is the switch's IMP port and connects to gmac2, which is present
on all Northstar SoCs. Move the nvram MAC address from gmac0 to gmac2 to
match.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts     | 6 +++---
 arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts     | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts | 6 +++---
 10 files changed, 30 insertions(+), 30 deletions(-)

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
-- 
2.56.1

