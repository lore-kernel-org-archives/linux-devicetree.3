Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887893ABD9D;
	Fri, 19 Jun 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882942; cv=none; b=LurZflxv/JX77nugMMMX99Pg/9pIgnRxtzk8sZg8LPVtexG4PQNbdBw2n4U6i6m4yYuKU51Y6k2AoKncldzgB4F572w8WNdeWSABT5k3JJlDb0LmHp5KNLNC3dL5hTwZ/pkH54F/8TtWrRfQy98sUSh/Ct3tLpViGDHNBQcOh2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882942; c=relaxed/simple;
	bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcC9BqrR33bYtZDGFSEFV3wwNtksVYOhPTovlglicB2hm0nAsBV+PPOa6dkqyxz+Qh0BFpAGMKIP/+nQ93gj39ze95cYyubL9Az+w42MWVaKdc0Z7m3011gVB1/n2BwEihSS1hCNfEH4zyR4yWieaU7adVUpezcpNuwtnA+3Zhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QK0pAz4Y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QK0pAz4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882937;
	bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QK0pAz4Y/XG67ZKqHMfiYucx67zmnSe3b6NViHWKMV0IYWGFaN6Pf66BfkIiVAY9T
	 QWeAGg2+22N3+EOenvGcAc2pi9JjXmEatsax0vDhYuiWVJGFo1IUR+f/ZAlh2v/SNk
	 vMJC1E5f6DDhCnbwXZXzpAWfXmka4nvwtjO6moIAGiyevCY7bP4+cuMzsgcMtdYHPG
	 larqwcmijd22uhaQrueqEQqM4+RlJY2BgnWBxBLnNKNRwxFeGNn/x6fNWLcmxSainG
	 ZHC3CQK7Vixq++oe2VL8BZVl+FkaPkAwXzGHtoM71ugFg5CYNOxlehUB0BXuGHd3DT
	 kBcJjRqGJL5pw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D19AF17E0C91;
	Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 87968480026; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:28:52 +0200
Subject: [PATCH v6 01/23] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-1-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDeOrh9uSgYAF1Mpbu1zTe7i9tcKPTQ9v
 pQFb4gZzgg6lIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA3AAoJENju1/PI
 O/qaC1UQAIX71Q/v64Nck9Ke2YdrZtBYfXNDsL200gdRdsBPwLzwpb9GTohNav/ZxbIH36BhoX1
 IGILLFIbpP4ix/Y6UAWlq+3MqYZYAD6sayGegLuT/y1g3TpegWRhYoZjo3jRprMYBJf695W1yLp
 fW7PyBrsSzKBIDD3ndjYkyEDKB6zMygC+TbLtyjLsswMac1VHqPux2h1ppeFjAOMVKTRg25k0HZ
 Q7useb119rBwv1CcZoO9TioaTQJ+gplRc3VN8116S1UvwFg3UWLxicpsNONa5XqDaL+Vz8SunoP
 D5Paonqbc9UeU7mUFZgMjTzO8b/x6EqPd+/7tp7lxLagrU4c3FjUmHQbzIJgZaejmRUf+3tZhGp
 Z2qfSbl6PQcCzFlP8b8TydksBIetFHD5+xdH27EsjH9FhoVuYbqe/jExW+1JamRVp4jvvHVm3Hi
 yimRI2dpdQ8HWBak0KQn2JKEV2EohP1y9Vtj4NcK6rlXWgtiRbgeLh9Oct48zgJHsic3zdXt2hr
 uGlUvaGKEeaxbKuu2irjm+p7ygziqpGEDwZ77R2/tz1nSHFfH0/Z8ko1/4hGwWGIav+iNguC8/h
 WpPygvgocBILHluddY5mpqrhK+lYEIL/DTidk9pJNcPs+fKJ0ZkrZZU9NyT8JmfVi9PG48G8j2y
 8UTeB2yN3ZFdUwjHBkOUynw==
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

