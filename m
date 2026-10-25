Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792945468;
	b=fEol9AbvPZGjuONLfZ1Bbx7c8SwDjTUqTBRRDNY0VUShvesriBGJHjF7Vu/k7pE+9X4Q
	 hIXRmW9imNLlJindz53lfYkrkXkcPOUpgxheRNVLmeTCifx5wMYAnr8cB65Dz6TSSXwKj
	 17/POQdpbr/3s2upZZYkBD7k0bvAEu/k/3lDPAeH1Fy5pSZZbF8PqGqA5zCZwM6oeM6Wc
	 pcb8niRZHTPlDlbgXYCmW/mJCXZN7yd5toD3Z28LbjEjZlJ3dPV6SNdrfQcvzLbgntLfV
	 j81DWsZc8NeED++79zRzuVyVhmavTQPpzlmwVGSbL9E/O3MdLyfZ70TEQwdqlmSL5dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792945468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lkPpCgWKpJ5/7YzkFrqHKCZljSOcrFOqT756QjQTQmY=;
	b=gMAEPu3JZJAm6vK2BwJJnKlpodevdu7TR4t36E/upv9v742bh21wfcAHkoMsgGBu0h1E
	 JEpAWzuhCKW42DfTKD6OhRHS8jQHdvzjIgN0onTuh5UieuKJeZIXhvuWXOvMnBO53APQY
	 rFNoWqtZ8kLIT11Rcu4GVmfhMFLpDkQ6DpDHLEkv2vEwoSlmrCnLEIsijAdlz57iP1EqX
	 d1KpgidXpmJ7rvXLnl4u4XQTwLqyLMoRYUdiyl6B0bcvUir/MB8QPz3PxL6EsOV9FEoz0
	 /L9pMoeNhMXxSTCaiJ7aiRN+Keh6tRTQEvaTB64iOHrYQugEJsR7NWhBNl2DRbEULJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KxJV8umB;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5229606A31B
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 16:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5229606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KxJV8umB
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14fd9dafb0dso2136294c88.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792945467; x=1793550267; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lkPpCgWKpJ5/7YzkFrqHKCZljSOcrFOqT756QjQTQmY=;
        b=KxJV8umBld7rA2/LkiKiL2e0PFwkHHnUuSYo0m4TJPJ8/PRuR77A0ppY7FZQf3wRzg
         y3iss9UbZTuiLvtHjruYR6iepIErOgbpxJEuVu9LUD+9zipTrVr1OwUXVv+hV0bCD69W
         wWjY2sQdrQSvDjyQeSxONqjYPMd2kdzEn7MBo7eGvjr2iX2W3KjrVECpKTwQ7C9R25go
         FAkkP9nPgzlesH/FL9jxVdj8wU3zVA/5angovv87/Yp1e/l1bLS1HHS8fvz5EjTNTdlH
         be+13rF/4y46KnQtZ8TFox4kHg63KgyJQAQQycjQgIo4wPCU68bt9Ozx8n5eEm4xXbTH
         tVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792945467; x=1793550267;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lkPpCgWKpJ5/7YzkFrqHKCZljSOcrFOqT756QjQTQmY=;
        b=yTR4vPqingWssWneQDCqVhBEuZTQcWHYY1DbeRu2yLB+79gzZHpGWU7QUPESWZAXii
         HjBZhTZ9Mzy9Ix/RULdtRxWycjln8wYeT7bcUY25vQqb3GXgKAIx3S30JAiM4CTNu5P2
         2vTEyWZUPWz+UXn9LLadJXY3WQ2x3gk9OlCA1Pdm/E4SGd8W4l5dOrfUvNyRTMrb0CVQ
         cx/d0nlpVn9ckMshF+E06PKFJUwSlBFNrL4tiqjPLXkQMuHCeLEeOjOIlFBh08aWkP36
         JGi5P9qIOORqbknG+xhQWEz5fkdnCgb0KicpVMjRdDadLaVdBYUb82m2JjJA0wgVIj67
         Br3g==
X-Forwarded-Encrypted: i=1; AKwUvBxlW8VCDr8C3J6hr2+MjfnizbAy9orMwZtdBcnKULhljGPW8XFrj4gFIqFuWXiP6rN3iEul8RHCrdS3@vger.kernel.org
X-Gm-Message-State: AFq9FYIHyn4XIktLXTYCHAYfWtWwiP7pLhqy+mKZG+3p/yTLtMQLOIno
	gjdzHWBDiAm8KVQ2WCYo6M7wxGe/0p1ZsKPYFVIoub2Dmd4Gkh/OQhG7
