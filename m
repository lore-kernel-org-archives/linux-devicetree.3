Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4443C348C75;
	Wed,  1 Jul 2026 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920235; cv=none; b=X1D4tKMjLwXVvf+k6U7Ar6a8T3NfYwB6PCPkbex0cZRTPCT7aKu9S1k2dgmrLevWI2fHEnEAYANt7D9ZlMeEEwERh6dctlmbHa6NKvMLcNvBR81k1GTl6SmX45Ltiv+z022fOFIgORmLa7njyRmCzRrwuXSGQfl5ePi7QFjoIs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920235; c=relaxed/simple;
	bh=B2XyVL7QuZTHg/QCA4ERiK9bSp3FRiqNCvgt9Ow2ZVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cw1YMmomiPqT6ctrcFLLzjsXFli19ItNyN5SDrUk3SNP+ueb3ttY/QXJiT/pfYu4wAeGqXIEQu4V04sGbkcq2d4Jq8BQrJHvNLh69V0sdSOpiF+Uta8+xYuK9FiUtXpvS98ve3RhVH9n+4ynjdAn5ZoR9xb41eeSke0Qm4nBS94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZsR7GGxQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZsR7GGxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782920232;
	bh=B2XyVL7QuZTHg/QCA4ERiK9bSp3FRiqNCvgt9Ow2ZVM=;
	h=From:Date:Subject:To:Cc:From;
	b=ZsR7GGxQRS+K6ITU00OcjTBndc0C7IbFsE7CU8t/s4x4wsTpimz8V9BkdekluR86l
	 PhFHwjUMtxHfdE9/ts0zjTnkp2pUbyCItWGkK5nBVPNW0/mPrTLVH0pOz8jmQEZTE7
	 Jg0bgORrQT3+8c+QiYWgwig7H7Tgs4eqFxK9Z3ri2WGYZh9jJRPr4y6TO5rKzI1rxM
	 rvvNWg4Qa3HdoSjOB9u1JjULbIjlrvQcfa3DJzW0jUdp56ZPEh5T+X9kSYmeZrQThf
	 iG3H5prtdW0AWgNLwvbHYzigOvwFjcEJtSZBxaqlgxfzGYOHtU9h+Oar9QCkPxtKKV
	 W35OUKwQ+yrjA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C51D717E0432;
	Wed,  1 Jul 2026 17:37:11 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 17:36:49 +0200
Subject: [PATCH] dt-bindings: phy: mediatek,tphy: Add support for MT8189
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6DIBBFr0Jm3UlAW6pexbgAmeosQAu0sTHev
 USX7yf/vR0SRaYEndgh0pcTL6GAugkYZxMmQnaFoZKVlk+p0OdGNS26jJaD4zAlzOv8w7vVWlF
 tWnpIKO810ou309wPF0d6f0ogXyNYkwjHxXvOnQi0ZTwjupYwHMcfb4JeIpoAAAA=
X-Change-ID: 20260701-mt8189-dt-bindings-tphy-4b661e3a9e50
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782920231; l=1052;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=B2XyVL7QuZTHg/QCA4ERiK9bSp3FRiqNCvgt9Ow2ZVM=;
 b=tYvNgQLRRhU0C6Mq2zqKSPuBUtv6H016NPf0CmvwYW6Ejy3fZHF9iyT/E70wJUS8INuSEPCMY
 t3sGUZ6Yyd4B6QuzRwA6L7pTAun4Kxr/gr5XjLWn7Kt9lFmirYLf8HF
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add a compatible string for the MediaTek MT8189 SoC, that integrates a
MediaTek generic T-PHY version 3.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index ff5c77ef1176..8b240cfd537d 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -90,6 +90,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8188-tphy
+              - mediatek,mt8189-tphy
               - mediatek,mt8195-tphy
           - const: mediatek,generic-tphy-v3
       - const: mediatek,mt2701-u3phy

---
base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
change-id: 20260701-mt8189-dt-bindings-tphy-4b661e3a9e50

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

