Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675419;
	b=0vDwg7KOxA777NIxp7whErvv4MaDiW3LPU70NHbTKeHlw4mUtzykpWV5KGyOz8vQ05VH
	 mIwvNJTrXIeCSqaYi6j6VNqk6mE26MsSonZ+XQvSFxi1bv88an6T54+3NpcG2idqoGnlJ
	 yk/JHURChIIYTQiG3yX4bhZOzQALNl0HlmqUmDx0LusUTHFV/S+BEg5pgs5X81CLrkCzX
	 Y1JsgImf2gKdwBnSK/4Qasa1NiVMoq4ebLRZTB+aCcXT2PAXV7EZY6WvlFgZT01FfI/Tg
	 cUGyU6FajXbagghsrzR/CnSHKuE43EOvk2gtPyyiVxPrxky6AeRRHjEMkW6EJGqI9Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
	b=VCyy6D6iR649ekTKqsvku/KqHX5adUeQUyG049oMQkjRS/6dbgNyQSjJvosbPWspQfyq
	 RALg1a6n9mAGDTJ7GDNyT19MLZ1e1q6ce5yZAvF/PM/h5C81AaURl1Tr9AqhWqUKZA557
	 tksjipvMOrAWQ0t/uSOiTJxfbnderSmMc0wx7LJpcenX4Bl/bqssApXu+wsFtLVN6BVjz
	 t87dNf+cO5JyHxTL7Mmyr4BWcOF2BGVXEDAUjyNKvmEXTROPbx3Fz5dKKiLl6E2tbUU6Q
	 mbX77t7IrfhcQckSuG7U1ni3Ye6GzAMMoi92kMu+IUJrojH5FjADRwwWbQRLnbSam0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AabV7SU6;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB57606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AabV7SU6
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2577687a12.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675417; x=1793280217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
        b=AabV7SU6rPc1VzY76I8ieez75e9dF6OE/nlVltNQR563npk53FLXS8Pz8PEqtj/Qto
         fRLsZoR4tN6WZYsR8bYsxSdVehnWO4tO0fPwM8on06TczQAhVjrrdKhWYEFjkAGO8Po8
         EHJpVaBVM5b85V+w9gjRjco9fnHoVwmZcxB8o1VUudT/iDoryZgO+xcGCvlKJXpzG4oG
         JT++bxAoRBbXjBP7ELT9LWZbpTtWypkBUWq2O6oB0rpCdLO4Xu1NgeQlhdMW1H1cHvfJ
         a2S3t006sTmZaqtW5tBpc+rOi31uZltxf1WTMhn0Xi+N5Bwo29b+LYR3/WoLwddLqb0d
         qvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675417; x=1793280217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
        b=dMNQymJpFUQEfDp/eAfqom8/zcy9xpLzVb702hxdxKMhJk+AfOnUAdIJiWfL41tMCy
         HynIEQu0Nx/439vPfQ/wzeTRUu3AT7EwIwMqEitMrh7ovz+J5EORx0vIhfZbyD5E+VxY
         ojJMtAu30ObT8OB1xxjc57PauJreJchjp2MeFH3yBBaQy1JqPv6VKFuZdizGGNrwGlEY
         pmiiWSU3Z3opqBc7HT1RuVautRBFYHaN7lIxCovz+EnjUk7y6D8f0NBCkz9e4bu1tDti
         sDv5FtUfl2Jqkqx+vnVOmZAKfsm41SRCkPxTSgm2XKLh/D5c6L0orFgBuAn5vilxRfk/
         2IJg==
X-Forwarded-Encrypted: i=1; AKwUvBxMfObz4FcMX7JQSgMpdXGBMWscWuOTLsJxnGSz46M8DaXbjfGBV6Qj8iMMGOa3CV1toNYhzLvO7i7f@vger.kernel.org
X-Gm-Message-State: AFq9FYKmVdd6gvAYz8LxtA2iLeZBs1zI8k/6Xkk6+hv60TABFzAw4L7Z
	WmU/BYo0Z//JXNo6+1Jbv4dOgUa+hNALTW1tjz2YRGXMwlZOZ6qFEGJv
X-Gm-Gg: AYBFou054bE4DE4Jount7e6WysyAJ7yMirWfqdpkmo6GZFtLiqtkQUfx2O70X6rinr5
	Ady8ndU4aU1EGvXh+nB1AYjDETMYWIG6I0CNjo46RTsKI/D9VFPqdYnbJEN1Sf2denM3kURWKZu
	wq8qLQ1PAQRsJG9RVLp8EnoVbdiWUX4/6MgAmuByZBgJk8DHwTGeC6ZX+9z/4s20XLipgrzv5k6
	ekg5qufNooNp2+xmzUH06xPktfBiqHzGUWX2l23PbloPB+rIDbcZbt1hwXNTzSEyyz/bqxcu0zY
	sYF/+L4nOwxykxm70snS6sD6GZFSRtlIGJsdcFrUSKGBkhuik5u/rs5txwl37DqEYV+oUPrXSlK
	RpSRMHJdjGf/jUZ3o1E2vdm0CAj1JEwALmt+WcCExm5WVjTNrjWcqT174F70SpcAh7QKzpkBuNk
	BkDsjgxwcivkoijtvDtyFj2ABXQZTZc4ONGh8Jqm8Hpo7aayJECxOPHezc4k2kAPiuMq6Elt3rw
	llXwt4pjrhtTzM6WNWvdEv+iqDOAL/gYjdPHXJ9hbzcJzy05xjHZMjlrt5XvC/BKDUKM7bL0MZ1
