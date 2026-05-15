Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F092E2DFA4A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778850174; cv=none; b=sJ1pEB5gA8IH+gBXoFTXBWg+p9N77rAikMg3DnGFuxYK8S1anm5yS7dKiTDCX1cvfde0kYbW9+wIOrw7b64HaOgptCgpIr+AcNHsE13YaWXqFDqytOPLNxdhKxpD54zAMgyiI2Z6A0UJCrqot8T+zz5dyfv9N4axnvP3CG2vvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778850174; c=relaxed/simple;
	bh=7P166A8vdKpbCTvjwJ0c7DTCaR8r6ukvy1kUs71vwQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRbryMQc5SZ2OTQ13pWv0cLNHifPxlTknozHbV3XwSCAetcyXE82R0asooVMdN17eMoLH7FAtLzQtQJ3I+79x4LQYCUBOW3WNvomGdJl1esT2eabnJTpCvnMw9s/kaMwYHTSeWidlguB9U7xF72YSgMeQsFCSQ6bIyr27D8xYMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5jnNp0L; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5jnNp0L"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-439a8366831so1999492fac.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778850172; x=1779454972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=W5jnNp0LzrW/3wRpRGTW5rRHwveKMqoiXtLDxrZC6val6aCa3aaQQMnjPkpdKqICQ6
         rijUq0zkELsdAv1ZTAwELW3OZj4hzEJb5Ruz1ynqz8+V3OQCp9kCDyHCWH7e4zfJtxDb
         5ePpvbqOSzgUfEgjDquCS+Xj3KZJeGqrNqwnyHcXZIbo9szvq3tmj7aXMmgPrZ8YIrhd
         kCNrBqz+AFh+qmsPnMe+KW4xxCDnxEZgHxVrEw4KhMvRExOy+EaP4EY1KbhHtY7aXTcG
         kgl+koEvQ8PrW/4hp61fquQ/SUo36loHgjLAlaW29AftSjlI8YjjUWI6OFsQciMUWeNu
         5PGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778850172; x=1779454972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=hCqU5fKynT0S8oW+5iPvZcvGNhhD5EFUxDxJMbEjNv3OiTFdMWriP5e3Xvem34cTUm
         wSw2qlAhR977yjNFx+2zwoscU6t/Mxr6Bpm4UUbxVTj9RCNYUAovnAZN6P0Y2hZvBmfU
         HR0KCzw2sbN158Y/2PEYVxGLKnqBPiu9F0wUbwzvMM0bMNa7+xQj0Zbv4fA0CDmqMybo
         Ag3CmqqNxfAI1+SmBDaHie1ofZI8XxzpSs4W/LmwdTVuyv+gOKbMAM6KefGwHLuZ5TjH
         SE0mad/08OtwZxxB4gXpD2rvxTIzOQRYCy831BWJeJyiIqZtWjCoLKpDPhAeINyID/iO
         xVFA==
X-Forwarded-Encrypted: i=1; AFNElJ9HQsc/NN1njtCKjifX+IDOXxyqqFng1MuX4h6reFry1TGGN188CTPqj0R+XjGVSRYeht0dvSvrr0JG@vger.kernel.org
X-Gm-Message-State: AOJu0YyybdH6ysX/eCP+93Lunu5srhQ3sfcHCTsJ6/ZO/hZMFK+LnDBs
	2DYe1EozRQKAmbGkDv1xbSj/2ktG/lj7Nwx4nsAx4BuHDPAf9hCHzTvv
X-Gm-Gg: Acq92OGpr29kFNTn5Fsab6KAW81aNFpcD4ltDneMqzmmBrn0FavwOjooUF2UlixhCil
	YaqSp2z37K6TuxS8TWmJMwsbOFD9z3y1g2N7MBd1dTS02NSwjPliGHF4eiQFLqMbqhvGwv01Xv4
	vrlzg/Uj5Ra95hOGrRAzZEbh2aPPqPe6pnDkX1epj7FiJ6q1qB4gcwaVeVcXt5tKQcaBz58+X4Q
	BjWA5aRyAh9aeq15OX49eY7lpWrtS1L5/SozMAmiFWKCbXN/8NSLaRcpWqeFgprbHop/sltsuO2
	G7LHt6sMY4lT13psAqEebqu3Z7ZlhPx5efXZv3qhIn3B7UG4sI7YY81ZRQzTHASUwjzlMTvj1sR
	JDJGn83MVziXtdu+xd57xsCqdDUw2QYq5J0PqeC6MLVPx7pHf/fk8+rOXyNtBPR4xW8vuAHaf2v
	2Y+fTTs4Pfd0fQbepkUERSYeRCxXaME+7Sy4+GubQX2Q==
X-Received: by 2002:a05:6870:21e4:b0:42c:d92:1c68 with SMTP id 586e51a60fabf-43a2dd74a39mr2539946fac.21.1778850171260;
        Fri, 15 May 2026 06:02:51 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:8c2e:6a8e:445a:9169])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-439fc53f2acsm4155822fac.14.2026.05.15.06.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:02:50 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V7 11/11] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Fri, 15 May 2026 08:00:16 -0500
Message-ID: <20260515130018.237378-12-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515130018.237378-1-macroalpha82@gmail.com>
References: <20260515130018.237378-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Invensense ICM42607P IMU for the Anbernic RG-DS. Mount-matrix
was tested with iio-sensor-proxy and reports correct orientation.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
index 8d906ab02c5f..875ca884deca 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -871,7 +871,18 @@ aw87391_pa_r: audio-codec@5b {
 		sound-name-prefix = "Right Amp";
 	};
 
-	/* invensense,icm42607p at 0x68 */
+	icm42607p: imu@68 {
+		compatible = "invensense,icm42607p";
+		reg = <0x68>;
+		interrupt-names = "INT1";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD6 IRQ_TYPE_EDGE_FALLING>;
+		mount-matrix = "-1", "0", "0",
+			       "0", "1", "0",
+			       "0", "0", "-1";
+		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c3 {
@@ -932,6 +943,13 @@ &i2s1_8ch {
 };
 
 &pinctrl {
+	accel {
+		accel_irq: accel-irq {
+			rockchip,pins =
+				<0 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	gpio-keys {
 		vol_keys_l: vol-keys_l {
 			rockchip,pins =
-- 
2.43.0

