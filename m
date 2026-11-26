Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729485;
	b=sk8VVp+J8C9WKU5JrtazZNFs2HWmMHOdh1IxFbhKnmyIF3L/UuwPJpr+0ikXa7IRBig7
	 JIyeBRAuBdpygtYQD3Yz2NVP97uUi7gZaQru+Y6VJrokIIW2VWO00bbmsZr7MqTqpFh+a
	 xMDOZ82+qNHbyiIHudSphRqAsgL+7ncyJtuxOKVlMlXf9PQVMkYNmDmLVX1873TNG8voA
	 3+5tixRLOoA13xCRSedt9KRecpSw7qQzEaLQNu5A4friBR18XqeGJoMiumTXXeHBaRTs3
	 S3W1kYR6dGmpODPZPS9k7rOYo/TF+Boyrfw4UUiG9MttM8r0lKmomRGgiYMAhSbnBqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
	b=LmfMZuZkn8OoDrfqON00LRNXswtggiKx6Y7a30stqRxnzbxeGwAcHR19AcjzvMTfliKh
	 yLR1JdFCMB4O0AppTxan5d+TUnHD5pXNBBqUODOuf/HIPYgiyceay5tyO/wFo41r+Olxt
	 Cf1SQz0N5cULSFiXemRDgbVKPC43Z3RGSpEI8OUE8j7M1iEkvSdfYvFa+KJIHc1J43kDo
	 hra4RArC2Rm0gIC7pQcYWOdxlSgTe1kgJHdhk92IHnH6GEgU8N27YMPqn1Rm2Bzt67FFM
	 E7rCzTKgA1/UiyigQz1EJpnBSYZ9HGZDA0lP7BgJrPY5Y0I/KQeEErdnUrGnSBiw60g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgHy1QX7;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D9D60A263B
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D9D60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgHy1QX7
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so4424969f8f.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729483; x=1796334283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
        b=kgHy1QX7XA2+Szlj3vv2Bv7fs7JXMdigxpRNGecSd9cb5jEt1eJYrEiivNXTMrpryN
         4I49RvtcDiKQQMj/0KhLNZYsz1EBBV8UguEAJde0y7yCacs629RotipPScXHESPqyYaG
         ivNXRNoLU9kXUgAsHnOZ9p+9S6lzv6IgLjr9+vR+xdVEGnl788qC2YfF2lYb7wwXA7t6
         nuZHdUF7Pxd0GQapsNPNyxUQhIbgHR2Px42dMsecjXPhLtryWgl5DrlaIUuzSASPh+7g
         f+h8xOl+lChvDRs1Ubc2+GdMl9TxZQvyOT9g/mpi4ZDghQHphWWIWeOE0dzaZkLk2lID
         P+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729483; x=1796334283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
        b=2k7aCkEX9FzBq3BAwvyld9JvZmhB6xyaI0h8c0I8IdIYw2rGmyg4zu1jU8/Ie5Sn3Z
         2iqYDg461hrXzjZlZ609mF8WvkPeY6AL0WaF2hD9Zr/EncD7pbanAtP/z1wrtjZgFVfI
         Xppk1c0aK92emc0Qrb1P1uglxsGDEUoM8Jujig5oqKn78T0OKNTquVC9Ny5TlGEkZI0Y
         8SqsXzqejB4+QaFAhj0YWRK8S+Fta4oBUBns9CxmEbeIQFgnD/k+nI8apuMps8Q7cPLw
         V66qNMYoO68J3TpgW1w7oHUOWK3+PFPbw51mzQn2JDPfsQ13+U/YllOM/ODYfVOTDk/k
         +wnA==
X-Forwarded-Encrypted: i=1; AL+hErFTHGgH3iCDsVPFrNlu/uAFmggMY1cbaS2rxl1BfUWl8hvQ7iNnoWsFu4FEqz+P5dK3xeImoi4Pw02F@vger.kernel.org
X-Gm-Message-State: APuU4Z8zfuew5WrM9+K79JXa9aXZRina4kPVkSj/XGtLlnATfMIuK7Db
	1lnxrDT+cSOaz15/WwN58LoWumaduJwexy6xelsnworwXgckVuVkuvv1
