Received: from mx0.gmx.wtf (mx0.gmx.wtf [203.137.112.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B53B2BEC2C;
	Sun, 19 Jul 2026 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.137.112.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784477721; cv=none; b=JlrLr2VkTdj3Lcin8hC757fAvx/y3cf9bR6R5Ii4XG/poMWj8W7hiAlF429EIvhnwOHzsSJY6OI9maSfRFtBwPgE+01vSWkcTvbouABdPxXTwejzuEAUOW39nJ5NGQGX8hYRSwgjw9YSyuS9KwprMaAIbhd4di3CGj330e9q8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784477721; c=relaxed/simple;
	bh=H2L0XwexQTLFwFIN1aMrdC2PYPHb+Q6wCLspbhgSNPY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gTX0W9+lRcMVFieYhjfijaaOcHzIqv2V37Hmuql9my1USa7yri/DzEQXlFnpUhQO+ZjLX8r98N81i/SmpBi4RZbTD+9W4uBOWlxXl5BUTXpYuPmlaJbYZixSpHg9v3OSNw7tLaR7g5OEt+z/rr5XIvqY+7g24qaMPC61MhyZGA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vicb.net; spf=pass smtp.mailfrom=vicb.net; dkim=pass (2048-bit key) header.d=vicb.net header.i=@vicb.net header.b=M9VoFfaN; arc=none smtp.client-ip=203.137.112.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vicb.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vicb.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vicb.net header.i=@vicb.net header.b="M9VoFfaN"
Date: Sun, 19 Jul 2026 18:05:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=vicb.net;
	s=f747d04263f05989; t=1784477146;
	bh=H2L0XwexQTLFwFIN1aMrdC2PYPHb+Q6wCLspbhgSNPY=;
	h=Date:From:To:Subject:From;
	b=M9VoFfaNZ6WWq5eFh++yubo2HQwK679uc7UkUqilrIeybYLyEilavjmY+kinBO/RE
	 1XM299z1BPWVI1NJD8UTZnZ63Id3HbtX8D8j5SnKk/T6twqMHQBcdgQ4Ee/6u9mFM8
	 FFzoUjn9crRmfxlDAX0N1TDw8zdLRti0JTSrTUj7NzoCAtBp9KUeSRoWk6RRi1CzWn
	 MyE9xFjJFe3XxzUYiU4F9qFOOuTeAKh8Q1i7FTCI9nAttofW8HMO4VFwmbvwWpTVE2
	 MAGgAsAP1ZCZV5bNBezg6UQzjdxToR1RN1DfhAIt71sXqKWe7MTsXgKLR1qn2uBCU0
	 JTaIgeuNc2VBQ==
From: Vic B <linux@vicb.net>
To: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Jensen Huang <jensenhuang@friendlyarm.com>
Subject: [PATCH] arm64: dts: rockchip: fix label of sys_led for nanopi-r4s
Message-ID: <alz112qGhm77liqi@vicb.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The sys_led of NanoPi R4S is labeled as SYS on the board and on the
original case, and it is green, not red.

The board also has a red power led, but that one is connected to 3V3
and cannot be controled via GPIO.

The above can checked on page 17 of board's schematics at
https://wiki.friendlyelec.com/wiki/images/0/06/NanoPi-R4S-1GB-2008-Schematic.pdf

This patch changes the label for sys_led from red:power to green:sys.

Signed-off-by: Vic B <linux@vicb.net>
---
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
index 4274d1b6e80a..6fbc76e2e679 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
@@ -31,7 +31,7 @@ lan_led: led-lan {
 
 		sys_led: led-sys {
 			gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
-			label = "red:power";
+			label = "green:sys";
 			default-state = "on";
 		};
 
-- 
2.47.3