X-Gm-Gg: AYBFou3dfc6JZvxaFSQFFEB1ce3c1rPYqao82VP/Z3tO3BAKteEfXzPsJ7U7maz5gcP
	JEg7bXy5fnvKJ/fCs1ydb32GOtxjW6GxcN4LEFMg7P0/l2qjfTCyCNGU1gWjdgmz0eC0aBmN91W
	j2YHY61E269OEZXCNxjjG2yXGHO9uud1FhTAMAVe7IDRP8CFtW2SKc4G4Oe/9oy8Wu7y2Q6F5qk
	B20h5Ngm0oQgVTETPtDB1WOhm4n1dMt7b5urV0jMf2fWNNEoTrdvNtm8bvjm3fLE/uOC1e1AuRy
	3pBV3IjXQZbPifhon+Cym1BU2CD0kk3/uRyh6mYhHyjSstKRjD0hTtt4BTk4/WwlES1WNWOPAUY
	rw35QYXN1PYrqWHnpd3wTwCCcDhLELXTB5f8DKmQvF7Nik6dG/J/L6s6m6a3WkUWIeq48k2gDYk
	TOc1r3dMghKp4/w3aUQd81JQOby5yt/zXWurKzA0AEZ4vPqUuFKVlCUg40MAPPd7NPNdyignYLS
	1dud/woTkM3DGb37R/HThS2vINBNrmy7kSLvYonrroTXw2TrlPtt4iz+EP3GZPfGTEyi4zUsPz5
	AJOexPTFkiefFeY2L8TsU5chMce49I4S/A5kWA==
X-Received: by 2002:a05:7022:ea48:20b0:183:3140:3ac1 with SMTP id a92af1059eb24-1a0ca49ad43mr687113c88.24.1792945466814;
        Sun, 25 Oct 2026 09:24:26 -0700 (PDT)
