Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0642835A385
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472169; cv=none; b=IgU9OnLIsoReQ7rN2BE3JcPhpduyXMf6khTRm4o6FXVIiAMGZSwikwvhu/Tqyn6tT8xk9GTtkuXx9F57LDT0eMzmdd+7dpza5/VGbSMQAtN7Bneb30LzIx7ojgd9W5+XZ6aovEoE/Vj1r1RzPtMo8+S6Suo3xq8wgqci7Hk1QDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472169; c=relaxed/simple;
	bh=N2X72grTHQ8dU2pJV1M8ei+6uo5LI8B83gDVsURvo0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7N3tpVP3QhAe3M/77MjrNlxjF6VHKiaEboz9Jboen8udck9wEgDTNqcm2/wGNELUk/M1sDBB+P58BhZ7wnlH6PT3cdz97463ahTQ9wpLNWBASO6xXy2pVD/KdqJB6I4UmJWrpqMghmOMNjyjTC0FwjsoDBOnCzliOXDuTe1l/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TiG5xCTW; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TiG5xCTW"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bd8f6ef4ba6so1116242666b.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779472166; x=1780076966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bz+7AE59b5o1Q2Ik4hVqizrjn40vGbbteFbT2ZCbAIA=;
        b=TiG5xCTWeKxCFR6CsM5epTwkHcjohm+k09DR1UR0z87QHOBAOMLwSzbycFS+AcDClL
         kRm5/3jFZa5IU0mGul02WtzNHYp8xXPuz/r5y3d/ZAYwF9zy3lVnvQwF6p5qh+A+SCub
         sQjJThfXkQCX85SCgGrScHDrUV8b8/LUUmq4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472166; x=1780076966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bz+7AE59b5o1Q2Ik4hVqizrjn40vGbbteFbT2ZCbAIA=;
        b=X1dhRlwul4jUpZqWYBEb+QmBXYt60t+wkmHUFr977hwg6RysnxJ+c+92cq2RaE/g15
         Hwq24lTI0r7CoKlLz86ZEHDFFDjpg8rQvj0jOYqjHqbo25V+Kf22mwYrSxNHLpRCLUCA
         lg/GnQ3yoOZMDPfXXz6i29duYhL55vqhY+kA2cBIbCO+Nx8hmW/OdG1sTw/i9O+83uAO
         Ywpf44dXwKaunOY96E9oiCRnndQphJlzhQSxtRcbIHhhRfTgjCr3j48674UsITW9JAUo
         9+eu7ZIx96hgNdbtj5n4JKV/g+3SXqEzJwmCf3oVfLcfVuRdgcycCpu85MnuZIPD5QEf
         tVtw==
X-Gm-Message-State: AOJu0Yyvbx05G2ZrK97UTc7YIJ9xmCKoitzo+YgpBbNict5wqx1Zl5mw
	RKvua4+G2NRctI62jLjQMpQ6wwQalXAtqB1qyOY75P2nsNATkM+cbOOf4i7yaQl1IO5rZmYKM2J
	aC/eEvhw=
X-Gm-Gg: Acq92OF1jptT8y4yThS3P21ITszkb3OnD67/uA/DeK7R2etsiGxwiysc4fCyNf6mjWb
	3Fw0+yXWEDXZyNHZFbE9qCsjdYjoeRJXNSJSwYGAUnkddYZoEDDfPzyW9r7Tap2ayHjoP0TKoDt
	g1Yf03F2URwIemBK6GoaKK69WonkCmIxLcE3xCaZHNYN7DoRCnWziffTNqa0f/bKmmw89g0y1dZ
	Ik7hnu6ulKrGR2sCpG+LRpjKeDZd8nqIiX5SlDvpzpE7NRH9B6y9GF2Y2ENWrWmrGkRwxp74Qco
	kuri1D71YwN0SsGxaeTKvTCUvaI1zVPmVSCuvipIDF9TWBgwxdE7hdveTwVi3kv+2axoqYL77ot
	QqaqrXKTQ3TUjO4/8cNVfSeXku8Og3iCfcXbgGk91FJNlUSZMJQTL/88q+QaFyL3bHvFBo6oDG3
	aVjO4swgk4qIqsmDwR8wgsi6mQag1ogffo7GmaV8jRLU++gLGvL/7DGMc8B0QLQiNnHdBI1w==
X-Received: by 2002:a17:907:fd8a:b0:bd5:18ee:a54a with SMTP id a640c23a62f3a-bdd2293ec75mr322856166b.8.1779472166175;
        Fri, 22 May 2026 10:49:26 -0700 (PDT)
Received: from thinkpat.amarulasolutions.com ([94.162.24.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eca6f9sm74302366b.38.2026.05.22.10.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:49:25 -0700 (PDT)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add support for Axelera Metis SBC
Date: Fri, 22 May 2026 19:49:15 +0200
Message-ID: <20260522174918.61523-1-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Axelera AI Metis Compute Board is a SBC based on the Rockchip RK3588
SoC. It offers efficient AI compute for multi-stream computer vision and
generative AI applications in a compact design.

Product page [1].

This series was tested against Linux 7.1-rc4
(5200f5f493f79f14bbdc349e402a40dfb32f23c8), and aims to introduce basic
support for the board, which includes the console, the eMMC,
the two Gigabit Ethernet ports, the four USB ports and
the HDMI connector.

[1]: https://axelera.ai/evaluation-systems/metis-compute-board

Patrick Barsanti (3):
  dt-bindings: vendor-prefixes: Add Axelera AI
  dt-bindings: arm: rockchip: Add Axelera AI Metis Compute Board
  arm64: dts: rockchip: Add Axelera AI metis-sbc

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588-metis-sbc.dts    | 840 ++++++++++++++++++
 4 files changed, 848 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-metis-sbc.dts

-- 
2.53.0

