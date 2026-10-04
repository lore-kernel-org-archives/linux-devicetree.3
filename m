Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA7A471CE7
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134554; cv=none; b=BRv8NMIFV/QuRwVOqCU7Ml1UwfB7UpZbsUcc0qiUq88qM+G7GPxUsYTlyGQzCcEL9NA8NK6vA6a6MSYicHGd8KWqJfdIBRJdfrbr8OGGnvGRcP2jDfmHzxcUpToiU+93YhINnCkhD8KLqi5cq/I75/x4GKhBZGnO3DdBhOHKmpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134554; c=relaxed/simple;
	bh=GLlt1YeRuUW5WlbWRWsA3akMoS6gmz8sfeOQOa8Ko08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sig8f12lfS8z1Jf+EXF0JHS/0Y30eo9O746hiVOKxYS+H8s2lmFH4DduIny6Nfd6itC4h4wy+cI0JfBwfs0DVIJk3UwPzTvfOfeu66sorZmAjfKc2/okfzeUBm7PL0rpFKBS2HI6dT4iqOjIwEklH6NQ2UFUwo87MjFTl3gN8to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gx5OR6Ld; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gx5OR6Ld"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a49623b865so488500a91.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 10:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791134551; x=1791739351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7rAIIfQRjf/DZlHIopzmqG8GHaCqWeari8L74hauSs=;
        b=gx5OR6LdXal6Bfjj6sXUow1ZhAiZYscrkMQVlRlz+pi5zHgvTnLQk+PddsAAvcFodQ
         hndYH/yTZsGlMy7ZL4jXDYurh0izwA1p7xKy3SOCFswuuIv/TQv8FCM2q4s68wFBxTyT
         ZTb4ChRTWOrkoZIYuMVO0u8ESz929lyLX3pvD5BPXXcjUaQJsTjk+7V2N7geW8nNK4MO
         HvG8PAUx4rxYAMqjC5tk6/30sZX+Px02PrTZ0WM0Pdp7q3O4IRDuMv5XptTVRFtqRgn6
         sKhLVYYJuaQCsc+deBVx554oLIb3M0rNvtAFr/3gbJ0aKc1SMoaoQHRCosMOmXRsVfpE
         geVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134551; x=1791739351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7rAIIfQRjf/DZlHIopzmqG8GHaCqWeari8L74hauSs=;
        b=qgcMIa4Tuc74QWOG0vo7MujRfenrCsvHxEycegaPdicUY7RBYPUXTYn7egMj+eIKw8
         AJv7OW/TmKzR6w1jpW72KxKGz2G3CqIhjtLTHXk+tnFb1rlI/TNv1EYYhyf8j5mqJxVu
         NXl2g+308wSsFuxM1nvEJ6D3EXt6zECZEFuvbaTefQ3JTjX2jexoTqXnYRk/4kfc+ub5
         Za2bQIlf9V5KxeBOasdKl7VFUOTu0kQppzJJfLFnhuras/OLsgIlHoqPRpFYtmeYRFiq
         KvGnjgWiIuVFHsqnsNWOhJIdkfRNtRuM07HtiBUDV51whaa1LAwUp0GK0nbNuGdZHah+
         G1pg==
X-Forwarded-Encrypted: i=1; AKwUvBzF+wqJ5ziggwjQA4cfIERRzseMF96U3snCKoqsUHasW9YAysiKTvQOHmEF0LhSAhtLIn8WvhlW2S0B@vger.kernel.org
X-Gm-Message-State: AFq9FYJm3orXRnyCX3YVSFAO40+fBMZ+BShst6PJ4HtrgFsEyzZIHlEm
	/6h+frLscef2MvmXlnzO/LN5Ps+CJWzJ5MFdlI+5b2KlxzWy3+VhA5se
X-Gm-Gg: AYBFou1eWHFohtksXv2Iyr2WsSjKf9lg6NtttKiSeuSCfDcTFQqRLPLKiSqO5dbh4qm
	iU+XtQB02fPrHajjFnWBu4hI9ad4Vd80sdDib8fzNyK0gvMciJdhuI6Vh+eFOJk5ebEi8dwzlUi
	GEb/9+K/bWMe+EZodyXD/cZYkPnwpyJbZ0wqI3ttdGOtEKMk5uiK0dkeeCj1wvmM/dkEZnbwJIq
	8JvAmrTxYYfsq78kI7TdAPL/c9M2w0AfWoAwi0to/srBSRBM2Hnyn3EHBDo187xb5vD/0C1WoR0
	uxEK7PyLxBBhg5Sd+6rT3ZgOH6kiMT4NoboMQKtztJ+AOvUJ1Mul3VANIPpYDVsiUn2zN76Orkk
	Fo7LfWDEw7No5OaMf3I8uF9V14h5ouMw9MxoZObsyt8LXvUleKM2yAjTIYG4Spp8jLJZ7noCjW4
	67pBZNQgod+e8zL/zZi1oK8CPtl7AK8RvQNBG8ayhasQX6Ymgz4bMfyX7/XsfirdLUkSytD1zK2
	CbNbZLKKM2iUw==
X-Received: by 2002:a17:90b:4d:b0:3a4:aee8:76ef with SMTP id 98e67ed59e1d1-3a78717db57mr4586561a91.21.1791134551329;
        Sun, 04 Oct 2026 10:22:31 -0700 (PDT)
Received: from SonYoungWon.skbroadband ([121.125.40.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd4bd483sm5847677a91.4.2026.10.04.10.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:22:30 -0700 (PDT)
From: Youngwon Son <yoson5375@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Youngwon Son <yoson5375@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Enable the NPU on ODROID-M2
Date: Mon,  5 Oct 2026 02:21:15 +0900
Message-ID: <20261004172115.5105-1-yoson5375@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the NPU cores and their IOMMUs on the ODROID-M2 and wire up
the vdd_npu_s0 regulator.

As the regulator is now controlled through the NPU power domain,
remove regulator-always-on. regulator-boot-on is not needed either,
since the RK8602 state can be read back.

Tested with the rocket driver and Mesa Teflon (MobileNet V1).

Signed-off-by: Youngwon Son <yoson5375@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-odroid-m2.dts   | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
index 4e98fa3349..ea4d86a588 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
@@ -320,8 +320,6 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_npu_s0";
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
@@ -441,6 +439,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmi {
 		hdmi0_tx_on_h: hdmi0-tx-on-h {
@@ -514,6 +516,36 @@ &pwm0 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8_s0>;
 	status = "okay";
-- 
2.43.0

