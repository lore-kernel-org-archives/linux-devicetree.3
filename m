Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541583;
	b=g/NL9ogxIg2oeqp9605Iqrn6CHi6qOeA4mGe1bIEO2v8oyCxdyLNxrSnkF8yVOLHkYLK
	 8VWn9zcoVk115SYF0MwEd2v9RLAu/jAXVZf93Txx/FhIgXFb68uLlEDEIIZ1K3eCbig85
	 p3waN3jMvCfxHcW59bvZqs7oz9Z8sROWZk0aLacKPN6zDBMiF1iD1BselURscSj6B/l6G
	 X8iva6PcRCmxzL1oCka4HhkGK60b6mKucz5x/QVLqoRba09o8e1Os717vcoYkDWhYOaRs
	 fY96xeIkrPlpWr3rhOX7XoEtI8XNYD8NniO+/Aqq5TqNz/Boc1IPis+TBBoGJ1WIPiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
	b=ug9oTBib0UgUnigp3t2AdPTc8ZYnR9TC/uS8AZqZ5NW4/izWSvW+mxImN6AgGS8KfsOq
	 Ax9t1oOT/h5DmZoERws5aELatRzRuXmBSASnU4iVD12EruzZf7fM4Qduq2DCeijpMvzGJ
	 fDnklKGts++wXOIyWacMj0FACrRcde2ZIQX1gKu7jdOMDaO9oIhWMikBCU0v78vSD/kfF
	 6D4035eVTjhe+Jlsq43DsJpe9Kd5K5sBXRewhblg9DhUvN65y3KLWi3Euf0VNXjPhX3WZ
	 kCK280elf8/U/NE09+O/INkvYQ5h4wvwx9ljCF/1L7NsUUQw+5ueULOnN+HRmRaqj8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RXwJn5AG;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CA60A2603
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62CA60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RXwJn5AG
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a357b1c649so2842820f8f.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541581; x=1796146381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
        b=RXwJn5AGyO6dganRr8aighjFMZJNJh4XjfhOO2zFgOYt7YFmihqlkoSNP/Sd2qk7mR
         FfbpIqRpuaBVKaT+fMr4hUegmk8cVx6CP0R2/cm5K41diZ5crRoq0LTYsfsSc0xlGEis
         4wTTWUI8MViemNC3LrHUXWWpCCIvfPI8YHfyVz7VNAJKkQIJeYbgJKBnhRpzIckcSeSl
         /l/kI7mn0mx36m4fmMzXi9hpGqVByRsyhWGpUAtHxlchwVQGBJ73cKW/3E0pMSVOeJO+
         6oSjyXnQidug3UWD3+bGNMTRkr5z1+35e6FlZZ9XnGhhqoRHAfbz48Q6kOUeMZGbDIzP
         ARIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541581; x=1796146381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
        b=eObweSIUbvhpLbRi1c1ALYhUm1hwudJDwOqIpBvLaL+MfxzLTs6YirzZe355RNCRTp
         4ZIiWRrRAcNRKjoVa2ZC271mwWVSyBazYD3fJ7lxvkLDMcgW1sb80MfSRcrKOzQszRwR
         2zJkDPmCwriPoSlaZCMX40kD7/IRTCHTA6SXE1/MIeUYbPsR+Nj8pjkZBOuktKClJ8Qe
         yI7kUbvkJgc6yax7z3zO3NvPmiN6xcl5VvEwcNNdazdB3sjdMCfhaJy/bVH8jmAHb7hZ
         vVoT0sZIesifOxQDVPv7fgSujb5bU1B7bvZtzPahyYOoq2oawHzqKKQRq4llUXcUmME/
         9Spg==
X-Forwarded-Encrypted: i=1; AL+hErEwLNECel5YMIuts43D/ROFlz2tRFoWeF2Dwv0dYW884ePT85WjLqOMcOgfa8x7N9XM8WNW8oH/UaFj@vger.kernel.org
X-Gm-Message-State: APuU4Z+GdMQ41PZLy2drBisGe8ZsH4cDLOAS/u+jGN7i4AT5aGOWFHzW
	sIigdfHEgL+/dqbB4T5WEZziRna5KGpa6KyBY98PQohAqIjXmfGRuxIXORXzpWa38bI=
