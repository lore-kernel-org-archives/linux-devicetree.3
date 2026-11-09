Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221377;
	b=ZOqEcffPzA26RM/eADFzaLiEpivxE48CLeG60weYZqVxqbQowtprjwg7rP+RSPXaJ+Af
	 895Ht7wH1MMWm/ppj+O9+p9c6ww8qJ507MRbe3xF33DOtGO1FJY58PrADctUGTcJDLTo6
	 DPVYuRTfn6QX3qwz/ZihV6nETAOpCWA0/NHxmvMDt77Fs5YwVBI79YRxTv3Vhtaoce93S
	 vVpgnVzL3I4vAJWMMSIloZkz6SyTQPrbR5TUF36LqfgR5ubxo+2YbEe/30Qzi6bVjLUys
	 G3pkdeIenzBFYJ9IXlZhNqDQTQ6V5bnZTCsPCTh3kI9GGUJnaEkMizdn4mTjh1Jm88A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
	b=Bk+ieiQQW0WP5HGy2/Qo1eEkqZejX2M8bzELEnVSP/915twd6vwInjK0SK0/kaZfEB/v
	 QXOVIf/BbOxKPYZoZrORehR/XFwsH4YTbeNhqjdhiYbIRqwywuCqygPLeJky4fB3Z5ku+
	 yUxJc590re0KfgmPd7iHJNGD5XNPfXQWYf65CRGttTJQjyImdBA5MGk62zMCbfhT4AD8R
	 X1igMiDw4XbycNkjf82ENph0byQqcZ1rFcMDUVsidUpw0ehF1aknnfVWMdknWCk+N2h+W
	 Ev3NbQoW3fvh1PQEsl3tzLc8BtNqhqRcjyh7MCZOdmnVklYa4YYp+xVdIjJPNi3oxFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhuvuvXX;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF4606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 10:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CF4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhuvuvXX
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso3240445ad.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221376; x=1794826176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
        b=mhuvuvXX0rIaEIqZ3DzR1FBgAu21NuHPq7Q31T7dFQOqeblaWlH9D1o+q9ykUC+Z6D
         sfTUBtHFNuNKu/0W97XuHP23fA2bJkNE9yggNCNrR1M/vXLFuLRK/l+/fLLmYYPLiXSA
         d0xl8e8ZMlhvge/faXWUC8mqUhtRzeYCOJCc2xWMPAB5WHlH3Q9NzA6xDRWOgNpKRjds
         FZQXe5ciiNXD5CJBbKjeX9XJoKsKHtdSV3RKYWgG5adtQEhRNTl276P2PJ99JamMM5d8
         iHn8Z+3fmQOdLTzBDWrPh62ezoPUQumOtOcgdtc9VgPTxHf/U+cbZhNGnkiuuSsrDckI
         VysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221376; x=1794826176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
        b=zdavYjwoPBHBwS35tVRAiYIed5piMK0i4loCKkOxmI9XeISHpceMYPVrOFngbts1R8
         Ev4r3qHaQTM0yAE0QTyjiboHFYNeBE507AdboSlCCKamrlcjrNM6CUW0sbL4lL7nfrMH
         r8LOD2QutaGnZJ96/OmQ46ZbXHtyffX1IECvl3pGKdbf/G0diYZC50ouconowmmF9W8J
         nQwloSVudk/U3Q++B/bzRzN897Z3r01xHI9HVSdZHCIQYxs/XYg6j/AJY8ueVDwLS6DR
         49mKO38W+dLhoOJovx0gN9TsQwHrhGhdKSX0VGNpZZnzx5F7atbC3DMciUtUM8FPHVkG
         oq5A==
X-Forwarded-Encrypted: i=1; AL+hErGIpkEm1pBmfsrlav0avjr+weKM8H+zf1RjFK77MmNKy5hE9vV6y1ZG03TSblzu8W5oZC5dQ9WlXnFz@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZyK8hJyDNxmK+TrdVK2TM01X1rsGrosNWQQAflqnDZrF3b2eN
	l6/ykCrG7WgEOtHYt9VWtJbNaQlruhf4f8vmwFW7uo0uQKH5I1P0fwme
