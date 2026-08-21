Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EB4486648;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313755; cv=none; b=k0s/GWTlSmp9RP4JxG0LUWZmYCgbqYZA28Tsk1tm8Kr2uISl1ffbWcgIAVJvePLuphaJ/eCQNz6n1WgeYKITyNJxoaHQGommNrvY+2e0wCiOFhmRV1vmNyLd5mtdfVipB+AxXBpMf5ton0RpYFNlmOCLROnyv1pRpC9BAvkfWok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313755; c=relaxed/simple;
	bh=7wJCJfN4pMWX9++KJykYlazzN3vmq3alpryAcGcQgv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NH8s61pd0T5/Dud5E5vcrYCS6/Al1WvTE13GrhldM53XZyaRupGnsIO99hdLw5EpSDwom2QJpx3A7d99MGLor0T8yyZu8OUxaulgMlfkuKt6gl72d5Wyxz7F3BmXvpDBIlp0hiS/MBCNDLwutSEVNCW/5p65vYgMvr+LGpT0ETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6F2DXKV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6F2DXKV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F9A6C2BCB3;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787313755;
	bh=7wJCJfN4pMWX9++KJykYlazzN3vmq3alpryAcGcQgv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r6F2DXKVZHScJMmdTC3oEPfRertr+qgZlEzikRXkEDoIomjcbKPvasQjziwl+tGBQ
	 Mlz151reb0G3CdzxYBgccWYDGv/9WpnSAsWWHYkVK9mnMsROC4ukTPfz0H3FoCwb6f
	 2r7bNf9Hmhbju7PxJlpDKUuWQwKemNTFSdmfWvC8wRD/K3W/C6Mkd0o0U+FchTYL1y
	 pbSP4q3I8x/Y1kH0By1PgqhLU020k7xZtotC9xTmgGoCoYjPep13OisO/3CqI7AY9v
	 uSRMFrMspPWiVelxxv4oXEzKTzEUiuFnJ0q1UF/Fo1FHqXGdN1c5HWxpXyz4s0/ubD
	 5QK7VpAHtpqiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD24C5DF7D;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Fri, 21 Aug 2026 20:02:30 +0800
Subject: [PATCH v4 2/7] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Allow
 DSI and CSI consumers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-dcphy-rx-v1-v4-2-f1797634233d@gmail.com>
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
In-Reply-To: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787313753; l=2834;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=0WXE/NlokgeSzl3fI3FkObkaA99tQXSoViMQEwXn3Mg=;
 b=3fWLRGuGuybNGBytIyM/G6LIROaQhrm/OnU6jbpr61L/vqpD0BxsqQjQbLKj7ESlidWA1ofMj
 WHjKv6jee5gBN9kUaAFSAyTOjjemDaF2a8QehcS5jjweyzVlkUv3vrs
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
Reply-To: jason98166@gmail.com

From: Jason Yang <jason98166@gmail.com>

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
(DSI) and a receiver (CSI) on the same PHY, and two drivers can use them
at the same time. The single cell this binding has selects the mode, so
it cannot tell whether a consumer wants the transmitter or the receiver.

Allow a second cell that selects the transmitter or the receiver. With
D-PHY:

	/* the MIPI DSI host, driving the transmitter */
	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_DSI>;

	/* the MIPI CSI-2 host, driving the receiver */
	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_CSI>;

and with C-PHY:

	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_DSI>;
	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_CSI>;

The transmitter and the receiver cannot operate in different modes [1],
so the first cell must match in both consumers.

A board that wires up both sets '#phy-cells = <2>'. A board that only
wires up the transmitter keeps '#phy-cells = <1>', so existing device
trees are unaffected.

[1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
    operate in the same PHY mode."

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml     | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..595a71a51ee6 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -20,11 +20,25 @@ properties:
     maxItems: 1
 
   "#phy-cells":
-    const: 1
+    enum: [1, 2]
     description: |
-      Argument is mode to operate in. Supported modes are:
+      A single cell selects the mode to operate in and refers to the
+      transmitter:
         - PHY_TYPE_DPHY
         - PHY_TYPE_CPHY
+
+      Two cells select the mode and then the transmitter (DSI) or the
+      receiver (CSI), so that both can be described as independent
+      consumers of the same PHY:
+        - PHY_TYPE_DPHY PHY_TYPE_DSI
+        - PHY_TYPE_DPHY PHY_TYPE_CSI
+        - PHY_TYPE_CPHY PHY_TYPE_DSI
+        - PHY_TYPE_CPHY PHY_TYPE_CSI
+
+      The transmitter (DSI) and the receiver (CSI) cannot operate in
+      different modes, so when both are described, the first cell must
+      match in both consumers.
+
       See include/dt-bindings/phy/phy.h for constants.
 
   clocks:
@@ -82,6 +96,6 @@ examples:
                  <&cru SRST_S_MIPI_DCPHY0>;
         reset-names = "m_phy", "apb", "grf", "s_phy";
         rockchip,grf = <&mipidcphy0_grf>;
-        #phy-cells = <1>;
+        #phy-cells = <2>;
       };
     };

-- 
2.43.0


