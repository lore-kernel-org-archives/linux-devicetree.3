Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7176D2F3621
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996886; cv=none; b=DafxPXwzsvGiYuT9L2Tl4HQow5OWJHhnxTinojDFzEgq0YLM3HsmTYxmbInX3CJB4V/rwSpEipR3v+gftQOte66XE8YZkdlST/xn2RfxDeEMbH4Z8ysFgzpcjXWxq2Cl94qPJR4Dto5j4sOXjn4kmPFgu7UXQwWvJnoremewMTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996886; c=relaxed/simple;
	bh=qtHihgUfVJ7dLLyKBNMnY1uHg9+U0eAjPmJBvsAA+mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/RUgVcAedV3X9wFZXPPmw25IU7z9N0yKz+Env6L8CZ50rYU1Ca4wAfCc7r8JqAVn5rf4TLPJ2AACS2Jf+sfd/lkgmC70Z/yKnBCtWPp2eULw0B8lUKcfHavUU+8EstlPx9na0xMYNhzJLyZ6Jd+3rmMrFee421Onj6sKzy74f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1178231f8f.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996881; x=1788601681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGDbub8U4HXvEWoNu7b7TUqir4ckSWpnsJ/08Cf1vHM=;
        b=tFVmADuujbgDnq98NSuapfsdJ2NTxu5FoND67CMcTKX/UMAdbVDlClbJ9xVNLBWjSp
         Fm9ZwpqF3gSjzRwP+Z7ntTdoz7EcZIX0ex4Mzmbk4sLbN1ijBVi5+KJJEOsEcSQXU8Dv
         EDKq2kF3q31XBWNelBf2/xkvSFfNt7XI/tMJ8Zyj69DpKbaVtHe2oYqm23VGXpK3NxvO
         WuzjNDZD/eX0IBwgSnlgi7Jxy4oecWYAjAyssVPAegEyny/OqBo6jhZ046OHB6NEDEQv
         xzKlLZ+Yhd6sg9GLZ+fYWWX8FLPJqaNbJi5TXjAE6eNo+IZCI2V+waT9tyWaz4uxzWyn
         dVIQ==
X-Forwarded-Encrypted: i=1; AKwUvByaPjaA70kuSzcnaTE0Lu2P04mJEZgH62bJLKFZSfPwcL01uGoX8WJQu6A80/Uo2K1wc5Iu/H+w6DZk@vger.kernel.org
X-Gm-Message-State: AFuF++kh7vNDMyj5HYwXKDolt219XBpwJG5ol7oMlwW2Adw/P8hsnyAC
	7a6mNke1yLG9kbIn8UU+JmPkqRd5Uk3Qm3qQhn5V3qAbgnphtGfS/Fkl
X-Gm-Gg: AYBFou2JLMdk+PVL/hIvjr1jALTwC/bzkKtO9lvScrqzZF6nQbGzitKxs+GJOAXdqnW
	v5Qe5YbDTJIbo/TS/+wTnDHyQK7fdGR5AT04XfMtBV4X2MBfzR4hfF9iHVIHtxNOaHOg/XIbd5g
	7Ejb2KP9SUHj2XTAjjICv59mPGuFT38GNiEX5l8TzaY+YpM5NWNoyLgo8KHC8VXGCx0eAWZ+MsB
	077vFvjevja+ejx+7NF4T6FIeE2nZHGyw1ODHquJT8wCzyQR+ZGBSyBiF0LwDyNqwaJMAOaWarQ
	k9Fdc0GxsBfjsY26U6mcuQldP2izvIy7u8z0BfJ38izvzBTqmrmFy55dSBrO2SJ70v2tEn/jpd1
	TbcJCFpO5DDrD6A/R0qAlF08hM3gRVcokOkVRBt03ACdkTBHXf3DPIccHJgLP+wr0Km1OhLUphu
	GZ/mpRaUpJqRKgKUYc+8Rnien6vl6LnJnOz3qRPCDUUg3+WkCY4NbksJ3YUWq74dWErk4cYwB1x
	jPxNIQii8WOdKyIbbl0PXvaY2w=
X-Received: by 2002:a05:6000:2207:b0:484:3310:f398 with SMTP id ffacd0b85a97d-4843310f455mr2068417f8f.25.1787996880459;
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
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
Subject: [PATCH 1/4] clk: meson: t7: keep the memory fabric clocks running
Date: Sat, 29 Aug 2026 10:47:55 +0100
Message-ID: <20260829094758.23248-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four clocks feed the bus that moves data between the peripherals and
memory. Nothing in Linux claims them, so they were switched off shortly
after boot, and any device that started a transfer after that point
simply stopped. The SD card, which comes up about two seconds in, never
finished reading its identification.

There is no device these clocks belong to, so mark them as always
needed.

Fixes: fab4d651b592 ("clk: meson: t7: add t7 clock peripherals controller driver")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/clk/meson/t7-peripherals.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 214db7850d86..55d09e78593b 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,11 +945,16 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+/*
+ * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
+ * used for DMA between the peripherals and the DRAM. After the clocks are
+ * disabled, a device that starts a transfer cannot complete it.
+ */
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
-static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	0);
-static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	0);
-static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	0);
+static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
+static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
+static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_sd_emmc_a,	SYS_CLK_EN0_REG0, 24,	0);
 static T7_SYS_PCLK(sys_sd_emmc_b,	SYS_CLK_EN0_REG0, 25,	0);
 static T7_SYS_PCLK(sys_sd_emmc_c,	SYS_CLK_EN0_REG0, 26,	0);
-- 
2.55.0

