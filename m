Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655342;
	b=0P0Q+TlfvyytdR3eHSxS/dBuTWntMSx/zxuVFJlfbhdPnI6VIJPOI+y+9C2bQFL7hA2F
	 7zkJkHMUWmtyBvZl2WJx5YHJ6dLD73cydrpbpYqagV11YS9bLWEIbfJIRuH6d9j4KqwI3
	 gcNuVBT94Dty3KPU6xQy6zBjy9DemRFewI/XWBkqI0nWvUeBpOXb2kr5yRRiuI2HpNggV
	 5S0ED/Tem95aqGSIzJdKMQLhZQb1IVmtU4EvBM6plbmqZNoS2vCekIn3Vz08XaLdAqHh+
	 PQS0clQAGn7Q/LVTQZk8MHS4VHJvArgE7ygdkZa8zOzJbxFICKblIO+XNBpVu8iJ0rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7ce9oQsSpPF80zF9oT7k6J12AxCufApsfMgTJKBfXIs=;
	b=NYJgMKfIOR2dT7pZSlKKfOzIlrleJK6kJsWoG25zUwFtrwRLkRMmGOhiOCV1fgloiilQ
	 uj2PafjtHWO0EZXJfmSIvbMEcbytrm60t91cjZ68uKwIieLlVgPmVqjVD7/Jc3cfIeR6Q
	 6Ql4JxmHTng8i2sKB4yVNHB+KTtx+dT5GC1j9zx+5G14RBMRtJ8a+p1ILm0pytOpntBtQ
	 S6zuLOQ9qOkGXw64P30eKrdwm7UC+fZCqjeKlPBn9IskzAaVeQTt0/ocpFyO+3ueAEfqa
	 qUwWsYCPRkz5rv8Uhu9QgW2J7WJmzoGfMW14rO9WIlE8L8HkI0mGsVYeu63yybZ1FDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hHscUns5;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E42B606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E42B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hHscUns5
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1408583a12.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794655341; x=1795260141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ce9oQsSpPF80zF9oT7k6J12AxCufApsfMgTJKBfXIs=;
        b=hHscUns54ZoPTWjJLDTcIIdAlRhRig51j67kstsOM41HSpAVjhH25UPBT4Xs8Lfl8v
         zF7T9BPu9XcRPlrR4333fUvGcBpBWwiNVgi2/hQRAe7YutjASqT0+RTt9cKqjnE7DbkC
         SeqCCXVBIFMUyBNRlOIL6aMgr4y1qTQi3Gzk70PK9CZGkl1a5L/hkA/0wzYwOQSDj+pf
         OOSeQx0SsyqN6MD6GbZMt6S5tM5GJMTITof+crWu+9OUn5IKU6Mqp3RsUPQKnpGFn8TR
         YPR1YEPH2CwSfxzkG14BizzhPQCeJuOCj6xqQneND4IBCWR9Thx8ONumgxDEaZsG0zQj
         HZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655341; x=1795260141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ce9oQsSpPF80zF9oT7k6J12AxCufApsfMgTJKBfXIs=;
        b=XRfyz4UQzMB3/RWtymXuhh3qBd9uwpZL2dySBBZQTsj9Lbtaa9LluVkpYaxRPrX4Kw
         X1PZtPR+1JY5SZWVD7Kqp5NoVwksjCT68OwGNK3w/X0y6mcleHDxBssgH8AwyE8+QNiq
         EJcfY5hdav6IBarvciAIUC1UzCKsanMjSD5/KKWb34ugMs5cABfq3gPdPWEbJ2JQdIpN
         Sy44ppelVZHTnPQ6Qvh2eY3Dqyr5ubaiJEL1PE9Xvg6FV4Nj+k/LP1q952gMGD087bTF
         OxQARU5vsYJzZdQ4IljPJMQnyBeVD0VuTfKaXXR/OzCX0oGkQJjM0/NJHHEqjqm/l71x
         zMZw==
X-Forwarded-Encrypted: i=1; AL+hErHqRkZZVhiZ7HzW7WlMhUx1AWS4T+8fT0yKqmY8TyCUijdr5qFCJEpdYOvzQvLOwz0W9Z2OCJl1CMxU@vger.kernel.org
X-Gm-Message-State: APuU4Z8WsmW5M/QFrz1LzW9J5FMpZ9s2eeQt05Y3likyDCwQzJytsp1z
	Y1RgJ6c6gWc+A7LJyePP7TVgB4k5PRM0Wy7cxeQK+NOrAVBzZZXbyKUd
