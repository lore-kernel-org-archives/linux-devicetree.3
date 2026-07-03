Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9133CB2E5
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079773; cv=none; b=gHH5v8crBOHZIkicB9V8Ra2Fo62MnCiwUKxXPkTrLUR0d18SX0/6LNLQHnLbTVnECPslQifzPIjEnNj/Djgy5MkZKA1ubI3XIka1ptPVCGik07emXu2CD5kTC8gvigHXxBl41InISx1FlqKG3DTv0CVxxdqjvD+P0pbDczKi+J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079773; c=relaxed/simple;
	bh=rrXrFfcpgUSDXcQY8qvwp2yElhHCMUlGClGvoeo/dXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cyikilp6dYzFlVq2vdLsEAEKmaPZ/RdYB3ku5DUexiMDgxbmFP/BP4qSHYg3Fpf+tpSl1NJCKAQXQ3aQgbg7My6iRpYHFq8/f9S649nphL4e7KnUlgtCzSv8bqG+z8XzP+t5CuNm3rp14ARhSE7UvR+TBekUbCeZRT5287bTw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qsg8MNgx; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qsg8MNgx"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96d2bebca3so288838a12.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079771; x=1783684571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0B1463+Qr0zm+lZPP190miffZziNrhNxavOC7rjqnck=;
        b=Qsg8MNgxHOiDVYwLJvnUZbkm5bpwUET7r1xC2E02Uvf5aGplsCvOlGYWuXogoR+5p3
         1lautF1sisCpvXQcsbnA+tYiPy8P4+czKTXs7qajFt4w4dXawchCjijqliBWFCGX2Gte
         fYPWTiLOCqET9QChst021pmTav38m+aHFp9pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079771; x=1783684571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B1463+Qr0zm+lZPP190miffZziNrhNxavOC7rjqnck=;
        b=tN75mWspy2n74xLGIS0CCp7Jmp+NLK0X/njJ/jtVpJr3PFfKyfA8lkPTmh5OQ/Kuvb
         czlBWuUSQQtw9Rn+h+WPbLAK89IUPEQ7aoY2Jge3AFzgKZSd97cTAz5eZmRR1Re5ZVcZ
         FINI/9TBGIgG24Xs9eYOl2LF2gafKPWbHmlcQ6MZqUs+BeDT3t+Y8yQd/YbDg2p46iSf
         0pTdHowQoRdEgiuZGI0QscLXAVKrgcmIQAHngVOMZVycJCL8C1fpJ08KhARK6HmmGCe6
         eeS6LfiooFP3JpypUbcLd76NW//tdc5pSn81EmDa4xMsMFS6JgRGN2tVF1Bq09EnW1IB
         Yhbw==
X-Forwarded-Encrypted: i=1; AFNElJ/mPnZLFytsojxnObqdaI6YOSW1a0OzAJXrRvKU3bpcH65zrOi1YlokxK+aCpmxaL6ZZt04M2hpU4Rl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lKQDeSAn+zfYCd7bQVN3IzYsmNEroLIniDwo8RTVj/TCjj5a
	eSnvQw+q8bbdth3dCbtWYKHWLakAw5N4i1I38F0u6oDt+MkZw0msy1pn+rWYSiU4gg==
X-Gm-Gg: AfdE7clTnAO9q1JjibeI1rGk7CkYsFswj7h6w3KBznfycdiPNJPTf07djXpXufk13Ez
	fUaUy5OMEhsDKCQ1pY+yk/NU8CPMAE+cU86bSfuMewHAnXFiapGUF1lpYM/5KGD9tJady/+Sh/x
	GhyunKxaBKmc6sR+z+dIInBgCHS055LveBtG/JSuCyGJ6zn8Gp2JASvcp4YcnWK9BxqIVRyiJF1
	FxC+VPuZqWhPVUOeaDUzeit91JEG1rauNzUzQvvgbTqNTVxpkBzoxY/0FRpimvsCUobMatsI2gi
	Dt/piqlsEdz/+7MuxL3y6ghejUsCfGsmi5i6pzeLd8B1waiwwwtYnNmdFreR/UGKMYs7iBzUqWH
	1+XiaZ+8yoDcsUTiaWn6m49AZMmn5IBhPOH+2wUYl/LLILrLfrRwHW4AP5v6eUD0hc68pizgJU+
	oID688rkGGKRdhz+XdEgku3TOhAJtdACqomJJh3dh45vwwfVVQFL5h+pbOWS/ccvtfV7t44Q==
X-Received: by 2002:a05:6a20:1602:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3bfed505340mr13580575637.42.1783079771207;
        Fri, 03 Jul 2026 04:56:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: mediatek: Chromebook trackpad supply fixes
Date: Fri,  3 Jul 2026 19:55:53 +0800
Message-ID: <20260703115601.1323491-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This series fixes the trackpad descriptions on some MediaTek-based
Chromebooks: either the trackpad's supply was set as always-on to
workaround missing delays in the driver, or the delay and supply
are missing from the trackpad's device node.

v1 was just the first patch [1]. It has since grown to cover multiple
drivers and devices.


Patch 1 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. Compared to v1, the delay is now
skipped if the regulator was already enabled to avoid impacting boot
time or time before the trackpad is operational.

Patch 2 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 3 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 4 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 5 adds the correct delay for probing trackpads for Hana devices
to the ChromeOS OF component prober.

Patch 6 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 7 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. There are no build time dependencies between any
of the patches, but the DT changes must go in after all the driver
changes land, especially the first one adding delays to the Elan
trackpad driver. Otherwise one could potentially end up with a
non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (7):
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if already powered on
  i2c: of-prober: skip post-power-on delay if already powered on
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  platform/chrome: of_hw_prober: Add delay for hana trackpads
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  8 +----
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |  2 ++
 drivers/hid/i2c-hid/i2c-hid-of.c              |  8 ++++-
 drivers/i2c/i2c-core-of-prober.c              | 29 +++++++++++++++----
 drivers/input/mouse/elan_i2c_core.c           | 13 +++++++++
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +--
 7 files changed, 48 insertions(+), 17 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog

