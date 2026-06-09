Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D9228686
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 02:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973781; cv=none; b=paglDlOEgGvxW0ZZkT68hVJh/Hppuuc4hkoZ+RgUhN5Lbcvci0P4MuIrIHPohdtyHgMLkrcJzH2L/r2AZbBhZ3uT/cMelizeOdkarc0R1yCg1nvYRRkMmWqWF9au3sJTt6w1XbemJynRarTPxFhVTzFXm1toaFLSZJ0HOAK3W7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973781; c=relaxed/simple;
	bh=HePgEuoo3ziU5SWC6GbQ92/7PTjIDWDACcIxTAdc8Fo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=rVtqQX5Vv0sCVZizoDKpI9jnIjEnSygQ37fDngOQoIN+avs5DDfoI/r/TAnYwfZZWXklPRD6n+OqFTRG3yGXKChGgGLeW7d7I7mNKJMWMBfrXfiJFq2zMllc30eBet/sztbgK7/gXcUzJeq034zpYj/JmwvZ2WLvkMts1KwxOu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2780C700004488; Tue, 9 Jun 2026 10:56:08 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3884F6CF9B7A4E66AA28A205CEDBF88A
X-SMAIL-UIID: 3884F6CF9B7A4E66AA28A205CEDBF88A-20260609-105608
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 0/7] ASoC: codecs: ES8389: Modify the ES8389 driver
Date: Tue,  9 Jun 2026 10:55:58 +0800
Message-Id: <20260609025605.16945-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

v0:
  - Modify volatile_register
  - Add MCLK_MASK to resolve the issue related to mclk_src
  - Modify configuration about clock
  - Add private members about HPF at driver and devicetree
  - Add INPUT MUX at route

Zhang Yi (7):
  ASoC: codecs: ES8389: Modify volatile_register
  ASoC: codecs: ES8389: Fix the issue about mclk_src
  ASoC: codecs: ES8389: Modify the clock table
  ASoC: codecs: ES8389: Modify the initial configuration
  ASoC: codecs: ES8389: Add private members related to HPF
  ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX
  ASoC: dt-bindings: ES8389: Add members about HPF

 .../bindings/sound/everest,es8389.yaml        |  23 +++
 sound/soc/codecs/es8389.c                     | 136 +++++++++++++-----
 sound/soc/codecs/es8389.h                     |   6 +-
 3 files changed, 125 insertions(+), 40 deletions(-)

-- 
2.17.1

