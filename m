Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384F448F000
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990768; cv=none; b=ldy98GYVpk5fJ295R/uBVvjOn3ynGcWiFzUZB1WHHIG8RU5NsDxbyT7q6w3dRJXqwe4Tp9KqZXPFbAt6gxmAJtBkgSdQPDQTV/QlmrE5e1MpgfxvG9Nmb/UtAExekC99PhXql3ukDjiLES6j//N3rReQ4tBsawSPDkPW3kC+gI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990768; c=relaxed/simple;
	bh=SgVXdnakh1a9vybRscg8PdXIeBwRWAm6jhyYz/fIS3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=laTHISHoG+d3maAR0UN9tLb/dxORfnqAp8SCaSCzWFwgljXz253XxVNd7vkFPCRM4N9gL5bQ8PFpffPLod424oSR777PWCf14pj5HvhAfdbMU7oVv9JKJlqYgdXELooMuVXv9l+V4V9spU2kOlgk/XNmRX6FAtbqtapuZkes0Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6018jKc; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6018jKc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so16086215e9.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990765; x=1790595565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=;
        b=c6018jKczyYlBKLfZW09cEBcNQYjNWUZ22B18YONln1fit9LNYjCrUgWhAp4kntnJX
         ovnd31bQlq7X6It1ovLQIMguGEfOB4/HWZ60nCWHhPVp62LTS6whP0lehzq1Km67/LwI
         dge6VjpjewkaCFq11ksUzPgzGNioT+pUV1SKmfZMRL6L7v3HbrgPb06TzziDW1t7LDx4
         aSsWB0nGkpAdfueQ3Y6Kdi5tgI1x+K3d9BmJmByyG4DGBL0hJFrnxvw3Dh2f7koP4SXI
         14LGSHdtM1P8kNXXWcwCABXV9HuCADCM0HRwN9F8xughGAqQYz4k56iDEFxfkvIKshgj
         uBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990765; x=1790595565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=;
        b=PUCyaAep06/VjgrdVPTEV9eQDyEWe6tpYgkYqdny6m25cp6kMvA1kHbkLnWmQnchlk
         odncdUFuoHiCTE83F6SR9KFwmcXvGhjP66zWdN8rs+K5YneHCv9ou8dsiyQ+E37a6GiU
         lTyfq++BbUeXPkmDVqzEXklz2q9KFeb9521+w6LKx7wqkv8EasONvZttAl5bsOTIyOdm
         6B9CG+DqFGmmv5Dmh/MNkt53emkFZl7lf2JkDdPWOh2VS65G5oVGx9WnryVpsJLx6fkT
         S4Pvtc0fjQdGNLqsa2sWT0RFhZTGRiGT+Wi+lPABvmuewibZvQuAXS2YqdKo3oYqE80w
         KRVg==
X-Forwarded-Encrypted: i=1; AKwUvByzKId/gq6UeWa1gm6B638bOka7MvLmA5D86Yk8I29+yohyhytyPAyJRmNKlpfSJdwoGX3yDcuppF5S@vger.kernel.org
X-Gm-Message-State: AFuF++loG2/gzwHzj+In+t8/zVJhHP6txvQJL1Ucz0DELZJYVpnmOHl6
	OWB3UDXJDlGJW+ifCCotP3XroI0fBPEc/akNSuOvPwMf0vL7E26Ml7Y/
X-Gm-Gg: AYBFou31pGqt2tfqaa3lhmo0bW3EbnxrPcYVhfSM3se2B94wKp/rYmA3C8TjrqrhnC5
	6fQJC35c4W8s2eaxu1dMiIPUJyhV34CuCPO2OAjYPWDgnRtW22LVlqdDhzJmMR42OZpwinoQXKq
	YZRIk7m8JOVlkSBs4QMTZruMjsCYLNGDcE5IRy0D5ZuD12kfmei7x8A51ykjNzhIwgkF91uo/G+
	D6jlpHequZ70E4Dnp4Q0avAgEcoWKAfFqjL6Mf6Yu2vtKhBbTtxraWfN52Pl455/QojHXIR3D4b
	NtkAaDXeEAJoDT7EOEXMNhuIRl2rDObBJ8BU6s0M1tUXQb7gtkjJegyqeIcEOExcRD/thJaU9Fl
	WKP+DIpeTuSRIqFEMNpdVpwhX5qbCGg5fRWZ2+vJZwjujZ7sfTYOE1WQD2ua/OwpUwEmESIck5e
	3i8PD1y6BwNTX/LrNSbj8Qq7djdBh9VF5XeVuHJHYODqYWEebu+yk0fxvq75oznlp6Wn7p9k6rx
	cnr2Q==
X-Received: by 2002:a05:600c:3b8e:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49fc57144aamr185348875e9.8.1789990765124;
        Mon, 21 Sep 2026 04:39:25 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:24 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] Add support for the mt8167 display pipeline
Date: Mon, 21 Sep 2026 13:38:54 +0200
Message-ID: <20260921113914.779393-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for (almost) all display blocks of mt8167.
This SoC supports a DSI or DPI display and has HDMI output via a second
DPI block wired to the HDMI phy.

All the hard work was already upstreamed in the past, now all that's left
is some glue. In the first two patches we add support for the DPI output
blocks. In the third one we describe all the possible combinations of the
SoC display pipeline and in the last one we add the required nodes to the
SoC dtsi.

The final outputs of the display pipeline in the SoC dtsi are
intentionally left not connected to allow board dts to specify their
own output node.

I said almost all display blocks because HDMI output is not included in
this patch. I have it tested and working at all supported resolutions, but
since it needs some fixes in clocks and a new phy driver, I will send it
in a separate series.

The series has been tested on a Lenovo Smart Clock 2 (DSI), a Xiaomi Mi
Smart Clock 2 (DSI), and a Sony Playstation Classic Mini (HDMI via DPI).
Unfortunately I couldn't find an actual device using a DPI display, but
since DPI1-HDMI works, I feel confident saying that the clocks divisors
are correct.

Changes in v2:
- Fixed some copy-and-paste error in MMSYS routes spotted by Sashiko [2].

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260918175736.355305-1-l.scorcia@gmail.com/
[2] https://sashiko.dev/#/message/20260918180358.81A1D1F000FF%40smtp.kernel.org

Luca Leonardo Scorcia (4):
  dt-bindings: display: mediatek: dpi: Add compatible for mt8167
  drm/mediatek: Add support for mt8167 Digital Parallel Interface
  soc: mediatek: mt8167-mmsys: add routes for all display paths
  arm64: dts: mediatek: mt8167: Add DRM nodes

 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 369 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  23 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 drivers/soc/mediatek/mt8167-mmsys.h           | 193 ++++++++-
 5 files changed, 579 insertions(+), 9 deletions(-)

-- 
2.43.0

