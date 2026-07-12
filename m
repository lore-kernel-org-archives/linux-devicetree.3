Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096AB399357
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849453; cv=none; b=f8kBpGetzIsesL6gP+EwGpYIRgCwZ56Mc4BmQUBvJeftZzBHaLaoZUpYZPilLUp1YLmlLEEN1llO5kc+7HV3L5Yi3CLz1AER444yfBicgleBDp/ETKKoQPjKGyokCtT5pG3WbpbwdRuTaL5H8ApH1+lRFvd/k9lIvEPG11q6ReY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849453; c=relaxed/simple;
	bh=YNi+KaL09fSqJUFhYIm9Pv1YZHlYeYppyCtgEVXaTS0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sI1P/+KGMe6lzwjlcWHXCQpC7fzM9SeBOwKOn/b/hT5k3uYDnAc3wqJ3pfGvsEprZUHnhYI9AY/Du9ziae1wWeMYugKDTRfZRTGwU6Z3h6/plivIlzofoHgpKGc9k2CPuv3+g1MGSbnz8vy6lx9h+JPl1DYk1shQp4mh7LJblnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leL8fud7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leL8fud7"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso2150732a91.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849450; x=1784454250; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rPmXWzvpcr2U5us8E3wSwDjB0cnRDNPHHdHK0WpIwuA=;
        b=leL8fud7FAHp4yEx0rgtBnnvsc/WKud3ZcJceqv3gIU7ySeY3lk6Xn+7zkeREOd80s
         wS7AJfiUlFKKaEBIU4IAA27E+w9PCoaHJqRmDbqf4Ihme+wBFxmpRltEqbHpSocvXzSg
         luhYK2lm6AfalkWkYyet/+1szQgGsgqULcO09lPCNot6B3jfAMcL3rn3holPRYp13DeU
         /bAngQC3fMdw6kHTYsCAU6e4EIPuNPgXxratMRiKFnkva3zF9osr14RN5hby4lGdVSXG
         ohxiX7bz62N2402f+9nswhi9og1bSu8J2WkjffuKAIrpeSy3h7nlCWaYQi0cxw+qXLnV
         OdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849450; x=1784454250;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rPmXWzvpcr2U5us8E3wSwDjB0cnRDNPHHdHK0WpIwuA=;
        b=qygYH1Rju8hfg1XAXdhvVNLIhLGAbsPLX3BU1MH/xHkIl+UqZw2UgtLPPXmufL8eLv
         q6UAsTTkt/XzF0uTAJG1vfC+HCbIc2ovCxoGkiH8hbDr9f1yhnG8QNiswEmK4Xh7lFKq
         XH1cEezZIJuY6mOHAhf75E0oBbknL8Y9u45hBtPnaT2HFC4w6OzoKVD9bNZ7AAxj0HEE
         4O4qS0FlBWsE1b/c0XpYla9XPjCUoyi4AUi6UWhC021kjtVtgkA0rQKHUdyeBCjWhUv3
         RRyB+9bM/gAYDAXtTSJn+lSyr+3LRNwSPRJtFLH7OohUlFriVBcek6VohpadltTPwNcl
         ZOKw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6xps2qP516INFNG85d+/9ALVYlGIwjMM/KoM8F0BojiT6CC9t/oG5aEGW+aeAgArVQzCKwpzYFy1k@vger.kernel.org
X-Gm-Message-State: AOJu0Ywby85Mai6QggHsRcQfciefIakvOZiytIqFJju3odyWbQFaxfFN
	/Sz6UN4+4lxt0DUbLo+9y8Q+fZZy5PQpMQ362PkvogGMNUT5qfVhYQN2
X-Gm-Gg: AfdE7cnnig5BVmijm5Pn+qb35XOXMqYUwmmSBSpeH3Hq9846ilsfr2slnm5g3E6dawZ
	46OirhbY2Ih0IFLYseNZR5XO3Ad2+uceWDUwxlIZJrE0h0EpA0J1ubfIF7xJiW/yIhnCJCe6Q3i
	gwMRTHaI9lAMkysK8I/0FXfUJCDLUd43qR20OARPb5EaSGI0KcbtEuABYRrpkGOto3o/Zv4TAki
	d4yjQU8ZRe0GIsjYbRnPYDmkHh4cyGFqX1PyCGq15eosu9U1Avt5x4quvKnMN0ApT5TVpYDAA3w
	sbQEHF0Gfhwy08QymG8dV5BoIlF/JkhMjCfyJ5OkDmNt/T/agmumD3EavyFFJhd3Jkv6BtiDbVa
	NHinuQYTcomtYHP9iWXq2pNw2usA8xyvpqOCu/KxoXx/9MDUlgNQro0Zhf65s6924VwvxYbobh3
	h4Us0fkuoVjsc45E3DkSPulL5/TWP6yBYN3mEsaDVXs6T/ifwE2hoWkPV+Jg8gDayMo6XSQi0zD
	YC2igUtz9JN30EIHOxkZ2hy+7NuKhiNsIOV9koaZ+FuCq5yT23fmxzxIragn89O
