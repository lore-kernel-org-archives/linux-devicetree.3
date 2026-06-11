Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AE91EFF93
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147919; cv=none; b=rmsxTseDIrdTaXELGZsZWkdzOsEVERfW6lSuIiPz8vQn3es7zZztvDDpaFYz72gEkVGtW70o4WfCjkQF+xpyH47T5BfTsFpz+s4Be5yCJvV7Xf6uV7x/2YVuIFuMxP8CA5js3tUTuexBTCSADgQiESBMyuVdh8omh4aCNg/63Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147919; c=relaxed/simple;
	bh=knLBPSQMF288O9mstVXv/c/5QZG4cv0X4XoUjn+al9s=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Cq0n+0Nnxx6xfU3N8q5IMF4kjY3PoqFVqWwV3O7SCk1n5FL5CshVsaJTlibelT8CFXRnnQ7W2JLEhpLEuBUjsAM6DdbFSXvT/ZX3/G/v4PAwJ5F9LkSfByizFpRE/m7d6odOakmFZrcUsPc/5tS6d+1u+szbuBffOU+ZAPjWG9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2A29030000377C; Thu, 11 Jun 2026 11:18:28 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 96C9ADBA6E1843DA8C9DED3E722C1E4F
X-SMAIL-UIID: 96C9ADBA6E1843DA8C9DED3E722C1E4F-20260611-111828
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 0/7] ASoC: codecs: ES8389: Modify the ES8389 driver
Date: Thu, 11 Jun 2026 11:18:17 +0800
Message-Id: <20260611031824.4628-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Modify the initialization configuration and routes for ES8389,
and add private members.
Describe the added private members in `devicetree/bindings`

v1 -> v0:
	-The binding patch has been placed before the corresponding code patch
	-Provide a more detailed description of the binding patch
	-Provide a more detailed description of the patch about HPF

Zhang Yi (7):
  ASoC: dt-bindings: ES8389: Add members about HPF and clock
  ASoC: codecs: ES8389: Modify volatile_register
  ASoC: codecs: ES8389: Fix the issue about mclk_src
  ASoC: codecs: ES8389: Modify the clock table
  ASoC: codecs: ES8389: Modify the initial configuration
  ASoC: codecs: ES8389: Add private members related to HPF
  ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX

 .../bindings/sound/everest,es8389.yaml        |  23 +++
 sound/soc/codecs/es8389.c                     | 141 +++++++++++++-----
 sound/soc/codecs/es8389.h                     |   6 +-
 3 files changed, 128 insertions(+), 42 deletions(-)

-- 
2.17.1

