Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2465D3B19D0
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907796; cv=none; b=JJn6iM45u+zKWqL5W8Agt/GJaKCQS+oXv9vmVJiPCX1VhRNq7Mvwq7CyYsAMW2zAwgI64vy0/c7hSOqTbJw8ZMxOvzh9LyIz6KIEP7ltSfivNKc9NdbUAs2sK6qF+fswnppMt4a8e6AFQUXlJp7OKHvOc/BfXboTpGQ8eMdFi/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907796; c=relaxed/simple;
	bh=r6n7VzfROoKpU8dQtsIgWZS+PzUAAj4TZpbKmIdcY9s=;
	h=From:To:Cc:Subject:Date:Message-Id; b=TCS+thXNeB9Vr0lTjVWJ3OTz0adk72qEgkwbNCaNxXW/vZbaD6kBWWD5nonYV2ocTJTsx2c46NfUiTpNr2w7mzabyK1XrlnjztXj1ZKg8bgUwSOOiLw4+EvCrkEr55VMiowNEg1bow2LEN99+OVTtm0flX8sT0FdgIgIgVwV+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A267EDF00000BB8; Mon, 8 Jun 2026 16:35:44 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 7159E92E2FA54055B451A0810323BEE7
X-SMAIL-UIID: 7159E92E2FA54055B451A0810323BEE7-20260608-163544
From: Michael Zhang <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v0 0/7] ASoC: codecs: ES8389: Modify the ES8389 driver
Date: Mon,  8 Jun 2026 16:35:33 +0800
Message-Id: <20260608083540.12581-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

From: Zhang Yi <zhangyi@everest-semi.com>

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

 .../bindings/sound/everest,es8389.yaml        |  18 +++
 sound/soc/codecs/es8389.c                     | 130 +++++++++++++-----
 sound/soc/codecs/es8389.h                     |   8 +-
 3 files changed, 121 insertions(+), 35 deletions(-)

-- 
2.54.0.windows.1

