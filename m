Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F603ACA5E
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 20:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247732; cv=none; b=aRNM+kBQ/KO50fuMuhnh0wHl1qKjQo+eVvX+j4oGa+M1GAEuSdgOJKWJxt800mx7MOCbwPmpEiBeXITauictKozbjOhDJOAWNdpaZ72U+DNeX2dX0/fHaWdTw1CMk/DPhvqs0FaW89gHbhvHnKzwCRxGJNZrg16ULzpX16DrgaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247732; c=relaxed/simple;
	bh=kDr2xBEtgmjzuHMhUmmo8nMGXVZVg0h5DcPuluFIFns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPAP8NzThQkETtFf84ek/dLttkTJKSr4anYuPDAqgoFtmQOJDwTIyL9bWltBW1678QupQOZ278zZD6HVRAHGGjG855GGnfNdFHRaUhJUCNCGCGo2o29xq5ytHia4VIqmAeSejBfQcjyO1D+IJP32ZGX9GDTdKFCxNpEdzA5Wd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7+d1MoF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7+d1MoF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso245322f8f.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247723; x=1782852523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VmlgmQI7H4S8qo2yEQ+YQUSbvnieo421LNuRZ/c1mQ=;
        b=S7+d1MoF67rryme+qedmGYt5yeoB9UedF60J/7AeSJ1sQerAp2uw6BcEGFuyBHKDyL
         VtpeZOChZIbnjgB1/N00WPVUgmi9mtcfhzxlSzFCS78o/QBlV68qY3w9MF8deo0XRgLz
         aSp4bPCsO38NvnWeGvhCAEWaAVAbKthDfBZIlzdv6AEt6FzGMlGSzcNS3cbVLDJukpaR
         5h4nnUK9Sa5XKfVH5+258O8v52lAfUhRbce7Q7xnKExIz+fqPn5NLN7vb1QjvJiBodr4
         olOp+CAABICiCt9W0olTIYTxskFmu6MWSRwazmOsOElgUcWnkYbNfUVReZOpt/T9G7v1
         6XCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247723; x=1782852523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VmlgmQI7H4S8qo2yEQ+YQUSbvnieo421LNuRZ/c1mQ=;
        b=L+k88UvLKCc2dtlbHH+J4ftl3y5OsCqllq6CjEa0i1pNSYSWDkrrXG/IkvfS8pD4x8
         v+eeQY4BaJiQ2kKhJVWxNfQILU5464khsWcBsp271EQInfaa3NODw0yuZRSb2aIuJwGw
         eY4+Bo5bCWo0RtUpr7inDZvCzsBr8XqBNfJP4heNXOh3o8UbDGq0QGLqRe1r1hhYydvb
         A5rPZ7Q24F/r58FXkNsMpMUsdmKZ939VyG9DOTcVdg0ZePHhZ+vGmt23FJqRfnzHfneB
         iT/S91JJBA+Id04JSGksz9Ql0/wWCO8NR+GTVsbPP5qBxmDmTjDd3hmIrZ1p8zXQ0mjZ
         wFaw==
X-Forwarded-Encrypted: i=1; AHgh+RrkMzeus98mwUOOJPpK3mVMyFtjkVPKoMnyMu2YrcqxBDrknSqwr14So84i3ERoq4/ycvVY3gZAI1VG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/lxEyKAnrHtBknKnebyLcdfcp00X54Gv5AR/J+ipZ/ULMnFJy
	6vz5IrkfE/qVrRlcjelnGBH/kMAiyqe8w1/NGnIueco3gLSFHbfpPV7n
X-Gm-Gg: AfdE7cnoOJTtloCLXex4Ojj17lLD/7GtRF5u/AXA0TsYygNFDcrDtlqk9Ng08oit9bH
	4pueNSY9p6dFI7uYRcpERrqi8DXfj0Pi+POxDSsyEZ2l0AWF0FRn3oKntvalheIZkbMzQVVkne4
	XUeDULEnhOv0PXilt+Rio+dYv0oyI16gCt7qs/7Vah2X4bkN8CFmOm0tUIiSDIWeJR9uSO76UHG
	YI3+pweOjBLY+2FXSthVJL3J0xsP7AKGWgJiKxIBTNHtM3u/HMVSSDj4gzKWOL7f+Wj/qIZFn/6
	DmjDmCrVGFAhzRL9VRZ8i62xU8tI/YU/y4wSRj6XDdHdNoZGjc3APIqarQJwxhDbZr3BYbe3T4s
	CFTeeOriIubLGlRYpKnwcXltc7lwhDbQKCVUv+t+n/OTSbyhj16cMTxGwb1uR1VeGQ4L5fThKiH
	jMXhwX/QRoQAo4hVM7L4HESeYf/HbcZOC2MVhEH9gmJA==
X-Received: by 2002:a05:6000:298f:20b0:45e:ea46:ce13 with SMTP id ffacd0b85a97d-46c0990089bmr554253f8f.10.1782247722883;
        Tue, 23 Jun 2026 13:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:42 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 5/6] arm64: dts: allwinner: a100: Add LRADC node
Date: Tue, 23 Jun 2026 22:48:17 +0200
Message-ID: <20260623204824.691832-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A100/A133 SoCs feature a Low Rate ADC (LRADC) for Key application.

Specs:
- Power supply voltage: 1.8 V
- Reference voltage: 1.35 V
- Interrupt support
- Support Hold Key and General Key
- Support normal, continue and single work mode
- 6-bits resolution, sample rate up to 2 kHz
- Voltage input range between 0 and 1.35 V

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
- reflowed "compatible" property of lradc node
v4:
- added allwinner,sun50i-a100-lradc compatible
v3:
- new patch

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index b3fb1e0ee796..ba6020989ce9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -466,6 +466,16 @@ ths: thermal-sensor@5070400 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		lradc: lradc@5070800 {
+			compatible = "allwinner,sun50i-a100-lradc",
+				     "allwinner,sun50i-r329-lradc";
+			reg = <0x05070800 0x400>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LRADC>;
+			resets = <&ccu RST_BUS_LRADC>;
+			status = "disabled";
+		};
+
 		usb_otg: usb@5100000 {
 			compatible = "allwinner,sun50i-a100-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.54.0

