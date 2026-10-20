Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501227;
	b=Mj4G54SgY8pM9xJ8ywGrewiDW7ZIZg2Qlh8e9Q6RFKiuObQBD65UUf0IeKNO8SFItlNT
	 RiuAkx4hYUx9crP8YbveRgs5DoQlpm3ZhZMR6s+T4yGO0+h+v5I5eCgha71KisdXK7Wfb
	 gjYaUL9Y2WZdcYaJlYyIpwsEJAqqHaJGbeJ9Ja/jpEylAO4aRdMg5eU2yaVKdc7h/o+a0
	 ffTB4+OzTpmETSOpWgBoFAm0ApDaXRhA7cA7BIM0tUDJ7FojHuV3Zvct2G6+dAYabOQBH
	 sEdoetZWWUvCaisYjU4SHeY74gl0r/bFchXcRdXu+esylMHT6cYZTgxUoOf+e3WWOCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QCVq48Hz4LWuB9OejIcWVFo10GsQgpT90RAtohh2YF8=;
	b=pWYwod/m+tJ+AtxjFgPKo2cTF322+Nn33yraAUU4qXFFMK5/J2By93mq6toZ1l2rtwlj
	 nMUHq7KzWjYeUcQr4/CtBbrgHqSyP7NbzcAW16ZUtyh078bWEQ3/3oarVOizHHAT8TPV2
	 4yRdzflxfTH+r76qN+EltTTP5g3eQs42Uk74gXd2Sr91F6phHNCOOYrIR13V5c4rP31Gi
	 65PFD7RsaC3XsFXd7fajNQeiZeW6YqFRFl2Quki7V+46nqhV4k84GyHybtDi/5/rjL9EJ
	 YFQ8IXRXr1NM1Ai2gelYiQzKXV7XqLiKmSHv5UtkPDpGfFtMg6rQ6XYeG8uUYH9AYoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ou3lAhYX;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C8F60A380A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05C8F60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ou3lAhYX
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso4193095e9.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501225; x=1793106025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCVq48Hz4LWuB9OejIcWVFo10GsQgpT90RAtohh2YF8=;
        b=ou3lAhYXfr1/j4oQcWn4lcxmFC2fRwECqiBFa15n/+ItE2kULX3IyewYF4VAU/XBNa
         agICyytnveBnQdZlLGNxF+mAP9Dvdw1PLZbMOcxWTfx6p55vqzBSx4TwBEMz+ucjNqRP
         rtEamXPCpH9Fbrsl6t1cr0wDEfT+lzhDKSKaeVQFjXO/7tJEkVW/7pzKJkzCeYoEVogI
         9OYBe7le3Qw8uPChl5GbrmO+7F8/wn1O11gANpi2Q84ck3Kca9n4vQqtAXwcC3/9lEOy
         Uazm3kSlfM8OR0ymWeowO8VC4lNoqtWbjSFRc32wEMm8dtcfQeX1tLpebvBscyR8zipQ
         BABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501225; x=1793106025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCVq48Hz4LWuB9OejIcWVFo10GsQgpT90RAtohh2YF8=;
        b=BIVw3Z6a9x6yHdwBP3F08UT3WwO3cw6ZUChDFsMURJMhAZ7woetga2vghpMToKocIW
         lTDaXuXpvF6Ag4EHwpufAq1JV7v2AYiYu07xDc0aiZBBqII/y/4BA/mVBtB5oIjE7gbD
         PfTM5vVtwqhVlu2zzFdtAw7vyXvgPqyWOR/ji5xZjv+PrMIATX7iMoWICiqsbfSFvZ3D
         gqsNUhd6Xop6O0W9mKpaWIp1UVDJrCgWvWUDOOw7Hu2PptytphQ+4g7ZGroNStXYiWzg
         tisve+r593thracvlYm/Yjk8N9ZZgxLJxhKyVUyJcgXNgS7HbtEhtqH8736Ca6aoleg5
         arxg==
X-Forwarded-Encrypted: i=1; AKwUvByHWyf132/2T3Nx7XtUjo7EF5C/zpyF6oX9t0Nq/RfnyZA2Zftdl4qruDWH0XvHwl/aTAdpG2DuNwTc@vger.kernel.org
X-Gm-Message-State: AFq9FYIGZwErLfVZJNWPQNAAACrw6/wvNRTB/Pq5VxcPJsxxh9zJbPuz
	9V1manJqH+3i92C4Dlm5Gf+MKjT05dCkuJtfFYpf1PhUznA9mpYK3eUZ
