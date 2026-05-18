Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD96C31B80D
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 17:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125451; cv=none; b=BNNKtUYuPqGAZ1tm3JrwTDdrXMxN/cEww6Nu5IWOyQ/yp7LgAHRsY/KdsYXDQ/YXe/yQfX9aaDMyTFXZXUx6uZ64eMWsOz76QI14StgaRZucZCuoo7TDiGdfItJjrwPxRXY/pQcwYOlBDmCk35hcvVlmbbEPRNQTuVVJccJWdXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125451; c=relaxed/simple;
	bh=xxm5uRHiBjFOoidP1IRVOoUHiKnUXvtH8p3F1Td9iKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEKYGFgWg3r95RqEZl5AtHmcqmhyNEuZSKt6/3l0QxZODcLWO64PfVDdBDZfazLlANyhA3E22KihlICIHNKjBS175PDYU/T0iiV2zaYfAtsbFu0nTg11+UNH2gs8koAAYALHvVEwQ4YKmcL4orPu9faW3mpVZrzy7IMVy/AHZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2YNnay5; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2YNnay5"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c801b30188dso1185056a12.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779125450; x=1779730250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY2Amf5TmkwuaOKL8bqWWAMF2lfr2aUkj6b4cqTGIP4=;
        b=W2YNnay5FMp3/jscE+x+wYdtw5GrOpaARjNKeTm1gOHUvfZ+C2+hYjKPOk2NFEnGl+
         HuiLMfXk2cirg54XTGMUjJpGBgafnHNioItY2afLIdqFWCBOHsggb4drsufsPJPse8T1
         zrk9K5QI9Thrs5nAopgcB7wc1WYGIG+rcYjHUnxXt10sS/N3/PV/hdIAt1ntQr4heBXb
         e/t6S7rJKWu5xt1xaXqqOWxOiqs2nqLs2fTdFuqgNY59y0Y+UDYTomvRUaDKK/ub2C7T
         q80zQNuQdAmIqaFe3ZArWMqR18BwhcPh7rBetO+JFaOm3KtxNa9utlQyncrkvYbuILzH
         d4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779125450; x=1779730250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kY2Amf5TmkwuaOKL8bqWWAMF2lfr2aUkj6b4cqTGIP4=;
        b=eaL/H6pagR3MbI04d/7tjDfvXHG8kEEABz69eRb3gTpia6nxkfxXWr7qD6IV8bQ9hi
         af9atO4Pjz1PiB4BoklZY4GjrhJ4Ci57nud3EIBI4GhvX+BuaR5S1d23DfqZuiVtGbXm
         d5W+bpTN1qmZTkNrqQz0LxUEeN6ggILtyvdEhsTh59RDcgQJLTY0U6X1Kjpu0tB9tK+J
         eX1Nm7++4k9JmjhASSgAH/Oe94Xk0zO6qxW436BRmbny3lkA7GV197NxGocu5gcAm/AK
         jb+g3EDoA8bPiXVa/E69k1C8C7N8F8/bwNs2sq9OAAunqeDlC/0DKTHu+jDbNVsO9JYI
         B6Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8c9NXLqxWRm1cg6e0Q5becWR77C23aumKwR1NZUJlfab5TswGeb9OQA7lQ6oX6npsDnL8uf1LezuQ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4RVzrO/LJz+/32c4nE2B35RWWLSPwfF/5MhuCBXemn4wenXCH
	CIuZLiHp/3Z4C4YcEJszM/tdW/3rGMfXjWdGsX9AvmgIiS4DQHsqW6j+
X-Gm-Gg: Acq92OEld6vny2rIdQGo+rsjMeWQcRy6RE3LcypOOchR/utU+9efsFcPcCJSTMQNNyM
	Tl/8iE8A1Wc1wndLQPCA66tT4J1zZg7eo8WeZNOhYC1yrBdcLdNLYtQVYap+7TXdX7RDJ1FmJYf
	5TRZOBbqhMUoDcjnji4E+1LxZIP7n2kBypcHiCWJyIRJDI6jpLcUwagaCCyApr828rrBXq0rjnV
	/aslp62zqTOqLuYcpqNwNkkb+LCWvAHusHv+a4l0OzjECK9Ma8szj9/mFv1eUiTdgXHLwHvTM/K
	vEAJyli6eEc9HPyXB0pRY7dutIF8MUGFZlBKD0shnuNXHLD1DS2xdO+EhTV7w8Dm3nv5BPJSUD8
	FpxjcBwLP3gwQpQ6Ob3hikixd/VxvLnT03v7/Wzp/xeD16r9sBeKtgfMcs5/z3J4vJf8zzCaUL3
	odmOv4JX8XNFe3onEACHQd0gZqfWzsVGJRZj0qN/60qcQxv/fLgieK14/OXcGr
X-Received: by 2002:a05:6a21:e097:b0:39b:ba95:b128 with SMTP id adf61e73a8af0-3b22ecf5a75mr17218091637.50.1779125449986;
        Mon, 18 May 2026 10:30:49 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b5:f305:5cbe:64f9:8c32:7cd8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb116860sm14118696a12.25.2026.05.18.10.30.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 10:30:49 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Mon, 18 May 2026 23:00:36 +0530
Message-ID: <20260518173039.20592-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518110435.16262-1-blfizzyy@gmail.com>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Vicharak Axon Mini, a QCS6490-based
single-board computer.

This series adds the Vicharak vendor prefix, documents the board
compatible, and adds the initial board DTS.

Tested:
- debug UART
- eMMC
- UFS
- SDIO WLAN
- USB 2.0 host
- PCIe

Changes in v2:
- Drop unused Type-C VBUS regulator.
- Drop invalid camera thermal zone.
- Drop incorrect PM8350C thermal alarm override.
- Fix PCIe1 3.3 V regulator name.
- Drop redundant EUD disable override.
- Keep ICE disabled due to fatal SError during qcom_ice_create().
- Fix pinctrl property ordering.
- Sort top-level label references.
- Add blank lines before status properties.

Ajit Singh (3):
  dt-bindings: vendor-prefixes: Add prefix for Vicharak
  dt-bindings: arm: qcom: Add Vicharak Axon Mini
  arm64: dts: qcom: Add Vicharak Axon Mini

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1055 +++++++++++++++++
 4 files changed, 1059 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

-- 
2.50.1 (Apple Git-155)

