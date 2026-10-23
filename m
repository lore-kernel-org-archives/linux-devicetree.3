Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749847;
	b=uUDpgpqRPeT2b6A9YvzmLiGs46ZnTSf+MVg4i2Xc98B+2wLRYtX/kn/OEoc0D+1bD1bs
	 RVelsHP6danJBAVkCTYcrucJlJiGQcjhmWnAZkfICMJwLydSRMTE+ivj1JfuVNbZ9CAdG
	 eWEVDHp2yhT6IClxJ61wLFfLFZsghjAUCpmRVF2AV15S1Qk9bJD5RQDLLlcw9TnK4lQVj
	 oHzD6iwMbyBv9Pww64BFD3ip7vIS91N4oEmPCiaaOUzFvxIqHPFV2sf7kZiiLeMSLNZZ3
	 pXav4JZbYF0iP5xv+WijqTLtS5blSbiluUp145XZpyCHxxIYihCxRyygguxYPc7S+gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uMSmtL8aALIL7nW1ScT+iJ8InFRsxd+68YkyGBJ0A5s=;
	b=BNkiqlfSvqFruLrc7U4Pl/GMriCElS/jEeWEefireYJWP93pEg5uuK8AurpmWw3JuJWd
	 VCFryd7JvMY9cZd8n9w1NGNBl0+Z3N1Jb9c6jHN3mmY00vZpdVWFunP1E54ZfbrF8zCJ5
	 8Srxvgxp2l5OilUHDt0ZFrzgS0uuOV60AD5uDL7+5ZLyr1V1sZIGh1Vjs/39BM4yYhz+v
	 Uu2F4mLSrkv8Mb/x3sgT/i0HCGee+aZNyZ+XlTs1OpoL8I1WVGC4y6QHSLOYrpUY+rowK
	 bi8kyvIHA2eK3Rj/w4fqA5i6E1/W1/X7klyRT0r1uQMVwy5jByoV6xTBQpOKVbAAz+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mdifZK1c;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3EB606A31E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A3EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mdifZK1c
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso11219185e9.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749845; x=1793354645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMSmtL8aALIL7nW1ScT+iJ8InFRsxd+68YkyGBJ0A5s=;
        b=mdifZK1ciy5XSd8Gf2qveGaW4UfjXieOLWuZf2VGaPr6OQpj+wI0/4q/K6jj6JK9k2
         lpCp7MvIyWCnm+Sj6E9TGHNPws17sjIX0rPsQPoVEjBHlsR1b7ciQ05ifR2XToLr5ivp
         jT3MHzprvRGitkFnW4BQD9RI/9WDIZXj1GeU9Znc+L99HspF7QwiDli0rOsk15skHy8C
         5CoGluNGh7/gJu8nEhUS9dwVgKaUXzehOGIRK6saqou+GByPeyzZGVlTPINqr382KB8/
         B+pg/WLDw3FFgLh8TPRFUOZuX69VGxFHcrnFbhdPxp4+l23Gq/lADqHiJ1t/CaDnqaiY
         l7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749845; x=1793354645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMSmtL8aALIL7nW1ScT+iJ8InFRsxd+68YkyGBJ0A5s=;
        b=M/oVI55hTRcJfS60GJbV2QO0Ja0BU/hfGbnuqOY/H+HqltCZg7b3yPyLbZzdtA4+nX
         NQk9YtDmtsCdm6Bg35VtUgY8sUFJ5Y7iFob5sth/IeQvwSKn9G5UCkTXuSA24E8ZJTVC
         i0TwkTTjwEHDGRDi6rlePE3O7b0hRN/zgrb5yGrmJC/qC1p5k0oeXVg5qQSE81+G7yp7
         zDbpO/aoYPnruly5ehxuKHpseFHcZMh28litRQmHDjSnm5wrVFmj7T31eW7LCmf+4iTu
         casf8MYrEktX2eD35Cdfz/wY8NkC/Xn/F5FaNuM0XKxy6x+cy0h7q6DLDEoLaDm1qZ/E
         9W2w==
X-Forwarded-Encrypted: i=1; AKwUvByqNe02VSbUrVb2LacY6P+uc09rF2Wv3MnCSl7Rb+dlotM/5fNjpUu/goVbkOcSVs/u7oRsJWCnARYs@vger.kernel.org
X-Gm-Message-State: AFq9FYLHYoZzuFiGhiwShTaF4KUP/0++P+ejh0WpUCc4ADiJkDkuXmSV
	oUzVGx1Ug6XV4sEc6lwCZBKji3wL3ZV5BF/9QQ9bRbuVNRranchxo03ncBj6flHu15U=
