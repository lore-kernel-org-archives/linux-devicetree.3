Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941033F5B3
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976060; cv=none; b=q/Wmp/8E5Q6BaTna9IYN1unsfvTOEk7S3Q6SdAG3bi0Ry29dlMemspmPiqCxmfEv3DoX2tn7ZLqp5XYD7F8USfbVOjR6WM0DCmsC/PpKEt96M+lJi6WFawFcAUlYE+B+7Wu5MFDQ7i4virryck61gewZIvVLNvQd7Qa+fqXztrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976060; c=relaxed/simple;
	bh=8xdCAMijE0E2X4EsYdb5pUdCKzFcIo7uJX+8IB0Q3yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LFTRybSoPibu/WFDbg85W5j7dYNphwRAPrHtMxgRtbgMiZsYj6DjJgcBS+VST365lbvvIjgxk9P1xQPn6miRsCaB20yyGh/zCEzVYJH1xBu1ODEDuYmRRhoyV64Vhc2XDmSAoYP3SXybgCRjYUkIGx4KFCw7Ozydq5a6vKyUjLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ch9Vkd+d; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ch9Vkd+d"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82faf871346so3111374b3a.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976058; x=1778580858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ytUABekc5RrdYiXa04ZEShkxwLJERJBYHoA0rFWO/Y=;
        b=Ch9Vkd+dDxgdQ3foE4qdJ5f1jh9mvKSEMlKNkubrVbNNTYXiyOMIKVqUIkbEhnudX+
         7PZsy7XzjME1aqd5m3+U37VpAiKvO22i2xI61iJFyBZTqhK0Hci5647b9v/3sO57k9LS
         NQ897I7jxPQMDp1lVxlfow6OZnntYOhnUImOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976058; x=1778580858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ytUABekc5RrdYiXa04ZEShkxwLJERJBYHoA0rFWO/Y=;
        b=YZWA3wUEg59CRzvOEz6d4rHbqP8iRzOJCvetRuNLNLeE6fFCpMobodgumxs/Jqycbo
         ehMueVUIZPc5T7u6XMZqLnJiggCmcARWUb6gbdYz0lQGeHMFVEeMYJpBCA4quMRNZqv0
         iBbEaJFO8jhqf4yCrsszqXjyU/OAAY3niSVzIRysOXCKObQyVqUQECxtXqtKvVPCJe7m
         Vuk6j9hyLh7Fxe+7bi03maD8IPAzzVT6Xpyvxqgt8UTamdC1EErXmFI4mq4Ngvvof8I6
         1A/HqGXnYGO+D2XbLFE6uuWJmI7AWFrZlfA7TnVLwT8PG2zj8SUFQk8zvBWAiGE8wX65
         TOSw==
X-Forwarded-Encrypted: i=1; AFNElJ/W0ViGpky6ulKKPXFVJaV118Nu55PFcxU4/Ho81knnUdfUE1yTE12LWDzHROnj2kRUxIBoGY3NJNv/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0KXKFn4Cdj6uBiIhlmWSR0URwcX/Aj8lHiSPIwOoclmZCFdMx
	d5lLusjpd8WcHSPctyJY6U5JSznh8e+v8TfmOlxzDUwpR0ln6YG7gtHHcqosEt/WTg==
X-Gm-Gg: AeBDieukMQCQhxAXpGrZyLbS1jfdxBs7uoVhSIdOioVVZEMOHg/zAtNd+LerhujE/3O
	EA61Orocwp1kjixlrZGPu/GqV/h8n+hlHZq91QAqSIVuUnahm1InHLxdw2OVxGar9S5r5p3B068
	i0itU2AihjIwFjgP2caRtCd+D+DVzdrbAq3EZpDS2A3tzHj4faQrubdUBDa3otSd+1sUXIW597F
	qs5WsFWoz2hY+ADi5Vzx/wx1tbP/wmzwaVjGGlXihvTkWx0pLNMEY5BCqB3KTDJr2Y1qjk6Y+Km
	2qIJMTocXsiiJVuqIDn1MtZmQAKgA/2cEfx00e991s6mZryEgK1TlNvgkGOqxi3GFU8BTdfAMAz
	/ppdjB2rxQjkMoWsdek2NozofF24V/SiL5NbPu6HqguyFgvUCy6BA2RenyKeuxOMjB0dKUFPH5v
	ITNiPolN7zNezca44ZfZS8BisIotSpIHbsxRGNULMFrRUetGsWR0GYgl04t8eQTg9evyYlDS3as
	lHjWpSnBmzJOSMzN1I=
