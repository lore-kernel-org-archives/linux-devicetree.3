Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61973DBD49
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786871269; cv=none; b=IPxvFy4KGGZseqqG0R4M1FJIxRPnVGfbM+epJZq8eOjr8CLYPmPu7IUXBR/KsT+glSGmRiWgRsPHW2OZh4SPM7dRbtuXNuGVqYz9hqpjkPHsIGKf66p0aIIH/7U89ZxGLlawqVzIY1Nn6wGHSqhcbFBabb8pYKpZmtaAjDjIg7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786871269; c=relaxed/simple;
	bh=vVVV/m13IjNChM/ZjwQGj3Jq/cViqlU0kkgLRzO556M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tN3SisONm/2/SO+Sc1u2xaQaRwA4hCxQZidgL6GaW3tKEvS1kkYeDo7nz+1f36REJW1PiSFgSSpD5Hhx05VycGgpRwZfJsEqR9b6vAzxUWzM58/o4uSaaEbIJ1mXt+wDQi7XZndexn7TkyXcIgwgorGsZIjDpQ1sGwesGfCzUA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RG+f63Ay; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RG+f63Ay"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceab75934dso29772695ad.2
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786871266; x=1787476066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=RG+f63AyzJ+ZwPAZrwdZSRvW9pQ4+IFzBmTyJgeQDuT5lZpQzuu8KU0Z5hRtQ7i0NS
         avO5P5LUb4jDhAGcBndWeYi8aUa/Ur0htMQv1rS89zTFPBiZ88pDwbxX6yBglL2IsbI7
         sBxlIRoseqgtdssEwfI75gk1VgLrIjTm95fgv7PYI5YJgdjbKjM1c11Twvjl3d55QYO/
         EV67xvuyJN7hEC79gD2PHUFw//KfF+uin1e45Z1sknuOEoP6/CMsHfUqkENXBuJRzxeG
         umaOox6m0xroBOLkmVogZnTPyxQbl323CAOX/AVUoEmIjvOp7HkUNPIc7iC+i89kMs1y
         QgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786871266; x=1787476066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=IIAy5OJikeXmjS69fb4LvWgoxZ8g5joYqo4z9oE3w3mZ3hScdnjYmcKC/uQZ1X7U5y
         6bqpSJ3v815C6oclMGcGJ7OdoWz6CkEQ9LK+/2aiSgF1nhDgNAJ+4xqgyNF+tqvWPvej
         rsXGQbdKsL7IyjbfYgq+hU9nwSEQU3HTSkRvaFO0XQW7sgCdrUm71DglfTOPIdU/vBDr
         J0d3IZG8k2NACaNHclw8mtNFhaoNwoKIvNrtcPIeIXdhpNTTDRtx4uqTK1dZhbX6W5i6
         dWeqov4Gdagm7HMrTni0KVe/1q9pyVFAFe+o5GAL3yhmhL12vCuXtezx4RKGtzcwL8v1
         wthw==
X-Forwarded-Encrypted: i=1; AHgh+RpF4Qka7TQULATEPiltqW7Xx6KfY3dzXIIxscMjuQaf71r7KIYx0IngqawPMbR4xaY3aF6zN/fl0U8n@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp5QMJcsH9f5NSec765kMPMydX3Epg/u5IsJkPEh1pDOTdYkoY
	U/4Lmg9axizl4oekfjYtedKvPwubATO0lHXK3TZOzabfHNYvCz/WYgku
X-Gm-Gg: AR+sD10lW9m4ZnM7nS2mSCPAgvOYNgmTXWh5iiYDyzIKoR9FrqnodEa+tukCs/ujL8D
	2ggdaCvPKxm5qPwSEX0CG561gKjYkEZv04CVZ8cXTtH9xer/gbXWP9w1+MZ1Vs1b4lCFfVuhTLo
	tN+6bp7AMnTMZFZnAiOuD0LVS6JsxBlLyik8naSciC/+zLgy4vXWcMg4LAGNqw8WpyRi8EkmbsW
	f50kwY1b/11B7bTVGYjstf4h00bryhMCBRdVg7083wfcHU4vWvJhuC+Pvv0tPUAssW8dOA+s4Gy
	7Ptf4rDo2mK7yjmaNijGT6E2DITj4hZvWUCeYnsrFxqTf0hqPNb/BFgTg84UTa9aSMZ91Zm2xSO
	tjERPIxrTygbmylshYMLawrw78UIIZYzWs+A7OvJl3HH9vrx3TL+/Ltz1iAwB+DN7DsiKoQqAcE
	rXX65/KyA05awg+9ZPv2iKwGBMtxjZ9UcX1crIDHkyFpv5ny3rp8HSwDnNNDD/WmO/eSgplK80j
	NNjHNd//Bt8P01Ch468GxNH
X-Received: by 2002:a05:6a21:3204:b0:3c3:9a7f:7309 with SMTP id adf61e73a8af0-3cc71f19334mr19822766637.26.1786871265824;
        Sun, 16 Aug 2026 02:07:45 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3218d3f398dsm26085321eec.22.2026.08.16.02.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 02:07:45 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: v2 [PATCH 0/2] Add Global Clock Controller (GCC) driver for SM7250
Date: Sun, 16 Aug 2026 09:07:17 +0000
Message-ID: <20260816090719.892-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the global clock controller found
on SM7250 based devices. This should allow most non-multimedia
device drivers to probe and control their clocks.

Sreeshankar K (2):
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: Add GCC clock bindings for SM7250

 .../bindings/clock/qcom,gcc-sm7250.yaml       |   60 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2347 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm7250.h   |  163 ++
 5 files changed, 2580 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm7250.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm7250.h

-- 
2.43.0

