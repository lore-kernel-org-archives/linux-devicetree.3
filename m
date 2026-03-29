Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55AB24728F
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 04:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759690; cv=none; b=jRJlkFfAiWMhRnmnmObeRiA3SynWp3zGUuhRHrO6dSc3EQtXtwAXY9cHmKOHY27DLuYcbT0V/ztTpYQF+JrO6Tn9HYctV4LTW642bgdw045oPXxhHp9nF8sRZqU10fff2Lmm8nwFR1NHx7dAmVUvu2DvmHEhK8Pxtnlc1/mKQGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759690; c=relaxed/simple;
	bh=f6G2WzAX3URkZuJNybDd0oFR9WsBJIh/VoQ78JaFB9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U8EYDF/ys41NuvK+vljWgin3hXW7jAiEZI8EUXJ8YnFhuShrSAbSE0x37BZu/NjWAqHW9oGSlmHIwlD6DxpmsL82nYCe2dqmSuG/gU/VWUe+6PhvWS09lwL6N4Qb8UU7A40lLGLBukx+sHqOAIy2ZGo/FGMj4xqcpn0UnqQWwLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHi3mCX0; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHi3mCX0"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso70469a91.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 21:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759688; x=1775364488; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xx2r6QIRxbtt4fGLDrALPMrVxytOCTyVK9i7G8L9agk=;
        b=tHi3mCX0nrFGzYvtMOl9okz0ng5gptQSpHWSjaQEgsgM0aKYqEAn8qWCdCS3K1Rahi
         kJwZ2Z4e1AZHzKM45VwCdrG6CJXrzAO9DhOopYr5xFObn/6yvwW8BPXt+kSgQ0LqD8fc
         odEb3wvVpkB79J95+m8/fUMPZnEdyaSuFHCGZY7iG1VGT+JxOh7hCAXtEwc/BgDAzl5c
         +LM6ZPnYR+H6UdoHPA04vqt8rCb9o2iHHcRlHDIu0vhmfHe57/kOmn61Y9cXKbIZAwTm
         b6SNe9by8B51LjCOm2eEhG5VeHU30cXO9xN4mK9F1bskqJbic5wAmuAAdxabH0f8eunF
         lBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759688; x=1775364488;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx2r6QIRxbtt4fGLDrALPMrVxytOCTyVK9i7G8L9agk=;
        b=bB2T3cy1G4bXPPkgMlbsvLb4c3e0rxF0KLyxyQS+QTzqJxUaGYGyWHYaysLc765lNz
         BLuGrldWCzwtDWu0TDEpppRzFbPcvTXH4xGqCFdW//FsLffgSudZ2TtHckBVGABrXUy6
         /B/V+jbJIhI5fAQ3Rssde6rTS0ynv+s85dXg7vr7njZ2ChmrQ0kng72OmZdefGawTPMi
         TWy7fx2JggNu3JhD/SQSftD8zDBL+CnYAgwkkeU8TpLnRRZPT7Y7gTudUBPifkCSBJan
         K05zv2ZTRbfmuPjhRSllnX40CDEsRdUYsSKEj2xrD6l0wZgjB791KY3hBaWB+BCFbu/A
         9Ocg==
X-Forwarded-Encrypted: i=1; AJvYcCU5eoDylCtEg/jBpRmswb+LTpogYWV+uj1jsyWREj8IcK0UoJxL+S6tKDW8rkvIRwZlbGwwbR5jkpQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YywYCLs/4Vw64m+/eubY/jBKVPfyj2BWEH7pla5NM8OXxH8jVll
	DThbDU0D34qlkXcuXJd8LUVGFyr87AnnSBwM87afLmsxSphEvIALG2b+
X-Gm-Gg: ATEYQzwysGKwrK/bdqqm7SzLgC8yNlezwti1tEaYT5kcx8l2B/8OHK2Wtr8sOY/eiUF
	EIT2Qb2o9fsjhckmFPrpN8NlvtixNAs82Q/KGeEEvJm01wgEQBjcqf7cajOUwpLabGFugydAdq+
	sCJuEov9vyvvBXaiTktOufmo4n4DTS1vX9PBEBPsbaBA13VllIdf9a+wDxjKVAz7SIyOn1mMqKP
	J9i+Lh2cyzyARvSaFoGhFUTLNpP0t+CYzTnUQ3tKNel1Wy8MxCfWtF42hbZqn7jVl6fEl1B536E
	Sb+x29VCK68PjnMVmtkdzNFltSVpmNsgOe+AzfAwtXYQXFU6redLXomMjiwTtq04HvDlAuD/YJ+
	v27fUYsMOEZNeJACxaO/8SdSERK1muluXSwXVzTR7NfoFgHs0ge/p15ToNJYRU3oJDVghsgN/F0
	VaFFh4yjE3GNfeBTC6OPreUwYAPLkK
X-Received: by 2002:a17:90b:568b:b0:35b:929f:7e8d with SMTP id 98e67ed59e1d1-35c2ffb71c6mr8601810a91.14.1774759688136;
        Sat, 28 Mar 2026 21:48:08 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:07 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Subject: [PATCH v2 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
Date: Sun, 29 Mar 2026 04:47:55 +0000
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr2Jm7RiopVFX3sOw6M9QRoWaFhoN4
 e4CHsDlS973vgkSRaYEl90EkTInDv0CYr8D2+reE7JbGEQhVHEUFXruHz6gdg7HZJAjZjYodVU
 ad24aJQ0s21ekht9b91b/OI3mTnZYY6vRchpC/GzHuVy9fx+5xAKlVFbRSVXaqavvND8PNnRQz
 /P8Bb9+ZlvMAAAA
X-Change-ID: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, kernel test robot <lkp@intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1503;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=f6G2WzAX3URkZuJNybDd0oFR9WsBJIh/VoQ78JaFB9M=;
 b=d9YzlJl/hSsImV6OyJqHuobkqxYz7w7c6plyfLZZLB1c9PyIG1VTX20nB2+mxVAKD7WGucFCZ
 CzIXOF3cnG/AN8wGovKMCREi8EE5Dx03Q93AWYMnUfz0FSU0FfnIkS3
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

This patch series add support for various components in Xiaomi Redmi
Note 8.

Most notably:
- IR transmitter
- USB-C OTG
- Vibrator

Also, fix some bindings warning as reported due to previous commits.
These are tested with linux-next tag next-20260320.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
Changes in v2:
- Move bindings fixes to first in the series and add fixes tag.
- Link to v1: https://patch.msgid.link/20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com

---
Biswapriyo Nath (7):
      arm64: dts: qcom: sm6125: Use 64 bit addressing
      dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      arm64: dts: qcom: sm6125: Enable USB-C port handling
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
 .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 168 +++++++++++----------
 4 files changed, 152 insertions(+), 77 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b

Best regards,
--  
Biswapriyo Nath <nathbappai@gmail.com>