X-Received: by 2002:a17:90b:3911:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-38dc72b44c6mr5259932a91.0.1783849450298;
        Sun, 12 Jul 2026 02:44:10 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 00/12] arm64: dts: apple: Add SMC hwmon nodes
Date: Sun, 12 Jul 2026 19:43:19 +1000
Message-Id: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mj3eLcZN3i0qSU1DLdlBJdg+REE3MDMyNTI8M0JaCegqLUtMwKsHn
 RsRA+UHFWanIJyBCl2loAYoy1bXEAAAA=
X-Change-ID: 20260712-smc-subdev-dt-0ca47062521f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4957;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YNi+KaL09fSqJUFhYIm9Pv1YZHlYeYppyCtgEVXaTS0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/eKAhPs7t7/lyq706ND7fYvWe6iLJu0/t0bjtTj
 2HezxeqHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlmX8jI0HxEMYLHwVl16YH/Rd2nXkemhFX5r1Wcxe67+Ml6T88XxxkZ5hg4vev
 jrbwWlvhNxD6le3fgZ0Hu0rP+IT7/zm57sOU+JwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

Following on from the series which added SMC hwmon driver[1], this
series spins out and adds the Devicetree nodes required for the hwmon
driver to operate. These were missed back in December.

The System Management Controller on Apple Silicon devices exposes
the temperature, voltage, power and fan speed data from numerous
(potentially hundreds) of sensors scattered about the SoC and
device at large. Unfortunately there is very little rhyme or reason
to how Apple expose these using the SMC firmware's FourCC key-value
system. Some sensors are reliably common across all devices and
all SoCs, like PSTR which measures the total platform power consumption.
Others are specific to a class of device, like the fan control
keys, which are only present on devices with fans. Some are specific
to a single SoC, and others still are specific to a single device.
To complicate matters further, some SoCs are not even consistent
across devices; the application core temperature sensors for a
given SoC are read from different keys depending on the device
that SoC is in...

Trying to express all of this in every device's Devicetree is a fool's
errand. To eliminate duplication, we instead use .dtsi files to
compose a set of sensors for each device in a saner way:
    - Sensors empirically proven to exist on all SoCs for all devices
      go in hwmon-common.dtsi
    - Sensors empirically proven to exist on all devices with a given
      SoC can go in a SoC-specific hwmon-${soc}.dtsi file, much as we
      do with PMGR and GPIO currentlyo
    - Sensors empirically proven to exist on all devices of a specific
      class go in hwmon-${class}.dtsi (e.g. hwmon-laptop.dtsi)
    - Fan control endpoints are reliably common across all devices
      with fans, which will #include hwmon-fan-*.dtsi
    - Sensors specific to one device only can be expressed in that
      device's specific .dts file

This series introduces some basic sensors we know about to get the ball
rolling. As you can imagine trying to find every valid sensor on every
device and figure out what it's actually measuring is a tedious and
labour intensive process, so expect more sensors at some point in
the future.

Regards,
James

[1] https://lore.kernel.org/asahi/20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com/

---
James Calligeros (12):
      arm64: dts: apple: t8112: Add SMC hwmon node
      arm64: dts: apple: t8103: Add SMC hwmon node
      arm64: dts: apple: t600x: Add SMC hwmon node
      arm64: dts: apple: t602x: Add SMC hwmon node
      arm64: dts: apple: Add common SMC hwmon infrastructure
      arm64: dts: apple: t8103: Add common SMC hwmon sensors
      arm64: dts: apple: t8112: Add common SMC hwmon sensors
      arm64: dts: apple: t600x: Add common SMC hwmon sensors
      arm64: dts: apple: t602x: Add common SMC hwmon sensors
      arm64: dts: apple: t8103: jxxx: Add device-specific SMC hwmon sensors
      arm64: dts: apple: t8112: jxxx: Add device-specific SMC hwmon sensors
      arm64: dts: apple: t60xx: jxxx: Add device-specific SMC hwmon sensors

 arch/arm64/boot/dts/apple/hwmon-common.dtsi    | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi  | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi       | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi    | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi      | 16 ++++++++++++++++
 arch/arm64/boot/dts/apple/t6001-j375c.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6001.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6002.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi      |  4 ++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6021.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6022.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi      |  4 ++++
 arch/arm64/boot/dts/apple/t8103-j274.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts       |  3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8103.dtsi           |  5 +++++
 arch/arm64/boot/dts/apple/t8112-j413.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts       |  3 +++
 arch/arm64/boot/dts/apple/t8112.dtsi           |  5 +++++
 26 files changed, 186 insertions(+)
---
base-commit: 44696aa3a489d2baf58efa61b37833f100072bee
change-id: 20260712-smc-subdev-dt-0ca47062521f

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

