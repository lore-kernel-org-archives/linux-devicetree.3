Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181129;
	b=2+HxAQANTbQA0IJbKZxyhqd1oeD9ICk9Buun2ZSdmhhFAGuMw/6gP+Hk/z38FenNKSqK
	 JtQr6/RoLHOQhA5IqrEK2V7VV2R65XxRFCJ1KQUnTGKkg1fIGqbDe/MEamwxIJdPYGg0b
	 AK9KfPCrCnCxs2gW0LELBLpzoLNUcM0+z5q8k06/1Uu3vvrCzOGzcT/O7uvYhwuvBDqok
	 xq/L1gSPVpAH/U0ceELgbVaxhDTxVomQyhwvdeguRTE20FkgbcWoh8ryeQy6uEXvwTJoK
	 j0J0LJ0n7W8MKCNSLD8ZE+F8Nu+iYqII4M01sZRzeDlLRMX5fHT+a+5VdNqVPnx5ljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181129;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3oB04lBJ0+savoJSUnl0WM97DLv5mYQXQN1+NfFUXO4=;
	b=5kBsGlTrfVfdAgsEWlnQQdDZjhBcpYdt7/eG9dg9tTrRnWJhlRQ+qBkCofJzlQ8zlhPS
	 hlE9ZThBrhKRZsaDrXSfUudWNQHtF19KU9nJj1yFFRErp5GSwadGbne/vWZRR3nz9JzLI
	 +y6OKbuFaOunZhqDgUwRhghZG/zrM0CmVzy+OMff9dXZcsHkhlrUDN8RBv02dIB9nyGPL
	 wYUyc2N3+1yWjjUl/vO/C/KIvirYvyxdY/D7twPBok9jiuKkxUKY2Apa3rKQQXcoU0b/h
	 3NIyNGDpbUTPTSvjJEUCEvRUuhma772nuZdPmd9Tx7zU+9ZDIh4E/FnKRDh5baVIMCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YOxoDlKl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B304F606A31C;
	Wed, 28 Oct 2026 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YOxoDlKl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEFA1F01828;
	Wed, 28 Oct 2026 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181128;
	bh=3oB04lBJ0+savoJSUnl0WM97DLv5mYQXQN1+NfFUXO4=;
	h=From:To:Cc:Subject:Date;
	b=YOxoDlKldFegB9lJ7Nzt/FwZ+4YPGaW+qW335q/MLVtUggiRTt2CMjxw2A8VneomM
	 axW1gUO328kek6zU5pBM8tW3NSvznz2huLhyTMDih7HRjedCnUT5OwQA3M4FOGfOw8
	 6WcyQXTImXZBxZ4lSCmVyAf3U40zCmrS4ho+zxfZLO97Jr6QWZrCE7GlaYXnnIT+ag
	 S0hq5cxpbWp2zNxiPyZ8xdgp06/DOdnT2m0JhNSbQYTv9ZMs68haAIL9r5/ACsuFqb
	 IyiO21motDv/r0evr81Qanxat1RcgFstsuqyuiMDR7qYCoKKWxQj5NWrpBXKYafEJ6
	 UN/32LLveYu8A==
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
Subject: [PATCH 0/8] drm/panel: novatek-nt36672e: Add SM8450 HDK display card
Date: Wed, 28 Oct 2026 11:51:43 +0200
Message-ID: <20261028095151.1682096-1-vz@kernel.org>
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
IDP board, the display card panel is connected over 3 MIPI C-PHY trios,
has a resolution of 1080x2400, and it runs at 144Hz with Display Stream
Compression, therefore a new panel configuration sequence is needed.

Since MIPI PHY type of the DSI link is fixed by the panel module design,
the driver selects the panel description by the PHY type of the DSI link.

The initialization sequence, the display timings and the DSC parameters
of the display card panel are taken from the Qualcomm display device
tree source for the panel:

  https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-devicetree
  tag DISPLAY.LA.6.0.r12-02500-WAIPIO.QSSI17.0
  display/dsi-panel-nt36672e-fhd-plus-144hz-video-cphy.dtsi

The integrated touchscreen controller of the display card is not
described, since there is no binding or driver support for it yet.

Vladimir Zapolskiy (8):
  dt-bindings: display: panel: novatek,nt36672e: Document the reset GPIO polarity
  dt-bindings: display: panel: novatek,nt36672e: Add bias enable GPIO
  drm/panel: novatek-nt36672e: Make the AVDD and AVEE supplies optional
  drm/panel: novatek-nt36672e: Support the bias enable GPIO
  drm/panel: novatek-nt36672e: Verify the number of D-PHY data lanes
  drm/panel: novatek-nt36672e: Add support of the C-PHY panel module
  arm64: dts: qcom: sm8450-hdk: Add display card overlay
  arm64: dts: qcom: qcm6490-idp: Describe the panel bias enable GPIO

 .../display/panel/novatek,nt36672e.yaml       |  41 +-
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      |  17 +-
 .../dts/qcom/sm8450-hdk-display-card.dtso     | 144 +++++
 drivers/gpu/drm/panel/Kconfig                 |   8 +-
 .../gpu/drm/panel/panel-novatek-nt36672e.c    | 596 +++++++++++++++++-
 6 files changed, 762 insertions(+), 48 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-hdk-display-card.dtso


base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.51.0

