Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3433CBE6E
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987578; cv=none; b=aTQIqSZdEyZgg7Wak54Km764k5GShOIJufHMUGd7zWXqaLYLdSpUY9Z4yIVU97gp+sS5yd6BftHFG+KsonOY4EEeYCBBzH9FZtpP4br6bjZtkr95TYMC3itBUl27KoOu8s9v64EF0d0Ub8QmGDVd9KSPQNZAuD7matxC6Rf5Srg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987578; c=relaxed/simple;
	bh=+jfuPOfrvlJyorqipEtBDPEwBEOBADumN3Z9GVWqrm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jh8q55IZbGGIhmRSBNfSgjwhjXDSvqll94N3AAvlpRwV63KjaX9P/CDla45K0PYW7qYBC1wki3w49X0AweDhItaF4dItgIf/uAnME6SJOOrDCJ0wcYyc38fi7WfRRpj4bAfK1C/fr96F9N5FScKNgNG3yLXBUwTIw0mR7z8gy7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKuG/IaR; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKuG/IaR"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cfbfdabf3fso609711585a.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774987575; x=1775592375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d2SuGEcofMViAjcduIJKVxzZDL5jSsKT9V5K04cwa+Y=;
        b=kKuG/IaRBma49+MjTcXk9IOK+chvpyiQifYx4idlqsHmSyEKVcR/kz6KaplklqrIXE
         Z3cExyZnm/xBApdxmo1Zaqgcv8j3XP2b1C1q/o+Fkb/6dsw+thjsNlAR9wNfNZcN1Tw9
         7DGde3MH2XR0pCvX7a+QEt7uj6GgN2MCVntCzFZRDlDchS4tvqFtU4kF+ALU6I30Lc9z
         XPgDCze2IYxQttjJj4u3CMt3FbJ+CEydxJcpw1xQDtTwiW9+kACw5OPCi2DoQSCl/Wwo
         J502nRgmX1rx6N+qQD97hPfbaO6u2IZmC3XEZ8ifEiHaVXqiorEBXRjrhcVBqnLx4co8
         IaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987575; x=1775592375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2SuGEcofMViAjcduIJKVxzZDL5jSsKT9V5K04cwa+Y=;
        b=pQ52GbTMi5OhKRTpu1SqUahLsMu6Srq5hVEHBqBVwfbINEh0+sMhfWub83pfsGtbAR
         XRDtMGRGlYeaRS8Fi2lXGQSRTmWQlatKIBrIeIhMBskAg8cB5ZjukF+n3g3ZEfygmWHF
         sKmEuJxJjUsc4z0xiXBsnU0UwDx1468CFK0txiGGbp7HC+o3IcvrmyQyQa8RA7UHDBiy
         k75u0Dj9o6/MZ7bGSvI3q5L95d+SyNLl8UmiNPgNnX4x8aFkTlde91cQ5XVW43KHOwAG
         B7VeszKCONpSoIVNmKLB3W8vNogTEFYPDOr+qTKSA+dQ5zIGnhhz2M1Xho7xCun3WDLD
         sGEA==
X-Forwarded-Encrypted: i=1; AJvYcCUo/GEnsFB9CCa+FuugDfTlns19fFUFbPFx894WW87reFGATF97YuQ2r5L+WeMiZ4QaB96V7utqWPUU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+JE31XJkKUgC9XgpmxXYfslsMnRZiI1vrfpIFeNAI4dSAcRuT
	uBYFoCt6q33z1OPS/jtGc6tkmudZTCwH4WvLjleaOQwOMfr3nKR/N+Fe
X-Gm-Gg: ATEYQzyHsSJmj9kEbO5aWAx55a4K8XW5btzfW+zOMRq7EG4EQPe6w245u3e7U/dqgtn
	KpWk+V9LDdJyd2UW2305H8K1sT3076RCa98nmoxKetPr0mRPeSuqDMMuyg/VTFdqeN1P49Me0XT
	ziURO6Zzx+/4/ocf8GfrJ4B1RJ5+55VBJtqLJ5dzSfS2LpK/PsoOdnJtmAgFDSLRIQa1c0PehyC
	YF3TyyE4+9A61CJMGoP05zdipzPjURdOUD6/GOp0X07pN7CRCjdBxyi/ARdf8mUKuOPqldREgU6
	OZPD/LDlodww7ceV49zQ6zcQf4Q/80sZmbdSnnxVthY4N1bV8kOYdOex1brQ7XokVuxmc2kbjxW
	UFDh6Cv8Y/F9fCqEaVQZF3kXrbm3Z+2FZBhLP4qjtdd2C+cQk/dESUx+E+B0TmqDDGYxGwmBnyi
	FHNlqno2sz4TxChgnlUUSQkwXV
X-Received: by 2002:a05:620a:444e:b0:8cf:cf45:140d with SMTP id af79cd13be357-8d1b5b25471mr159346085a.29.1774987575026;
        Tue, 31 Mar 2026 13:06:15 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edc650sm913382585a.6.2026.03.31.13.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:06:14 -0700 (PDT)
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
Subject: [PATCH v5 0/4] SDM670 LPASS LPI pin controller support
Date: Tue, 31 Mar 2026 16:06:54 -0400
Message-ID: <20260331200658.1306-1-mailingradian@gmail.com>
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

Changes since v4 (https://lore.kernel.org/r/20260330164707.87441-1-mailingradian@gmail.com):
- squash reserved gpios patch (Dmitry's review tag dropped) (4/4, previously 5/5)
- add review tags (3/4, 4/4)
- correct changelog (0/4)

Changes since v3 (https://lore.kernel.org/r/20260328021036.85945-1-mailingradian@gmail.com):
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

Richard Acayan (4):
  dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
  dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
  pinctrl: qcom: add sdm670 lpi tlmm
  arm64: dts: qcom: sdm670: add lpi pinctrl

 .../pinctrl/qcom,lpass-lpi-common.yaml        |   8 +
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        |  81 +++++++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   |   5 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  73 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 ++
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
 7 files changed, 344 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

-- 
2.53.0

