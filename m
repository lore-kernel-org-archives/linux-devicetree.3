Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECCB34E744
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974653; cv=none; b=rOtBJ/Ef/vbYzyv3KD8LjbAT6k/JrQhSftM8v3b79zg7+T6cWMC88hxMX9xWKMmZowHkZcEF6HK0cKUjrPXdkkUhus276EANq8d3ibroKxBZmuFxq1YL0duxPN72p11oU4V5KO0cMW+vgMDAJ5Bigd35BK4nGO2YLDuzW6hakuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974653; c=relaxed/simple;
	bh=NNUsKF0uE2YbWdCskm3pzO4Lh7nn4gEIrvNWUJi0rL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qqkm65NBlMtIArcDV9JQHG+e69P8rQpgOyOyDR4PjTOvRXEKlFgKLi9ND9SZbrXJPrbAGAEZCO9Wqmsfk5holGnFNFIzMWJJlRIFbM0IlTBeZfFbn6Ij3e5UT3L0aFgvPXQ1ZMNq5z2HkxGQtGerqaZlmbzqZHk6t2RU6WvU8Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzqeM2rQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzqeM2rQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1CEAC2BCF5;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974652;
	bh=NNUsKF0uE2YbWdCskm3pzO4Lh7nn4gEIrvNWUJi0rL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UzqeM2rQriJPkLpsTq/Z4yGRRO4dCEvCe1ERAbWrIVkBBUVJ3p3Uq3JuzVLZahWQf
	 MjsMhZPFoHXfEJLwLCd/r2eFou053iivs9d3wi8ls6EMPMZ77uKXuGJB3qN7XbEJDt
	 JscN5vNQP5EJ6vUwpIHFpBekaxL5YYoLkRzIZyvEl8soD1JJA6t6rC11gjPfJRH91U
	 95r+dss2DEA2UuqwB04K5322g8wpjAMKDqgjA40KzoxUFbQkj/xXQwPB9ZIInwWk1U
	 0/g8eSaF8RKhOtBvpBK8KNvFfkpJQE7swHNJNSIlmh9UvjZ2x/AIbrGrLGY7APEGlD
	 Qlk6UEIYETppA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE6DC44501;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:05 +0200
Subject: [PATCH v3 01/12] dt-bindings: arm: rockchip: add FriendlyElec
 NanoPi M6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-1-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=1140;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=0ONGW218GQPBB3ga5TfqmUyan3oaycKJh9VLj31bcMQ=;
 b=RQUKafAZLxe/Zzu9l/UqbLaXiyFX7l7Jew/YFJi4obA6pg85WqDWE8xo3WIlDG800zRRMUJ3P
 cQeSzDTuHa5BGFPp4+927Vsv7kvMD5QsZqaOTevMmtkJM616vEspOUQ
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Add device tree binding documentation for FriendlyElec NanoPi M6,
a single-board computer based on the Rockchip RK3588S SoC. Very
similar to NanoPi R6C and R6S.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..6ba512964c25 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -344,9 +344,10 @@ properties:
               - friendlyarm,nanopi-r5s
           - const: rockchip,rk3568
 
-      - description: FriendlyElec NanoPi R6 series boards
+      - description: FriendlyElec NanoPi6 series boards
         items:
           - enum:
+              - friendlyarm,nanopi-m6
               - friendlyarm,nanopi-r6c
               - friendlyarm,nanopi-r6s
           - const: rockchip,rk3588s

-- 
2.55.0


