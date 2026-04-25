Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D7F3932E8
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114592; cv=none; b=WfzTGd7RpUeY8PNB5ELL+JsDkM6CR3dHQKUBcjTcrFbL1UcXcmynrOou40Ldh1ahSn2KNlWiLshUfvep6q8tazF/bzmpT0zl32eLXjPlugG0nZnlJpslJb1S+7H88uCT6NwsvFL3f/houiBmz+WzoHwUaSWqnZub8a17yKWWUTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114592; c=relaxed/simple;
	bh=FigZvmJ6e3ezsNXGyVPDbmmS8EdNURQUJM3t3MANHlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHSjURuHD36P77uMwDVFDZCWiIRRIx5TQQdMCft7+7eRgUtznOTJUmYUqZ+/c/Iwqn4U5RNSLtu9LRD25mEQ/NlkcIhOHfykHww89wE53jWJYbqk7ZitCFwQINx6T6Ccuq2yfZ0pPY8aHQ2F07MCjBNVCsugQKNwXlX4bRaaESY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7Hp0JeU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7Hp0JeU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b7adb38d65so25466485ad.2
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777114591; x=1777719391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrPxbW2Ki+GMIMbXGlvA5ZceXyUNusJm2uzRjJG262s=;
        b=O7Hp0JeUUdAsa+WfzzmrpLXowDexaXdrpUmyuib/k+gtAk3keFLnT4p3JQ9Gsq2FsM
         Di/t8dU0fcsQSLUhnqnu/KZCghGsk4NfTAL7z9x0rYIUFsgQgk8yVaQkOVw9QCNdrStm
         d8ZmTJP6co6xm9U9BB5KypYZuMy7Va9QkHX9b9R3mQgFBXm6XfM6wFjzZmZMDxU2NwOn
         BuscB+uJdJkQqwmeFVijl5rN697zUWJedcvIxIhhvUBS2Fx4S4V1tP7wetfHiRMI4ktr
         dyFeX63+wUBtai1JoR9wviRb8B08JXCODgtWW7RJngsZzoE9h9DoSBjIEk7o0hVBz0+4
         n0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114591; x=1777719391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZrPxbW2Ki+GMIMbXGlvA5ZceXyUNusJm2uzRjJG262s=;
        b=OTnMxYVxdGwgH6Ya3PSwaMa1RwxYgbLwmtq+Afe1/YZxrGwRjpWfsI/dEeBXnrCbXD
         g1mo7gvQIqx8wxODQAV4aazbzqNHV37v8eOXmm9zZaeyJlen+vsDNUlPkOfHMpZxfzeP
         LmP3Vnrc8keT4X0x0C3tuCdWsiFEu6G8b4wQd6/AltQ1m0YM8MxJAKXJv+zLMB1TMNAt
         UNaNUYgq870/x8jEUz67jgevrqlX/sFUmsoWcibG+MAD1+3YdT9uz09JczOX87JBCgDE
         gNZM+Go1YEzBzO2LFfxQhxZ33t6Ih4e5cqUxNUlEG8M0NFBiezpklqMsuLGw6kK3bzRV
         ORuw==
X-Forwarded-Encrypted: i=1; AFNElJ9vz4VxGFxnWJSVGxYIZ4uKa7lPVjCAiQkkWx3wp38Tw1JF4bQVuAhWxW+GjEH57wZ9twouGWGrYwck@vger.kernel.org
X-Gm-Message-State: AOJu0YwE6uvvvZqfU6ToOvogYiVDjDJpsCJoYkwYXcU3jiW6XRe2dPD2
	dbqVbJCoxP1lGDvjqaYIdwQlXghOQlPrCl2lk/YWiDSiqfHwuU1sHT38
X-Gm-Gg: AeBDiesSflsJ0wi8BkdqUu6/C0wpXYWfb91fAfYQ6TwkFZeoRejo6+zGlHtEkGXwN0c
	qBgSnh9JEptEoy74elwwLEMOvUaCKWwOigowj/G9SD3L78tK5mBdLrYwlCy+vyPcAtILbfiLmrZ
	22PqXoVhmnfgUJ8jJq4oOI0eJ3HfKPq6ssiNIbG9pg739Q5ykOZD++H5bVcNCC3DGxa7rpWANG3
	5OHexw92Jo4aD26dx9AKzNOd3sPJb/t+0NrPVuEqlBRUqjF7K2IKJ+bTJKufgT0dbvKWNGdc4UK
	iB4ST0kn/nRDbA06CagPsyyS8dO+etxUB8MZpSaoW2SD9Fn6FVyOJ7eD+UBqua9SMcugDDUPscn
	I9ojOJ0Qn9hQpisc0Gx+ofjLd3/REEuY+CmHGJXRHTldVIRLNhdJuJ3ibj0vMY/cVnJvdmMhkRT
	4W2tNDKrFj9p93yb2iuukGvU8gAQky
