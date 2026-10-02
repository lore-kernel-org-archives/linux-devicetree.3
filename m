Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246082E7F17
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 02:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909875; cv=none; b=hp7HkH6bGYuKh/vliC3n/CBYMAsyUoEZtK8+VQQuX5vC4IK2fobcSftTQAGVWzjy7ByuGGSyvcf35+g/8NGG7hoDKAHpIbO2+mmQIBBUePD5c9fOYrPiW2QDwmqF+nvABvZ6ujCKHaKb5QW+RGDgxBKlViQggeQww0eeRHu/vbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909875; c=relaxed/simple;
	bh=+rOznpuunXemMw6GDovaDiUAZaCGae3OqVN9WboilTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VbQHc3pE+eAaFMIlKJnfiWunZz73MXYjde/ZfLMcnxfSqjaqRHqiJqhQpm6O0nIxPd8arCEzhJSQSHD5MtjzQojReQL6LaBTPsG+kkDIb1HQy8pseLqWDx9NANZhCQsdoQ+Qhlv/HqJuyetngm1IW9D6SZIQJJO5FcMDFamoIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=Tq5yNamq; arc=none smtp.client-ip=209.85.222.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="Tq5yNamq"
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93cbc3ab2fdso1461385a.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 19:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1790909872; x=1791514672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8JFUeE5MEiIb7ITcrTZk76VTtK8zyPJORxw7JyUGnA=;
        b=Tq5yNamqAcDJgcsgn1p+AbUwZBolXqKBQFBmvw7EBr4YVjfxtl2F92xwj1Ml7pgLwh
         j7A5iZthbWJ1gdvDIWhmAwDRp2nT8Na89h46yhT9ZcssMcZ2Epg18MOskVWBWe8lzSGC
         W7OBW8Je9aIYd3uoOPOrvxfvx6uUrYRoVRle/alttHmm4GQ2YJMHhbLiU/thQSKvqV9c
         l9RtvnBKusu15m/QLebl4j/CM3mzGvhuI+jhpehwNJAa3WW1xWbjMsjLEOBZgC4AfuqS
         vS2PpObGOqkUt3A5Y3uT1fN2rNOUoJLL7JpuL5TVIDa+NRhIE45tfSeJEy753mB0Pwj7
         O5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790909872; x=1791514672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8JFUeE5MEiIb7ITcrTZk76VTtK8zyPJORxw7JyUGnA=;
        b=YUw83kqlzlVqwZxYRISmDAyTV8PdbomQ1Rwv92PaGS+9kNpNTnTMHNG0JtXda9WPKE
         l+ney9DthC+oeYlJkOEAkfAk68UFxGu/yTG7tujT9Z4dPlolskogcE6MZvzoJUjFTYMD
         U5RUJwOY6ARjWjt5RMqEa22jf0t9C3Xec2q7TCSo2XkeLbSk+404l3LODc4wgM1Y9ZG1
         hMmFgBFBkeJSeNhSRP+2sw7TFfQeLjWeWj/LYJmzArqq3spSEWvhdd27zCHozIT1G6EI
         2IUYB7uFujQ7L8RtuRXvKLQTkV7keQ2SL97mSGD/Gu5DWGTG8TBY1e1ooQSHkoyGCB1b
         KkaQ==
X-Forwarded-Encrypted: i=1; AKwUvByug2Ut6+XB2VSQUS0szOuNbo8YEmutSskGhWkQqEoQzdb+Ho75M8PU8WEzHdZ1kOAUTvhGT45Jfx7N@vger.kernel.org
X-Gm-Message-State: AFuF++nuHPrX5A6/GI58WUcYR0bn2DvegPV6oS8X+bcQ4cQwt8QK9mNV
	HaUSPjn2Ojvw0vi2rYa+2UL8TYywZIQFlPoXvPzOLewDWNy8Tp7prEW21l7vlisuOtOPwnBC/s9
	CuzlZeGpBTZiGIJkMAoWb/9XTE7uethwqYamG
X-Gm-Gg: AYBFou0CAdmIez/TNyNxz2M8ja9W6cOM0V04TyWDQVYHfP74Cl4rCFCq6FRYqYI/G2j
	YfV1TysjkTE/zPVwg+0ODUq2g5OD5n0ep4QYo3s4e+MMZa9sl5+mAjoqXqrSg4VRV8JJzkH4eut
	ZxYqae7fuM8QJKit2HomDRnjgwQYHs0otl9qvquhzfyi0oDEdOtF/D9VOoKf+U8Fy/1riymTPtX
	C4i+JVhYZnjYzYXwZeApFD1o/g54gg+jhYoJUDbwvudFaBBZ8BXpWMdlIqM1dcdxnuYC1li6htb
	FaE9nEu5pQpUb8f3bzekjuGpCfu6ABzfxsf3vUg+P0zXcY7ZsgcmfH8FFXHI1G/eUcR65uEiV7r
	1hXZfR+QYua3IoxZds2Pzv+0=
X-Received: by 2002:a05:620a:d8b:b0:93c:c987:7f70 with SMTP id af79cd13be357-93ce7c0dd2emr226556685a.21.1790909871950;
        Thu, 01 Oct 2026 19:57:51 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93cca1ea26fsm54885385a.3.2026.10.01.19.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 19:57:51 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alexey Charkov <alchark@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH] arm64: dts: rockchip: Use GPIO function for PCIe reset on Orange Pi 5 Pro
Date: Thu,  1 Oct 2026 21:57:46 -0500
Message-ID: <20261002025746.3284691-1-dennis@ausil.us>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PERST# pins of pcie2x1l1 and pcie2x1l2 are used as reset-gpios,
but the default pinctrl state muxes them to the controllers' dedicated
PERST# function instead of GPIO.

Linux happens to work because the pin is switched to GPIO function
when it is requested as a GPIO, but the devicetree should describe the
pin function the board actually uses. Bootloaders such as U-Boot apply
the pinctrl state as described and do not change the function when the
GPIO is requested, and probing pcie2x1l2 then hangs.

Add GPIO pinctrl nodes for both reset pins and use them in place of
the PERST# function, like other RK3588 boards do.

Fixes: f47af8ebbe53 ("arm64: dts: rockchip: Add Orange Pi 5 Pro board support")
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts   | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
index c9679bac1db7..783675337ab9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
@@ -188,7 +188,7 @@ package_fan1: package-fan1 {
 /* NVMe */
 &pcie2x1l1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie30x1m1_1_perstn>, <&pcie30x1m1_1_clkreqn>,
+	pinctrl-0 = <&pcie2_1_rst>, <&pcie30x1m1_1_clkreqn>,
 		    <&pcie30x1m1_1_waken>;
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	supports-clkreq;
@@ -199,7 +199,7 @@ &pcie2x1l1 {
 /* NIC */
 &pcie2x1l2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie20x1m0_perstn>, <&pcie20x1m0_clkreqn>,
+	pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>,
 		    <&pcie20x1m0_waken>;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_eth>;
@@ -223,6 +223,16 @@ ethernet_en: ethernet-en {
 		};
 	};
 
+	pcie {
+		pcie2_1_rst: pcie2-1-rst {
+			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie2_2_rst: pcie2-2-rst {
+			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		vcc5v0_otg_en: vcc5v0-otg-en {
 			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;
-- 
2.55.0

