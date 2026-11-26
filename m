Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700741;
	b=s2AXQE0lWsBodZFWLHmqtMkwtFcmCYIYOv2hqOUFn72Jhc3aoIoXbhLZVfQxCCWeKpeP
	 1wZwM/2ZvDD2m8/aeeQKctJSBLyllrpJ/lyTYPoSRabytlEVurUzG7WeitfCqKf/18x9N
	 mqWMFNwBTiUsXxITHLVvC1ttoAXkuUI60uTF1f4U6dh89kSe7zRrN4dHXvfz5WlxDx9vq
	 va76CiJb5ZVp0JWXWa5hnjuxnE5OcRSl3HJJ0i56uk3BJoqDtNujf28iGomgmCbtC+u14
	 2UuvBdnuN2GY7lIljO5UEfOStyCk+Qx3e6CPuA+ynrP9QWNEZjvW/fCxsQPx3TV9VBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700741;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TLZ4d9dW8ftPcSnmX1XbcRcgRVW38uBL8vxAl2/zy7E=;
	b=UlcLwzmod2+X17siIXyzw9Jl7Gj8SxR37+8CRM41yi4LMBCnXWsFpOxCMYQR8/WEc94d
	 7xIqNt8+3qhFwau4b+rxkDYkDHQ6DaaSed5aEfCIBYx3WRPaYh7P9BSElJqkLuLSAs9h8
	 QGXa8u+bmipDU+qHMgatlnHxxjS1BRdUN8Y7Ugyelq7tbmoQzUqWdwM4D/vhTpQF2MTGv
	 gZeP7klafayl3qeapJsQq2RTJ4gmTm8ESUQS//bu3egxtCnPGCzeBLJ0rT3SSh2tCshjB
	 h6BSJSWrhd9FCTzzCuUq8haeWhEmRk1F+6FeQXXwWZ1uk2gYWPuafz0wEXs2hTxA8Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GlOzYjzI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1CA606A31E;
	Thu, 26 Nov 2026 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GlOzYjzI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8A51F000E1;
	Thu, 26 Nov 2026 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700739;
	bh=TLZ4d9dW8ftPcSnmX1XbcRcgRVW38uBL8vxAl2/zy7E=;
	h=From:To:Cc:Subject:Date;
	b=GlOzYjzIERLYvGQNL7hNqMhT85HT1Gj1cu9vrTZV/lz7xTj0DbZAMHOMTQBFfhVyY
	 wueN8CYlwNy2FDq6/zFGDPWG9X/D6xgl7Q8+0JVO///4dzUdc90knaaak88ki0wadF
	 J0BsYxzLgm0J47i878fsCN1EYUVdEmOFz2Ox4yrOc//dIXjexdOgf769X6MIUIskwJ
	 5WZvDCMg4PirD5LQzSfrlnWZeyXOzeDu6yvBd+4/QcJj7cwkw4O/i267JpzE5NzbBx
	 +zn5BzvwQmXCCPWWIJaxZj/d+HMhyiKgLs0LjlYCXvnK8MdbWhrPGgquQ6oowMsfCB
	 qRurhISInW6zQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 00/10] drm/panel: novatek-nt36672e: Add SM8450 HDK display card
Date: Thu, 26 Nov 2026 15:44:58 +0200
Message-ID: <20261126134508.320700-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
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

The series extends the NT36672E binding and driver to support the panel
module, and adds a device tree overlay for the SM8450 HDK display card.

The display card for the Qualcomm SM8450 HDK board carries an LCD panel
module based on the Novatek NT36672E display driver IC. Unlike the panel
module, which is supported by the NT36672E panel driver on the QCM6490
IDP board, the display card panel is connected over 3 MIPI C-PHY lanes,
has a resolution of 1080x2400, and it runs at 144Hz with Display Stream
Compression, therefore a new panel configuration sequence is needed.

The initialization sequence, the display timings and the DSC parameters
of the display card panel are taken from the Qualcomm display device
tree source for the panel:

  https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-devicetree
  tag DISPLAY.LA.6.0.r12-02500-WAIPIO.QSSI17.0
  display/dsi-panel-nt36672e-fhd-plus-144hz-video-cphy.dtsi

The integrated touchscreen controller of the display card is not
described, since there is no binding or driver support for it yet.

Changes from v1 to v2:
- updated the dt example instead of adding reset-gpios documentation,
  and the GPIO polarity is now corrected by added gpiolib-of quirk,
- moved allOf to the end of the binding (Krzysztof),
- reworded the C-PHY link description in the overlay commit (Konrad),
- rebased on next-20261125, and collected the gained tags.

Link to v1:
- https://lore.kernel.org/all/20261028095151.1682096-1-vz@kernel.org/

Vladimir Zapolskiy (10):
  dt-bindings: display: panel: novatek,nt36672e: Describe the reset GPIO as active low
  dt-bindings: display: panel: novatek,nt36672e: Add bias enable GPIO
  drm/panel: novatek-nt36672e: Fix the reset GPIO polarity
  drm/panel: novatek-nt36672e: Make the AVDD and AVEE supplies optional
  drm/panel: novatek-nt36672e: Support the bias enable GPIO
  drm/panel: novatek-nt36672e: Verify the number of D-PHY data lanes
  drm/panel: novatek-nt36672e: Add support of the C-PHY panel module
  arm64: dts: qcom: sm8450-hdk: Add display card overlay
  arm64: dts: qcom: qcm6490-idp: Fix the panel reset GPIO polarity
  arm64: dts: qcom: qcm6490-idp: Describe the panel bias enable GPIO

 .../display/panel/novatek,nt36672e.yaml       |  40 +-
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      |  19 +-
 .../dts/qcom/sm8450-hdk-display-card.dtso     | 144 +++++
 drivers/gpio/gpiolib-of.c                     |   9 +
 drivers/gpu/drm/panel/Kconfig                 |   8 +-
 .../gpu/drm/panel/panel-novatek-nt36672e.c    | 604 +++++++++++++++++-
 7 files changed, 772 insertions(+), 56 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-hdk-display-card.dtso

-- 
2.51.0

