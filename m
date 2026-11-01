Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570479;
	b=XQx3OzmMwnds5Hh0jlgY+3PbyDLvJCk8VsFSAmOQgGbLpFxO7cuZD8ev9KMdkPFn+qdr
	 D8tNU/3s/MgOZTi+w0S++aK01IOwwaROhqA7uechg08buYVchzByOeWVh7fvIsFnK7WvF
	 JzZ61mZdSMwmLnS1RwsceweyW5Kzo9OsOaUiLLvin3EkFNhO4Z6U2E/JEq1Nv/FkOFK72
	 3fkIfrO+hHDut7WpL17hZtg0Vr3HMDRMVX22jtLHW184krVhxbWZQlY9+Hu1dtz+yBsqu
	 +z351Ujy7moBB/NyxDqmUyRDPheblkjywBNCAMbcKKHB3mI2SYmcy12MYiJSayrqKaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570479;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HACswfW0Z9/TjG+zGW7wcxyXlL/3YQoIO6MSbN1Js8E=;
	b=LkIu6CEWR6dXhrRPDGay5eoFFT9iOYX0VGsgiePRK8oVIEDuWufdWYHO6uu4sp4bkuuo
	 D+D+5ClYv5D7n/Be5QaQPoHr37TeQ/Phx6Ffkx8++YiUcVHYNPtXHpT3nu8qAY0Guf3if
	 TceK1C/HWzaR648Dtq7bG8ucFW4ucYsEt3jJgqKjVepA7VNJ4T+pFzY+TadvWqzXbn0YR
	 EsDyHHgbJAy4AlfSmsbPsLYphPn3oUiwl5JUHTcrQKt1wfnpRMiyONcpoWLzhJKZ7JhlU
	 A/0jM4kxl6n3Sd/M1odTZEM/2caz2lXi7WbyCMewCWyUaHZttDz4CvTo1jxIKN8KBHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PHl5hpS6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8399606A326
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PHl5hpS6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570478;
	b=T+Zg0fZgKhAD0YNzvDB+FuV/sORhHGs7bPX56PADysXkbi1FekVgFkqr8z2DL/G1MUnc
	 k+ktiKFIfG/xaOgOSBYVAm3vOKEZoqV41zjeUF5bnx2yGJSYlgn5/ih2IJMpweFiT7/f2
	 WupsSXkkxUPxlwOtU83i1WqiRvXxHG/UL/KiZfwoO3fMNL70mrh6PBw6uSYDoJRTsoHew
	 ttZabkRyPm6pWuWZJPQXalAtXTEyK6JN7PVgZb7KZ8gSj6E0k2FFQKvLHpkzERhYJEUiQ
	 ds26rI4lW0IxUBImcJAe2EldOsxl/nA1732BZehjRwk7qmfrAppxO8BqV4x31kOB5Iw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570478;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HACswfW0Z9/TjG+zGW7wcxyXlL/3YQoIO6MSbN1Js8E=;
	b=j7nzdDrVzPJUzozFjdsvG4BGKwHDjjCIn4tel6uIhQlGHq+v1kewQ07KOyD8ZfaQTAdP
	 Qkkv448jhq1ETEH2RVEdAh2zM+7TJiPlZItxcM6YG9qqArZQcULiQFSUEjJ6Z+lL6Rb0K
	 zaSoaowzxaT/zo8kAIYlJPw2yiW/2G4YMzVcJqEFZNcpESGQ8ugC6b+I7/vcLUMvyGQMv
	 j0g6IzaoeB95gZkBmDxJ1WnedoGTGlzUV+2EoYKUW/PPMsAT9g4I5IthpDkBrT8fNPiUU
	 0HZcS3UH2siroJgK+F5MEoxmeyRs5o0HYBkd+sdecr2MqNIALwr0eAnJ3GtDnoUsQGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9393C1F000C1;
	Sun,  1 Nov 2026 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570478;
	bh=HACswfW0Z9/TjG+zGW7wcxyXlL/3YQoIO6MSbN1Js8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PHl5hpS6MvkEQIRh9DqqKe070Tr6z2uGvg4oKOSTZs4JfSSD4XiTCB9DUlFYWh9D7
	 GspZiULhBCklSGLbSXdN/ZzAYAGPnglC/Q+r5vfqWUKd7aJp5mTHDoCCKUYWHisTyJ
	 MyRbTKqt6i95KbHS7GcoENLZXeI7Fj8eYGf88BXA2OM/YzsMmDxSPQdQdekuOMm8g+
	 XvoXYx8nOrW39WklMmKEStUvDh3LTtj4zIknGOp98QJmVhursPiIzBKDiwR/1UOe5U
	 +RPMtxjsXYoSlHROU2n3vNbRLefGykaPcDwpgZM+GKZC3VVvLhuRTzxpzJNcksvgAu
	 z0pwfsQT9WOhQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 01EC3462A4;
	Sun,  1 Nov 2026 22:01:17 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 23:00:52 +0100
Subject: [PATCH 1/3] dt-bindings: arm: rockchip: add FriendlyElec NanoPi
 M6V2
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
Message-Id: <20261101-nanopi-m6v2-v1-1-e401ea64b394@gmail.com>
References: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
In-Reply-To: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570476; l=940;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=xVk4B1jOv3LSCGkGw0hfHKz0UpvYSO+VAerlPGw1LtQ=;
 b=1mnT3U+SfryHw8PD6flAr0YpAYDOqd7y4ItNbI9+cvvhiUyPQZK96kHFiqFMeoXVdQK9JEEpV
 O6aDLzIO3pJAyoBzN5N41PkbDHBONZZomYLUf1G1aZVzNLZtb3pDxWJ
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Add device tree binding documentation for FriendlyElec NanoPi M6V2,
a single-board computer based on the Rockchip RK3588S SoC. This board
is an updated version of the original M6 board with a few changes.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cff..70d78f7f8c559 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -392,6 +392,7 @@ properties:
         items:
           - enum:
               - friendlyarm,nanopi-m6
+              - friendlyarm,nanopi-m6v2
               - friendlyarm,nanopi-r6c
               - friendlyarm,nanopi-r6s
           - const: rockchip,rk3588s

-- 
2.56.0


