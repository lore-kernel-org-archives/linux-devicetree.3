Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B061335F8AB
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234644; cv=none; b=KQI05UTERawCn9tQT4F+mCflwMouUfhVW//Psl2A+szLRSGg/+ti/Zf8d25cF4eaO6plI3pb9BJDQv19yu3KiY1mPPKblrIARehQzh6F0qySJ4EQ7vh5wxDm4xohyKShJmsuWn2N+PTemxIVzZ/lOIbxxKUDeASs//ZktDBRbQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234644; c=relaxed/simple;
	bh=3eR8Sp2MWr+9xlx1aPEOYPr177oMG8uZ9J0Usq4CAZ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PNWptm7T3qnLiVhGE6C5M4pgE3697MJbOheKJURPDshySshaLZql6MAIXOXFGl9vz9CnbAIe4cMosS0ySfLZ8oxd2Zf4O/yuUyivmjUg07wxrhADud7ef0B+GXGlMZ49AWnN/ABnGb3IXCNVAiqMW2fjYx2hMwSlw8ynPJcQEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=m0+JMTtf; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="m0+JMTtf"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so2744878a12.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234641; x=1775839441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGQd5BP9OR0vvVCUe7ltA9eB3hNUu4hhpU7DvybI+7A=;
        b=m0+JMTtfTp1IR8gb3fSTR0WYvKj3D3dmiAsg97Asz0LmXbA5FZIW5ho4D0q4WPDksy
         2gEdjKaNs5B2ldyt2I1vkLS2RoiKtHLqOysF7PiPBFyza9VypLAtw6dudn2oREmmRvde
         PUutvYjISYMgJrtSQlEnbvKQJ3RIl6VNGDU/oooQx0TGZnIL8YUxhh7G+0NiU+0XpWYR
         p0itfQcUMUkoz+i5jyCkxnj0wvdxPzoyaovj8SjcaQ4ibMEjXBaB9tiS0SReFU11Qf/x
         +D/U3cljIsN8weHCOZrdZcPW77u2aB06ZykxN/qDJhrUUcLIL5Yf7RKtqa/6R0Y017FJ
         FQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234641; x=1775839441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGQd5BP9OR0vvVCUe7ltA9eB3hNUu4hhpU7DvybI+7A=;
        b=BN+ouREty3NJIlkiuQMJLhJFCSq3RqiEIJhY8SaBx35iwPNbyy1s9wHQ/oE2A3xuS0
         qywTDfqSqhIwApfP1JuwICtW0XBLhvZ5J25tjPHoqDQeuqoiUVAUq8yp0NO+aXvell3Y
         FheK6EawdzOz0SP8YCgZrxhz9qOaXpuOSb7fDF0ky3fnjX0BphmHjOTjLG6I4t62O/dY
         RuMYjLZ4cOkhOr3+75gn7A67FEDli5mlLahBKSBL7+m7yIPlf9DJMrFZ92VOhCM63lwh
         YGcXIjnMQKDpz9/9RVQUsuTvYOczp5pDaTbbJfBedib4SAoJt9jM7aJ2EjmU5SOpLWhe
         6IdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaEMxdJ5pa6Otsa8GXgr7wYR/niOVAI2sPh68AnAgqrIJ8xOphcibOwIUQIC7Sls3mdYky7Xh2nQM3@vger.kernel.org
X-Gm-Message-State: AOJu0YzB5D6FOxbo6NJFaligy6JxUC3odErkpjkyW+R4NqM4eQqHoxBP
	YkkAbzhx9hF5CjxuQX7hCWJuYUrznoKu2DKDQyvfleWoo18iPdarIcLqO+jorIWQ+3k=
