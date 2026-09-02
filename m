Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E814772AA
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349349; cv=none; b=N0PTYfwUSHFYgy3oGiJ6t7Z6S8LVkyYbqUzz5aIniAhZIHG23BnAwVZMH0bHh5syDAnsu3YRyNgG+MWQI1a+xyXQttaEeiO5H4vK3VufHs20t5L5OOl/TVkA/UYYW76nW4lCNOLpNpHazlHxl/65c9yq7KONBaJS+BrQI5sZlm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349349; c=relaxed/simple;
	bh=xu8vJkH9oqFCV0kisdLe7YcamRh7Q42iGY9tHGtPQNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m/7ibXAIhh0x18hM0N1/SiTUVuUAmQEhA0HrJlsCMIEWledii2jLmTSdYDG12rYteUWLm/5qohSQX4c328hmRnxO3CyO45+CxY5xIPmjPzl2zvUTWHPInAOmgxyWScmCN8OJ+ZHbX5AkfuHirU5jJ93H9gM4nWIYD0Wgi/DU7N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPEvWMde; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPEvWMde"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso5891655e9.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 04:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788349346; x=1788954146; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tuvnGuccAC6s3EK8HFdURGZ5p/3J3nCrEtYN7xV8Cug=;
        b=QPEvWMde8AvU7/I+kMWZX4EeU3Cutlu1TDphhnXKL/N3EmaS6nK3payLZDHqUF9hv6
         lg95FSwFXqcE8mwaZxrhpZChmOVgCk3iLrMsB/9gETwE9L9hb2uWtPZOn3iFZKrdpexk
         bJH6+zVs3cxm2PTp4Ct/2EtcCf3rcGMM9fHdOe1BoQG4w0aYT10C6NzqcxwQwpSfZVJc
         VXkEww0rVrKzwWa3eX9tX0KZCsKQBD/11OIC0CsexBO3ZnjLa3FnbNvRZL+GYrb8JY7M
         cqi+fWhQsdnCu10KailKGgx6VRm49I1XFOxjUE+zZ1EnpCmFRk+rFsmAKP5NqigX1gND
         GkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349346; x=1788954146;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tuvnGuccAC6s3EK8HFdURGZ5p/3J3nCrEtYN7xV8Cug=;
        b=CuEEh8yEyt5kRb9YLxPfeLx8hyb8sKXQTup+y6qqtI0WkAsM+zRWfH3klxOSLl3w5V
         wKJ3jDamNjfqokxXIx14Us9Jj/+T6eelUm3V9Rfum9SffkvX4aWKXrFm39t36qv+Q6W+
         DR/7q+R/Ra948+/4HC9niNt1KKqeYztUn3CzMAbvITxCCrBV7CF3zIC2seTcG0ymy5e+
         eyl/IkaGypn6EKBZMKTdeI0dHehoFV7bY6ewltMJ6SqkwvlSnxjoMPQMbNB1cTJuf1o7
         5ivLqhgBWX+gKAzmku+OpFSbyBwpe9xN+bJROPm7kSI0Hs8tyVwRblcYgUr+S5KUvRs7
         qVJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbLvnAOz5zz9yxdiX/hXLze86n6SMWUXiUuDdh/Hy/spe6kjaLFNtrU45APjvVxHCkJCzr//XXgI3z@vger.kernel.org
X-Gm-Message-State: AFuF++kNU5rY5P1ocTV+4OgLxbjpFH8tA5ZibGqYUcemh+NuIS3lItwV
	eF5G0HGo+XCmvfJv3MdMcwDbQ5f5ojNBlSfi5fMK/ZwtLLTaX/OGT85H
