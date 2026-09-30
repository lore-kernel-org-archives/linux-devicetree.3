Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D408B3EC83D
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761930; cv=none; b=K5KGrsPhhn3qQ1BDsGZm/2DL09qK5H13KPw18oLgMiBRqiqGAszypVkvXBbKUpyEFH2nZgrKQfLlJ7J/PQk3retd5lBai/dR1wFdJbuTxVN9E2N5iG5/oxbFPbMu4MebJaAsNpDs2SDGJJUZXqkxalsFnfh5RoE/IB2zq8nPtiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761930; c=relaxed/simple;
	bh=e5J8Isd+ivv6vNFvneGjdbqRHB4zDbqy1EFTktYGCI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JsvC/JS7zDhMw7XUIcKguc11KLKLVW6nAspJr8SrilyvqCwSZQ53FQiS+fhR/W0IUDOJCq5QskNLeU2nkxPnxXGjvjS0ol4zt6bottJBBdnIRfzxO9BPvpEB+yQHR6q9qJQPtLtcp7PRkAH7LSNvrWWxaXgQY/IxIyjr8JddZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uy6YFADd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uy6YFADd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so38830105e9.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761925; x=1791366725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGyaJVivWNa7+BTJdqSgJRNH8LjXxwlOXt4JHsGvrnY=;
        b=Uy6YFADd0JKxz0dGEkyyovRgqRssT3ntYJuwI1MuBx31GcLdtMf2RRIhMhWTyF+AjN
         nNDF7/E0WXBEwG3gcIbYA48zIGeT2iYEadJ+55Xzcef8osrZYIgZW61il2KXSnuHPVy3
         OZv6eZslKENOrljToVod452s/13/GksyPJkRbaQbMqO5xpRc5OjnNate5SkfvYmtEzD/
         CCINQCbM/iOHlD3CRVbwXItvQeyNKcCpRgiTt9Dp1TIM3wJF6j8ef2+ZOJhCU70bgWVm
         TYHTHNALJZF6wQpVcFl8aDts6SKxzwWlQWlEuwAihLiT0r/w8KeMccXKlQY6dWhQ+b8a
         djlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761925; x=1791366725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGyaJVivWNa7+BTJdqSgJRNH8LjXxwlOXt4JHsGvrnY=;
        b=sHRjctB/1cIJrP4qqbbgnvlEfSK3hNy+4FdoYZPW1voS/2EC0c207KsiUMclaKCs0/
         n05g2Q9JPfAH49mJ4qk8u9cqI91m7cp3bYfKRpbGTK69xc3BqCmboRYEzrGm+fDcw7dV
         8mU1eBWqDiqxWlgBcIIu1mefsKznv8OrfkWPgDLdMmte2hQ1z7aTWGO2riCSoAShpTJT
         abCscLTVdlkZHRIiKWR0oUpLi9om6q6hv0PJLtTM7iESL0fHbmhIn+8ZsRMs0S4X4qcJ
         7dboTZH+LXAPTf6QUA3EAVFac84SBQtH7t8FzqvJHxPGNyLK/lZMirCRHxJbR6OYVIBh
         D0Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzggpxZmJl0SLCGN5cYWu0Z9JKyQSaxlLyZm+dpTsdaQyZ7WCy3IwbclhyVWewEhuY8vCWUklt1DQRx@vger.kernel.org
X-Gm-Message-State: AFuF++lIyar6Pp4C0m3rQrkQjOOAowL9y6kcbFm2H+b7RIer+pNuEGDD
	lC1Jx/s/fI5XHYRyYuvHorSWyJc/kKT0HGyxzloCF7DLQAoIqcrsVfcQ
X-Gm-Gg: AYBFou3aEqaRixq3ac4pvkqInSymm6B13sgXKnLlEVzVWNYF/9z5otlM2YQnJK/UBAT
	OLwipwQn1ZcUETW4+ohhNI6Wac6zCRRWscgYWN888gNPr6k4jqUGApxnTcDocvvD0DL5bLsAfk3
	oC66ZMxjEuGAAnajk265nc5SEtHOEdQiNIcWJr3Nc1RJqGw8Xc6Qq7oRwWqiz+OYa0LbBoG25o7
	99E501IamDtT2+M3FaHLQbxipZqmb05E04FJvBymuo8h60jjjKvt0Ps5ARauPiiylA6sNWgIk+/
	qGCOb1RZyyWOBvfOVZfyIxPHTPr4kX5wn4P8CKqPgoMzg627LOcl8gUTmTRIuWGX6ya8FWHChmT
	2SM1vbAFH+4Lfuw0jPbMcQnKvmCA9JU++QSfmlhSWvA5lZAxBiYyw/iLhEtpjR5RcYVC2Hti03a
	+3GQyTC87nrJ0IPiZialuXFAhD1xmleC+obW2UtcwkO368DPnWmQh+Ugb32sImfQiWdgCZs0SuY
	kDp+jCg7EUfVlGARqGazXc9ly+DYLAlxvOASqA3HwDP1ig=
X-Received: by 2002:a05:600c:8b21:b0:4a0:1b8d:3e58 with SMTP id 5b1f17b1804b1-4a01b8d4099mr9189045e9.14.1790761925200;
        Wed, 30 Sep 2026 02:52:05 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015abd9ffsm43859655e9.2.2026.09.30.02.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:52:04 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com
Subject: [PATCH v8 0/2] Raspberry Pi 5 RTC driver
Date: Wed, 30 Sep 2026 11:52:01 +0200
Message-ID: <20260930095203.492949-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 5 has a battery-backed RTC located
on the DA9091 PMIC accessed via the I2C bus[1].
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C register interface).

As stated by jamesh on the Rasperry Pi forum [2],
"There are no plans to release a public datasheet for the DA9091."
So we are stuck with the firmware interface for now.
PhilE also states that "The firmware needs full control of the DA9091,
sometimes with extremely low latency,
otherwise there's a risk the supply could just cut the power."

This series adds:
  - a DT property for the charging voltage of the RTC battery
  - the RTC driver that talks to the firmware

The driver and binding are based on (and largely taken from) the
downstream Raspberry Pi kernel. The main changes for upstream are
the addition of a dt binding property for setting the charging voltage and
binding the driver from the raspberrypi-firmware driver instead of from
the DT.

The driver supports time read/write, alarm, and optional trickle
charging voltage configuration via the device-tree.

Testing
- Hardware: Raspberry Pi 5 Model B revC
- Kernel: v7.2
- dt_binding_check: passed
- Basic RTC operations (read/write time, alarm) verified

[1] https://www.raspberrypi.com/news/introducing-raspberry-pi-5/
[2] https://forums.raspberrypi.com/viewtopic.php?t=359073

Sander Speetjens (2):
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   6 +
 drivers/firmware/raspberrypi.c                |  23 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 279 ++++++++++++++++++
 5 files changed, 321 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0

