Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799943D75A0
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 16:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786291638; cv=none; b=Bm3pF48kh/7AkSrIGhmXE7nTM4EaUg2U0oDwG7rEa5kEjx9kKW50sp04obKaWVNWsuq3sANcuc5aswnGkJ8icr4W+sB3sagK/l3jadrsWrq0sFk/OM5RWrzOyAC1A1JBqpAw1Yd1/cIC8+0Y4AA+elNaLRVe8iexGyJlrj+fqE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786291638; c=relaxed/simple;
	bh=9nu/QEz0htkteVglOdDci04v7dWi7DMelnlz797it3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ky/oiWJ7oImXEHSdpy5JRJVE0fU+ZAAjz/zaA92Zi0uMcdUuJtqfJFalTTKuOQHn3XygqMn8G9ec5N3yjiorDiY2XojMydyA2aymFAdOqCMSGdtH8j+iMTq3EoJz3fv0+SLib5fVp+gD6DDe+M6fVcjS9QysTUIbyiDxMQ9mCJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pk8eEwgu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pk8eEwgu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4980dc26022so10693865e9.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291635; x=1786896435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wErQbK67MOBFR4/JN7+7YvsDPOMtcfPX3LQkR2UcRJE=;
        b=pk8eEwgu1GyuiiDcHT51i24qOYUND5Vch/PxKtDbYismZihg1sP8fJ6CBKeC+rlpJ6
         TKdiP6g7go7h9gcwsKXlUzRhx2HKXFDK/A0OLnARX89prBn5q48YG5GyE/xFosDKDR4/
         Z9SKl8owKh49Qj3CAnHUKOHxRnlwdBkP62AESb2GPMeYHeVS3pDxfPq2xtPo3rlW5aXE
         t3BhH2A1iWLtA8OF+pC4s1735QqqyU0Pe2bFlO2t9ehk0pIH+tw98Y7+aqmSQKp3KGML
         vm7yz4fKIIH0f/RLweAx1Z59rLSYFn9PL+aFP+f2kQwZiTPdQIGmIeG8r5D0Z6I5v8Ux
         YhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291635; x=1786896435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wErQbK67MOBFR4/JN7+7YvsDPOMtcfPX3LQkR2UcRJE=;
        b=VNvd/gFm5C+qBJP3tGUrsLGkZS3jjwQ8UlL/j1+2B6MddCnm7P/VcXoaCylcDPNh9P
         VC/zGmR9Lr/Ck+mlnE/EwGMlaHTF8XsMRCYG9ev7EYeGtjoBq5/HEsq70E4fW7lVJ/Aq
         bO4ar/OgRPeYIhsAwSvu7b19cHhQD+tvqZwLgBlXY0H+X11vD3T+NqaKb57/ycflzR7A
         FY76BobM8L/W7h6y6WQKiu7XSIKx+YApCm1KSnea4GMLSmd9b7JLvRbqkyDVvxbhZl88
         D5WXH0zMOMduVU1bdn049drGAW3ytygauxRoSY9ybqZLiQOQKzI0NNFsdd6YUvtyfdtD
         X/ew==
X-Forwarded-Encrypted: i=1; AHgh+RprxGydOXvEY1GTTiDzqHIYPNjhFZ+QsGbhoLd14wFaxukZwcrEcMni0UGJinphAY/MKZ6t546DIF8t@vger.kernel.org
X-Gm-Message-State: AOJu0YyR38n0tUsgHrrxfcuLo/pWjIPjRtHHiiFAHYPv6u8p3X/a5nNd
	Bj5CzXDsME3mNyin/oCrhp0Y5lpWnE5wxariN5TZghw2IUDH9VhSHI0z
X-Gm-Gg: AR+sD12abD+uZqG7kkywily7d5xHCgI76PnCamLzt7CdM6HosuQBhYcBj7wLdAdtOjx
	AMPXee1jaKgankaMUotXAiIQNuBDlvQEc5tKhmJF0aadtTCMowrQP9N3Va72E437oKo7+h0VoTS
	9bVjYD8vPnBsckLBi5o5IXbfO3iO4Wgx4ionR7o14/XTTfedyZeXbb2IX3TtHwvpbMW7k2GJyJp
	3HubDHzVeZua5oYLq5fKKSO3lzlbHBbXpOIv7YOGyo9heU2GEoOT1qt0GhKxAqilMjEHyoTeqdH
	+NO61pXThttPyGeCQUeVXSUYxexrzeDIx+c1K0QA3KwQ928rZ/8yq63DvkbGJV9fMhEl7DWJNcd
	2m1g7ds6MXCyscfhnoDVoBVILGJY7gkuHFHVIJ2LSQKkt9kaLytjEBiYsRgVrQQdM37nWfujzm6
	yetBJf9YMpUwIY5KyjTjyCOrsz0mFIfZmfP3/YyaUHOEPgmkDeNLnGHA==
X-Received: by 2002:a05:600c:48aa:b0:498:ff3:71ed with SMTP id 5b1f17b1804b1-4994e7e6e99mr318069915e9.17.1786291634595;
        Sun, 09 Aug 2026 09:07:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:14 -0700 (PDT)
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
Subject: [PATCH v3 5/8] dt-bindings: reset: Add reset controller constants for mt8167
Date: Sun,  9 Aug 2026 18:03:29 +0200
Message-ID: <20260809160643.33991-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
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
index 000000000000..af8a3e499f8b
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
+/* The data sheet describes bit 9 as "reserved, unused" */
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

