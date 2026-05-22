Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3533A2571
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456038; cv=none; b=CAhOneQBw016PyCBULeK9EfZSasYZYF/NGt3Z1uiQpKxVGPbWzzgjiY9/hrmwcGaTg661WrwsbfGr5TMgcxjT9sXfDF92ElrmQ/aU1Mb2/KohxqARjegjan0sNVAExI9c8PQgJojWP8Iq/qVxRWFJrcaaaC8TO+ZCE+OoHuoKZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456038; c=relaxed/simple;
	bh=TOo6XCjBObu1Ex+qKuQtLT/Ppt0YzA1oPbT39hjy8qE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ET5a5lASXRUUZLE5TSt6nimDfo1/gvbas1uX8pbPm0rViPnUxnKT2OvFgdJCaZ/BAK+c/0/nmW5IW+pnLUk8SwX1Shw4MZziWBzxMIl4tMjHqrcRUmVcxdqxFRfWK9CJDvYedSLjS29xoUTmUumYzGgC3KWYAvlHUW80RxeMVck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S09c/8NI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S09c/8NI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so1434702f8f.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456036; x=1780060836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qLGD+d59NtgQVVpwJfCXZu6HhFLlAFnjmTwdInD0HI=;
        b=S09c/8NI4XUSRspjP8Ok1rHUIMBsQ/kXZZmYytyIZkU2+t4r63JC7oaMED+WlnoOfH
         EbWC14x8oGBymqvxn6L+5bdulKVpIxcwvdZmbK6JSALchZJfxXMQx9RCTV3d4r8WXzJJ
         S6Egv9dj4IbhboptLrCx8g7zOwn5SWOrnTXmC4EHifjl2nSTkCTQ28tw225E5rNy2AkX
         5f1P/DHzxfNRzhKJ+9kbEb2m6ZaboG89KhiFJxhFHwtJewH+ef0cKnlCyzF9r5vQ75W4
         EtYNA8U4COTaBGiPxbgf3XEMJe8Sju6aAHw5TNVxzJm8jrNjEvxe4/+2zivhBJ5ucUgd
         SRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456036; x=1780060836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qLGD+d59NtgQVVpwJfCXZu6HhFLlAFnjmTwdInD0HI=;
        b=G6/IQGnOCz/L1c104rJTnvJhNiSnoWnpgJUV6cNE2PZIoapl14qJTfksR/7w08TLpa
         hmJGX97tRung2OFhSZhjLZHvInuuNfktliZgGJM2CwFJs/bsQonwzuMPtb6OWodiNDIF
         aR9T6uwKKfPObD4CUVdLGgGsW4c3zWfGclU12/DJ+EegR+yU/lioZjfS4u9G4MP7fsMw
         Jv9ebEhIw+IX/6nCiFDbJ1wuCOgdnmiUFh07uBw2LekIac9Xnz82V20KE+qoEAZCs0sj
         M+kbMg2GVW81DewKYjtPcChuOEeftSSbix24AQUG1zjadjz8Bn0eLjWbKM8Cr1x4i0hX
         QHaA==
X-Forwarded-Encrypted: i=1; AFNElJ8oH8ZyRCEWe3qZIwHvo9UKqjb2PGnHQjMikoUVr/5aRNr1sTV4JmCnrY45uDlEu5+1zDJ5YbPFLq/2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1gb5WoktuNSwh+a4EbOQ3w6Y9sEcmPtBwXdN9+praaTbDvT8+
	SxOpNg6O8ZbEVxnTMtQdNwuLMTNVti5ZbLPdDpqkflZ0MHnLzysxZ3Fd