X-Gm-Gg: AeBDievd0dh5ciVld8gYnZQNNhqaYcBUUCKvfiOlrQJqS6biTvsLSjUkmW7xZFJNDSI
	dSgM7RQ7OFr/zGBkqNohdt/5rbJOO0i95Qw4207QJRAje7CBpAwLW17PCrP9jWrtszgz95ghdoT
	7YUWous3rI2WK4jHYdkqbM0g+ovfk5Y7LzQpdqwFT3YWoP34lNGJCadQEiKNg+ETLMlIuhmx7Fx
	XeD1NwY5AlshnPwOIQEKp+nqk3152DRnbY8DFFeQZkg9nmbq0Y9nfQo3GcfnMIkWzvZ99VoQje6
	fgaNe6OUlgsEDQnmaaLBaYnbkTUHKl9U/HxGhJrUgirYut4QCYGOjl7+8YizhmjWJe1lhOR8n0R
	uxCfVPmjCRtxv10sFulT12uS81dpeP1lwakjKnFykVKAydwnK3gtLT7YV2YNi9/gata03mLsgT7
	lciW0rAbNJHRYFiLVcgHueCOWPP6NQxjps7JYd8hjqkbPBkVSg3+S7ei93wgoso7zfL2XPPBFfk
	KK06j7Hy2qPcv3+JkG0aAOjlE4BBU/MtNtsEA==
X-Received: by 2002:a17:907:d40f:b0:b97:b379:b3fa with SMTP id a640c23a62f3a-b9c679f62d8mr218234966b.39.1775234640833;
        Fri, 03 Apr 2026 09:44:00 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/6] IPA v5.2 support for Milos and Fairphone (Gen. 6)
Date: Fri, 03 Apr 2026 18:43:46 +0200
Message-Id: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12OQQ6CMBBFr9LM2klKKaC9imFRcNQxFrAthIRwd
 6uwMC5f8vLfXyCQZwpgxAKeJg7cdwmyg4D2brsbIV8Sg5KqlFrm6PjZB+TBIhWVLKw9VkoXkPz
 B05Xn79a53jiMzYPa+BnYDU+vMUXipkFjA2HbO8fRiI7miHtIwe8DI/77jhzmVuZaKX3SpTVTB
 vW6vgGTj2vy0AAAAA==
X-Change-ID: 20260403-milos-ipa-e5705aa87245
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=1858;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3eR8Sp2MWr+9xlx1aPEOYPr177oMG8uZ9J0Usq4CAZ8=;
 b=v1ffqSLzzxM9XxRNgAQX/geWtyuc0La8etp5U2HBuFJW9gM8BPq17ZzLQXAA7A1TPz6gSAEX6
 Q4DoP1jLyFTARZfCzBKlCSxsRzRHYXV5P5tMzfvTNfSoDsTxA25XAWv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

First, two fixes that unbreak IPA v5.0+, which can be applied
independently.

Then add support for IPA v5.2 which can be found in the Milos SoC. And
finally enable it on Fairphone (Gen. 6) so that mobile data (4G/5G/..)
starts working.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Alexander Koskovich (2):
      net: ipa: fix GENERIC_CMD register field masks for IPA v5.0+
      net: ipa: fix event ring index not programmed for IPA v5.0+

Luca Weiss (4):
      dt-bindings: net: qcom,ipa: add Milos compatible
      net: ipa: add IPA v5.2 configuration data
      arm64: dts: qcom: milos: Add IPA node
      arm64: dts: qcom: milos-fairphone-fp6: Enable IPA

 .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   9 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |  44 ++
 drivers/net/ipa/Makefile                           |   2 +-
 drivers/net/ipa/data/ipa_data-v5.2.c               | 452 +++++++++++++++++++++
 drivers/net/ipa/gsi_reg.c                          |   1 +
 drivers/net/ipa/ipa_data.h                         |   1 +
 drivers/net/ipa/ipa_main.c                         |   4 +
 drivers/net/ipa/ipa_reg.c                          |   1 +
 drivers/net/ipa/ipa_sysfs.c                        |   2 +
 drivers/net/ipa/ipa_version.h                      |   2 +
 drivers/net/ipa/reg/gsi_reg-v5.0.c                 |   9 +-
 12 files changed, 523 insertions(+), 5 deletions(-)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260403-milos-ipa-e5705aa87245
prerequisite-change-id: 20260403-milos-imem-3a034224946a:v1
prerequisite-patch-id: 07ad87fc40adfb8dd146b9c0678d099bfe97f679
prerequisite-patch-id: 0f4436a42df3bccb92f753cecfbf24c81f4677c8

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

