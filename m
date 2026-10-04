Received: from mail-ua2-f41.google.com (mail-ua2-f41.google.com [74.125.226.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B259D43F8C9
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116389; cv=none; b=OksPRpOO/yX9Nr7D4FCdtgXDoXL12QbqTOouGHbZW+zuPJ1ofyhdbGFE/H23/2K55NtvSbr8dHfzsNU5q0BUhATXm77zBaeM93ptA3OjqphfkE5oxHJOjR6/pAmbFdtML0ggQRmKtotqcBYXUfr9Je9v7S9UvwdHUfdA4YIj2Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116389; c=relaxed/simple;
	bh=FsKnLSE/pW8xRGPlzKiDk5/W7dq7hM9JvQWcRfmVQpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lG5XbInLiTwiE6bgZdbFC0Prbus3qAJYYhlh2GnAby3p6qWphB6YSmJOb/KFdRPMk0QoqzlcSRWlktervd/OwfXlAtBsYoIvx4/UT0mKlFEy6p2bdUl78sJY19yu7yXTnrAGW1+PFWypaegNmoS5rwPMz5vStjlDAdHAy73eqzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9W004Mw; arc=none smtp.client-ip=74.125.226.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9W004Mw"
Received: by mail-ua2-f41.google.com with SMTP id a1e0cc1a2514c-98c54a0acdbso101974241.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791116385; x=1791721185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/CoubgPTdFpizEolPCPsMjR+glD3shZDgbgtoJ9Xu4=;
        b=C9W004MwP5b5LHk23LhwkkZHxrjWpLqTK1VuvCIMQ6QWc2NsRa2IzMDGsc255Xv1FP
         bqWScFyMCAynJXr2CiubP338XBXG8poxbdePOXZIEFe89Mx9XLksLAh4GMrDtdi8crXi
         KiDNK3xtsjA6Wru9bNwPkgdnuDFUo0AodtZmW23EhF5Fi/2jdUo+LxT2NYVINnYNJIyT
         NjxHQDd3+M2hg1CDCQi3vF/0yqMuPnX4KNSd0VjulH1aAKWXZa40jCWqa0bM5UV6hC3O
         MAidfrJukrrIlTVy1JKm3z8unVRkXKQ4JztoacUIBEtZh23h3UP9zqc//th55C0edtq2
         GMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116385; x=1791721185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/CoubgPTdFpizEolPCPsMjR+glD3shZDgbgtoJ9Xu4=;
        b=zul1b/Dl34uqo7ZNF0i0RIvbTxNuiRtNIJ+bWiysRXG5f57Psqusp7Cgfh1ijMn6po
         liIEg6CmOQM4oVvzBdOrACQrNLrnR0bEha1ARYY3NLOAsRjfe9YyLlVpgJGVw9zX04h+
         U6MvpWrPc4OlzG706ynx0cuWggGe2GCbe3CVlxfgxyzHIjjdTXRioHjLo1QYafI4Wbja
         HALilxQhMdJ4RNCmQLTlorHyCpI9SrN71jhImZOpiLOheekydIAw/2RX17fLcuoMEX6J
         swi26YHbwUkXOBOsUkKOl5o1jazfABhNtHkRJxRfjRoQ+iNz0hAwi35vOUP6uLlUfIbl
         WOEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwDxDFXBhUhzvEklT7MFp7UVF9L490VAksSzb+M7Cr9m+mX8i5VEAY22l26fC65iLp7Hez1rHNj5p+@vger.kernel.org
X-Gm-Message-State: AFq9FYKKmAbBC/xbB43GcGXvkKBCrPtXlJll2y/ej6D6Hj+KD+9b3tSu
	0FBXXED57ZFr/T26UntLR5l6dkl2/E+MUkGEVn394hWgO5TwFsuwoMaM
X-Gm-Gg: AYBFou1tHVvg34DCnaVhRdfG6HlnP7AzPSBVoBB3frWAl1pwfxpTMcXDI+EJ9d4MN+0
	j/Hg45jDLYyuv6xlvv1kgYgwtNVZ91FTKbPbxw8vQkTIfC3lnQ7pcaEMXUuCDnc5qMB3JhBYQOh
	PCYLjBoYTuNOA3fTSoiXDiFqawAC3bJAyEEpXQVAlhyns5QfecoS3b6SVgfnR/VgGdD0O3XswQ1
	g8031NyYrbp2T0rohUHvNEXmKnv6eYUZeJkOJ3fUG2kD9bxXEMiOV7NxuK9Coo8AW15j/nWaNzw
	Uf60/jb6Ggs0LAAXWm+7Rl92MtXDFHMt7Ym9ODYpuzO4nxPEW8kz8DnaoVoYdqHtRwGNwz7A3Do
	iZgxSjBF+5q8mKNNoFBuYQQbzBB1m1D5n0MOsPdqR9XKgwifO+HBRZfLc9uF7CGNYHXMn4rGtwp
	t2gz9qJ413WiQf1hEVpdUvmQ+O85aMvla6i04c/kj42pR/KPImhmwgcoE8bPD8g7mmHEisetV4W
	/I13+iOVAufg0AZjX7AjRiQwyLJ5RIHb4Wo2xA3nykUjxoAe245M4H4Fg==
X-Received: by 2002:a05:6102:80a5:b0:7c1:c1fa:f3e9 with SMTP id ada2fe7eead31-7c1c1fafb0dmr1213988137.22.1791116384857;
        Sun, 04 Oct 2026 05:19:44 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:1d37:6d7:739d:9d6d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98b2f115fc9sm7780464241.10.2026.10.04.05.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:19:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3 2/2] media: rc: Add keymap for Ruwido Z3 RC-34 remote
Date: Sun,  4 Oct 2026 09:19:31 -0300
Message-ID: <20261004121931.6746-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004121931.6746-1-festevam@gmail.com>
References: <20261004121931.6746-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

Add keymap for the Ruwido Z3 RC-34 remote control.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v2:
- None.

Changes since v1:
- Use RC_PROTO_NECX. (Sean)
- Use media prefix in the Subject.

 drivers/media/rc/keymaps/Makefile             |  1 +
 .../media/rc/keymaps/rc-nec-ruwido-z3-rc34.c  | 80 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 3 files changed, 82 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 38b84e34b225..525d203c0a94 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_RC_MAP) += \
 			rc-msi-tvanywhere-plus.o \
 			rc-mygica-utv3.o \
 			rc-nebula.o \
