Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504995;
	b=LjIuPfLG+3PYe2eBcwB+DaQ8AR9FkV1WXkQ7OdfIDqRyafUFJ95eowbEEh54a2q3aAPP
	 I7a/Dxr1Zh/hi+ATzg97ryjV5VjvmxxtcoJ+/CKpKCkxsgDu6hDXvY1KLrdrplQK/Me83
	 FjYU6a5CqyUnFKtWGDVyqw8vCXHLCpeJgk/0D4h9nE7xHZytjkUMhHF6RDPvCGlkReLSL
	 2X75s0Vs6G7rFwgm35k2itBarPI2FM6nbZ8PIHvB6wrLJKx5FSLpjN6A0wBqECipJ7VZm
	 Nht+679rUe/pY34iAudEsqaCfTI0LEFNEDhHbFLlHsmIt5L0GPBuT1ijK4Wo5bxfjnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gYTWYWvrx9uxHFEZrx64abm7PgPC6k74EmVy52A5xwI=;
	b=Y3lKmn1IrLuNAcf/UKkpVH5s4K4GifyA+XYtmJp+2vzNvHi8+iluC3empuIpk26AxH4u
	 AWFVfIaPyOcwaj7VHbmrz9TLAqtO9dewBXpyQmELLPytLoTMU/f/v4cUs1JYPP2NO2ta6
	 WULSnpFC8rRWMFT1A8FB9pGR3YXSMHvPB+80fQSWZBSEOpiYn2IgAuKYyDRDPm2VKWhrz
	 Ptz2L4Gcd02j7p5mXR6B2utCkOnp5dGMkl2RwDxlW+iRZhJKNJb9HqE8LXGJo5HArtunA
	 bBq2RUf8QbC6LpnKathorbutX6Hj/0EOs3kNtJDIUvvf015lm7w/mtl56jS+A+LHBcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UocLCxt0;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2489C606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2489C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UocLCxt0
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9f6a16aedso11463035ad.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504994; x=1793109794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gYTWYWvrx9uxHFEZrx64abm7PgPC6k74EmVy52A5xwI=;
        b=UocLCxt0+RFOX9Z3Ia2YMBMniBiwgyWoJm7p3whi4g8D0v9PLbR55pQtxVO23Sw08Q
         BUCkN5YzVzNT3X/1PTf2wGgGgxN3PkpmkE+xpNXZnC5iNST0/DbX5bnMADIAglALkeXV
         +FB3gBSNokQmvVpV5QWNZIrlRnxj+YhJOPZEaLS8M4nL3cUOnst7sQ/ju5YmkvAanS5H
         lAsGUh7QF1WPwQexAwObdx62uyKLmWznXkedslbBeBwMBfcyb64HPhO+DOKkx3vgLGZN
         97Vq5TiKtUMvp9158iyfo178RRFdQ3w3PAorKwe/39CRYDAyAzg3ECVNXo5ZuXop7tDw
         Y5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504994; x=1793109794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYTWYWvrx9uxHFEZrx64abm7PgPC6k74EmVy52A5xwI=;
        b=TvYF1OF+AvhQdmvNH02l9ybw7pm/wiW2uL1E8FpNqQgs+hi7LWXXG0ZeDHgBQcXMpo
         kij2g/wp+zWOKo1LRByBoc593n5nHKFspI0VAGF/2lqMcH/80sOUuI2W619qK5/FFdRc
         2VqBvOz1DVsNevZ7GGrMkXCfktnAnKcaJgy1IWO+vzmJwIod9oKK2kJjmvYRVfhouhB/
         V5aamP8rzTKV4kC7xJ25TkUs9mk2PAUbtziNFsednmwZMX9ucjVL2ekwBz5vcpHclj1+
         0+0xEqwGpG9m3bKUlmh3yKspzh7URlTQlWf7NNrQ2RogOjQQQt7XuJNjWxdKXH9luQI+
         pNkw==
X-Forwarded-Encrypted: i=1; AKwUvBz/e4BK0vTE1US0Le+aolVgUDr7Hl6srtsac+KctjHauW/tezQCbnNC2zlYQES6vmb9PnJCQcs04gF3@vger.kernel.org
X-Gm-Message-State: AFq9FYJHbsHWREvNeJF1XF/6ZQw155wGwlG7wLilvtJ6bPs02z6JKCIn
	WJzdrwi0p2SgrxvTj4tQMUCabDsp1pGs8moNM/WjVAVIhEV+Bst1e9Sd
