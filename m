Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421201;
	b=DB+3Kno/Xo//iMB7pxeUD81efHh/6MvmQ1DJw6kleCx2VcVKm+w8a3l15ZJWuHn87Enz
	 HDX+ICfxtJQtsHzQlBGxVlFnQeDvo1t20F0TFH0UHPjdsV2h3QKyMAr6vM06GZoA8bJj6
	 tIq05X03sn6QUbmtlKNB45dBgBKC37qN3RL/6I5XH2AAo2WZAQAezNrmqJeih8LhDUY6l
	 DZqopp8xpZSspzXlxoMetdLPEya6nrG5HDGwgMKcwOwEd5ZX+gvWm3Mig5A+LP5cakk3k
	 CxH1sGSHEMHwBJ/ArnaBnw3nYE66O0Y2ve1HL4AiDKz9hqvDQHHMIkuT7YjXZkrotjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=;
	b=2zm+Krs5X7+2AnEI+lrS95kZDpQ+/icf9gktOORWtIQVt0PUwU+D2Pt6JPtIYCB4xv7y
	 zx4wutWn8uPeDdWYilzluRjY9AsC+zLdPM1XY2NWdmiogS7VRBm8pgi8OfaTW4X9mLEvd
	 gVR7xQMMvNG7Kkfb4UBgIGrLp+ws9j6tCGe8517egcH9C8A1Ybkl/uGfFoJvl5/7ttFJi
	 kjznM57iB/ocMilQFBYmXjVcfgTAfqaINt1FMn1nMAyRpx2DQEFnwrdEWGUthAcI6UQNH
	 jG9IKe3mqCMJKRXaHgJIG79oScMeMoMctTwCsGrvH9ksJLavztOKwjHpd8PghXF8EIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RzK7mR/K";
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC28606AE2A
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC28606AE2A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzK7mR/K
Received: by mail-oo2-f9.google.com with SMTP id 46e09a7af769-821a4a69647so1455961a34.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421200; x=1795026000; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=;
        b=RzK7mR/KC2SV8W0EXu9zuGKRCrE+KswyxXzmkCs0B+EucLWodwFaU5ldgJ3JRuCJra
         oKOwSAZMMjnt8RlON6u9s1r7gCjNqP6pFZ+m2BtDOEYB/G65bD6zT+CYQvMEhz0etpc9
         PvhhB6OXvgfntqcsjYuaAFVfqD+34Q72ZDOgzNtFDqcS2+u6iOqvVB7mUdLBvhqaTPdI
         l7liUvhJRVKvj6KTSQ/kYYJ/K6N+1ka+cX9MOFdz8J7EnOn92Bl99SMmcPLFC6IF+GZa
         r0BLPIzOOIxq/ng+97+s+8wAcZwXmZKEQYutcN07adtpq+uVd05XjDQ2JWBrWK8aED6o
         9uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421200; x=1795026000;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=;
        b=TSMqZJKLN6s/Dff8hpguMhL+da/VOT8u/MqtBoAxEc/K5UlieJYn7yp8Sy9B6uqPiT
         H8MNhnT+w99kw8ANChBIcZF46XCY03ZrYDK5XqLu/uNLdQsa/mccFxTVoZ5y6leQDaIy
         HwDSwX34+ncez7ZRj1HJ0TQjQ0aE1Mw7hf4BHt3tKkE9qsD6LoMjZUtmJqG/v1NoHmKF
         XauwuMTCFq7vG7bJl6JTc9Ls3LScGJT0T8ucSJy8IZss4ddWBrY2qS8prO4AQsmMTGU/
         G+wAcCeFwAWUMJqt+59jTLyeLZZEoTygNKeRscNr9aVf54umqa05dmAD7r57mx31EeBf
         3DGg==
X-Gm-Message-State: APuU4Z9aZ1TtUUpWaT9LZdL2lj011K4OZrXx06p8jTh9TCVmiCKnRjTC
	5YfudZRKUkdUfQIbJTS4bRsngf9VfU1YoM1I5kDw0tYaSl5vWbcdbY1A
X-Gm-Gg: AYBFou02Eec+xXc5e+V/P4MtSWOEscUjBrpg2nCy+dHfKmca6qeLjX5fi+Ym14Pyjoi
	mhkq/AV1XcltnKGaSwBqLMOCf5NDgBNPa5aA7Vv8yzSsDUCxGJGIv0Hgxc2ZBpLLpCF/l3Ms00Y
	Raat0azgnOMVJvNyUEsBaU7WhtVHpXd9Hb/vAvDQ5X+++mTWelJ+HASluZsGbFvXygxDrZ/N4GL
	DldipCMrYrBIfSxfokDC2NAbVuvaJx9To3hp44dI3Kd7z3c8W5yGufcyilEJavJMeLP0J5sF78s
	UvTKquKxOp4S1gJ0YC12J0Zy5Zdin9yZS3qI2p4Qp6gQSCfo3xyRG4zyuYnb498LGtCCSW/UCY5
	cs2t6HiaHtO+K71DZt8FSgfjYHaPs/5F9kNRgeW1+/XXEvKjKTP2wMZAyG8jBiyBuEqW2Z3X/51
	FQq/ZykS+5LiLWkFcftF1DWwEKMgdGaxXNM00FmffnaoGisKsDpFSPgU09rnLFS1G7DQuMv/bB9
	we3Wx50QjECHgaaFnlCpVUwYKyHtaP7vXFhYAbLD0LHQuixq73Rw32385Np7D6ra2m4HYZJHI+9
	7suBFRrf6unkYDCWVS69YhKW1Kirqqyu/sR0YFtQqGOBFJ1zSJHS6CHXxUv9M/r8qR2af7I8jsS
	bV3MkNRMsK8LnYWGkDiQ=
