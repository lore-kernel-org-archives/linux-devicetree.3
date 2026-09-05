Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F01A9F96
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622359; cv=none; b=fcnMFopLFCzfNGo/74e2gJo5Ec1s1e5spCJe/g8cOQYl+cjG683I85660u9H/aMxrlxzN5mJRYSdyHhWvH0bvbD4usmD7BMvRYYyVMFB5/BCtOr33AgxaM0cDN8DWoVWS3s8hq+y1roRPyRVA2bYdqHnCP93RLea/TL4QMbzRwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622359; c=relaxed/simple;
	bh=8J1UiXJhzVvrBOSm0Tr/M27LUtZiz4TFzi/G029Oths=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JWiu4ZqyS9s0eBPu9YB0AzTp09M4aCJrFPJLd2NrVGpu82xyUN2okhm65S9tasm0UypiR5E7pe02ajcI51vopTK0ImvjyFTOAe3CMsvuj0vmtqBf+P7wnOvdhIpZ7hdOpfGY7jwhCKxqflrlouzsrEuFM9y+A9w+tgLYpyNAqnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-485888b3c3dso2102883f8f.2
        for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 08:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622356; x=1789227156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSU4aZpbll1PpORySxMO+b6aF9erqEZX1yTwxUGQHwY=;
        b=Qoh5sciIjS1UL99c2YTXMIKgN9IXSTR5li+ptghubtd69dP56U6pEE4tPuHVjOQ6hu
         ompBJynptEqVFqGOE3hhEkxajyWn3UkEycYRchwngqMDYU53rmc5HzNFM75dLL7kNkLB
         iL/7dthn67aFs7bcHcwZk+k15OciXFk2CUQCIuZt+MRD49Yj4zoUhi/rYyFIzCaM5iYO
         xcFvpgqqX6xgOu9qQFbGQRnUzI19As5Yl0SvmKSHohsMACixCYS5h7zOO1UEOGPBqsLe
         mIVNwSnIZJBtaVU5Jwcfhg3nRYEcGFgjDdp+R3opkgdOPF0NwryWl86N6bW5EGu+LJ9d
         KvWw==
X-Forwarded-Encrypted: i=1; AKwUvBwfe4DxGNvdhEsIvgdcz+YaM4DFxSfpXSNNz/fCaJ/ziT2Vcg8byWNwC4iF3DoP75d93AgGVBYls+GV@vger.kernel.org
X-Gm-Message-State: AFuF++lIqxi+LTUh1AIB2404JX+dNiGjXSxb2yte1V6CLjoLa9h1DCR+
	Ojq7skKLaoDO/liLWtnk1D599l3TI+Lkh840GzaGnAFmh7GyBoPvoONt
X-Gm-Gg: AYBFou1v2pBN1XFCnGG7ocHhflDZfAMTjLYiXTgkeBqSqEmvh2BsUOkYGN68ssO9V4l
	+gNiL0ai1tXfc0lICY5V4EafFuWmfD/iXRUvgtnukOEqCJ2fvjSeV9Zycyfj5eZiDsyTZU1+V5v
	JIAEuN1QRbXwme3LgEjhBQfo0EWiclSU6ox0X5lgRy+4n3LUkzzrKAJV/TX12IyWrKaBByqdn3I
	M23dJsSJusURPPYlRNvNwS4vzo4AZ6dbL9aSC6E7AR5uQhM1e6qSMT8QeEsEQQo/GhO06u/LLDd
	8JUQxP7XUP7LipA90u3kx1Vh9fBM8Hu9LRQnVbrRyIJOSduuUxQFAe58B8BvBkIWQGAicPiaFbA
	CPgT3E7BeOTayeaoI2RlAZ705Yj8KwWz71+mM7Khn4IE8O4fvLHxcIPF7An9EtZi0dzBxierRtX
	d0PgWAexRgElAoG4nEgHNAPBca45qousaqSEAZ8Gc7gWgxq60Z7aXOajqoO2lJAsjT7b/4/q7hz
	bCnvAjBtsj3ybPifc/vbxPqhQ==
X-Received: by 2002:a05:6000:2287:b0:485:8b5c:da39 with SMTP id ffacd0b85a97d-4858b5ce1bdmr10859250f8f.12.1788622355807;
        Sat, 05 Sep 2026 08:32:35 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:35 -0700 (PDT)
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
Subject: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
Date: Sat,  5 Sep 2026 16:32:30 +0100
Message-ID: <20260905153234.133217-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous series for the intermittent boot hangs on the VIM4
marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
explained, sys_ampipe_nand clocks a pipeline stage that the
hardware design inserts in the bus path between the SD/eMMC
controllers and the NIC_MATRIX fabric to help timing closure.

So the clock has real consumers: reference it from the three MMC
controller nodes and drop CLK_IS_CRITICAL instead.

The series crosses three trees; patch 4 (clk) must only land after
patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.

Changes since v1 [3]:
 - Dropped the Fixes: tag; this series is an improvement and should not
   be picked up by stable (Jerome Brunet)
 - Moved the patch 4 dependency note below the --- so it is not kept
   for posterity (Jerome Brunet)
 - Dropped the e-mail address from the Assisted-by trailer, see
   Documentation/process/coding-assistants.rst (Jerome Brunet)
 - Fixed the space-indented error path added to meson_mmc_probe() in
   patch 2, it did not pass checkpatch
 - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
   capability flag, not an SD_EMMC_CLOCK register field

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
 drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
 4 files changed, 62 insertions(+), 12 deletions(-)

-- 
2.55.0

