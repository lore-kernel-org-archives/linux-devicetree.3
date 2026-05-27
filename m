Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4BB2D97AA
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876308; cv=none; b=RjFpM9bLWnuHLe2SqqXZdfh89z6mdCx8pVfMnsVekaucqVvHSRmv2ofuCHclbdmG3/AtTDY2/f9Mi/sdQdZaHvp6MeEWKd2b0zy5s0GFl8YV8+Mars2F4aBRgwNYgqYYImB4V3DleJmfwHXBF6hfGu4N4k7FH9plbc4Lpo9cP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876308; c=relaxed/simple;
	bh=XeemKR+lU5czrivPSjCoQAtFVuS9QnNVXdN/zCjSJb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VTXXJ+UgATaSqI+tGV8hQ2+eX65ZcAa4WXNJHvaUAAL654KfcUHpG4OHwJDrBsl8bSSZ86BetCPm9H5HNukFz8n8e8gykfmBDEvxJAof39B+oZehzT1XBWtEVEr7BMt5wlqc7Yf09aqz/hQmQGTBf7AxMWJg53sN4HSBaYybUUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJzmVl2n; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJzmVl2n"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-83f674f978fso4488192b3a.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876307; x=1780481107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G42y5I8R+7FiVelwxkSPiySmvc6XEZZzbq1j+Twey98=;
        b=HJzmVl2nj/wZQoELi+5azQP4hhGy2stGsncFjnwXIyvostouNpIntErpRhJN4qhslP
         RQKIQ43hXznxCpn0RivbU23sByQzoFGy52Irgxi0usLBf1xpBbSPthM4VtGIliSWzl2M
         XrL7mRJxMBrcIxaTxV3s06MLH9lpvi3l8shXavjOxbOV1PhEJRJOrgNavN23CE8rV1AO
         emOqKnQp4Fqh6l6e31qWxuqcjsSdRBSp3zduqcwCbC9yIZH5djN5zpqOXCP5Ed7a5+EV
         hS8YHMAC2zfLn3eteT0UJtOEFIiPAQ2omKspLhYDjqw6vd6GK6pL5pgvesaIy9T+JNA+
         Vx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876307; x=1780481107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G42y5I8R+7FiVelwxkSPiySmvc6XEZZzbq1j+Twey98=;
        b=JH21UbcZgyEEBO7rIrIdaT8h6OoIbW7nCqNBy6S7lCMB/ArUQjeyD7HAP5NX/xkZzk
         R3RnTb/BY/apQbvy8xV9Mv00K/uS5UqO9BUkYSr0uLB+WVMManfVaNENjBmigZfg+S9V
         0RLQhVYr+0X+f9Ec0kNtmcYCkJgZ/sCWdyGDNEvRELwQmOPTymAlUQA1BNv7XZHJ9MN0
         v7Z5RRiZDow9JJVMN0vt8O9MbEgSKUf7PGo5N7lmHRJu+SzaI4QlvgNKO5cduy7e/meN
         H7RPLT9czdovDbJSk1uWVWqjLB3ZOcwgDnr7Id8um1lIYJKgNk0+gXTIHTi8qWG7/JUg
         bL0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9fIj/Xjon3XmtIN0Wsbl9W0oRCni81nqxqmvLc1R3eceuB49IHlA/rfVmVmxKWRFOejqbBIj6iOaAB@vger.kernel.org
X-Gm-Message-State: AOJu0YzAc6h3q7qEuErYcvrXtVT0/Kaai2Oq7lopK9gIlgVvNp7m0mpu
	GRBqinUVBca042Fq3kScCUrxGHX0cpTOUAaAIGoavQ16GVCaknrZXjs=
X-Gm-Gg: Acq92OFomXaW3io2FVHSsMKKQH6GZniYLSX0F9sm4TgzqTzpnHX2bpHZ/EYDB6vLP1Q
	puTlqaVA8fNwmFcG3mkrMEhltB0zyCSGOmWY6vVGYWS2OhVd37lSycZXGckBsZVpqzBNrYOZqdE
	RZqgtuCBG7cIymXVB2KuTa/VdBDhN35vh2cKA+XqHCyM5QyWc17YvGKFaL9vaqCG4HSXkfyV+JC
	em7k3oe9o1Z0ewLwRfqfPbIjJbVAQBzZC4fvLWxX+fvuzt+12V1+51A+03Aqvmbj3TQIRCtU5oM
	9VkEDoyigB7C0VM7RnczcFA5QR2f+hVVkeIwTiZ0Hq9uT/G4vXLbjlP+4Ar0Iv95uHuf3k20gcW
	3GkCHWqni72VjUJ0vGuPFAco4it6p0mOGmD/l9LiuxNoPQoXiA77E3K35+pdIPUaU0PAMbutHXh
	TQUNPlJCbWM8Xdh5rVMqWPF1U7nniK3ohO6R8Uh5qojEglPPnoc1/2OO9bnP1UIbMJ/w==
X-Received: by 2002:a05:6a00:298f:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8415f586b5bmr20394695b3a.42.1779876306515;
        Wed, 27 May 2026 03:05:06 -0700 (PDT)
Received: from localhost.localdomain ([211.196.223.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e806c7sm1951266b3a.1.2026.05.27.03.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:05:06 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: bcm2711: Fix typo in gpio-line-names
Date: Wed, 27 May 2026 19:04:37 +0900
Message-ID: <20260527100439.2507-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "RGMIO_MDC" with "RGMII_MDC" in gpio-line-names.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index 353bb50ce542..5469fa663526 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -110,7 +110,7 @@ &gpio {
 			  "GPIO26",
 			  "GPIO27",
 			  "RGMII_MDIO",
-			  "RGMIO_MDC",
+			  "RGMII_MDC",
 			  /* Used by BT module */
 			  "CTS0",		/* 30 */
 			  "RTS0",
--
2.43.0