X-Received: by 2002:a05:6402:360f:b0:6b3:af8e:c88d with SMTP id 4fb4d7f45d1cf-6b408ee194amr4733047a12.35.1792675416930;
        Thu, 22 Oct 2026 06:23:36 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 4/7] drm/tegra: dc: Expand available registers layouts
Date: Thu, 22 Oct 2026 16:22:56 +0300
Message-ID: <20261022132259.240717-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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

Expand existing DC register definitions with additional fields in
preparation for adding the 8-bit CPU interface.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c |  3 ++-
 drivers/gpu/drm/tegra/dc.h | 49 +++++++++++++++++++++++++++++++++-----
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b0bfa946e6979..5c67928bcabfa 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	if (dc->rgb) {
 		/* XXX: parameterize? */
-		value = SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
+		value = SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
+			SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
 		tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
 	}
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0cb0515968b35..7005df32f485f 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -274,8 +274,11 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_COM_CRC_CHECKSUM			0x301
 #define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
 #define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
+#define LSC0_OUTPUT_POLARITY_LOW BIT(24)
 #define LVS_OUTPUT_POLARITY_LOW (1 << 28)
 #define LHS_OUTPUT_POLARITY_LOW (1 << 30)
+#define LSPI_OUTPUT_POLARITY_LOW BIT(8)
+#define LDC_OUTPUT_SELECT_V_PULSE1 BIT(14)
 #define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
 #define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
 #define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
@@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS0		0x400
-#define H_PULSE0_ENABLE (1 <<  8)
-#define H_PULSE1_ENABLE (1 << 10)
-#define H_PULSE2_ENABLE (1 << 12)
+#define H_PULSE0_ENABLE				BIT(8)
+#define H_PULSE1_ENABLE				BIT(10)
+#define H_PULSE2_ENABLE				BIT(12)
+#define V_PULSE0_ENABLE				BIT(16)
+#define V_PULSE1_ENABLE				BIT(18)
+#define V_PULSE2_ENABLE				BIT(19)
+#define V_PULSE3_ENABLE				BIT(20)
+#define M0_ENABLE				BIT(24)
+#define M1_ENABLE				BIT(26)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS1		0x401
 
@@ -451,12 +460,26 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define BASE_COLOR_SIZE_888    (  8 << 0)
 #define BASE_COLOR_SIZE_101010 ( 10 << 0)
 #define BASE_COLOR_SIZE_121212 ( 12 << 0)
+#define DISP_COLOR_SWAP_BGR	BIT(16)
 #define CMU_ENABLE_ENABLE      (1 << 20)
 
 #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
-#define  SC1_H_QUALIFIER_NONE	(1 << 16)
-#define  SC0_H_QUALIFIER_NONE	(1 <<  0)
-
+#define SC0_H_QUALIFIER(x)			(((x) & 0x7) <<  0)
+#define SC1_H_QUALIFIER(x)			(((x) & 0x7) << 16)
+#define SC_H_QUALIFIER_DISABLE			0
+#define SC_H_QUALIFIER_NONE			1
+#define SC_H_QUALIFIER_HACTIVE			2
+#define SC_H_QUALIFIER_EXT_HACTIVE		3
+#define SC_H_QUALIFIER_HPULSE			4
+#define SC_H_QUALIFIER_EXT_HPULSE		5
+#define SC0_V_QUALIFIER(x)			(((x) & 0x7) <<  3)
+#define SC1_V_QUALIFIER(x)			(((x) & 0x7) <<  19)
+#define SC_V_QUALIFIER_NONE			0
+#define SC_V_QUALIFIER_RSVD			1
+#define SC_V_QUALIFIER_VACTIVE			2
+#define SC_V_QUALIFIER_EXT_VACTIVE		3
+#define SC_V_QUALIFIER_VPULSE			4
+#define SC_V_QUALIFIER_EXT_VPULSE		5
 #define DC_DISP_DATA_ENABLE_OPTIONS		0x432
 #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
 #define DE_SELECT_ACTIVE        (1 << 0)
@@ -493,6 +516,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_CURSOR_POSITION_NS		0x441
 
 #define DC_DISP_INIT_SEQ_CONTROL		0x442
+#define SEND_INIT_SEQUENCE			BIT(0)
+#define INIT_SEQUENCE_MODE_SPI			BIT(1)
+#define INIT_SEQUENCE_MODE_PLCD			0x0
+#define INIT_SEQ_DC_SIGNAL_SHIFT		4
+#define INIT_SEQ_DC_SIGNAL_MASK			(0x7 << INIT_SEQ_DC_SIGNAL_SHIFT)
+#define NO_DC_SIGNAL				0
+#define DC_SIGNAL_VSYNC				1
+#define DC_SIGNAL_VPULSE0			2
+#define DC_SIGNAL_VPULSE1			3
+#define DC_SIGNAL_VPULSE2			4
+#define DC_SIGNAL_VPULSE3			5
+#define INIT_SEQ_DC_CONTROL_SHIFT		7
+#define FRAME_INIT_SEQ_CYCLES_SHIFT		8
+
 #define DC_DISP_SPI_INIT_SEQ_DATA_A		0x443
 #define DC_DISP_SPI_INIT_SEQ_DATA_B		0x444
 #define DC_DISP_SPI_INIT_SEQ_DATA_C		0x445
-- 
2.53.0