X-Gm-Gg: AYBFou350QkdPLq+cj2AnDHvwXXbMqDoy01THrX0POnpjXStDrABKyRz8veh9duPSFu
	xUoyXOnPonWY3bC1SQOL6kMWt8Avj4x/0ZVGy/1p1tp+/Zw23tiafxHV5a2J2B5YJlHBtkJj77K
	EHWIPmA3nw0MqHBpEFjLWNMYTFo3t+bColw0qoBgpZKW5MUo3JeE9a8ZReZI4zDQ0Sk0kECY9Rn
	8+wK9Axy3G028Oy8OE9wDDbyt+b34bb4SeLGv3/TGeZdz+ksrnyZldp/77T7EedHx/fq3UBoFm/
	LRPtO6o9U2NZbzCxds0H6MVaDdL+OpzUZObvjBoOv+AC2nNDv90MjYSvxnFUt3n1izAtguOUFFx
	IadESJ/1JmE+syJ55arY5qbGSSydhP9aGbg4muPkiqwXR9A1ztdoVv47LFAhcAO9XsP9E08EQPq
	cR3Y+vY+6Z6txMtaGiorDu7S6U8VP6epaFCWQve0zPZtOti0Ra4fYp/rSTeT7THpQOQsD1YYDsC
	852AKgWghfonCKK9UFn+2hqaXiD8Bosn5miUdtikttSmSQr36+PYTosrWyr+0zraQts
X-Received: by 2002:a17:902:fc87:b0:2e9:670f:d080 with SMTP id d9443c01a7336-2e9a6d28584mr100035065ad.32.1792504994035;
        Tue, 20 Oct 2026 07:03:14 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:13 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v4 0/3] Fix poweroff restarting the board on Firefly-RK3399
Date: Tue, 20 Oct 2026 22:01:11 +0800
Message-ID: <20261020140127.720-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
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

On the Firefly-RK3399, "poweroff" drops the rails and immediately brings
them back up, so the board reboots instead of staying off. This series
describes the SoC line that has to be released before the RK808 shutdown
write, and lets the rk8xx driver release it.

v3: https://lore.kernel.org/all/20260929140649.55-1-yaozhonguwl@gmail.com/
v2: https://lore.kernel.org/all/20260919122930.1418-1-yaozhonguwl@gmail.com/
v1: https://lore.kernel.org/all/20260909092728.1859-1-yaozhonguwl@gmail.com/

Changes since v3
----------------

* No longer an RFC (Lee). v3 was one because the patched kernel had never
  been booted; the driver had only been exercised through an out-of-tree
  module doing the same calls. It now has: the board's own kernel was
  rebuilt with 2/3 applied, with one unrelated RK3588-only patch left out
  as described below, and the power-off was tested with it, including the
  GPIO claim at probe that the module could not cover. See Testing.

* 1/3 adds the properties to all seven RK8xx schemas, not just rk808
  (Sashiko). rk8xx_probe() reads them for every variant that is the system
  power controller. Each schema gets the dependency on whichever spellings
  of system-power-controller it allows: rk805, rk808, rk817 and rk818 also
  accept the deprecated rockchip,system-power-controller, rk801, rk806 and
  rk816 do not. The subject prefix is now "rk8xx".

* 1/3 also documents that the lines are released in the order listed,
  with one settle delay after the last of them.

* 3/3: the commit message now also says what happens when pwm-backlight
  is not bound (Sashiko): nothing claims GPIO1_B5 then, and on this board
  it reads low, which was tested, but that is not guaranteed in general.

The Sashiko replies are in the v3 thread. 2/3 is unchanged.

The problem
-----------

U-Boot reports the restart as a power-on reset.

Firefly's BSP drives two SoC pins low during shutdown, before writing the
RK808's shutdown bit: GPIO1_D0 and GPIO1_B5. Mainline does not describe
GPIO1_D0 at all, so nothing ever drives it.

What was established on the board is the sequence, not what happens inside
the PMIC. In the cases tested, the shutdown stuck when GPIO1_D0 went from
high to low during power-off prepare, with GPIO1_B5 low, and the shutdown
bit was written after a settle delay. It did not stick when GPIO1_D0 was
never driven, or when GPIO1_B5 was held high. With the backlight bound,
pwm-backlight's shutdown callback drives GPIO1_B5 low in device_shutdown(),
before the PMIC's handler runs, so only GPIO1_D0 needs to be described.

Prior art
---------

The vendor behaviour comes from Firefly's own change to the rk808 driver
in their BSP; it is not in Rockchip's develop-4.4 or develop-4.19 trees.
It reads two single GPIOs from the PMIC node, pmic,hold-gpio and
pmic,stby-gpio, drives both high at probe, and at power-off drives stby
low, then hold low, waits 200 ms and writes the shutdown bit. On this
board stby is GPIO1_D0 and hold is GPIO1_B5.

Its board files use one or both: both on the Firefly-RK3399 and the
RK818-based Firefly-RK3128 FirePrime, hold only on the ROC-RK3399-PC
family, stby only on a few others. That is where minItems 1 and maxItems 2
come from. None of those boards other than this one uses the new property
in mainline.

On the ROC-RK3399-PC, the vendor describes GPIO2_A6 as pmic,hold-gpio,
while mainline's rk3399-roc-pc.dtsi describes the same pin as the enable
GPIO of the vcc_sys fixed regulator. I have not checked whether that board
powers off correctly on mainline.

