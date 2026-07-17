Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3952F3D4137
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271330; cv=none; b=Rs2SnrvL7UE3jGh5orlKPpwYR31x6+L7ehv0/W6gCYILpdE1RZ6SombGmiEitrglOQAmrjFDi3adSPo0/qS+mr9I4A3KvpcU05hnXmtgTfRU0g7o+XD26mYiBR3IdGsVhfnRHqQPqjn92XvpfnALWk6kmxctKO4eiC2gsjZVLd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271330; c=relaxed/simple;
	bh=KD0Xxqp9c+WKHaZRv8teeIbNeaFlH+GFSE9b+VzjtQo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcz71WiFhukl3CxqngQjbZfDfc82Ay8nYVb72RHVKu5+mDsEs+GCkoKEncJ18ltxeYD08Lv8htLbgWtzN/mGU/g9gL70qazP59TfRNMHNsQFeU1AJALRJmZVAmWcCYmnIsfUX/40Peqtnk2NYZe9yGy20kBHBZjuNvJw3cEVsUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMpWP/vS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMpWP/vS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f6de72faso8928705e9.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271323; x=1784876123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZdXEh1+v5JoWmC/SQYTMdZgOF636AdT6/MfmObt9bDU=;
        b=IMpWP/vSXDY2iFCz/yQj9ql6sHdtePJuSJ5YQLGmx0XmJQWVHK0jWQzy7wzCuUfVA7
         RFpYrJUfGavDvxYFHGO1Wcwkvuw3r4c4Z1tirk6dju1+hGzfIIj0ZYuHR4Ykllrc3Oog
         9RAr0bO19iyEncL0Y0Tad7IPgIoTsb0IQZzH33EcNG+kYeJzKCG7fOZJfo4pwLUsAd59
         J+sABumUnFKJiHFEqsP1M0hcQ2nwDWayTNZJUDJsCDWeZiXiJUz4tIMvKkgV52YRZ628
         2cLEBNiivFJrTWAW+KBMXecpoAiuvCqPdUzv8oWwSUF9ol+NGEQnhd15/bpttCVMeOJq
         J0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271323; x=1784876123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZdXEh1+v5JoWmC/SQYTMdZgOF636AdT6/MfmObt9bDU=;
        b=kPsmVbGdZUHB8R2UiWKMgKxpc2fBsgL7eXhm6CmKgBu7pn8Wp/lCfy1C9Cy1yH61mt
         N+4iXzBcEeH8feP1xpBwtpZa68kwa4yCgUWLY5GM1F64dcFx2jTJMQB41nVN2wiLa/7S
         eIsu5c4P5YkDrpDZPjzTx6v7JmqKesfXN5Cifm20kDg93vvL/EbPOKm/v4xTMtiOVsgP
         rNrUn4GR7wyYQB97ILQ5lGOnsdJHiM8p33287g+5JnpWL5AdISN2m4SGZsvT+EYzm/P4
         syUEnrJXIueAW0kFWHOmTJ1KsUUaR8mIEqhuJfYPIxpjdSEOYEKYfp8vVOorSQnwdGSe
         PNrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWLYFarIY6600D/RzG6MCJe4KdIv5Pi2b3OzWW1dywBg+OK1mb/IWW5bvq/MGDJ1vcAL32wWacSLdI@vger.kernel.org
X-Gm-Message-State: AOJu0YxV4K7pPdtzxgP/B9eZC9jhge97i3OzZycRfnjwYwHM+RZgPFAz
	e2OkiwQEmX+TsL5RdSLDQJVYT/zANXZxUzTvpIlHtqEn/UbbRvcrIUC1YODwfAhG
X-Gm-Gg: AfdE7cm9lQgDxoV2yMq/418wn9Hkin+G5uCn0Mij7UfrV1nVgJ6cS51aIKfXff1db7V
	VKd9XlpabZYOoAVEAeXEluWQzWTX7d+U9K2I2kZFqwLOjToqutGlwctvd90B0HJ9vfkk+5GOSOk
	oh/FHrUb0EKm0P4wRcrkKr+7Adn720Aucaj6EyBBVLCO3ayD4NLOZ5/qXt6eILiq7Sy3VtZHAlk
	rsVyB+1h4FAl/d1gqu4hV9NBf0GKyOSQuziBg9vbzCtcKRDBk68XPeTj0t61jPrNcKgpMCjJgVR
	P1l9vfH2Z3RKKemjcPDzxM00uTaqGC3i3Oo7R2G5+lQDvA/PXNUgQXVFTcs9vaTiRN8b9+3W6rW
	YncxBtQvLkoF3ZvrPRrvrPlTUZoR1lXY9cyfKmJuHvVAqnOnNvCx1HQFK9o4y4rrr7iNRPZWxBw
	Tx5AtmEsb+9l4FUu1iMpgPWHcSskPWlAMGT9bubIDjvzncgEzIPPW2jsUsVt3+239AK7zDug==
X-Received: by 2002:a05:600c:a210:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-4954a341bcdmr7407915e9.18.1784271323320;
        Thu, 16 Jul 2026 23:55:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Fri, 17 Jul 2026 08:54:08 +0200
Message-ID: <20260717065448.1498335-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..91c3e3931fa6 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1415,6 +1415,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1571,6 +1572,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0

