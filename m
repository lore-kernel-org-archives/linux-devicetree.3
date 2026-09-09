Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED8B3F1ACA
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946103; cv=none; b=oySVfEE1hkH0tsLsKzo0PNhMhYqLUo6k2nDiHp2Tsmw5+Jb21l8kFCzakpljDP9MUxl8MrFIAQGFeRvNFcJZeomZKhMVNtS3Ha0mdI7M1arA8o/1QukeXryLc6RFh7hhkM2YAW4NU6qDcji4Un0uG1ODIr0rioVI2JtdSt5BjsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946103; c=relaxed/simple;
	bh=w1bKyQWKw8iEtesnaXqouFCOrAm6kxtFiyY3O7rUloY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rY2UN6TkK/mZELsRseTJTH82lnVUKr514wI8fD7KI/UKI6UVqEyzZn0WdUPCKEIG7fBdxMwHUQ8IdUaeTeA8VSX9Lt4dMtuaGyasLzZbUOtxSi779PaC4kg4GL8Hu20OaoIxU8pMjUZA7MzRgZfb1ugJQglTVhrdHEVWOHFD6f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCeKaH1J; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCeKaH1J"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-855d2bfae95so6488515b3a.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946091; x=1789550891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=pCeKaH1JttdvYhBGl60y3e0PfTY4j38fxgwvxoHrXuWHJOnHoJ4+4Y1e26gIO9Tmjd
         W/YZTSHMJFrhUSafmPjJVXZa7DtZ7s05t0AFoI9SI7iVwk69vEpBOJqasB9hty2Vtqle
         uAKfIVZ46Hwl+NG10YCUHmEeNVtOtP9HczoUzR+sD8CevNJjlj6Zf2xBLubLUcKRCeEq
         Y19D9ULkLWkZ2SGJzneKU8oy/NFdax4UN55FH/CRYA/7F8JHlrB8h1wJuib2cz6swT3K
         dZ98C/vcDjdVQJ43KN3sNCjJ9YG6UcFEd+kPpU6br43PnFfxmV9/RkICcxfQr4F6cr4U
         ddEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946091; x=1789550891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=MMAwk8ZY9mFCHNqSGfYkWZdaVNZZund1DkEz3nen55YCJoimWuyy30ryU0F7OEWYPp
         05Hd/R2PGagoAbwYUN3uNmkhPvz7ZFMRVHfGMT/4hZ1T255Re0OOKZDYATf8TiGmqVhL
         a16u9+mphwrvgD1zOfuWudH9Mc6TP3PyqdkTo+xNY1wgb04SCjyHmkW5CdsxIEGKv5Pd
         2tRAuhRenq0FLIblzdML6/0hy2+w44FLIsiu0LfvJFaOB9/qoMIkR3BWU3oe+dmqf2Ln
         FG9pYz1bNpL0rU7bfguwYXgm+iWAbehU1HKcLANHVmK/GdfcVa6HlNbA1P+oL6hR7bZl
         559g==
X-Forwarded-Encrypted: i=1; AKwUvBxuLtVSLGCjzU2Ll0nTXTRz5eea/YzKBUSHiwNwkmk4Z9DBIrFEmGxZK1NBboToKarR7uF3no4BTqTs@vger.kernel.org
X-Gm-Message-State: AFuF++lfO6ZxKL7NZnNU9A+yeYmkd+pfX3RRYq24Az8XTPJMi7rO8WwG
	NyQ2v0dMv6dXJ9KI3KRsMblfSYzJ8USGyJPXJvTeDKpWm8/h8GCKdGgc
X-Gm-Gg: AYBFou3ZFB1OLpulD8qJvQdAGDM1kEsR8mEKPpLqevP5JsmqJphxi03xsVv1lSlbXqL
	GkKZiUvJAwknDlzbKCiJ+jAI7L8FeyFrLAEWKpCqe9OdBiXiPFxGC7tPNQeR2pu+MHJw8XQYO5j
	1fDIQggkYRrKKyJ4OaChFN8Y0NGgVzHWG0KRGM5Yg6XEhQ2+VZyfFBPxkMuvEsSdTAJHvFNxSVu
	IF2Hp1asprvDFsgPIuW8ML52tJwQQalkbCvXQ75PC8i/YWeFD9InfhElQlnlEvX59/bEliPFQ85
	DIzB8/9j8x/mOmpUM7kX6WdwnFXIofBS0g9/3tI+SOGnEobUckj4Y4PPXDFKfOsB9RiQYIzuFnl
	UtcTwzo1d78cmmKHubThmfJ81gpvh5pXwu+LklE/GXH6ICJTAnnX+2EkeB4/r/kFrwKN/KShO2D
	N15cfbA2Wub1Ws6tNX51wOS+Awqv+isEQb/pUvjPCSlQ+5tIGcwzUCvO0vjRTvLLZbiDQdVfRfL
	1gvwYDrhEMR
X-Received: by 2002:a05:6a00:2d0d:b0:857:73c3:4468 with SMTP id d2e1a72fcca58-85ffeadd911mr33200033b3a.23.1788946091221;
        Wed, 09 Sep 2026 02:28:11 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:10 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Wed,  9 Sep 2026 17:27:28 +0800
Message-ID: <20260909092728.1859-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

poweroff on this board drops the rails and immediately brings them back
up, so it reboots instead of staying off and U-Boot reports a power-on
reset.

Firefly's BSP drives GPIO1_D0 and GPIO1_B5 low during shutdown, before
writing the RK808's shutdown bit. Mainline does not describe GPIO1_D0 at
all, and describes GPIO1_B5 as the backlight enable GPIO - the vendor's
own backlight node has no enable GPIO. Nothing therefore releases either
line at power-off, and while the backlight owns GPIO1_B5 it can hold it
asserted, which is enough to make the board come back up on its own.

Describe both lines in the PMIC node and drop the backlight enable-gpios,
with the settle time the vendor uses.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..75b75fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -27,7 +27,6 @@ chosen {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		enable-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pwms = <&pwm0 0 25000 0>;
 		brightness-levels = <
 			  0   1   2   3   4   5   6   7
@@ -327,6 +326,9 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>,
+				   <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3