Received: from [127.0.0.2] ([2401:4900:7b93:fac6:22d5:5a09:b572:da26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm16385722c88.12.2026.10.25.09.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:24:26 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Subject: [PATCH v8 0/3] media: Add Himax HM1092 mono NIR sensor driver
Date: Sun, 25 Oct 2026 21:54:16 +0530
Message-Id: <20261025-hm1092-driver-v8-0-9cd575c366cf@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Q3UrEMBAF4FdZcm0lM/n3yvcQL6ZNZhuxW2nXo
 ix9d9Nd0JIFLw/MdxLORcxpymkWT4eLmNKS5zyeSvAPB9H1dDqmJseSBUq00oJv+gFkwCZOeUl
 TQ5aRKEZGCaKYjylx/rr2vbze8vzZvqXuvJVsF32ez+P0fX1wge3u1u0kVN0LNLKJ0EYPCZVqz
 fNxoPz+2I2D2LoX3GusNRatObCyIVrSvtbqX62K9oaJHLPm1NVa77WptS5aEqjUodPRh1qbvQ6
 1NkUTsGmpzJvk3c/tn/b3q9miTXCBEZXTnmrtfjVIULV22+YeKLRgkDnu9bquP40jb2MwAgAA
X-Change-ID: 20260618-hm1092-driver-a6f2aaddf201
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Eduard Kulyk <kulikeduard89@gmail.com>, Ray Strode <halfline@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8367; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=bji53MivHxAGK3eudCZSs9Bh0L0QddkWESjSVc3a5JQ=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBq3i0yT5aqJd9an3FOhmhrEz/TRTsP0JWaN4HS7
 RzGTZlaVxqJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCat4tMgAKCRAVlYpeERwF
 3m4ED/0bpdZg/tcTmSTCegXVpMOgFS+vLZ74PY6sX0Uh9RuAgtFOpFmyMPUrLhGuJsX8HC6x/g1
 cepx19hPBIuoaIWify/rhZzQotpxnHpsvoAZy//IpwfcTE/F9K3zWDIiTpHuYd8nDVCDiDb/g/A
 b1/fu1AqduLvF9L5ik9ALh+6ZeOZiDNBv8WjM+daR3GqxcobH8YeyZnPy5lm49Z2QPxTObvR6vB
 iLGoxh8T6Ry4AkHtGo9JQbr40VuhPweAiGXJVXlxd0eoZUfZKDPZkRTfaQlPHXdz8QzIGi8Iiei
 v7ZxBrEikSis1TleU0xKvttCN8IOk8clvbx7yAOBgokObzq3ZcInENG9Hn478L8l/RywxyIA+8X
 qp8w/ky6eu7yskDymArFYVqG5CNgDC3rKlRhMTMhXwXUKWsy+A6tq4iWGrF6AxSMGFG1oJ5rgFw
 KlnIZhfTbDnPgqgkqnn+DOsZVL1CqcoMrU8hshXCdV7ysdpCF0jsrf2Xx87ncA/P8UPmBybpZpI
 Ken8o8EbgK1vHFkaVG9VmYE4vdvetzv0eLboewGtDBtDD2OvQrQLc/epFFu0tRKvsC4qJsHHXRI
 7xXFy5l2LjoQKq70hYxSDLU28az7n9mnqwqeuZhkxeaLO9OOpoXGiIcghhoXqKlIVN3HmR2C5+u
 GyT2tYYGXXuDLRA==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

This adds a V4L2 subdev driver and DT binding for the Himax HM1092, a
1 megapixel monochrome near-infrared image sensor. On laptops it sits
behind the IR camera used for face unlock. It speaks a single MIPI CSI-2
data lane and outputs 10-bit RAW.

The driver exposes one fixed mode, test patterns, exposure, analogue
gain and digital gain controls, pixel-array selection targets and the
standard fwnode properties. The mode is selected by the external clock
rate, since each known platform pairs its clock with its own PLL setup
and init sequence:

  24 MHz EXTCLK (Qualcomm, devicetree): 560x360, 180 MHz link frequency
  19.2 MHz EXTCLK (Intel IPU, ACPI HIMX1092): 648x368, 180.48 MHz

Both run the single lane at about 360 Mbit/s and deliver about 30 frames per
second.

Patch 2 adds the driver with the 24 MHz configuration. It has been
tested on an ASUS Zenbook A14: the sensor probes, streams, changes
brightness across the full exposure and analogue gain ranges, accepts
digital gain updates while streaming, and returns to runtime suspend
after capture. Its register programming was extracted from
com.qti.sensormodule.hm1092.bin in the Qualcomm camera stack shipped for
that system. Jake Steinman independently identified the exposure,
analogue gain, digital gain and group-hold registers from Dell's
hm1092.sys. The available documentation does not identify the
test-pattern modes, so their menu names are based on output observed
during hardware testing.

Patch 3, from Jake Steinman, adds ACPI enumeration and the 19.2 MHz
configuration used on Intel IPU6/IPU7 laptops. It was posted on top of
v6 and is carried here at his suggestion. It has been tested on a Dell
XPS 16 (IPU 7.5, with the ipu6 driver) and a Dell Latitude 7350 (IPU6).

The 19.2 MHz configuration reads out (0,0)/1294x734, which is what the
vendor sequence programs and includes the dummy border. The crop bounds
therefore cover the 1296x736 native array, while the default crop stays
on the 1280x720 active array.

The ipu-bridge entry for HM1092 was applied separately to media/next as
commit 4fdb0342f05e ("media: ipu-bridge: Add Himax HM1092 IR sensor").
The board-level device tree and PHY work that wires this
camera up on the ASUS Zenbook A14 will be sent as its own series.

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
Changes in v8:
- hm1092: report the 1296x736 native array as the crop bounds, keeping
  the 1280x720 active array as the default crop, so that the 19.2 MHz
  readout window lies within the bounds (suggested by Jake Steinman
  and Ray Strode).
- Cover: drop the staging/ipu7 format note; with the ipu6 driver in
  media/next the sensor streams on IPU 7.5 without it (Jake Steinman).
- Link to v7: https://patch.msgid.link/20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com

Changes in v7:
- Rebase onto next-20261012.
- hm1092: follow the sub-device pad op API change that added a
  struct v4l2_subdev_client_info argument: take it in get_selection,
  and drop .set_fmt, which only mirrored v4l2_subdev_get_fmt(), as done
  for the other fixed-format drivers.
- hm1092: limit the digital gain control to 0x3ff. The register is a
  10-bit 2.8 fixed-point value and the sensor ignores higher bits, so
  1024 and above wrapped back to black frames (reported by Eduard Kulyk).
- hm1092: handle negative pm_runtime_get_if_in_use() returns without
  touching unpowered hardware or dropping an unacquired runtime PM
  reference.
- hm1092: credit Jake Steinman as a co-developer of the control support
  and carry the requested coding-assistant disclosure.
- New patch 3 from Jake Steinman: ACPI enumeration and the 19.2 MHz
  configuration, with Eduard Kulyk's Tested-by. Drop its
  <linux/mod_devicetable.h> include as requested by Uwe Kleine-König.
- Cover: describe both configurations, document the separately applied
  ipu-bridge entry and correct the v5 data-lanes history.
- Link to v6: https://patch.msgid.link/20260801-hm1092-driver-v6-0-5979f223748a@gmail.com

Changes in v6:
- dt-bindings: update the example to the PLL-derived 180 MHz link
  frequency.
- hm1092: replace the inconsistent 400 MHz link frequency and derived
  80 MHz pixel rate with 180 MHz and 36 MHz. The new values are derived
  from the ASUS Windows configuration's 24 MHz external clock and the
  sensor PLL dividers.
- hm1092: report the 1296x736 native array, 1280x720 active array and
  1150x718 mode crop as distinct selection targets.
- hm1092: add exposure, analogue gain and digital gain controls using the
  register map supplied by Jake Steinman. Keep multi-byte controls as
  separate writes, use group hold, derive the exposure maximum from VTS,
  and program the hardware-tested 500-line exposure default in both the
  init table and control. Hardware-test the controls on the 560x360 mode.
- hm1092: do not power the sensor on in probe(). There is no I2C access
  during probe, so leave it suspended and let runtime PM power it for
  streaming.
- Link to v5: https://patch.msgid.link/20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com

Changes in v5:
- dt-bindings: drop the local data-lanes constraint and omit it from
  the example. Keep the inherited video-interfaces.yaml property allowed,
  even though it does not describe configurable hardware.
- hm1092: implement the get_selection pad op (CROP, CROP_DEFAULT,
  CROP_BOUNDS and NATIVE_SIZE) reporting the sensor's pixel-array
  geometry, as required by libcamera.
- Link to v4: https://patch.msgid.link/20260705-hm1092-driver-v4-0-0a13ec274d89@gmail.com

Changes in v4:
- dt-bindings: make data-lanes optional for the fixed single-lane sensor,
  constrain explicit values to <1>, and omit it from the example.
- hm1092: add the copyright notice.
- hm1092: replace the private register representation and write helper
  with CCI register sequences and direct CCI writes.
- hm1092: use descriptive test-pattern names based on hardware captures;
  the available documentation does not identify these modes.
- hm1092: parse fwnode properties before creating controls and set
  read-only flags after validating control creation.
- hm1092: use the generic get_fmt callback for the fixed sensor mode.
- hm1092: initialize endpoint parsing with the fixed one-lane default,
  reject other lane configurations, and remove the redundant endpoint
  presence check.
- hm1092: use fsleep() and null-safe GPIO calls, and apply the requested
  declaration, brace, return-value and error-path formatting cleanups.
- Link to v3: https://patch.msgid.link/20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com

Changes in v3:
- dt-bindings: add the Reviewed-by tag from Conor Dooley.
- hm1092: initialize RAW colorimetry fields in the pad format helper so
  userspace values cannot leak into subdevice state.
- hm1092: return -ENXIO when the required firmware graph endpoint is
  absent instead of deferring probe indefinitely.
- Link to v2: https://patch.msgid.link/20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com

Changes in v2:
- hm1092: use pm_ptr() instead of pm_sleep_ptr() for the dev_pm_ops
  pointer. The ops come from DEFINE_RUNTIME_DEV_PM_OPS(), so gating them
  on CONFIG_PM_SLEEP dropped runtime PM on a CONFIG_PM=y, PM_SLEEP=n
  build.
- hm1092: free the control handler on the error paths in
  hm1092_init_controls(); the fwnode-parse and ctrl_hdlr->error returns
  leaked the handler.
- Link to v1: https://patch.msgid.link/20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com

---
Jake Steinman (1):
      media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration

Ramshouriesh R (2):
      media: dt-bindings: Add Himax HM1092 NIR sensor
      media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

 .../bindings/media/i2c/himax,hm1092.yaml           |  101 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/hm1092.c                         | 1140 ++++++++++++++++++++
 5 files changed, 1260 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20260618-hm1092-driver-a6f2aaddf201

Best regards,
--  
Ramshouriesh R <rshouriesh@gmail.com>

