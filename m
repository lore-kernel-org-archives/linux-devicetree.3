Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77513D503
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682281; cv=none; b=Cz3cR4x/1SA0Xnn2h6dpi+ijsjAmX2QzU1MoH+CSGk0JAwheneOVVlo1Oqu7A6nTiqxIawxYOiuR3TLsTQ8ovs/SXcUR+jXkTYZERrTpgz01FQq1KYq4pJnNvehwQ2hZbEQi2Vu93dA50hBO0SizwvO1m+oY8oRptFQrlqTqh54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682281; c=relaxed/simple;
	bh=eH0Mjwd53TLUsu8FBNNWLb5psZuQ66wuc7o8/5aRyKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b23dGC3YB3uw2xW7s3zX7ZOvNOdu6B/bWUBufExc3ewvXZbbFb49lm45uIiDnkJspx2dw1DzU4NKj/hWeivq/JuM1k2GEmHBOYdosfs3jJpC3/+RDV4UK0phzb7sw5RLVgSxsbect6arunyICOoivIUrGMBStOIRXOxH1jXvO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRR8qWt2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRR8qWt2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955158f26aso8718485e9.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 07:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785682278; x=1786287078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iK9MEaYcWVmSY9o1Sifwkzjfyq959QpeeaqLNOopIGc=;
        b=JRR8qWt2Rl3A01lHL4UtY5rAa3G2xELoegwXht5Ka2sXSkTjUa67NTrBtqvm8tvTqo
         sMsFeODmqu+mjVmO4yoHJC3vQjXGrkfo1t4r/znzHwCo3nFcrxMiZrdYKxu8sDle6zGI
         8sHH5X6oydtju6l6xBHTd6iJIvuFDB2v9CZRutXoWzhfetBiBO4CH5qpGUve9JRMEq5K
         zuFF+gFzPhjw02p74/5WnjCkSQafIjEfNIvInVQ7YZWyFA/ZCYb76JfWS81brHDMgY2O
         JhFADi+1Sl4M9qOKuyjojU8T/ujp0JJPH8zFgylDfvJM3TkUYS1gyYM91AHlPtqKjYDT
         K+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785682278; x=1786287078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iK9MEaYcWVmSY9o1Sifwkzjfyq959QpeeaqLNOopIGc=;
        b=NF/GTm58dVX6FdQOXkGk4lDe0Oa07UvpjIOG8zyABDxXmMm+IVRV+dwIr75EfdEoU0
         r4794q6BNSLEPWE+us5yfgKGLYmFGQQp8J3SYxo3tUOW8xsEOlAdZxcqFT742p9Y/e3q
         tIg0GgxwCQp8Wp70oib9CF8twgIpygwTPTns0aaHufYipZAVUOTm/EA7W0NJ92uHAuWM
         7HhnG3n8cTglN9NLY7Dfgi2prP1CfrgIirNaO1as7vlUL1NKECpQYr6dUnJIeGdCCtKu
         WN35iyMldJDyKIdiwRmTHkAMrpqbUcq05F3v6w4vrciavvRlchtyko764G517jdbtYIj
         s+4w==
X-Forwarded-Encrypted: i=1; AHgh+RoQjuEHg+qzXvgzJSWzilOOu1h/pXxcWpmnCX4JKl99JdroXLsI79XSuqwqem0Xizy2jlw9yi0Y+/rE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Jm08bVxGOppulWANwzlDR4fagGj268Yzy7D3xqlpD1GAHCXt
	/W1t6h3eGcvq2sgPf6bfUvdK8rjZp2ZdbuWJvD6ZV+HShSH43jcysaD6
X-Gm-Gg: AR+sD121MYXZekE4SZBqibrE1O+kwl5q/vSQePIxWNmnc2ptPrBLLk9B1IjLA7DPaVJ
	qWYDl4JdFPeRFtEtdX/xYcntndBGtZse74aKN40TCLoO3kBIRbUfzhWCnYOc5X5OIE7GPx9/oTx
	G4IlB4ApPX6nkREpwAHeA+KTNYuK1S+YNqhhSdg322eVDYklU9hwuJPFZyQw5UaJFu3RnT8AhuF
	PSchO2Vs9DbQaP6rLxNbQ9Lj3gNH5N1MPNEA6RbM6C961OSI8KbkXXmbHycAyLqOGk9ceJ33d+N
	1u11ZnBiq9QmoQbsm4D85s6SzE38GrMVTr/f3mLyVjlVWNc6mp6qHeTxS6g0ZE9QG31SDH+2obK
	3niENrpr4uy99rBQX2/K7y+1HDsJ0hshxNtgwB2p7qYmhZ6jF4xiuRfscPA+9l+yYbd+uLv4LQz
	WE0ckBXx7v53I/G/TVerlop4+xYENJN8SApQJLzuJ3hCBJRJJvPr0HzGFMzi2JjZ9evwrFiGDyV
	/qBFqcj+e/fhGlbe/yrutBsZnTGR81Hvzr0PWv5PH+OgIGPzct3x6Co/L9y4g+ZBZSk0LcQK+xs
	nuE5cyvrT0t5abFFGbK8ww0LrxJOUlqr4veXl0tlzq8knpS80H1WEWlZO3ap3i4wLfYWONjRcLU
	FUJRWiHPnQ0StVDo0PPsJWhx2cHNsWsWbkl4Kkd7bpz8qvoDP7dxPlTAqACjfjzHsIeybWps=
X-Received: by 2002:a05:600c:4d97:b0:495:52db:7e8 with SMTP id 5b1f17b1804b1-4980c694ef0mr83665505e9.19.1785682278217;
        Sun, 02 Aug 2026 07:51:18 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm234526335e9.13.2026.08.02.07.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:51:16 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 0/3] Some minor RPi5 bits
Date: Sun,  2 Aug 2026 15:50:51 +0100
Message-ID: <20260802145109.728793-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are taken from the downstream kernel device tree. They
are small components that already have upstream support, from
older generation RPis or existing arm IP with just minor
changes for upstream, tested on rev C and D variants.

Peter Robinson (3):
  arm64: dts: broadcom: bcm2712: add arm PMU
  arm64: dts: broadcom: bcm2712: Add thermal monitor
  arm64: dts: broadcom: bcm2712: Add USB OTG port

 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 66 +++++++++++++++++++
 2 files changed, 72 insertions(+)

-- 
2.55.0