X-Received: by 2002:a17:903:1ae5:b0:2b2:ec46:dfd4 with SMTP id d9443c01a7336-2b5f9f1eb04mr401287745ad.22.1777114590804;
        Sat, 25 Apr 2026 03:56:30 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa33486sm303832345ad.33.2026.04.25.03.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 03:56:30 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/4] media: hi846: Add 6MP and 8MP mode support
Date: Sat, 25 Apr 2026 18:52:58 +0800
Message-ID: <20260425105300.745044-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425105300.745044-1-mitltlatltl@gmail.com>
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
mode for years. This patch adds 6MP and 8MP modes to maximize sensor
utilization.

Note that these modes require 4-lane MIPI CSI-2, as the downstream
driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
operation on the target device. The register sequences are extracted
from the downstream Windows driver.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 159 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 09c109f3fba9..d6739a7c2324 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1027,6 +1027,111 @@ static const struct hi846_reg mode_1632x1224_mipi_4lane[] = {
 	{HI846_REG_TG_ENABLE,			0x0100},
 };
 
+static const struct hi846_reg mode_3264x1836_config[] = {
+	{HI846_REG_MODE_SELECT,			0x0000},
+	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
+	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
+	{HI846_REG_Y_ADDR_START_VACT_H,		0x0172},
+	{HI846_REG_Y_ADDR_END_VACT_H,		0x089d},
+	{HI846_REG_UNKNOWN_005C,		0x2101},
+	{HI846_REG_FLL,				0x09de},
+	{HI846_REG_LLP,				0x0ed8},
+	{HI846_REG_BINNING_MODE,		0x0022},
+	{HI846_REG_HBIN_MODE,			0x0000},
+	{HI846_REG_UNKNOWN_0A24,		0x0000},
+	{HI846_REG_X_START_H,			0x0000},
+	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
+	{HI846_REG_Y_OUTPUT_SIZE_H,		0x072c},
+	{HI846_REG_EXPOSURE,			0x09d8},
+
+	/* For OTP */
+	{HI846_REG_UNKNOWN_021C,		0x0001},
+	{HI846_REG_UNKNOWN_021E,		0x0235},
+
+	{HI846_REG_ISP_EN_H,			0x014a},
+	{HI846_REG_UNKNOWN_0418,		0x023e},
+	{HI846_REG_UNKNOWN_0B02,		0xe04d},
+	{HI846_REG_UNKNOWN_0B10,		0x6821},
+	{HI846_REG_UNKNOWN_0B12,		0x0120},
+	{HI846_REG_UNKNOWN_0B14,		0x0001},
+	{HI846_REG_UNKNOWN_2008,		0x38fd},
+	{HI846_REG_UNKNOWN_326E,		0x0000},
+
+// ?
+	// {0x0710, 0x074c},
+	// {0x0f32, 0x025a},
+	// {0x0f38, 0x025a},
+};
+
+static const struct hi846_reg mode_3264x1836_mipi_4lane[] = {
+	{HI846_REG_UNKNOWN_0900,		0x0300},
+	{HI846_REG_MIPI_TX_OP_MODE,		0xc319},
+	{HI846_REG_UNKNOWN_0914,		0xc109},
+	{HI846_REG_TCLK_PREPARE,		0x061a},
+	{HI846_REG_UNKNOWN_0918,		0x0407},
+	{HI846_REG_THS_ZERO,			0x0a0b},
+	{HI846_REG_TCLK_POST,			0x0e08},
+	{HI846_REG_UNKNOWN_091E,		0x0a00},
+	{HI846_REG_UNKNOWN_090C,		0x0427},
+	{HI846_REG_UNKNOWN_090E,		0x0059},
+	{HI846_REG_UNKNOWN_0954,		0x0089},
+	{HI846_REG_UNKNOWN_0956,		0x0000},
+	{HI846_REG_UNKNOWN_0958,		0xca80},
+	{HI846_REG_UNKNOWN_095A,		0x9240},
+	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},
+	{HI846_REG_TG_ENABLE,			0x0100},
+};
+
+static const struct hi846_reg mode_3264x2448_config[] = {
+	{HI846_REG_MODE_SELECT,			0x0000},
+	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
+	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
+	{HI846_REG_Y_ADDR_START_VACT_H,		0x0040},
+	{HI846_REG_Y_ADDR_END_VACT_H,		0x09cf},
+	{HI846_REG_UNKNOWN_005C,		0x2101},
+	{HI846_REG_FLL,				0x09de},
+	{HI846_REG_LLP,				0x0ed8},
+	{HI846_REG_BINNING_MODE,		0x0022},
+	{HI846_REG_HBIN_MODE,			0x0000},
+	{HI846_REG_UNKNOWN_0A24,		0x0000},
+	{HI846_REG_X_START_H,			0x0000},
+	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
+	{HI846_REG_Y_OUTPUT_SIZE_H,		0x0990},
+	{HI846_REG_EXPOSURE,			0x09d8},
+
+	/* For OTP */
+	{HI846_REG_UNKNOWN_021C,		0x0001},
+	{HI846_REG_UNKNOWN_021E,		0x0235},
+
+	{HI846_REG_ISP_EN_H,			0x014a},
+	{HI846_REG_UNKNOWN_0418,		0x0000},
+	{HI846_REG_UNKNOWN_0B02,		0xe04d},
+	{HI846_REG_UNKNOWN_0B10,		0x6821},
+	{HI846_REG_UNKNOWN_0B12,		0x0120},
+	{HI846_REG_UNKNOWN_0B14,		0x0001},
+	{HI846_REG_UNKNOWN_2008,		0x38fd},
+	{HI846_REG_UNKNOWN_326E,		0x0000},
+};
+
+static const struct hi846_reg mode_3264x2448_mipi_4lane[] = {
+	{HI846_REG_UNKNOWN_0900,		0x0300},
+	{HI846_REG_MIPI_TX_OP_MODE,		0xc319},
+	{HI846_REG_UNKNOWN_0914,		0xc109},
+	{HI846_REG_TCLK_PREPARE,		0x061a},
+	{HI846_REG_UNKNOWN_0918,		0x0407},
+	{HI846_REG_THS_ZERO,			0x0a0b},
+	{HI846_REG_TCLK_POST,			0x0e08},
+	{HI846_REG_UNKNOWN_091E,		0x0a00},
+	{HI846_REG_UNKNOWN_090C,		0x0427},
+	{HI846_REG_UNKNOWN_090E,		0x0059},
+	{HI846_REG_UNKNOWN_0954,		0x0089},
+	{HI846_REG_UNKNOWN_0956,		0x0000},
+	{HI846_REG_UNKNOWN_0958,		0xca80},
+	{HI846_REG_UNKNOWN_095A,		0x9240},
+	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},
+	{HI846_REG_TG_ENABLE,			0x0100},
+};
+
 static const char * const hi846_test_pattern_menu[] = {
 	"Disabled",
 	"Solid Colour",
@@ -1042,9 +1147,11 @@ static const char * const hi846_test_pattern_menu[] = {
 
 #define FREQ_INDEX_640	0
 #define FREQ_INDEX_1280	1
+#define FREQ_INDEX_3264	2
 static const s64 hi846_link_freqs[] = {
 	[FREQ_INDEX_640] = 80000000,
 	[FREQ_INDEX_1280] = 200000000,
+	[FREQ_INDEX_3264] = 288000000,
 };
 
 static const struct hi846_reg_list hi846_init_regs_list_2lane = {
@@ -1134,7 +1241,57 @@ static const struct hi846_mode supported_modes[] = {
 			.width = 1632 * 2,
 			.height = 1224 * 2,
 		},
-	}
+	},
+	{
+		.width = 3264,
+		.height = 1836,
+		.link_freq_index = FREQ_INDEX_3264,
+		.fps = 30,
+		.frame_len = 2526,
+		.llp = HI846_LINE_LENGTH,
+		.reg_list_config = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x1836_config),
+			.regs = mode_3264x1836_config,
+		},
+		.reg_list_2lane = {
+			.num_of_regs = 0,
+		},
+		.reg_list_4lane = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x1836_mipi_4lane),
+			.regs = mode_3264x1836_mipi_4lane,
+		},
+		.crop = {
+			.left = 0x46,
+			.top = 0x172,
+			.width = 3264,
+			.height = 1836,
+		},
+	},
+	{
+		.width = 3264,
+		.height = 2448,
+		.link_freq_index = FREQ_INDEX_3264,
+		.fps = 30,
+		.frame_len = 2526,
+		.llp = HI846_LINE_LENGTH,
+		.reg_list_config = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x2448_config),
+			.regs = mode_3264x2448_config,
+		},
+		.reg_list_2lane = {
+			.num_of_regs = 0,
+		},
+		.reg_list_4lane = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x2448_mipi_4lane),
+			.regs = mode_3264x2448_mipi_4lane,
+		},
+		.crop = {
+			.left = 0x46,
+			.top = 0x40,
+			.width = 3264,
+			.height = 2448,
+		},
+	},
 };
 
 struct hi846_datafmt {
-- 
2.54.0

