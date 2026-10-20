Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501223;
	b=rYg1XpvzWfej6XcmdqzOVXOyfsPyZOGGnKE9l3PMlLuIzySyvWzI2M4SKTuIbpdkamnQ
	 s3kTTBde/kpfGIekRZmPc2YpKlm4fWsMAMbZfsPXpijPtDN93LJqkrZIQ9+mLHAPFAuaN
	 E76g5GvjCLkib187Q+GPIPrWUJP+/gIRaFsIRAuz/yxDRnrRpaXnLF8Wuwr2xBO+/y/Oq
	 2jMqoxizncJlY9TtlvqxWr6lcdDqvSarz9KAIf+4QeK9yTUHSAAx0ikE962u00Cd80okW
	 U+h6aCjBP8SIl0xjvaN59XsOGFSIjdEPDz/yg4TFlmOl9aAxOQkuABx31bY4PI8X9FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GjN6ZHhM6r8CsUd/jyX9B/W4tukFNMwm3NaeYZBrckA=;
	b=0N2Vh1mH5IMGSE3WEigD7kJ+IUqTm6SoMtefRogZCToXBtItIKM5a/en00kX2Yksn6U1
	 8gU2mMg8VcgVIxNSGWzfEhHf9wy/pYuNQB7E9lrrO9IylLHBm2RwCdlH6uX1ZCOv4RHut
	 2UQn9iGbu3y5zwAVI8w2xD7R/enP8Dp7a9q3tkOpzIOqEnOblS9iK1bN8/XWu3uQ3/s1p
	 esh5KSxx5pgHcIXdCQbakswzyRPdCvvISnXZN1OIa9az8/9fWXdyARE5yqU8LAcUL/b8l
	 gkMRYTdc6C3Tk+7dKRvX6R4kHc+8m9ix4vOOfp7r52YHgtmhxXh9q5KapD+UY/twGNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ej3ShF++;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DA160A2638
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DA160A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ej3ShF++
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1f68a9855so3482515e9.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501221; x=1793106021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjN6ZHhM6r8CsUd/jyX9B/W4tukFNMwm3NaeYZBrckA=;
        b=ej3ShF++nO6AeboL4Y5XsG/KhyKm0bfUQWTr1IDwWTRh70zaSuLRoBeSRJ9CyQctR8
         9rRd57QKlB8hcUXioRHUU3d5Not7qdhWWKAuISMt9LQYcGrnkPVVtoxuiC4Wp/2OCfMy
         +1SlH8h8za9rDdNFjkpAsrYznCJi6P9MaXJ3STQLreAHs/dOGG12eAc6QBNQM1/d4PC6
         NGwVxj34AswkY7nh+SOS8v5QM2UAbsFzeJJmzDrlJl0S58ya3/JfjgGu3RN712k3C0vt
         AEXoTX35Dp+eU3S65rYO7TqJ+lI7csNaBV4iVy2cLhrwLZ2lZg4Dd8LTZoTTvJteUiQn
         2Yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501221; x=1793106021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjN6ZHhM6r8CsUd/jyX9B/W4tukFNMwm3NaeYZBrckA=;
        b=Pd0E7bAtEecZDn9FuIRon2OGpTpnQXRrwJWRh7hpvHwCa7aXPtVOkrI01ECgGakYLj
         pGsSEco3nuvm5WXaRbKEzFL7Nohj8PNX1QvHeuGYEOhtVDVLV8V0ecLerZeOw4viNLzV
         qMTYX0hMCrJObS2a3WsoweazsaT8YJ5u7JXcyRHwUPeuk4uCXnd3Pi7eQ5mVQSQjBOmO
         vrHWAKobtEelfcFp5wDNsDtPpZuSRaWYhH1yreDVMM6z8vsDtLFag0EHUioC0zWdzThh
         4ZyROe+W+pxb93tbwKaGiFqklXl1xVXzPJj+MuchaqCKYyb8pWyJ7ldVuqsn1/8bCb7c
         Ag5A==
X-Forwarded-Encrypted: i=1; AKwUvByDZVz5uV3sfDrwVPw2u4t09IgKjg4005RyRx9frB+BioLTk8OSL1gZIHa4lIqdpRgSM75BoicWHL+M@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5a2DENp1ymrEWb/QuvgoNPU+Na6YCgq7ctqjJonX0bbBhihvC
	JeOBoeNe5iTflxnthSyJQATmsyojY0cOW3iccrXi8prtJaEgpyVddLXk
X-Gm-Gg: AYBFou0hJAa8nVjD8A1a5OzKp1btxCuFttULY0ybNGWytlnh/wW5+DWFWjEnYAeldEb
	QJN7XWP3h/O0xr/us8pCRLAUARg/N4q47tqLd+y9pTbsLyWkKHsRb28SdeBwwGTBlZIKgFmBdb4
	LO3jKQ2PJ4NU5YQTflJhQFLY0nmtT396EsnCAp7StxucprZlFRfjF+Bx3v1HpFafVJb6KnBPvFF
	ifCWw/gDBDAOtm8CsKeZI1vv61/3R7s++qF1zcl/xUuRrUdsW4AlKBUS7gu/RlC9kaNXn2F+RM3
	jPehvkjPFMf/sN3sXLZOsKinZrO/aJ4qIclIriHnAQgKjaqQu4QauHeQIlKy8O0D7AzEAEu2mZ5
	/HhEytEzzOu8T7T2XslHY/4C5iWeOpDdMDSXQ260ws/qtkYv5o9hGczFAgFgjwNLHLc3Eo5oDEF
	am+7dZzIdC+jNksseSWmOEi8bG59DwZZoQTsJ+zea69yDQ1sYZDr8G75VXUUm88/j7gDdCqSzE9
	KJLVwNL1XcH5ioIN3j+l5HTEUMmwgeVqD159H1hcbC6Ci1FLeGCaqcmJWeICI8ugJXScJ+1Yg==
