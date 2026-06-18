Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF03F9280
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787510; cv=none; b=TAPa6KjjLai5lqRrRm8qFiptZgaunLviPdIIWM8JuTnVXymvMjdYppdmEzgSfZOKTrXWsUd2lKlQ5uw7h/tACTkeEt9D0fWzAWHYp4xlP1qPYinJBslqUS7ag+pdJm2IP8ac7cMipjkc5+MU7dkVMZl6vl1EC38iXPtuxWgVCMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787510; c=relaxed/simple;
	bh=s24y9GPV7y+NJAKmvwvAX1cER3c+JYcl/Cz6+DphJa0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+CJI87nAKVrpZHKR+g8Ug7lrTUnp78Zx7/03hAkmd7AQHOxw8Wuzgqry+/iGlSd7vmY+sZ94uBmRw3+sPaYQXYztGK+EYtHLK5wrwWJzF/EE8s/9+/dDHc9vPGpgVSWJAm4J9tQV2vWXJOQOk/GeMu91t9hSFjD8WUGS9p068c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACCWjUAp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACCWjUAp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so6777255e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787507; x=1782392307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=ACCWjUAp5FlJtvTHeL5llLI95L/v/bpNwqNXtjEZOHCX7Zb6tawmNtuVnMBptKXcvd
         B5aKiqRmUwgnZ5LpWviagQyszsaqC2IwBnbNi6QDTbuB7PWWzBsvw/xqcilbE5x9hmcb
         7qwO+CXr9WQZ+RD3cQOeR1if7/20NS7s5em5Z8A8AQPR+rt5HWCNr0ZyFFbFYTiDl44O
         +dSeJIcwPw26XGDCUlBZp387FDAj6rnkMUN40NJ1mb1jNx8NgnavvspgXbqP3fUnNmSd
         X7IYyBEjaefl5MKurFG1BsyQK/N8m7Ooq8WpVD/4/8P9k3nhDp3dobihf/o4ZJfWNdsw
         qdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787507; x=1782392307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=fHZM6cSJmG8mkNye6NsXXtyVIJnREmymgMz9jMWQpvChqDruyMzRCPWGOgI2u553Mf
         SnjVD5N7zX9NjxgZH8HW8XMyC93yKEUxneQN+N0vkKh2AnVkCpnuQw5fEJHwxPTJbHiI
         rwvVlzIM2zddAaYd8VmUIb+06KjfhrstUJ8fe9YGZ5cst311ROJXYWjDyRIeKiiHuvSW
         tCKjdmbontKnV2frnZID0FP9niAXkpZ7wwmk748C+UajCbg26ZQtj3iDf+r12UuHgqWk
         +UHCf1E9kppSUB+VBqo6rrnhWTdcWYd74rcyspZ7r3D4T/Q2k8l5wryD8D2uFLTa2g5W
         LDKw==
X-Forwarded-Encrypted: i=1; AFNElJ/sxo7GL6piR1QZKS+W0kT5ABpThrud/w7gekhfWOOJudcSytSDteyqK3OaZQYyxbpFmXuRyW1tytcv@vger.kernel.org
X-Gm-Message-State: AOJu0YxnouYDA8NiwDGqTpNBPjGvjb6t08paO2W9YpIQvITvsnBFSZYU
	PpjVHKJ0D7D5q+Xk5UaCAbqfgeNrmN9tjW68/hddl+LiJfheJeVgNoBw
X-Gm-Gg: AfdE7clU6jpkXnvqAnX7LzehH8Su4EyeQ4kGWvB5G22z1EcIIkyyH/WWDDUaTgoZj/6
	BsEpAIG1472l88P+1yeUTFYMm8WvwsgUfJuIzPXSNJ8EgA43G0KkOIM8Icp7qAyOtfZYfm/0r4d
	/Kl3defiqvBorezEEreODvKctaM9gU32kYvyuogy28qlDDb+VDV6LRUZS0oPaKxDmdi4EAIC1f9
	TEl4IIsgO+RTFxlzTagJxUV0pY0tMBaJHC3pWaUo2jV78R5qTkhEdoZ11XCclTKcyX+FkSXAABg
	DT41ksiM0VT+YsSJXaVmUvDerIbtq8tkbfIvjZSYhZxImJZZse9cNrzAqoKaz3oTS0zvvae1YNB
	yUju8hRF07DgZGA4Rgx30c/gArL5cn99+0hALdf1rfGdFbM1MxmnDuSuV3yWllkMp1hRqbB9n24
	982w0P/AQfOyf+IapEqtyAZkfTa2RQNhRWeV1Wd6FQbE6WWn2ReEgGKkeSBPoRDFNFV9aJejbt
X-Received: by 2002:a05:600c:8889:10b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49234139bdfmr97586515e9.28.1781787506895;
        Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Thu, 18 Jun 2026 14:57:16 +0200
Message-ID: <20260618125752.1223-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
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
index 136946f8b746..e6584a2f705d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0

