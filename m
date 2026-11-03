Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680664;
	b=O0OJAqButHlVSnzUhF/+rZuC7O1AbzpNuGzTtzbs2kqnjrJXnx5dlokrWJS+A02b6Hl5
	 0EZDUi1Nz0ReazdR56o4gQQkIsC9KN6liHoE6NVWUqt0BDK8TF1uqR5RbBWPQUNvMjlMm
	 7slD5DArTgdr8yUkxhpZpMVmDM6JLvH7JcUV4GHTWcktbekiBVHawhasJmVDLcutWb5vT
	 XTNPl8umx/GtE5NQ4ILt1sjGYc57pPrk55l1z3RiEyAOxLY8xCmi8drJdD0TT+Pl5ZrZW
	 qwaHL7stTE8Xy8afzLc1kXq3+4FsHq0OX5b2LEnJsvi5VADJK19Jpr1zxT/ZbwFyO3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
	b=PlT/5gkOxjtbY2nCCtBCDUmMRA08R6qwe+54yAD/4GGMHeD3lP9o56TbknvI4U0n5s7N
	 FbQeVrN/lqCCjjV99ygQpA1wTShKcSp+2BMRQdDh3rFme1UBerNZKhMRcNDs+RztDlzWE
	 oyLNUbtali8De1xpdAzML7XIVFkU8TxVXZsbFhui09x6FNwArEYEoYan/Ggt7gDK7CqoM
	 6UVJXfru3fY16EeETWrCbeGZKtecW3foESJLnMrxG5mSYOKxEJzDianYmbVpGXhXaDccI
	 FvxhTTZao0Q7EN9K5sMA/fvsN3qeftegJh80q3wMZTnZmC9cPSCqPolyvYT0zd2XVXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oW4jOSx7;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9127E606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9127E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oW4jOSx7
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2295518a91.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680663; x=1794285463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
        b=oW4jOSx7D0JSROpnF4CChnXtkfgNeiGcg89AkTawpHxD/LR/9yD3eD1YxF4ucRwgLs
         elnGb4s7J21M1wmyZi4adPxcN76kU+pv+b7TZexIWFXl5d7mnLEFDujTNP16Vif40dct
         +6/Sgw0llpqyu8bjd1nYBX45JbXiBIlim64MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680663; x=1794285463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
        b=SCiOh4Tao1U4DCIxVY7SXarb0B+/gHLScl0MgPW7XrK/jWdNXY1DCUB5ve1c3Eff8t
         ZJaGgUknF1IsoPjMM4SacnbVEJwFre5lNSgTbPcQeXM78ClWMVASVIjQZF6anoKgwybG
         +WanPsOkE7Ak+yY7RkScNDZJCfWfBlGoWKnnQxsZElj6jSwH/eEbTTh3yQ0PXyS+uffc
         l9TlFakvYpMAE8k7j5pLDL54qT27mkqsjwyxAc0Q13HA7tc637CWo0IWuZ9RnCfvGKho
         NSAUKOraz/mZyLS+vHloGaNbudRGAQ4OkADnrX01Y8U6Gcn1WF+XNMv7NXzNY7IOSCJu
         QfJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhKFAjWHFZ+M5EXNpC8MQS2GGz4JwzEDvOWm4Jz0k5BZ7LaLBvLMTzxZt2L9qQLQTWqPp0e1afaaHO@vger.kernel.org
X-Gm-Message-State: APuU4Z9GBCKuIdEntcMAkJKerZ7TChySSjyvYqkhUYVsRtZBvjBwXD8b
	Y2cu9f4ZeWTUw51gVBde/J5tp9Vo7DAgBRHx21F/6W/hddjB2fRKsGdZsozoOVV9bw==
