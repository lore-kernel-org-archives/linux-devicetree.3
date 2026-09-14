Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAA4470E81
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390411; cv=none; b=bTkt1L3PbqNkluOEyNcnn9EJisCgng1qkR5tGc5deVi623gN4M0x5fso2R/+5JnBURHskrnd8r1dA/YzYZRkRoDObLuQRWqrRA5lEl8IpnRZcU5jrGRjqoJBUX9ynIrMMWE2C4NsQIDTD4TwPi/EYSs2bFyhRzZmdowGGIU6kEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390411; c=relaxed/simple;
	bh=9MU3GlGUB1OPK/XpXe4SqAgEDW6zxQdlcL04VkOQLyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mMVJwkW/kxWjyXaFFPyoGgTdDIddrlzdglWJpSH8DhnpZ8zUgdaRoHBGR+cyGh/pF5kdwrnw+99UBFo5a+vPUIkBJQBL2a3Jc6ZL3oml1QvLt44ckOFlauWVoqWI/b0XP1aaeHaXwjmbKophUh3PUQ9OgY2Hs0RkwEITFSwS1C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2YYoThV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2YYoThV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso14841165e9.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789390408; x=1789995208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3kON4+baHQ2AT9bdbK8IFIq5pzfZyIIzNPdnsQweAI=;
        b=E2YYoThVHapCK8qtFsBg/sfmGrjkk2YeXPVNr/8A9P6LTdg80I84CuHlttgoVx4VH6
         mDuxnQdf4nAyafR1x6cbN98nSFWwA4+nD9OFQP3T1PsvFGV5ruxBz2lQcn2uUSpaulpL
         z9Aw06Lp0jCfN278+G9XJuN1K2buU/Q8km2FwIqenveDyjdzRGamHkaM+a336TOCKzRD
         DcJBAsQVkv9lSrbLxgs/o0her5FaZYdL8YWznX0DDt0MYvfg+m2sScfkDOYWyUVZr2Ef
         8xqYllWr22mCzuGYkQYzsrp/4/O8l2DUaxOA4TnZiFeJlm3RPsigTG74m3YSkt6TfGJE
         Blsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390408; x=1789995208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3kON4+baHQ2AT9bdbK8IFIq5pzfZyIIzNPdnsQweAI=;
        b=epG1arm7oolcPXzC/NM9FU1f4+o88S3o61CmFb7yh7bzypo/2OnLn9pDxguTW8ZPUK
         vZtSrN77xl0FUx8+7Yy/Zo6WNqQ5gQSBHAj8XCJ4scytBPAtXbXQfp5KOf5RWmxshdte
         4ALDntSaP8bJW86ty8T+crM0EMPGIh9q8tPGadzegO+7BaMA+2OjpR1l2ouZdsyL5akc
         TXGR+7qMVPCRii6XQB0DwzLfPLV1FyJ6oquaTqfihB4PT5l4+SQJonM0UiYBIq4lkWtn
         Bc1UYly63ef99l9qXx5oTYBrfPXafi/0jtSSjazPm7op8ey/9zg9krRDtxQn6dHN/8MK
         eZ+g==
X-Forwarded-Encrypted: i=1; AKwUvBxbZIzKX8iGqw2Jc2Lv/wA8zpC5KPxIt7AXX+MVV1LriudQEQfx2JGE2/ks+lZLqtKqyTNTPRVlqd1/@vger.kernel.org
X-Gm-Message-State: AFuF++kjnQLYD4HhuAo1E8YAB89norK0xgL2bl3gJssWYs0CEZKSpyCW
	CzPBi9bY2urf/R7DznNYBpPlMHjE20JjZiuox4WbQ/fRzJEz8ZSYgmF2xxz9RTrrIFjF7w==
X-Gm-Gg: AYBFou0TPGUu2tjMgVj3RYkV4Jhj0JmmvBY+eA7dvTuyz2KmFo/TvcWe/ebTWc0kju9
	iZcUgxRjk8262t0vAhUI3bssKMzv0nUm9e6YL1Mnwg7vektCa8RcMVFCcTkye4EIPg8YrcK2Kq/
	TwYqOwzO4RMl0kf10QsWK2OdxI7k3oTg3SOfHq02aiGTM0WGpkqfoxM+CvC3F2z19Ub5SBqYLJ7
	eI+PI7FFF+D8325GuAj/GxcxvJOrxLli7owVKrIMaKzCmoNgxOSUzRD8/k3jvg+2k+ke2XUQBCJ
	r8dEaXalpEWnXwUJzWmKZ0Xo2NOagD4MGut3COUG+JFpCDWRx1oiyCYvsVzb93EwE6ZgplHk/yo
	BBgZRiDodIY0GbMM4iC+5yK4ilykzC8LohdBQqrCSpWVimprKIDKKZMvP0SxrssqHD23NbtEP/C
	/jffvAkiaZAZmdBFdDOH60GIHHOEaSeoBpqZyJCwoyhzRuTg0TsJVkT1NDQlwk9njnAC9NvI8wA
	IEP3kzk0B7fcCrBCOwH3NN9k1w9/sz5JcT1+mjOnsrea0ib59Kan0QKa9Niu0Q0dPKOpg6q1ELG
	48CoJo/flqpvrulM
X-Received: by 2002:a05:600c:4693:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49e7a66b714mr30526925e9.19.1789390408188;
        Mon, 14 Sep 2026 05:53:28 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm320954365e9.9.2026.09.14.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:53:27 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Natasha Kovalenko <natasha.k@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: correct UART8 header pins
Date: Mon, 14 Sep 2026 14:53:11 +0200
Message-ID: <20260914125311.8354-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Correct the UART8 header reference from J12 to J6 on the DART-MX95
Sonata carrier board.

This is a documentation-only fix and does not change the hardware
configuration.

Co-developed-by: Natasha Kovalenko <natasha.k@variscite.com>
Signed-off-by: Natasha Kovalenko <natasha.k@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 3479abc25df2..9344a0d99418 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -336,7 +336,7 @@ &lpuart1 {
 	status = "okay";
 };
 
-/* Header (J12.4, J12.6) */
+/* Header (J6.4, J6.6) */
 &lpuart8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart8>;
-- 
2.47.3

