Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776711;
	b=Lh2/kIu1daojM4tWpfMR91pf+FjF8/9H8vyuEjCQFB+B1Zg8y1ZKh/bjgu1V2zVz4xZl
	 Vhx7aVKDcs7v9Xz9bV0kcD6Z/FH7IYtAJGDik5p/IXc25EoJ/yvCuI8vovm72cEISWIig
	 Q2cG13AjFVEBGvSRE+X9ntR812JMHWQa9v0PfyzDY1+JnEQfX0AjwTeZd5wZw8jzFh8nr
	 LsCbD+jijX3ckGjvSVxiEB09SqbpasVHKX8auyviD6IodrTb7GrPZe3WRumL2HoVgVEXO
	 2RRoeSUsL7L2jNJaq7J1niMP0SKHPBwmNUd0enqH5xITWjcluDlAb0aTFEtNkLpwKKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776711;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Fzl0oyVY8HdO2f2gopQnUusCPK5GOiAXm0J/YDDEE/k=;
	b=k1JCUJIynj7KPOwzgILHr+KhNUu80hnhUk3mnBPEysvthVLyjYcbht0+A5bvbAfh7udG
	 3mbWxbai0PG5D2iGWKe10Ke2ySZuuFXxxIipyuF4UPbBb/vDWvg5cItjYs5e9fDk5RsVU
	 d2IA88p4XL/YtEMGQeQyODyd2RbULfscn1mmb5crT79FEfZ7gqZ1ROJg47OCmFjhKpL0i
	 odfNva0HKg64yYemWnCw88ckLCKr1PmI4HZVDKMfcKgIjq+vjj1IqwMwJG84ibLWzasCx
	 QqQCs12ETAHe0tFdigjzukzetAbaVklGPNc56hv5VomVGDkL/pWNWaP/b8EYYqNxGBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=L+57kGiV;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F183606A31C;
	Fri, 27 Nov 2026 10:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F183606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=L+57kGiV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=DemZHg+T3C3B9LDCwU8us8KoLCgLerwBeIzBCB3sr48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L+57kGiVGjUYOqknPXFiLDp8898pVpV/usJ6L0trWxp1tnEMBrhYrYFVcWJh+nOKm
	 NZcAMwN7vsUD/cwWm1cvwwN0reuuWEc4tpbfNB2eDB41+B8Kzj5Q7PMFuD3CJznWAe
	 21VP+M4wAjIMjdDxoaRKhMcogaovgWMnBGKPG0WKWmIPF5rfvjHB4TA385ntknEccu
	 8TH/NGNl5aYb7lnEeCpk8e2mRM2RGoTBSIXWA5rYnvKZmI4Mrsv6FE/OzucZdQXzKU
	 WeOJn6zJwc6T6TSujhFN1wHOq7jtKZ5VdJqIJ6qOVq+RWHjptojdRUB43n2yw56taP
	 ZC8mc+DcMKWgw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 464ED17E052D;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0728948002B; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:38 +0100
Subject: [PATCH v2 01/11] arm64: dts: rockchip: Fix USB-C DP AltMode vdo
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
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-1-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4858;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DemZHg+T3C3B9LDCwU8us8KoLCgLerwBeIzBCB3sr48=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMNdzdp9QDLmYmSBjuMaZ6ZQn1ZA4Xdh9
 a5LPwEpwi7H9okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qa6rUP/06esQ8rTCYb4n/CAi9yVO10JSrP01T0iZ5MLpoAgLZA7XRmZzEHeH2JVERyUn+z07E
 R0ta4VhIUaUvXyGVUuXU2jRzLLGWzGlWjR9B/YWlAFPsl8jOVc4j1bmxW5j4ER0viqjAGn+ujsw
 mVycVIKoslQTxm0cfcVfz4oU2eKQjOEonYg7Z/5mewhKnwzXoPly/5EdSUaY4MkXmS4GaaQQvLR
 F0D01SDh7zCmuo+rJNWSUNAmGjlND4lzHaYVOFnUOlNOL9dk0/T3UfmRXlrrqC4j5lIMr6V6yYl
 zf4+gTpeOyr+WaDIOYMQRx+GQKCsHOSRly0xg/26TQcOEuqaCIous4yf7/PW79YNOkd1DqdsWDg
 tGb6BQGqINsYKCMQ7mf1ko1rjEVdJnCKBwGe4ixil9qrITrClL869Gp5akJEB29hH6CqPXwaZPL
 pWzIBdg32npqC7ngcpGGSbCScD6Ugc0ebNKmPj41NfZpqSI5jgvtJInaLhTiH+4sNYT/+ThJLXe
 mo2IsGTik3hQmKBOM/VNNHUNx94u6ISgeXr8F0yHODOC8fPFTIOXzAevwJUjqH5uxOR6fJM98y7
 E4+Cn98+Ale96ggDIEaZlct/9cVbXlB67mTV+0sQ9FzEgYrcLvyoA8j8g9+CnBRFs9iNtStvYuR
 gVoAH05eHgQz8jFv1R6MsVw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Set sensible VDO for DP AltMode. The new value is commonly used by other
boards and dissects into the following:

  0x0002 DP_CAP_DFP_D
+ 0x0004 DP_CAP_SIGNALLING_HBR3
+ 0x0040 DP_CAP_RECEPTACLE
+ 0x1c00 DP_CAP_PIN_ASSIGN_DFP_D(DP_PIN_ASSIGN_C |
				 DP_PIN_ASSIGN_D |
				 DP_PIN_ASSIGN_E)
  ------
  0x1c46

DP_CAP_DFP_D: the RK3588 and RK3576 only have a DisplayPort transmitter,
but no receiver

DP_CAP_SIGNALLING_HBR3: HBR3 is the limit of the DisplayPort controller
in RK3588 and RK3576

DP_CAP_RECEPTACLE: The DisplayPort interface is presented on a
receptacle (disabled bit means plug)

DP_CAP_USB: This is not set, which means USB2 "may be required". My
understanding is, that unsetting this means USB2 is not available
at all.

DP_CAP_PIN_ASSIGN_DFP_D(DP_PIN_ASSIGN_C | DP_PIN_ASSIGN_D |
DP_PIN_ASSIGN_E): The USBDP PHY can handle muxing any of these

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts          | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 4ac849329ea1..85576a437f7b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -922,7 +922,7 @@ connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
index 72ca49ec3026..f6ab189a0578 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -205,7 +205,7 @@ PDO_FIXED(9000, 3000, PDO_FIXED_USB_COMM)
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 45a4489863bf..48e5ad169722 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -712,7 +712,7 @@ connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
index eb5d27bf2004..b0f262599cc8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
@@ -515,7 +515,7 @@ connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index e8a3eb33e402..0cf6da8d8f1c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -348,7 +348,7 @@ usb_con: connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index f212453686a1..c775f82c0624 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -394,7 +394,7 @@ usb_con: connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index 73f8e3f1750e..b0b2d6fa73ec 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -325,7 +325,7 @@ usb_con: connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 

-- 
2.53.0

