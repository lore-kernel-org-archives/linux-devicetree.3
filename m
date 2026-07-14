Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F188527E049
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010504; cv=none; b=dFFp7R0Oe5U0SQSVJjTtPkv9sB+90UTakTyk4AkuvaSm+lNQLtGO54ZBvXkXBpRzFD4hNqDQx2ZxusmM1/W/1EHHvJn14JtlQmv5T7aEEQP9NJ2NnP7vtaUX9fyPPWh7g5/SmDFXngxe7764CRihM0ISim0lCnqyHHD5ztFQcq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010504; c=relaxed/simple;
	bh=M0eRETR/rM4kRQsJzoAQ0bq/TtjH3de46IG5ZXvH01A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s5G1W9URvp0jjC4+DO9TDbSSOp8pIscJEBHZe4GyuW7rpzumOsY/naZ6y0WkaoNSsNDMIgnMp1qt4BT/CLP3L+BLwnxii0bfxU3PX2r7kKCKhpoMnZv7TTVIQWd+zXZdatQ/T3uwanjZADiCZO7gssnJoITbjkOSPFO7r32w1ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBSmBhYD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBSmBhYD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caed617615so43678235ad.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010502; x=1784615302; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KN+zGCwqnRr77YLBHNGCvv6ivP6Fw2MCgfq05HPwV4M=;
        b=HBSmBhYD2ozJcD9NJmsY1qBDxrXQqS5uXA6VJ2torDroaisKqgCtAKF9Hxck9wsrR1
         scjbxZy47suoSPkSPeLS9ynWdKEX6lc5ITJEdz7qjtVbku2vuhRUCg+wXqPBzZQw9E2E
         XffBukUmq0WKki6jeDdp3ybNdnA5chRyoVC1ZsBcmjGPE4WchWBccm4CP3c0ifyMJexY
         beUXxX0rAKSo6YtFThNIiBk14qtUD0/38pSO3izJ0SOjx5AhyVCH0r/EzqxpYjKv8Wvp
         LaGCkMlTIDZjVtawKhnJNAxzRk9LQOJmcBEaqvt3Y4zikpZnZ7YvfsroGicBa0D1qo+5
         QtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010502; x=1784615302;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KN+zGCwqnRr77YLBHNGCvv6ivP6Fw2MCgfq05HPwV4M=;
        b=JH+Fk3cXxvrWL963D5PziuslDdc66iRkTrHMCwSt8KFr1V8zRsnQ0pecVhsJKAG5Mt
         /MMR53P2mt1qPrTrBqHLe1duPuaXPCjOr7gPXlDWi0GCqg54gm3IfhYGU4YdhzVV1w9H
         pFudQ/1G2ZDKoo4MV5Uj9t25c+tpdtcfg5N9KOwNGdKZ5Qz/VTnkx+EWfJFSIjkA975n
         IWNRq85HFUFyDzKxMhYKWlaH7VvT+kopJAUhJUjXWkmhIVz/KW39qs/bKoj7LsnkYKpD
         PP5MFjOb1S66JL2deN2Fc4t0TBD+KISJSPr34DdcoDEjzU32cVp2VZK0vnifJuozgHt6
         N4OA==
X-Forwarded-Encrypted: i=1; AHgh+Rpe6r4l25bbaXt/PqlJlWLv0OLxCQq0LGcgfhm+C+lLNm3ZcmjB8Yt1r3SUl25cjgAxOHEEZJ8KqFOD@vger.kernel.org
X-Gm-Message-State: AOJu0YwnrFzcIAjfiovCegHoeN504WE3wwX5HYDt1VsHN5l6l0mS+Rwf
	3v2RCaMqsEIziJn3p1LLIgCZ9Wh3BgsXhHv6wYjmnQ1rlvtW/ThsQdQidP/YOw==
X-Gm-Gg: AfdE7cmjxd+o0LyYxsiipZoa6eESnyLMzHZzRH3GHucfwCEwHtYp1PPZbYtKR6fpSMO
	LGx00WxSrrcE+nGWK+6OEmxL5xlxK0Ws8ckT0cTEPo5jxuloxu1+EYqMyqH+pq7awEYpBDk5Frg
	UnUGbtkPxn5FQdWr1QMXpRdcf1Btfk4iTYN5WUOlASEofgPJSnLQAgUVazWKaJP6Hxloc0z0FYO
	ukVEPS2TlbiRqJXKs1krnQHyjLWaUeQvzyiV66rHLeVHVBcfsADxeCkcjGfQz/ZXkp1matPNwds
	w/+1We9vzTQvCpYRsu172igvtOVQI0dxcTab7/9faOZWyuh82dx3RLAjkxrhRYcvXeYTCG/smyq
	OYBYhr8fehNvXnTc9hW6IPtsoKU5GO0mHgNWPe3pOAnlgtoVqxQJ13EOdjoQ2Op83W7pkWRRLMw
	zKHmHvvHAIkCgujn8S3zrON1981NY55wsIoeOVhk2ZnWoowcop/Qr8rzniuNuZjQtExiY4xMaeL
	KXJma4sRKlWVsfx0wH6f+Ifc93MXlc/K729NrYp7jRWmsnx/dmNDhJsAW2zl96j
X-Received: by 2002:a17:902:f605:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ce9eab85f7mr116798135ad.13.1784010502236;
        Mon, 13 Jul 2026 23:28:22 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:21 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 00/12] arm64: dts: apple: Add SMC hwmon nodes
Date: Tue, 14 Jul 2026 16:28:07 +1000
Message-Id: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2jHTKm3iyv8wLLAdYIw80mKjI
 fy7BdcuT3LuuQtEDsIRLsUCgZNEGYcM+lCA6+qhZRSfGTRpQ1ZpjL3D+Lp7TuhnJFefLRldatV
 A3kyBG3nvvVv14yw/2M1bZDM6ifMYPvthUpv3r50UElprTkTGl9bZa9vX8jy6sYdqXdcvU+5WB
 7wAAAA=
X-Change-ID: 20260712-smc-subdev-dt-0ca47062521f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5470;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=M0eRETR/rM4kRQsJzoAQ0bq/TtjH3de46IG5ZXvH01A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1/7wfGyQCeixe5ykE2YjmPf+GPu3ZPHj13K8VsQ8n
 VD3VPhBx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKoZ2Bn++2jMU27IMtfi+56cPKHKJdSc+em3U+Z1Mx3kN6jf/yezleGf6bfj39b
 lNC+/vtttxaaV9x+xf75jfCMuXti+ZEWzhcsENgA=
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
Changes in v2:
- Fix M2 series Mac Studio fan includes
- Link to v1: https://patch.msgid.link/20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

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

