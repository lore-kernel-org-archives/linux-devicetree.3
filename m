Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655737;
	b=sWHTOEJEf5E6UPquO5IbQFDOLX28f+psyt2YpwIP8YuYr1a5kZ+mDiSqb6VO7IWaU6zf
	 sAU4yxXIDUcI/39Pm50zDg0cK1HTveNUfZYGqDl5G0GjhsY0O+pqX32C+5GZAfnmhkc6e
	 6Rh6C5oNFMbYGxkeblBSW0eafXCWyUb8u2zB9TYm/ADgfCGtgCgTBuuV6SgN9v/o43oI8
	 Dli4FmQVJBDePaLwziad/WSiXIRASnwrwgSl/KNXOMNqMumvAtlbQawVWqCoSEGLASB3i
	 lcl/V/n0LxdMN5hJ25tqjL0eCgW/Li/wHos6xqtvRkDyqkIUvgsY9RLPPpS3TwqH6Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655737;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=KoxK088YlPuReWqLtjay+dWL9lwDFzuq1RsU0E48Ky4=;
	b=0DXRioDPkLX+v59KfDjtRgzCd70lkQFpnNIcVkK/rE4qd3N3Thsk9DBzN42+1e9nPKWz
	 m5kRTCFgT9xMalDNGPVBKETT0+IdWEf+3p8GqhJ5i9+r+5eHUrUmrWEZ7BvEI6svwcTj8
	 j9vcyr7+pBOWmLNyV3i5JfsddvCXCkd+Hv6C6ksttQXtK5E2kx126OAtpmAVMGPS3sAbu
	 U+jM/GC9fl96rZxcLkevnKzVBHWXNqCzj3CWb7C0vEPxCSVwEMwnl3Fx4pR/wNw+fgtGL
	 7/HF0Bqr8isEguDEPJf1s25I8W9HYjbVp29xquGZ059qXzyVOm+WRVdT505UPDIANFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nu0eOTsC;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8C1606A339;
	Thu, 26 Nov 2026 01:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E8C1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nu0eOTsC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=Zb20Q39Z76gR7gTbNtuqpYqo/2ZJ8vVe4gIBS29RSx8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nu0eOTsCikoSxHcR4Pufwr7rOkoX5bTcWQU/5GY1stwElOPmCXL4o7MHAV85P6uJH
	 AM4mS6Ro67jj7R8NZDr06TnxDwA4quCT9qYHuVF8hG8b51MgtqkcBlBjyD2zGyT5dS
	 zwxyFtTmWxIHPWcrYaro5DxqqIQgfcjErkKUGsbqysKf0+Ej7uJvlLZq6Yc9e3CPpQ
	 1YSFFbIrKVH+zicAgyCWu/iZH56PlaKbf45/oLoLXgfjfLmYUQ/DOxKUu2XXwgil78
	 6z6HpuUghWySeJTw6EvvM2sXml56jGV9SQrvB5A3JpdrVNLf0WA7+5vBCe8M/fkxnQ
	 tDhrkRqgf0fdQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 10C4517E09ED;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BF39448002B; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:29 +0100
Subject: [PATCH 01/11] arm64: dts: rockchip: Fix USB-C DP AltMode vdo
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
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-1-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4858;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Zb20Q39Z76gR7gTbNtuqpYqo/2ZJ8vVe4gIBS29RSx8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDVL7DXq/ODQpRAlj/q6xwSl9KbMLJgcs
 mzhOsLek93dfokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qa1aUP/39n0/fXbIqE6YzmUsGsdl5t+X9Y1Jw8r2Nvw6d/4hf9EqXCphA0u3b/2ahbiY82OsW
 ysVu9LFQvkLypxc0NIdtkzH+ZSlGcC0tQTpHxOA+OHZr8F+OJG57PST2CpkdC+5LanWE+aqt6Ws
 sZPgJIjOG2gyA6Jptfp7iSlKGVReAl7hE5vG/m5ZHcaH21Wn7RU4O/Hzs94MGbsfPC+5ttek/H1
 szUpL4aMg3nEr2jpbL7zJfLcCPTwtW8S6DuShrM+MMNVCG5RrakJnvU1lpOJu9Jswd5p0/Uwp6n
 iB8ko88PO+U99YI6uiP3a1T+32jkRaYqC7VrF0E5g6Mxzs5uoJapwXbOL7Hjat9ZDn4eA5N7HDu
 f8L1BrYNW/D3mGOz+7eVOgDrFvajClCoOoHPdrvu0Fur1ruPEFB2cgWorDEpYcGWTQY/H2Lu6im
 fo2f6o7AfZfsGDc5DrI3H/sz4jGGNfkCdjA/kot5ciGtB/bXoTGvvXimJo0xOzHMShZpwi1oISQ
 GIncZA+yFK4CgvtSG7jb1onPUulHjSog0GZhunjVBCocQGgdyW/dVU2uxYcfAYaNW5IMkWlxV+C
 HbLno2tWg4eI2bAzkBt6VPX+za6GvSFIyCt8dM7tasl5bb7AjhirQowt34LIZBjT0dTXIolTsJG
 yiwOQ6fVEiXdilD4a+sg46w==
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
index 3e7158ebdab4..f50824966860 100644
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

