Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E957372ECD
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 22:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777673672; cv=none; b=nniNbn655yvjdwaQX0+CeTkr1/b4SsHbLh3Z5b4w4YW35eAw1oqRcaeGjnVfhRQpdJqHckPX1nn1huI69Dva2EmKXWB+HTVzdwkwTDUMe4mGgP4rszVY4raREFD3doirNSvgfbhmPnbp2rEVWlZJVg+iL+5WlmgIvXEz0MICHUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777673672; c=relaxed/simple;
	bh=7P166A8vdKpbCTvjwJ0c7DTCaR8r6ukvy1kUs71vwQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myl/Y6Z6r+AWN+nsxWhw+trrl8Q8D8CSERhQtITMwDfJFdgwctfWW66O/Qc7gsu9OQ3q1AHb9yP4XYdI9dScE4JAgUOJqos8uzm2F1dMsURr8T40B+MuwW7cwI9GKjept4mv5dpwKSCt33qLXexNxd897B2RrO6ceCdDvRB2p5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUq7eB3F; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUq7eB3F"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7de44ed7a11so2003882a34.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 15:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777673670; x=1778278470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=nUq7eB3Fdq3tn3y/xIB0/XXeIoRO8UL/xCcJY99gxmHee7wE1PdYodi5xpsi9ye5ps
         Fcg0JbxKmevmCHmOMriEkAQ9KB60v7x7AQHjoOPyex7FjtNK2KIp1b132/1KN7Kfunha
         yVQcI5lXi16NnLFJcxtFPYS1pk+Rf/3Fk8Aa23XHvMzk9PDpi1C1pyjxS/BBweFYvO7z
         WdpSN/POv9wwxEMPZAXxmvxLTGO2m7iU0eEpDhmZTmc7nGCvlkPy/Lr23oR6smj4gL4v
         DXWDw/OaUTqUrfNTMJGqwSjMQFHVoKIDJRNtbp/e/OlYeT2WdmgR/MJP2rEUJQRdD4RC
         P8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777673670; x=1778278470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=QF19pjqwE1iL1L2/UmCFRhsymX64RV5vwcREV0QV47TzFga5C8iziL1nq7oEXv2rK6
         4knH1wJXUzgnBhdhJk5I0GZVmmbO/VMt/X+wOkb4oFNPvrVUtq+60Ui8fmNDuKaABtNI
         GCC/YkBBpb+hpFPfYl2HBhC2tgDM5UmYfgHyXvmZYyo5feZHHmgyz7LxJTSXOIz9RsEX
         VMob7C2HOhd1tmgFhIbsflSKtIKljwBZmY0cwxm72zxzCFeAaEUTgbRJhoOM341MTcS2
         0q6Gph9RZwrLSjV10OadrJKEmmPcPpqvFIHBLnIl862kQxlP7xg2WKmIOCXJ+pziVECD
         xrvw==
X-Forwarded-Encrypted: i=1; AFNElJ+Eff+UhiJbT0SUlfwZvncL2rvlItG9G8esMzbYhulGbnVN9sDA3zwzIXLioyvUNbs/4yJVajppGOgL@vger.kernel.org
X-Gm-Message-State: AOJu0YwBde/82DVTUZEJx2EiJgGSNteL+vGDzmfTZ4WmIxR7adGo/GFu
	1owUYujFp1Gbz5zpDEILzX291ZzaXd42kKQ1JzO3e6Yuxn2S+BV5E2Kz
X-Gm-Gg: AeBDiesWo/CCikva+2m6Nva5PiRlAFUKIaMqGAbLHWzYLxtmDSfWh7HJyxwt74Tm2AF
	ASv1qrYQTvJzeOodukhwoT+65CojQp8tTznT0Znzb/WNoLFNivKxj0I503E5rfU7/qvpV5iwEQA
	mTcgl4AszFzPPv2ETdC1S20S6qMwAi70c2J8HKK0P6nHfdkYNTK27X32xD212K4AetrGfZ2dSL2
	3UWv5XVOfoy14amy9aGaWNIPplS2++ziFCPkdW/KRPH6kygSBbYyOOw+trdLF9bob9gr7bus7GU
	2CasuzzunlMTfGSQ96mG+8/5ZGOrsVSUCq6GZenhSuI8RteZBlG9fArU2Hl3wZlvP/YqPAd7E6B
	g+198A8jUv7UydrXPW+q52OYb0SLDOWwRdXSjOI6VofhTfKkUz1gunuli8cEvIunmmB5nm92udr
	HLnBW1/zAHvy86i4PYzk0bFWj3ZMJBAjs=
X-Received: by 2002:a05:6830:3983:b0:7d7:c985:3a30 with SMTP id 46e09a7af769-7dee1290d54mr922365a34.11.1777673670535;
        Fri, 01 May 2026 15:14:30 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ded51a9612sm1827337a34.26.2026.05.01.15.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 15:14:30 -0700 (PDT)
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
Subject: [PATCH V4 10/10] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Fri,  1 May 2026 17:11:49 -0500
Message-ID: <20260501221152.194251-11-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501221152.194251-1-macroalpha82@gmail.com>
References: <20260501221152.194251-1-macroalpha82@gmail.com>
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

