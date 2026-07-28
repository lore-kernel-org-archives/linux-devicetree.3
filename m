Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D263942AFB3
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240148; cv=none; b=GGMN/Lii5nDX4Y8+TAvv6gaSn54EalXvqw1esKn3vsvfPu44rhG+0Naf4zZdx3pDy+bjQD9h7TsqrX9kZhem9WmPKOIgsflK7d4rz/8AriodUI4A2iagArlp++MGAIcaPiFZLM8+THXK4GfBJBnoU0kJGADdzUBRXF28ChLQIh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240148; c=relaxed/simple;
	bh=NNUsKF0uE2YbWdCskm3pzO4Lh7nn4gEIrvNWUJi0rL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=siaxU8XoRFZVqM0yh6WbdURG/xyhIUoEqa97PpYgKiHfEdDXOEw47qduSKI9StS2MhaWCPh8kYdbzE0pDfksLkDg05hy6dFvoj+8DDcphfpw2NunQ2PZjZq5Kn/W3E0awVTbYLl+2cJRcIne/LYQLYByUx3ZSzFx1ghEG/tVTKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9sYWmPq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9sYWmPq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6909FC2BCF7;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=NNUsKF0uE2YbWdCskm3pzO4Lh7nn4gEIrvNWUJi0rL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e9sYWmPqPRw5TrDDgaZ1HwnBGOtdVKXfNztrhtSPM0LTQ7nIfMPbWOFsikker4OgW
	 u4jdoBpYjlHzz8WGxUX6p7Ucrg3284ir0/qzsXi6+JHPMw41D0iDxULUiL+sndZvjQ
	 BEYiT/AMBjuugk+4bNIoYqFxWVAQIrAlEeDWAdbp86ZaQkERSYNuqcCAWf9zxxcW4U
	 u8lPgX0R0SNzMXkW3RRrJyCVTkSbj63cBwtLcm3/KkfcRO5+mO5L1bveCBNAA7vrbz
	 7G5nybUNIRlL2123HVTSmHOP2PCDDr2Pwf4uUF/+5tppa3tIc8kbMBYL2NYPmgHVrV
	 6Xxto8XmYpoFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47799C53219;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:28 +0200
Subject: [PATCH v5 01/12] dt-bindings: arm: rockchip: add FriendlyElec
 NanoPi M6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-1-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=1140;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=0ONGW218GQPBB3ga5TfqmUyan3oaycKJh9VLj31bcMQ=;
 b=vQZ2xFhYndEoKEKKWNutUT0jtussWQOD1+dV968YL948R3nhniXRfi5SoKKlKzA/UY7t8lG4B
 wl2GGsMV52MDuMh0SJzmYjcgkeO+FgsVXdcxj8fSlrTk0GEbdhvydOP
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


