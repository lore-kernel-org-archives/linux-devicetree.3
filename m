Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912240;
	b=om29g5MOjLRWm6DNxbbnJu5Jo9u1UGQoFXh1ENcpjiU+OQcr8RiSCqLKQcto3NOaq9Tx
	 7NWtMqGWsB+uHG87br19KCEBqeyi/n+BXRxTEjh3rI2vHJ8C8WJ+Tqe8udeKpsCmnylAc
	 yxU53Y/fXuyRjb4qrJTk8Fe9oYWChbBJyUBJLuuM0T6/PGXGeDFMQTlVBUhsrQ1tCIPNa
	 IL0nFfaez9CrWl48/caTzOTvWXDMr/iHF4zZYedE+ZWEjQ5CSlJxZe0J0qOYmUUo17x8y
	 SS0QlyU9ebJWZFWlMyDW0TaB9eOrL8V1xdMoRnyCH7FlNhF5E7qBcbwnDSqV8uC7W7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YwpqfN8lJu8asLWP5aaIGvd4SFUE7wK2TlSTg22KEc8=;
	b=FY2JhfAP//3FoMwLgkdDZhZlByeXCzdIcfYZgWMUzEXKO3K23q+7qoBJLeu3GvmL82l2
	 IwINA+3M7/bNqfxXcTTTjOJ1AgWicd56y1Nqkc5DreZQcLi//qyaSJNmUIhHekttX4JBa
	 3t8zm96nIOaOve5wfUc1pJybXbfxam7lr6z6AVhclng4W3UwdCIFrnfhykUJa+0MD5kXb
	 +fc0wuDTckRmSuWwmUYH5hQnRtX+VO7lAZW7xVQ30wQKWOMVZ8qE6FLETJQVyC+wsqML6
	 3x9w8LkUnx1AuPlNxkU7d1g5p3Y4K0h1Yhsl8Tk5aLWfkD5g4X5uJHlOgvrKoRizq1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nrYm8E5C;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE64606A894
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE64606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nrYm8E5C
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so20159165e9.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912238; x=1795517038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwpqfN8lJu8asLWP5aaIGvd4SFUE7wK2TlSTg22KEc8=;
        b=nrYm8E5CEEDa4Bm+kq4nu1wpOkgAc/F9LT+8hzJqusSmk03reneXmb2S2Y73wCs5W6
         W2+FcuHh2jICFn54lc22fr1g+kRxWeQHZwmiqNSSlUy+lEGc0Im9fo/ii56A/eh0MXz2
         oVckHtvG7q3c0dolDxh7NgSmNBKOSYWCiJgxi8qMPMA7K/pRYYM6/L4hSMcfvFa9FnjG
         91r3XwjGcqca4+whc2KWkNXWRPwQEWseVaioLsj8KEW5Oj5j/ZKo6M7Jy7O1oaZ/hPuT
         DnaO5+IovLGQyU3pe0vjSxUKXEG/rCr2tNwIwJ2Ik7ygj7XimHv9+FNDbszX18JKBtOT
         Fnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912238; x=1795517038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwpqfN8lJu8asLWP5aaIGvd4SFUE7wK2TlSTg22KEc8=;
        b=TvSwD4HvrEdA99vNyUAEqGJkJg0Vuys+ln/Jc1fcm2/4YCBz32JgWLuRxbADdon+g0
         jSbKvTEYgSJVsBAyYZljETd9QbV+Ldv6StdQiy4o3VAYWFOYxvMRudvpCurx9ExV0ZEx
         qm1aydEgMKHoeIa+UG6gIh9sbOisfwopkZRB9D03R7Ycgbb926m7gDvFsE9KYIx9ght8
         MQ+Tp+0ZaNBfF2ma5QQPTRFGFdyDPBLLwwzXJemirvtPCGGSHOI/7Z5MqnzUz4I+P/v4
         KvK6WUYMEoeXGQHnL6EznvNpASuuNuooMeQqKYJAPk8q5gax/jbKg8tynJDUoizY9Adm
         rqug==
