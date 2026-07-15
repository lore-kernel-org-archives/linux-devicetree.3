Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B45D448CEE;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118449; cv=none; b=dr7ccUTq+FW6yxseVjs7QATi2TR92R6rQxG/JRLbqm5nMksLIfyVmthtjgVczsKk8hHSTqegDBZ9VU6LaM0uSoXvh13w3LxW8a9SfHP2lh6sKYWpkmKd3aNXLKYlc7Ifz9VP9QLeYi+MeYqY4tuJZw9MlovMEPkIMnIIvABSBuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118449; c=relaxed/simple;
	bh=/nmX94i7woECD9G9H99n5Oh/yeRI8rxdP01LoG01IWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAZaqVrCVbtiVini4An3skTk1tQLIT13rsVshMVhPYepoLpjww2REnHJn/WvjvNNCnyMu9EanaU64c4X2SZjxGLZwgsWQdhiGB8cGPJoHuxcAjLsyCFHOx/mvLwrtxnvSiALsnGbkG7lchOaK/Xv0sSETHaqvqrq/Q4oZ0dCrYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+n8mhFO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+n8mhFO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F514C2BCC7;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784118448;
	bh=/nmX94i7woECD9G9H99n5Oh/yeRI8rxdP01LoG01IWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l+n8mhFOetzl2nKeUetNMTzOi5aYzNWl3tgKFTocZaVcix4tFDRRbqkYRGJ0O23B+
	 lPWG7ldKNddpFDS5GuOm2sxFZLGFTDKRRZBlu09WzJBJQn8SqsmECF75aQK6X9efVC
	 ks7r+b+hPWr5AG/+yiuKo3fMqHOM3A73pKzWDxdmgaSkeQfJCNbqMLKjAWv66aacyk
	 7Vrotr4fyDCu6fN90YCSkNLH9jVRRGDQlQsrWy8bpJF7hNCdv8p4hv/u36nEptKDzL
	 15ESboduNfoZ7hEHIl5XAqxo/ywYJCOM62r/johkVvBYq+ZgEma4i+FeXn/2DNjE44
	 VQdcGJOzEvqlQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DD2C44501;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 15 Jul 2026 15:26:38 +0300
Subject: [PATCH v2 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-6572-pwrap-v2-1-bea1d801c81b@protonmail.com>
References: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
In-Reply-To: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784118429; l=921;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=BAi8UFC2xpwSSj8K8iWAUOKHGK6fMGisfalQqsjZVDM=;
 b=WZdjeLkVUX6/WzHVac1moHYvdUlfq8YtMBTKrlphWNkwB/sQKTS1sIKN6tHhAPcVYKBS39muA
 vqk0wnpsY1aCy9osGHkYge5/3c8C9PHm9ZDOVY/Pkr1RsT9nAlyVy+3
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..a3cf11153fba 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6572-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap

-- 
2.54.0