+			rc-nec-ruwido-z3-rc34.o \
 			rc-nec-terratec-cinergy-xs.o \
 			rc-norwood.o \
 			rc-npgtech.o \
diff --git a/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
new file mode 100644
index 000000000000..8a090772446d
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Keytable for the Ruwido Z3 RC-34 remote
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+static struct rc_map_table nec_ruwido_z3_rc34[] = {
+	/* Ruwido Z3 RC-34, NECX address 0xe310 */
+	{ 0xe3100f, KEY_POWER },
+	{ 0xe31016, KEY_MENU },
+	{ 0xe3100a, KEY_UP },
+	{ 0xe3100b, KEY_DOWN },
+	{ 0xe3100d, KEY_LEFT },
+	{ 0xe3100c, KEY_RIGHT },
+	{ 0xe31019, KEY_OK },
+	{ 0xe3106a, KEY_BACK },
+	{ 0xe31033, KEY_INFO },
+	{ 0xe31066, KEY_DISPLAYTOGGLE },
+	{ 0xe3101a, KEY_VOLUMEUP },
+	{ 0xe31010, KEY_VOLUMEDOWN },
+	{ 0xe31013, KEY_MUTE },
+	{ 0xe31032, KEY_CHANNELUP },
+	{ 0xe31031, KEY_CHANNELDOWN },
+	{ 0xe31069, KEY_HP },
+	{ 0xe31000, KEY_NUMERIC_1 },
+	{ 0xe31001, KEY_NUMERIC_2 },
+	{ 0xe31002, KEY_NUMERIC_3 },
+	{ 0xe31003, KEY_NUMERIC_4 },
+	{ 0xe31004, KEY_NUMERIC_5 },
+	{ 0xe31005, KEY_NUMERIC_6 },
+	{ 0xe31006, KEY_NUMERIC_7 },
+	{ 0xe31007, KEY_NUMERIC_8 },
+	{ 0xe31008, KEY_NUMERIC_9 },
+	{ 0xe31030, KEY_NUMERIC_0 },
+	{ 0xe31065, KEY_RED },
+	{ 0xe31063, KEY_GREEN },
+	{ 0xe31064, KEY_YELLOW },
+	{ 0xe3106b, KEY_OPTION },
+	{ 0xe31050, KEY_PLAY },
+	{ 0xe31057, KEY_REWIND },
+	{ 0xe31058, KEY_FASTFORWARD },
+	{ 0xe31060, KEY_PROG1 },
+	{ 0xe31061, KEY_PROG2 },
+	{ 0xe31062, KEY_PROG3 },
+
+	/* RC-34 remote volume keys */
+	{ 0x3506, KEY_VOLUMEUP },
+	{ 0x3507, KEY_VOLUMEDOWN },
+
+	/* McIntosh HR070 remote volume keys */
+	{ 0xca5542, KEY_VOLUMEUP },
+	{ 0xca5543, KEY_VOLUMEDOWN },
+};
+
+static struct rc_map_list nec_ruwido_z3_rc34_map = {
+	.map = {
+		.scan     = nec_ruwido_z3_rc34,
+		.size     = ARRAY_SIZE(nec_ruwido_z3_rc34),
+		.rc_proto = RC_PROTO_NECX,
+		.name     = RC_MAP_NEC_RUWIDO_Z3_RC34,
+	}
+};
+
+static int __init init_rc_map_nec_ruwido_z3_rc34(void)
+{
+	return rc_map_register(&nec_ruwido_z3_rc34_map);
+}
+
+static void __exit exit_rc_map_nec_ruwido_z3_rc34(void)
+{
+	rc_map_unregister(&nec_ruwido_z3_rc34_map);
+}
+
+module_init(init_rc_map_nec_ruwido_z3_rc34)
+module_exit(exit_rc_map_nec_ruwido_z3_rc34)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Fabio Estevam <festevam@gmail.com>");
+MODULE_DESCRIPTION("Ruwido Z3 RC-34 remote keytable");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index f167c37179c8..290919a7247e 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -289,6 +289,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_MSI_TVANYWHERE_PLUS       "rc-msi-tvanywhere-plus"
 #define RC_MAP_MYGICA_UTV3               "rc-mygica-utv3"
 #define RC_MAP_NEBULA                    "rc-nebula"
+#define RC_MAP_NEC_RUWIDO_Z3_RC34        "rc-nec-ruwido-z3-rc34"
 #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
 #define RC_MAP_NORWOOD                   "rc-norwood"
 #define RC_MAP_NPGTECH                   "rc-npgtech"
-- 
2.43.0