X-Forwarded-Encrypted: i=1; AL+hErGYbKw0DscEVi5SNePvKrbDoRMEimQh423he/EdLcbUg4u1NJB3uWwoU9sCukyxw18Xkk4knqe1LtC+@vger.kernel.org
X-Gm-Message-State: APuU4Z9NlEm2Gk5fwrCWubMIGqi765Tv0zJrtXr2xOccx9FC6lBOOJj8
	sdUYuudVSFtkFkRoRn7phCykcElOHVlmn8gzrNZ5SPl1zDzUHhbOVOne
X-Gm-Gg: AYBFou3E3OzkZFbDtdKULDWahoT3C6qPbPzobyK2raXYHCgZDSiJJ/orRmorlmVORML
	oae8j/nkDw0y0krYI6xJVQN7sPBJhRIOfn6omWKiH0xCE4SZrHm2+ZwsxTBW/asGVfTF8Ixgd+v
	+Rdw8FvA26aIM+8iLZM1Pk2mscbnm68HDOI8q7Qz3yfwMlqSnzRZ5UfSJdDLNCBJw/jxmwKpurT
	u4c9EqYvVeOePk3OiHr/c3TZ/3ApGImNC3GHZ0GyIwIDzI1kDeNfUOKnRuxj8UMshXJLnDzH/dl
	8AMsKLwqagW/4Pp3LdBz+/Yp4Du0tDGS+rQ8GO847Fy7yH1ka30cARZaJhv4yrBZghZVAtWVAaP
	Fj9UdNZ5zU4mxCM8+OUdn+S+jT8504195VnbS0rdcW3Fz75qpssdXnNvirnWVt31zDVS2yijwDH
	YyuMJcRdEq6mB2rJdbJa/O/tVMCFZRHJbakCBZcHrJO4Ai5gtLeAerbEvYkao6jB0bxxFYI9UyA
	BcK872pFajTe9Bo2EgzccC+99VAlMszUI+24oJlXKbV/3Tl7Od0WyZ4gQtY43APnTxUbChy/lDK
	N18VzFGPBdAF
X-Received: by 2002:a05:600c:6099:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb55a753f8mr256550145e9.18.1794912238087;
        Tue, 17 Nov 2026 02:43:58 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm104578445e9.3.2026.11.17.02.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:43:57 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v2 2/2] drm/panel: novatek-nt36525: fix v1 review issues
Date: Tue, 17 Nov 2026 13:43:53 +0300
Message-ID: <20261117104353.1180634-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117104353.1180634-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
 <20261117104353.1180634-1-tadilhusrev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Addresses the issues Sashiko AI flagged on v1