X-Received: by 2002:a05:6a00:4b10:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-83923e9857cmr2413115b3a.29.1777976058038;
        Tue, 05 May 2026 03:14:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/16] arm64: dts: mediatek: Regulator cleanup for Chromebooks
Date: Tue,  5 May 2026 18:13:50 +0800
Message-ID: <20260505101408.1796563-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v2 of my MediaTek Chromebook regulator cleanup series.

Changes since v1:
- Switch to properly named vcn33_[12] regulator nodes for MT6359, and
  converted existing users
- Moved PMIC regulator supply properties to PMIC top-level node
- Dropped "mt6359: Add label for regulator sub-node"
- Added all supplies for MT6315, even for unused regulator outputs
- Added missing peripheral supplies on MT8195 Cherry
- Added missing supplies for ChromeOS EC regulators on MT8195 Cherry
- Fixed pp_4200_g regulator name
- Link to v1: 
  https://lore.kernel.org/all/20260320084351.2461060-1-wenst@chromium.org/

This series contains the device tree bits for the collection of regulator
related cleanups for MediaTek Chromebooks. The device tree binding and
driver changes are:

MT6315
- https://lore.kernel.org/all/20260324053030.4077453-1-wenst@chromium.org/
  (merged)
MT6359
- https://lore.kernel.org/all/20260429074113.3720271-1-wenst@chromium.org/
cros-ec-regulator
- https://lore.kernel.org/all/20260320083135.2455444-1-wenst@chromium.org/
  (merged)

The goal is to complete the regulator tree so that there are no orphan
regulators, and there are no devices that are missing supplies.

Patch 1, 4 and 10 add supplies for the MT6315 PMIC in various Chromebook
designs.

Patch 2 converts the vcn33_[12]_(wifi|bt) regulator nodes to vcn33_[12].

Patch 3, 9, and 15 add supplies for the MT6359 PMIC in various
Chromebook designs.

Patch 5 and 11 add supplies for the ChromeOS EC controlled regulators.

Patch 6 and 16 add power supplies for the CPU cores.

Patch 7 and 13 add power supplies for the SPI NOR flash chips.

Patch 8 and 12 fix up load switch descriptions.

Patch 14 adds missing supplies for the USB controllers on the Cherry
design.

Obviously the 3 dependency series need to be merged before this series,
or we will get a bunch of new DT validation errors.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (16):
  arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt6359: Switch to proper ldo_vcn33_[12]
    regulators
  arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC
    regulators
  arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
  arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
  arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
  arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt8195-cherry: Add supplies for ChromeOS EC
    regulators
  arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
  arm64: dts: mediatek: mt8195-cherry: Add supply for SPI NOR flash
  arm64: dts: mediatek: mt8195-cherry: Add vusb33 supplies for XHCI
    controllers
  arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8188-geralt: Add little core CPU power
    supplies

 arch/arm64/boot/dts/mediatek/mt6359.dtsi      | 22 +-----
 .../dts/mediatek/mt8186-corsola-voltorb.dtsi  |  4 +
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 41 ++++++++++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 74 ++++++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 50 +++++++++++--
 .../dts/mediatek/mt8390-genio-common.dtsi     |  4 +-
 .../dts/mediatek/mt8390-grinn-genio-som.dtsi  |  2 +-
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  6 +-
 .../dts/mediatek/mt8395-genio-common.dtsi     |  6 +-
 .../mt8395-radxa-nio-12l-8-hd-panel.dtso      |  4 +-
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  2 +-
 11 files changed, 178 insertions(+), 37 deletions(-)

-- 
2.54.0.545.g6539524ca2-goog

