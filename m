Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679490;
	b=FYbKoiXNv19mGqpJaaJtZtfv6wmCq/KsiHLMbysBsLhCsvehFmJitD/gIR1NeQz+iS3l
	 TbrM9M12aYey3ao4UvyrJo4V7t809jIBIfdnGj1RGWkoRuKJ3X2WbjagYmQ1tHBowZzRl
	 74f+Cn8Sm+RAQYxGxgDnSJRV3Ra9yYgRTh32dKrk0v6T++5Ac9fdegPcZ6XllMNdrYs7n
	 w/NzPO+p9tDPNiBWmGFEZUcWa59r97ljSGGc0UzMf3ChuW+DEYfZhbu1OmJtrypV1o4Fh
	 B1KGeWXrL+R6Em9W2FMLYspx81u2ODi9Mcsp4rZsYsnSbzHJ1MyLcuojAsnZhPW2CGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=VMwAi1eN8x7Ostj9pYIqVLUHvczC37pf1z6i56KRaM8=;
	b=1pQzS7QKFH7NHXeqSHYIW3/TobKkq+tnAVAG1NudcV5IUGza4tKXgS7ecN1TwhTN2VMi
	 H3EPVPcKHbUrZ5efTqU76Oy/fz6G7jkUBc2L7WmtOIdoMrwFr6jmAF7Ql5Kut6F7Ugd5d
	 Gek45R/sGxSf+/8U5oYDMRnmmdzBAuihB4XijxfLYleDlhcViQcWhmcwNPp/vVVrso3/P
	 fUEuXs98T6ru21+UyNs2dbxeIEU6jb5cKI0naVQ6t/DjUWHH960yri9An6MgzhZTlaMzr
	 a/gmRMPh2RGETGUyN6yDy7PY30YnSjTJkP7ufNDy1afFV/vlhJGwiMbeXGr8/OXD9fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iQty8P5k;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C76606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C76606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iQty8P5k
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso16776995e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679488; x=1793284288; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VMwAi1eN8x7Ostj9pYIqVLUHvczC37pf1z6i56KRaM8=;
        b=iQty8P5kugHlOUupIGc07KgVHzC8WNDnvasXC4bbT96zQO0vVDk65yZNOGQfZT+mtC
         1n64Na8cDDSea2jUAZxsZh59NFRTxeOHUwe/2LsggdFxlkBm7KwRyP3X4yJ8+rc6D0T+
         3hOxVTYDWa4FbxUzN95guOH9pi3RWX9UV4r0V9KYLL6z/D3uZz2m+8HTUEVru8eJZeTH
         MaYj707QviQfYZ69GPHppPhuOiDd25QFXV5Hhj42KptPDhqrHJhGxfER6eOlYxwHJ2hF
         xnQYJoWnVY246lTbhnZgEMwVEC937SVhaB4l+YOuGzq9wj52ALXzEofDKAYXTdPqubLm
         wxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679488; x=1793284288;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VMwAi1eN8x7Ostj9pYIqVLUHvczC37pf1z6i56KRaM8=;
        b=yLKCcnPtpzX9XgV8fm6U9J3VXkbHMxwSjPWm6eVBp/j8fttp3Z9McLu4z4oARIks2f
         PRNYGMrX4SgZo7zeNrBfKqwwE2MF5hMWnuv3yt1/UuSNDDDF2qTWOMllLMUH1gPIj+Ll
         JgIeknXLwoJlW4PbnDLWVLUh3pBiuIO27PeV0V93Q8vfrbnOdK01rHBBwCOvv9wE1Zmu
         Rh/YVnbzIvXaWozjk8t507JL076fmfUskiPKgDqvVPOYFOowhI6DJ3wEYxFVLml9LAxc
         y5kIm8SdcJjeF7pFkx7T3toAneTfJS2ThKvtEQQr0ChltiXHVIEdRTb22wB6ElD+od/B
         wTFA==
