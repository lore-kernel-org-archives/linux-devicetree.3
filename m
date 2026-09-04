Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E853546CD
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527379; cv=none; b=qFq8VbED9h4wlv3+BvfyS7NbaJbthkgWFCpzFgn8QRdaS+oXvoA5FzaZ60ij6/0sIIZAHi3HyTlhTQHhIrTW4t1AvOunh6YkS0tr/dW8cDIxbqacUKrdHJp7fjMEksVUveCXXBNwr61mYQrrkVd/qIYZC3fPSuyy5bOnZbpjiDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527379; c=relaxed/simple;
	bh=nZaahBCK6Uh8ja4ZUTeoTBxF+bQS6MmWEyFJ+20Wl+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QravLjZwXHmv/tRb3xKgiAI5Ci0DpO9Z/lEQoz4NjTBpCg4PxuDmjv4PcJ6LF97sOdIUIIID6cTYwopiJpKRuFWH4lQ0PgKaOkRNtZNtmfAqgxc1ZI5+aREBDyOxD4cPbJpA1PC+TZQktByROVDUr1cviFzAkgyUiQS/VBI/rqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9YpSm2/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9YpSm2/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954c08a7c8so815425e9.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527375; x=1789132175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/t7wxFBsuNgANZ3txwtSGvXS0Fyj90ixWLfFCZVhFw=;
        b=B9YpSm2/yqcKk7uaT+ocug2PvgR14o3GROHMX1cOyC9KEJE6UytY3NHeCkhifI2znq
         4e52yb3DhATzoJCLscjUOvNivfbvFsEEpad04nlAPeTC5/fsL7Cp5PsRDJra8vYs7KWL
         ha8r2LUzGMNceoFDjWg+3fKvnwuZm1cdXMIveoNJgmX1j2FwLPb26ORbSpOLUsoVjfH3
         sk5WB33SKAn3NAqeiPozFIgnz7VB+UgPeAPqdoFHEr9f3n3wEPdPC32IZ3A1SHvSVah7
         XQ1sbkS3TFEA1uTL2ox/vZeWC24t2+AqgDQTQjyxhlgyZCvTFTbTaLjJKRbWmpB+Fh31
         a09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527375; x=1789132175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/t7wxFBsuNgANZ3txwtSGvXS0Fyj90ixWLfFCZVhFw=;
        b=DAnecBhyj1oI7cA9DdF5Xx/UPxfObvFOWRYVQV3vumria7lnJYJc2mEs1/3knrZb3f
         jzxRedgD/6pXx9rPRZNH0UxPWtcwiXff7jqSUyiWyLIhieh+hIXagszAEA+Eb2CaBBzY
         MiI0cofmi5yEwA3kzTrYO5FBVBBXuga8hURSoZQgcNMNn5XX6chtwEgx9sI0/XYea0Di
         swRRrL+hqAcaP5Y+e9RZRcsrkS/cyp0L2JxmjYvuoQthfpHmqPg4/TD6F7PIkuRaqiGf
         gJy3BELqAZqKULtZLmUZDWqO51cNZCl+c12nIauA0nJzVwOYifumJYlPtR4eUEh5iF2q
         tCgA==
X-Forwarded-Encrypted: i=1; AKwUvBybIQnzNNfsitpsHmp3BJx0QPEiUI8tFMb/Vt08Yg4u9LZ25r36ZQ5MX6ie9X0W/FeoVJvnMV471Y5u@vger.kernel.org
X-Gm-Message-State: AFuF++kALLBtVQYW+qrUdKybWn27R1WHAwEejLo8yd797iBmFqCMXbJu
	WpqRmDCS95LhX1knwln/ViPHZnvrcCKBcrHqV/fm4um+VYSoQ5FPNUhU
X-Gm-Gg: AYBFou1LmxSTJeum2OVmeO8MkkexFobtWdMDScH+/3/4x8xo0zdv2V2JmQvHz4CCgNJ
	72bzuirXad6KC3gCua7TsjJxceTbJdd9RYZGIw4P5kYjqfJr9UntGLsdmuKm2pu51Q/En6BWucm
	i8RO3DC2VKQCeA6LVrCzqxUGQmC7O8kjwDmzW0nBnJKIKh0wwWZOVAdBD9xRE5VALq0XfWdpEJ+
	K4A1O10hLLBcm4+sY+CssP7nbWvPcZcN8QOV8XSr1nqKttHf75+U6+8ewsmcuoxA0vEFKoxvpVE
	aGxf05ZETR0/H7LtbJ23cFiDGY80Ll1ZEGhcOxFwcfjN2ZPbUhNxRbe3YIYgBXnc9OUSl0ymL9i
	+1WRL4qN5VwpnLELbJYS7Fa7ZV/imBXz/W75iyC+RK46jy0Bz/9q093KzPsyFME6SKcXLNhKcxQ
	nvi6XD8VvUNa9+d5tb/R2URHHDJ6WEnJHmdUui21276dB+NCXTQYTBGxaxKwfyLQGEhK3imHwyR
	1UyCw6HZmenoiG2kZMKRaQdImtkf9+PqqvkbE6muYQdLtsooJFVhkhU09vf6Y6/0bEZ
X-Received: by 2002:a05:600c:1c24:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49cf7f4d9b7mr51876155e9.0.1788527375338;
        Fri, 04 Sep 2026 06:09:35 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:35 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 7/7] arm64: dts: rockchip: rk3588: add passive cooling to the NPU thermal zone
Date: Fri,  4 Sep 2026 15:08:58 +0200
Message-ID: <20260904130858.27803-8-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPU zone has had only a critical trip at 115 degrees, which is a
shutdown and not a cooling policy. Now that the NPU can be throttled by
capping its clock, give the zone a passive trip and a cooling map, in the
same shape and at the same temperatures as the GPU zone right above it:
85 degrees with 2 degrees of hysteresis, and a 100 ms passive polling
delay.

The #cooling-cells property goes on rknn_core_0, the core that carries the
shared clock and the OPP table. The other two cores have no clock of their
own and cannot be throttled independently of it.

The cooling map is inert until the driver registers a cooling device:
thermal_of_should_bind() only resolves a map entry once a matching cdev
appears, so this patch on its own changes nothing but the trip point.

The thermal path itself has not been exercised on the board this was
written on. Reaching 85 degrees on an NPU workload with the fan curve here
has not been possible, so what is verified is that the zone parses and
binds, not that throttling engages at temperature.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM checkpatch dtbs_check
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e07869..c3d22b08f415b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1162,6 +1162,7 @@ rknn_core_0: npu@fdab0000 {
 		clock-names = "aclk", "hclk", "npu", "pclk";
 		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
 		assigned-clock-rates = <200000000>;
+		#cooling-cells = <2>;
 		resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
 		reset-names = "srst_a", "srst_h";
 		power-domains = <&power RK3588_PD_NPUTOP>;
@@ -3212,17 +3213,31 @@ map0 {
 		};
 
 		npu_thermal: npu-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <100>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsadc 6>;
 
 			trips {
+				npu_alert: npu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				npu_crit: npu-crit {
 					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&npu_alert>;
+					cooling-device =
+						<&rknn_core_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 
-- 
2.43.0