X-Gm-Gg: AYBFou2eJH1H4xJ1yWsIcte6vTLa3E90EV6N4CUZ3Yxf4y6vhAP5spAAUa8y2paMBq8
	fjETO7BN4j0aHXgAz/rxOZE4gIZxypnLsRSG73Tqb4TjgaShvPZzQnRBTrnEbzHMY47ZEQUFeez
	4I9Q91oOpcA4iU+f4SZcOd39i7fGnLHnuvkV50UaC8VgWL9nqd9TJBQOpdL74kswNGIvn3W6ayv
	hIkM3R3Z4txn6/6ChCO75hnQFeWDluuhA35RFsJ8Vvy16ezn1+xYF1ukfjvUanx3aoAeYCxVISx
	4jJPlc+UruFjrvS00kqQx2rn8Z6p+LVIAkLstaIWE3wAxGLKSCKbWJs/t7CPf9xwWKo+ArfDUkh
	4LmgWzYiLuTBE/oYK1wjGXHo7GbinnKUwsvhpTAtKswbCBwa493y8IJ40K8iwAUSLXl0U5pehWY
	WS1zKfM3X7HzA2TYtPEYzPzhl4BM6x/iCPriMBJvmVP7WjxlmjQE8l6EECCs4uLw2+8jZmbVLbw
	OSToAwVSwyAUAJGGd2riQQZlODRB4H6TKwZbd3JSq0uBMjMvYZDNV/JuvGORqUAasDmghznCy7z
	PYnMp4GeHdUh
X-Received: by 2002:a05:600c:470d:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a211c51ae0mr27667465e9.5.1792749843285;
        Fri, 23 Oct 2026 03:04:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:02 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH 0/7] Add support for the X-Powers AXP2101 PMIC
Date: Fri, 23 Oct 2026 12:03:54 +0200
Message-ID: <20261023100401.67592-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

This adds the AXP2101 to the axp20x drivers: the MFD core with its
registers and interrupts, the regulators, the USB power supply and the
battery charger. The PMIC is on the HiBy R1, a music player built on an
Ingenic X1600. It follows how the AXP717 was added: the existing
drivers are extended, and the two power supplies get their own
compatibles because their registers differ.

Not handled yet: the PMIC's own fuel gauge (the R1 uses a CW2015, and the
AXP2101's reads 0% without a battery model), the power key, the ADC
channels, the TS pin, and writing the input current limit.

Sources: there is no datasheet behind this. The register map comes from
the GPL-2.0 AXP2101 driver of the hiby-custom-kernel project
(github.com/Jepl4r/hiby-custom-kernel), an open replacement for HiBy's
closed module, and was checked against the chip on a running R1.

Tested on the R1, on v7.3 with out-of-tree board patches:
- The rails the stock firmware turns on (DCDC1-4 at 3.3, 1.1, 1.8 and
  1.2 V, ALDO2 3.3 V, ALDO3 1.1 V, ALDO4 3.3 V, BLDO1 and BLDO2 2.8 V)
  read back at their stock voltages, and the regulator registers
  0x80-0x9a stay byte for byte as the stock firmware left them. No
  voltage was changed from Linux. BLDO1 and BLDO2 (2.8 V, the LCD
  supplies) are switched on and off from Linux by the panel driver, which
  claims them: bits 4 and 5 of register 0x90 clear and set again with
  the screen blanking and unblanking, about 20 cycles over 8 boots, with
  the selectors (0x96 and 0x97) staying at 0x17. That does not change a
  voltage, since the registers already held 2.8 V. DCDC5, ALDO1, DLDO1-2
  and CPUSLDO are off on the R1 and only come from the register map.
- "poweroff -f" turns the R1 off, through COMM_CFG.
- Unplugging and replugging USB gives one VBUS_REMOVAL and one
  VBUS_PLUGIN interrupt, and the USB supply goes online 1, 0, 1.
- The charger registers read back as the stock firmware's values after
  boot, and the battery status is Full on USB, Discharging unplugged and
  Charging after a replug.

Every patch builds on 734bef548a96 (v7.3-7363) with W=1, passes
checkpatch --strict, and the three bindings pass dt_binding_check.

Open questions: whether extending the axp20x drivers is what you want
here (the alternative is a driver of its own), and whether programming
the charger from the monitored battery at probe, read-only afterwards,
is acceptable for the battery supply.

Olivier Louvignes (7):
  dt-bindings: mfd: x-powers,axp152: Add the AXP2101
  mfd: axp20x: Add support for the AXP2101
  regulator: axp20x: Add support for the AXP2101
  dt-bindings: power: supply: axp20x-usb-power: Add the AXP2101
  power: supply: axp20x_usb_power: Add support for the AXP2101
  dt-bindings: power: supply: axp20x-battery: Add the AXP2101
  power: supply: axp20x_battery: Add support for the AXP2101

 .../bindings/mfd/x-powers,axp152.yaml         |   3 +
 .../x-powers,axp20x-battery-power-supply.yaml |   1 +
 .../x-powers,axp20x-usb-power-supply.yaml     |   1 +
 drivers/mfd/axp20x-i2c.c                      |   2 +
 drivers/mfd/axp20x.c                          | 107 ++++++++-
 drivers/power/supply/axp20x_battery.c         | 221 ++++++++++++++++++
 drivers/power/supply/axp20x_usb_power.c       |  86 +++++++
 drivers/regulator/axp20x-regulator.c          |  88 +++++++
 include/linux/mfd/axp20x.h                    | 114 +++++++++
 9 files changed, 621 insertions(+), 2 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