X-Forwarded-Encrypted: i=1; AKwUvBzU7HOWTBa0EEXZIWXHcB6IgQdPT3jDqMzMsIS923Ff1FuOPn6u8HKYwRrw4GCAhPGJqIgZ43ItuwbK@vger.kernel.org
X-Gm-Message-State: AFq9FYKew+ocqjmdDqY9r3dcZYINaCPaUHrheFDFwPnxlTjq87lrXhZ5
	+jJ3vFRwAlk8j1VEk0lMbiLDIvpwQek5nuVmbap3ImHedXUqt0btSlUd
X-Gm-Gg: AYBFou0II1RH1lW8ReEd4dIw4NKPKDFmUPehXX0LwotAfms6/258Yr6xTAx8Ty46hA4
	YiUC5E/HRLY9J65ZGkEgswXH/owlrRjSr3Zk4mVQkM4chJqqT+hXKz9/mkvCZZdaGb+JE9sECbb
	TXvTdo0RWMvvdPpY4sf39aS1Ozily0NbZegD5XmRrJZ4jXhwNr3nZ0yclFcV2r4o3zz9VuLngFK
	cGnXAxdqOpspmAsXpN0Bs4QGxsvFR626MRcyTVrfSmkJrxtFp8ELId/Fwogj0MOsRQDsuYInihP
	5xG05Nw3QjO+7CFEqQBtjbohZcuGceXlD/XYcpAcNe1+9r2yvjADj8hMcjO54yY/sevUnsTdsjV
	frFhIrT0akYycfVNHqracXi8aW0uuG4DzVZb2fUUK/uXHnnOniI5C3gK+sf1TFlsOXjWBRJL2Ir
	a7DcuySpU+FeHWrmyUi3chdJ3pRMs4PIAa87V2wVgu/eFCuZh3zW5RQ/clx6uqMeq+iK6GQGxMl
	OwrXvryXfNU4kVQdvN0QQNVjTf3DyLu/f/HWgNrq7Axp/NIhDE4lZ10lZxBq33qQyRNcc0N+lGo
	hmyJSNLjKrM8fkLZycbSWnnXYEI195OgfeSLKO3ENUcLQIwkMkWpv7A=
X-Received: by 2002:a05:600c:4f91:b0:4a1:e0e3:7fe0 with SMTP id 5b1f17b1804b1-4a1fdd0fb13mr106097695e9.12.1792679487933;
        Thu, 22 Oct 2026 07:31:27 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200f4d16bsm85693745e9.2.2026.10.22.07.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:31:27 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v3 0/4] arm64: dts: freescale: Add Verdin iMX8M OV5640
 camera overlays
Date: Thu, 22 Oct 2026 16:31:24 +0200
Message-Id: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIAD0e2moC/4XNwQ6CMBAE0F8hPbtm2xIET/6H8VDbRXookNY0E
 MK/uxBj4onDHGYObxaRKHpK4losIlL2yQ89F30qhO1M/yLwjrtQqCpssIZM0fkefJjqMELHsSZ
 QNBDJuBkqdFVtVIuqVIKRMVLrp/3g/uDe+fQe4rz/ZbmtX1riEZ0lIGjb6LIh655Ne2PJOJrOd
 ghiw7P6gRJRHoKKwYuTutQMcv7BdV0/H/Z5uB8BAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Add shared OV5640 camera overlays for Verdin iMX8M Mini and Verdin
iMX8M Plus, and support a second camera through the Verdin iMX8M Plus
Mezzanine.

These patches are the follow-up promised when the OV5640 patches
were removed from v2 of the Verdin iMX8M Mini overlay series:
https://lore.kernel.org/r/20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com

Verdin iMX8M Mini and Verdin iMX8M Plus can use the same 24-pin camera
connector on the Verdin Development Board, Dahlia and Mallow carrier
boards. The connector's sideband signals are routed to different GPIO
controllers, however, and the two SoCs use different capture pipelines.
Describing these details directly in an accessory overlay would require
a separate camera overlay for each SoM and carrier combination.

