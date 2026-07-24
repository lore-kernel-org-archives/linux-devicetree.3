Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A736B918
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910283; cv=none; b=Z1kVlcGzD3ntnuCzneTgYQW3k+DNZLoIBaCQgL/+QcCmpm3ePdfEJQjX8UVe4pJcLTWr+YBKWmHpMObxsw94qGSzsZXJEpVXBNjGNXSnJCiWhe4veY7e9fbLg6FWA7HL6ksby0CcTwCCtd5FG1pYdOaGcsFy/4J5LSMj2V6GmV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910283; c=relaxed/simple;
	bh=W4GflG547kCGGXAuWVfH79/VJBEGvcleAsQc8NOt4fQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uzpAVYPFeiYTBVFaMSMj+IzYNYa1+Kb8q1XhRE4xI85e51ZiA+LU1zsK+FFGzIS9RyZAap/kQIJSaCrSlC8Fz7WX5gRbOkddToQ4X37tZt1LTmvbEubqF8r3ryYNekdbxYoxnipxNPlW6KxjF4ExPvygCz/vFF2ur/yVuOWp0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXTF01tM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXTF01tM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f7854678bso281457f8f.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910279; x=1785515079; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yWEo1m5U7JSWIhc+bgC37Go+1MRYNAMl/oywARAfabs=;
        b=LXTF01tMWuizSbXMP3nQ17jqFCobHspUHrQL39ROml+ffpsK4pmK9zWDbwYMQn9UWV
         oEgwEFwaG45A/gq85buBbu+uayPvDj+Xjiw44ZNHkNCT4+KPVgSN3qZxl8vUsQuQJO7o
         G1s8NQ2M43jMZsX5S88JQJO/DMg+VEIOaeC0mkM+U30g7h1XfhSHET6ecotroSmOS0OM
         hVACykXxsVEvPq8Nyq5g1nsFbxxXLjy6TO9jsGGWvoxy+Ugi1dSw2Z0zAqFuFW14ymPe
         2WqLOjM8XaBwLghViIeAvmU4YFX+9hzLksGOflRIL6euALHfbf3aH2DNfX45Dl/t4iOA
         rp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910279; x=1785515079;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yWEo1m5U7JSWIhc+bgC37Go+1MRYNAMl/oywARAfabs=;
        b=iCMEVHjnplf9K0MKY7+x9FjmJ95iUDTDmFnhLev2D+rc9oLV2mH5imHyA2YSkvIff6
         VMlZWYdPG5AeCnQESGVB9aRxItinkMa72SxXz5h3kRNz941/8fFRXxS8jJHc9fCLEz6H
         jbCRXNQOOt/BS7oxX+In7cUj3dUo2UIxZusOiW7SawA/AeqLTcNS4RY06118NmKtxIvV
         hm8vCwoEN0Rp9mEXtWuOkiNI0XxxCz7GfE8HzPMArG3MieK8I9zZebI1xxbHcS10fDPD
         KulLxtc1yVWV8AQjrGuWnIPYDyP2E3OtR1uBO1zFE0CJv68bzQ6NExVQIERaIG0Kqy/r
         HidQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyNeWmTpQfRKMHIe2QsoBa6mh4JuTnSvkZkka779Hwn4U1ZQMer0YQe5aGoJgrgLj5pBMNJ/88EDpo@vger.kernel.org
X-Gm-Message-State: AOJu0YwSe/iiF2rCBxNV22OWgf8UuKcRMIAGbK+OxpWat5dN6WE+FMPQ
	3/KP9yxzEPp+gzSyWZ0MwQmJOMBaIEBgLC9h2cww9DgsHnnAHoLcmtkdH9uQumfp
