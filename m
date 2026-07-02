Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131143ACA79
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030104; cv=none; b=IPGJ6V5iKFdbofcQ2dBrQs98clccuEsyVJKz1uGNoVGFvmVETbmV0CFEGQqrz9fRDtgLtPz8hLhK/Z+ftJAxhB9QQQa9B3oHIDdCDDGZvYPFXUKQP5lrlgHwJBgI2Ung89T9pvy6q/8oWiXvu4j4LuypxXQPn4qr+GsVQsn0kl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030104; c=relaxed/simple;
	bh=m/UHTg2bhktE5x+v1ieiha7RXNdo7gHve1/yCDswEpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMiqTqxfxQpzdi7LnrnbGZlYI4iadsqbGu832IARZ4XyKyDYdsmqHxlK7/yLGnQ50cK04XHKvDeSWCRWcN53CfSbB8OqdeTbrQ7LHaN32ZCSQr6rk1JC+d4eFXP/BQGh0xwbVcjpBAwjzkzsdctIkNSjcep7kFqTZYYlsxJ5ydw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rq6fV46/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rq6fV46/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5382C2BCF4;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030103;
	bh=m/UHTg2bhktE5x+v1ieiha7RXNdo7gHve1/yCDswEpk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rq6fV46/wwgZfEvFIGiryHAj/H51ZNU2ICXPhvxHth9USzdeZFixSdVlFs0YUXlgp
	 uTpongaZxxA6rDpwY1Pw8sRKZN8OlaIG7jX8lNzRN4V50b9kdJLWbWzTqNlYa5gCkb
	 UPXtoD3j4Fz8giDTmSmIjcWELhhwkll8Gx8BlyI1l3w6yI63nW0yNuJdgW8FR/9gyO
	 7NMInrUFUbQMCLYjKXSl/yx9HabgJTe93PZ51LpMo+hOFDoeGeJ5dqKDXnPEZV+4+S
	 Fytaklb+Fsh/M1BzsD1OxbxImVBliYmo9kc0ehquSJr6Cy6hBn9Sl+W4ITHiHsm2Oa
	 a7+nDdKOmCN8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CBFC43602;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:16 +0200
Subject: [PATCH 01/12] dt-bindings: arm: rockchip: add FriendlyElec NanoPi
 M6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-1-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=1070;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=yyZDtPe8JZdirWWm3es5UC1K/bf3oJ/LDw27weSm6zc=;
 b=20B5BPeM4UwmZy4g/eudhf+IEqP0XVy0DmewljekKv8VCNYH5rEUhonHauidtV8dn2omS0I59
 kKvP4D2imY1B7ti0UHq5YXmlWRXDuDeAH2NiR1Q8Uc3U3Yxmkv84TEm
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


