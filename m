Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467914;
	b=iGKRdF4Jm3RvjIxZL+w5DMfYgriDwCucCq0s4pUT0jq1NCMYuALw5enh3izXzPo+LG47
	 38USriOCKtMHah3OezB1dDS7XXsojqySoG1Hqzbc1aB3Tk4pR53Tm+PzVWNhjlkQAijln
	 C6BFASR2iA08h5ONKZISVyyrHElyB9QsI7CKjdn2UnDaucz4qYvkwf5IjgJXh0ZflIMVJ
	 Y03m4KctTtpg8ofQWUFv4WFhDMXr5+ORTlmKj2SPjoiTNdqMf75K8jkA8yirgm7nq5Sdw
	 YsK7TwC6ptSo1cvz+Yiup+UNr8lpQvPGPoSTqChKPcad22KwAIXuYHebHEEkzaid93Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467914;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Nn8XLrzNz4MV6ZKmxBFEHE5Xi6QhkVPpHPZEGulMKls=;
	b=MybYquCFtro9793ZikEXH7Ru8mMxi8EhHllGQ/cVKfFQFQAbLDwZtPIDoK7zFGT7nXXd
	 idF/0hxyl4AZziMXmrCt1CXdVLbUt5xaUeN6CnqPlPOUi+nFx4lV0lCSOI5nTBM3B6YN9
	 zWSMdA1fOFY16JjXW2PxEB8CGfjIuzigqXotR94qXRkJahMh+4c+it4p3YSR6LElzKZYy
	 MOT7L5F/IE+hAaTdc3w+zMYCVeA34sZTDNZPX06wxANQPffk7FSNnhaPFoHX64jYagLZ1
	 27gwsS1XZckKMDfNNYEFmXKVND9lsDfvVAs7qS0Cq/73tzmtey7WzqMvdECNqL1YPmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RSAnZpzF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F308606A337;
	Mon, 23 Nov 2026 21:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RSAnZpzF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467913;
	b=lIzAMfqp75NSe8sW+/QP2iE0RsJt7VGATGZkJYkPP/XwUw5VvNiXMN04viFCUKSZXlvD
	 ljusoiMFmLXEcqm8rUal0JIUC8bidFM0qXDmjuULQ9nk4Nr4aVLmgdMRoqgr0RAdaroIX
	 FYiSE2U5e9BN0AyWeqCB6QFRhoFoAjvoTkd9M5qWjdxLom9/Vl9rFeuB/3BaMxxlxuneS
	 kWVeUxk+X8K3IEisOExxn4/u2U+KT9qgZQptqVp/mv+/lWiJA6HoLx8Qx/kIUgBt4p43f
	 H7OdCA1vJnhcWpcdpZqwJLyNtVB8efdpxpMWRH0zuhvY0vtqNW5C0S09CWHdmB1TLMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467913;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Nn8XLrzNz4MV6ZKmxBFEHE5Xi6QhkVPpHPZEGulMKls=;
	b=DTYdn3AfXjnenhFldkMU0aTeQGsPPd8psjZVFL71e31ed38GaSxq50Gp2E/8u4BVGg0e
	 heHvq16YXCwVGhRsX14yM6h14dTLfMC8EyAq/iZ+dgiWR5Wm5wOJbRTgHnaYrDMqbYDxz
	 sBURqyvLtRZtwvUDHxTtda26m8Yifh20K4CsAGazFs1YSChGORrUGkvHWnGaQ5jDG+b1R
	 IRG2np8J3AiX5HJMFS+soYU8uPDNJZsOMuiT59OpfhC/YrLZqBfqJOChJsZy+zj4FtD90
	 c52npu1YggWhSQk8+dUXitDN+GS4lm7Upl0QT8cGjckhl3NH7UjQyvwOziVoyQRGGeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 781511F000CA;
	Mon, 23 Nov 2026 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467913;
	bh=Nn8XLrzNz4MV6ZKmxBFEHE5Xi6QhkVPpHPZEGulMKls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RSAnZpzFdtCdrzv7PbFvaQ0eBvHJ5KzOldtdWVXnS1qauU686KMKHa3Rx5TanVMk8
	 a5Hi+MWRshKZArA1+0KtYRnf60Jo4N240MZdm5LXqiYK6kbLEUcgwIBT49ypPzMVDq
	 GckT1RHOJZM0Y44V1wWp2ncSzsaDHHhfWrMANEKDlIe0vc0wTiyr6rZPZxNTDjduV/
	 0AvRse2zSkcDRzHeJGc+Kp2ZgTZVIWbF7vkuOfTb3z3ADUmk0D0jjY3APCeliNG/m3
	 KMHWDxiEd5mK37fRsJxYCTz3h+4YAJM9xssVt1Gu+o4yx2t6l/bGMVAPJE6dJJeQvb
	 jzLxJx0NfHifA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EE8E54C756;
	Mon, 23 Nov 2026 21:05:06 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:02:31 +0200
Subject: [PATCH v6 1/4] dt-bindings: nvmem: mediatek: efuse: add mt6572
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
Message-Id: <20261123-6572-nvmem-v6-1-7ba710b15657@protonmail.com>
References: <20261123-6572-nvmem-v6-0-7ba710b15657@protonmail.com>
In-Reply-To: <20261123-6572-nvmem-v6-0-7ba710b15657@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467904; l=1140;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=XWZ7anlopbltit1BOL7l7aOzWGMbH7JgBsZxHbvvyuo=;
 b=gPDZzyYwzSqIUBMB6fmdsyxjhnT1Nm1yFrNGgTr3uKjP61joGKlVFqtzjPSX2DlP1bcMr6LO7
 e2sSCiLvthTAJsJoIMe4MtJB1q2nuA1FNzrdAHlFUH0m3mN39gAXppz
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com
Content-Transfer-Encoding: 7bit

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC efuse controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.56.1