X-Received: by 2002:a05:6830:230c:b0:821:c75e:5309 with SMTP id 46e09a7af769-860f2824528mr4052098a34.7.1794421199944;
        Wed, 11 Nov 2026 10:19:59 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:19:59 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/5] arm64: dts: mediatek: Add the Amazon Fire HD 10 (2017)
Date: Wed, 11 Nov 2026 12:19:49 -0600
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/3XNOQ7CMBBA0atYUzPIdhaDr4JSOM4AUzgBL1EUx
 N1RSEFF+X/zXpAoMiWw4gWRZk48jWCFOgjwdzfeCHkAK0BL3Sqpa4x9LISp0IrlkXIkF3i8oQt
 uncb9Dzmh8q3pjTJDZSo4CHhEuvLyhS7d3pGehRPnff44KzZMntVfLOS2Oht0ZXGDx4aU1iepG
 99IOzeb1rtE6KcQOFsxm2ON0Wvo3u8PINOci/AAAAA=
X-Change-ID: 20261024-rbrue-suez-upstreaming-amazon-suez-dts-1c67b717d373
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=3441;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=JY/ZMokU8A01a1ECQeqMylLF/hWf9QwtOhovwgrHl/E=;
 b=yxUBcqEPnePvIAwjsS0Wu2SVXsFmjFxaGEtbfTmm8jhed19s+uQENEkUxREo6Yd4B5zk5bx+R
 s/e+p1ybKXTARwhbGECLRC42nkc4NZ+EFC7VSvDb9/DeY9c1U2jbR4I
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

This adds the Amazon Fire HD 10 (2017), codename suez, an MT8173 tablet
with an MT6397 PMIC.

Patches 1 and 2 add the board with what upstream bindings already describe:

- The eMMC and microSD slot
- The micro-B port as a USB peripheral
- The panel, the backlight, and the touchscreen
- The accelerometer
- The light sensor
- The charger
- The lid switch
- The power key
- CPU frequency scaling and the skin thermistors

Patches 3 to 5 add the keypad and the PMIC AUXADC, whose bindings are
applied for 7.5. The keypad binding [1] is in input for 3 and 4, and the
MT6397 AUXADC binding [2] is in IIO for 5.

The board needs a PSCI 1.0 firmware. The stock BL31 implements PSCI 0.2,
and its CPU_ON never powers on a secondary core, so with this device tree
the stock firmware ends in a watchdog reset loop. On this board it runs
TF-A's mt8173 port as BL31, started from the stock preloader by a small
loader that hands it its parameters, with U-Boot as BL33.

On an upstream kernel the panel also needs the DSI command mode fix [3],
which is reviewed. If the bootloader leaves the display scanning out, as
the stock one does, the board also needs the MediaTek power domain fix
[4]. Without it a probe deferral of the power controller turns the
display's domain off and on again under the live scanout, and the board
hangs.

Tested on the board, booting these device trees on a v7.4-rc2 based kernel
with the pending drivers: everything listed above probes. The device tree
validates against its bindings, with patches 3 to 5 checked on top of [1]
and [2]; the one warning, on mmsys's assigned-clocks, comes from
mt8173.dtsi, so every MT8173 board has it.

The fuel gauge, the sound card, the MT6630 Wi-Fi and Bluetooth, and USB
host mode will follow once those drivers and bindings are submitted and
land.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com/
[2] https://lore.kernel.org/all/20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com/
[3] https://lore.kernel.org/all/20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com/
[4] https://lore.kernel.org/all/20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (5):
      dt-bindings: arm: mediatek: Add MT8173 Amazon suez
      arm64: dts: mediatek: Add MT8173 Amazon suez
      arm64: dts: mediatek: mt8173: Add the keypad controller
      arm64: dts: mediatek: mt8173-amazon-suez: Enable the volume keys
      arm64: dts: mediatek: mt8173-amazon-suez: Add the PMIC AUXADC

 .../devicetree/bindings/arm/mediatek.yaml          |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 .../arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 702 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  10 +
 4 files changed, 714 insertions(+)
---
base-commit: fd9230005e85472b81c1c7c16afe93dd878996b1
change-id: 20261024-rbrue-suez-upstreaming-amazon-suez-dts-1c67b717d373
prerequisite-change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50:v5
prerequisite-patch-id: d709637c35c840fbd22b30dd39452d3116a8e8e4
prerequisite-patch-id: 04f2ca8ae588298f0ad75af44266cd028d00bbe4

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

