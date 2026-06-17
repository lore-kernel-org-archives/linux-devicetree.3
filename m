Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011138E8BB
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684583; cv=none; b=ZAXDyT5QV+deBEuVZA+6TNIzJbbumxQ+yptD8UXM6XItwWVC/1yFz5gM30c/3Ewb0wuE2JrYlPPIVJWinzWFD1ieKLb4HVLbJIpP+TDwhLI8kVwA/hub1OOWsN2XWETIiiKZkK0P9EL1nXcuzg5l6moB5M1i/sspBUFq5N+EIgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684583; c=relaxed/simple;
	bh=lSN8fwJzMoOoe1Em8kYvhvxEFsCMOPfETF5wp2itgRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nuKg0D1zIpJnLP8vosjZyi0OpbCXW4fAYKleKFgVOYef4KhgT4G1wot4jBF5aGHZWe0aQzDtV3v7bVS156+DKqVGsApA3ni8hU13I/7i/ee9iW37DL7QlVXq74VWkHCDcucCn65Ftib9+bZGeRI/9dKcumqXvl8dTlYDlAZRzNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sevpGwDl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sevpGwDl"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c132ac5ec2so54874555ad.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684580; x=1782289380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=sevpGwDl/ZtQFAwYrmHqTW5j/JURuJEqMiRvKqHfSiC690KKxljbAcj1V0/OLBels2
         LnEi8/XgBaTaCYWdciTKCXKe3SQ39k9jml091eWIHZCCFYwPjdJ2n1f2767SMRMDvEDN
         SJjBGdZsTdiV/5e8Iz27Dexxv1oxrmabMh0De/WZ+zFmxYjLMlTjULfQy68E2EsZVXdW
         b4C+1D3fAXWFPGqNU/JNdbzSBkpvZg/j0jVsQJLpsrW9hSsy9dIm00DycH5nv0PPQjk6
         FvFdrCyxDHq/ulI1kSqE/nmgfKW+BmG4HLy8QhgAgSah2NIzrQYaKwFUFzmyv50EdKtS
         WHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684580; x=1782289380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=WY2AdzrkcZzZUSCyzhF4fdqp7CnipQqpsBltTFYmh4I/+7Qr80LCxk0h/YCgoccVrS
         nlR/G/Ro4bvNQ1hcpGMnHP0fFHqtuAxDjxW9dxi99fV1cSIMok3QJGImzPZHpWaqAFrE
         koYDDimchMo5fbnMBs6OUap3wWfh+L3+Ruac762VSsPdCxAP06V0jRBxNramcTRL333C
         93zRj3Rj6HvV51UJ0SGoC915YHyRpgQLqLiVId+zkwXjYfP8N0d84CTvXRICwdw1Gxw/
         BJ7jkA5jhK6TF/FEen0ClwSvwDBhaAuWqHzBUEx1Nl6c3D1ezIqslVsdkszTbcmXVSCT
         aDfg==
X-Forwarded-Encrypted: i=1; AFNElJ+QffI36o4FmppvFgWeL4l4WTr/1ujvEkAmelkh9ZuVLCVQFJUiuc/rJty2vKO4d6o79G4rkjimSxsQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwRUBX3w/raUjwohM/NbUmKiYVIaodx/60Rv8oIMXTOrNqM2VDv
	A273/dzoxlNQs+qRWVeuA4ImwewY/eOjQ62fV7PXmXk5YDRW8J5GOyrW
X-Gm-Gg: AfdE7cl2StouB/BMgYwly6hPPOtIjfgJ72qUrUfrzrs2wrhHvslV8vZKrFZB7PzVRCo
	DyTxO9/pOdJtts11FYbUtIOTBT8LO17q7jFYDSypvgrsO0DvWcn54EX3sjSlPnS1UBv4OWuHkuz
	NZQaweGZ58s/npbd40cZRIgRy2yhONErzHZDP6/KVDb74WBXfqHoGdjnC2MoWugPcQ3w8xEdqz/
	PlUEBVIwIIAAkxC6xMZ/Z6b+18X0WmXsUZAuf8MyLc1HS8DxRit/+pIxD3bHwnIeU/UAjEOTl+Q
	2OMVyM5fwNfPG1qUWX2N4yEZo4xvno0Hp+0KH/FfjDeOxA3Sa7c7xwGbmmE+8X+WEjMbL9Ryjqt
	toKGpDeWVwxhfj4PCK+A4199QIZvViPeZkfKdBVoUYtOgIAyN7tdEjfB5hLeicay6/tVSDWUfHq
	AfIwIEqf6y4tenfPfAOICE
X-Received: by 2002:a17:903:230c:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2c6bc227c83mr25166055ad.19.1781684580462;
        Wed, 17 Jun 2026 01:23:00 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:23:00 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: dts: amlogic: meson-axg: Disable nfc node by default
Date: Wed, 17 Jun 2026 16:22:32 +0800
Message-ID: <20260617082239.645562-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617082239.645562-1-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nand_rb0 and emmc_ds share one pad. Before enabling nand_rb0 for nfc,
disable nfc nodes by default to resolve pinctrl resource contention.

No mainline AXG boards enable nfc currently thus no extra DTS adjustments
are needed.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f1f53fd98ae2..6457667d974e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1999,6 +1999,7 @@ nfc: nand-controller@7800 {
 				clocks = <&clkc CLKID_SD_EMMC_C>,
 					 <&clkc CLKID_FCLK_DIV2>;
 				clock-names = "core", "device";
+				status = "disabled";
 			};
 
 			usb2_phy1: phy@9020 {
-- 
2.54.0

