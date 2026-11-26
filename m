Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653444;
	b=gTASHJ3ojXvy0HjhIEbSSQhAvEiGD55D5mOXV5K6i68uXEItrZ8l92bECL6R8ohfOGEX
	 NDetMicfci8AbpHpGEiQXJCWsntZ3fZ6QqjqtEjmEJQQHB/o/YTw0PCyVLQWMTwfsfHuT
	 UeT6fYhBrsU797PBpj/NQ799hk9002wqoznznsRpWYQWbJreq/jQB4LOB49T12nPN6UuH
	 XHW6VcHJJUP2m07IfRcEE3FG18/lZQFjWDMgF0Kg80aGQCNPqbc9tYQgpLLWRoOyFay04
	 /N+gQSaHGeyhwrvgnvjHB9nO8b1ljbgPzkYJ6X2xigmFIs85Th+aKpNqoX5nBMG/HRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653444;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=WPAtgMgxEKWKs98SMk8PjA2m7IZXyiYi3zLjRxfu6cg=;
	b=cs3EYlvKfZfGMPLslVCkz7mblVOHpEGoElxdUIEebSW9astiEh0lqDM5xoxxpEUggPiU
	 vJIjfFLaJtV+KGCdipqmi7ve6AX/lyn8gKY1CjKNEHpkXkCQNlssvd6o/Q4jW+lxYYtZg
	 648beR1szMdKWpJwimSGUVn/CczWwOdWB2g6Ohrj51lyAJsabyklBI7NSYvuO1qBz8YX9
	 pc3au91oisjmVcom9ZidgQf3QkU6kgIwwUjEgQdAmK+L9ABFXWYVjz991cv8M5RR7dXFd
	 WtmUQuv0D9KmCDtg0vsMOkbModGnTwLZdy14/IUYRqAd6Qf0LskqOicC9r4geKoh5JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=esyhmBHt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684DC606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=esyhmBHt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53711F000CA;
	Thu, 26 Nov 2026 00:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653444;
	bh=WPAtgMgxEKWKs98SMk8PjA2m7IZXyiYi3zLjRxfu6cg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=esyhmBHtqVJ6rRTjtaTi8RAOA8c7+UnwGbpLfZLy1voYIte8ck0PhC+x3fYQ4RBub
	 N8Lrp4MdCMABV7Lh6COJS2s/LpwAiX5Tu7FD1QkbamT3BBaXlJ84zzoU0Ikil4E1+R
	 enOLmqlADrUUY3tdSkRRhwAGWESMROqnH2K35rz+3qE85INTrP8GdWMv7Qblhaq94o
	 +A2CQvLcAwlaBS1E5pC4UMX63bEYsLs3YC6m9y3d6H6C3rWxO22DSb939wG013oJ1P
	 BddXQadcLXlriqV42NDghJ3vCp8j5aXnXVtrZsElGuQbjauuOjqJ5h1V1mersB04mC
	 jiZDMrrj41goA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:11 +0100
Subject: [PATCH 07/20] ARM: dts: ux500: Encode Sharp proximity hysteresis
 as bytes
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-7-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The GP2AP002 binding defines the hysteresis registers as uint8 values.
Use an explicit eight-bit encoding, matching the values consumed by
the driver. Found with CHECK_DTBS=1.

Fixes: 2ae6193a1b95 ("ARM: dts: ux500: samsung-golden: Add proximity sensor")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index 3f5499a7247e..369572347222 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -248,8 +248,8 @@ proximity@44 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&proximity_default>;
 
-				sharp,proximity-far-hysteresis = <0x40>;
-				sharp,proximity-close-hysteresis = <0x0f>;
+				sharp,proximity-far-hysteresis = /bits/ 8 <0x40>;
+				sharp,proximity-close-hysteresis = /bits/ 8 <0x0f>;
 			};
 		};
 

-- 
2.56.1

