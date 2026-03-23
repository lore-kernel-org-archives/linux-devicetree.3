Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F61930FF37
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292473; cv=none; b=VyXL6LAysWXc8N99snqTF38oKG1lfDuc2uaaN80gSXo6UgChYJ6PhF/c+7nLaJdksqbv9RnG80Ps7U2ep2PgN44I7dgLcPacLKRL9KSlu32UWlOlsDNflI8VbZOvvLBjv1sR75w5hkcLuFA11F90z8RQ3Oul9RKDeEqIB+0bTAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292473; c=relaxed/simple;
	bh=HknQ5tmeJvs4F5JSI87UBv5DHfHkIOf0k7Z/bDgwvjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f5FRupXsI0uQyJsBI5WmeOs7Y/rH7WQNkEF3PcdPfcWFPaKMkU3QddxFGODSD8nKDGxENWqujQraQjamLC2bMMeurPfcXJC3A0IZ3un88aVaxA0hW0BvsK/0+XED0skwJ6BNVtVMrk4iQCR4qhuvKzDlkX/JFji1gjgluWRcSCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lcPsC65g; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcPsC65g"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so38470895e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292469; x=1774897269; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAQkTnFgl+8yd50clSd1ldbwKw7NVFGAMfnkLJg3I3Y=;
        b=lcPsC65gr8E4LsGwneE2qGH0tPp6ZD4mt/In70ELRusHQaVHL7KB8rglZx3nmBlsXt
         yq89yEtkhd6YGtABmtDp6l1bv83DVfJn/FnXRAe4g2vmk5VmUtW9FJNuCbnT1lnjbxQm
         V7KzxASPGGhTQHEAT4gRZJWq7zLknibDWkQmDKuU1L2eIoXSnbVHN6gXARMzhCgWgZpX
         rPUHdwsiKC0rlk7PlBmfigtgYrkmpn2YTCpht2D5Ke3GxngU9If+Gg6sS9Emn+B8Mz/j
         RqYcm9S5jSb8/fWFppRAtKbwJC3oQtarwwQ7aIxuATb9Vjweqwdzwu8dPW5qOix789YK
         oyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292469; x=1774897269;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAQkTnFgl+8yd50clSd1ldbwKw7NVFGAMfnkLJg3I3Y=;
        b=iC7+9ZlImZfCzkjr2JkeuzmoRBzY6YNdXIwcoWdWu08AGAX+1vQy6gafaIjmFJ30gS
         SgEQVilsLxsYCdp4keJxo1TxJgmkMoBYfi9dxAGtf1ILsdW3De+qKO11g4YVbmkvtdfH
         87kBvfmyS0Y20O/cQEM51iZEdvElZZuFYKbXO0QIri+e815azbqJ6YxJyW4HRtNiDUG0
         i0RUorIBRnCHbefXnhqZAL67cAIkVwyqszeEjmHPIT4c3ENKiNzBWz5Wm+AjLO8bEZh+
         3k8q6S4tTtgF1Hr+CLuomv1Gjxbxkded9xLvrpXezZ9JURHsm7z+nph8qOaxjXkg/3CR
         cNKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk+FUn7v+f9dM2GPC86JGGPPoKoLTin9Q9MEqE9NsNgXYMYMBmp78lKidbsFrWIJlneYJ2a/ZDBf2O@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgki0xLJVnJLFOzjtrVn6iqNY7s2rV1y+N5KNHJ3CcdB96rLl9
	EHtWBg4cbVE4qio30Ar8LxvhTRYgzPqz0AnA1nK8mN1qLU1jGxPWQI9g48teDkdjZwc=
X-Gm-Gg: ATEYQzy2RbhARPLdSqExfB+nl9av9zjERu49wxtKrw7ggRGlc/sS49swtx5CvTkCy+w
	y7GMnJnrrzsiIm+bIdnBZoJv6bGP3yPEYz32cCmOpaBGJjJbAApqT3eARj74CgSdr7hOiIprM/W
	YNi0wGMUUbmk0yFWw84on+pMsKdg8D4XMowqGExlrRbvgrYOYteJGuOvY0UvLxTMG+8LX2yg8Ct
	Bo0T6IP7sIVMJjEkfgdS4xws/DEAnGGy1o8oz5UOJoQH1mRhEIHTfeKrF4bLUAmeeCVgNWLX+1C
	MG3NxVE9A6mpN6/RE54oEECnl9JA7YyweN4YzXvg0L73Enha8ATENWYd3TFtLAkaD2/t9fVSff2
	/ypGTC4P0x9S3dXqcOOj0HyT06/yF5cmD2cz09osyCc7qHPdC8kqoq51td7VOaWABXGa/FnNoq/
	A9SooTllIewwnwA6MHOGTECsaepmaN
X-Received: by 2002:a05:600c:4349:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-4870f1fc613mr5830435e9.7.1774292468497;
        Mon, 23 Mar 2026 12:01:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f822b83sm1713765e9.4.2026.03.23.12.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:08 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v6 0/7] gpio: introduce a GPIO driver for SCMI
Message-ID: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This basically abandons my earlier attempts and goes back to Takahiro
Akashi's driver.  Here is the link to Takahiro's patchset:

https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linaro.org/

v6: Fix a build error when CONFIG_PINCONF is disabled
    Fix the dt-binding subject and my email address
    Use pinconf_to_config_packed() instead of PIN_CONF_PACKED()

v5: Addresses Andy's cleanups to the driver.
    Adrresses Krzysztof's comments about the dt spec file.
    And almost all the subsystem prefixes were wrong.

v4: Addressed Andy's comments about kernel-doc
    Addressed Rob's comments on the spec file

v3: Forward ported Takahiro's patches and added some fixes ups to make
    it work on current kernels.

AKASHI Takahiro (3):
  pinctrl: introduce pinctrl_gpio_get_config()
  gpio: dt-bindings: Add GPIO on top of generic pin control
  gpio: gpio-by-pinctrl: add pinctrl based generic GPIO driver

Dan Carpenter (4):
  pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
  pinctrl: scmi: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
  firmware: arm_scmi: Allow PINCTRL_REQUEST to return EOPNOTSUPP

 .../bindings/gpio/pin-control-gpio.yaml       |  59 ++++++++++
 drivers/firmware/arm_scmi/pinctrl.c           |   2 +
 drivers/gpio/Kconfig                          |  13 +++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-by-pinctrl.c                | 101 ++++++++++++++++++
 drivers/pinctrl/core.c                        |  31 ++++++
 drivers/pinctrl/pinconf.h                     |   6 ++
 drivers/pinctrl/pinctrl-scmi.c                |  46 +++++---
 include/linux/pinctrl/consumer.h              |   9 ++
 9 files changed, 255 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

-- 
2.53.0

