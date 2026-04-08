Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3B3D5256;
	Wed,  8 Apr 2026 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775661053; cv=none; b=N1rck5E2i7HTuL+lAJRusoH8qoCe15hrAviIBtPN1TFGBkyf8gn0hwakx1zwoTpMESMvoHutFjGMWBY4u5eR2BFL2VID2koekkHhFmMfAyu6As+9YTEDyEAXv3LFgAXBAhgHkhbEk0MiJ3uUaMgAlFPSRfjKPmrtqZEO++Y7HN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775661053; c=relaxed/simple;
	bh=krHcrTy9GfwPOCNbShyvwFBeiIK7lhgDWrS06pmnLWo=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=jPR93cj+uPjvCTjSmKWhqjqsw5vPo2Dvj29ItqD0z5o6FJ1SJ20VLYM3/ffAJhVEkP5fNoa5Pshy5fKghG4oDz+Qhzc5GXO7VhUsMD3cR+C/4CF9CFVgJzIZ1gefqM8QZ2BZatn9y/Z7kbkdHGCXQCbMdARgEzLPxTcuyELQZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=JyZTNfin; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="JyZTNfin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1775661042; bh=XKcq00N0DIMUELEWrD+WO/50AsRGlhm2DyseYU7P9tM=;
	h=From:To:Cc:Subject:Date;
	b=JyZTNfin/Z/Q7aX4Z7YpCGa6gt5sw6BNtCREM0hDfMw9pW/g5rpeQsQ1kQqXNjjlh
	 wgmxOpBb7/RIse8V9elz6FZTyeTr/67SWPyu6ndT1NKEP5sjLmX3hD3NV/iVkIKP6U
	 KVzTMDmk2mZhZvFkMDyWBd1YZTvwMti2xroYz0kU=
Received: from gwx-Ubuntu.. ([183.207.4.28])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 26E24EE4; Wed, 08 Apr 2026 23:09:46 +0800
X-QQ-mid: xmsmtpt1775660986thr6icol4
Message-ID: <tencent_CF3170E7191769F8FB22C55A0F952E82E105@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+5o4+1CmlC1XFFeZPOT/SuqiQzarSPQeB5pWLyZC6My+Zr9JEL/
	 urfH0ek6M9razrAqmSAn7ug0OfP4UideQhWr6rImYLHsRLmrZg5lTeMK/uxKPR01JH81YxPBuVwG
	 oawynLjtjWfsC+xbU7R3uExSYD3XJvQ97ERzJbFMY4iJ8iJ375v9RSdGLJDcoRpqGGUB8RfxS9d5
	 xF/Twp1KstRvsZFK7h4QKAkG2XUYTMRwLkk8PZOC1/Bxl1KMJQf2eklkC4cVDPdiPtIIFNWXLYVI
	 XNqAWv1ET+/2GQiQfTXKBjhHqHwQxDxj+MtvDF5iMC+2JC2dAVpTncIkPM77uOsnQxPamHoK+8Es
	 ppZhw6bp2g3phEWeP/ccqF4FPI9EyDINtuYihiI0zI707Rc4YYfEZBN6IQFg5X6btMPyGHA28ItR
	 +B4roC64gvg4tBSw7pJLeW1wDW8N4QzGHZntcVuZPizQMfTc4+4/+LR6U7eyZ5R/Ra2mAOW4Khej
	 2Nc2V6jn2kY/pqDZQ5ySLLIDrCplwIRGyqN4TmtW+dv5Ey+wIHHW8RLaL0bYPzh00j7CFGks6z3s
	 1s+3clVdG/ju4rWWYUqvpg0pIZXgZQjJbmmaF9b5gHp6J3yFCL9xQYJGawrixypQnCcAkHAhbQaQ
	 d+fjZ5hguxnTom/x9rfbucGcCXf+yy6Y38fSi7L3WMaejcODroqXkKlmKQGYGmVFOCgogByXfZqq
	 iOo8KbDoiy7CJaw8HPNoJYh3xsdKdE4fPHZLRkXuZtt0/Aqksr7HzE5FvbteF1GrSjYeMeztp0aA
	 PGpozq/IZUZfNxbVEL24zAyqI7fQeojALuwu/3VUpavtfQ9UQB4O1QvlTbPufaZIgPiLU2UWIizC
	 M8tW7kIfzTGJoI5QdlWQ+pzn63qluUlhsbgeXIPJCZzMC5d3nBtgj23ip9aXvzOwSQogBiQOl7Ux
	 ztlo4UWgx113X3KoDSIM9my4GwG8II/AO4lXSAJJCvhxGmTZD3frcJa39ZLcpErMDDMO05AK4qbr
	 Wnl0sUsQsY24UzIqpPF3JiEIyiI9AnORPMJkostzLlwsn7AAZbuO+aTx7zN1oNGxJTPBdkp9dDzA
	 tfzqo6
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: guoweix <2298701336@qq.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.kardame@manjaro.org,
	pgwipeout@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	guoweix <2298701336@qq.com>
Subject: [PATCH] arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
Date: Wed,  8 Apr 2026 23:09:44 +0800
X-OQ-MSGID: <20260408150944.177773-1-2298701336@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK809 PMIC interrupt pin on the Firefly ROC-RK3566-PC (Station M2)
is physically connected to GPIO0_A3 (RK_PA3) according to the board's
schematic.

Currently, the PMIC node incorrectly specifies RK_PA7 for the interrupt,
which prevents the PMIC from correctly signaling interrupts. (Note that
the pinctrl node 'pmic_int' correctly configures RK_PA3).

Fix this by updating the interrupts property to use RK_PA3.

Fixes: 30ac9b4e25d8 ("arm64: dts: rockchip: add dts for Firefly Station M2 rk3566")

Signed-off-by: guoweix <2298701336@qq.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
index 7e499064e035..985770e3a5e2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
@@ -245,7 +245,7 @@ rk809: pmic@20 {
 		compatible = "rockchip,rk809";
 		reg = <0x20>;
 		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
 		clock-output-names = "rk808-clkout1", "rk808-clkout2";
 		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
 		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
-- 
2.43.0

