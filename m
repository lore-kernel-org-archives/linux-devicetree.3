Received: from r3-47.sinamail.sina.com.cn (r3-47.sinamail.sina.com.cn [202.108.3.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BBA2D97BB
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989511; cv=none; b=cJ/6SCZB/t4lsYfPkn+dgTxxFdiTCNp+dMjkGUgmreYznFVU/LZ5jp1CU8BY6RAbutEooFCV0VQ9EIhDQy9DhohPMq7yPYUUSjA9hgGHyNvaA+1MXGKnRo/YrdVheZO5l6f9jqeyRru5Dj1g7aYa6inStLUDNlJusGZZ8wAVEbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989511; c=relaxed/simple;
	bh=zhCntYZ1MyyXn6GlpR8xuRssaXHVO5FyUOi4dOUfZto=;
	h=From:To:Cc:Subject:Date:Message-Id; b=IuH3VBlw9bzjNgbBf5dvA6Xd3Um5ndo3AFrdW6O1StWOEdFHeTQLIbra9j9jiSJuQefFVsHCeTDUut3YwK6t//HYd+FZoKFmtojy9zJwNk1GsOkLv3fEJQzqotMlrLzql45MsSf37mclk1D9pwXH9LRZm1CeZaeD/W3ojqL07Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6A27BE0F00000EF4; Tue, 9 Jun 2026 15:17:37 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 1D586144AD9C4EAD9C2187C0E7E79426
X-SMAIL-UIID: 1D586144AD9C4EAD9C2187C0E7E79426-20260609-151737
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
Date: Tue,  9 Jun 2026 15:17:25 +0800
Message-Id: <20260609071732.20939-1-zhangyi@everest-semi.com>
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
  ASoC: dt-bindings: ES8389: Add members about HPF and clock

 .../bindings/sound/everest,es8389.yaml        |  23 +++
 sound/soc/codecs/es8389.c                     | 141 +++++++++++++-----
 sound/soc/codecs/es8389.h                     |   6 +-
 3 files changed, 128 insertions(+), 42 deletions(-)

-- 
2.17.1

