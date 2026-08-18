Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EDB4028D9
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040412; cv=none; b=S7UpZYWCKz88nm/LkhYWsxdqVhEr8X9Ca6isVEzcsnVLrJ8wYfHPM75aGEP7uk8tIZ0djwlqVu4m2W133g9wBbE6FjM5gMAkKgRyM2/QzJmtKUqATGTLO77p1qOOYqp8t6MlmYsQ6soaE4pPqkLpdkLong1o/BgZR7tfAxABRiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040412; c=relaxed/simple;
	bh=4yQSsuP73a62lSM8d5JnIUkQGusOmnBrzoODOLgFF/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXEPWCUrglSmgY7HEeNqeVhSf6nEwO6iZqxTGmdwKdQAAGwuJhnjzLFUd1eGFsQWURbFC5VzEL5RZG7O/6RCrev711XW/ClmqnkhbqcakjuLPJD0E0jEu1otE73FodfHB47nMHrN5otVAwZatCqx6hwKXn2JeFkYwZBWSUbsmrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rglWjo3L; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rglWjo3L"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so35340415e9.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040409; x=1787645209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDobaOMuKjNNpK+xr0rXVpHpoQTLjSO4XFTBJQNN0Ug=;
        b=rglWjo3L5Zla2G2O6rOvsk+f3oZQANv5b2+YTLEmY0CKFqCeeqwMdhaZIcyOevr+zt
         jtMPxNmSTsjrAy080kzluZRbsGke7s8JK97yMCRIc5ZoYesNTMlJ4ETMLggxjZe0bkrQ
         BMvCQa/9ysy1RLOH1Xko+kUovIYuMDJpmWs5eMWlc4+YeVlMfgAfQ+SOJQXC7my6E//S
         yGMMU0b6C9f6PqaOPOaxJG7GNWHGZKqN5CmYM1maBl4XH844FkDqMdVJAcxbCC5Mqqro
         vIo2bafqQ0MnuDR9Y3rHfotZ1A/Pn+x/iIQ248ZBX8dPJOmABliR+dvVVqQm/6KIruMz
         bauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040409; x=1787645209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDobaOMuKjNNpK+xr0rXVpHpoQTLjSO4XFTBJQNN0Ug=;
        b=addewJCRHtYDrsxwEIU/CtVLsk3X1FwjZqkkbEKxdk7Ax2SLCktZg5iWm3CkkTqwjf
         7LrIlrpqLDblTj775ieLb/Mure68G7TtyqMCT2HyXGaFdMGos8Rc2op3nXp+jGNqz3m6
         fhL60uO9fC1ca2Xt7mh+AbfJIXNvhsbuKl0YlrTtpsX/CsvYhhubf3Bg3QfT9FB8bQAf
         R7byiJ+bFF3i/BpQ1ATbsra2VoTB4UVl5rsdVvD4UaZvMXJhtHXq9bm52L+oPTfd+dLX
         iBhbHYLKZQoE/xZBVX/fR61T3TrK4TvdJxkzuoSLNOd9RIyF0tt+Xz4FWzce33MnPWid
         /9bw==
X-Forwarded-Encrypted: i=1; AHgh+RrFh/qlaJRrbt65NNa+pLfMENdYbjQUg4+PUe61wAJjKpHUTbkN6sW/UX/8lZghbirj0GOVsRKohuNL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz55Ffq6PXxuYuyoQFYe+uZmQm6eIc4InLZ9a4pvveUNs+u5yLz
	6X6yX1Ou2Ob45JZRXfE1O3b3kGsOZxTPFhG0A1HhCnmaqGNcAECVH0M1
X-Gm-Gg: AR+sD124iM9c1+PSYvfU2EReSqP4cTmDBpTx1OUDSj+1ArdCCijRuNFzehWH0fwqFN8
	o1VJg2D7ZMh7sfOHysJgw5hHWCz0OEyNTAXi/C6OxolecuZv4oE0Vlg2x1nGLPRVx3T6x8VFnXq
	7WO4s26a97DDap+hFvN3cNIxsHFoBO94LPIvdmttRe9fyr8uD4O4PGw+StAQTqMy6UztVPK9VP+
	ubXglTKilOtKNpanjvVoEeGkxqPPi7h/w2MajRGLzFbMYKeEmPS7iUoHmVrNPGYLNv6Mrx0X//g
	lPrEQ3p8SJeEjK8mlvkW0dYKreHbpJlNtXY7e/rP4Pfyxlh79uAGrD7jlzqlEjdfChgyRPmSyzY
	ZLafAZfBM5ewf4PpzLA2l5Zor+WYfp6DcrAzFq/J+9VKdYc6DqAkEc9fEO1Ej93zIXmcDQM+GP8
	Iu2toipM/2BBYJ32JE6ICZTZ5kQc864BMNbVMXPNcy7l4JpdHik451RsLOvP2XtaK04Ulqn6OrY
	d4=
X-Received: by 2002:a05:6000:4a01:b0:47f:7b75:9dfe with SMTP id ffacd0b85a97d-482a9109c9bmr10864250f8f.8.1787040409063;
        Tue, 18 Aug 2026 01:06:49 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b2e9sm10367223f8f.9.2026.08.18.01.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:06:48 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Fabio Piparo <holofermes@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v4 4/6] drm/ssd130x: Replace positional ssd130x_spi_id[] initialization with C99
Date: Tue, 18 Aug 2026 11:06:24 +0300
Message-ID: <20260818080626.30430-5-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818080626.30430-1-amit.barzilai22@gmail.com>
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ssd130x_spi_id[] is initialized with positional initializers, which
easily create easy-to-miss bugs when changing the members of the target
struct (struct spi_device_id in this example).

Change this to C99 initializers to guarantee each member is initialized
with the correct value.

Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x-spi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index b52f5fd592a1..be50e5aa2c87 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -160,17 +160,17 @@ MODULE_DEVICE_TABLE(of, ssd130x_of_match);
  */
 static const struct spi_device_id ssd130x_spi_id[] = {
 	/* ssd130x family */
-	{ "sh1106",  SH1106_ID },
-	{ "ssd1305", SSD1305_ID },
-	{ "ssd1306", SSD1306_ID },
-	{ "ssd1307", SSD1307_ID },
-	{ "ssd1309", SSD1309_ID },
+	{ .name = "sh1106", .driver_data = SH1106_ID },
+	{ .name = "ssd1305", .driver_data = SSD1305_ID },
+	{ .name = "ssd1306", .driver_data = SSD1306_ID },
+	{ .name = "ssd1307", .driver_data = SSD1307_ID },
+	{ .name = "ssd1309", .driver_data = SSD1309_ID },
 	/* ssd132x family */
-	{ "ssd1322", SSD1322_ID },
-	{ "ssd1325", SSD1325_ID },
-	{ "ssd1327", SSD1327_ID },
+	{ .name = "ssd1322", .driver_data = SSD1322_ID },
+	{ .name = "ssd1325", .driver_data = SSD1325_ID },
+	{ .name = "ssd1327", .driver_data = SSD1327_ID },
 	/* ssd133x family */
-	{ "ssd1331", SSD1331_ID },
+	{ .name = "ssd1331", .driver_data = SSD1331_ID },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, ssd130x_spi_id);
-- 
2.55.0

