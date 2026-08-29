Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FAA3451A9
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 20:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788035844; cv=none; b=umrIYcgotPHLMQ1/VGEmDLFstAB0QkS6+pbWnyfmDfTZ5iT5aGpjQDty8WZjWwc3ojFPNxjqbYnk9fxpuunfFTp7aWviLW4SmPZZruO9J0QYyp365tI4eQu7tmpzSHJXeFBdsUNxmFWuEaGhzeb8jNp1fe6o8CjlqsdRxY0TXrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788035844; c=relaxed/simple;
	bh=V2EzM9GSZHPxKG42rhvLV4dZm/L2p9HfxEU+IhfD584=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DYAZVsuNMcyE4w9SB48uq/8Ap0W2jjkCSCjXD+t7dFeT36/+qDNx+K4D+kcdSyqtPR2UKWFIeztJlWAUjdAqEarL8nAFZtHbKukqDpgLf/JszOtVCypfxaEve/fjCw1aPH6NsUFUDodDDIgcNyFtW9dRDHoOrtNkkw8zJaoRbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCeVsTZr; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCeVsTZr"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso278263a91.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788035842; x=1788640642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZKFaUDOk9+0vR+1B9jj5VFfzdasobPYcBQD01+SUsQ=;
        b=JCeVsTZrNfX7jxJrOhZeuFWB6/sVC99mGKJINxZMnNlN+rNUXY3IMSxvPY6I7Xf5Fi
         KDhuBtf907SYaVoxvbE37WuLIxvp84Kt3nXUUb6CQgLcNStoMPMVKTJVwuyC88JieRGW
         VYmt3fFs28z2JokNu5Jb3vDV80cEbIOn7XEHDcqn9GveJf/8zJqr3SosLdfREg9m/CwM
         AVsLkyI30za7OJBVgbboqYidPcgWaGjNsTCF772uJ0FR+A1MWwsY8warfyC+03jgddxC
         AD8HnAxLs0RSxZhqCaehFouezCpo0y4ht5hsknZNnbS1scqqE6Yj1ufqGhwgxitYB43N
         Wk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788035842; x=1788640642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZKFaUDOk9+0vR+1B9jj5VFfzdasobPYcBQD01+SUsQ=;
        b=MBOSpeWhuHinBtTi4NDKPjdKVKR4MyliA75+7f7ttFjfsTtZNn420ANJy9AjsXAms+
         iAINWubyQsQSeV4igmC1pY7jMlrjokUbZ0CZ9VydLpL2f8u+PvfzxXJk+o5l0b66E9lP
         a8DmFqEBQXaZVR0NcOy/ZSfiSiAi9bBFbXps6GtyzWg5R+bPynmjChGJUwrNlQS0Nuny
         0P26B/k3qBas8GCjRWx/kpuh9CgkHjDW+Va3o1gXMlaZcsOpGHM9HcmMVozFytcZ9mni
         eVYVTj/nxUU2gRtUZgLWbLfsEC91lhgGFouayA0J/hPaByCmOvs0cRO7SGnAoKeAVjt6
         nrsA==
X-Gm-Message-State: AFuF++mpDM77UVTpF8aNNo96f7kKuqBXiLgE2z3zelZsjeA4DEbwwxpR
	rLECcp4siLXQXQ6sYxaJUlVHYrSA3Xg4Vhrf4eOSsxHu7rFufTQJlGc4gESXwQ==
X-Gm-Gg: AYBFou3LVMyQzhTpr8+lVPLGnBZ0XFzUeGiq5mCR5b1IBJ+L76OYK3m/ybzvnPL0pEq
	BCVCDGfkDR3ErYnM9FY7pQdBpnvShrQO7dkqX0YROp8US9rDlJeoGW1Va7+CB71826T+ktfzXgd
	G6rFj0/odL1SQMXKHeHJyykpRn3Yvgmv1cLp6EP+m5tTBCCqUVrqYvcqIkXGg0pfHsBATsNM0YF
	vruc1nYQ2PLa34trFBpe337cfVGH2DMY7BuCcxYNZOg1OwmM2r1CQYbVWnRt9BIVkQFgfjfdcoR
	MxG57rFIH/olSIYlqbhmy92QyV2nnKIhL9ev3LEBWAx02yR3sMgc5w0WrwxsTvLlUjFOJlqHV8J
	p9TMhSZy349r/Pbef5EJNBEXxE1dSeHiNkIDmXWNiJdF/LZTBfhjCEvCblWprSR1p6FG2FI298P
	B2qX0sesEDmS+ndoFe3vu/5Dqss5LCZsGQO/pipftu8SMJ3iH/GUkNM2zrhhxb1zZz0hrnIHvsn
	GmlbTi544o4WFv9/5I3qVCgXenSoa8L/stkiMStY8P+RDwncai7evaaYqJbqhI0G7znIO8P+pLZ
	ZnHI6q+RXyFEVV/S1PKc/54Xd/322KEQF7y7QZpy6fNTHSO6
X-Received: by 2002:a17:90b:1a8e:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-396d0fe45damr27054160a91.11.1788035842198;
        Sat, 29 Aug 2026 13:37:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a2f5187fsm1771407a91.1.2026.08.29.13.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 13:37:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: fix spi1 location
Date: Sat, 29 Aug 2026 13:37:20 -0700
Message-ID: <20260829203720.44633-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This spi node is specified in armada-38x.dtsi with proper compatible
strings whereas they are not present here. Instead of copy and pasting
various lines, just reference the node in the dtsi.

This dts seems to predate the move of spi from internal-regs to the soc
node so this moves it in line there.

Allows proper probing of SPI at runtime.

Remove the microsom_spi1_cs_pins pinctrl group and its reference in
&spi1. The group only muxed mpp59 to the "spi1" function, but that
pin (SPI1 cs0) is already covered by spi1_pins, which selects the
same function for mpp56-59 in armada-38x.dtsi.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../arm/boot/dts/marvell/armada-388-helios4.dts | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 9de9a8a4267c..ae03d42f92a0 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -254,13 +254,6 @@ sata3: sata-port@1 {
 				};
 			};
 
-			spi@10680 {
-				pinctrl-0 = <&spi1_pins
-					     &microsom_spi1_cs_pins>;
-				pinctrl-names = "default";
-				status = "okay";
-			};
-
 			sdhci@d8000 {
 				bus-width = <4>;
 				cd-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
@@ -327,11 +320,13 @@ helios_fan2_pins: helios_fan2_pins {
 					marvell,pins = "mpp48", "mpp55";
 					marvell,function = "gpio";
 				};
-				microsom_spi1_cs_pins: spi1-cs-pins {
-					marvell,pins = "mpp59";
-					marvell,function = "spi1";
-				};
 			};
 		};
 	};
 };
+
+&spi1 {
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.55.0