X-Gm-Gg: AYBFou3acxAtrgB6Di9X7Y4sWaZUWP3qrod/AANuEcUafrk6kFx5xaUSw2ADrbd/1hy
	sUf5++kg7y3LK5GYiJNcFSDLP5Gjj8kWPgiaVsYEE2tztfS97uHy8pf7oZlV2XMAzRuEETggabk
	BtWLg1vVfag1UD+JbQkUXkL/OTwc/GGxCW91zX/8b58EiPDzRMWnKEID180vVUylwzITagZH/IP
	oOAq7BafeWP2x7GF8/50UJ3yGWqkEQx34OGD7yY0laeEDwR+siA5QEqqTFT99I595U6qKboKqcx
	LBqtnicPJJ1YxnG9pDRRY38t+Rs6TJvoqRSBTyMeclA+js9DgsdATipa4dY0ZFPnWF2eScOaxi5
	56MeTmDIOSGj0gWcLt7oIzVFNdTbDBnOggAO4YeooiK9ea8PXLP4A1sh+kEunF2VWwyG2Y/R/Uf
	xMHlqYLyx9prs1eEw3t9BUdtov77qXOsOphCEPwniyfD6a0jOFn54pELqvh7/HhPO7mflXUFA7o
	Qx7G120D8qbASbpGMUIBBBWPOVA/n/MpKEJUfNcu240vSiIcnESI2RDyTtMzGggLCTlxciQxMLW
	scKW2j/h45nn2Mo3qxHsOtWELKjcOHCd9kVtMIzKx5JeC78WFrSHfZXMSGz0U89LfDgMOEHHvkW
	d7ZM/CQO9BeR4oU4580daB6NWjg6TSUd7mScJWVShKteT9n9ciXMzmNd50MNGruHKAlXeBpLRZI
	UTVqZ9rNvBp7vasi4=
X-Received: by 2002:a17:90a:c88f:b0:3b0:e388:d9c9 with SMTP id 98e67ed59e1d1-3b1b0b5d690mr3501691a91.12.1794655341320;
        Sat, 14 Nov 2026 03:22:21 -0800 (PST)
