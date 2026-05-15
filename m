Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD185428492
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835730; cv=none; b=GJ3WFVJIFz4hW1bGGgIIbOnchPSGsxkW42kyEZHhoG8itQ2s2uLG2PoUvvRy/7x3HFFLJgG7y8nqzMmYvDZKVhwDe0SYz6kPOdjl7klEPepFa8Y100tySk9UCEJ/HbkNtnuPx7zXIjs8hK7Upsr1+p8smsOZie/KEb6IdvpHzAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835730; c=relaxed/simple;
	bh=bWc+EfUPJtEL5wZEtwgp5WJvNWmPURVY/3bNzMQXzuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=StEXOl8ZD/+pvaahL4RzhFYtlu5zvmfAJAGs9bJpoeEecR91ohddHFJJQ1eVZDlluG8ibttOrwr80ymUYZrSLqctHwQ0qKpBk8d1lR43bkOuDmpOWTmDA/bNTviVtV8D0BB8+YwyIs+eaQ5+1d4y8qlzGgdMxYkXwrmHMjgrcTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jA///pZl; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jA///pZl"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-366375c4076so4334739a91.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835728; x=1779440528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MeVtd5jgWtEcTyZTMUFtTZGp+FoBlkEpQv/hKwoH+Rk=;
        b=jA///pZlI/8YewolEwY6hjJAMGoTMWeyd1XPgdy+j8OojqskrL6mUUkTAqZWB5HtEO
         FLgbTH5LZKGkqFBD4aszwtNKG8zO8l5h9A7ucNeqG4XMVx+jEzmdhhQfUuTt7aTZzU2H
         jZmTy+N/0NDHQywvp60nWzSZ7ynS1wbVLWGlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835728; x=1779440528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeVtd5jgWtEcTyZTMUFtTZGp+FoBlkEpQv/hKwoH+Rk=;
        b=ZBtoqUcAWNedus++bMMl8zcneP12Vxxl8ODOkVQRP3Wk+nEW8no+Camoe/bdLjZkdS
         iz3SrQa+B2MNV/E9xZ+74MusAqlwBIIdvaSRXAbqOucOZ8+PI41ny0EAxKhOdW0jsNAA
         OqoESUx9N7WbNMu/wPlczd9Kuife54xZuIc+U3T1eMq9Ii51bwg/X9DX0v0k29LO1r5Q
         fisOxv42rz7yIedZo5xLEVF+RirvXwWh3JYwSu79unWM9TFK97CtYfbZ9NH3UBOgGLML
         WBI8oIh89H9dbziOoRhGg+JNw/EZqejiQr7ugNdJFe4UxIcTossr41L4mUzHH92l3Nb4
         hAMA==
X-Forwarded-Encrypted: i=1; AFNElJ/2VE+4g/iszQvtZ1cFu+xoVLuDLW2eKu9kunahMer6oFl67pCmfIyEKPlFHUyBAHm9Tyg1xVlV7tse@vger.kernel.org
X-Gm-Message-State: AOJu0YyKOYLe9umr0+/fmtLSp3PMRCYbhFSzQORn/Ya1djx7+rLXwlJp
	ZEy6IN3R7g1ogT3YTNOjb1nRNJCa4lqJ0yz9X+utDXAla2+Hprf2UDG1wen7aWXrKQ==
X-Gm-Gg: Acq92OH2rF1sSl/DUbYCPDTHB4FJSca0aKKBwqWvmtX0jfxBBRO1k7oA9J6m5VgWp8c
	pBfM6UIEfD3qK5P2RwOu8lrruRdavER3c05SRgWtgafIfOqh+hz6wgbuu3pWGMUGnGhYongbsrl
	mwUqn56ZDbZtgXerfQqZMMwY4RbZsvOxjFLQNxqCzqEWUwpJsW5846MLsie+yneYBq/IQgE0IsT
	EBOF79ul3wgmS8yri1h57jy9zg9tMSp3NPT6Cq9knuBfRhohZUQEaxFt12F4TYYQDeXWhas39uq
	5GCiIlouTu9feT9vUPdczxUlVEG4r5hNZvkrV4FSH/VfhxDrjpLScJhLJf2JiAZEei/oIUFR1Tv
	7osjZodisS8I30a9UOhTIb/zRvpBKSxJHLNoFn678wiOyLRwCgQB44PQuhNa/x9dJmmEolr23PN
	mpXJkqW9nPeS3mfpAIouev8FNhM+m+HplnMpX9fy1QAUjaDO2sHU0pr7vB1GWihsi0ISIBDSord
	dnwWNSN
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr3062453a91.23.1778835727968;
        Fri, 15 May 2026 02:02:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
