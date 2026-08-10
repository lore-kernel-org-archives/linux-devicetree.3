Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F4D3CFF4C;
	Mon, 10 Aug 2026 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363810; cv=none; b=lgDqq/SnVdJBE5XIGrf2ldhk4crfl11U0XBF7s+DEJ2RDb/w7EJLoXjtA8g+kN0bJxMH9QdPJsIPZTX8HVRyXcR7G0kW/xPSNeZuYa7x1qUTEnBWfhXVig94qER/OhkLRwq3YmnkRCX16Fk39Y8C+nOAgXdJA+xz/iv8xm7tyI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363810; c=relaxed/simple;
	bh=u/xE6kMTpgEqTDti8OA+5hTsroD4qAS6oCcbdy5lRqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyPmMxybrsKtlPrdbKgyJHMdyR2xnI4iQjIzRuPvzEwengrPzgXPZANYsxrwk8/5bK1HjEYIkyqbh07+Di3MZRp7KBp6a0TIKSyLzjU6C7zEfkkeilyTejZ46mjKgpbOxuOIo0g7LKxI8YvvZxwkreev4glIDQdf+GSOV0QW+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRmerNKT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRmerNKT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AE48C2BCF4;
	Mon, 10 Aug 2026 12:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786363810;
	bh=u/xE6kMTpgEqTDti8OA+5hTsroD4qAS6oCcbdy5lRqw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CRmerNKTIVlgXXoc1sg3jZ4F3ZaSDEWR2FrzIU8dzo3Kr6IWt73er7K7CmA9piORP
	 PBWN+BKsEiiC62ARY01mxExrk/Vx2MXT5D611VvG6jU1Y6KvQ2x5/E9wGtx1bdxmBO
	 g1+jIDUlHGCMSlXfUN5xVDdd6JB/WrRNZdvJN1QXlMzk2PEXpUas5Tmmfs/I0sS40A
	 fueOf4B8B/leZKrAyYYam8fVa6VF3+VMdB9oBM3BG6gCfl2+gtsYRKni9kbub7AUfD
	 y+hcm0bZAt+lzP0qiwL4+HjHIkTiUXeFwy6d01DKVcmG8wdwROAbCk+jHa4QCqyr0G
	 me3VOAi32wb2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE7FC5AC82;
	Mon, 10 Aug 2026 12:10:09 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 20:10:10 +0800
Subject: [PATCH v3 2/5] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: allow
 DSI and CSI consumers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-dcphy-rx-v1-v3-2-a2d25c29adfc@gmail.com>
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
In-Reply-To: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786363808; l=1904;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=L0YFn/UorcpfoUu13dEjPV7h6qsLNW5q4tce+B7/JmY=;
 b=2pBufMxgPOxO3btd9FczwqemLe23DIEutco22KEz5ID7y3QW4jQ/bxM0oeyYGZqlsKxMMvIKo
 dJ0U+RwUZ62C2KJvvdxYPdF18H7iJdfnViN38Rwc1YIVucNEv2800w5
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
Reply-To: jason98166@gmail.com

From: Jason Yang <jason98166@gmail.com>

The Samsung MIPI D-/C-PHY block on RK3588 drives a MIPI DSI
transmitter and, on the same PHY, can receive from a MIPI CSI camera.
Describing both as independent consumers of one PHY requires the
devicetree to tell them apart.

Let the existing single cell also take PHY_TYPE_DSI or PHY_TYPE_CSI,
selecting the PHY by the protocol the consumer speaks. PHY_TYPE_DPHY
stays accepted and equivalent to PHY_TYPE_DSI so shipped device trees
remain valid, and PHY_TYPE_CPHY keeps selecting a C-PHY transmitter.
The receiver support added by this series is D-PHY only.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-fable-5
---
 .../devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..1f7c2e2ddfc1 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -22,9 +22,14 @@ properties:
   "#phy-cells":
     const: 1
     description: |
-      Argument is mode to operate in. Supported modes are:
-        - PHY_TYPE_DPHY
-        - PHY_TYPE_CPHY
+      The block contains a MIPI transmitter and a MIPI receiver, which
+      can be referenced independently. The argument selects one of
+      them:
+        - PHY_TYPE_DSI: the transmitter, for a MIPI DSI host
+        - PHY_TYPE_CSI: the receiver, for a MIPI CSI-2 host
+        - PHY_TYPE_DPHY: the transmitter in D-PHY mode; equivalent to
+          PHY_TYPE_DSI and kept for existing device trees
+        - PHY_TYPE_CPHY: the transmitter in C-PHY mode
       See include/dt-bindings/phy/phy.h for constants.
 
   clocks:

-- 
2.43.0


