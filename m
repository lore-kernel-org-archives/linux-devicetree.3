Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777988;
	b=IzGMtNkHQIaNlP/dOebCkPYfZI6RNnRXBk4z/QW64uKp14GG7/Xy1c9pQp8ZL6a1R6K1
	 8Ms157Km141GJerHpkASmjPjwX8vuhq/BwZXz0t9/OcOjhO5bfqL3XGDFPFKHjPHcrqr/
	 WinzV6zZ0Wuitb6OX660abz90hm67EoykJMh3C45xWN2Dt8GwgKZMAzt3ogfi9VnsMvvd
	 6lYc9uxj3XxwsIPcYe+f/V4qKdPh+Hzi3L9F01Qggk6L8m/kf43hZ3B+YTXecNLGrrjl/
	 9pZfTnlwWhWRMiDkvpCXyqMUF5WoETzQK8Zxm4m9z1s2z2LTSFpLMl8+XAZBkndEMVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YQS+tCL9sVo9f7fH8XlWP/aawkwSF9CY9qYv7xaHfik=;
	b=jIzEjkpYwgVJkbpM39Z2RVj2f9Somm8rx6fGSeH+fus9XoqA3WlEeEjUus/97QJEBEeH
	 4DtJxTmeIzHzxyjMFRd5ad8RRmCR96bicDpuIXcLHcc1HSJYSsicfKxiIYrwhdQK1ZvbE
	 M8otsU85Gjg24lN/QTIV1e3/q+Tqwrz10vWIe1LfTz2HUTWOP928Lkt8OylvEYninZQ/b
	 A2P7blko/2BnivYeKBCdwB2SkXwFukHEZcBwi2DL3SyOZCoQUrZk38jkQm+yffJGt9PUP
	 LEEc0PeZR1jfZEkw3phS/+trEhbV5mXBHbEvgxDjUqlmvGOIw5JnP+juuBe5gW/si6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C2Up8foU;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E97D606A32E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E97D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C2Up8foU
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso721699f8f.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777985; x=1793382785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQS+tCL9sVo9f7fH8XlWP/aawkwSF9CY9qYv7xaHfik=;
        b=C2Up8foUIFI3L+OewOv3xFtrcYwpDGTVenQDRJSx1OhEgx2xC7KUtYzRqaqyPu0o79
         xvKiL2Em4ScCMnyESqmKuV+r3yyFmhcUY9D/E782tV+HhM78lubUWkOUeEqD1xunwT27
         rvfppYP4LbmWl0ptc3Uvi2Nw6bbsThSwMaPwqzgUhvMc+HkIPmCahDl9MTc3+cyNIN9I
         21nqOYFYHk/wgzDCqiUw/opev0aXcFjp8Fq+w9EAtT2LperNHiNREwlVQIKfT6YvqrkT
         yjlAuuqHwLr0YyukOGOQ5p9DpCyZWCkX2mRgQN8uYzxGekeI5c47JkFNgZtWUPTzmrHE
         rTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777985; x=1793382785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQS+tCL9sVo9f7fH8XlWP/aawkwSF9CY9qYv7xaHfik=;
        b=pL4/z0yc8Kx0gbbFA7NNS/olV2/b+Q9mmzMspxsGSDU0WXyCmNSnXbGkM4JAtMBJhM
         rypgz9KN5ERTLNZize0NxTMXP65eGd0wtqmXLGkQPLg4xJwW/pAhU7uHXAPqZ+Mzv2fG
         c0tNb1+1+ZzTMKNdxBif7PyD09O0tY6uNSZfs1elAUJyYXoXiKO42WZrx7xxn1iQnZEv
         L15l4qzaZyom7Zzn+2VpT+MDxTYKNUk/HsOkjULF02cBlb5gvb6tTbG+Mpl/FNDV03K/
         lPFLdBEU2bxUGcBfOsyifEM1cVi8hceE2CUdnMX2B/vuzJ7YJzrTittVGHFXOxi8gIy9
         tKSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpHr7tF0HQq7+ht/bS1eJ9R7HMR8eNX0PtovaxSqP69osYC05NvUyOudt1Y2XDxy1A+Jzxtm3ml80l@vger.kernel.org
X-Gm-Message-State: AFq9FYKeThZdO9NazlZU+ixxzmiqT0QpKG8R+L5IFt6d/ICctBW0AlLp
	6sVXmOuTOaSbuPAcl53A5ukG+wphHDQCFFWWoFZlZTiIA0lgN6XsYfRT