Received: from localhost.localdomain ([118.68.25.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm3981142a91.3.2026.11.14.03.22.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 03:22:19 -0800 (PST)
From: Adrian Nguyen <thenguyen1024@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Casey Connolly <casey.connolly@linaro.org>,
	Adrian Nguyen <thenguyen1024@gmail.com>
Subject: [PATCH v3 0/2] power: supply: Add Qualcomm SMB1351 charger driver
Date: Sat, 14 Nov 2026 18:21:53 +0700
Message-ID: <20261114112155.85068-1-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The Vsmart Active 1 (SDM660, PM660) has a Qualcomm SMB1351 parallel
charger at 0x1d on blsp_i2c2, next to the PM660 charger. Its version
register reads 0xb2, which the downstream driver identifies as an
SMB1350. Without a driver it runs on its OTP defaults: charging is
enabled through an active-low pin that the PM660 holds low, with a
4.5 V float voltage on a 4.4 V battery. It is powered from VBUS alone,
so it does not answer on I2C without VBUS and starts over from those
defaults whenever VBUS comes back. As a result, whenever the PM660
suspends its USB input, the SMB1351 charges the battery on its own.
Since commit 98d68b74ebb9 ("power: supply: qcom_smbx: allow disabling
charging"), qcom_smbx does that when user space writes 0 to the status
property of the PM660 charger to stop charging.

Patch 1 documents the chip with the battery it charges, its STAT output
as an optional interrupt and, on a parallel charger, the PMIC charger
that shares its USB input. The SMB1350 gets its own compatible with
qcom,smb1351 as the fallback. Patch 2 adds a driver that keeps the
SMB1351 from charging: each time the PMIC charger reports a change, it
hands the charge enable control to I2C with charging disabled and sets
the float voltage from the battery. A status or charge_type read that
finds the chip reset, or not answering, makes it configure the chip
again. Its power supply reports whether the chip has VBUS, the charging
status, the charge type and the float voltage set in the chip. Parallel
charging is left for later, since it also needs the PMIC charger to
split the current and to drive the enable pin. Patch 2 also explains
why this is a new driver rather than part of smb347-charger.

Making qcom_smbx drive the enable pin high would also keep the chip
off, but only because of the pin polarity in its OTP, which the
downstream driver does not rely on: it programs the polarity over I2C.
A driver that programs the enable control over I2C works whatever the
PMIC does with the pin, gets the chip described in DT, and gives
parallel charging something to build on.

Tested on the Vsmart Active 1 with a 7.2-based kernel from the
sdm660-mainline tree [1] (its qcom-sdm660-7.2.y branch plus a few
pending pull requests), with the same driver as this series,
CONFIG_CHARGER_QCOM_SMB1351=m and a DT node [2] that also passes
dtbs_check against this binding:

- With the PM660 USB input suspended (on that kernel through
  charge_behaviour=force-discharge, which the sdm660-mainline tree adds
  to qcom_smbx and which sets the same USBIN_SUSPEND bit as writing 0
  to status), the battery discharges at 250 to 470 mA and the SMB1351
  reports "Not charging". Without the driver it charged the battery at
  about 390 mA in that state.
- After an unplug, smb1351-charger goes offline 2.35 s after the PM660
  charger reports the change (2.37 s in a second run), when the
  driver's retries run out.
- After a replug, the chip is back on its OTP defaults (0x03 = 0xf2,
  0x06 = 0x6b) and is configured again (0x03 = 0xed, 0x06 = 0x0b)
  within about 0.4 s of VBUS settling. This also works while the PM660
  has its USB input suspended, because the PM660 charger still reports
  plug events then. In that run nothing read the status, so the PM660
  events alone were enough.
- Writing the OTP enable setting (0x06 = 0x6b) behind the driver's back
  makes the next status read return "Unknown", and the chip is
  configured again within a second.
- Probing without VBUS, unbind/bind, and unloading the module inside
  the retry windows work without warnings.

While the PM660 has its USB input suspended, smb1351-charger still
reports online = 1, because VBUS is present, so user space such as
UPower sees external power in that state.

On sre/for-next (7071d4750856), the driver builds without warnings
with ARCH=arm64 LLVM=1 W=1 (clang 23.1.5), sparse (C=2) and the
coccinelle report scripts find nothing in it, dt_binding_check and
dt-check-style --mode=strict pass for the new schema, and
checkpatch.pl --strict only asks whether MAINTAINERS needs updating
for the new files.

The Vsmart Active 1 DT is only in the sdm660-mainline tree so far, and
the SMB1351 node for it is in [2]. sdm630-sony-xperia-nile.dtsi also
mentions an SMB1351 on blsp_i2c2, and msm8996pro-xiaomi-scorpio.dts
names a STAT_SMB1351 line, so the binding may find more users.

How this series was made: with an LLM coding assistant over longer
interactive sessions. I asked it to find out why the battery kept
charging while the PM660 had its USB input suspended, and later to fix
that in the kernel. It read the SMB1351 registers over i2c-dev and the
PM660 registers through regmap debugfs on the phone, compared them with
the stock DT and the downstream driver, and laid out the options. After
I chose a separate I2C driver, it wrote the binding, the driver, the
commit messages and this cover letter, and ran the build checks and the
device test scripts above. It also ran sparse and the coccinelle report
scripts on the driver; they found nothing. For v3 it wrote the locking
fix below and re-ran the checks and the device tests. I did the cable
tests on the phone and reviewed the result.

[1] https://github.com/sdm660-mainline/linux
[2] https://github.com/sdm660-mainline/linux/pull/241

Changes in v3:
- Patch 2: set retry_until and queue the work under a spinlock, so
  that a status read cannot replace the longer deadline set by
  external_power_changed() with its shorter one (found by the Sashiko
  review bot).
- Drop the Assisted-by tags: since commit 1e035297ffda ("docs: remove
  Assisted-by references") the tool use is described in this cover
  letter instead.
- Rebase onto sre/for-next (7071d4750856, on v7.4-rc1).
- Link to v2: https://lore.kernel.org/r/20261021082841.79147-1-thenguyen1024@gmail.com

Changes in v2:
- Patch 1: drop monitored-battery from properties, power-supply.yaml
  brings it (Krzysztof). Add Krzysztof's Reviewed-by.
- Patch 2: unchanged.
- Link to v1: https://lore.kernel.org/r/20261011072135.12757-1-thenguyen1024@gmail.com

Adrian Nguyen (2):
  dt-bindings: power: supply: Add Qualcomm SMB1351 charger
  power: supply: Add Qualcomm SMB1351 charger driver

 .../bindings/power/supply/qcom,smb1351.yaml   |  69 +++
 drivers/power/supply/Kconfig                  |  14 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/qcom_smb1351.c           | 439 ++++++++++++++++++
 4 files changed, 523 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
 create mode 100644 drivers/power/supply/qcom_smb1351.c


base-commit: 7071d4750856abbc68dfe431acc58a1d45dd42e8
-- 
2.43.0