(https://sashiko.dev/#/patchset/20261116070212.314228-1-tadilhusrev@gmail.com?part=2):

- Set prepare_prev_first = true before drm_panel_add(). Without it,
  drm_atomic_bridge_chain_pre_enable()/post_disable() call this panel's
  prepare()/unprepare() on the wrong side of the DSI host bridge's own
  enable/disable, which host_transfer() rejects on bridge-based hosts
  (e.g. samsung-dsim).
- Fix the reset_gpio polarity: the driver drove the physical level
  directly instead of using gpiod logical values, which inverts under
  the GPIO_ACTIVE_LOW DT flag added in the matching binding patch.
  RESX is active-low (the 1-0-1 physical pulse the vendor sequence
  describes); switch the DT flag and all gpiod_set_value_cansleep()/
  devm_gpiod_get() calls to logical values with the same physical
  outcome.
- Request the "vpos" and "vneg" regulators the driver already needed
  (matching the binding fix) so dtbs_check and probe agree.
- Use drm_connector_helper_get_modes_fixed() in nt36525_get_modes()
  instead of open-coding drm_mode_duplicate() + drm_mode_set_name() +
  manual display_info updates and returning -ENOMEM on failure (which
  drm_helper_probe_get_modes() logs as an error; the helper returns 0
  instead).
- Rename the compatible string to novatek,nt36525-xcover5, matching
  the fixed binding; the old samsung,xcover5-nt36525 never matched
  this driver's of_match_table.

Tested on a Samsung Galaxy XCover5 running 7.4-rc1 plus this driver
and the matching DTS/binding fixes: debugfs now reports the reset gpio
as ACTIVE LOW, and the DSI panel connector probes and reports
"connected".

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt36525.c | 419 +++++++++++++-----
 1 file changed, 306 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36525.c b/drivers/gpu/drm/panel/panel-novatek-nt36525.c
index d6d805791..ba3e003e6 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36525.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36525.c
@@ -1,21 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Novatek NT36525 MIPI DSI panel driver — Samsung Galaxy XCover5
+ * Novatek NT36525 MIPI DSI panel driver for the Samsung Galaxy XCover5
  *
- * Panel timing + DCS init stream from Samsung GPL kernel
- * (SM-G525F_EUR_14/kernel/drivers/video/fbdev/exynos/panel/nt36525/
- *  nt36525_xcover5_panel.h) — 207 packets, 220 ordered steps.
- *
- * The DCS table is included from "panel-novatek-nt36525-init.h", which
- * is generated from Samsung's header (see scripts/panel/gen-nt36525.py
- * in the project tree; the lab tree ships the generated file at
- *   drivers/gpu/drm/panel/panel-novatek-nt36525-init.h).
+ * Panel timing and the DCS initialisation sequence are taken from the
+ * Samsung GPL kernel release for the SM-G525F
+ * (drivers/video/fbdev/exynos/panel/nt36525/nt36525_xcover5_panel.h).
  */
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/regulator/consumer.h>
 
 #include <video/mipi_display.h>
