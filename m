Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEDC332EAD
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051973; cv=none; b=Yc0Q+EnRNTiCA0nnL+V4Kf+Bd7nSht8j/LnpkUONm4He3P1N2766AnN0wEP5mUv/wMsPjJydUrgatdw4HLx/Qyg6u5GXNh3Pr+w1x9udIJaI9C1L0JTgq7R+VTlmEXbf2dnsq1EBfLKhxS0EomZtVtVv9AmEY3MSmEkUJEZiN4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051973; c=relaxed/simple;
	bh=EbOkg0xhW+b9L9neCJpC2q3mXdwTWg7SuTznO/Nvhms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bjp+ANFqozgjWzgXERoYCVyRQKamRwMx5/uVRWr/BNC7UYIlEkmnGrC+lx1Wt4P+yPP0KHmZgknMW+C5jIcJHnYSA5otCo/tfU4Kn0qQ/3ya6j3JI1VC287kkZzB+og2rGRQe7JVrbh88xHlaLXLzRuDRyXRZ7nbUd3CQPTEVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvQAxucN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvQAxucN"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef29c5561so264744f8f.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051971; x=1780656771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Clr1sjugbIK8mVuhgaPmuk7DeQ8AwBiKW3SgLxEYIc=;
        b=NvQAxucNLUGHHRe91ySyDnRosltTZEYOWnbqn2QDW3t8XX6yiyfea+/IVBe9j+lfr/
         jx3zIG2D7AhSkEz88Cx3VZtiKH66mKl6kSMGsT+q2gdZoAHVEMzbYMgJZqQE/wgKjbIs
         D8JhKlmHCOE6mbhJMR60tZrXXfkmrAOA+NDPuZeFposQ1t6sZ1gNUBgSqUi9bdaYtU9d
         fJqYzmcDA2THssZrH/1Iv9t/pTF9JmdMNZkH1wt+AGzOhDCe4lEJXorQ0y4LZtW3Q5hL
         rUVI2jSYemq+E/XXnUWG1xQqVKsVXIEWF4GwQDigKYec1e/ICV/TDyi51LjRnhkNwdlz
         Az4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051971; x=1780656771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Clr1sjugbIK8mVuhgaPmuk7DeQ8AwBiKW3SgLxEYIc=;
        b=JpJOm85sfx1zNsNIKFGtWno87nYB8LPyerPqMt3yEnIox1+zlUsna+HjxOJy7O6WtA
         qa570Pb3nQREKd7gfVqfv+YdUB59//a0NY91Fpf3FgK0x3+J6Gfd73PEMkShqB//dCaX
         sClYHkU1aibr72kUyKA2m9lP3NrhKOiMNi767Ex2KllpSpM4ABjkCdqFfeujDpXDjG5B
         PNAKuBGUK8l4U40qM+0PicqBKlpxHHBrnd+obnP9yaG3WlV2Vtj6CAvFa5fuhzw1RXJK
         yeelOG3kMn8qTxHl3hgwQVZ9/uzyBz3POwrM8f6Zmy6GOAEbc827uvnLMED+wpfQaM4V
         BPaw==
X-Forwarded-Encrypted: i=1; AFNElJ/R/42ZyMkDJmEpQB65/EpiQuliiea7K5L9WosC3gZGejIc7vka9XgLT1ADmvm4vSSA9mKlq4Y9XQ+u@vger.kernel.org
X-Gm-Message-State: AOJu0YyNLaltG7Z/ME28ZhhEqK5nW4hCkvbfYLQGU8rGXQDEjQXtR2Zo
	nS8su7nSJWwRL4XSVmf402dOV75A9g0cWvoqNoiWFUcbJk7J5WIWtAWr
X-Gm-Gg: Acq92OEK8AcloxCTQlxN5o4to1PyuHRjBC/8PauVbB8sb5AeNBAKWjtG7PNMXiajonL
	SPhMswwYre4gAoj7QYQix1TaX4R3kSgjkoDEc7jHfvM7DoRX0Lej4LIVGT5h/1QvY/m7BMmtGV6
	lM4WDh8IDOoc2TDCWtdUdIcKVwMvDWZ8naD4ZWkw+PIqhwHNrnOGX6qhiCa0Ya5tyosfj8HVEsy
	czmU3rxuE3SCsQQK8Ib8NFuctAb5yYTcBN6w3wwuxW4H2zVoz9igp3ZOZlmDF8C+AbUsVGsqtC8
	yBAAhkL+6PS8GVE8TsYhuEc1/xCBtp+z+9JDN5sFyZzXmCOnsrNYCCQOeDVFxF5vC+vGkctOGF0
	QqP4Vluz7U2CC2fKuOoqYS7im6xO00N/VpFM7+A+Wuk3kkuFTWTIHkBVJB/TI9ZnM9GULLBcK71
	AH7VUi3e8UcjV/9+03vdT7BeeJdunod8QgHIkPnhklNEiPmISZCv9OodblTABIUeYil9yNKVXwN
	zJ8ALG7qb8c3Sx8QwqH2Bn2cndjbz+A2ao7e4NGfKFJmU4=
X-Received: by 2002:a5d:588e:0:b0:441:1cf9:4f06 with SMTP id ffacd0b85a97d-45ef144e415mr4343407f8f.31.1780051970866;
        Fri, 29 May 2026 03:52:50 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:50 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 0/4] arm64: dts: imx93-var-som-symphony: align DTS with hardware revision
Date: Fri, 29 May 2026 12:52:43 +0200
Message-ID: <cover.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX93 VAR-SOM Symphony device tree to match the
latest carrier board hardware revision.

The changes add support for onboard peripherals and complete the board
configuration with the required GPIO, pinctrl and PWM settings.

v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

Stefano Radaelli (4):
  arm64: dts: imx93-var-som-symphony: add TPM support
  arm64: dts: imx93-var-som-symphony: enable UART7
  arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx93-var-som-symphony: enable TPM3 PWM

 .../dts/freescale/imx93-var-som-symphony.dts  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

