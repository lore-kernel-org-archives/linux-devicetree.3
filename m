Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73A27E074
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 20:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950539; cv=none; b=OtKFk4eauqqfbbMuIx0erZe9FluGk1vvZ4iMBx/aGxhIyWhUQazPGlZCUeayI0jg1innPex4SyE19GpcsL8hj3xhjktHgMntstsEBWgaifM59iZXaf6bb0XULt0OZIRNgEQ0CUylwxkFi6ZK+oicW9IW+qwdR7KAZcI4jmC6Ohk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950539; c=relaxed/simple;
	bh=ZRa5bwPCorugs/fcG7WBsHSaQFZxB8j/ZnX9oQUR+pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/VMuYpMg9hrofwa74asZENfM535Jo9Sps0wpAYkKNsja6EAmLBdvVSH8VkBoPEjpn7t/Naggcf0GelZbkC58xU9EtiUH3LgeHXtCPLEFcC6APxWOrDaPsoUXJdXIGON1ZjncAjUdG5K450AJLt9aKGvKe4jnVH3OWje8YTS2oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgMi8VOt; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgMi8VOt"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f4e1568932so1794738a34.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787950536; x=1788555336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6moimaGhU35+7wiVcKN5sTnTB4vEOgWCO5j8Ay8GP64=;
        b=CgMi8VOte1aH9YKwSHSIjBwtQmtSkgcvUdz9Kxr5HaE9xndV9EJ6mPWO5sZnSqyABr
         I48cGYKgBJdgPY2cxdX5pnUBC9r/hNmvVkbXqQycRiA552TmsC6KroH1Z1paV4/28Nzj
         d0ElNcYh83GgNokLgJhFbKbSMSCxDttJbDybZ3OUiCUDYSQIJ4851VFXs8KHGoZzXszD
         zcde61cm0FK8t9gm1r+pMSuqLwJwQsFBQ+v8m9sZNoGTXB+/QowU0WqDRNCvXZjt82ep
         9D3kzZtuqqcimKDTCkZoGXSUkAv/RUBd4ELuIS7Eiz+vkkcE8K3PUwrNEW9pOu2ZnoQs
         V/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950536; x=1788555336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6moimaGhU35+7wiVcKN5sTnTB4vEOgWCO5j8Ay8GP64=;
        b=nc++RRNx16Z9vrGu1bYceY7uFe2UlLH6F7I1Zj1falJkCJCOVGVYOU1HD56Cwc3rAD
         pdS4Z/ErcXuwy7JutDPDUzKHKTc4cIjOUe5rwM8EyXVNbx9S1aJAYuzRRssAoVDNYYJp
         hYxZpW76BW8hftb3vvcAs5M1u1WQpr4PkdQU1/42cWUXdAynauD7TbFOIegCuA1/2BE/
         v7T5OuUvjK/HQxgL4ihvCCumUSoAE5M7yKOvlN+TWw1eih5zDQx5MdUt7qyFYU2jVxWh
         dXppcOHRFq4fnmbKnQod3kubD37CNgzY9eZe3TFiX2kY1JKu0UP1gicjiBbDwHHkpiBC
         QC4Q==
X-Gm-Message-State: AFuF++lTb/A6j+IFvzxwObG13eN3y6L1uqV0hJ2ig+08HQm2y0SiYMaM
	NPIoA2p4xHmaz4nutXFYAOLHAIoDko6gzUYciEsTqeLnzAXGg3K46tiY
X-Gm-Gg: AR+sD10ug8k/p86NZGVD4eHEfNOIiUPhMf61r329wLhtEc95qK0VNv55Uaw0YMAdT8y
	B/0jh8E4v73z9bsxlg86RhlQfA2wkEnAVFNxw5gXCnA/9Wdl5/Xey/EFxZJILUNFNP2huOe1Y8C
	kac3+TN4A+QCwQh05vc5xPCxhffrPPCzwAy6i8c98m9L/VLamY2Veh5wnEZQCWTp9hbvfZEGehl
	nFzYYMELevjChueMDEr6R24v/eRmLAV6+7E0Pw8LKlLJllV1La9it+9F0fJgZvzN/HJGLNoWPW5
	H66OPv+bPosxPjV/xx6zzTQSTd0nitHTauRMYqdj1RIiHnEZEYOH6p8NgWZUkItR0eP3RzJZkDg
	z136QfWQaGz8jrshni8ZMQNW3MA3RhXwQf5q1jdWs5efXMuuaeIAMkhSx5PD2bfQ+5OIdB7CtpL
	0vU99vHG27sZ6fvenFBK2d5vHGqeszbDGsmv5dSdMxiEAYEhVSnAx0AzSsk1xG9W8ivFFPpQ==
X-Received: by 2002:a05:6830:6d0e:b0:7dc:d967:63de with SMTP id 46e09a7af769-7f4f23b74aamr12473717a34.3.1787950536215;
        Fri, 28 Aug 2026 13:55:36 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa6bc42fsm2035178a34.6.2026.08.28.13.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 13:55:35 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] arm64: dts: rockchip: Correct Device Orientation
Date: Fri, 28 Aug 2026 15:53:31 -0500
Message-ID: <20260828205331.78185-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The display, touchscreen, and IMU are currently not oriented
consistently. The touchscreen is 90 degrees offset and the IMU is using
the default mount matrix which is 180 degrees offset.

Fix the touchscreen alignment and add a mount matrix for the IMU. When
the device is held vertically relative to the display hardware, the
touchscreen 0,0 position is in the top left corner of the display
(next to the home button), and the IMU reads the correct orientation.

Fixes: 4e946c447a04 ("arm64: dts: rockchip: Add GameForce Ace")
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 230aac005e8f..d43eb48152e8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -596,6 +596,7 @@ regulator-state-mem {
 &i2c3 {
 	status = "okay";
 
+	/* Touchscreen is rotated 90 degrees with 0,0 position near home button. */
 	touchscreen@14 {
 		compatible = "goodix,gt911";
 		reg = <0x14>;
@@ -605,10 +606,8 @@ touchscreen@14 {
 		pinctrl-0 = <&touch_int>, <&touch_rst>;
 		pinctrl-names = "default";
 		reset-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
-		touchscreen-inverted-x;
 		touchscreen-size-x = <1080>;
 		touchscreen-size-y = <1920>;
-		touchscreen-swapped-x-y;
 	};
 };
 
@@ -641,11 +640,15 @@ channel@7 {
 		};
 	};
 
+	/* IMU oriented relative to panel, which is rotated 90 degrees. */
 	imu@68 {
 		compatible = "invensense,mpu6880";
 		reg = <0x68>;
 		interrupt-parent = <&gpio0>;
 		interrupts = <RK_PD3 IRQ_TYPE_EDGE_RISING>;
+		mount-matrix = "-1", "0", "0",
+			       "0", "-1", "0",
+			       "0", "0", "1";
 	};
 };
 
-- 
2.43.0

