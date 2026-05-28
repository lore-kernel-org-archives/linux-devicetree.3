Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3151B3438A1
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946351; cv=none; b=QG2UmL/kYtxKdq+opNYbf66l7S4RJ1wxH+BA5QgvaFW6QxkTN096XjJRQ7fAhKb2M5bgRAWQL/JyzLfyWtOnrKfsUuvJgGRLYEDw5/jwLBbyO5PaSiMWNDtj6WUnQrOal00MTWxzg4mV8leTizz3WHMqi58kEBr6IHpIZlCPuss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946351; c=relaxed/simple;
	bh=clNVtbBfViwKLpG9zmkSUgXMyGZnR+a/g79EpBF+4us=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ee+yBQuXVVBMQ3NRtey8+i/ZPustJN0ckVYRbvSwYdaSaX8Yqca2MTIhIExvTuhudKZjzDfXz/ysCCe+m2d6y8zas3p9bcrDfgw5qGBWbZfiq84hI1VIWymGDwm9fSgiiW0nmewyebq7FoiNMrCfUT2l32OfQ6mghOC1urz8NtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6VkT+s4; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6VkT+s4"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso2196749266b.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 22:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946349; x=1780551149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uNrRcVw+e7yAa5bCgioJSE1tWr6W5F6AeUGiymutBGA=;
        b=S6VkT+s4l1ummC6oJfUbk5TpYcCSrESxn0p30cNrsMOeL13oUu4fXPUNfm0Nyuc6PB
         OmR15ON4PuNbFJnQNeNUoj/W9sLJg6ST1n1ZUfwea676yqZM9tPS55ww3EKlJeM63l7N
         nnBzaJXemYw6gbF/IGHf/S8nrjogKhow0gNRPLjOJpbegEDit6Fp1H3ef9ugrCQ/HSG7
         d0BpJ/ptQ1dYG7aNXOoXpZsRxIVdlnjIU+/BcyQONZOzLB0nTc0uAIPvpN9Lio/VXhL+
         3uRBCMY+BcBieUbEXEJVuHyB2bmkNNkh7ynyzN1naSa4IgV09DWaqo6pS/dwRVj9+SAW
         d1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946349; x=1780551149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNrRcVw+e7yAa5bCgioJSE1tWr6W5F6AeUGiymutBGA=;
        b=P5JvxN/G4G6F1niGdZIZx6UV4/Dfj/vH8uUOFbF3IXVC3drQo+aizltutNPXX09uru
         X0dioVRJftStrnLIWs/iSz/g1S+hqJQtLr8iAavV97XrrPqo09Db8fxrfdpElqf9CcI/
         mw9tXCNAYvpIn8B4yFLqIZ8kiwbXIrqO6UuzIrcTjvhiOQMmEa9SS6cBbjKTcPIr+KKT
         xUtM/7uls3LVsPZfWL6DPE/wkGJa4brrP4NyUxdECpB/wwwXNulUqoXqaAx9Pewhlri5
         UP7A04Ah+meQGc0Z6DmuuxJJzG/vX8Gkwz/QflgPjrJgX77wlZVzCgVuXRcHMmyQyisE
         d9oA==
X-Gm-Message-State: AOJu0YwPWkLrywiLojzv9+9LgqF6+37Gn/quXn1LfR2MeRylKxbxB9Yo
	4VoyH31HKErcHb95JbLugYqwHbRofS1DJS44DJw0CQAnHYr4tYb0U0X9
X-Gm-Gg: Acq92OHcwdcIMEgS48mP7VAPgt0oMOt/fqKldQRvC0xY13W7uETgC9/UvtqrAB9ScTw
	me/gIFlsz6nRY9usm0s2JxbasqnQK+7dC70DfMP/aAjmbfzpiF2grAoVwFK1QJ82zEECIDNOzO3
	1I3Hz0/SxGPd5UCkUpINZlwHa7LgaRxMbV8yj1g/N5jIbuM868467FYmulw0NM0v6Dt2mKU7h7B
	wGf3i00AwDaxJLKisXCKFa+V6fQur8IW9mvff2Y1T62lh2DPhTinsKZrjGgWm6WAFnM1QpmB3MM
	/LS3eERo2kwaWAHeKyRuiV/1wxHHH4ej9s5ta+XvjnH3jWnkvfzS8MnYlzzUivEmylu9AqPFRCK
	rL1Kt5aZJ8oS8fmzwdjXA3p6YMcedev2XuLmr2MiINVVCobicUT3piTbgkVCNCwwdLKVQ2XvfWh
	dcFjiYgFds/lDS06HqxHJazyA=
X-Received: by 2002:a17:907:1dee:b0:bda:5265:423 with SMTP id a640c23a62f3a-bdd269b7370mr1175915966b.44.1779946348345;
        Wed, 27 May 2026 22:32:28 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eca616sm693427966b.30.2026.05.27.22.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:32:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v8 0/7] mfd: Add support for Asus Transformer embedded controller
