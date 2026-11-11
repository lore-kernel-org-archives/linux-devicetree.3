Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423859;
	b=hBXRxJ/iJ7kx8dPs78uxCqgvf/Z/DiS5ijupq8L+OZ2UTckooyPWx7MIW665fX4ZSKRE
	 RFvhUsyiCsRxVsqQqVzXmEU4qDHTNh+WcIgFR2FYnDzTFdAA4NPrfkRk4kDj+/9+ASI/S
	 DEOtiTAD5SSa/nHPQbtL2kH5jwDVCU3vn0s7jJSA0Eqw9S8qEtEn21pyLcCYylIydpHRz
	 wyxIA3bJBaLbojfj/yV8A1HGD7xGq15m6M/l3SxElmfgkozh1Ucqv8ATjwugfrVHPda3j
	 hkDK/ycRNho639eY7NXUtzs0KoWaA2gNYskKGfqHbQ1XOeNZW7ZzVaDbq6VQhKAPhqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
	b=qm6rEgOReZVufsct2t3i0+QktL2njK/loL7vHfk0x8ubVsKE0IlJ5v0otBJAIlD6UJMM
	 juEpjVTaPV9TFbP5d7lBIyxBrIH34DULWnIr8PUPDs44q9Kz+p/eHw//OzOS3wnEjhqsb
	 pEqocvTp0g+npofwfDcYlHlisWUSo0d1zCu+yCJ0+HqMBS/zZW+0gq1VhYP8e5Djk98T2
	 5BljXokmetyJX7xu+qyGF2oYre+qnFVMwTKSJfug5lvsgMJF4zqW94wYtFNdcwrt9oAUk
	 KEn/mb6lNDuLyk/z5sxY0qnNErrOYy1mNO33691NrUbRMEVbX9C519BugMNpUBWtutQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cw3UQb+T;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112B4606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cw3UQb+T
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2194495a91.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423858; x=1795028658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
        b=cw3UQb+Td18Yt42LSfsmibmep9aQiJUcoH3dq0WgLgPBAzY6WnS99p2o0JLczQlS0J
         zHX8wvqHnMDgBWZmaxHTVtXm0TSAd8xkt5yiqYc2diTvfw9gzgJ+uZVcWbcEOW3KWo82
         HIAUWZTjj9nbTKfzlAKEGw4sUjtPqvx8VqdsDbkaqiITji/YYh4mZbZLh0Mti1oIw4bA
         csAJ7IdE/5C7MP1+SPxTlzwHGD9jkBte1ASIRAyAYODuKOmefK1InKsJQzAIQNJDNWvX
         pgB/bmIijTcWW8enNLiFS6qtlxAnGGOgv6bz29j3bAwZxsJOzZR5RSYibdr7aj9rwnY0
         ktBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423858; x=1795028658;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
        b=KLy6xqYBn1mXZsU6GhnSIFZrw4WfE/YdyrPcLno3GmTC2bezR+RKbnL2NgBEp4TDGT
         qUPr/QJo5wwYmsA8pOoQzy0iErkn342LDBw+epR91/FtrdwWUZeh8ARwu5opjHeJLhDV
         GhLunP1nDO5X6kbB+6n04/MDOpI5qO62p1UGe/AyR85orvjc3yEuIne+UlE7mkCpK9d2
         FMkOqG65WQMX5si1LRqg1jEno85exuV6MIltckFzLtT5y6K11mn1u9gHxAZqk3evtLT7
         LnAPvtPzjMNZaP1XXI5prrsLxQoXcVRufmVKHTw64AraiBsfH2L9fdQyOsZuo2p/bQi2
         4cuw==
X-Gm-Message-State: APuU4Z94h4S0CJcXPyNcPnN9/g2y6M6KY45kXgGo9ivGMB4eWEydCMj8
	CXwt4PlrkzbARAdovwnDLZiW5RiS4jDxY+rTM4eaKD9m9fDwlbWdlNxC
