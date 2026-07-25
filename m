Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4BC2DCF74;
	Sat, 25 Jul 2026 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784978426; cv=none; b=BUpayWAsM62L5b1aHQgxmlNHph8RTF/I648a8Z6y/UQNtTRvJ+RxVUsqhQsUt1Ekt9swx45ecTi0wOfH0W8t0snfj9U1Hkv9yBc0vcu1Xpuhixuqo9Z6gYHtDJlfLyPQimslyPf8yruZapXYxxu5Bp70C2TvFg3kKsFBhrJ/oN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784978426; c=relaxed/simple;
	bh=nORByVcuztvWSuATQGRl/ZUN9+Z8frojPCDBSo1YEf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tnecFa7t5BXdGaUWspmdP7ZR1u7IbNqnTsQaVQ0T7CLCmuERCWvQvy1oHIke/cL8n2ozZ/mHLXnWPUr3HKdU745W7YtqlEqX6lC9/NH9xBXiLZ99uD2FoiRzO05mxg0NBAZxClXNN7NOwLkwCxUR2yy8My40t6UV/FHG/2YnH6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=VULL/qCz; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="VULL/qCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1784978419; bh=nORByVcuztvWSuATQGRl/ZUN9+Z8frojPCDBSo1YEf0=;
	h=From:To:Cc:Subject:Date:From;
	b=VULL/qCzPH/BYeZC4/MwvXZnuH0QM/zmDMIs2Jw4ljG8TMgIIDQHRytybuNgP09gf
	 mD8+k9gqbN3WKoYWy287eRgfs7PNDxjJd4CDV1cbbLc4RSH2sUW0TIq2Kyyq9mvdQO
	 loerdwP7OFRfQ6zOPrJfO4XNYxYD+5DK3U28szyA=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH] arm64: dts: allwinner: sun50i-a64-pinephone: Fix mpu6050 mount matrix
Date: Sat, 25 Jul 2026 13:19:34 +0200
Message-ID: <20260725111936.2245041-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ondrej Jirman <megi@xff.cz>

The current mount matrix for mpu6050 is wrong. The mount matrix is a
simple transform from the sensor coordinate space to the device
coordinate space described in DT, where, looking at the screen, X
points to the right, Y to the top, and Z towards the user.

The mpu6050 is mounted like this (looking at the screen from the
front; the sensor is on the near side of the PCB, so its Z axis
points towards the user; o marks the pin 1 corner):

           +Xs
            ^
            |
         +------+
  +Ys <--|      |
         | o    |
         +------+

so this gives:

  Xd = -Ys  [0, -1, 0]
  Yd =  Xs  [1, 0, 0]
  Zd =  Zs  [0, 0, 1]

Fixes: 2496b2aaacf1 ("arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer")
Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 4bc6c1ef2cde..f958bdbb0d33 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -230,8 +230,8 @@ accelerometer@68 {
 		interrupts = <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
 		vdd-supply = <&reg_dldo1>;
 		vddio-supply = <&reg_dldo1>;
-		mount-matrix = "0", "1", "0",
-			       "-1", "0", "0",
+		mount-matrix = "0", "-1", "0",
+			       "1", "0", "0",
 			       "0", "0", "1";
 	};
 };
-- 
2.54.0