@@ -23,27 +18,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
-
-enum nt36525_cmd_type {
-	INIT_DCS,
-	INIT_DELAY,
-};
-
-struct nt36525_init_cmd {
-	enum nt36525_cmd_type type;
-	union {
-		struct { const u8 *data; size_t len; };
-		unsigned int delay_ms;
-	};
-};
-
-/* Convenience constructors so the generated table reads clean. */
-#define DCS(buf) { .type = INIT_DCS, .data = (buf), .len = ARRAY_SIZE(buf) }
-#define DLY(ms)  { .type = INIT_DELAY, .delay_ms = (ms) }
-
-/* 207 packet arrays + 220-step init table. Generated from Samsung GPL
- * header. Kept in a separate .h so this .c stays focused on logic. */
-#include "panel-novatek-nt36525-init.h"
+#include <drm/drm_probe_helper.h>
 
 struct nt36525 {
 	struct drm_panel panel;
@@ -51,7 +26,7 @@ struct nt36525 {
 	struct regulator *vdd;		/* vdd_ldo28, 1.8 V */
 	struct regulator *vpos;		/* LCD positive bias */
 	struct regulator *vneg;		/* LCD negative bias */
-	struct gpio_desc *reset_gpio;	/* panel RESX, active-high per Samsung */
+	struct gpio_desc *reset_gpio;	/* panel RESX, active-low; gpiod value 1 = asserted */
 };
 
 static inline struct nt36525 *panel_to_nt36525(struct drm_panel *p)
@@ -75,29 +50,263 @@ static const struct drm_display_mode nt36525_xcover5_mode = {
 	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
-static int nt36525_send(struct nt36525 *p, const struct nt36525_init_cmd *cmd)
+static int nt36525_on(struct nt36525 *p)
 {
-	ssize_t ret;
-
-	if (cmd->type == INIT_DELAY) {
-		msleep(cmd->delay_ms);
-		return 0;
-	}
-	ret = mipi_dsi_dcs_write_buffer(p->dsi, cmd->data, cmd->len);
-	if (ret < 0) {
-		dev_err(&p->dsi->dev, "DCS write failed: %zd (first byte 0x%02x)\n",
-			ret, cmd->data[0]);
-		return ret;
-	}
-	return 0;
+	struct mipi_dsi_multi_context ctx = { .dsi = p->dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x20);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0e, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0f, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x94, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x95, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x96, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x24);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0a, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0b, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0c, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0d, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0f, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1a, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1c, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1e, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2f, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3a, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3d, 0x92);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4d, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4e, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x52, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5a, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5b, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5c, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5d, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x72);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x83, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x85, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x86, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x93, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x94, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xab, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xac, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xad, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xaf, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0xb5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x25);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0a, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0b, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5a, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5b, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5d, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0xb5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xca, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xcc, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd3, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd4, 0xc8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd5, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd6, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd7, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x26);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x27);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0xb4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1f, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc1, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc2, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc3, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc4, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc6, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc7, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x23);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0xa6);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0xfc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1e, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1f, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0xfc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0xfb);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0xf9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0xf7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0xf3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3a, 0xea);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0xe6);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3d, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3f, 0xdd);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0xdb);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x20);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00, 0x08, 0x00, 0x18, 0x00, 0x34, 0x00, 0x4c,
+				     0x00, 0x61, 0x00, 0x74, 0x00, 0x86, 0x00, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x00, 0xa5, 0x00, 0xdb, 0x01, 0x02, 0x01, 0x43,
+				     0x01, 0x71, 0x01, 0xbd, 0x01, 0xf7, 0x01, 0xfa);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb2, 0x02, 0x34, 0x02, 0x6f, 0x02, 0x98, 0x02, 0xcc,
+				     0x02, 0xf1, 0x03, 0x1d, 0x03, 0x2d, 0x03, 0x3b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb3, 0x03, 0x4d, 0x03, 0x60, 0x03, 0x7a, 0x03, 0x94,
+				     0x03, 0xa6, 0x03, 0xa7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb4, 0x00, 0x08, 0x00, 0x18, 0x00, 0x34, 0x00, 0x4c,
+				     0x00, 0x61, 0x00, 0x74, 0x00, 0x86, 0x00, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5, 0x00, 0xa5, 0x00, 0xdb, 0x01, 0x02, 0x01, 0x43,
+				     0x01, 0x71, 0x01, 0xbd, 0x01, 0xf7, 0x01, 0xfa);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x02, 0x34, 0x02, 0x6f, 0x02, 0x98, 0x02, 0xcc,
+				     0x02, 0xf1, 0x03, 0x1d, 0x03, 0x2d, 0x03, 0x3b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb7, 0x03, 0x4d, 0x03, 0x60, 0x03, 0x7a, 0x03, 0x94,
+				     0x03, 0xa6, 0x03, 0xa7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb8, 0x00, 0x08, 0x00, 0x18, 0x00, 0x34, 0x00, 0x4c,
+				     0x00, 0x61, 0x00, 0x74, 0x00, 0x86, 0x00, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9, 0x00, 0xa5, 0x00, 0xdb, 0x01, 0x02, 0x01, 0x43,
+				     0x01, 0x71, 0x01, 0xbd, 0x01, 0xf7, 0x01, 0xfa);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x02, 0x34, 0x02, 0x6f, 0x02, 0x98, 0x02, 0xcc,
+				     0x02, 0xf1, 0x03, 0x1d, 0x03, 0x2d, 0x03, 0x3b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbb, 0x03, 0x4d, 0x03, 0x60, 0x03, 0x7a, 0x03, 0x94,
+				     0x03, 0xa6, 0x03, 0xa7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x21);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00, 0x00, 0x00, 0x10, 0x00, 0x2c, 0x00, 0x44,
+				     0x00, 0x59, 0x00, 0x6c, 0x00, 0x7e, 0x00, 0x8e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x00, 0x9d, 0x00, 0xd3, 0x00, 0xfa, 0x01, 0x3b,
+				     0x01, 0x69, 0x01, 0xb5, 0x01, 0xef, 0x01, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb2, 0x02, 0x2c, 0x02, 0x79, 0x02, 0xaa, 0x02, 0xe6,
+				     0x03, 0x0f, 0x03, 0x3f, 0x03, 0x4f, 0x03, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb3, 0x03, 0x71, 0x03, 0x86, 0x03, 0xa0, 0x03, 0xbc,
+				     0x03, 0xce, 0x03, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb4, 0x00, 0x00, 0x00, 0x10, 0x00, 0x2c, 0x00, 0x44,
+				     0x00, 0x59, 0x00, 0x6c, 0x00, 0x7e, 0x00, 0x8e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5, 0x00, 0x9d, 0x00, 0xd3, 0x00, 0xfa, 0x01, 0x3b,
+				     0x01, 0x69, 0x01, 0xb5, 0x01, 0xef, 0x01, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x02, 0x2c, 0x02, 0x79, 0x02, 0xaa, 0x02, 0xe6,
+				     0x03, 0x0f, 0x03, 0x3f, 0x03, 0x4f, 0x03, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb7, 0x03, 0x71, 0x03, 0x86, 0x03, 0xa0, 0x03, 0xbc,
+				     0x03, 0xce, 0x03, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb8, 0x00, 0x00, 0x00, 0x10, 0x00, 0x2c, 0x00, 0x44,
+				     0x00, 0x59, 0x00, 0x6c, 0x00, 0x7e, 0x00, 0x8e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9, 0x00, 0x9d, 0x00, 0xd3, 0x00, 0xfa, 0x01, 0x3b,
+				     0x01, 0x69, 0x01, 0xb5, 0x01, 0xef, 0x01, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x02, 0x2c, 0x02, 0x79, 0x02, 0xaa, 0x02, 0xe6,
+				     0x03, 0x0f, 0x03, 0x3f, 0x03, 0x4f, 0x03, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbb, 0x03, 0x71, 0x03, 0x86, 0x03, 0xa0, 0x03, 0xbc,
+				     0x03, 0xce, 0x03, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0xd0);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x10);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x0f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x00, 0x01);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 100);
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+
+	return ctx.accum_err;
 }
 
 static int nt36525_prepare(struct drm_panel *panel)
 {
 	struct nt36525 *p = panel_to_nt36525(panel);
-	int ret, i;
+	int ret;
 
-	dev_info(&p->dsi->dev, "MODESET panel: prepare enter (power+reset+207 DCS)\n");
 	/* Power-up sequence from Samsung decon_board_nt36525 panel_power_enable */
 	ret = regulator_enable(p->vdd);
 	if (ret)
@@ -112,35 +321,27 @@ static int nt36525_prepare(struct drm_panel *panel)
 		goto disable_vpos;
 	usleep_range(1000, 1500);
 
-	/* Reset pulse — Samsung sequence from panel_reset */
+	/*
+	 * Reset pulse, Samsung sequence from panel_reset. Logical values are
+	 * inverted from the physical levels the vendor sequence describes
+	 * (RESX is active-low): deassert, assert, deassert.
+	 */
 	usleep_range(10000, 11000);
-	gpiod_set_value_cansleep(p->reset_gpio, 1);
-	usleep_range(1000, 1500);
 	gpiod_set_value_cansleep(p->reset_gpio, 0);
-	usleep_range(3500, 4000);
+	usleep_range(1000, 1500);
 	gpiod_set_value_cansleep(p->reset_gpio, 1);
+	usleep_range(3500, 4000);
+	gpiod_set_value_cansleep(p->reset_gpio, 0);
 	usleep_range(10000, 11000);
 
-	dev_info(&p->dsi->dev, "MODESET panel: power/reset done, sending %u DCS cmds (LPM)\n",
-		 (unsigned)ARRAY_SIZE(nt36525_init_cmds));
-	/* Replay DCS init stream (207 packets + delays) */
-	for (i = 0; i < ARRAY_SIZE(nt36525_init_cmds); i++) {
-		ret = nt36525_send(p, &nt36525_init_cmds[i]);
-		if (ret) {
-			dev_err(&p->dsi->dev,
-				"MODESET panel: DCS stream failed at step %d (ret=%d)\n",
-				i, ret);
-			goto fail;
-		}
-	}
-	dev_info(&p->dsi->dev, "MODESET panel: init stream OK (%zu steps)\n",
-		 ARRAY_SIZE(nt36525_init_cmds));
-	dev_info(&p->dsi->dev, "MODESET panel: all DCS sent, prepare COMPLETE\n");
+	ret = nt36525_on(p);
+	if (ret)
+		goto fail;
+
 	return 0;
 
 fail:
-	dev_err(&p->dsi->dev, "MODESET panel: DCS #%d FAILED (ret=%d)\n", i, ret);
-	gpiod_set_value_cansleep(p->reset_gpio, 0);
+	gpiod_set_value_cansleep(p->reset_gpio, 1);
 	regulator_disable(p->vneg);
 	usleep_range(1000, 1500);
 disable_vpos:
@@ -154,13 +355,12 @@ static int nt36525_prepare(struct drm_panel *panel)
 static int nt36525_unprepare(struct drm_panel *panel)
 {
 	struct nt36525 *p = panel_to_nt36525(panel);
-	static const u8 cmd_display_off[] = { MIPI_DCS_SET_DISPLAY_OFF };
-	static const u8 cmd_sleep_in[]    = { MIPI_DCS_ENTER_SLEEP_MODE };
+	struct mipi_dsi_multi_context ctx = { .dsi = p->dsi };
 
-	mipi_dsi_dcs_write_buffer(p->dsi, cmd_display_off, sizeof(cmd_display_off));
-	msleep(20);
-	mipi_dsi_dcs_write_buffer(p->dsi, cmd_sleep_in, sizeof(cmd_sleep_in));
-	msleep(60);
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 60);
 
 	usleep_range(3000, 3500);
 	regulator_disable(p->vneg);
@@ -169,30 +369,18 @@ static int nt36525_unprepare(struct drm_panel *panel)
 	usleep_range(5000, 5500);
 	regulator_disable(p->vdd);
 	msleep(30);
-	gpiod_set_value_cansleep(p->reset_gpio, 0);
+	gpiod_set_value_cansleep(p->reset_gpio, 1);
 	return 0;
 }
 