Following feedback on the Verdin iMX8M Mini series, introduce a binding
for the connector's sideband GPIO nexus. Add connector mappings to the
carrier descriptions and stable labels for the SoM-specific CSI media
nodes. This allows one pair of OV5640 overlays to be shared by both SoMs
and all three carrier boards.

The binding intentionally covers only the connector's GPIO signals.
MIPI CSI-2 endpoints, I2C, clocks and supplies continue to use their
existing bindings and are connected through stable labels in the Verdin
device trees.

The unsuffixed camera overlay describes the current camera module with
its 27 MHz oscillator. A separate overlay supports the legacy module
with its 24 MHz oscillator.

The Verdin iMX8M Plus Mezzanine exposes the SoC's second MIPI CSI-2
interface through another 24-pin camera connector. Its camera control
signals can be routed through either the default or alternate GPIO
jumper positions. Reuse the connector nexus for both configurations so
that they share one camera and media-pipeline description. Provide 27
MHz and 24 MHz variants for each jumper configuration.

The default GPIO routing is intended for a single camera because it
shares control signals with the native CSI_1 connector. The alternate
routing permits native and mezzanine cameras to be used together, but
conflicts with the Atmel MXT touchscreen GPIO.

The shared 27 MHz overlay was run-tested on Verdin iMX8M Mini and Verdin
iMX8M Plus. Both shared camera overlays were compiled, applied and
schema-validated with the WiFi and non-WiFi variants of all three
supported carrier boards on both SoCs. All mezzanine overlays were also
tested both standalone and in the dual camera use case on the iMX8MP.

When fw_devlink is enforcing probe ordering, camera probing depends on
the GPIO nexus support from [1]. Without it, fw_devlink can treat the
connector nexus itself as the supplier of the camera regulator instead
of following gpio-map to the underlying GPIO controller. This can leave
the regulator and camera waiting, for example:

  i2c 2-003c: deferred probe pending: i2c: supplier regulator-camera not ready

[1] https://lore.kernel.org/all/20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v3:
- Drop the Cortex-M7 remoteproc and UART_4 overlay patches, which are
  now sent separately (Frank)
- Collect Frank's R-b on the dt-bindings patch
- dt-bindings: Keep the all-ones gpio-map-mask and gpio-map-pass-thru,
  as discussed on v2:
  https://lore.kernel.org/r/20261021-huddling-fabulous-75f0298c2fad@spud
- Point to v3 of the fw_devlink nexus series
- Rebase onto imx/dt64; drop the dependency on the Verdin iMX8M Plus
  display overlay series, which is deferred
- Link to v2: https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com

Changes in v2:
- dt-bindings: Drop the unrelated GPIO controller node from the example
- dt-bindings: Describe the physical connector (24-pin, 0.5 mm pitch
  FFC/FPC) shared by Toradex carrier boards, following the discussion
  on the compatible name
- Keep the toradex,camera-connector compatible, the all-ones
  gpio-map-mask and the absence of gpio-controller
- Rebase
- Link to v1: https://lore.kernel.org/r/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com

---
Ernest Van Hoecke (4):
      dt-bindings: connector: Add Toradex camera connector
      arm64: dts: freescale: imx8m{m,p}-verdin: Add camera connector nexus
      arm64: dts: freescale: imx8m{m,p}-verdin: Add shared OV5640 overlays
      arm64: dts: freescale: imx8mp-verdin: Add mezzanine OV5640 overlays

 .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile             | 30 ++++++++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 +++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-mallow.dtsi   | 17 +++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  8 ++-
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   | 17 +++++
 ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 +++++
 ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
 ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 ++++++++++
 ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 +++++++++++
 .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |  7 +-
 18 files changed, 534 insertions(+), 2 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20260908-verdin-imx8mp-hmp-camera-ready-60d68a2f0242

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

