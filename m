Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86F1477284
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341319; cv=none; b=gPDViHrxSQ5Jm74TQU2BJJ7PtMWn4/8JCEeMDJI/WyhSxtE5pkHcZgSI8WXOsxBzVBVrGJTPKTwE+ThggP9RLmHNpIa8Ys8FifsRqxwmy4n9gEfeLTEjjYNeY4KRUSc2/Zo4kssN+VOi48SkGb2OPUEFrOT8+h/TkItm0zcUCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341319; c=relaxed/simple;
	bh=9Kl6s+vwzUvSWiCJ7DNDa5W8zLkfL82HX/JYNw/OWIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wr83Qk2EGjc+9GzcMj1W2VpK0kABpxUsC7ghQGUxkzdBuikKWUSq4z7GgYpEObIhMVpRv7J5bdwLZVoyDjsDCOThPqdTJq389rcmb0t0TcAvUOKlZWTVA+l0SNVUt3xEBNoQJcCFvLDpegKuapETcemQsDwJwxp/dHd1zLiGapk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k2byokiX; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k2byokiX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785341311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q20EbqiUoUh++CZnYOPasINTNNTzimjQmZPWgue2as0=;
	b=k2byokiXDa6k6qo8BdZQcJhgAJFi+V27i2vLGjIysGB+PjEXSNrOTE4I1qJ+nSUmgbXEu5
	pcHavBb2jOixIJU5/A2jZSHo6H1hAFvsnG/kGz9oWuXwVOwoXGpaLci1NywFCVeBJLSS7S
	rqQHhJ1PsC0utD7rIx8uiaJGDEH0G4U=
From: Junjie Cao <junjie.cao@linux.dev>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Junjie Cao <junjie.cao@linux.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/panel: Add support for Novatek NT36532 panel
Date: Wed, 29 Jul 2026 09:08:02 -0700
Message-ID: <20260729160804.912826-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This series adds support for panels using the Novatek NT36532 Display
Driver IC, a dual-DSI, dual-DSC controller that requires DPU support
for MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT.

The first user is the CSOT PPC100HB1-1 panel found in the OnePlus Pad 2
(OnePlus Pad Pro in China) tablet: 3000x2120, dual-DSI in bonded mode,
DSC 1.2 with two slices per line.

This has been tested on the OnePlus Pad 2: the panel comes up in its
native 3000x2120 mode at 120Hz over dual-DSI in bonded mode with DSC,
and displays a stable image.

Changes in v2:
- Rebase onto next-20260727.
- Update to the new DRM APIs: devm_drm_panel_alloc(), devm_drm_panel_add().
- Drop the driver-private 'dsc_slice_per_pkt' plumbing and rely on
  MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT instead.
- Send DCS commands through the second DSI link in dual-DSI mode.
- Change the refresh rate control register 0xb3 value from 0x41 to 0x40.
- Drop the of_node assignment when registering the secondary DSI device,
  matching panel-novatek-nt36523.
- Update author email to junjie.cao@linux.dev.
- Pick up Conor's Acked-by on the binding.
- Link to v1: https://lore.kernel.org/all/20251001135914.13754-1-caojunjie650@gmail.com

Junjie Cao (2):
  dt-bindings: display: panel: Add Novatek NT36532
  drm/panel: Add Novatek NT36532 panel driver

 .../display/panel/novatek,nt36532.yaml        |  83 ++++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36532.c | 430 ++++++++++++++++++
 5 files changed, 531 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c


base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
-- 
2.43.0

