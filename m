Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AE212D1F1
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996883; cv=none; b=ZR/X1B8ZQ4wVufWQVCwB2CFQ0lbKYCxOhjUFtEtv0mJSHyiZyCuPjzPJWiLM4NJpjwKb+nxFR+TGeJB28tvHMoRW/o8bgIS0NMGRszlWxeNaVJKBiwoh/OqADEp/imy34YqGba6kYy1fAa7y3XOBT2TnKFIgpAOOFAIqcgZhHGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996883; c=relaxed/simple;
	bh=ZMTFeO2F9mCgdGlf939/k55/Zui5sS++GTzhcQ6cXkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T8QT59H+K7hOvFqrbfMSsHauI+6aHNKqh7+C6omERwI5PqYfLDsjtrokVGe5X7Lq62ZHqnznWpzUH8XEXGO4XmIBwERxzFQmkjh4zivViKdMChbg1nCj6eKMMSIPsw7/+mshtQRduSpjvfYxoK2i2MjsgLX9aEn+gLRaBSHw1FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so13841415e9.2
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 02:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996880; x=1788601680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rJ0DhyCHllIMH7L1DGiwV3mp7tCq7ghlGuKeBd4/eQ=;
        b=MVPk+RG9pPQNOPYyIioE/rtRAHlYPj2/6XRZxHxDomBwBRMWfAapjmXlc5z872m8Jm
         BJxhGAJnCTZ8p966sw/PIhpVQB69bX8M3z3G/aRgK0J//hdDrh3un3zR8GK9BhQbgr/K
         EEZptWjdtZ32h5ezMxQyH0f9Amq3ljtaglZEWzFVfj2/g/RZz1aNIxx4znWcuqrrJp8K
         bKo2wFsVq5T74IT2Wvq3y5syIRSHpfQwpm2TgfYQsXs0/XOPgHcITscEVzeM17RuRd3B
         1moOh5mBIP5CtbjJHs0OnyJ+ZeLy6/S2EzB8EJdZE9sMefSraDMoOjoukPGSedYs0wQX
         VBOA==
X-Forwarded-Encrypted: i=1; AHgh+Rrv5yWcwvudhF3SmTMhRhi2x2KqieOIE0nXC1S1P8/y95hWg4WJERkeWDEyG5gpaQ25dWnZmX690e5K@vger.kernel.org
X-Gm-Message-State: AFuF++ktYr+BYSbLw5zxJ+5pnF8ogaE2d4YtXoYuamgIrT7EDHFF9gYv
	eV7aOF1hB1uIpoU48I3OriAxyNbVqII1NS7Qnv/mEWmNMthDQlJdEbyq
X-Gm-Gg: AR+sD13JcRt9y+K32wFPgi1vI19FxmNlEuiY5+7s9Sb3ya1K9rPfriHxRPwetFgaVMf
	vm7pQng4mawPNfb7vOUmBVOD1G+pgYu5O+8UVvxRhCQIV7WWwsI3/FbVLmHGl3IAqJGXwyalsN7
	5ckVnwiixYy4IyYvvzfOMQ3hVWpP6OhgClmQmzPpbZ8o8FogjFVtGeYDKFWlquy6M1b7r50m+Bk
	WX28ykVcACxKca7Krhcr6M1uPbEsoY79tkw94b1L7BBxJKrED/JtBGx2oTxSIa1YqBOLrUC7m63
	dtTipwzEAO7muO6Yhr7UCh2/Znh2pOBQwqjFTS5eF5U+31DjEXzUAAy8IynZOWgR371W3bOUFeG
	wF2uyDJg2WkV1XHSZs+6NgNftyP0OVQUOtw4jytAE3PqLAcHCEU4qXdUGv0Wp07YpuePzflF/sf
	Q2xkpg/ql3PENBfRqs8pOb8pNafloOqZpF/Rpa1JsEyZEZX+WXWOaLQDYEfafq7Ec94e0413ZEs
	0vhLG4lfs51PaS+gmuhokEN+BNqLWa4Rr1cLQ==
X-Received: by 2002:a05:600c:1d1d:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49b91c3ddbcmr152418085e9.10.1787996879686;
        Sat, 29 Aug 2026 02:47:59 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:47:59 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/4] arm64: amlogic: t7: describe the VIM4 supplies and keep the fabric clocks running
Date: Sat, 29 Aug 2026 10:47:54 +0100
Message-ID: <20260829094758.23248-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without it
the board hangs at random, loses storage and corrupts memory, and the
failures move around from boot to boot.

Six of the SoC's PWM outputs drive the board's voltage regulators: the
always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. None
of them were described, so Linux saw the outputs as unused and switched
them off about a second into boot. The regulators then drifted away from
the levels the bootloader had set, which is where the corruption and the
random hangs came from. 
Thanks to Chuan Liu from Amlogic for helping me indetify which clocks are
critical.

Separately, four clocks feed the bus that carries data between the
peripherals and memory. Nothing claims those either, and switching them
off leaves any device that starts a transfer afterwards stuck. The SD
card comes up about two seconds into boot, so it was the visible victim.

Two of the patches are pin group fixes. The description named groups that
do not exist in the pinctrl driver, so anything referencing them refused
to probe. That is what the supplies patch needs in order to work, and it
had a second effect worth mentioning: the failing probe left one device
unbound, which kept the clock controller's sync_state() deferred forever
and quietly stopped every peripheral clock from ever being switched off.
The board looked healthy for entirely the wrong reason.

Tested on a VIM4 booting from SD with no clk_ignore_unused: 74 clocks are
still switched off, but the card enumerates and the root filesystem mounts
and memtest runs clean over 512 MiB.

Thread about these issues in Vim4:

https://lore.kernel.org/linux-clk/3930906f-783b-4d72-9260-ba25cc8081cb@linux.com/

Lucas Tanure (4):
  clk: meson: t7: keep the memory fabric clocks running
  arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
  arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
  arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM

 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 110 +++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  44 ++++++-
 drivers/clk/meson/t7-peripherals.c            |  13 ++-
 3 files changed, 156 insertions(+), 11 deletions(-)

-- 
2.55.0