X-Gm-Gg: AZFdTZf8L6a9L6BtsPUncOpo+e0SfNn5CYqtQ59FcTrzLSNx+CiyXYIE3lvxlgJsMJA
	44yHXk6D+S64H+ousaCY+UkumkOuiKAURxWjUcJrkd1MFoku8Rnp/Tn7UBrrQ5nE5ryAaebjmXf
	CY9s+b/AlF4urcLHZd8Kge14WKEJGBJ18htC/TZ9V5v4rU9Wt5f90eeBoimiI0L4keISHNlfAFY
	UF70OsydUccgxBDSgZeF7lfr8uCa+EgmsVz3N0VsVrWSr9wUXzYEzkjmMcWMC7B6vkNoi37FXLS
	hGqumxbnlY480Uc9q0tGRCf17Trl3Sf6rKMkK/1SJk7s39lBYBIun7EcaI9TLg+Tz8FbdSCvahW
	wwdwLtZEa2FFapJTHtmOPf8T/uaSps8cfg47gTq+Ae2V1iY1zWN7n8nIqZB8R6aAz5hfWQ4dUjJ
	9u5k8jaY7aRiz3O7Xk2KkFszrc6pHV/E/itRfzCwLtmlWUCS3OR/MVqvFax6x1A7MmtVW+GN/E9
	AN+8cOjpiuOQMHCmCulen84pvSqvAqP7NV+/SvwXV8TmeyrmTcA5CKkos43cZsaKocaTHAyewNs
	wlcO80ImyGpKPIjNEGbCTFg0k71mEXPeq9Twwg3WSQblEtCZVOuAG1IfxD91gX9VfrWE2VUxuMK
	8Nju7Mj656w0nMpTiPTyY3lHVYpR9nxu03ms9sS6tpxuZZ9+OsSFl6yjHZeoVbOpD1SO6RiXjER
	Pgt8fH9Mb9nxAKW3/gjEUJsTF2487EniYg+6XR+bcj+xGRtdcpU+ncANLKOnEesUuyxE3Eenzuv
	/jSJItfwBHePoz9Cul0RrtJZjd7ceA1Xp+p5E7odw==
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr434400835e9.0.1795729483289;
        Thu, 26 Nov 2026 13:44:43 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:42 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] drm/sun4i: Add support for H616 TCON TOP
Date: Thu, 26 Nov 2026 22:44:25 +0100
Message-ID: <20261126214433.3562326-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TCON TOP in H616 is similar to R40, with the exception of missing DSI
and a different position of the TCON TV1 clock gate, which sits right
after the TCON TV0 gate (bit 21 instead of bit 24).

Make the TCON TV1 gate position a quirk and add support for H616.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 13 ++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h |  3 ++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 86e1e8fed03a..5ea55a2844a7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -18,6 +18,7 @@
 struct sun8i_tcon_top_quirks {
 	bool has_tcon_tv1;
 	bool has_dsi;
+	u8 tcon_tv1_gate;
 };
 
 static bool sun8i_tcon_top_node_is_tcon_top(struct device_node *node)
@@ -246,7 +247,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		clk_data->hws[CLK_TCON_TOP_TV1] =
 			sun8i_tcon_top_register_gate(dev, "tcon-tv1", regs,
 						     &tcon_top->reg_lock,
-						     TCON_TOP_TCON_TV1_GATE, i++);
+						     quirks->tcon_tv1_gate, i++);
 
 	if (quirks->has_dsi)
 		clk_data->hws[CLK_TCON_TOP_DSI] =
@@ -314,6 +315,7 @@ static void sun8i_tcon_top_remove(struct platform_device *pdev)
 static const struct sun8i_tcon_top_quirks sun8i_r40_tcon_top_quirks = {
 	.has_tcon_tv1	= true,
 	.has_dsi	= true,
+	.tcon_tv1_gate	= TCON_TOP_R40_TCON_TV1_GATE,
 };
 
 static const struct sun8i_tcon_top_quirks sun20i_d1_tcon_top_quirks = {
@@ -324,6 +326,11 @@ static const struct sun8i_tcon_top_quirks sun50i_h6_tcon_top_quirks = {
 	/* Nothing special */
 };
 
+static const struct sun8i_tcon_top_quirks sun50i_h616_tcon_top_quirks = {
+	.has_tcon_tv1	= true,
+	.tcon_tv1_gate	= TCON_TOP_H616_TCON_TV1_GATE,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON TOP */
 const struct of_device_id sun8i_tcon_top_of_table[] = {
 	{
@@ -338,6 +345,10 @@ const struct of_device_id sun8i_tcon_top_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-tcon-top",
 		.data = &sun50i_h6_tcon_top_quirks
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-tcon-top",
+		.data = &sun50i_h616_tcon_top_quirks
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_tcon_top_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
index 2b887470a49f..e775737e69ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
@@ -21,7 +21,8 @@
 
 #define TCON_TOP_GATE_SRC_REG		0x20
 #define TCON_TOP_HDMI_SRC_MSK			GENMASK(29, 28)
-#define TCON_TOP_TCON_TV1_GATE			24
+#define TCON_TOP_R40_TCON_TV1_GATE		24
+#define TCON_TOP_H616_TCON_TV1_GATE		21
 #define TCON_TOP_TCON_TV0_GATE			20
 #define TCON_TOP_TCON_DSI_GATE			16
 
-- 
2.43.0

