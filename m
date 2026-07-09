Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9793E329E6A;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607437; cv=none; b=OQhQ/kAerGAQv4dkPyTvHXp9TXM/Fmf40OPEjQTmMO5S+HYyo50gZkMW0S4QI1BD/i/Di6X67hpFhq23YJrVJxQG1I7Nl+bRBcY2v6k/igc+qD+gUGGf5dHko15NG9AWzGvAnzoH+KRvIM4fQTOjQhjHnhNQEO50+iB/9raSgss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607437; c=relaxed/simple;
	bh=zKNYhWho75+rU/ABdikQ1xUai+mDK7/BIyEbsmIRsHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJ76RUTiyycZdCxqz/4AnfV/7N3BgOpxaauIvIxfbDpniQC2rUzIusgVmJXapcZkUmWdOzOr2oCxNQvAMps/BYB721xBQcc4av7ILgSQNv9EE/F25Q6HNLhJR+Wf8Dy/G96PhMGI2l/DQBFOvof4cwMpM1P+t2slVdd1qtHoCuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0dMSXbb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0dMSXbb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A9A1C2BCB7;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783607437;
	bh=zKNYhWho75+rU/ABdikQ1xUai+mDK7/BIyEbsmIRsHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D0dMSXbb+k6nwjW3MWTkcPR/co+JjqhIn9OnMv2FfAyyc4bX+3779YGy6u9f/yR1J
	 HvCwsm1cMjXKwkH2qcYWNTuIaftDjdwNuJuqU2OggP0s55J9YNFPuYj1SU1yv2OnyQ
	 NnjlLxxaTv5OkYyH+BDolW+2QS7seRtwcetE6QkWs1TQaaZd8WbuxmwxiVWsuQ4KMv
	 OqT6QgIq79XltKAHjF32Mp+96BomT8j0YhCQLwaxWAzpOcft3ddDdBOdSvT+YQt3ka
	 xqNF7CU4nlPU/xMDDNSV7zefow9jf9Dgi7ytN3z1diF6ZfYg7As6AhQwvQSq6kUEQQ
	 n7Jb6m7h/Q+2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA92C43458;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 09 Jul 2026 17:30:28 +0300
Subject: [PATCH v2 2/2] ARM: dts: mediatek: mt6572: add cache data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-6572-phase1-v2-2-1fd4a69542ab@protonmail.com>
References: <20260709-6572-phase1-v2-0-1fd4a69542ab@protonmail.com>
In-Reply-To: <20260709-6572-phase1-v2-0-1fd4a69542ab@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783607435; l=1386;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=yG+0dUgYSF3RJV8lkKqGeDWHiS5d4OCEqF8neCRE0Ic=;
 b=uJvq72ISmk7+HZwoFzlOX0oC9zEZkyJaY/VNERaq99Lj8xDakWjSGVO13sDJNpVhD6hPwJtD1
 I9dPTHZkiABAY0rBnXD3L9pdc0xFRox8VcmnpFqg3tTYug7J79J64Sl
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
index fa0e5df766c2..4d5d3b46bc18 100644
--- a/arch/arm/boot/dts/mediatek/mt6572.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -20,11 +20,34 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <32>;
+			i-cache-sets = <512>;
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
+			i-cache-line-size = <32>;
+			i-cache-sets = <512>;
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


