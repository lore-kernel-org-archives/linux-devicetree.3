Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1253DBD47
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889187; cv=none; b=tmnnMxu/Yrzh4hvt4gcwnTAxP2dbKEwKGvcGIRs2IB5QTtCT9ga00w+pH+Kfdb6rnuewMEJ8Ul2eG6WRgy4XSrotWh6foGkjRqwxJxXucd63+jCtmYjzzxzs+ue3h9kR077tB+7RMZQyjF6TVr1EK3SXwuTPO52cEpz/YZAuPE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889187; c=relaxed/simple;
	bh=YJin1wPk6QwSKNDkDugbrSYwGRDBzaEpXCdg+uaVnik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ApUbxK6hlZoYiP8Sm3aG4YYyiK2W9Pa+3ZAvlxAF3QjE+dcOY88Nqcir21xVCR8JmQF5BoIlodkqIkqqfbC0QmCnz4WM4xQPAcp/RrDafM9M8Urvl8YPMEP0oYC+cSfNd3jGEcL56qNpHpTNd3TLT8FqQxVoRrgX7x2AqtOa3qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1M6Yzng; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1M6Yzng"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8d00cf835b7so603453585a.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889184; x=1775493984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9N0rhaxdcZ47rPdqHKXeK0NE0HClZsrO2nPTgCYshE=;
        b=Q1M6Yzngkxn4QBqtmEAaxt6qZck+3/1f/0bchHS3raDZc17O0Wnzl9yuCf7acWtdQ5
         wJdOjrYHEmd+9JQ16fETdX0XRd0TamBehfsLzSIMVAD2gpoZ8pLsFo3RdmeZLKvEkYVN
         l8Dj0Ej8yuubFacsgMuRqiEOElXJUzzUrEO12tNJ3oyNWXEzfAJV1GvP602j/WDnFpHH
         rmiI+6jz0+9gFikJX8Nm4dYRWQc3K7mw04cX9JrjZKN+mQEND1fTxyYlvHAtpAJgY+Cv
         rbosPA+0XB+1UjvWSWlq63wh3PXnCV4gIQUFjRM6qiv2vncef4a+F+xFrGnxQTQJWN6G
         Akxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889184; x=1775493984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9N0rhaxdcZ47rPdqHKXeK0NE0HClZsrO2nPTgCYshE=;
        b=CmQSkISfqRpGBUobGhWj2s+7SzhfCVlvMF66Zrt2AlH56Qq6+8wcD6s1OQ8pvUR2wZ
         MIJx5xzBc/xTIvNoqgin4j+kCJsrCqsfXLRO9vZM7Aug3EhKSN95VpW6zFSN2UTuXxku
         +M+pVLMPC2A3R3thqTdn5cNoCccY2WCxn52Jh8UhyyuxtontnqNs7tT9BbrcGAOikcxX
         B+UKIlLCDb74nApg6qnjNZFPbnX/gNt301YYZZFAoCAdCZqtUY632+fMcln5qw44lo6G
         5VH6Bixwt75em4KF8jJL4hjvA5xAktk7FZf0ODeRKBp4yOaykYVoWFZDpBdwe6BJhD9n
         c82Q==
X-Forwarded-Encrypted: i=1; AJvYcCWT2ScC5FPOc9q3Vc2XsApQExYQQYf6V1zS6Mu+juU+ysfja6pRq8mCN3yOkRF6FKw4+0LyADUWfCEn@vger.kernel.org
X-Gm-Message-State: AOJu0YzDgNzwHqeIvP/mULGrSYYenaKVCH18Cm7NoTrYO75I8LA3+Neg
	SDMnQTWlvz6gyH5uFglSG0mp522gJjU0O9GkeR4T1/1ExlQeUVXni3wR
X-Gm-Gg: ATEYQzzW/BA7WrtzT5sgRECGx8+NyzwTckibOwa/uJNu5xewqi6GyKL6lhGhh97EIZq
	WXWpGRcVNFgdlwN8Don6KoRhm3l+iRYojV1uuCUTvAEnCmGOtddShcSsYGgXFL86yaUKXKCHBNE
	XqEiNH9f5p97ag3b/JMog/Pzc7IHsHvy/Kltdd9VKHBCbYgknrs9BCXtc+wChyvF+kBP/eqRglX
	6rQol9SGV1FSLUNCnBzt11XS5HHHr9SSyNqMPixuGedxiER4+iZ5iYN53pLWnhQjnibMKtIdwd1
	wVQLjGy/P8Y+mnHOwJ686X7h4RuhCnwrZkLvz9GLFzo+cRAnrf0xVyc6g24stWsb52kTLFmKnSw
	iibjOHnPFLAEKMJaa+XX/BiF1W9poAS0gHca/JEO3i6M9P1MSGM1az6FWkHUuZOnp+d3G3W435v
	FD4ieuJmtgxD7NH7o/Ewvd7io=
X-Received: by 2002:a05:620a:1710:b0:8cd:972d:335 with SMTP id af79cd13be357-8d01c7969dcmr1595894185a.43.1774889184606;
        Mon, 30 Mar 2026 09:46:24 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028086d25sm638355285a.43.2026.03.30.09.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:23 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/5] SDM670 LPASS LPI pin controller support
Date: Mon, 30 Mar 2026 12:47:02 -0400
Message-ID: <20260330164707.87441-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the LPASS LPI pin controller on SDM670, which
controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
not sent yet.

Dependencies:
- SDM670 Basic SoC thermal zones (devicetree nodes are touching)
  https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
- Support for the Pixel 3a XL with the Tianma panel (for reserved GPIOs)
  https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com

Changes since v2 (https://lore.kernel.org/r/20260328021036.85945-1-mailingradian@gmail.com):
- restore review tags (2-5/5)
- add review tags (1/5)

Changes since v2 (https://lore.kernel.org/r/20260310012446.32226-1-mailingradian@gmail.com):
- add minItems and maxItems (1/5)
- add review tags (2-5/5)

Changes since v1 (https://lore.kernel.org/r/20260210021109.11906-1-mailingradian@gmail.com):
- add LPASS in dt-bindings patch subject (2/5)
- change pin names (2/5, 3/5, 4/5)
- add reviewed-by from Krzysztof (2/5)
- specify gpio-reserved-ranges (1/5, 5/5)

Richard Acayan (5):
  dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
  dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
  pinctrl: qcom: add sdm670 lpi tlmm
  arm64: dts: qcom: sdm670: add lpi pinctrl
  arm64: dts: qcom: sdm670-google: add reserved lpi gpios

 .../pinctrl/qcom,lpass-lpi-common.yaml        |   8 +
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        |  81 +++++++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   |   4 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  73 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 ++
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
 7 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

-- 
2.53.0