X-Gm-Gg: AZFdTZcVx8PkjmdGTeRf+8mTRjBfTcxnBT7JmEFJcHoDcNDThF1tPqjaXoi20JJsNde
	J4z4y+cC6NCRf6uuUEGTli+XJF3zVFoOw3W6WQref/sORe0EnDsGfRHws+8Vcy0bL7tgIQ/Wb+g
	q9RHadD/UMcLSxRdV6EY9yF2fe9K1NeqPy2IAc9Yna8vga8hH2VC8cfaPpGNojApqJURPiNSKhD
	Ji4vRaB61xgxN5ezBFDXmy5OMzZzDjxOCumW+/ZT0olLy8mV2+XKl3RAjkYuMBrZAbcEq3QPZXo
	U6k/VFwmWB//r9SrB3B+KFr27Y0hn3hmXcSFUym6B5CqfEy6zbIJnF0lFxuX7lyXRaYti8V2kQ/
	cm1zql9d2GADcW9KZkD0k8Y8EOMGDplvlbvNSdlMHMXE1XBMxC1C0FX1V5W7q/b2tHO/UkulgZl
	oJ7q7jJZCq9Ml48xCh6F5PScjXXgwyzXfhgWh9gJf/oHYW8onCr0aKFMXPDGQ1YZHxVnUTk2t0n
	2UUwEnZhM8VJVRaMCelm3ZrR1B/cdh8pl2aaKHL6mh0/45Irr2fs4qX/uyqzMCdQ4To6hJzYGuR
	vbZlb2unS0L6ksUbYkfr4VxKMBY=
X-Received: by 2002:a5d:5d87:0:b0:499:9f62:d64c with SMTP id ffacd0b85a97d-4abaf64be07mr33775504f8f.10.1795541581121;
        Tue, 24 Nov 2026 09:33:01 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm29248480f8f.52.2026.11.24.09.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:00 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v13 0/3] Add RP1 PWM controller support
Date: Tue, 24 Nov 2026 18:36:54 +0100
Message-ID: <20261124173658.31030-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
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

Hi,

This patchset adds support for the PWM controller found in the
Raspberry Pi RP1 southbridge, used on the Raspberry Pi 5 to drive the
cooling fan.

Compared to v12, the driver now also registers a "fan" auxiliary device
(pwm_rp1.fan.<id>). On the Raspberry Pi 5 the RP1 firmware measures the
fan tachometer pulses and writes the RPM value in the phase register of
PWM channel 2; the companion hwmon driver, sent as a separate series to
the hwmon list, binds to that auxiliary device and reads the value
through rp1_pwm_read_tachometer(), exported in the 'RP1_PWM' symbol
namespace. This is the approach agreed in [1], and it removes the need
for any dedicated DT node or binding for the fan.

The DTS node for the controller is already in v7.4-rc1 [2]. The DT binding
has been applied by Rob [3] for consistency to v7.4 and is part of v7.4-rc2: as
a consequence, patch 1 is included only to make this series apply 'logically'
on top of v7.4-rc1 and can be dropped when rebasing.

Changes in v13:
- dropped the DTS patch, already merged.
- add patch 3, registering the auxiliary device for the fan tachometer
  and exporting the accessor used by the hwmon auxiliary driver. The
  exported function was originally part of the fan patchset. Since it
  is really part of the pwm driver to be be taken by Uwe, I moved it in
  this patchset.
- Kconfig: pwm module now depends on AUXILIARY_BUS.
- added a macro to define the phase channel number from which to read
  the fan speed.
- removed the 'Tested-by' tag from Gary (see V12) since the patchset
  has been significally changed and need to be tested again.
- the controller private data is passed to the auxiliary device as
  platform data, so the exported accessor no longer depends on how the
  parent platform device stores its driver data.
- dropped the unused 'pwm' argument from rp1_pwm_apply_config().
- added a MAINTAINERS entry for the driver, its DT binding and header.

[1] - https://lore.kernel.org/all/ae9a4df9-b1f2-4f00-ab86-d9cf8d9bc387@roeck-us.net/
[2] - https://lore.kernel.org/all/7c437a10-985b-402c-b3ac-cfa97c53d014@broadcom.com/
[3] - https://lore.kernel.org/all/20261102192302.GA882027-robh@kernel.org/

Thanks,
Andrea

This version has been prepared with the help of an AI coding assistant
(Claude Opus 5.5).

Andrea della Porta (1):
  pwm: rp1: Register auxiliary device for the fan tachometer

Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 MAINTAINERS                                   |   8 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 477 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  12 +
 6 files changed, 576 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.51.0