X-Gm-Gg: AYBFou1ksA9sLW7nGwypS8mTE9NJmZrL75QhgTpqCFgXMYCQkAgiE8rJ4QPrisNikzF
	3T7vx5v/cnY+qYs3M72XLVUjK6MjJbBoIjiUT3NHtUPA+9IfYll//DvfoX6syOpdaBujRVU3K+Z
	hksOZqohkJXblkBJKJE057CBZmMTa1CoD3rC1MCxK3+aDgu9AUnnk8RDBT5p5lOdUsyf6OoBeaP
	/aZiyOYUxkzPtH8q4VzJwJQMrpEyCso2Jf7CDSP3x2Qt9w0WNavHI0onwDhUKPEjmn0tfbRMM7e
	WL2zjr6ulOsnJ+UI8EzW2FpBrc9jDwf/b8hRs8ciqPB6e4p8PN0moyPvi9ti3orYg3LtjQ0nekv
	H0rK1WfwIcDc4uaMszZ4IEetZsi1rst3qS4XekO4Y+5h6rnmLZLmet3gDaRfTDBiHeFouRZUYfr
	4CZ2KsGjcJSSF+4YMea+IlYplTkb5gWLwwN82GEtYJiM7cUE+OfPwkFHVd0RowTa+/SOo2fcUYM
	TS/lp/XqQV2rPggHXTq3dRSo201A6O9qDCM2/hh4osvt8UWdn8DutxjfGfWop4J+ki0c2RLASbZ
	fFOQpdzemO9lN9FfB93ZYHfK4OnxPbuaEi2cu3e/HtOkOmVzFpc+IQ36fpcNiRwBnzE/MIiXf6i
	ja98x4McXpUE5vSXw28aSupTa3k1G99B5raaLWNrGeUBTZV6wnG9ukH1HPJI85edIu1Q=
X-Received: by 2002:a17:902:d588:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2ed8375ffaamr41615415ad.19.1794221375807;
        Mon, 09 Nov 2026 02:49:35 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:35 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform: arm64: HP OmniBook 5 16 embedded controller
Date: Mon,  9 Nov 2026 16:19:12 +0530
Message-ID: <20261109104914.1534-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
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

This series adds a binding and a driver for the embedded controller of
the HP OmniBook 5 Laptop 16-bf1xxx, a laptop with the Snapdragon X2
Plus/Elite SoC.

The EC sits on I2C at 0x76 and takes commands through a mailbox. Its
protocol and its command and event codes follow HP's ACPI methods on
this laptop. The driver exposes the fan speed and four thermistors
through hwmon (the thermistors can also serve as thermal sensors for
skin temperature zones), the mute and mic mute LEDs, the keyboard
backlight timeout and level, and the F9 and F11 hotkeys, which only the
EC reports.

The board device tree that uses this binding will follow in a separate
series to the Qualcomm maintainers.

Testing: the driver has run on the laptop since late September, on
Qualcomm's qcom-next (7.3, latest qcom-next-7.3-20261031). On
next-20261105 the series builds with W=1 and passes dt_binding_check.

Rahul Pon (2):
  dt-bindings: embedded-controller: Add HP OmniBook 5 16 EC
  platform: arm64: Add HP OmniBook 5 16 embedded controller driver

 .../ABI/testing/sysfs-driver-hp-omnibook-5-ec |  19 +
 .../hp,omnibook-5-16-bf1xxx-ec.yaml           |  49 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/arm64/Kconfig                |  17 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/hp-omnibook-5-ec.c     | 417 ++++++++++++++++++
 6 files changed, 511 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hp-omnibook-5-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
 create mode 100644 drivers/platform/arm64/hp-omnibook-5-ec.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.53.0