Date: Fri, 15 May 2026 17:01:36 +0800
Message-ID: <20260515090149.3169406-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This series is my attempt at enabling power sequencing for USB to support
the USB connection on M.2 E-key slots. M.2 E-key was enabled in v7.1-rc1
with just PCIe and UART supported [1].

Most of the series is based on next-20260508, while the DT changes also
depend on some other DT cleanup patches I sent [2][3].


Patch 1 reworks the power sequencing framework to allow matching against
different USB ports. The consumer API gains an "index" parameter (which
is the USB port number on the hub), while the provider API is reworked
to pass the index to the matching function of the providing driver.

Patch 2 implements the index matching in the pcie-m2 driver. Matching
only happens when a valid (>= 0) index is given.

Patch 3 reworks the power sequencing targets for the E-key connector in
the pcie-m2 driver to add targets for USB and SDIO. The former is used
later on in this series.

Patch 4 reworks the USB hub driver to return the actual error code from
hub_configure() in hub_probe(). This is needed in the next patch to
correctly return -EPROBE_DEFER.

Patch 5 lets the USB hub driver look for power sequencers for each port.
Currently this only works for M.2 E-key connections, but it could be
extended to cover other cases. It should also make port reset via turning
off the port VBUS work, even when VBUS is not directly controlled by the
hub.

I expect some discussion on this patch, because a) it adds some
OF-specific code into an otherwise generic (core) driver, and
b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powering
on the port twice, which negates the port reset part.

Patch 6 reverts an incorrectly modeled OF graph connection for the
MediaTek XHCI controller.

Patch 7 then adds a proper representation.

Patches 8 through 12 enable the M.2 E-key slots (used for WiFi/BT) and
USB type-A connectors found on MediaTek-based Chromebooks. These are
provided in this series for reference. The USB type-A connector changes,
while not directly related, have overlapping context, and was easier to
include. They were also used to test some extra local changes I tried
to convert the USB A connector from an onboard USB device to a power
sequencing provider.


As this series changes existing power sequencing API, and also uses the
changed API in subsequent patches, I think the best way to merge this
is for Bartosz to take the power sequencing patches and provide an
immutable tag for Greg to merge and then merge the USB patches.

The DT patches can go through the soc tree once all the driver and DT
binding changes are merged.


Thanks
ChenYu

P.S. I'll be at Embedded Recipes if anyone wants to discuss details.

[1] https://lore.kernel.org/all/20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260505101408.1796563-1-wenst@chromium.org/
[3] https://lore.kernel.org/all/20260514101254.2749300-1-wenst@chromium.org/


Chen-Yu Tsai (12):
  power: sequencing: Add index parameter for getting power sequencer
  power: sequencing: pcie-m2: implement port index matching
  power: sequencing: pcie-m2: Add usb and sdio targets for E-key
    connector
  usb: hub: Return actual error from hub_configure() in hub_probe()
  usb: hub: Power on connected M.2 E-key connectors
  Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed
    EP"
  dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
  arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
  arm64: dts: mediatek: mt8192-asurada: Add M.2 E-key slot
  arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
  arm64: dts: mediatek: mt8195-cherry: Add USB type-A connector
  arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot

 .../bindings/usb/mediatek,mtk-xhci.yaml       |  17 +-
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  93 ++++++++++-
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 139 +++++++++++++++--
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 146 +++++++++++++++++-
 drivers/power/sequencing/core.c               |  12 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  65 +++++---
 drivers/power/sequencing/pwrseq-qcom-wcn.c    |   6 +-
 drivers/power/sequencing/pwrseq-thead-gpu.c   |   2 +-
 drivers/usb/core/hub.c                        |  22 ++-
 drivers/usb/core/hub.h                        |   2 +
 drivers/usb/core/port.c                       |  54 ++++++-
 include/linux/pwrseq/consumer.h               |   6 +-
 include/linux/pwrseq/provider.h               |   2 +-
 13 files changed, 508 insertions(+), 58 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog

