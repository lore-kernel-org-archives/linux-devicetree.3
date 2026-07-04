Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E78030FF31;
	Sat,  4 Jul 2026 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783192906; cv=none; b=ThzYq/nQJTntqEfsWWRq/KcjhyAceUbMzZEmOzbzroUIfv1iZ2gxreOS+cOotEQWynvb5p6HZtFvQWUQ96DkjotQaNqMtUcMKIDclHPSYi/Z3obyKxaN1GPc8GaxXDg+fLgk1m8jr+7wKxo/aoVdOqEGbM6OeFXAbeDOO/R0S0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783192906; c=relaxed/simple;
	bh=9DFNETMVj1y6LqC/8kUN3WRmPvqY/OPjVK2Q0keBtQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bx9qaoFHrz0DKgS1a2PTc4ZF+i02l9WFn2om8KDgq/RIKUByymqgU7E2dnTKnbVe7BOpAE04+c0ygyb/W5STwRZmMxwSV9tc/JMjLSIDBylRh/E43QfyxmM/zjT5yQriD+9lV6kaAkRrgDSoY8vqubT3WIcxeAdOr6BUNHsOjx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTTKJ3Wo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTTKJ3Wo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05023C2BCF5;
	Sat,  4 Jul 2026 19:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783192906;
	bh=9DFNETMVj1y6LqC/8kUN3WRmPvqY/OPjVK2Q0keBtQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KTTKJ3Wo1+iTpUO6RLNmFPhaZcHopQhdx3qcxxzYSYkhEP1jZRDlR7sUJBD9jSmuU
	 6jFWG003Y9IJM4hqYWoBQY86wkKzNklI/tIvCbLDbmY8XhnCqkZFwXmEXemf7365a0
	 WMbe/P9DbaIubW13XVp9lEWXeP6rdDrX1awILgD1BotVEMuBgWMpoyfFs2xzl43/mp
	 NlOU2W3C85iamvyCMS9AtLlLpMbvFB7h0YhuHeQujWDThKtDRD3YQxJaPYUICYxPYs
	 L0OLZIP4EVPXdXlR9gU577rgPgLyl3wk0fScB7rUigtP/PfQZ6H+9YuayEa0fnaHKU
	 HXeLotrmYwQeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2AEC44501;
	Sat,  4 Jul 2026 19:21:45 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Sat, 04 Jul 2026 22:21:43 +0300
Subject: [PATCH 2/2] ARM: dts: mediatek: mt6572: add cache data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-6572-phase1-v1-2-61c2fe6be19c@protonmail.com>
References: <20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com>
In-Reply-To: <20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783192904; l=1386;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=SDakxdcc7QkbCtbafL/keArn3jI3hsMDqsWxhluf3lA=;
 b=D6OZSx1nW4RarZ2Josaqo2/lJX3OtNQVawPvXYZ6zqjyvMR9rd8EDHavRzVnU8ZJGSlS5jPk8
 qV0iizoUJQRDBHuwp3dg0lIrPrwJg3+6W0GS5SHerkv6m32DIAxNnSI
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

MediaTek mt6572 includes 32 KB I-cache and D-cache, and 256 KB L2 cache.

Add information about cache size, cache line size and cache sets to the
devicetree.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6572.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
index fa0e5df766c2..5716505dc9e4 100644
--- a/arch/arm/boot/dts/mediatek/mt6572.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -20,11 +20,34 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
 		};
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x1>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
 		};
 	};
 

-- 
2.54.0