Date: Thu, 28 May 2026 08:31:56 +0300
Message-ID: <20260528053203.9339-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for embedded controller used in Asus Transformers for
managing power and input functions.

---
Changes in v2:
- converted sysfs debug exports into debugfs
- added kernel-doc comments for exposed functions
- fixed minor typos and inconsistencies

Changes in v3:
- dropped DockRAM commits (both schema and driver)
- integrated DockRAM functionality directly into the controller driver
- EC schema moved to embedded controllers folder
- removed all cell descriptions from the schema
- removed all compatibles from the cell drivers
- adjusted naming conventions to better align with the ASUS Transformers
- defined EC variant sets to provide coverage for all known devices

Changes in v4:
- grouped known programming models of EC chronologically (both schema
  and driver)
- call debugfs init only if CONFIG_DEBUG_FS is enabled

Changes in v5:
- added asus,tf600t-ec-dock compatible to schema
- rebased on top of v7.0
- kzalloc > kzalloc_obj in keys and kbc

Changes in v6:
- removed asus_ec_handle_smi casting
- asus_dockram_access_ctl > asus_ec_get_ctl in control_reg_*
- fixed battery Kconfig description

Changes in v7:
- added status check of devm_kasprintf where missing
- devm_asus_ec_register_notifier dropped, added .remove where it was used
- removed cell_to_ec, asus_dockram_read, asus_dockram_write, asus_ec_* public API
  asus_ec_i2c_command, devm_asus_ec_register_notifier, asus_ec_read, asus_ec_write
- renamed asusec_info > asusec_core
- ec-kbc: added packed size check
	  ret > error
	  improved key remap logic
- ec-keys: improve formatting and comments 
	   ret > error
	   switched to dev_err_probe
- ec-leds: reworked to register both leds via loop
- ec-mfd: adjusted Kconfig description
	  fixed smbus operation sizes
	  fixed saving of EC fw model
	  adjusted IRQ flags
	  converted to use definer for set cell composition
	  added factory mode states enum and handling
	  defined some "magic" values
	  self > client, info > ec, ecreq > ecreq_gpio, priv > ddata
	  asus_ec_chip_data data > asus_ec_chip_info info
	  ec_data > ec_buf, ctl_data > ctl_buf
	  added and improved comments, added structure descriptions
	  asus_ec_magic_debug > asus_ec_susb_on_status
	  removed all dev_dbg and most of dev_info
	  pronts with model, fw behavior, factory and susb state preserved
	  switched to MFD_CELL_* macros
	  removed debugfs
- ec-battery: swithced to BIT macro
	      lock usage moved to asus_ec_battery_get_value
	      in asus_ec_battery_poll_work fixed possible rescheduling fail
	      in asus_ec_battery_poll_work fixed missing not charging
- ec-charger: POWER_SUPPLY_PROP_MODEL_NAME set as the first check

Changes in v8:
- added MODULE_ALIAS
- renamed DOCKRAM_* to ASUSEC_*
- ec-keys: input_handler moved into private structure
- ec-leds: added brightness_get
- ec-mdf:  fixed i2c_smbus_* return checks ()
	   improved model storing
- ec-batt: added status check of devm_kasprintf
---

Michał Mirosław (6):
  mfd: Add driver for ASUS Transformer embedded controller
  input: serio: Add driver for ASUS Transformer dock keyboard and
    touchpad
  input: keyboard: Add driver for ASUS Transformer dock multimedia keys
  leds: Add driver for ASUS Transformer LEDs
  power: supply: Add driver for ASUS Transformer battery
  power: supply: Add charger driver for Asus Transformers

Svyatoslav Ryhel (1):
  dt-bindings: embedded-controller: document ASUS Transformer EC

 .../asus,tf201-ec-pad.yaml                    | 119 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 .../input/keyboard/asus-transformer-ec-keys.c | 286 +++++++++
 drivers/input/serio/Kconfig                   |  15 +
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 158 +++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-asus-transformer-ec.c       | 125 ++++
 drivers/mfd/Kconfig                           |  16 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/asus-transformer-ec.c             | 542 ++++++++++++++++++
 drivers/power/supply/Kconfig                  |  22 +
 drivers/power/supply/Makefile                 |   2 +
 .../supply/asus-transformer-ec-battery.c      | 289 ++++++++++
 .../supply/asus-transformer-ec-charger.c      | 208 +++++++
 include/linux/mfd/asus-transformer-ec.h       |  92 +++
 18 files changed, 1899 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
 create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
 create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
 create mode 100644 drivers/leds/leds-asus-transformer-ec.c
 create mode 100644 drivers/mfd/asus-transformer-ec.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c
 create mode 100644 include/linux/mfd/asus-transformer-ec.h

-- 
2.51.0