X-Received: by 2002:a05:600c:3513:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a1d7608002mr234856115e9.14.1792501221200;
        Tue, 20 Oct 2026 06:00:21 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:18 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:13 +0200
Subject: [PATCH v3 2/8] of: property: fw_devlink: Follow GPIO nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-2-fd6f1c17e16d@toradex.com>
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
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

GPIO consumers use of_parse_phandle_with_args_map() to resolve
specifiers through gpio-map properties. fw_devlink instead parses GPIO
properties as direct phandle references, so it records the nexus node as
the supplier rather than the mapped GPIO provider.

A nexus is a translation node, not the GPIO provider, and need not be
populated as a device. The resulting fwnode link can therefore remain
unresolved and indefinitely defer the consumer while
device_links_check_suppliers() waits for the nexus.

Use the map-aware parser for all supported GPIO property spellings. This
makes fw_devlink resolve the same provider as the GPIO consumer API.
Direct GPIO references continue to work because the map-aware parser
returns the original provider when no gpio-map property is present.

Fixes: 7f00be96f125 ("of: property: Add device link support for interrupt-parent, dmas and -gpio(s)")
Reported-by: Leonardo Costa <leonardo.costa@toradex.com>
Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/
Tested-by: Leonardo Costa <leonardo.costa@toradex.com>
Cc: stable@vger.kernel.org
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/property.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 45e55f618488..aa65976739e1 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1311,6 +1311,19 @@ static struct device_node *parse_prop_cells(struct device_node *np,
 	return sup_args.np;
 }
 
+static struct device_node *parse_nexus_prop(struct device_node *np,
+					    const char *prop_name, int index,
+					    const char *stem_name)
+{
+	struct of_phandle_args sup_args;
+
+	if (of_parse_phandle_with_args_map(np, prop_name, stem_name, index,
+					   &sup_args))
+		return NULL;
+
+	return sup_args.np;
+}
+
 #define DEFINE_SIMPLE_PROP(fname, name, cells)				  \
 static struct device_node *parse_##fname(struct device_node *np,	  \
 					const char *prop_name, int index) \
@@ -1361,6 +1374,15 @@ static struct device_node *parse_##fname(struct device_node *np,	     \
 	return parse_suffix_prop_cells(np, prop_name, index, suffix, cells); \
 }
 
+#define DEFINE_SUFFIX_NEXUS_PROP(fname, suffix, stem)			     \
+static struct device_node *parse_##fname(struct device_node *np,	     \
+					const char *prop_name, int index)    \
+{									     \
+	if (!strends(prop_name, suffix))				     \
+		return NULL;						     \
+	return parse_nexus_prop(np, prop_name, index, stem);		     \
+}
+
 /**
  * struct supplier_bindings - Property parsing functions for suppliers
  *
@@ -1416,7 +1438,7 @@ DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
-DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
+DEFINE_SUFFIX_NEXUS_PROP(gpio, "-gpio", "gpio")
 
 static struct device_node *parse_pinctrl_n(struct device_node *np,
 					   const char *prop_name, int index)
@@ -1436,8 +1458,10 @@ static struct device_node *parse_gpios(struct device_node *np,
 	if (strends(prop_name, ",nr-gpios"))
 		return NULL;
 
-	return parse_suffix_prop_cells(np, prop_name, index, "-gpios",
-				       "#gpio-cells");
+	if (!strends(prop_name, "-gpios"))
+		return NULL;
+
+	return parse_nexus_prop(np, prop_name, index, "gpio");
 }
 
 static struct device_node *parse_iommu_maps(struct device_node *np,
@@ -1452,8 +1476,6 @@ static struct device_node *parse_iommu_maps(struct device_node *np,
 static struct device_node *parse_gpio_compat(struct device_node *np,
 					     const char *prop_name, int index)
 {
-	struct of_phandle_args sup_args;
-
 	if (strcmp(prop_name, "gpio") && strcmp(prop_name, "gpios"))
 		return NULL;
 
@@ -1464,11 +1486,7 @@ static struct device_node *parse_gpio_compat(struct device_node *np,
 	if (of_property_read_bool(np, "gpio-hog"))
 		return NULL;
 
-	if (of_parse_phandle_with_args(np, prop_name, "#gpio-cells", index,
-				       &sup_args))
-		return NULL;
-
-	return sup_args.np;
+	return parse_nexus_prop(np, prop_name, index, "gpio");
 }
 
 static struct device_node *parse_i2c_parent(struct device_node *np,

-- 
2.43.0

