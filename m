Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE3C4A261B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050170; cv=none; b=nvjU/GDCTEdhaERXSwCjo3mDfbbXkpbdF34PnwL/BzDLSRBhW8sOKegZny34e+AXKhF3uC+eQAUMk8i01uYAhwAuMEIrMpjjGX+ToEuDfvNqF5Z8eoFHJbJcsYqqd+TKmciZIbOF62dAlpiEGk7/zZ535SAsHBasF9e4EUFmoDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050170; c=relaxed/simple;
	bh=Nay3LPpHkzmUOR2yFLIxbZK/j+WBUazFJ93AhqK7x8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nMTkXaqd1Xmmy8o8D48W4VuTCFHtAzOIASnw9cI2Vt5jfIk77quzAm8vircO4TXz16VIvS49XyGJXfZPTGrkDbfrcssvwpON/E9AD8Mm4+E3aYh720XcxAxfZVnmA3fHRHpXPke00HGgoBgYhIyhV+tPbNSErRuTrHj2FsjhcBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNIkHfK/; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNIkHfK/"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so1308881e87.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050165; x=1789654965; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yU5rOk6h8bj4CbQ83n6GeZ2/DFqLMn/rBfdmHQNe++Y=;
        b=hNIkHfK/jjMbZigS1lDNIJmqFu3FV0S+7ynVuuldV3jMulkEa/QRIgN/puQnfUUx6b
         67MX/06WrHDPJFCWpcgnRoXr53xRxZaKS0QPhmW6PPMIJ0jkQHUAGGl1uI2reMmsVoa1
         3vS49k3zZi/cpJtkHF2G7HWk+rr4g2Ldxa1OsaPxTeM405v5SpOkNuOGUpApaK0TY0E6
         UctxNNbWv4/pAUdOod/NKMZXq6QM7MEUxCkxVZ35iTZL/epVlQ6WIK8CJaDOR4k9OphM
         1guZ4QZGoXbGuIbAMZtvXYnrNdSBS6FC28oChCvuGhlo58C5Zvjc+cweJL0ZnpAToNZu
         dPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050165; x=1789654965;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yU5rOk6h8bj4CbQ83n6GeZ2/DFqLMn/rBfdmHQNe++Y=;
        b=gCnpOjlm04oT+RvvveuJ/zSSk/yMC+hKbuJFG/tZsXcDRn7lmzZrsDwg59WbEegQCH
         9F9hJaXgZ/FWForrq1O9PMIXtZAB8zaiKCiH3vuLViEhOSE8ORf/I2+yVFVai76QN+jC
         t714lXGPe6bIF8Zo5vAyk5XLu2Zc6wyjqD4c4cGcpAGJCxpDTnlaFUg92YjYc7n6rbAr
         bkoH3350fxbEiM66CNOwavD1GcJTGfxzaRhyMSVY8+2LrC24MJnBp0L/bEJclesXwNpw
         yL4EQH0Fy2pavV/f4AiR0tBdzN7RVF1aAwQsf5RA/BxeD1MMATaNVXgtY6c+lvr4whhr
         ZCsA==
X-Forwarded-Encrypted: i=1; AKwUvBztH87CX5IwQkSeg4zwHDZkB5LcgVQk6CH03Ye5ikGVG8PmvJD8g84W1WQ8lvB8R9Da2mWTpROXlqBX@vger.kernel.org
X-Gm-Message-State: AFuF++nyDEmj3ySnCA9tPC/Zto5qP0xgp7iQFqE234EGMCbFFU85JMXC
	777cmj03sXX7RqzktsonL4EAm6Ydz+dQhY58hZG4liXdMfMv4sAt2Y1gM0kFbF+/
