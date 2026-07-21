Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B85E43441E
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620445; cv=none; b=WgxSJh6E6NLZtnNKuz2EFZe7rGkQZGzLQG7Yw0ctKFXQndvJJ593GmzoaFyZJ9dOrfJ79jHQnNLTehef+8yJH2Gd8/qRoF2YLHujjFlpiB4l86Hy+e1gHXL8op7ysYRAwBXpuralO9aE8hFs4VcSOtM7L13KmHb45HhsVK1MYdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620445; c=relaxed/simple;
	bh=XbhUMMlW4dlSM7JU/MuPyutK2kIopX7DVU5/wV0oYo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNiXr5kUXaAep8ybkJqeFY08bxu65DJb+dRwnABU0FM+b0Jwbk326D5lp1Q4Bd+6X6RxfZa9FvtRCASrXgxRZukQTkdzbU7fYPk8fSJM32mlDow40zH4Izn35tBkbYsy71A1vSfTR2m7A5RZP8ki1ZF2kwpI7s4DFAjDXdz7I4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nygficqi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nygficqi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc891373e0so137421335ad.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620442; x=1785225242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UfUXCr53MVmAxCgEvl6p7BqmYW2167OMSThHKBq4o8=;
        b=nygficqioLunHGQ0MPawRDUG7S1Yw3+c5rYEJCy3HEhYpxtIJgcCOUjB95xSlB46w2
         tGNrqtw1VlAUvC9fwTP5IkYpkeVy/Ld897OqMP0NLiLUW8LGUb7lYVLmz97Zo53smq2W
         tUjyrMsJF69mpxZlqGgwNNUK9V+I1k1E2pP+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620442; x=1785225242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UfUXCr53MVmAxCgEvl6p7BqmYW2167OMSThHKBq4o8=;
        b=TpjRsu+sHigDHOpDrULCXPYpnVtkL68Xg079OHhMWkZDG2JRkFW++aYKpunL0uGFcg
         R6YYh91TYZlDxM7ujdTu+7rZDLzfV80Jq6qkfdTD0SZ7OzWxe8bI5mzXkUn/M3LGWA+T
         /HPQAwWdjhCv7I2CzQyqv7drgzq3cPn/bSQtTJjUIL5Kf3HnC2X7UBVtfWZ5NYRDr4rH
         2/vJbqG8zuWylUBbrsihBTkkTSsfFgakq2XnOfBE1QlaK10Jb/691BjJbIS93sWAhLz/
         /hs7vg/AA++NQo+KAO7nFeXgCSkaWrupH8VWbsRQVnFR7omrc6bvSQxdNkkdZvF0vQDX
         w08A==
X-Forwarded-Encrypted: i=1; AHgh+RrlEg6OO7kIirK5B8/fDeVSDzGd25EXceiSzWCoYm+YXjGXGEriib3lA+dZnXesmIRkzbwJLrwCcdBX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+q6zB814KxPqVxYUzanAl1+mywFF5Er1beHSX+/+aktbSZEOO
	Wc6EqDJnhhZBUkA6OBdevWSJOLlZW85k6Hm+kYhXqPq158s4qqwnarV+Ris2HiVR6A==
X-Gm-Gg: AR+sD11fY5yjadbnAiV0WcT+ArtQHkYyHSTU/+rX7nr6A8YSkQ8eELtC+OTMXVl4x8S
	ztaOWoBhHpdFr68DUQ27VS2GvUkJxRKHTj2VaNIlgD1NJkR5/mRxkj9BOkmFEaEWkeAjt0FfYMI
	+uoMDcaWAYS9AxsXMPU4GDjORCmYRdzoiPCoTOWwanKkzJMX2Am/rxcGP9sxlHUAbGAW3yeqHAG
	DdqufCoQmZZqXh5lZX53M3OSRXF4GKEk6Ug5hUuriTnr2M1nu+0bCbmeXrbs/MQApDgBCKw31fq
	L53e3WNnZ/2OpwWLJU52CM1HCRjoaIIA8zkVleMplgHMb2dpMWofU7QoCVhzcpOaIhCzSPQ7I8U
	rIwwG22iwEioGDcfSqUVeeJ+xuA3OTxxMpLGKh7dyx4RqSxB/lle2kJ065TEFXLbNPMXagpdN4g
	zEXH0JtIgragq1mxbRqCnafaXIEocixbt0OXpinHrDc2eenBkUQbTXrta7Th8=
X-Received: by 2002:a17:903:3c44:b0:2ca:ed41:d331 with SMTP id d9443c01a7336-2cf34a3f5c3mr188180995ad.45.1784620442019;
        Tue, 21 Jul 2026 00:54:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue, 21 Jul 2026 15:52:14 +0800
Message-ID: <20260721075226.2347933-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v3 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v2:
- Added new regulator "enable and wait" functions that wait until at
  least the given amount of time has passed since the regulator was
  last enabled.
- Converted patches to use the new functions
- New header inclusion cleanup patch for elan_i2c driver

This series fixes the trackpad descriptions on some MediaTek-based
Chromebooks: either the trackpad's supply was set as always-on to
workaround missing delays in the driver, or the delay and supply
are missing from the trackpad's device node.

v1 was just the first patch [1]. It has since grown to cover multiple
drivers and devices.


Patch 1 adds new "enable and wait" functions for single and bulk
regulator enable.

Patch 2 cleans up header inclusion for elan_i2c driver.

Patch 3 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 4 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 5 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 adds the correct delay for probing trackpads for Hana devices
to the ChromeOS OF component prober.

Patch 8 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 9 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 3, 4, and 5 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers.

The DT changes must go in after all the driver changes land, especially
patch 3 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/


Chen-Yu Tsai (9):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - sort include statements
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  platform/chrome: of_hw_prober: Add delay for hana trackpads
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  8 +--
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |  2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |  9 ++--
 drivers/i2c/i2c-core-of-prober.c              | 25 ++++++---
 drivers/input/mouse/elan_i2c_core.c           | 23 ++++----
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +-
 drivers/regulator/core.c                      | 53 ++++++++++++++-----
 include/linux/regulator/consumer.h            | 21 +++++---
 include/linux/regulator/driver.h              |  2 +
 10 files changed, 96 insertions(+), 52 deletions(-)

-- 
2.55.0.229.g6434b31f56-goog

