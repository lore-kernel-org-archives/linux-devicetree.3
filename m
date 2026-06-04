Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844C3E1696;
	Thu,  4 Jun 2026 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574016; cv=none; b=lXYWReuTDNLPuXe0Tbg9bn1b8UiBVjOYB+0nbKQUE8rxyg0PJBIme4CX5mwQUB3pppWex6aaZNEfo73XtKcyX7ChoQjcmRERJhBHlWQoD7ZWNjAD3iaaXC6bIqXDI4W4QMMopWEzpZf4RKzibrylqWcWqdcNZRGAH95c084jDL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574016; c=relaxed/simple;
	bh=fxjxwfx7XvPeO/NbiTK9kR5HAqqnG8gD+SZpa0q6mc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/v/u7De4OBDIHJERK3G8ETOe4/wii9VxJDj1gji1Pu47LKO4hxiW5x4lKOOxAnfeLUhpkCsD6tSf+w+gzJ0q5RBFj5muWOfO5wEiXpK5nc6JWGB1CWqsvPP9J/PL8nuuqvZy43GghbNwsUnNOd8fEDiOVR5w6bNuIpDWjHFQTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=qvZzV3UI; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="qvZzV3UI"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=gTs0cZaUUQQv4ViGpAM8i/wK3g92g6IK/a+nwJZu5P4=;
	b=qvZzV3UICDOkFCgY7HLwcx+xedy4EswQyrOGkTbE6euAjZINm+iEalinxyciLZlrOqMBeJ36d2RQ1yCRBSj2i4FHGW6MqMvblQV2kWIPzeBqreLHarfy7Xns+vnG2B8VDni+XRGP7VL5RIcbR1ba5xwQkdLrsbOW3IQJWhkf51w=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Thu, 4 Jun 2026 13:53:10 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/3] riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by NetCube Systems OpenNMC
Date: Thu,  4 Jun 2026 13:52:33 +0200
Message-ID: <20260604115241.1358528-3-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604115241.1358528-1-lukas.schmid@netcube.li>
References: <20260604115241.1358528-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added the "uart4_pb_pins" pinctrl used by the OpenNMC

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 82cc85acccb1..00fddedfa36f 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -191,6 +191,12 @@ uart3_pb_pins: uart3-pb-pins {
 				pins = "PB6", "PB7";
 				function = "uart3";
 			};
+
+			/omit-if-no-ref/
+			uart4_pb_pins: uart4-pb-pins {
+				pins = "PB2", "PB3";
+				function = "uart4";
+			};
 		};
 
 		ccu: clock-controller@2001000 {
-- 
2.47.3


