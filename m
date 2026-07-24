Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DDB3C5DB8;
	Fri, 24 Jul 2026 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892591; cv=none; b=sM8ctcTCZp5KkRtNLHZCTKCJlrE+1v4gHUI5Lw1Lb+6Stw6/KifpPEnJg1qOCVmNoQZ7qOMsFRiatUsx9MR55XfLpYkNVduJHYQwfHptRgL5CakdsgOZSSLQ58+TVxkwW9kch5IZ73qeLnu8pNJRjELTbFhjKJC5zImOrQ9aQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892591; c=relaxed/simple;
	bh=QCNui0KdBUBlrUWMOvfLZPo+juF8+67R6ju1Xq6ckwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+9VCDVakqx65YWtvm9BFGMrDOQTwnKCV7A1crdelDu4HBsS8nnqmTnQxC5u3Imnnw8OHErWW8qWAY0gLRr2fbX69nPVTQnx4O5JKUdjOnl9vOTKhhBAKnLBuZ2RMQmghvceH+7p3PEdoHdAVY9E+4Jhc0/7NAx0VM5P0RdBmzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMHwzkMy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMHwzkMy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3CF3C2BCB3;
	Fri, 24 Jul 2026 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784892591;
	bh=QCNui0KdBUBlrUWMOvfLZPo+juF8+67R6ju1Xq6ckwY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qMHwzkMyfHk9GVFuq1m4wW768y12QTwcZ7n6tv2WIJDODi6Vru3WaJbx0DKXFPJj0
	 NQ07XtAss5OsoaAAV7OwjTpy1U0S3O1OR9U2wLLhPTwTPUxJcQ6iJYLEtHuTaHdS9T
	 UvLNw3YLK+7bSa1ogD+nKoKIAYkrk93FOpXz6DGP4R9N1kWnUsT6/YKawVPGKXpCbE
	 yNJMB7OWA1mIEAFJDfrz6xL3BB2oHPeavHIPnJZ8q4JsuoQwp+oxmdiij1/Iu+Rkpj
	 bpoFCrKSQc+1NVXMqQlrC2sL4kUkFbmUIe/IoRsyEhtQaqgm5cx73+bLX5d6YNQ9/T
	 /HaQLXBg5F85w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD308C531C9;
	Fri, 24 Jul 2026 11:29:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Fri, 24 Jul 2026 14:07:06 +0300
Subject: [PATCH v2 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-6572-nvmem-v2-1-e58d16a29621@protonmail.com>
References: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
In-Reply-To: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784892588; l=1007;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=nuU2fNRtn+r/1kk0ZhaxODdhDU8esK5VbNO0Kcgpgoo=;
 b=L7tqSgdl8MY1vNgqq/ul9NO03Q0TCsUnTzMob6hp3Yy4Mx4UQUiDE/B3LwCI20vNjI1yVegg1
 /KKiTFFTEutBVk43yW+QBtzbo8gwO/LwZCq1UKhQnoRJ0/ze+uL8+R6
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC efuse controller.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index f9323b3ecfc8..e10947164941 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -24,13 +24,16 @@ properties:
 
   compatible:
     oneOf:
+      - enum:
+          - mediatek,mt6572-efuse
+          - mediatek,mt8186-efuse
+
       - items:
           - enum:
               - mediatek,mt8188-efuse
               - mediatek,mt8189-efuse
               - mediatek,mt8196-efuse
           - const: mediatek,mt8186-efuse
-      - const: mediatek,mt8186-efuse
 
       - items:
           - enum:

-- 
2.54.0