-static int nt36525_enable(struct drm_panel *panel) { return 0; }
-static int nt36525_disable(struct drm_panel *panel) { return 0; }
-
 static int nt36525_get_modes(struct drm_panel *panel, struct drm_connector *conn)
 {
-	struct drm_display_mode *m = drm_mode_duplicate(conn->dev,
-						        &nt36525_xcover5_mode);
-	if (!m) return -ENOMEM;
-	drm_mode_set_name(m);
-	drm_mode_probed_add(conn, m);
-	conn->display_info.width_mm = m->width_mm;
-	conn->display_info.height_mm = m->height_mm;
-	return 1;
+	return drm_connector_helper_get_modes_fixed(conn, &nt36525_xcover5_mode);
 }
 
 static const struct drm_panel_funcs nt36525_funcs = {
 	.prepare	= nt36525_prepare,
 	.unprepare	= nt36525_unprepare,
-	.enable		= nt36525_enable,
-	.disable	= nt36525_disable,
 	.get_modes	= nt36525_get_modes,
 };
 
@@ -202,7 +390,6 @@ static int nt36525_probe(struct mipi_dsi_device *dsi)
 	struct nt36525 *p;
 	int ret;
 
-	dev_info(dev, "NT36525: probe entry\n");
 	p = devm_drm_panel_alloc(dev, struct nt36525, panel, &nt36525_funcs,
 				 DRM_MODE_CONNECTOR_DSI);
 	if (IS_ERR(p))