The vendor device tree marks stby as GPIO_ACTIVE_LOW, but the vendor driver
uses the legacy integer GPIO API, which ignores the flag, and drives the
line high at runtime. That matches the physical level measured here, so
this series describes the line as active high.

Why not gpio-poweroff
---------------------

gpio-poweroff drives the line active, back to inactive, then active again,
waits timeout-ms and then WARN()s on the assumption that it is itself
performing the power off, and it registers at SYS_OFF_MODE_POWER_OFF. Here
the RK808 performs the power off from its own POWER_OFF_PREPARE handler,
and the line only has to be released and left released before that.

Open questions
--------------

None of these block the series as it stands; I would change it if a
reviewer prefers otherwise.

1. Should such a line be modelled in the PMIC driver at all, rather than
   as a separate driver at POWER_OFF_PREPARE, or as a regulator enable as
   mainline does for the ROC-RK3399-PC? On this board the line was tested
   going low from power-off prepare, 200 ms before the PMIC write; I do not
   know whether a regulator description would achieve that.
2. Would two named properties for the vendor's two roles, hold and
   standby, be preferred over an array whose order sets the release order?
3. The vendor calls GPIO1_B5 pmic-hold and its backlight node has no enable
   GPIO, so mainline's backlight enable-gpios on that pin may be wrong.
   Without a schematic I have left it alone; the series does not depend on
   the answer on this board.

Testing
-------

Hardware: Firefly-RK3399 (4 GB, RK808).

Kernel: the board's Armbian 6.18.45 kernel, rebuilt from the same tag
and configuration and Armbian's current patch set, with 2/3 applied on
top. One Armbian patch that adds an RK3588-only IOMMU driver had to be
left out because its current version no longer builds on 6.18.45;
nothing on the RK3399 uses it. The resulting kernel package, modules
included, was installed in place of the original one. No out-of-tree
module was loaded during these runs, and the board's local power-off
workaround was disabled.

Device tree: the board's own device tree with the properties of 3/3 added,
power-hold-gpios for GPIO1_D0 and a 200 ms delay, and the backlight's
enable-gpios unchanged. pwm-backlight was bound and set to full
brightness, so it drove GPIO1_B5 high while the system ran.

Before each run a script checked, from /sys/kernel/debug/gpio, that
GPIO1_B5 was owned by the backlight and driven high, and that GPIO1_D0 was
claimed by the rk808 driver with the consumer name "power-hold" and driven
high when the property was present, and unclaimed when it was not:

  same kernel, power-hold-gpios absent:   restarted after 41 s
  same kernel, GPIO1_D0 described:        3 of 3 stayed off

"Stayed off" means the board did not come back on the network within
5 minutes and its fan and LEDs were seen off; this caught the control
run's restart. The serial console was not available. In addition, on
each following power-up the RK808 RTC had been reset (this board has no
RTC backup cell), which corroborates that the PMIC had lost power.

Build and schema, against a clean mainline tree (28924df2a):
drivers/mfd/rk8xx-core.o builds with W=1 and no warnings, and
dt_binding_check is clean for all seven schemas. dtbs_check for
rk3399-firefly reports no PMIC diagnostics. For each schema, a device
tree with power-hold-gpios but no system-power-controller is rejected:
using an in-tree board for rk805, rk806, rk808, rk817 and rk818, and the
schema's own example for rk801 and rk816, which have no in-tree users.
checkpatch is clean apart from an unknown-commit-id warning for the
Fixes: tag, caused by the shallow clone; the commit exists upstream.

The 200 ms is the value the vendor uses; the threshold was not
characterised.

This series was prepared with the help of LLM-based assistants (Claude
Code, cross-reviewed with OpenAI Codex): the analysis, the code and the
text were drafted with them. The measurements were taken on my board, and
I have reviewed the result.

Yaozhong Li (3):
  dt-bindings: mfd: rk8xx: add board level power hold GPIOs
  mfd: rk8xx: Release the power hold GPIOs before powering off
  arm64: dts: rockchip: fix power-off on Firefly-RK3399

 .../bindings/mfd/rockchip,rk801.yaml          | 23 +++++++++
 .../bindings/mfd/rockchip,rk805.yaml          | 29 +++++++++++
 .../bindings/mfd/rockchip,rk806.yaml          | 23 +++++++++
 .../bindings/mfd/rockchip,rk808.yaml          | 29 +++++++++++
 .../bindings/mfd/rockchip,rk816.yaml          | 23 +++++++++
 .../bindings/mfd/rockchip,rk817.yaml          | 29 +++++++++++
 .../bindings/mfd/rockchip,rk818.yaml          | 29 +++++++++++
 .../boot/dts/rockchip/rk3399-firefly.dts      |  2 +
 drivers/mfd/rk8xx-core.c                      | 49 ++++++++++++++++++-
 include/linux/mfd/rk808.h                     |  3 ++
 10 files changed, 237 insertions(+), 2 deletions(-)


base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3

