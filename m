Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56AA349B0A
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780111230; cv=none; b=aHxaq6vFMtpsUUkZB9SP4YQyfQkpeG+TtOO6kic3krPPPjvCQqdKAUi6JWxTjBTuDOdc5KunZ6lKvgzt/RixcTBpecNE+VrcU/9CfrjzVadwwH1FnYHh8BqZ/iFDNPkNM2z9AyhQLXGUw3WxRLOcO7WwnmOSqRki7CbDPU4SRng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780111230; c=relaxed/simple;
	bh=7P166A8vdKpbCTvjwJ0c7DTCaR8r6ukvy1kUs71vwQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOHYpETevaJYWsNnfBiRXZV9zG4dcbw7ze3/Po/CN96Usuk8/n3ohIwr/26LhyUNAq0YQc0ExpJyH9NuzJDvUjyW1sknOpMHvBHnlRfBTtsMMSrna+XUXiks/6qBdjf3/0Y5/Sf4obDfSYcuxW7ZXhVKve/ygVlejpiQ5OjA508=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COpJaSWY; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COpJaSWY"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-47c7b282e21so5723588b6e.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 20:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780111228; x=1780716028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=COpJaSWYThFCgatJeUagIoi+kHFi6kx8b+uVqpAoNkdqCzl+7G4M3NhHJYpMvfDb78
         vW+xyzdXJFm+hohztkr1PrBnljsU6U8lP6dDXJ+8V19DJeiH1m6TEwMyjnYpYGrfIJmD
         rNZ1B4lQ8blcsdzkUDzsu50cqTOVg6vFe1evBHXZFxKyEgj7WMa9yvXq8BBI2Q2Lgt7j
         9pYRHun4A8tDKPvYKNP7gO1NJzINqHVxFEbJatSgeP7vum1eDalwt+AAmZ9v5VK8a4L2
         iXUnAB/UoIPpB/XYf/bIApRYu6BQTdlTuo8rUxWPGxdaTfmh95/FQp3OBbYao5TwNzed
         sEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780111228; x=1780716028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=GnKouy+i/VrAuwyLdt73hQlPCUJjKK/XzE8GhRpUBZ0VhuckA+LlGo1ej5Q5XbY/Pg
         AxJTrOLFtXA2VL6Fy7ILbwb2MGQs/x69H85D+Ig8OTUOhD86SacQJGg+slSF5y8DSXU9
         qLm+n0yCAu4cJLyhsqVFYQcSWTPqrz0wGGV7baRt8dHI+nlM0ywhzahDjaoDNjqZ5JX6
         EpR0vZ4ux2NoQkX+q7TvrRtdrmkJnTLRBfYABGKpODgH9tdQjP1MZnfnGorxk1Wtf0qB
         3gbiolLD1Rv8ygerJOsoIEYIyfQOfQsrDoHMocHoB5V8z//lVqIKFVBYb1U5m1Ze26Iw
         xX4g==
X-Forwarded-Encrypted: i=1; AFNElJ/tY9l6wJxVhcGQsRcTMho/gN/MlO/j6yk6uAVIk2PX3FxLCpBd+1XhlVlFw2JihKo7/rFOucGLdf/+@vger.kernel.org
X-Gm-Message-State: AOJu0YyUJW+8lr7bFGvGOBpwxBwZkY8jm60b1lDvE1xV59CWOhMJHvpF
	F+hwTlSxRMAcPFBUElEb8lzzAw0WBP7uTZmcEqGjWLNpauxk+onJVowV
X-Gm-Gg: Acq92OFsINfuF5kVs+EPcm8dDgmifZrcm7WeTljTphPMbfJgZryiAFW0JFDvRFqkwd4
	VJGseSjGlcMQZzZXRx1hyvkeug3vXAkIkLLhXxLAHyBF9UhYVW11J65bG4a61OruqyWBpreZfqC
	LcKFXssl098rKC+lAVFnvb2PDNK7pdObpM/8D2lfYKm9jFh/wH5AczuoDGGawhSABJtSVneMS9e
	Ysy8WbqWe2VQcVsNYXW4w88PAIb+9N0igITnLDjOcKosBtpEJ8YSg9/KZ/miR4OfrUE+g14QiBb
	lTcKdH2mg7iPNBb52B/jHVQSYUZW01gSXG0cZqKVQ8mZYLRz3OVGWM81XnzCjC6IlCz1lnGIEQH
	68YQNjdnZpKEOTjrqPZMbgUZBisJSwlwlldR3MRlZb9Q7Gw7uGX0sIaMjU8c0btCPykecMaEnJc
	047q+do9pN8ySpknnlhaFuTsuKoJ1EAGQ=
X-Received: by 2002:a05:6820:210:b0:69d:5be9:d073 with SMTP id 006d021491bc7-69e105f7132mr1038228eaf.53.1780111227877;
        Fri, 29 May 2026 20:20:27 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e067e911csm2130737eaf.5.2026.05.29.20.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 20:20:27 -0700 (PDT)
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
Subject: [PATCH V9 11/11] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Fri, 29 May 2026 22:17:38 -0500
Message-ID: <20260530031739.109063-12-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530031739.109063-1-macroalpha82@gmail.com>
References: <20260530031739.109063-1-macroalpha82@gmail.com>
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

