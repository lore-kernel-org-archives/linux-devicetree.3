Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F659378D64;
	Tue, 14 Jul 2026 12:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033100; cv=none; b=VaE71rf34OfZQxsTktwQ0rQ6aWV5Lefm96U5CRO572Xgo7EwqUPPftqp3JeAs3NX4S4bNrjOThsU0Rq7y0g3889twkL04KDAvRUkUb1vHGY5nrFC0QUBDZ4Bfzq19SHfJU9IZR72qq4a/5FGYacYGzhLC8Cx01N5qcQETfmY18k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033100; c=relaxed/simple;
	bh=1ZHNBJO5qrM8bD3uBDopzZ00me/02rhRwmoXbHpPB+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9s2lpDhod7vPr1VSOp2MQndyZkrJjrlnDCiQ8mZi2LcM/dR8HfQRRDR6v8zSrajgLKNs3C14rc0fisn2NEcjMqbQ+0XjjirMo2N6SSvaabqdsBS4SnM5i1BxF0ERnumRqEcr1LsN+KIPN7dV0tzGrSDw4ZZHZ6xHerWKxpbyY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCU0w3Rz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCU0w3Rz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8739C2BCB9;
	Tue, 14 Jul 2026 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784033099;
	bh=1ZHNBJO5qrM8bD3uBDopzZ00me/02rhRwmoXbHpPB+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CCU0w3Rz29cVqbt3JYg5z9+vauK6q0C7NZrt7aUrZlD9seiZzdUld3CpUHi96hp2a
	 3ymYZykF8K2vqoXQjAYF8ykQeEZ4naNLo0Syd2HHuPrV+tN8BxPtjJfFHh2QHj6QCY
	 YRRONyCrXyHiruzkxJjZYqnHt/TOx7HKK+q2RP6zPtamKaIUCwtoMK7MWwKWueJ7Ro
	 emXTlTYH8/tcjVUt9cf6GqGDckkNRQbVMmm0hR439kwpWrirTz7z1ekJk50CIhri7Y
	 Df8+2WV53LZ9tF6Hqskl8qghoHqN7bI+BDrclETHJNa2w8JCr34BUWriGqVZ3nAap8
	 BomyR6sBISMrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9161EC44501;
	Tue, 14 Jul 2026 12:44:59 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 14 Jul 2026 15:42:03 +0300
Subject: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-6572-pwrap-v1-1-d8e5a39cf7ef@protonmail.com>
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
In-Reply-To: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784033096; l=838;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=DGlethcwjr6H16kkYv8rGeF6UvLfthLp0VHfVhWr1Mk=;
 b=9Fb6Cp26hr6jilvkzub6M4v2q/4lL0YwTW5VtR7PmuZCGmc+q1MJnxFs08qNCpGQwIAYC57nS
 2QYhDhvFYkrB0aFN8eHW4BpqKibUhfROxJ2zy+39XcBccKeVg304Jh9
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC.

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


