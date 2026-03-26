Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5037CD2A
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 14:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535855; cv=none; b=l4naKXhuMC8s5tMJzqyq7Rn6VQJ6pDRPIdQY0pkM2LoA2ZeUuxalilGQwiCd8nhrOiFF+ca9ZEekG1J4YNYceEmxucBEQVT7s6ZlIZeCRfccezVB1+4IppDp9qaBm8gjXGoTWQpT1XN9x2BtzCfKsogNWiyiDRnEc6g97/q1mjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535855; c=relaxed/simple;
	bh=donPfCs0ur2Q5LLhZqWFOOjs4/taF+94AtCN5851Hf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X0FSsvGY6iTvkLvsm3je5w80kOedg121QPqULgMwS3Q9InGDT4rlgEBd5RYf0PT5cTJ8Jhgje+NVu+CV41tBu9ZB6CfVdRJaXUaOjAf0ukRfc+tjgJQ+ada0CcDaHUJDloPOyMFpFHcARkFuTQVgLsYvOe6VgawBQ+WsiiVJfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMB4lcZb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMB4lcZb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so8513565e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535853; x=1775140653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSjYFvKsYHn3zLdzTw91PXDsC0yngduluZBblgzdeJE=;
        b=XMB4lcZblytbWAGshH2YeluBOhG+mOuqF2c3AzBM634EjUGC/fzYiigy7c7iZtK+hE
         HxtkcG2k7w8uxItRBjOZHCL7svQr8FFN6yyym0SKoiE4cA17ic4XQND5o2wTSag5Yf6p
         UILRRxIvyHRF1oI3RQC2QCZBvYV0rfSQMj9irOMNt6aEhB0swH0vuMpFR8SUOqAkPYA9
         utQgObswaTFNss71O81aK3bKgfu9PGSkfSUJaGqOfHAmSxNjEQDBgEfqTACEpZ0mfvB0
         Uz3aq/RV48cTHZNq4/Hf1iDt/Jkx4Pbm77xwBa0zofX2fpLxK/zgr9FhtrS7piL2f/HZ
         PBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535853; x=1775140653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSjYFvKsYHn3zLdzTw91PXDsC0yngduluZBblgzdeJE=;
        b=oLoDJDjL5z/Is4VmnPGKfgAfjC85EJr+gbIhbYwxJLLJPJUn6WhMO7OhpOWNaI4OqD
         BPQgdBk/BtrWKqAvyUlNwqTnPNsnm5mPChdGRqg2tVE4cpesxB6NGH4n33AOU7e5AF36
         SWQv5BJjxM4kugSTgcJwID4CcXT/qM2R3Qc+M99ByccCMxvqgivqjXYybvNqbDqsgbcP
         v3V+tshcITgMEjV0iB4CsuCkRMsENU7Jx8NjrOdNkLTNJ3kH/osrmmevHE+BVzS99LW6
         rO1obx0BRnDgzxFFTbOs2sa0oXc9vD6Z/6GuluLhC7lm9FNdiF3NwF7wvQzfwOIn0c5v
         OH0A==
X-Forwarded-Encrypted: i=1; AJvYcCUnesc+mIVlL4N937+dxkBMkD/m8eAV248f6nkNZ5mGmcfa2yO1ygfHu7eur8a1p1Q8vcmZue4qF8DG@vger.kernel.org
X-Gm-Message-State: AOJu0YzX35NIuLjtaRF6FhpcfwIVGmjmFMxEUVNxQYrveWU+LQkhyve9
	5AfAplk8JAO1Lv6xjigs3sik6QvQsl7SGOXnE2b2Ui3IjyIktzm8d+lH
X-Gm-Gg: ATEYQzxpcYpVoiS7USRM32wPTpdgfOKveUFx5uQRkBk0FEFS0734Di235Ca8tVfspz8
	mfD42K3sndVoO+m32fjxV1s8Fw0A+bEHn/E2WKBuBApGGSG3kXuannJH47UVhNwwjPiuJHoImgh
	OYLM65mOTOeApXMip7uze3nQ92zctQPzQSvjmwgU/qFNS72po2/1Hw2LGhkGm+LOrcyR3JpAXiN
	pbnNnIYClHVqpyAM+qAb1evAylKi+oz3PVKub7DufTSOBqYC+7ddFLEtLGRPSuOq+o6CygQQ4FH
	IbdPBkoXPoJ7IEvEJEZ0y7wkHWiD9E/jvXBz78I/DxgO5e1kGHVRs8joPV0vxp6nYaCSFepAmkY
	gSAZV3CocFrBCXpOYjOSlRzxCvXIBPQi0iAbLuCJZpXny6FJ9eWDgQS+qm/dVs+3mqKprwt6WIw
	2m+gnGczwuj/dkrLbI209tt0zO6ksquDshbRlV+iG0t6OAWbsQQOdRkYT4hfNqVeNWk2j3qTih8
	8Cujcq9VlHq6ptluC1431kj/cyfGCsCTl37ZF+r5ki5AOaoD0/72e11mGxyLptWGFme21GNSYqE
	RcSdAaHyGwRvtg4YDY46
X-Received: by 2002:a05:600c:c177:b0:487:2e8:69c5 with SMTP id 5b1f17b1804b1-48715fe2aa7mr115405295e9.15.1774535852495;
        Thu, 26 Mar 2026 07:37:32 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:31 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v2 0/3] arm64: dts: freescale: imx95-toradex-smarc: Add Bluetooth and SER2
Date: Thu, 26 Mar 2026 15:37:03 +0100
Message-ID: <20260326143711.143462-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Franz Schnyder <franz.schnyder@toradex.com>

This patch series adds support for missing interfaces on the Toradex 
SMARC i.MX95 SoM.

It adds:
- SER2 interface
- UART interface for Bluetooth
- WIFI_UART_EN as a gpio-hog to select the UART function by default,  
  as the MAYA-W260 UART signals are shared with the JTAG.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: Remove unused label for wifi-uart-en-hog node
    Add explanation to clarify the safe usage of the GPIO hog
---

Franz Schnyder (3):
  arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
  arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on
    lpuart5
  arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for
    WIFI_UART_EN

 .../dts/freescale/imx95-toradex-smarc-dev.dts |  5 +++
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 44 +++++++++++++++++++
 2 files changed, 49 insertions(+)

-- 
2.43.0

