Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E403D091D;
	Mon, 27 Apr 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298384; cv=none; b=EtoUvNS/5WTk6Vn9sjTkagKPcmfGL+FSYLLNhmPvw/nqqzDFpYw+7USH9l03L1NQRLHuFG4i8F2BQkfGRsbWekVygAAKc8wpBJeRbROVqSW51J50BH7ospLOktNEPLXjcCUeY7rZPZM+DQE7JrSsAM7ualRX2rbjjelOCjZu1Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298384; c=relaxed/simple;
	bh=L+1lQFV9aEJCS/bnSacbBfK3q+IBBRdcXHEUYkOl+U4=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=GDwU6p5oOjv/0uKiS0squOxuxsw/z/WlCstRrrGJGTryre7hvoe2CrG+PaNMU7VcTuu6rgDRsrsrH2rPbzkXF6DomOhZcsW2GhFcemnRBrbs0ZYRJILZDalF/unRln+ArlFfZvTeqF0jwxL35q5V+Fqhxgh63E8IKohqdTQnIK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bG7OzY0n; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bG7OzY0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777298373; bh=uhZliK46vNmN06GpBmT72mPTDJjzjGf3JsziDVDaJI8=;
	h=From:To:Cc:Subject:Date;
	b=bG7OzY0nJUBd4Wv6gX8j2lpA0evi70ZCH7BY736jOlri3l1oXN17UXoFKy3yHNxr8
	 RL3J87ibWM/8UjcJOcIegyl56j0dlX/QcfNgx3674UAclrZqOB3gBx9ToZYip6yOob
	 9McN4QlSlssgo4IOwqX/3+GHUoN1ilFMY9jmHYvY=
Received: from gwx-Ubuntu.. ([183.207.4.238])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id E860F2C8; Mon, 27 Apr 2026 21:58:06 +0800
X-QQ-mid: xmsmtpt1777298286txx3ao52a
Message-ID: <tencent_5035EEE630C845B1B51DEA4284DE23DCCE06@qq.com>
X-QQ-XMAILINFO: OU8np720w0N4z9oo858OjYSsBcV8oimpQiPSUMGVq/7ow77ou3/FfoYom8RgNk
	 KSHn+N5dq0/lG04kjGYkaUBVlVWAruhA0mIYv7N4PeaP+n6jJUdmyuJ0ELHAbdpTszJ17I8Xr9+0
	 35cyfi3KcMZCJviFAIylT5dR+784ydOGIUs4dKQF+CZo5jlDxyv7bdJbkKoUqtNLVyeFTvNNOqH8
	 SYnz0wjdbGJH5ExGXioHQeaTHVVx5i0oUjMy/zvzF2UgLVTlWUYrr33PZnbadTfu3gCq3htt0f5v
	 B0mUb0HVGOgGQhqWa00rdTPjgol2DrKUZk2F/Sp4Y+mJVIdkvwv03CMYWl/mpDwobzx+DAURuxnK
	 nSQ00nIcC07g02XcXX1qC8qE2ecnHNTb8IMyVhUTBZbZqOAswloNDaCdOdRfeWjrXuc8RW1QeFu3
	 nts/4POZsMXPfWZBij9hXiXjKP32cbaT4Sf75VSGjnNsy5Lf8UHZbOEaut9+Ruj5a+ax+jEzbPuN
	 3iak38TQZxcItD+nDq5TIPDKjdbPuv9xk+jiidZaZ3Jbv2Gq+dKDjy67deO2jYmvUwFQ1aC8NrnD
	 mtrLyt/GJEQZCi3hhIH7xqXKznJH7Wfb+D6+InpSGI6JX4bmx7WduG7QNn1+8B0KE2T9XVDhh6IQ
	 nkNZMBi+DucXp63VUzri937Co7zL9hZr0cDKPzc4lMvTovCpOnOVDLJYh6nmCSi9/2GBo7/hWPQf
	 CYiygnnYNFecbzsGlKIv2Ho63txR1Es7TWdA/XM5npr5ouILdRhESnn985VSHoSSAZeLR7gq2Ukn
	 AV1aFx+RufoxNiKsBrpUBIZmZBM2kH0LH56PwkaYgmp1uqN39Dg3xnKKH5IuiFZx+3cW+1FScmt5
	 FzrwAUSlH4QaMV+TipXZGHyeHAnRsbv0wtffr9xjGlAcFLLOSptgJ43Gjjx3g1UkkPztnX8gnjOx
	 /uGIMfLdl60fcp+Hh5jOPfUXzZ6IRTNqc7BsSmmfAc/JEp+tQ8AobEXUyahYGIcq6k8TKXv43TC9
	 6Z6dIm1AGBur/jd7kAFV/XtdLQRB2XK/1iCYp5975UW6VlUSi8NvVFLUpJTHk5Xo32o5+kgyL5hy
	 TMyWps3oL5YCVKDOioZn3mw7Yz24xjrVWkq6SC6pHq15S8ZJLVsWkpT2k8FWXIs1QZGZI/42vE2g
	 qP5dI=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Weixin Guo <2298701336@qq.com>
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
	Weixin Guo <2298701336@qq.com>
Subject: [PATCH v2] arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
Date: Mon, 27 Apr 2026 21:58:04 +0800
X-OQ-MSGID: <20260427135804.754895-1-2298701336@qq.com>
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

Signed-off-by: Weixin Guo <2298701336@qq.com>
---
Changes in v2:
- Updated author name to standard "Given name + Surname" format per maintainer's request.

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