X-Gm-Gg: Acq92OHKZWDy6+jTVVEGQLQwZX1wDXqaCxHi6/gZHV71UEt7z0Epa3fyhZ8mlkflD/n
	+0vI5afGdtK+EyyDLigyH5bV0mMC47wfMLtXy2q/dO/bHAxqeOLZ5etwfR2YYgqj0lOBd5/LJyZ
	hvs9XALWOe5NAk30j/y2KItSH/3bYZ0qUKLn77VTUjLbMWBb+XrA+3/H6padU0aRHqis/jmjHGG
	7xeauGuT8776j7u9uaiLuGQQXHF9S2MVsiPry2XIaN9BS2QP4RkJr1jVoX7fEy/MN9HcP4/ncE3
	l1tNp8KhbtVwMho3e26f/DNuumCXCHVaR4zTdeyOTd4wpY2E+Kz8NT+bSteI12xkW4XhlDi6WDl
	5Y6XkkwXXQjMRU3tfFbEkN28ovQ31HNleaA/4LUvZYNgIKPZuFt2e4cZUWd5sHTO93am0Il87vC
	LWPKDs3QnKwH+ztZPFX70TgRzLQl+XNTDRBRELrcVDpdLot5jKn6u5
X-Received: by 2002:a05:600d:8494:20b0:48f:d1b8:9aaa with SMTP id 5b1f17b1804b1-490424a1628mr37558685e9.6.1779456035429;
        Fri, 22 May 2026 06:20:35 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:34 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/11] arm64: dts: ti: k3-am62-verdin: Add display and peripheral overlays
Date: Fri, 22 May 2026 14:20:13 +0100
Message-ID: <20260522132014.226721-13-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

This series adds device tree overlays, expanding the hardware support for
the Toradex Verdin AM62 SoM. The overlays target displays, cameras, audio,
and peripherals available through Toradex carrier boards and the accessory
ecosystem.

Display additions cover three interface types:
- native OLDI (LVDS) with Toradex Capacitive Touch Display 10.1" LVDS
- DSI-to-LVDS adapter based on the SN65DSI84 with Toradex Capacitive Touch
  Display 10.1" LVDS
- DSI driving Toradex Capacitive Touch Display 7" and 10.1" DSI.

The Riverdi vendor prefix and panel bindings required by the DSI overlay
patches are also added.

Non-display additions include OV5640 CSI camera support in 24 MHz and
27 MHz oscillator variants, NAU8822 Bridge Tied Load mode on the
Development Board, MCU_MCAN1 on the Verdin AM62 Mezzanine board,
and MCU_UART0 reservation for the Cortex-M4F debug UART.

TI maintainers: patches adding the Riverdi vendor prefix and panel-lvds
bindings are required by the DTS patches.
Are you fine picking up the full series once those patches are acked by
the DT/display maintainers?

Thanks,
Vitor Soares
---
Changes in v2:
- Add Acked-by tags
- Drop introduction of the LG LP156WF1 15.6" FHD dual-channel LVDS panel
- Drop migration of "logictechno,lt170410-2whc" to panel-lvds.yaml
- Link v1: https://lore.kernel.org/all/20260521150038.103538-17-ivitro@gmail.com/
---

Vitor Soares (11):
  arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with
    10.1" display
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    10.1" LVDS
  dt-bindings: vendor-prefixes: Add Riverdi
  dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and
    RVT101HVLNWC00
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    10.1" DSI
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    7" DSI
  arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
  arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
  arm64: dts: ti: k3-am62-verdin: Add Toradex OV5640 CSI Cameras
  arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
  arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display
    10.1" LVDS

 .../bindings/display/panel/panel-lvds.yaml    |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/ti/Makefile               |  49 +++++++
 .../ti/k3-am625-verdin-dev-mezzanine-can.dtso |  28 ++++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso |  97 +++++++++++++
 .../ti/k3-am625-verdin-dev-nau8822-btl.dtso   |  14 ++
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 123 ++++++++++++++++
 .../dts/ti/k3-am625-verdin-ov5640-24mhz.dtso  |  17 +++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtsi   |  71 ++++++++++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtso   |  18 +++
 ...625-verdin-panel-cap-touch-10inch-dsi.dtso | 132 ++++++++++++++++++
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 119 ++++++++++++++++
 ...m625-verdin-panel-cap-touch-7inch-dsi.dtso | 132 ++++++++++++++++++
 .../dts/ti/k3-am625-verdin-uart4-mcu.dtso     |  13 ++
 14 files changed, 819 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso

-- 
2.54.0