X-Gm-Gg: AYBFou3+BmEJdUXwk7BatK5VYIPvuRoCvtiE4Bkiv4i9bMXvSb5g+BIeeXzXK5rjfm3
	fFtGlUCqlJs/d25FlK/hljNNZax1g/bLtk2fAb8LMt3pkTZu7DZx33ef5BKgaJVaKpL+yHdOUEi
	lTJpVuto5dTOo7oEabIiy4Bzz8MOoamwlUJI2RQvl5HAOlA+nLJUr+LOqB/fvEufWJ0bX+/IGHk
	n4aHJa42RBq+ekW9MYbPFk27yXavG2t3OsBFkgjYBqHb1xJlKTBt0N86zcWTpUO+kMEmkU/ws94
	4yhAWstXIkbYkYcZuxXVei57MHljhFvHllwoNSIVk0FuQZxmB/RkBvRzEQWhs/oVP9A/sFmLZKc
	u8YOYZpQjZgfcA2DfWYdZzuhY1c+f19Sc97+FFLupxp9PVsZyEwY0+jJc/790+2BSzF5rvZBHtF
	oroW9I/++5/t/LtIFjpVCOned7QBsNs8rbXw94nDEx0XHTWk9TrudHeLjcjg2dWSAUm6xXk+GMn
	JCMD04HEP/WZhHi4vC4dgsgzOsCW7BGXzLb0vWC04yshoGKgUNI/BxXF3ZpUq9kZ1dHor+Gisw=
X-Received: by 2002:a05:600c:255:b0:4a1:e478:7878 with SMTP id 5b1f17b1804b1-4a1fa092b29mr12610135e9.18.1792501224980;
        Tue, 20 Oct 2026 06:00:24 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:24 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:16 +0200
Subject: [PATCH v3 5/8] of: property: fw_devlink: Follow PWM nexus maps
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fw-devlink-nexus-ready-v3-5-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

PWM consumers use of_parse_phandle_with_args_map() to resolve specifiers
through pwm-map properties. fw_devlink instead parses the pwms property
as a direct phandle reference, so it records the nexus node as the
supplier rather than the mapped PWM provider.

A nexus is a translation node, not the PWM provider, and need not be
populated as a device. The resulting fwnode link can therefore remain
unresolved and indefinitely defer the consumer while
device_links_check_suppliers() waits for the nexus.

Use the map-aware parser for pwms so fw_devlink resolves the same
provider as the PWM consumer API. Direct PWM references continue to work
because the map-aware parser returns the original provider when no
pwm-map property is present.

Fixes: e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
Reported-by: Leonardo Costa <leonardo.costa@toradex.com>
Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/
Tested-by: Leonardo Costa <leonardo.costa@toradex.com>
Cc: stable@vger.kernel.org
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/property.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 99381c07848d..53301cdac6a9 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1331,6 +1331,15 @@ static struct device_node *parse_##fname(struct device_node *np,	  \
 	return parse_prop_cells(np, prop_name, index, name, cells);	  \
 }
 
+#define DEFINE_SIMPLE_NEXUS_PROP(fname, name, stem)			  \
+static struct device_node *parse_##fname(struct device_node *np,	  \
+					const char *prop_name, int index) \
+{									  \
+	if (strcmp(prop_name, name))					  \
+		return NULL;						  \
+	return parse_nexus_prop(np, prop_name, index, stem);		  \
+}
+
 /**
  * parse_suffix_prop_cells - Suffix property parsing function for suppliers
  *
@@ -1426,7 +1435,7 @@ DEFINE_SIMPLE_PROP(extcon, "extcon", NULL)
 DEFINE_SIMPLE_PROP(nvmem_cells, "nvmem-cells", "#nvmem-cell-cells")
 DEFINE_SIMPLE_PROP(phys, "phys", "#phy-cells")
 DEFINE_SIMPLE_PROP(wakeup_parent, "wakeup-parent", NULL)
-DEFINE_SIMPLE_PROP(pwms, "pwms", "#pwm-cells")
+DEFINE_SIMPLE_NEXUS_PROP(pwms, "pwms", "pwm")
 DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)

-- 
2.43.0