X-Gm-Gg: AR+sD12qUb0t4r1DZUsEWL3OJRu+Tz/9ZUTnQI/wItMLw0Wo2fOJ9gYoeQC/QQ/KE+W
	/LbN+Z/apJM8me6vhlFd8e51R3rX6j3YxttsAfITQKqCwXXI4SbpmP7rYFBZuRgykg7pal0bfWF
	F6h/iWjmKsG9qQevODu/si0XHaGziynCnvvwIvYieOWalnIiGFpZ+WO6rpyINfHdwUfjvd9Ukxn
	t3fWghCOr8G96kJkFZeacj99AmvFCtPH4xpkB66e1G2sqfCzdxkiqOhOfr/VTV4iIxBhkHw52J4
	ii7YMMjEzzmDUc0K0C7GB1k7KQ57lf8qISqLM2Xx4WpVY3zRN8PlJW0SAJACTJFRaDcdYr+HpTg
	VaDedzhrPw5n9M6Kjv02A/6K40Kg2rvwY5KEqpst59RHHHKhBqhJxyS1kpuKUO2CYd05J82cKLv
	SbmdZd1NWwumkYx9EMX4k6Wl6Ae4owhjduaEYzxvhY/UM79ki6QU+QQGAeZEzjJlflS0cZMnpOw
	L6MWaprkxXwaQ0s
X-Received: by 2002:a05:6000:4802:b0:47f:763e:e03a with SMTP id ffacd0b85a97d-47f8dc7a25fmr9546533f8f.34.1784910279327;
        Fri, 24 Jul 2026 09:24:39 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:38 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/7] arm64: dts: freescale: Add Verdin iMX8M Mini
 overlays
Date: Fri, 24 Jul 2026 18:24:26 +0200
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqRY2oC/3WNQQ7CIBBFr9LM2jFAkRpXvYfpgsJoZ0Ex0JCap
 ncXG7cu30v++xtkSkwZbs0GiQpnjnMFdWrATXZ+ErKvDEooIzrRYZFYKHmekcN6DQH9MsaMtlV
 GauOMchrq+JXowesRvg+VJ85LTO/jp8iv/SVl+y9ZtUBtnTetH/VF6L4WrKf17GKAYd/3D50fR
 OC+AAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for the Toradex Verdin iMX8M Mini
SoM. The overlays cover audio configuration, display adapters, DSI
displays, and Cortex-M4F integration.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- DSI-to-LVDS adapter based on the TI SN65DSI84 bridge, combined with the
  Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Cortex-M4F remoteproc support

Cortex-M4F support is split between the SoM description and an optional
UART_4 overlay. The SoM dtsi describes the remote processor and RPMsg
reserved-memory regions, while the overlay reserves Verdin UART_4 for
Cortex-M4F firmware use.

The Makefile entries build the standalone overlays as DTBOs, add
ready-to-use composed DTBs for selected carrier board and accessory
combinations, and add representative composed DTBs for build-time
coverage.

As discussed in v1, the overlays for the OV5640 cameras will follow
later and use the partial connectors model to specify the Verdin CSI
connector.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Dropped the OV5640 overlays, they will be added by a later series
- Link to v1: https://lore.kernel.org/r/20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com

---
Ernest Van Hoecke (7):
      arm64: dts: freescale: imx8mm-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 7" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F UART_4 overlay

 arch/arm64/boot/dts/freescale/Makefile             |  35 ++++++
 .../freescale/imx8mm-verdin-dev-nau8822-btl.dtso   |  14 +++
 .../dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso   |  88 ++++++++++++++
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso | 104 +++++++++++++++++
 .../imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso  | 129 +++++++++++++++++++++
 .../imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso   | 129 +++++++++++++++++++++
 .../dts/freescale/imx8mm-verdin-uart4-mcu.dtso     |  14 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  33 ++++++
 8 files changed, 546 insertions(+)
---
base-commit: 4d0d3a3d1993a41b2bf8d28aa6c6071fa1a3bff7
change-id: 20260707-v1-verdin-imx8mm-dtbos-a326146c62c4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

