Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABB9429CCA
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306523; cv=none; b=CrH7PTEBXvt+z8ud099oiaXGyvfzjIQ5ycVjgoFuCqGTB7gvJ5bgFIVHcSbL1Hhae87h/VCB6/JtOXoSvkGyuNtw20LlHWM8x9BWIktIg+D5cF8KAznCZ4YFYBPNkCgUNxLQN7Z7e+F9PR5nuDDg6QqFiQIxTtWUOveKH3Abifs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306523; c=relaxed/simple;
	bh=azANXe+5M9L9zSq3Q+0m8DIbeD+viIH7/dL+bU2mmzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t92BdS10v9tVfjGFXYeAYS2nn6mg/Mu0SUWLFX8MVMgDNjMlaDdDh4O6akqaAOhnP1q+EPXEnPkN+NwwwPiIyDgQQyQ2jl5zVopy345qFNBxdEdwE5WO6i4wG7b9pl5tvQkdtHrI7ONSgr17rsh6Was6zcWXTqnCk8HhmArt8DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyLU+cn6; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyLU+cn6"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso979147166b.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306520; x=1784911320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=;
        b=iyLU+cn6/jg3oiD3D2TDzS9vIku8wIrh5cXpU0TiXedFVCFC2rzLOVmZ5ozr1IjC3G
         alDTYvCpye3Rdv0MXFQgIuArJePmDGsvgiKc1j4oVzsf5oCDZLt2ZYBX0Z06NvqGgZnL
         mVqZi+VWtQt/3QnCxVOg1GoJJnNQBWL4PDfJvgBdd/vjJwTRaOM79HzQ7H6lDha9nYmq
         UukVCNT51EKilvUAPNFCDeYB2nMB/7+Ysc4C5lzcjO2gsm6p94YbkZ9k50ZbrfsmoeWc
         YGNjdgMHYSkY3CyVW9Gke2iTdibGnFYv03igZJ3Bj+e9mws1xmWg6MZGXNEgEiwoCGJL
         ZuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306520; x=1784911320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=;
        b=hTmS2Bmq0OGcAfL2THqFL+4X6vDaD7GuqqSo8ePHFcX1/SznE3CDimooW96q34RgVp
         TGgtaTfHXCttDKacsQU/eY8A0tDVdgJNQ8wWPI9y3PSqVMx2SBB8WjTOCpV70P5vvglm
         9lwcvGm+JCXU7P2/Es8DFqmm83p1mi/057dvPX01OqsUQx9ZVK36I2+wE1pp+0SCbAsP
         4QCdtdt6FhyASiO1ch3j830QD9EHg5Z2nDjFpifxMIIaxk1ftYysYrxFfA+hH76FezHg
         4zINE5JzUzwIxhUcO3lQTou7+fr9elRBHXQdEL697YGd+dhThQNFJRuRpQPGfxvS2zJG
         g6eA==
X-Forwarded-Encrypted: i=1; AHgh+RpI5y0ECafuGRGA55HTmDnpNJ1yDVfC4ztyd8RQNg+DLdszGqniSaW5hzn5CH5cILFp7YRUfgHu9N/0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+tTkQDHtDzj/oxfzZZv34OqouxFrhF3AiR5EhZJ8UZ5mQdnYT
	wTvoX+N3y7nbUpeqzdQAWHjrc1bcgVSJEyW9nOqFlGuuSn7dr6dYCKxG
X-Gm-Gg: AfdE7cmsXTqrxWmN7G2lxbYICEGAWbP4Lx1Nj2Hel8a3eoxF8sFv991tNlOY074UJR0
	HP+VJkFgAoYqRQxlEL9SEK8MXVgFz2RibsYVdzPp02CgoBNjfOeTtux3iCdIwEkEfuP+Bc70wNm
	tl0aWpc7q8CH1EVyc7cgSUfvhybKQywCTUZpvefN5OKxeNtbriyVsSVQII0ZHej+giy6SoT2hzR
	niO8e+uC8yRaHcfoLgZUNYLzu89nivRZCnLTng2nubcayE4/tT/kVDdbzsuLK12/JthWlV/RDGz
	vAEkcN6fXBIyA8lggtQPa6wnkq9o2gTl2aS3jX4O7okmdb64WFahaRllFJxC7Lv/Vsv9v4ADKuJ
	hVgh89Ce5t8BvsRzh1qdMQTx6yN58wiYvyH4FiJr1kE9QhUTDK9Ujk23UapIDlluQSv9EhfqIIj
	A37bHqvrWp
X-Received: by 2002:a17:907:db02:b0:c12:8b1c:454f with SMTP id a640c23a62f3a-c16b457b132mr151894766b.2.1784306519677;
        Fri, 17 Jul 2026 09:41:59 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/7] dt-bindings: reset: Add reset controller constants for mt8167
Date: Fri, 17 Jul 2026 18:39:15 +0200
Message-ID: <20260717163959.714561-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the various bits that identify watchdog and mmsys resets. IDs for
mmsys resets restart from zero as they are used in a different device.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

diff --git a/include/dt-bindings/reset/mediatek,mt8167-resets.h b/include/dt-bindings/reset/mediatek,mt8167-resets.h
new file mode 100644
index 000000000000..85d2d0e99c68
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-resets.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
+
+/* TOPRGU resets, these are actual bits in the register */
+#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
+#define MT8167_TOPRGU_AUD_PAD_RST		1
+#define MT8167_TOPRGU_MM_RST			2
+#define MT8167_TOPRGU_MFG_RST			3
+#define MT8167_TOPRGU_MDSYS_RST			4
+#define MT8167_TOPRGU_CONN_RST			5
+#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
+#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
+#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
+/* bit 9 is reserved, unused according to data sheet */
+#define MT8167_TOPRGU_APMIXED_RST		10
+#define MT8167_TOPRGU_VDEC_RST			11
+#define MT8167_TOPRGU_CONN_MCU_RST		12
+#define MT8167_TOPRGU_EFUSE_RST			13
+#define MT8167_TOPRGU_PWRAP_SPICTL_RST		14
+#define MT8167_TOPRGU_SW_RST_NUM		15
+
+/* MMSYS resets, these are IDs */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB0	1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
+#define MT8167_MMSYS_SW0_RST_B_FAKE_ENG		9
+#define MT8167_MMSYS_SW0_RST_B_MUTEX		10
+#define MT8167_MMSYS_SW0_RST_B_DISP_OVL0	11
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA0	12
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA1	13
+#define MT8167_MMSYS_SW0_RST_B_DISP_WDMA0	14
+#define MT8167_MMSYS_SW0_RST_B_DISP_COLOR	15
+#define MT8167_MMSYS_SW0_RST_B_DISP_CCORR	16
+#define MT8167_MMSYS_SW0_RST_B_DISP_AAL		17
+#define MT8167_MMSYS_SW0_RST_B_DISP_GAMMA	18
+#define MT8167_MMSYS_SW0_RST_B_DISP_DITHER	19
+#define MT8167_MMSYS_SW0_RST_B_DISP_UFOE	20
+#define MT8167_MMSYS_SW0_RST_B_DISP_PWM		21
+#define MT8167_MMSYS_SW0_RST_B_DSI0		22
+#define MT8167_MMSYS_SW0_RST_B_DPI0		23
+#define MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG	24
+#define MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER	25
+#define MT8167_MMSYS_SW1_RST_B_DPI1		26
+#define MT8167_MMSYS_SW1_RST_B_HDMI		27
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */
-- 
2.43.0

