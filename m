Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3663BB120
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049478; cv=none; b=nvOwy1wE2xb4hJFpO1VQ4mD0YeC2Qi5DVubrqHNv3yMcoPEbqlZ7CPKJ5/nnj6ENgvLy8yBmgd9qd3MgYQaAlSAA6b4MtbSqrBxExcXLF1sybLvExorujyNXrl1MlNe78oflMtGyX3X4bwuoXH1PKARaY/YlMn4sIi+Lo0UXFk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049478; c=relaxed/simple;
	bh=goCzNe5aJpe/5il+rwmBp0a46eeCz/QD2HSkq25wWo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZEcA+oLq+05TeG5dmQqgY5WGDnKen2CFeNQpgQL9uHRgg3G08Q1gY8knG400q7Q8Mx+2mqc77Ps1+hqg80AJTSbvpySPGRQS0xjBE0c+yINKCXF11fMQ+zTQiLjZTk9eI7Zv/4IuqXwWhI85W5sMFjsgZc4qxLNvf2zmlOw8YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doYVE92X; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doYVE92X"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49041e84237so62123465e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049474; x=1780654274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk66zAA8a3QudJhszauWsz7yQXjnbQNtZ8Tax/bPzfc=;
        b=doYVE92X/L3EbCuEtguNrkknJLtr0dmyH/m5X7bHOGzLfXrSuohb7gx/vG4yFaC8MR
         5IDKpXCjomN/HwpEP4+viTCYMDb86DX0EnINijDnJvR1TvADuIpmpvPgpEMx6idDRG3t
         W1mwnYYzcEWyeO95y98wSdjexycq736+UYYWsrPMnvVEkYYTzs/hrK9hcMxDkFD/Qs4M
         6OpKhSUaprNei77CI0KPcyfwPKlvoqUzXAjRYtKtg1U/4jhUYg5dVyOfqQObAdtd562H
         tAlesUKWeWURDEKuyDTH9HH87DgMnLkMAmhp524rQuRSdrcYRL6dObUMVjo69dVnrH4H
         rWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049474; x=1780654274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mk66zAA8a3QudJhszauWsz7yQXjnbQNtZ8Tax/bPzfc=;
        b=FgR2GsoOCMiZB/FQe2UiVJ4TLaZh2pzaUEPxIUCLo4H3Sr3nhLihugsFvxGC7HxNuH
         FVCXjzIdtSDHXYngInCx1WCFy6DJrp2VGoC2CQG7VmgaUDhar1RKUp8FmknVvlSPjz4j
         +2I1PZy1vXrF9aLhjjHrdnkqQyo187L3PHhw5dFfu5BzjdvRXzB8nFXuJYWE0hHfBvLS
         DyAxAjRyE3IAr9TELzdzZdln0uHl2z2kNoWFqHr03XZX0xpR4bCPwEWZBGKsaYnweFkG
         MxRQxzSAGyro/I6K1AGSOhHzGeuLgOBQXSmSZcDlo0xf4fs0K3hXxF50kRuCxcMtNAvz
         0JAA==
X-Forwarded-Encrypted: i=1; AFNElJ8mF2tGx4A8RRilRu03VULEEJYXNHp+1z2Ua+YspHumGd3/aeDlt2UTZx2mp+8NCtDxtRqiXfItzL1t@vger.kernel.org
X-Gm-Message-State: AOJu0YyJwd8qbaNcMXRcRrVJuhU7k6RXfOl92cwXWK+DFQO2QYJv7u7x
	gAcO+mIaEzOCjs58uequRdNEpnewAVCJn+u/uETX7TnmgjqYKMCYITtn
X-Gm-Gg: Acq92OE8+lvp//1qLAPWPHPS7goRtMg7u7p7igKs9EwgaZsmfq2OHrybsF+ZUqsBdJb
	AgnolMGMoSGWdY3SVqPvDsOlYwGh+oLaqqfn44B1348TW2dGq9F84KN2fVlkxyjtPd0F7Adw9vC
	GAUJJ0SxkUXb9qXKM1Bd32+XBsfxvNeLi1RODgIcY3/nUIAfwO1bLaC5yUpbiARd4SHJbk8Roq3
	Ph6M25Pu4MDZtm+wzPTzIyMxNNLNdKyXtlxeJO8SbEDHBpOtKGrL5aXH8mInViQQqOi431VINYf
	z/7vgEXECe8xyFRCpnDbK4XzFCFK0+J3/jNgD/TFm4TRmWj55pAc7karGwsW4XUROrkT+HLCbBC
	8RFurwe9WILP+ReZoHoChek9EpuWQQYa/PSLAQZFR0qcddh03wAUyFjK2Va1H2tRl/3ZcP1Hr1D
	SKBut7kc73BS+G7ZDzTpa6ZBDIPAeydpRMkfDGTasomcppi8g8IiJXkwc04bFbvhqFctNK3CQaL
	g30uorQcrcBbq5mNJVNYHzFGEBpKZkdlYozPf+S39I6uNs6MakJbXQQMg==
X-Received: by 2002:a05:600c:8b84:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-4909c62a2a3mr32056745e9.13.1780049473591;
        Fri, 29 May 2026 03:11:13 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:13 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 3/4] arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
Date: Fri, 29 May 2026 12:10:50 +0200
Message-ID: <d95755fc33593f4ccec6e1392924258ccf144a81.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index a5fe8432ae59..23b359e39094 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -222,6 +222,14 @@ tpm-enable-hog {
 			output-high;
 			line-name = "tpm_en";
 		};
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

