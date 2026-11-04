Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795846;
	b=ez8bcKr1q7sF8ncAEGIEvJEub5U0nerFNZ/36tAhWniUw7iy5TeGPvV+CNbft5Rhh6Ar
	 ILHL8z7XMSr8hGc0KEknMBVQGvMbKmXgyEvHytpDLiao7HTy8tnhBaFFdiilxUYL68VN2
	 d0SJATNnIwRGdc6fPis0D2ZpiOpJK+jSxhuaTWJYrO21jztVZdq9BpZO8WPgMa/xiZRzQ
	 x3NLiWmXkor2fp48Bu8H5QhnydJWionYI7MAeO2pMVeOjyEojnwjle/NGQ2QrabthGWNs
	 724sBkUNksWyjRnDY5Tj/nk9MBAjRF6zOMc/PbUmanDROeUANhM9KgPfgMQGXKNSDCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
	b=DbOzDDAHpt41/PbvJ8zLT6r+GS7U1ZC4LkiX5aE2D9qfc17dLlT8JfTxsP4IQk5UL9KS
	 6UMg0wy0Ppodq9ki8nCcn7NdtrbBCxNLEBv0xAsSSd6Yehg9pcxEFRbkF/1x1ybG7NXw/
	 l+3nG3XOvfe+HZvvppsSXMoaRowcHa9aROXXcrrXrZV7SkGKdVNXDUlm3FWplWMblATyb
	 1kYEOMR5rF9Vm2qIm26YRPp43jv+AeXaE5xNN+8YWtwsbAeM0mqrHI6mDNY75XuiuNSaZ
	 1G9k60VxDn0O4f6fgNVjoGpH/iG/BF/NAMYurWyMDhXk0+GRYnOVhsLB+EFXk003Y+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI1fnD9u;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88C3606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KI1fnD9u
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e0d885929so529688f8f.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795844; x=1794400644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
        b=KI1fnD9u5hRLJSh528+5RgPH+B6BuXEsua+yxCr1VK4w73hltwPhHIGF7s/Fa67ftO
         dYnUdAwZmfhfnymgo8uPMS2IncIOIgRjUQOrbTFd+nMD1Tbxj/sXz466qpNffWMy8vht
         oCVKswanKnTEV7asx6O6Eii5ZQxTOjCOaeXMzihaAZBHh45cQ573/JfhtZKnme437EMF
         +wHr3K3BH6yhBAqAXHBoT+yr0MDGuXqtw0CcjloG2bYl6EQtOBDl4H7MfhymZmqIgEvW
         LWr5J4Y8qR34UYq0hAcCcy+K4DOarrBQy6U7GA2idfvll90gPbc2UmhM7lPzOCC+uS3I
         Q5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795844; x=1794400644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
        b=ZG2GpKzJVfdSbjX0RdgoQ/k3gSjRrasBN1UX1h6A/VC5GQTT5cerzIFfjmFJEx/4QS
         IOEgQXaY7u/Uhwyv2oY8SLGnmy/7sfwKsxdrq/S7QZxF7Y0goEHW1v6EFW1q//vNWUgW
         KmG7e4i2MyIBBflJOnq5I0CCRNhEqn30oG1LcO9xVjzgqVGpdjO5rVH0LcnvX0guMbVj
         xSHZOdidAu9fynYxhEwFltBXOqkqRetLo0GQ2PoMMcBuz8QFMCJd6rsmrdk4dPpsyBqq
         ZG/zNsg+eJdSDD84//M7luqxKBCbDbBKnJ+CE+u6Fp9zthoBu+qNX3+AQCwWW8FKId9r
         edng==
X-Forwarded-Encrypted: i=1; AKwUvBzScasKizPa/Pf5sQh0icT5Swlyn8fI6iI2tTQsgZrMl9vXPlxou2dfN4SrjzdXOwVTRo+es0nRLWTs@vger.kernel.org
X-Gm-Message-State: APuU4Z8fOxcoY1L9xmOOlA6VN3zfLggGcs4HiaIxBGbD6Fv2eRLdz+2c
	mARX4qYBmJiRaP5VJmOizZkwRzMyra0R7Ar12so+eAsUOhZZbVMgYtWe
X-Gm-Gg: AYBFou3b32NeM9Uht2QmGz6EWAO7DllWRRrkT/pWbg30I8Fa7Befnx7ehvkMB/V63y1
	/BIw/Js0TeXP6EGf0tGakh6kWtSpsFNflouqX3Xpl/Z1M92OZOUzQvqq4cltbdXe9+FRzP9vR2m
	xILMidnODW7kBpMe8jdoeTeXOzHKjDSI+yEl65PdvfD8d0h/wJudvkpIFPsjrQgKd7KVsgYsVPn
	KrZbf/O9ZA7zr4aZ8WfR6vLKYJ2DWSue2QB88g+RC8P6pPx3yvAC4xXPJriuiIJHZ7m7/GrSNi4
	ZKEym888qqXQ0X/qKtOsCUSjMiap9Lc4sX6M1e4C9ih1sYYjdcNkehKcboFDBPQf0h6aSYFj0Mg
	sc/fB72D+joUFdI0MCbD0wKVi+l0xXXmwLFT27zfeu5LGOZWqPzETm46zlSRzEo7I7a5rgmXAMX
	laF+pnOXWaU52FHZFo29/1jE/fiQXXvYIA3JSgIb5eDiIUc1LXfA/LEJkU+R9tsFFtPPxe33SAT
	yHM+KD2ge13ndV7qcjopDjnfjIjVHBhPKkVnLEmmJObQh6Gk6cQhH7WrJ66pItFFWlrnUWOahlZ
	RP6UbGFwl8In26kycV+CXJG2yC1gUhZGrNUe+sgSDjRiBx3vmw==
X-Received: by 2002:a05:6000:2c09:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-48e6e50089emr35262303f8f.35.1793795843957;
        Wed, 04 Nov 2026 04:37:23 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/4] mfd: aat2870: Convert to use OF bindings
Date: Wed,  4 Nov 2026 14:37:10 +0200
Message-ID: <20261104123714.234634-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

---
Changes in v2:
- fixed led-max-microamp scaling
- fixed max_brightness parsing
- fixed regulator init_data and of_node passing
- of_platform_populate > devm_of_platform_populate

Changes in v3:
- removed max-brightness property
- switched from dedicated max_brightness property to dynamically
  calculating brightness steps
- update regulator registration to use mostly core regulator framework

Changes in v4:
- set max_brightness form aat2870_bl->max_current instead pdata->max_current
- switch gpiod_set_value() > gpiod_set_value_cansleep()
- constify aat2870_regulators
- max_current in bl switched from int to u32

Changes in v5:
- drop max_current from aat2870_bl_driver_data entirely
- remove legacy gpio and mfd core headers
- headers in aat2870 sorted alphabetically

Changes in v6:
- led current set to default matching driver behavior
- max_current initialized with same default value as pre conversion
---

Svyatoslav Ryhel (4):
  dt-bindings: leds: Document Skyworks AAT2870
  backlight: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 133 ++++-----------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  78 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 264 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

