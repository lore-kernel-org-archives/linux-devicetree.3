Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794944015;
	b=aHt3eB/j2HWtfX3YE6cNSu0Q+lfGnIGvU+MsvOSYJ65sV/jMW1VQzfs8AUXAfy5rsjR7
	 rcjQIl4/1Ij7hI/zpYIkPlphL7vZUKQZ9rOWTEqjfDVTOrFPUJBXd4RPQu3CQTXfJasQo
	 B82tPtot7VeKB1h8P802oSo6M7IukYM+2eOkYWn2QQSTsV6agy/1kKOzFNwf2J+eOcfN0
	 aWVqOxpAkXWKZWrjvK5EHTv1S3xcVWmbK6pYYIeqM+O1a7x00nXjlWT7LJ7g1D4c4184P
	 LGAWq1YfVzV4zkf61nXE1rV6ahT/Iie58rjeVLVzC/DN+cpgpRFkGTHkWWT0ZnNsgTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944015;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=PziTO49EI4dtjSSOcFcBr5FvPKctyKd+wkZaq6cNkj8=;
	b=phMweK9ei1EXqhbgdYLL8fBkcNLnT2jAz6TlvSxRcnbWyqqfjeXTSLJitFF8zv0wRhfT
	 AuoOj/28AYX+4kynBFOeE8ulqkBLEBMbQS02hXP9z2O5SPk28vzhFsFNmoTA8f7hBFvP8
	 v9ZVtw8xIP6YN0urGbV5eBOjMO47FGXpQowuf7zyH2J68pbV+k/Z6ulw+CKYQWidyAOs6
	 EAodyHCbXEAh6G/vSwH6dHU1gpBKt74J0rw0DTrx62f6SrYNb7QUO0YLgr7r8cguuyyD1
	 vMjGi1sCPjk1kC7z6QLmjLXEiWXazW6/9S1pNx+byAygWqTfiRLoUZ0QzAi3mBYjwJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOSrEgfe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06273606A881;
	Tue, 17 Nov 2026 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOSrEgfe
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794944014;
	b=dRyO6XYGd5Vdp3ea1VSQUdPR/zGzpbUctvWZbiQjgRT6FX3QvCMfecTzXbqC+NBSSVF7
	 oQHGDRP2bRY3vH5aBhmGJI68eVewNfzcFNRL57SwcGYpY4gf4SIKPNtIxLwZkgcLJGA9f
	 IMKO5un6JuHOuxjnUxfl9IyOG9XAU+B3q3UTySjqVO91uRZPlm5w5tgKws3hradJMEQlR
	 txd/NYh8FSetiYD27sCaIW11+T6wOhB6hQ0pmS2AU0cu1SVAIPyTKlt0NIh1WhFYIyVHR
	 F5oeci9pGOzRGVkaBFzHlrm8yi+38M+XPRLrOFSn7/3QCm9EIpQ11Cjnrx3xeriLrwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794944014;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=PziTO49EI4dtjSSOcFcBr5FvPKctyKd+wkZaq6cNkj8=;
	b=JA+NXlrr1POsYhi9dmOerAdzX+gIsbboo4CesRJZOfqI5Dtfi/8GEJvFj0UJr5crbrVu
	 vSCfeVHjWI86mJPqUfjFlEBSrX0DZwzwQZi6dMBmXN8RkCMIln9cz9c60kgCzOOqpI0NG
	 C0mME2LYFlkRu/H0lJZgRSGxwbH8R5JKZNocIBoihu40VvL2+yDNQfJ0axLAdo70Im+DP
	 hqkqx1FLuzY8DTwu87DZfOuiofc27Nn6mW9jKI/gMajZu52uiJtt4RyJ6NGhcZzF215qC
	 ska8q0qW3Rwg8pcwM4oWftdMbwxal/XgyBLtYTsvvnytX0imKHt9M6SNRh/HgFFVHnA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30AE41F000C4;
	Tue, 17 Nov 2026 19:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944014;
	bh=PziTO49EI4dtjSSOcFcBr5FvPKctyKd+wkZaq6cNkj8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=cOSrEgfeS9S3cFP0QMrqbkytqPMZcLd75OBSEXv3dmia90AAH7sQAAIOcfyeO5UO7
	 vUGJD/EGBZZzfnFrSfGuFVxkEscVmcvFaQrOJBtrAOIL2pK79B1vXHad9Ha40VPskH
	 NYlXm+9jJJhLqL08YcaWUkvmrmqoHcE8XWujislugzFLbJk78yl+yB+q1dTu3kC9fl
	 /9dsr/JrokbLRne+aXY88j4TklFYcB495TpFQiTIdUxFxDeU2nevi0IfxkQHiFf4ac
	 1tbp3HKwzUygQXJeRXMNv3IsRe4PQXdt+wYtYpaKBnaxQs/rxPynV68w6FlH1Gwd0X
	 NQFq4YU+Pqn/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF3DE4AA71;
	Tue, 17 Nov 2026 19:33:33 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH 00/10] phy/drm: amlogic: Extract Meson HDMI TX PHY into a
 dedicated driver