@@ -226,46 +413,52 @@ static int nt36525_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(p->vneg), "vneg supply\n");
 
 	/*
-	 * Request RESX released (high) rather than asserting it here.  At probe the
-	 * TDDI may still be running the image the bootloader (or a kernel that
-	 * kexec'd into this one) left on screen; asserting RESX mid-stream made the
-	 * touch half of the chip raise its interrupt before any driver had mapped it.
-	 * The real fix for that livelock is in pinctrl-exynos (inherited EINTs are
-	 * masked at init); this only avoids resetting a live panel needlessly.
-	 * prepare() still performs the full 1-0-1 reset pulse, and vdd_ldo28 is
-	 * always-on, so driving RESX high never drives an unpowered chip.
+	 * Request RESX deasserted (logical 0, active-low) rather than asserting it
+	 * here. At probe the TDDI may still be running the image the bootloader (or
+	 * a kernel that kexec'd into this one) left on screen; asserting RESX
+	 * mid-stream made the touch half of the chip raise its interrupt before any
+	 * driver had mapped it. The real fix for that livelock is in pinctrl-exynos
+	 * (inherited EINTs are masked at init); this only avoids resetting a live
+	 * panel needlessly. prepare() still performs the full deassert-assert-
+	 * deassert reset pulse, and vdd_ldo28 is always-on, so leaving RESX
+	 * deasserted here never drives an unpowered chip.
 	 */
