Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0DB47885F
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643406; cv=none; b=Ns4iy2yt72E57nR6dJxfqHpbdLz/0/ojZKkJlFD2Frfu2fFhc7pDKko4uSYq+z4hT6LGoUrXcjZ/Tbsok71TEAT3/xDUB4VVgjm+cdhzMkGHMFC7KtRGERXx56KqFVPD7ygQh9/ynOeyU3IpExOKRfdaluVHciCS1n8Q94JMyps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643406; c=relaxed/simple;
	bh=5WZ+tBexvdJk8/8pbvHz1XquFaJAKiQawiGF8mrATF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dK2w1VsyJn+NGkSOAsqns5aaVVMMvP/2D+ZsxxVWM2cJTghqoftqadjeEVcifeVsKt9DQmoHZnA2NEpivC6CG11x24nDoDkJvd5AAfs1NmdyHbfUbWYc6gHUXOWEZBL2CBI/CiCD8/Hs60KgceMPdZbkKzNoqg16hEsgIAbvwFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6YcQJsB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6YcQJsB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef4223be7so860728f8f.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643404; x=1781248204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ti3aO8Zn2qwqlJrE/LtPSs6G2aaVeGfvnqG893sDUic=;
        b=E6YcQJsB0D+womB3Rz+vlMOwxEHEwTtvamnQq4sx0MbbXCMQCLnM2/nLCH0pp/t7wN
         /smqVU8IWIecX7nFGmQs6t8jrpqmnemfeZVzMLeMNbfsAmL/eihOOg5vttelPT4FZ+/2
         XRqWWQdkXvWBc6pkv1hnJXWReQ4Pt4IAUq0aFCBIqGNqpcbEmTnAsnBdXvQx0w92Iqga
         +ujMo/0HQm32RzMDRaUp46GxqmzNlfZkj8TfbCJfeNLuDhhRQEgtdlvL10awq7ikvO0k
         70RBh2GawqssT5TtOuTBlfz4BnLKRirfwNGrnSMEYLzal/8DeU1ZNOTbemFe5bMh0YXt
         GwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643404; x=1781248204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ti3aO8Zn2qwqlJrE/LtPSs6G2aaVeGfvnqG893sDUic=;
        b=c9dOuvS/sgfnvDgUynYAY/tfhTjYVPkLfKb0xXKV1ooHT/E0whWCW4BGLN8ZXl8cQW
         Y15koJPmn5Zr2w//OPA55k0HBtH533yC2UARY6/hGUJhmCzKSUmvI8i/4k6iJGfatBdB
         hfakSTD3x6mwBMjbdCwIofuErGwYQOA5+8VLEn74oOqSqW18+u8yQTH28chOg8B1u8Xa
         IsvcFVRMJri7k0EqS3uyluVi33aQ0Y1NsbdmqlZUDJ+dG+c3GzOsYJrx+sKjGKcENb9W
         nh0XM40hpLtBusc/GrJ8pfiMhOgd5TI5Aoo3TDqyJfHcRk+VAzaL9o8a+ZIz9jUDMf27
         eHjw==
X-Forwarded-Encrypted: i=1; AFNElJ9oFHehGJwcs5PQy4JdMLDmDrjAh5zZsYoboZHNfm8S83DhENCnuXLDgm/0OjFb29D+FsDp4/CXgG0J@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ4pjjjojr79LjHWLI7zHdeAeIfKfgiOp8KwrWrhcpBlRE7wrU
	XPGIIHhrVAtDpyyxJ3hXePd3xOww1jrgBCFtj56C1q7GEyDf7vdyefMq
X-Gm-Gg: Acq92OFQjsrdYBZr1tFeKDkb7BCLjE6R1yEiGw93+9BGFqZFXgsId/cYA7ycoaKH0g8
	XEnzwdHIjB6HXjbCv6iKjoYXVnASjfm9tVmy6iKSOEybdaIug3nwOuyknjNNUFb6k8m2emKEtup
	MwUzMch9XpbOLWQs6J/MmDulzP96o6XweXqI9WFaVT8/gGFM0AYdTzDUBrFQ6bD/8r6SNrv2tl5
	anjoyRYTJB3QaX/014b5O6/GRooGMkvsCfSVeDyDMuNDlf+1czg2cKXOW8dc25r60pdB0Zo2gHd
	KM0FSBSVvc6I9vaN35lVXVB1Ie9UOjvXNNqV4mLqSQ+eTP21mSOdNw3xxLxIrJTm6fxHvwX68ct
	iwaKs9b3ibnVElcGDMtLT4Twf+r7DEctPHQ84Be9CqnV0/a73nTHrdXZKDez6l739dVRrhgtaOt
	/GGN6srnuL+df+urj82AGjhrCX3RAY2StkL/xdt4lDkSLOvcxEcTrlV9y0BgqkALex1Hi/VI3X3
	xzrJVyUz6wYBmREENvuNw==
X-Received: by 2002:adf:fe01:0:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-460304fadf5mr2671883f8f.10.1780643403511;
        Fri, 05 Jun 2026 00:10:03 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:03 -0700 (PDT)
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
Subject: [PATCH v4 5/7] arm64: dts: allwinner: a100: Add LRADC node
Date: Fri,  5 Jun 2026 09:09:19 +0200
Message-ID: <20260605070923.3045073-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
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

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- added allwinner,sun50i-a100-lradc compatible
v3:
- new patch

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index b3fb1e0ee796..7cb06b19b5a5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -466,6 +466,15 @@ ths: thermal-sensor@5070400 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		lradc: lradc@5070800 {
+			compatible = "allwinner,sun50i-a100-lradc", "allwinner,sun50i-r329-lradc";
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