Date: Tue, 17 Nov 2026 20:33:05 +0100
Message-Id: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
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
X-B4-Tracking: v=1; b=H4sIAPGr/GoC/yXMwQrCMAwA0F8ZORtoRzfQXxEPtc1shHYjqTIZ+
 /dVPb7L20BJmBQu3QZCb1aeS4M9dRCSLw9Cjs3Qm3601g6YSeeCUTIGIV8JU8xcV1zSB50Pzvh
 xcNGcoQ2L0MTrb7/e/tbX/UmhfkvY9wM2bkLbfwAAAA==
X-Change-ID: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3753;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=asdMRex/1PFcBi9XOqqoJu5U124xh2EczpzA6vIp9iY=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9af1b8ij/Uv/XNjpeKx9gAJ72w++X8euZscbkWX7tLsu
 Cu2KUi0o5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZjI5iZGhsmtHz6vl5tpP+f+
 +79PFryfz6xd2zd3Bd/fL2Khqw6evbaN4X/I64cp+9asKmP+G6OW+7pxz4qHm1tUlz1yUI6qZ9+
 t85gbAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

This series moves the Amlogic Meson HDMI TX PHY handling (covering GXBB,
GXL, GXM, and G12A SoCs) out of the meson_dw_hdmi DRM driver and into a
dedicated generic PHY driver.

Until now, meson_dw_hdmi directly manipulated the HHI system controller
registers (HHI_HDMI_PHY_CNTL0..5) to configure analog parameters, toggle
resets, and manage power states, as well as manually ungating HDMI
clocks and power domains already described in the DT.

By extracting this logic into a standalone PHY driver under
drivers/phy/amlogic/:
- Hardware representation in the DT is cleaner, modeling the HDMI TX PHY
  as a child node of the HHI syscon referenced via standard "phys" and
  "phy-names" properties.
- The DRM bridge driver relies on the standard generic PHY API
  (phy_init, phy_configure, phy_power_on/off, phy_exit) rather than
  touching syscon registers directly.
- Legacy DTs lacking the "phys" property remain supported via a
  temporary fallback helper (meson_hdmi_phy_create_legacy) to preserve
  backward compatibility to be removed on next phase of component
  removal.

Overview of the series:
- Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
  add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
  "hdmi-phy" child node under the HHI syscon.
- Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
  PHY configuration ops, along with the temporary legacy creation
  helper.
- Patch 5: Document the optional "phys" and "phy-names" properties in
  the amlogic,meson-dw-hdmi binding.
- Patches 6-7: Clean up manual HHI clock/power-domain writes in
  meson_dw_hdmi (relying on runtime PM instead) and convert the driver
  to use the generic PHY framework.
- Patches 8-10: Add the "hdmi-phy" child node and wire up the "phys"
  phandle for G12, GXBB, and GXL Device Trees.

Tested on:
- Khadas VIM1 (GXL)
- dtbs_check and dt_binding_check run cleanly with no new warnings.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Ronald Claveau (10):
      dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible matching in conditionals
      dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
      dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy child node
      phy: amlogic: Add Meson HDMI TX PHY driver
      dt-bindings: display: amlogic,meson-dw-hdmi: Add phys and phy-names
      drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
      drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY
      arm64: dts: amlogic: Add HDMI TX PHY node for G12
      arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
      arm64: dts: amlogic: Add HDMI TX PHY node for GXL

 .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   8 +
 .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 +++
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   7 +
 drivers/gpu/drm/meson/Kconfig                      |   1 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c              | 203 ++++++--------
 drivers/phy/amlogic/Kconfig                        |  11 +
 drivers/phy/amlogic/Makefile                       |   1 +
 drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 309 +++++++++++++++++++++
 include/linux/phy/phy-meson-hdmi-tx.h              |  19 ++
 12 files changed, 513 insertions(+), 136 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09

Best regards,
--  
Ronald Claveau <linux-kernel-dev@aliel.fr>


