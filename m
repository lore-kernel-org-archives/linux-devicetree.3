Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092643A3E7E
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476373; cv=none; b=Wrl6A01d5N3/bPEMWw4Rc7W6SUWjZIe2mF/lam/aioNGt+gyoHi2et/8nRl0eij/aGhYKMWouMM/I5+x00m/tVr9q+etW0ZGa5ecS8O+irEL+uLO59of8RD7pTXL8ekPYzyCCr0FPCXCYpKgKSqApYa4UH0lY6iHkP9t/nCcDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476373; c=relaxed/simple;
	bh=dBm6wiR4NCMuszCPNIsVX9WFUcZFQlUHejOmhcoyT0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXs04dBYmZ8ABeEnXRTL/bRuIUCMfMsyKFznHM1lkgzgZn+aymxUJIRwjdRpdNyCqP/pUrDB1ZLOK8Gzhoh62TZmzVCZZwYmcBlSXp39M9pX0PVuOUII+/mHBwJUio/9TwmUCVzuDGd1Gmd7Q2uNweqxgHqksvP2lSggFVZfRlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-485850cf499so221300f8f.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476369; x=1789081169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1SiDePVmO2z41UWzhMW/dfuGDGSD2CkgizPnd7ksWA=;
        b=Y62OACdpE/YkynMRT078hCoTB1Se3n7/c3qzQAVBPinDh2HJouohv5C73Z6jFdOEuv
         3M82zZ5FxIQ0a3jOOi517Hy7ry3HB0uCyYab6LIThEwtWhOX4xgjKkF3OyLz1SzXTuxW
         I5+w/iNW51LNE5uX+9mKGpCSrUK5xZ2cD1+F4mmBsS9VTEIKdK7qHiyVXxvbIAg5XeBM
         OidA6Zwm2yCjgv9bTaxr97GgOD6NLOvRmBT+R7zv3TjvTUreRq4ehFb1m69UF//yQmGh
         gaSPTqqlhI+P+PZ7X3Zf7JWzt+OjHG4pV6ssnsPwduBt5Mc5MeR0+3tYom7TWbwLPUsv
         cJEw==
X-Forwarded-Encrypted: i=1; AKwUvBwQaA3KTpxi7o71rhncsWvmAUzsaOBqROAeUJ29unBBju2U3Ki4M1/SSrpwLMQAVl6jwq8g369zp4vH@vger.kernel.org
X-Gm-Message-State: AFuF++lURcTFSuPLQc1KQGGYsWuqnLJYngs2sno4qc7g2kpjBr9Pco2g
	E1sQBmzOS6icarVOY+5i3j+cY6/TRilA3tyzLUxijxtOTdvOi+MSI6up
X-Gm-Gg: AYBFou1d/g37kNbIYQPOil6LCEv8/nLGWWs2KizpVHRq9z7QDBkLKGAjYVvvCnFLx/p
	H2Kc6jq1aeQzNkNnJCQ2CKxi0+65wt3V3mYyn0Z2hKYmTwDmrAtPHdte+LPAaCJSzbaCoKHdi/p
	actQREDEjx8Go6oxheiRt+vQ8amXdXF2y419HxPypw8x2PbYD4XQsVCFFBj0duCJ+uyU/i4sJyX
	Y+T95GxMGrd3OA0u54WYe+e3WvwkWecrRdD1pjauIuVCnbufw/RmMF5g0jesMYjEcg3i7Dim96d
	HvrrwHH0AkI9aMFvz35kqu6Wikb0t4dEXWFIetaILnWgZUknEshixYFqQRE1IJeWU8a8I38VoK0
	Pjz9V3MyXQ4ilhBRgd8sUmwIPFD/QG3XdhBqJUeSAv2o8mk7TS6qu9g4rgdRPICTq+Aybvna7y4
	EYECAtd6ATsYd02UxRvTr/gGljosAO7uSINZ1NTXR5rGEqPAcb3bXuZZkDUXrerUI1eOP2kzDiB
	zfkfxpA6sidpCgPrKlkFHt8vA==
X-Received: by 2002:a05:6000:4a1e:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-485870870b6mr4790999f8f.1.1788476368800;
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
Date: Thu,  3 Sep 2026 23:59:21 +0100
Message-ID: <20260903225921.2290441-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sys_ampipe_nand clocks the pipeline stage inserted in the bus path
between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
identifiable consumers - the three MMC controllers - so marking it
critical was the wrong tool: the clock should be referenced from the
consumer nodes and claimed by the mmc driver instead.

Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
have no single identifiable consumer.

This depends on the MMC controllers actually referencing the clock:
the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
clock must land before this one, otherwise the boot hangs and memory
corruption this clock caused are reintroduced.

Fixes: 43e1705ecab9 ("clk: meson: t7: keep the memory fabric clocks running")
Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/clk/meson/t7-peripherals.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 55d09e78593b..2f429ea86796 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 /*
- * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
- * used for DMA between the peripherals and the DRAM. After the clocks are
- * disabled, a device that starts a transfer cannot complete it.
+ * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
+ * the peripherals and the DRAM. After the clocks are disabled, a device that
+ * starts a transfer cannot complete it.
  */
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
-static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
-- 
2.55.0

