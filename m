Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BB042E000;
	Tue, 28 Apr 2026 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392845; cv=none; b=giLunZu3QSfrHi1yGXHV1Hzqq9lfK+vTgy+aOWLUJ5j1Kp4mv9d1Ju919gqMPz3wH5RWhwidXuFhIoSj/5dTt8bc6JpQHaglkwyM/k6WGAvyGakO8xj6g2u8MLUa25w8MD2BGmHGELDfCskoypcqkNysjUDme+sqGrr1jmoJQM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392845; c=relaxed/simple;
	bh=ZjzLsdPJD79HFPyUgKrqEvktCEnIt410bUBn0SzDAG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZbIMOerBkvcU53z59f0uTdZH8Z1iqKYpkqWaXEhPQRFIaYgtYnSraZDTTCOK7PB/vd39pBn55FL/JtnylJ7UsFwshzpdXkNkYx1J9KjYEMPte0A7FxXUGOVMpyrz/Na2zDguz0sz79bmT632Flvq9kfdTD8oOYMU0kYMo3vwRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SAvdxOSK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SAvdxOSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392841;
	bh=ZjzLsdPJD79HFPyUgKrqEvktCEnIt410bUBn0SzDAG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SAvdxOSK3lY36U6FdIKtJlJAk9Ct7CxzQ0TCgAIDYfSkFWSVHKDPBo6WPRyw1lS9j
	 S5+SNaBIky7/gloDjixH6N0qCwcl8CiJc64D+6ZeMP1ToQNNlkb+Kl64gTH8dhLqoY
	 EDybd8QxegFpo0zxV80UwzaadhlcI3sNhWTcXK/XOHpbV54doQLKatMRVWk+7TFwS6
	 AjSqtEPFoMjGsIpgTh2hOxmZKHB4CafzNEYiVPyoOkvEngHvcTlUMNTCM7uOLX+rNJ
	 w3Aqh64jWfnHdvw87k/tRnRKmrBF8Pb4+zoxmZzip5ICpQtDyo0f0+8WGO9e9Bgshg
	 ee/Zdz3a6P4/g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C7A5817E1428;
	Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7FCD8480028; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:40 +0200
Subject: [PATCH v4 01/16] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-1-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZjzLsdPJD79HFPyUgKrqEvktCEnIt410bUBn0SzDAG0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MiW06eF2CJ3YxlsW4XbRigkSDGw5Wbt2
 Seox4GHVkt9OokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzIAAoJENju1/PI
 O/qaN0MP/1IgQDrZ4gaz6GsDh0Fuj+WpZJLRmOqaYHg78eAD+OtsD/JEoX13NS660PzV+qgGspS
 QmcICbjUJZlHo4LUBjy9OtV+0Q+03nEdpLn2KNNLsAM8v4ViyyoIlgw/U19Wk0SC3zXLC4aSTTH
 MvwfCLhYxQQ5N7qL9rXAaCYCL9sWL9JBE8w9vl/lf+MZp4ezYN+1jhovjHGnEm0uDnDEtsylp06
 LrPcthUFc73xs01d5MyegVS9McSi6YcN9g+99514ryLBDKfHYpKA/rXfu0QslPqN4BsUXuUgaMV
 bLxUKTiqdXt7CqNgbaJarJ0yA7V7T8vCzYfnkWqLQn3v42EK8sHy1T8kszFE+/f8y2bnRme0Frv
 BWc0bXkgyKyC9e2WuTYJ2i4au/97RbnVLSFq9FaP+TYzy2JOaUVTlnpP3NXknasN21q5o2noBmQ
 JQgcTD+4ndUHEMMmgrYzGxmFnhN+IIHFVcbxDcNmBMbHouUaKvExUrz5w7GzAr/HiKXThPVpdF7
 4+Tm0QH/pR8YIDuHKzYWCLREC4U7Bb5Q1n947mehzkvI+jyx2bNgeuyQVpyEIl3o/M+q6qBxQPy
 Wv7SXuicO3tQyGzZyKwKE5K//uC3A4anMDdrcl0nZ4wGmzz9MnP2vFOBNNnOuvrvH3H2L7kmJ42
 Pa/cY4ee1CC/RuJOTU0837Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Currently the Rockchip USBDP PHY is missing a documented port scheme.
Meanwhile upstream RK3588 DTS files are a bit messy and use different
port schemes. The upstream USBDP PHY Linux kernel driver does not yet
parse the ports at all and thus does not create any implicit ABI either.

But with the current mess it is not possible to properly support USB-C
DP AltMode. Thus this introduces a proper port scheme following roughly
the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
with a slight difference that there is an additional port for the
USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b182..f728acf057e4 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -114,6 +114,29 @@ properties:
       A port node to link the PHY to a TypeC controller for the purpose of
       handling orientation switching.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for USB (or DP when configured into 4 lane
+          mode), which should point to the superspeed port of a USB connector.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for DP, which should either point to the
+          SBU port of a USB-C connector or a DisplayPort connector input port.
+
 required:
   - compatible
   - reg

-- 
2.53.0

