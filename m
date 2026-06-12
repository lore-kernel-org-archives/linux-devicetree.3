Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA72383999;
	Fri, 12 Jun 2026 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281320; cv=none; b=bMcMf5RO4wGeMwatLACtouqrKxPeCQ4o9H/QFjLqZLQ7hj0iP3Uz8at6LzZKa6h9QhyyhZ8LmGj38l6qT65dHv6Q3tTf9KZIHwT/q77WpgxSfVEvHpmv3LI+1LlHV4pf2OODqQhVUgl7fxeYg6xfY1srmsXbRjvs0WGLSA962I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281320; c=relaxed/simple;
	bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i7QcsBAYVTL1c+KyXuVrdqJAocp/GCfRepC3shcBOvLZiDo8QFGV5RDn7b0plPurQmBsaYdzAawfd8yJnVhfSDhiJrExN/s1FoqCCz3dShBffv5kclPmf1J3TMWV8bPE6hZeQzwVQxoavdphMaceF4+Nl8e6gjP0dbau+IyLIjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L2QjEdSR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L2QjEdSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L2QjEdSRYBu/PbO3l0pYhRFRMmEOW2VP9//vn8M2eEyp5ds/OI5oZnWuOhWugq6Oh
	 V3+HmzyMs/9imaSQJMrmNzRdKNa2JHMFWAtXNh5E+dVAMxefX3st6Gr1teZki9aEq0
	 SAKPHTWOIxigwZ7YYnaJtGAowDl06LxXkUgTQIaRWKBs6nneDldklxSBQIZt1214t8
	 goIP/XE/k11WVcmC3o7vou5oJwGAkvon6Mw56x66MS+JqFemdDI3m2n8tjHSnKlMOL
	 oCgbRN4l1NQ++3JpejSKvx0zPOvPHuQRdjfooBlJF4suK4MuxsUCwLAQ/eSrdR78UE
	 4rbcj5elwNlog==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2161017E0CD4;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C5B9E480026; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:39 +0200
Subject: [PATCH v5 01/18] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-1-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiG5Iemq4sxCM5HCSvLHN6Ael1pzdCaiy
 vcVSnInzIDiq4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qajdkP/RnUWBpQreriz9cgkL+/DAKvUgse5zSNC0zYFSSslI8F9e8IHY5qMeKBJV+Zzk0oY1Z
 Zf3psY+fcG2MTJmhezu4z+dxQ1fmu7nsCIhhdFIOXbxccIVSMdcXi7ZpbSAowZKQldgtBHxvx86
 FUr6VWzPdAc82469ryfIjlITZz+8wCJ9ME3GNr06rOgYHycRkUDwkhbBQ+B4S3Sbnq3qRWyHBeJ
 vf/6pv7qXEcP05qqqcLjJbk+yGIMqGgddmaf7AzPgjjNe/QZno9LTpD1UU4IsKbNUgwjA+DSrWJ
 5YksPuSjII0T7asng/AqAlbKhggsbBr4ittX7dDt1dTD/Le2gkUUjmEUaaN1LYHUW4oTxQGy1kN
 2ZPGVARFvPtjAzEun9uW2RYOAiY8lY2JQuo1otlXRZNMbFOopcYFBf2eXpqPFwrzQCsJexWU6i1
 5oBVHX3uMoqCs4H1uT1I8g2iFxReeIKqt/0IzK/+VVxNny/Hakkh9BAhNHAw2H/SE9kln2oRqU6
 DApkPa6Qu3rOC14WhEL0tDOn1bzUOVN9vUvugQ53q4P3OjvkkOzV0ySBUKKC5yDdVIEjd2a4SwL
 oZrxqNd16vSe1st8crKFUqGwVeHZgX7S6+V7tlAvHgpcNZ1WavqXCKpyxtT45u04GBIa+MmVVuv
 gXkdGk6AflI75UDhJPFIvAg==
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

