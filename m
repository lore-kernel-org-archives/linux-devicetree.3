Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1443C363C5E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823775; cv=none; b=N10PhvXZdLpSUZ1rEmxfnz2IFNw7YS0vW5p/G9XixRB6YJERFU9eTdiGO8G8WMV05D9YV3RyXFb4Lew/g6f3fpDv8bvupf8O/pgw5XPvFeLRsN8pJeJvuoQY8hyK+ILfeo/r5YvOj4hG9eZ9sLJfr0iha85Ip8JNMA5vICKRrxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823775; c=relaxed/simple;
	bh=GnGzQTNG2sWXCYiVIHV6PxxXdvgI+nP2hkQMIdexBZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGvr28bCmh5pkMYo4bHTuP8R4tJ38vW6tYAwBq1FkudUZhtUE1Ef8yWubsPjmSP7+f7rIH/KQ2+ErdsosvHP04FSGPjgi4GA9iJq0LyN69dbCsK8yaxd+yd38enxsR1+Q6K2Sl3HITlGw62VYxCVy4Xr1zpf+fUpxEugpuf6MtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeVeAtJj; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeVeAtJj"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f8b60e485so4387844b3a.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 22:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823773; x=1779428573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu8r9w9o/+B86iBJC+fZKkUwDRzmjJF1xgahG3OvjQQ=;
        b=IeVeAtJju4/+vUQAXwnjDov4VYTPkTmxzLXBJaqJ5dVcHLFzly+VOfRY6jY4kl3Vut
         YZ0uFVkIJw3/0tH6XOb1c+lxX+hBBjL9+0/KqENkkcLYEwsuMnvfu08U8ujHWh7UZtGF
         vhsBZoNinnxsxp6z87QiRL/+Z1lESdhyAaztjtDrjeHLmLbOkJvK/DFrn/jBrORl0Pjk
         zceUQdWI2nUx3Ggi5khpRYqAGOtwpJvpfgrDTQlx2Sxr/02P0mPDXBY+98IeoAA4d4dI
         BIZwurFwOZs/Avh31IrqaImqDSFQFyby+ItLgMY0t1fpfxXbCnZRVxMLyw+LHRK7oCA/
         wnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823773; x=1779428573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vu8r9w9o/+B86iBJC+fZKkUwDRzmjJF1xgahG3OvjQQ=;
        b=FFGz7jg7tKJAwFJqGAjOzzdQbrVYhjr1E+8QVmoKnRYNDgzlI77l0Ukrwl5Q2RM3jG
         3MVtqUCU1+GZz8CtHPl5an/wpx1N+esvr1yqyuuek85cq8bocnqpCZl6JB3bGzV2OZ6j
         py8cOESyHxaQm0VwxxAJxTF9nLTVUBMDj/DcVbcyLTzWPiKpM0L1rmhpgZ86DUuzuU7+
         fjbhR8FImAjSu1xfUPxCWHQzcIlvLRRlC6vUHTZayetGADGdCtNPW4CKi7DBwNLZXOF6
         VhImOESQPjEcpw3R/KghSRTlYW1tiJk45NH28PBe8wTswTFXOutUOpgKnLeMdRx5ZS3e
         YAsA==
X-Forwarded-Encrypted: i=1; AFNElJ91S7VeD90PYtp4xmViBUMSHq+CFuG83kv4a1w4HOjLQgbspQfp7/HhW9317a3eXJLCMsQFKns6wvpB@vger.kernel.org
X-Gm-Message-State: AOJu0YxzO5FpSeB9RQ8LX8+FK9S5xrLN+4TzsZC+hNQtcE2A1skrLJzy
	MQO6BUK9tl5m/vqcAjNmsZtTYDOSOruy6ln69hLpB0zODmNyJek4Vvjl
X-Gm-Gg: Acq92OHPHDChdFG+IlqIhEXB4wO5OSDPKBWJ17Kek9GVvUpga5MYLtELX2NBwp9BT/M
	+zZVXZOwEevt3RpIYY01uRxVBpC+mTghXNCelFhLAPlTJpqCaxTCGg3u2SsvooUD3zS53xLF0uS
	o6uKNMy5O6zszcsYVteun4AATqkx777UNhvrQY/DcYxCC47T0JNnE4tgjjsYwEqxS5YtbUEv6yi
	xDMGF8B3t3qcJXFfz93VLz7dvVpp5kP/PV0E/MRoSYXPmaJ9l6ojjbYwwcvnU539OcnrP9QPNYY
	w+8sEd9T/VCvolsymWRhht9cNNU8p11oPFVO4D4m8TNOO2klgQPxmOefnAQZmBNjoG1gd8nTZII
	n4Pt+Cal/X79Cg0jLAvhZpi4jeU1zUO6AKVOlTAPNgcyZv8/uzfiHLP+kL/swkqXN7Fz8PFpT0U
	YMBNO4GapJ+JKETALiYNwSBLzXm2KJ7ucKzmtavdU17LO1ItxWkVOM4oh3hM0yip7804NuJGC1f
	+PvH0b9PwB6xeS6jDIJTnrC5QM=
X-Received: by 2002:a05:6a00:ace:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-83f33ba720amr2908112b3a.8.1778823773353;
        Thu, 14 May 2026 22:42:53 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:52 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Jiri Kosina <jkosina@suse.com>
Subject: [PATCH v2 4/7] hid: Pen battery quirk for Surface Pro 12in
Date: Fri, 15 May 2026 15:41:49 +1000
Message-ID: <de275cc63e764d2acddf72bf3f50e89f307f41b5.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pen setup for this device uses bluetooth for
communicating battery levels and status instead of
reporting it over i2c.

Without this quirk, the device either reports an
extra, broken phantom battery, or hangs.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Acked-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0cf63742315b..d16f55479786 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -459,6 +459,7 @@
 #define USB_DEVICE_ID_HP_X2		0x074d
 #define USB_DEVICE_ID_HP_X2_10_COVER	0x0755
 #define I2C_DEVICE_ID_CHROMEBOOK_TROGDOR_POMPOM	0x2F81
+#define I2C_DEVICE_ID_SURFACE_PRO_12IN  0x4376
 
 #define USB_VENDOR_ID_ELECOM		0x056e
 #define USB_DEVICE_ID_ELECOM_BM084	0x0061
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index d73cfa2e73d3..61ecd840d0bd 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -395,6 +395,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_CHROMEBOOK_TROGDOR_POMPOM),
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_SURFACE_PRO_12IN),
+	  HID_BATTERY_QUIRK_IGNORE },
 	/*
 	 * Elan HID touchscreens seem to all report a non present battery,
 	 * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C and USB HID devices.
-- 
2.53.0