X-Gm-Gg: AYBFou38kTUI5ttsEiXgqS6EiUDat6qwxuiox6JymhVjmqLTLZ+nULYZ1RUnpn06dW1
	0/4YIajF/tHxsA9veWXmg/GierPRFh1NX/6OnXRyG2qgY7mKWWVJiz60mwVEgAH2dKN36d7R39y
	iNCa7man3igO/88Ab+bp+Tuv+KqWsVCm5HUTO2EBdRR3WXnvwWyfiTHGOXc9oG9fQrBZ15rlqd0
	zk8kntl2taAI+Q4OIfBnvKidTMsNGsKRhZj2poVrAbF7F40dAticLCrAW9bY2RsoeK/xciF5KNr
	ruUyUfoIuqT6d7jQP0SOap8ZQhG3+mM/xWNJW/NNWLhv4Y4Lvhlkd5roEs6D0hlJoxXpmaCe8UX
	kqd9+LotYGlT/X72GbwG1mGz/pBC+KwChvOwhNc3vCKqZ1AM04vhHMPXhsSc55cmDZABACb5+RG
	GFNOBPaz1KMNIPfA01gUd4D38m92ffw1t1AlZOyFnlmsOvUWkXY8mrDY2dxIJb1/2WhAeRY/a5O
	VXAD3n3kApqxn0/lisZ7xQg5Ghj0eTBQY6kH5T3Xy1UhQnx/+d/0NANdV5GUwzeM0RD2kWIcJ9J
	hJ3+j3Z6BNyjIFS9zepiFf4Dcy/POjwDHA==
X-Received: by 2002:a17:90a:e7d1:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b182e9415emr3092987a91.17.1794423857979;
        Wed, 11 Nov 2026 11:04:17 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/7] ARM: dts: Add Apalis iMX6 overlays
Date: Wed, 11 Nov 2026 16:03:56 -0300
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIABy89GoC/x3MOwqAMAwA0KtIZgO2SkGvIg5RUw34o4GiFO9uc
 XzLS6AchBW6IkHgKCrnkWHLAqaVjoVR5mywlXXGVDWODUaLdNEmirLfDs/IYaNHkV0zeTKtm72
 BHFyBvdx/3g/v+wFShYHwbAAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3193;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=sVz8tk9YnISmAo/N9+CFSdVkyiddkfKtwMakiw1SLiQ=;
 b=iPp0AI/CNJytJkCqQIgPV7xNs61v8TcBmtBWw+K1Uoo3T28/y54J1tqQNkUc+ZpeI1xvQtBp8
 d7H6Vw5IRyyDwnIc7j+fwu4AJ77hmdeIA+mh1XJ2ufCJZOi1z3BW9NU
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds device tree overlays for the Apalis iMX6 SoM. The
overlays cover parallel and LVDS displays, audio configuration and
OV5640 CSI camera modules.

The series adds support for:

- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- NAU8822 Bridge Tied Load configuration on the Apalis Evaluation Board V1.2
- Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage. Additionally, this series adds
ready-to-use DTBs with HDMI enabled, combining the carrier board device
trees with the common imx-hdmi.dtso.

This series depends on another patch series and should be applied after it:

    - https://lore.kernel.org/imx/20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com/T/#t

    Adds the HDMI overlay common to i.MX SoCs, imx-hdmi.dtso. This is
    necessary to add the HDMI-enabled ready-to-use DTBs, and for the
    patches to apply cleanly.

Changes in v2:
  - Don't add the imx6q-apalis-hdmi.dtso overlay, and instead rely on
    the recently proposed common imx-hdmi.dtso.
  - Include 'tdx' in the display panel overlay names, to make it clear that
    these are Toradex products. Add 'v1' in the Toradex Capacitive Touch
    Display 10.1" LVDS display overlay, to make the product version explicit.
  - Link to v1: https://lore.kernel.org/all/20261001155412.3177428-1-leoreis.costa@gmail.com/T/#u

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (7):
      ARM: dts: imx6q-apalis: Add ready-to-use DTBs with HDMI enabled
      ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
      ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1" LVDS
      ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
      ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI Cameras

 arch/arm/boot/dts/nxp/imx/Makefile                 | 86 ++++++++++++++++++++++
 .../imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso    | 15 ++++
 .../boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts   |  7 ++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts   |  7 ++
 .../dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso     | 17 +++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++
 ...-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 53 +++++++++++++
 ...-apalis-tdx-panel-cap-touch-7inch-parallel.dtso | 34 +++++++++
 ...-apalis-tdx-panel-res-touch-7inch-parallel.dtso | 30 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 86 ----------------------
 11 files changed, 335 insertions(+), 86 deletions(-)
---
base-commit: c260ba495ecd8dc5639be9a45a70cb56391078a6
change-id: 20261103-b4-v2-apalis-imx6-overlays-e64cfa196df1

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