X-Gm-Gg: AYBFou24hqR+N0VGAfklLyjHLeGlj1wHICmkGyLVGexbaDpJhR90Wj9iNf+VriNLNsx
	vMp0GZz/tte4Wltz0QkhcaCSCzm5VjY7j69MSfnx1dO/8YIaYrlo/jRtpQR3I4N2HRUY6S/GFHq
	CStpWESgtBkooO7J11QHZG1U+2yyz0MgnzWOV+9D1vdnulnMP2DLLGpSdgT7J/X3X6ME5qt0YsE
	4coSPbOSnF0YDYyL6DRrvnM8lRn9H4c44cf7tx9VOm9LKO0IN/qadVI30mcHP0NIy8OZILbzHFH
	e1PWSIbPuaCKD4AL1DbcOFs4EZhKvOsaQZ38vJlufVklCymKhi/kb25dbVY0JwW2fmSPz36/RMk
	T/lkahOkXOENLjtJaSjVarKNSEB1NMlUJABnla7R0XkRUSqGKC6tX0MeVZhe2WnW+B2sQiswTkx
	AixyWU9qFPROkgj56HbILb2m5K5uzhfNSvOompn6hXh2TA6bjmptYfflTyfEmROOR2JQ0Sk+SBJ
	7wiskixz2XDaOE4+0kVeU4XDNPHzuBEbgQro1q4T0r0gakziBZ/yZJashim9S+sVCOL//ffuw==
X-Received: by 2002:a05:600c:5307:b0:49c:f617:7cf with SMTP id 5b1f17b1804b1-49d25871d73mr162962375e9.0.1789049807967;
        Thu, 10 Sep 2026 07:16:47 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:47 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/7] of: property: Make fw_devlink follow GPIO, PWM and
 clock nexus maps
Date: Thu, 10 Sep 2026 16:16:41 +0200
Message-Id: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMm7omoC/3XNQQ7CIBCF4as0s3YMkEiLK+9hukCY2olKG1Bs0
 /TuYhOXLv+XzDcLJIpMCY7VApEyJx5CCbWrwPU2XAnZlwYllBZGSOze6CnfOdww0PRKGMn6GV1
 zMLXQFyGNh3I8Rup42uBzW7rn9BzivP3J8rv+SPWPzBIF6qYjaYymurGnIlhP094ND2jXdf0AE
 E5L/L4AAAA=
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
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

This series fixes an fw_devlink supplier-resolution problem reported by
Leonardo Costa while using a Devicetree nexus to describe GPIO and PWM
resources routed through an LVDS connector. Consumers referencing the
nexus could remain deferred because fw_devlink linked them to the nexus
rather than to the providers selected by gpio-map and pwm-map. [1]

GPIO, PWM and clock consumer APIs use of_parse_phandle_with_args_map()
to resolve specifiers through gpio-map, pwm-map and clock-map
properties. The corresponding fw_devlink parsers use direct phandle
parsing instead. Given a consumer which references a nexus, the consumer
API and fw_devlink therefore resolve the reference to different nodes:

  consumer API:  consumer -> nexus -> mapped provider
  fw_devlink:    consumer -> nexus

A nexus is a translation node rather than the resource provider and need
not have a driver. The link to it can consequently remain unresolved and
defer the consumer even though the mapped provider is available.

Make the fw_devlink GPIO, PWM and clock parsers use the same map-aware
resolver as their consumer APIs. The resolver also handles valid direct
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

[1] https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

---
Changes in v2:
- Split the unit tests into per-resource follow-up commits
- Added clock nexus as well because the clock nexus series was merged:
  https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/
- Link to v1: https://lore.kernel.org/r/20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com

---
Ernest Van Hoecke (7):
      of: property: fw_devlink: Follow GPIO nexus maps
      of: property: fw_devlink: Report unsupported supplier linking
      of: unittest: Test fw_devlink with GPIO nexus maps
      of: property: fw_devlink: Follow PWM nexus maps
      of: unittest: Test fw_devlink with PWM nexus maps
      of: property: fw_devlink: Follow clock nexus maps
      of: unittest: Test fw_devlink with clock nexus maps

 drivers/of/property.c                       | 53 ++++++++++++++-----
 drivers/of/unittest-data/tests-phandle.dtsi | 63 +++++++++++++++++++++++
 drivers/of/unittest.c                       | 79 +++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+), 13 deletions(-)
---
base-commit: 91b1b8d437abe0cd83210d8f257b785a63047aa9
change-id: 20260901-fw-devlink-nexus-ready-c859706b019d

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