X-Gm-Gg: AYBFou0JRpaXccW0yGNClibP5/iWV5cYo9QbQvss0CkVaFaKBfixxw13sqYm3P+J/Eh
	WjyRjOu3BZ6yKR6KyM1AftijTShgwnhrxIyvocptWeT725o7zOCuWyOzfrk3X5IgXm+08YMFHvS
	weGcyHqSuDVYth6QdAH1x//KuV2+IuscFTkKS13PziTtCVmfEBq86dbtnCKvqvyTR8RAC/0V6ZQ
	2YjtnNwm0ocK9Oadn20GNwRwqo27VBPaec42/ivieZ28QgNc7nyznDzvz3jo88QNa4fZR5H8vLL
	tQ+h9TRChU3fmfeBmr1n2oHAJQ/wv3I3Zeyn3hktU58nGwhtAYZCG0FQc2JVC/FAHzmzBVfo/N4
	EJ/JY7978+eCbboPK4ZPfhVMHwlmzTzkZZr9V7CWuhptx3WLNhRIHlJN4y565C91nicPK4LwFbp
	qz95kDaGIpTqGXRFKLVaN1yTYWBKNoiYuQslBx+T6/e1IXj9UP4zqOWF8vwDzcyNrjCvHeqWQqH
	39NGNEv8SczjW0CBGI6ZCFqmBANjlrTO9PGtEjGLdpy1M7Z8kTt3vu+6MG6Vsv676s+
X-Received: by 2002:a05:6000:184e:b0:48d:f855:d1e0 with SMTP id ffacd0b85a97d-48e385bf552mr4544912f8f.57.1792777984621;
        Fri, 23 Oct 2026 10:53:04 -0700 (PDT)
Received: from mikytux.basilicata.nnxx ([195.32.70.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6bdsm1135313f8f.15.2026.10.23.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:53:04 -0700 (PDT)
From: Michele Salerno <mikysal78@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michele Salerno <mikysal78@gmail.com>
Subject: [PATCH] ARM: dts: marvell: armada-385-linksys-rango: fix wifi card resets described as LEDs
Date: Fri, 23 Oct 2026 19:53:02 +0200
Message-ID: <20261023175302.2102555-1-mikysal78@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the WRT3200ACM, mpp45 (gpio1 13) and mpp46 (gpio1 14) are described as
the "wlan_2g" and "wlan_5g" LEDs, but they are the PERST# lines of the
2.4GHz and 5GHz 88W8964 cards: driving them low holds the card in reset.
With a LED trigger on them (e.g. netdev on the wifi interface, or
phyXradio) the card disappears from the bus, its config space reads
0xffffffff, and mwlwifi logs "adapter does not exist", "buffer is NULL for
tx done ring" and "can't get hw specs" until the next reboot.

Drop the two LEDs and describe the lines as the reset GPIOs of the PCIe
ports they belong to (pcie1: 5GHz card, pcie2: 2.4GHz card).

Link: https://github.com/openwrt/openwrt/issues/9517
Fixes: 41c865209626 ("ARM: dts: mvebu: add support for Linksys WRT3200ACM (Rango)")
Signed-off-by: Michele Salerno <mikysal78@gmail.com>
---
 .../dts/marvell/armada-385-linksys-rango.dts  | 31 +++++++++++++------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f2..5209e06 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -63,20 +63,33 @@
 		gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
 		label = "rango:white:sata";
 	};
+};
 
-	led-wlan_2g {
-		gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
-		label = "rango:white:wlan_2g";
-	};
+&gpio_leds_pins {
+	marvell,pins = "mpp21", "mpp56";
+};
 
-	led-wlan_5g {
-		gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
-		label = "rango:white:wlan_5g";
+&pinctrl {
+	pcie_reset_pins: pcie-reset-pins {
+		/* mpp45: 2.4GHz card reset, mpp46: 5GHz card reset */
+		marvell,pins = "mpp45", "mpp46";
+		marvell,function = "gpio";
 	};
 };
 
-&gpio_leds_pins {
-	marvell,pins = "mpp21", "mpp45", "mpp46", "mpp56";
+&pciec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_reset_pins>;
+};
+
+&pcie1 {
+	/* 5GHz card */
+	reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	/* 2.4GHz card */
+	reset-gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
 };
 
 &nand {
-- 
2.47.3

