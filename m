Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150853;
	b=qtRaEaY9gQvNA9xI0ZdEloahhfPbocjLZFQYRZoDM5YuGHJgyCWFL2XktLVgu+kSu03e
	 wAalOvR6K3emaX9tGrJzRi3kPp0nd3TDcjeLmOalGcCIrXkoquQf3Y4IVUnjfFXI1rmSV
	 VIGtBSXRZ48I0wU1CrGh0LA79Wp5de9JhgG3NfYPVdozSFpViSjnKR3pCcsVmtLGOj1Bu
	 MMUVBH2v4akkmxRIVEmBJcfJOMFiFNXZnnjwQH15LeMUp7tLuuj+La5cK27o1bQNkmu5h
	 XLe6EI7Wrb+WXyAk60cpd9zDXfty2iQ4xHLXKnpr2jv+upo3RGKci/N/j9yaxYkw6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
	b=bmH54tMKTf2YmytvBZRFhyv5JdIuLRJ7rou6SlidvoUgbG5I2fIzqgh6VFcPaQrdwIqn
	 2I8erUn4JxT276x1NyOrh9XyQTIvN5gkB/5FR3/VPMX0nfgs/SxVS6a0hBI4g0KLmUiVB
	 lyTnt40J7FZRR4AfQCaFcICqE2usjjxWdTzqyxym6ZdWWHi+txkg6gpYyotgm1OFAPHvr
	 ImMyPUUxXvKhMBLVR1QobSQukZPKT840lWp1TGrOt+YNrfISt3rJLSRjeXMWal87U2isl
	 AsNLLwkE7s7DhV4VKnd25ruP4yuNK1hNrahdsJR/GV488HNcByqREVOwffgGyzsfHcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+sw3vLY;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A384606A322
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 15:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A384606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+sw3vLY
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4ced671398so14859066b.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 07:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150852; x=1794755652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
        b=k+sw3vLYGtsdgh44ewI3ONGEVRE5G9Yc4ViLK/9qvelJ6ZuQ1Zg+Wy3yLBQj9ROLgd
         xs8ytVyJZNi3KPl8VJPkuuuPV5Mi98hZ9s7lytBpov8P3Dv8sm57NzypUQ3ewuDNxN+P
         ZbpLJCKQVPQEjt3EhHdXCk2STdgMORsCuFRsHRuRCufEvM/x6D21MPgZqtrrs6V3+go3
         VEZLh48Mk2yewVFxSVZYCOkqtYhQ8IZD1a9M8FSj9/cp2wbLKUxxKePnXQWWRq7SyUUE
         Cy9ZSGSUe2N+Mqp7zISjkA2uIb+izKV0GLdxE4z6dai0ODMn8sIoREhE9KSjJ0yq4+u3
         dpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150852; x=1794755652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
        b=KxkmCnx8Jj5kUkp9Z/mSlsYg/G1ifSOJkfsOyEAt1DXay17uoDeIlYFdsKc/YCJarg
         oIsDBcSkVH4zO04yyrPM0mhCkIwLtp6KWBigEhPyJhSAzuwIkBUsk8ow0jpFq1dxY2N0
         SJ75S4uRnnihNCZmCtViRHqZzVLErXSoy3FsTwRb9VUmHMyR5935Fai9WDtgvI8pV6Rg
         aCbNCxkeQ/im7FWBbzpujXEDZe/x2oh1CdMGstzeOFEFmp7DnBq5JKb/IRatUF6DwXZB
         uYLqclbxD49neL2K6aLNWqMleYW25MRzJ9GhJMaHDqu5JoqDHT9qPrd+1AcAkm8cLi7a
         Ha2A==
X-Forwarded-Encrypted: i=1; AKwUvByHQcFLN05iT75KUc2E9wM2fTrFNeK1uYBAsKJllGlM5JDfR80amFAxLv51hs8ZaRQ0M8ZyxBpM3SZk@vger.kernel.org
X-Gm-Message-State: APuU4Z+1bmXx0l297VljiCIGtaTUm0TYZ4F5u1R5KuTtpANAwZJbK2As
	+xzNsj23tsUFvLvTN3GncwxsUyMMRbFHkqZ6l4OmiKmt5txqJRIqIeHmNF481g==
X-Gm-Gg: AYBFou3gXK2uMWwF/1lwaKy9VeN/PQg3AkiIprafMv1l+L9TUO5GsyiyYmurSldC/Sj
	aVGhFRGohUI35rF5XwC7DYns5mH03H/gVUzb3IXzlljPCmDQmcf+sx9efVLqWU+iGRssGC68Yth
	CSL0sM0hP/oS0ffqkPHiPtWUx2rdNH/DX/Dd87ihFK4Wu5whDgbvwMprVHqeWFmrOLQW1TDuTy9
	Za3pacclne4+AzXO7kjkbXvEhhw5a4AhN3Tn/+Hmvx+v1aZpXNOza2jn8ciiSPRX2C783NTHjON
	ElZcKn7j/dxIPGZMFLPnIbOylCiG+VqD6Vv9oa+L2apx4E80QDZAfixkTv8RLQcWCi113+t21qD
	iRYsbfAzBg1WyUzwasugHw/SGJG66K8xpyu1MRxMMNzA+nUxkOIUkfGvYemmzp6BMaQKqZhhkGO
	OO3LOp8WVRS7zoYCqKCAWEGy/K5bj0A1rKWijOV3LtEKbdVFowDT+f8awzc+FRKqRqCRUXiqM46
	wUQdKIB7wWjpn/KboBqkQQZDDrhvKboDnncJmAu/yD9bcYeTd1sjdYcAQKhox/Ax8EcvdypXhlm
	/9wKCyGywl51txEf14d416iyx/ljAJStMkGv0ZCmIZinnpLsUan0vj3B5v2eLmYrQiXabVO9GKr
	ZS6KsmGemrw==
X-Received: by 2002:a17:906:c150:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c4d6db81459mr108618266b.35.1794150850606;
        Sun, 08 Nov 2026 07:14:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 0/3] leds: Add driver for MAX8907 LED cell
Date: Sun,  8 Nov 2026 17:13:45 +0200
Message-ID: <20261108151348.204182-1-clamor95@gmail.com>
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

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Patch 1 of the series requires this patch:
("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

---
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext

Changes in v4:
- platform_set_drvdata dropped
- init_data.devicename dropped
- added MODULE_ALIAS

Changes in v5:
- add and document a dedicated node for LED
- split adding led cell to mfd into separate commit
- expand Kconfig description
- populate devicename and default_label of init_data
- unfold platform_driver->driver

---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Document LED support
  leds: Add driver for MAX8907 LED cell
  mfd: max8907: Add LED cell

 .../bindings/regulator/maxim,max8907.yaml     |  4 +
 drivers/leds/Kconfig                          | 10 ++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-max8907.c                   | 99 +++++++++++++++++++
 drivers/mfd/max8907.c                         |  1 +
 include/linux/mfd/max8907.h                   |  2 +-
 6 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

