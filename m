Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7953A42D754
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301311; cv=none; b=Iow+dYT+dORjgcuKNISND32eBGZJ4nLBbZjq2s8QxSLodAUqR7Nsj0aQOMcZqIu0nij4NZBgne9kpz7PEw6RlsvqUprrVKUx4CW/fGgQ2GnupiM686NLe++IOI46Q44zhRUNv7EnOTQUCyYAPrEo0N4w/kwRBpJTANv48adlMJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301311; c=relaxed/simple;
	bh=azANXe+5M9L9zSq3Q+0m8DIbeD+viIH7/dL+bU2mmzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBFVE/N65fBx1qAuFNOBOQZojqQga82cNjKKgESL1U/hRPnngvx6fllt+X3qskQlIRho1p0DCg2j3SBl52fR7YDKecuGlYHVLE4LkYVHZrPDqaHdbgFPbTsKTImnwBa7x2XydDu/fx/LIZwgoBUKEUcduQyImYnYF9I0F5ECG1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FD5iN7wG; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD5iN7wG"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69e08ad526cso4284504a12.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301308; x=1784906108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=;
        b=FD5iN7wGiEcdLFoz6N7kAKM19W+DjvH6Cn32TiqS8a00Wfvl0jflrs5q7MuQjUiOLJ
         27cEalQ0M2sY/bdWhTgBbFHLANi6QP8DmFnHnvRAK5WTOVZXRTWkFZTXKr7O/bJhrrdB
         GSkET8JhID9wa42UcGzR3r11+IC3Rb2uZZ8gBc7EPK7LkfdXGoMKBHf2NIjd+3eAbQTg
         2yEAclh/mEJHQXnCuWhR6kGGyGZilrCaz8TwNkljPCFpmAGKIql+8xNWWap4MtJNB4PP
         mZgheo3mRbEv5JGMVSbJBEwai5DYBPWqXvqDFbII0KKl99tHWYdNx2kBBGI2A8yKxnmD
         vUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301308; x=1784906108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=;
        b=Z1eJICrMoNvve/YAqM5R+B5lQVo8WV+jdrF4UtKn3B+pFq0mdzgwZ4yhg11nQLX/Cu
         8jjk0IrRV7RJzf26pRn2lm7fDT0PqRNvibxVwJ7Q9PnKFldnCnsKLZDqT58aq11EOnoN
         rP8J/7IyGHqcXgY0thJBR0mNnUd8d5KEDH8/0As1ez5EvTLtViWbMfYwd+5/hGIV/jtQ
         zZBby7Ei3dJvG3YBpB9h2/MHobWVZJoIOtUlnibRunAxqQm+MC9qtBZZw8X2NQqAvfQ5
         Qq8b1HTsO+nLg0VbNIDClK1pK867biUV46TttkzDtldT1zqW5zlNUWc6fBnZAdPrhE4t
         d1nQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyLfiHn0TmzyCAXfBJDvpHIfO6tyEaryeUcAU1UVhREeQkH0HkcOIqyLnEAsJ56NnOW4zM4xd/hIa8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8YDI82oaliM1Z4bqbrxNla3lOD4kxXjhu1o8t8YKIw3NOFmFA
	pBpxt2/nSA75pjR51NdFxxAfjTCb6sWpGxQ5OhoHPKq1Hw3nM5AjpRyp
X-Gm-Gg: AfdE7cli1tRJvc69CRrOgcW+iz2SLIqfznvdsmuEobXykP1U9xzH290WgrfMsubdpSF
	MvDhr60MhQeNNKhrvIwIexSVzh6M563m7B2aidaT22VZR6NK0lNl/e2Z67kv/1UwhmVjPWxTJDp
	WOlUfpXnrOsQL2n03pTp3U4aMARklV8FfLD0ur+SYlFlHwI9hzN9hxjU3ztBsn9arTpCHQaaTze
	h8ZF3bNyT8NKRgKITZGZbPl3zVOZzPdweDIgrnGKR0vzItPBwNKP0vQWEa89W1Rq9p8as1Z83lx
	mAiG4yNm7er8I6clHhTY41KIuAoOYmOyZw2St3fKJxNC+461HuvzyqpiBvuhGcZRFZPkKlcAA7z
	2SEPP8l97mPfYNOE80eHkMU08qt4uivgM4TuXfkJ1UBkefqE75CrPAX8+p8B0ABFdIcrhCj/+oA
	==
X-Received: by 2002:a05:6402:3554:b0:69e:35ae:8af9 with SMTP id 4fb4d7f45d1cf-69e65272664mr1237776a12.14.1784301307558;
        Fri, 17 Jul 2026 08:15:07 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:07 -0700 (PDT)
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
Subject: [PATCH 4/7] dt-bindings: reset: Add reset controller constants for mt8167
Date: Fri, 17 Jul 2026 17:11:11 +0200
Message-ID: <20260717151134.678839-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
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

