Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547685;
	b=eFQT+mlyX8I7ksOKRukq2qelRVsuLN4sWXvd1wzWwxSPbUFislezHe34YVTLDVqf7WxE
	 kuXxJG+5lGA3xv7q4sEIgiD1UFr8KjFYDcRW/c3mI2yqGwU+xL3SVTZ0nZ8g1wLLeOUMZ
	 B36jr0fY8gov/+3O4fe1L4JcY0rrK+1u58PTuZQVyaN/+xvZnAB4gPRiYd1qLrNOFqnbT
	 WzoC3iKWZA7m8YoCfc/b93J9B6WaPQthjPtDCeAgD8PYDl1XUKpHcXGY63yCljf5KF1Nd
	 XwoIVPHjcuOfQ+Q4k1rRNv0CJUGlLtp4YdJGKySIiHrfNoaYDbAsB96oDfNWwXLHVNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
	b=w+QBhiuGu6rD9C4NqYBmN5JbSLD2Q0I/6ol4/hfLzPcVk8l3ybXRHmQiTT/Rkxbd0Sp9
	 sAxnG+uOhbRfZo26gybEz80mlUms6ELA8ouKg2eyE6QS8T8bLy7CAlU1fOB6HLe7kc4CL
	 HWv88YarDl8yOT2mr0pdaHTRN69rY+JU8a7y+PC5/jQElyCDT//HMaMcOm8cG5oDS6pg5
	 hPEjr7BuzRGGP0AndooRW6Zv2J3kLaaKiF23nHYSJXUkmVqVJYkspJnBxOvfDYZ1nys0N
	 1fXfx3j+7BV0TAG3gwANTI9vYOSqDNha46/gVQ1kgQlFIJnFCSjD/CE9H4qx4SrqBYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VV3qMfNz;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DE2606A326
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 15:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05DE2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VV3qMfNz
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso1186729a12.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547684; x=1794152484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=VV3qMfNzQKSh8zCkNln09GFWI0Fu+0+4nHzy79620UCyoUIeHHzQIcUbU2UZE3l5ut
         GuImuywcdc36BIbF2cY1J+n/t6fX+xOfBl6xvUiukpybl/Qv92PBGsLfAUDx0aNrv2AF
         xo99Qojo5vH4QOdgoH7DUfglO2bCtO0ZaLr6Ux/DPLGmjwKVkH43nLQC3FXxZ3Z/fJRm
         8ef3WhnrTd2z9kaP4XhcsG1cY9NatTAaLX8ET8sFyIEVuBM5rU1GTi+tIyFmxyZwf5YP
         iiSPmfLhkLh7pusQVlt4R2YvI4J9DIWdANrzNSaoUtKnCzbx7LFBcruqTA1A9hkmvxFa
         VPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547684; x=1794152484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=jUNFk/6DGBRouTSPNDvd3EYuFYF4rgKz7ADL8S7btuUFVbp7zNqOVCjBqh2x6wPzle
         36qYtCCTdOHPxU5olPmkzownQw8niR/Kq/u6b+l7RcgB93q0XwJ3AEsPbvwxJHuAlqyX
         mkAb/379CXwXZunK4vnI6iapE+vC9oFlVX6BGJ5L4RZXHuaRMTo44zCJ2TS5gVcHYEkC
         8dNwt0Fz8UYBZ5l9bgNc3tnCWbfaqcMlXeqWAa8LHPcCDgOb9dur8qraongEKvEUDD/G
         xjJd8UE2DsWL0GJ99gtps787Mx6A4HnsBDYqlhHWzGbS/TkOUGxiKqqbQ6Qlxfnp0KYR
         1hsg==
X-Forwarded-Encrypted: i=1; AKwUvBxwglPtihH/Tk+WCKd+IHHMKcIUcYcM5hP7XHr43mAMeddKGjWzPAotv/GPaiYRXWwHlLT18+9ARLtl@vger.kernel.org
X-Gm-Message-State: APuU4Z+fiD9R/N/7Kc3lVHf0pbHAKNVbjYIHgHjFjMQnDrhiCsNEmgSB
	k6x2dsTSlRuF19VW3v852dUGdKx5fQii8Dg9NKafx87+Y/OvFDv1w3lv
X-Gm-Gg: AYBFou1p4fAZvDq4knURE4+8Ok5QiilbdlPvPBmgMWrm4ZYdcVTkh91hZChpFtv1xJI
	Nh49xzZTq1R9cI7XWNqPqQKxReq49tlSBiAyuqBNhOGtE4ggJ5Bi8rpGzb+3oXcAHYtySL9JWZg
	r6XZtyhyIeLTYKMfh2csTL4dymVIZOmcxJhy0Tkat5fYZqJgPAQmf5fnTrk+eTO2cjMjfs+X/v1
	lnJoI0LpltRbh0XgZYU3KcZ9YhFnWBpAP2T960j0Y6bqmtmOE/oyJdIOTvTK2pvrGpIsRezddps
	kLBoLA/D1aISIe3ib3Jp1rdCc0MMHIUu50RnxEho1kSdsFQbEevrg6XbAADavm5FBFw86jWlKEq
	YYwesIoz0OLuqlHvhB9A5d5gM86F553MSHJVGOBTv8Zg35XWRAKyYm3EnZQ8vOtkWLNlwBbUApr
	9rejFWhXly0reOqnsS8ogBpWTisxxoCFukbJaf7J94hgtfOEctu6INn836atM6UXoqOtllZiuIv
	u++EPE0wA42GTECNqXsCFohillV2gM1Spr6+P5+FqqBkdYlF18HRqD3AVGmQjIZp8Bj/JnZoG5V
	uw63LvF2ONlzQG5XnksN0LFWXtOTF5LEvR0mCPp2Ig==
X-Received: by 2002:a17:90b:3c8c:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3ae8983126bmr7130051a91.49.1793547684390;
        Sun, 01 Nov 2026 07:41:24 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:24 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Sun,  1 Nov 2026 23:40:52 +0800
Message-ID: <20261101154053.3874-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
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

poweroff on this board drops the rails and immediately brings them back
up, so it reboots instead of staying off and U-Boot reports a power-on
reset.

Firefly's BSP drives GPIO1_D0 high while the system runs and low during
shutdown, before writing the RK808's shutdown bit. Mainline does not
describe GPIO1_D0 at all, so nothing drives it and the shutdown does not
stick. Describe it in the PMIC node, with the settle time the vendor
uses.

The BSP releases GPIO1_B5 in the same sequence, and in testing the board
came back up when that pin was still high as the shutdown bit was
written. Mainline describes GPIO1_B5 as the backlight enable GPIO.
pwm-backlight drives its enable GPIO low whenever it turns the backlight
off, including from its shutdown callback in device_shutdown(), which
runs before the PMIC's power-off prepare handler. When pwm-backlight is
not bound, nothing claims the pin; on this board it is then an input
reading low, which also lets the shutdown stick, although that is not
guaranteed on every board. The pin is therefore left to the backlight.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..210e4cb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -327,6 +327,8 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3

