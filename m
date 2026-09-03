Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE037105A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476369; cv=none; b=iaPKsXtT6QzCs0SV4uQeRHp8U1+bmT8QPvKB77utY2GvuQF0CC6Y/nF89tonp2wtgvksFvzJABSKJXy6JraZrdQNkq0lpjXbCEvaQeZbZFszO66MFTEUR7HWcxGOHuzZvN1cKLkqDSTJDK2x5Vg74k/2458T6UKAiAz9p5akGYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476369; c=relaxed/simple;
	bh=q0PEkNH4X+PaMAyot1IOtz3LQ1vAi3SlCfuAqTtRk8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m7bP4LlM5Mq4VzYJgZD8y0jxATp9Ultn4plrRwc2QdWtGCFIg0zKYVok+wuRRQDkMe9prQ72rhhe/zz688hLNS4FmIn94V35BDmCcvvy7oBrr95b657M2LN36HCdFbjL2C46iTxqiz/Lt+pQGq8XFFLDS2fG1Wh6E6OBuXd4tok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba14so348645f8f.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476364; x=1789081164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUDONbWsQf4g8On4R7HSZLyPEP705AHSMo8bYRBit5E=;
        b=SUTA5bExitCEtWL6nADjh0tv4nNK7Z0SRM1GSI5fokOv4ijnoy5KIaY5Wirnn0+b8H
         QvxPfkKs0xKrTjT7d7Hm1G4BMP11rphia/yP50cW+G4jwUxakjKXxIN//RaKCpCV/hgv
         t6tfA5jA0ClsFTC0z8l/nmtcvKc1OCmAQz82VTPkC3bBAz3CLLaDS3sf/l8+lZERDKLY
         h4TI2frtzwRs0yK8Kb5hFBKXLnQC7vYG3ejDO1gjMyGP4+XcF+6FtQh8ame4RIpPqGFx
         j/Pu2rmrluv6frwI1GH72Sv0M7yeFWiyTRdTtedwv6Nqm6VehMt+m/ZOrQn7sIgLPfMz
         iGbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsM7V9nKt0HPxdRf+QjzbH5IE7dRhmxwge2btonx3eqxxjK7DpWkdMPgqBitKHKJNthONM0lsw8qRh@vger.kernel.org
X-Gm-Message-State: AFuF++lycW8PzMu+wet7aPNsLI69on45QpdMI41svh97XUJiuriAYdLD
	Cp/46Myo4Lik/ZSvby8F09WrvaYoWku7whhqIVN7Gyyk7JYqxqMwxmuz
X-Gm-Gg: AYBFou2Fcose9IQkRUILoVAZBhtmBmNTRjThQMk/q3090+bYnslwj+OIpc9HQhBp7CH
	8tDcm0kiSg55hIKFvi1hp6LKzDt4XgZ38Rf5Mw4VvBzrU8GANm0AMhc/P1RxPHrgsytkEXoexzu
	TMDI1Rsza2UNlPi4hc1+3WoEOxWo+ttZBqlJeGNcxTOrD+WwLpK+sokDgNGWn39Br+478s5pF2E
	XtYPzI5rXe2WUFo1KfLE/D0BAPN2fRzw0Bpxj8EUIWh7Gli0MUWSpwFE5xnZPkl6xmcG6nf92DQ
	yIBnyor3eut1n3XBj01i2MjdBt23AyiD2CDPoI69L0gtOr7UPcNpk/8EM+CubJhRCSJzEvgTB8w
	5Fy60ekomXdl5El+dmU4HWVvZQ5UpX2Yp7UtOWGTka9rZlSL0Gt9/2Z1uAVLa2A0V6B4i85Pfo4
	tRj2pvREXbKcHASpVJ2yDv7JvHZbk3eXutY+UsKtInJbMeg831xrIip4YhZFgSYlPEXFdj9nshq
	3gDxBDwtXddd6Y3JyDRxMo8qg==
X-Received: by 2002:a5d:5f50:0:b0:485:8a46:7059 with SMTP id ffacd0b85a97d-4858a4672acmr372086f8f.43.1788476364181;
        Thu, 03 Sep 2026 15:59:24 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:23 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
Date: Thu,  3 Sep 2026 23:59:17 +0100
Message-ID: <20260903225921.2290441-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous series [2] for the intermittent boot hangs on the VIM4
marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
explained [1], sys_ampipe_nand clocks a pipeline stage that the
hardware design inserts in the bus path between the SD/eMMC
controllers and the NIC_MATRIX fabric to help timing closure.

So the clock has real consumers: reference it from the three MMC
controller nodes and drop CLK_IS_CRITICAL instead.

The series crosses three trees; patch 4 (clk) must only land after
patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.

[1] https://lore.kernel.org/linux-amlogic/ (RFC: clk: meson: t7:
    Intermittent boot instability and memory corruption on VIM4)
[2] https://lore.kernel.org/linux-amlogic/ (arm64: amlogic: t7:
    describe the VIM4 supplies and keep the fabric clocks running)

Thanks,
Lucas

Lucas Tanure (4):
  dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
  mmc: meson-gx: enable the bus pipeline clock on T7
  arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
  clk: meson: t7: don't mark sys_ampipe_nand as critical

 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
 drivers/clk/meson/t7-peripherals.c            | 10 +++----
 drivers/mmc/host/meson-gx-mmc.c               | 21 ++++++++++++++
 4 files changed, 63 insertions(+), 12 deletions(-)

-- 
2.55.0

