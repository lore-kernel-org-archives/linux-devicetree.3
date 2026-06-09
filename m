Received: from r3-212.sinamail.sina.com.cn (r3-212.sinamail.sina.com.cn [202.108.3.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64412336891
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974399; cv=none; b=WYiwEN/shFRJgggLkfJPzwzhb0gIeSWWdTM3wh2drFGNtajuIRePLFlveznusMxCQbXoKs/KhzkMsZTRsA5Oh2iXIPh5Ulfajs/OEHY5KEk7BJzt53y/v46supYuyxNipZsI+BqY1GJz2BRbJcQeGPZBLb05It52vIbYAfx/j3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974399; c=relaxed/simple;
	bh=P2H+NZzIXse8UQANZN23GTVAli1gBZ4G2itXEem5Krc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=qHSKOkmdqkbOpWWCTyoxT1bHdgEcdvIz+PiQUauuD1Js5UY1rgHYKPHa1YJDwIznsMiD4LsxSgoFeyOC0zcPYBCbPHobLaQOBZm+WnVHOZDcsAs4eyQuHtr/CtJ40XilLcB9neDqJWZV73xlNrJFF1CuShUWtdycTKaK5qY8RX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A278331000011AE; Tue, 9 Jun 2026 11:06:26 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 0241C8D6B78345128429AD82FE90F6D1
X-SMAIL-UIID: 0241C8D6B78345128429AD82FE90F6D1-20260609-110626
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
Date: Tue,  9 Jun 2026 11:06:16 +0800
Message-Id: <20260609030623.17404-1-zhangyi@everest-semi.com>
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
 sound/soc/codecs/es8389.c                     | 136 +++++++++++++-----
 sound/soc/codecs/es8389.h                     |   6 +-
 3 files changed, 125 insertions(+), 40 deletions(-)

-- 
2.17.1

