Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5734E3C73F6
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188990; cv=none; b=H7jBLeg8MsMp5u2JCaKgxj9MMb4ZAqrdkUwK07PXES7qgDyGTneQgxKWe660ZWpGrgxdek5ZAMLh9PXjqnR3EkGPFINk2G+5YgKpTWajYKECZ61Uv3CNOTGin6MMxtiEx+EPDACi948+e8T5P8JfZjg+o3zpd1QGUd2ZQYoXMp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188990; c=relaxed/simple;
	bh=OIaEkynfAr9WKeooJY/3g2U/O1bCDEbfzmAGfhXmYIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiKjxTfXhcbu57HO3flIBHegDEQUFpLoHl45mGUwTSffnmOC3Y8plZoVdgEIg1URdU1nizdAXKJILY0ufyzGsQsO2+Ip/4VrJ/OBxZhFiT91VoL4rSRgVRQzjZJba5WL0KoWTETYWJt1KzAEHFjQDQDQbEY0Ap8rcR3fLSOzt+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwT7Sv3w; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwT7Sv3w"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1168777eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 15:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188987; x=1792793787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKMLDd4ELr4QXkQblGO+w5ZqVhuimx/sg35XuBzMtks=;
        b=rwT7Sv3wcsEj39GLLbHQvHAmM97L4+hg1aflLTjVOwSgdgJiojI6V9c6hIBckuh/lq
         4hy89RquscP0WVEWDHzcT9V4VgLFXoXQ/p62sjLevdajXmjtaKPlf89f34TgVVb/++cU
         3qGIhey5fJJYZ2/X7mUBHnen6RFp4qH+fvPqH4ZOKlaRGN4iu0bkkdJGotv2MGMh634+
         kVJw3E8qnMGhyZcMPHybMTH4nWfG1sAEvEbxwS87+oy3ytllx5AP8gcCvjPucul9EPAp
         nS/TT9a8IYJ2tifBQ1oke34GH1b/BtWNxqjUdTPsO9lNdUGMOq9PoVDRzHNmjPjMcYKd
         72Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188987; x=1792793787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKMLDd4ELr4QXkQblGO+w5ZqVhuimx/sg35XuBzMtks=;
        b=rMXEI3jDkDCXDH81vsle44kWX141sxvFGVmp1q7bdzvHGZMZL5KweJRhl6uOhDirZX
         G7XS9lGmbL4gE0augwrVkHfIwJQjVjqAUc9InJ5HYggl7i7vWuN8LLt/OgmICtPAovU1
         zC0K2hNwSs+GaHnrd4EKdvRTQeUPkVltQry27zgqyx4tffAGqFwCboq4rzmsAJlF47G8
         CYHAqRT0+aBwzpY9h6MVvhbMRtgSE/QOt3ozTWvOHDx9aDGETzwS8IoMoCobXPfAV2iS
         pgPwUykCs+z8jV0VlP+3/aF16FKjC6Th5MalMfbezkb7lGH2Zua4dgjVRpBbZ0t3xAJI
         r5/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxUCeOGCE9Rlw3IaynKI09rLfvTvxd1y1QKBRJbIc14+bWBc/qXISnJG8s/+mdCIG5+5dOYDIV9Bnd+@vger.kernel.org
X-Gm-Message-State: AFq9FYLPdz2QZ2vOC9WE0ugKhHODcueGodjF4ymA0uEKIN8bKgMkw9an
	rPisX/9X6h1fUUT/f3PfvlkA0+y//dCpUrk7gqH4hxGFG8x88IwAoxnR
X-Gm-Gg: AYBFou1QEp/Z+d959+t5ZIInHaGhUjVmhKV0xgRtepOq1iBRxEIHeF0B5oR9zIGeGHE
	XNaGzuCUQ5EwHt/4AlJWyH8iYOl9wK/ilb4vfzRSpG1D2NOY6BGhU3EJvy6NfVIHHB9VhvsMlDC
	c4cESlebBAmSAAKoPUijbHZ2yvZ2q1knyOCAexvALffJvhtAqixuTqyhdNnVZ2io6dcpAXbSTJO
	8k90CRTwq9OJeYkoLmYnIpMaoy7RB+yvXOpP1PWuwNk7a0YfZGwbOGq4EZGCjg2PyWujOlaZh6w
	l6zKFMXR9oHfyi6DVAarzj08T4EkyWKJlBvGtfy7pNTK5KCOo4X0dH4GK8Iox2iNN/eN7i1OIiJ
	7RRkWbWR7IbqZ1z3dEbanX5+FAvmm4aOiS+DV9IQBvQN5aJQbMEIvI2CNCaLx9lhVe3Dj0/Ht9I
	O7OMUNoWngsujREyoCKNBpHyg0lhxg8OeRayAHcKYsMaulhDWhR/Cw/nSyipDFy5SHFlIkpGvfQ
	GR3xLwW
X-Received: by 2002:a05:701b:4284:20b0:163:a197:722d with SMTP id a92af1059eb24-1850cda6b4cmr1715523c88.4.1792188987400;
        Fri, 16 Oct 2026 15:16:27 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm10480863c88.6.2026.10.16.15.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:16:26 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	manuel.lauss@gmail.com
Subject: [PATCH 3/5] watchdog: gpio: Support watchdogs with a minimum heartbeat interval
Date: Fri, 16 Oct 2026 15:16:15 -0700
Message-ID: <20261016221617.2223004-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016221617.2223004-1-f.fainelli@gmail.com>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read the optional hw-min-interval-ms property into min_hw_heartbeat_ms so
the watchdog core defers keepalives that would toggle the GPIO too soon.
Reject zero intervals and intervals at or above the hardware margin.
Devices without the property retain their existing behavior.

Remove the arbitrary 65535 ms upper bound on hw_margin_ms as well. There
is no register width to constrain this software interval, and the MTX-1
watchdog needs a larger margin with a 1600 ms minimum ping interval.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/gpio_wdt.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index ff323d6e692e..a431c77fa179 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -138,10 +138,20 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 	ret = device_property_read_u32(dev, "hw_margin_ms", &hw_margin);
 	if (ret)
 		return ret;
-	/* Disallow values lower than 2 and higher than 65535 ms */
-	if (hw_margin < 2 || hw_margin > 65535)
+	/* The core feeds the watchdog at half the hardware margin. */
+	if (hw_margin < 2)
 		return -EINVAL;
 
+	if (device_property_present(dev, "hw-min-interval-ms")) {
+		ret = device_property_read_u32(dev, "hw-min-interval-ms",
+					      &priv->wdd.min_hw_heartbeat_ms);
+		if (ret)
+			return ret;
+		if (!priv->wdd.min_hw_heartbeat_ms ||
+		    priv->wdd.min_hw_heartbeat_ms >= hw_margin)
+			return -EINVAL;
+	}
+
 	priv->always_running = device_property_read_bool(dev, "always-running");
 
 	watchdog_set_drvdata(&priv->wdd, priv);
-- 
2.53.0

