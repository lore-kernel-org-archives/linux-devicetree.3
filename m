Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C29B472065
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470626; cv=none; b=R5nJ6u65Ml1Cb4DyIcEufH7Eh/uLrUW5gJRiPQF/BbdxgVsH2QU8qiWFjHsn3rd0jZQs75SWbVEdbUzInscM7J+ao8dELhXWWEG8yKq8nN6mropYplG3hTw7sHZH8jymmt2XzE2rkfdPNGpIuSGUHXOftaKvkTnaUzZ1wVAaDOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470626; c=relaxed/simple;
	bh=yOFVVJPfeTgL0XmjdCqpthfqUn2/6CYfhyC202nVNW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D9dflUQqu4Ok/bXDEQHmcGYoGcxJkVZ7et0HL7vWUyvHoaAJ4IVEyBbK7U+ImFCVLaznwWNhgA4DX32FRf2zdPIoPp30TESXlcGdWNodKLmgfwgB+VlLsoKz5AqXdTgWuS3aqJSqjFqDCL6eNvxVsbKigKm5xpWjRBx943ViQ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3HUnkgf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3HUnkgf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 327ECC2BCC7;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788470626;
	bh=yOFVVJPfeTgL0XmjdCqpthfqUn2/6CYfhyC202nVNW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r3HUnkgfupAHAGlBxR372xwDG4+txmLcgPlYvrV995LrVL0gRQ5VU8/cQYMbSVOCM
	 FjiS51rHjSM1cKZyQyh54ZUD1KTfoZQx7BtQQoI5rNF41PH0DgoeBLh3SO0MCEZzct
	 aPF+M+q14PKgNmyHx5tikLoYJfTq5fMP2xRr3wKwgCZCzZIRk547gYIByz4WNYymub
	 oow+IakjLUqEn+J5PUxvM9Ds68UKhr1CL3KYU92W3V6dE40zfh193enfNx0ivfVbm/
	 M1O+Dx3td6e3D+5sNphc/nuCH/j+3HmkZxb4VRS+21+fIsgoGdLzAvA+Uc0M/fsHpR
	 SCrUITJ9SomTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1378AC61DD3;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Thu, 03 Sep 2026 23:23:13 +0200
Subject: [PATCH v6 01/12] dt-bindings: arm: rockchip: add FriendlyElec
 NanoPi M6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-nanopi-m6-v6-1-37416bbd6862@gmail.com>
References: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
In-Reply-To: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788470611; l=1140;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=fOu3CGhiav38hA01fmgeHu2NF4BeNl5uB34a+yVtkW0=;
 b=uefJr4FQoxy3pLcdVQ0m00j+rTituvSfrfPZBy4B26LlsCtFFEFinkX0jh3aqoqO/zfu87l+e
 bcsyBLsPjebC/2ReH6sJ8j3otYOqUl5BiXhlyWuDIHbUeROyJFCwcCE
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
index a799bb843f74..d8cf33f76090 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -369,9 +369,10 @@ properties:
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


