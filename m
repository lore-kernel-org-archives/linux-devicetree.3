Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724338B12B
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261173; cv=none; b=uzMu4q+YDjY5sZEWuvebxRuBTnoYDYFaWqzEjiPoXgiNGuOutjIBJ1y9c62OlrrQv7Fl9IFHeKENfNDgo9A8/UIHh+QYFQonEAhM68G99+oP3rdNQz9p77WNuy2GEnG5LzHIVYgiSYBlJFZt0RIIiDr1Bsr+V37R0YVlxogau5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261173; c=relaxed/simple;
	bh=qUA8SRWMHXak4DMGjiU5xSTobYDglxv6lNBrFgz1elQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GB9V2db+iLBFxBXxhJfBtZBQphSTadvmGoo8K7gYxTIOpteXuG4D99z14Zm3+1RJIw6IUFfibSBNC4p6GkQ8JPCatDuCRZ+1/rsnZt8Xq603vaTqvwSXkQ7QlOijorNGtX+FtZk9CvdWZ9gMG95w42VGtzf0Al+nufmvFuAedow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga6pgZT7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga6pgZT7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48541edecf9so40518485e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261171; x=1774865971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=Ga6pgZT7b6ytinMbdIhxT7vM3/QrBQvXuef/X5KCzK6RVQt4HJVfTdjvxl1udNN5a9
         1Eo8Mi0SKCYZeZpDQhTNNJggRvm8QwIBoPvfJ4MGrJRnFTVJfAj/MlN5wH97geU6bnk2
         0rgHwl9bGK+wCW9sVkJWsIQKq3AKXoSu6g+E+7OqPuR/yecINcLhgTdEMviI+bk/pt+J
         SCpdRkItAxkCulKYi8QUmIyJojM2f5vkeTPHrpUNScKO94LIhHunDWNZMplw1UtXyi/v
         H4LmlDv1m8v1P8VlNhYQWvqsn+lx2os6Kdl8Wxjjrr0PLo6bXgMoIk46pn9QXW/z/GlP
         kTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261171; x=1774865971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=n8H75v71mxWNyx2naelDUI5M3zH8JYcQ42PHItx+lfaj9D930963cDReMr5S2rFHfg
         qC89PKItyj6FPnPuI2vjbIgAc8rlCT8WoBnakuIt1Xly+Ga9iNmhPicVz80J794Rp6VI
         GOzgWEE0yujfFY8pEgp20H3uoio2dKSyO9mlQ4utE8wBScgqLHW+4gt0D1qBTwgix9JL
         ufAxvFOhEmeeoufUf3STMIymQafPjU3llQ+d/X0v6Gp54QcWHRJeLOiNh5AQBuyeWFTT
         ehrMC8kjKpnbn2FQYS7Bit1E1MikeEA1ooxn7jlYijoK9lOinw96C+QudvT51S+o+NR/
         4+IA==
X-Forwarded-Encrypted: i=1; AJvYcCWR4crOhKnnhPEiEb7FK5iTN7MaEN7vhJ4O9GAbPlL2hFUIL/281qpHpmAD2SOmAJK93tAFcc6Wq23n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6W4jCc3F9XUmZEaXsn6KkGY4o5gDgtfohQ+3snBTP/BrbJqJA
	b0y5FDM3VEGxYfaofVf75JRiUJcXhpBUBpQUZHhkEjdkuNKKUkojHXinLdya+w==
X-Gm-Gg: ATEYQzxvhRFSPQmQ2Lmz2IzdtdYf/0+JMM1pPm1m0RyNOzqQ8OqZtsajyW6nSY33yiJ
	7FqSdLd015/DxdyWzeCL8TzePuzKthkJtD5BHM87TA58yhjLBLWVqrYKF7Vcx4zFgIgY30rKHRX
	BaTpgxu7gjgKm9bb8f8nI/eSyVEtHdDICzaLavAEmcDheWoLOjpTAckBlLEG7UNg9JM7MhqwJmb
	cyLD2Tz/00uKpXxX02EKjJfiAmLTbrotN7oCPg8iJ8KnRos1cDnylAsKH5qctRzWPO2p/0IhBw/
	12PNnNskp2FxB2CVFh1m1Qiypaad9HBm5pXp3wV1QIedHLYWRF/MN7BbDnSC9h7/jg+Wo5ASPCR
	hKZ8y8ssj7pCAi+xF5kt78CX7ZkdM7yHGxt4zoHwr3+g54gyd/dy+5L6CHyZ8k2sLv3IrB+oXv9
	qyaFWg3uzyd2ZsZtnExaF/0Zmml4qsJIJrkENO/v/C21gViklu9rtX+19qAfoX1Q7S
X-Received: by 2002:a05:600c:474f:b0:485:3b34:2f62 with SMTP id 5b1f17b1804b1-486feddb659mr165327915e9.14.1774261170709;
        Mon, 23 Mar 2026 03:19:30 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:30 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:04 +0100
Subject: [PATCH v4 1/8] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-orangepi-sd-card-uhs-v4-1-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Ensure SD card pins receive clock signals by enabling pad clock
generation and overriding automatic clock gating. Required for all SD
operation modes.

The SDHC_GEN_PAD_CLK_ON setting in LEGACY_CTRL_REG is safe for both SD
and eMMC operation as both protocols use the same physical MMC interface
pins and require proper clock signal generation at the hardware level
for signal integrity and timing.

Additional SD-specific clock overrides (SDHC_OVRRD_CLK_OEN and
SDHC_FORCE_CLK_ON) are conditionally applied only for SD-only
controllers to handle removable card scenarios.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 455656f9842df90c7a94a290aeec22157b378fc1..0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -21,6 +21,13 @@
 #include "sdhci.h"
 #include "sdhci-pltfm.h"
 
+#define SPACEMIT_SDHC_OP_EXT_REG	0x108
+#define  SDHC_OVRRD_CLK_OEN		BIT(11)
+#define  SDHC_FORCE_CLK_ON		BIT(12)
+
+#define SPACEMIT_SDHC_LEGACY_CTRL_REG	0x10C
+#define  SDHC_GEN_PAD_CLK_ON		BIT(6)
+
 #define SPACEMIT_SDHC_MMC_CTRL_REG	0x114
 #define  SDHC_MISC_INT_EN		BIT(1)
 #define  SDHC_MISC_INT			BIT(2)
@@ -101,6 +108,12 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
 	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
 		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_CTRL_REG);
+
+	if (host->mmc->caps2 & MMC_CAP2_NO_MMC)
+		spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
+				       SPACEMIT_SDHC_OP_EXT_REG);
 }
 
 static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)

-- 
2.53.0

