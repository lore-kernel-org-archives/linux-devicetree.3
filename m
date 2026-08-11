Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9006620B80B
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452455; cv=none; b=MPqLm/TRCPMW/WKPXx6HjiwpWM8wkkq72FHBlLQNjHcfUZ00n0qTa3aUDIw5CYXiQu+0KrjjfhpJaEsHopfLGbXYGXOjItXsw2g2FrxsHxZPDLN6Q7xAb/VqEdjfPuCWcg2Ge8uE52dbwWdc/saf5YkfzB3zCu0v1zlBOA5j++Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452455; c=relaxed/simple;
	bh=RX43thL/0IQ7V1SSwppeR2vVjn6A+eVsl/g1Oq9yHxE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=EICStNgc9gFstqkrhrugDmQLuLhVLswBHVEmCjfgkSHlPUtXDelADwe0RW7/0p5udk2Vd6AcAXpNiUZ4ldLNXm9vbrXnASHg+rYCpASXsuZq4vpzOJmLQG1/L9FByTetvaBSV6PSqx7UxbHYKUsIqiWR3eeiOVvrzUXAXWDVENY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXGBDVHO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXGBDVHO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956242332dso29719305e9.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786452452; x=1787057252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=myx2pqVZcTsFSnXQZF6qDQDA6eHjTeg01tjezU04RHw=;
        b=PXGBDVHOnxxo8wzNQ4i3mueEnWyPCTA4rKeu2kiBtX/NkrnXRfCXnmq5NjsMw89Qxv
         kWBGGjH89ZBJI8ngHAWG980a+l5pF+wMTdtCbqqHxBBLU60WunGyQ4lmodeXl9ZNbZaY
         0ZfC5EGPeARQ1itC8lQ1mUrz1T3eDipb6CFjzmujDdEIu0708bhfV+sH/oTeEe6Mavpe
         jp0YTqO8JS8Yg8P7nPpFtka10N7TSlY79LURpQfyQHnY2bNbM9gkmjhCfcqh1+vTGWIu
         y5IpI8pu+Ggq5rBwWWieu1hjVsolKe2u80b5e1s7BiZziPl9uowcjYNvhZu/DG+I9FjY
         LVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786452452; x=1787057252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=myx2pqVZcTsFSnXQZF6qDQDA6eHjTeg01tjezU04RHw=;
        b=BMgtC/0pR9E7p3XljeugwPGsq6e/jcdTDnNXnAv7pW/Wr1VI9OgOpERSEA6EFXmz9O
         HsOjME1JfkreLhI0ckqbrH7LcdHfbvA3pXvOpyrDLb1TNpFH7/ZUrHU/5uQ6XEopk2Gc
         UllZrTdKPrP9qcEFi7/k7At0OtJuZ8linp5cmpRkIZmrbqIIVZ5CFdoaTrS034U0yGmx
         qwkA9iu+s7rLFTQc3G2eVEoBF9E8hSjOSxPxQsvusqRkRx3oX8X2ZiEuKu9MPjzevLNW
         7KszggePgZ0/bDb1nYeQQz3l9fV+DqYdb1NYWOELPn5ELYYxKrEAQqScUgSrMzEDVCWs
         dR4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQ5VnUneoNAo+mLwkIHC8cVVo2Z2Yl+SDpvFQTc+SN9Gc50k4JLno8kprwKrXVEF8HTv5ObY2ARRpu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy6Z0zE+AtPHeUNtdygo3SVtovGAtowBzDegskGHxtfQCE0fUW
	gd+OFpvVglWwcwcvLkN6wcUpP0SIaI4UeX+DQ+ajQJIOwMIhOvSQ1Q2Y
X-Gm-Gg: AR+sD12Kb9/ifacaRmewZGBIg82C+p+Abuj8G+xPmiuQhfHiLsaz0N4tVVkrucQ9PWo
	FwvpyDCCp/gXsMBFhAFy5C1EhZ9YwCo+VQKxnf2byBHklOnAW5d4UgBImtaSHNO9wiydidVLaMd
	xM0CLrEC+ZQtMJQxMAIx3H5bsIcn13qGkVg6v7WOs0yfHNYjHIATQB4acZf/Dcgvn5TwOpdWG8W
	aRknI7+MC0GhAmF0xXFbXUidSQyau9Z+v33Ej5z0/lWQzFIb5fPXPfJs12kjRsOH+MJQQRzbvVF
	ipebsKBFKY9DPZN6J7BPF9H6U2qr0Fk1JIFW0MMIRpLUuTM5W9dPhHulKzruIvJxqpyplIOGXX/
	DOgx3TibqmPy+SAdmG4cTXW8V9eidrmGg1SaCtt2ZtPaATRfELP4WWnZk+z9UEzrSdI2T4H93Va
	nPX8/WFiVrsOx3Oqo4DMZAg87S3PPyw4GLASoDDr8DzxK5UXd42zkeu//gkRpcfjKtWZHAT1V5H
	JpvcP4St8LbUVqIiGUHracp0N+M+spWtx7XtupdXlCZoH60rE42qFqPb6c=
X-Received: by 2002:a05:600c:5247:b0:499:5e50:5be9 with SMTP id 5b1f17b1804b1-49978e1a8b9mr43433045e9.16.1786452451661;
        Tue, 11 Aug 2026 05:47:31 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4814a7165a3sm4118207f8f.26.2026.08.11.05.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:47:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: Add support for Airoha AN7583 USB PHY
Date: Tue, 11 Aug 2026 14:47:21 +0200
Message-ID: <20260811124724.702467-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series ass support for Airoha USB PHY and Gen2 PCIe
PHY.

Changes v2:
- Add Documentation
- Out of RFC
- Rework to Serdes PHY instead of SCU (following
  for consistency AN7581 implementation)

Christian Marangi (2):
  dt-bindings: phy: Add documentation for Airoha AN7583 USB PHY
  phy: airoha: Add support for Airoha AN7583 USB PHY

 .../bindings/phy/airoha,an7583-usb-phy.yaml   |  205 +-
 drivers/phy/Kconfig                           |    1 +
 drivers/phy/Makefile                          |    3 +-
 drivers/phy/airoha/Kconfig                    |   11 +
 drivers/phy/airoha/Makefile                   |    3 +
 drivers/phy/airoha/phy-an7583-usb.c           | 2009 +++++++++++++++++
 6 files changed, 2194 insertions(+), 38 deletions(-)
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-usb.c

-- 
2.53.0