X-Gm-Gg: AYBFou1ELSaipbpSFBaZkcFJdLc2AuY2SiSxdRMgfUo0zxLnD95RiCJ5/sLap4lP+Gl
	J+I7oNxL4AMGmB4CqePucwCm5I5+vgUW3NC193b4BwyYFsWG/KX8X0JzPS0QM4Lg2nGL2MgHmE7
	npVBIicapei3hy3qV4wV4wqqrMoA50QIxnrMTqyYx85ol6TjRD7U1bAw+A0VyGvwIOessbo5R7m
	EndfdEjYI0eb/HtyUnZrc2Did7mswLstuf2inY9ezU9kBbAboVsvz1ChPh2d/1WAbUU5AEU3PeO
	Ji5PZX2x789ZAs7OqG09TFvcp43lD9VVF3JJgI4ECEWWq+je8+CLTN/TpzrIvTBIDIjRD2CgZMr
	i+eIxaG/qvaobC86AnCqaEJM4P0+gIGvJXprpOSaXLXkTIua6imUA7fhu2i33MyfgQGL7EUIZES
	hphQW5FCMBT720+/0IyK+Phh7mRHOocSY1RULSZHX2cCUROuwfeyy96mWDMVldnsAUyKQoc7gUO
	lCZWLRCr9jfSE8h8Q3+Vk8zgn/xjzEb12acQNhtuNBveaoPdpBn2ilJtFBOSz/MyRcBu2i6sOt3
	uysDC5OWPWIUmfw4EGjmnXJGVgCb9+F9TxlN5hugYvEiLgOo0SJ5QAlso8+RiR6dAeIktDAw9Rw
	Ky1kZG23SEbH3tuVWlWaFn24iEAdVJDZfig==
X-Received: by 2002:a17:90a:b890:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3ae8e5bdcc9mr6988054a91.5.1793680662787;
        Mon, 02 Nov 2026 20:37:42 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:41 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/8] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue,  3 Nov 2026 12:37:24 +0800
Message-ID: <20261103043734.2179858-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v7 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v6:
- Patch 1 (regulator)
  - Fixed rust build
- Patch 5 (cleanup op)
  - Fixed missing parameter in cleanup op type declaration
  - Fixed typos in commit message and comments
- Link to v6:
  https://lore.kernel.org/all/20260901074930.764550-1-wenst@chromium.org/


Changes since v5:
- Patch 1 (regulator)
  - Correctly assign wait_us to all bulk consumers (Sashiko)
  - Check _regulator_is_enabled() > 0 to check for enabled regulators
    (Sashiko)
  - Lock regulator_dev on final _regulator_is_enabled() check in
    regulator_register() (Sashiko)
  - Make it clear that _regulator_is_enabled_recursive() assumes that
    supplies have been resolved (local AI review)
  - Consider supply's last_on timestamp for regulators that are already
    enabled or have no .is_enabled() ops (local AI review)
- Added noautosel tag for some patches
- Added patch to pass component probe success or not to cleanup callback
  (patch 5)
- Only defer regulator disable if a device was found (patch 6)
- Link to v5:
  https://lore.kernel.org/all/20260825041628.988369-1-wenst@chromium.org/

Changes since v4:
- Made regulator core try to set last_on timestamp for regulators that
  were left on by reset default or firmware, but not enabled in kernel
- Dropped two patches that were merged
- Link to v4:
  https://lore.kernel.org/all/20260811122011.3539250-1-wenst@chromium.org/

Changes since v3:
- Added __private modified to regulator_bulk_data.wait_us field and
  switched to ACCESS_PRIVATE accessor for the field (Andy)
- Moved wait outside regulator lock scope (Sashiko)
- Moved "remaining" value assignment closer to conditional (Andy)
- Fixed variable unit name in regulator_enable_and_wait() prototype
  (Andy, Sashiko)
- Added commit message section showing average delay needed for I2C
  prober (patch 6) (Andy)
- Link to v3:
  https://lore.kernel.org/all/20260721075226.2347933-1-wenst@chromium.org/

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

Patch 2 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 3 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 4 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 5 makes the I2C component prober let the cleanup callback know
whether a component was found and enabled. Needed for the next patch
to only delay calling regulator_disable() if a component was enabled.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description. Should not be backported without
the other driver patches.

Patch 8 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 2, 3, and 4 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers.

The DT changes must go in after all the driver changes land, especially
patch 2 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (8):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Let cleanup op know if a device was found
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   8 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |   2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |   9 +-
 drivers/i2c/i2c-core-of-prober.c              |  34 +++--
 drivers/input/mouse/elan_i2c_core.c           |   7 +-
 drivers/regulator/core.c                      | 129 ++++++++++++++++--
 include/linux/i2c-of-prober.h                 |   7 +-
 include/linux/regulator/consumer.h            |  21 ++-
 include/linux/regulator/driver.h              |   2 +
 rust/helpers/regulator.c                      |   5 +-
 rust/kernel/regulator.rs                      |   2 +-
 12 files changed, 176 insertions(+), 51 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