-	p->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	p->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(p->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(p->reset_gpio), "reset gpio\n");
 
 	/* MIPI DSI config from Samsung panel node: 3-lane, video mode, RGB888 */
 	dsi->lanes	 = 3;
 	dsi->format	 = MIPI_DSI_FMT_RGB888;
+	/*
+	 * MIPI_DSI_MODE_LPM is load-bearing: .prepare sends the DCS init sequence
+	 * before the DSIM video stream is running. Without LPM those writes go out
+	 * in HS, which blocks waiting for a stream that does not exist yet, so
+	 * .prepare never returns and the modeset hangs. In LP mode the init goes
+	 * over the low-power escape clock, independent of the video stream.
+	 */
 	dsi->mode_flags	 = MIPI_DSI_MODE_VIDEO		/* video (non-burst) */
 			 | MIPI_DSI_MODE_VIDEO_SYNC_PULSE
 			 | MIPI_DSI_MODE_LPM		/* force LP for all transfers */
 			 | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
 	/*
-	 * MIPI_DSI_MODE_LPM is load-bearing: .prepare sends the 207-packet DCS init
-	 * BEFORE the DSIM video stream is running. Without LPM those DCS writes go out
-	 * in HS, which blocks waiting for a stream that doesn't exist yet -> .prepare
-	 * never returns -> the fbdev modeset commit (and the whole boot) hangs. In LP
-	 * mode the init goes over the low-power escape clock, independent of the video
-	 * stream, so it completes and the stream starts cleanly afterwards.
-	 * ponytail: `display_mode[7]=0x12` in Samsung dts hints MIPI_DSI_MODE_VIDEO_HSE;
-	 * add only if tearing shows up — simplest common config first. */
-
-	dev_info(dev, "NT36525: regulator+gpio ok, drm_panel_add + mipi_dsi_attach...\n");
+	 * This panel's DCS init sequence runs in .prepare(), before the DSI host
+	 * bridge's own atomic_pre_enable(). On bridge-based hosts (e.g.
+	 * samsung-dsim) that ordering matters: without this, host_transfer()
+	 * rejects the LP writes because the host bridge isn't enabled yet.
+	 */
+	p->panel.prepare_prev_first = true;
+
 	drm_panel_add(&p->panel);
 
 	mipi_dsi_set_drvdata(dsi, p);
 	ret = mipi_dsi_attach(dsi);
 	if (ret) {
 		drm_panel_remove(&p->panel);
-		return ret;
+		return dev_err_probe(dev, ret, "failed to attach to DSI host\n");
 	}
-	dev_info(dev, "NT36525: probe COMPLETE\n");
+
 	return 0;
 }
 
@@ -294,5 +487,5 @@ static struct mipi_dsi_driver nt36525_driver = {
 module_mipi_dsi_driver(nt36525_driver);
 
 MODULE_DESCRIPTION("Novatek NT36525 panel driver for Samsung Galaxy XCover5");
-MODULE_AUTHOR("Adil Hüsrev Tepe");
-MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Adil Hüsrev Tepe <tadilhusrev@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.53.0