X-Gm-Gg: AR+sD1343iW3qDuK1tpC1Jz82g8lNM436naZNhkmU0P1NxR0ksZs0/bFutwi9RLmMjy
	4sa9bNbb5SoKnpXqveE8NdQhxCUhWwXQARwsi+657dfnNe2Puz9kaWP1sDvedc7Y04CGwYMvI8/
	og8Z8Wp+/0bXRQCrxeO0TYbXfz6sK2ih9meMItgwMsCh8MVSbgxVGrHGwnqV4srdCcEKyITxYkF
	LobtHQGD7v8x8KWhldiynLbgN/hhXZApC4tbWy8VN7vEEkXyoUHovmosNMWU5yvc/fGocoytKgC
	wWyfKjW5tNI6jdWsa9zdNIcA8H1OQNHfvrRGjtU7hrDkkIKRPdC4yqrDqTxAJ127PYCzgNF6myM
	HAAEgKKa+TAl5JkJi8YEvhsmkqmK0FgfFVvMzfI94Vc6bwDXTkhV+H+jAkUosjOx0NLTFG+T9LZ
	zIHaF4Tx4UAUJlvAncTjZ68Ub6VvKds7m+NBgZAfzM77M9tIT+wqIwAxLTrbdxeLhDRCpFonXyV
	/oH3SeZXTLbZN0zbcQ1xd7svxabgbiz6luEAERqTgkBfsvAeq1XeRqpRFNmHKFv9CXZFw6oJA==
X-Received: by 2002:a05:600c:354b:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49ce58180bbmr63253275e9.11.1788349345681;
        Wed, 02 Sep 2026 04:42:25 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm40390935e9.3.2026.09.02.04.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:42:25 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH RFC 0/2] of: property: Make fw_devlink follow GPIO and PWM
 nexus maps
Date: Wed, 02 Sep 2026 13:41:38 +0200
Message-Id: <20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHILmGoC/x3MTQ5AMBBA4avIrE0ylfipq4gFOpiQkjaKiLtrL
 L/Few94dsIe6uQBx0G8bDZCpQkMc2cnRjHRkFFWkCaF44mGwyp2QcvX4dFxZ24cqlyXVPSktIE
 Y745Huf5x077vBziobW9oAAAA
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
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

This series fixes an fw_devlink supplier-resolution problem reported by
Leonardo Costa while using a Devicetree nexus to describe GPIO and PWM
resources routed through an LVDS connector. Consumers referencing the
nexus could remain deferred because fw_devlink linked them to the nexus
rather than to the providers selected by gpio-map and pwm-map. [1]

GPIO and PWM consumer APIs use of_parse_phandle_with_args_map() to
resolve specifiers through gpio-map and pwm-map properties. The
corresponding fw_devlink parsers use direct phandle parsing instead.
Given a consumer which references a nexus, the consumer API and
fw_devlink therefore resolve the reference to different nodes:

  consumer API:  consumer -> nexus -> mapped provider
  fw_devlink:    consumer -> nexus

A nexus is a translation node rather than the resource provider and need
not have a driver. The link to it can consequently remain unresolved and
defer the consumer even though the mapped provider is available.

Make the fw_devlink GPIO and PWM parsers use the same map-aware resolver
as their consumer APIs. The resolver also handles valid direct
references by returning the original provider when no map is present.
Use dedicated exact-name and suffix declaration macros to opt these
bindings into map-aware parsing without changing unrelated property
parsers. Retain GPIO's existing exclusions and compatibility handling.

The regression tests call the OF add_links operation and verify that a
mapped reference creates exactly one link to the final provider, not to
the nexus. They also cover valid direct references. The GPIO tests
exercise all property spellings recognized by fw_devlink, including the
deprecated singular and unprefixed forms.

Tested with:
  - The new CONFIG_OF_UNITTEST fw_devlink cases under QEMU/x86_64 all
    passed
  - W=1 builds on x86_64 and arm64, including the OF unittest data
  - Toradex Verdin iMX8M Plus hardware using a connector nexus for the
    display GPIO and PWM resources: the display probes successfully

Sending as an RFC because the unittest part can use some polish, but I
wanted to gather feedback on the direction before doing so.

[1] https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

---
Ernest Van Hoecke (2):
      of: property: fw_devlink: Follow GPIO nexus maps
      of: property: fw_devlink: Follow PWM nexus maps

 drivers/of/property.c                       | 49 +++++++++++++++-----
 drivers/of/unittest-data/tests-phandle.dtsi | 49 ++++++++++++++++++++
 drivers/of/unittest.c                       | 71 +++++++++++++++++++++++++++++
 3 files changed, 158 insertions(+), 11 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260901-fw-devlink-nexus-ready-c859706b019d

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

