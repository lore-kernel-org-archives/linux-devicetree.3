Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B53603DF
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245915; cv=none; b=U7j0eNV+SubcAg1z4QSiXX1Sv9eBZSG559ZR2xeeu/3wAlaiW56gkXXu1cHhQSETmK2Zte/3Z1kXJU5sEl1okFXvEFBCGe22uRRH936rDTB6wCSgXqRFlSC1iN3xd1btmvOm76W/d6bTi/WewrX6dE0wq7pDYDJ6VuM/ElS/5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245915; c=relaxed/simple;
	bh=9HHz+PZmIU043XQ7rom8DlX5THuo9509KC/LsRGto/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZZN9C/zxlbyl5lAVsoD/QQgTlONB3CmH4bhGm+C/f1DSj383AmBdA1X8Hp0I/qydp/b3jDu2zeQfyNx2xwL4gGFuqkt5YeiJlM2fjRW9JhIdL98xBA+L5AXSq1XArZ0+v0A3qpEu6dOpZkBx2UvoXseJ7Lb+OsAFv2zxItqCo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuBy13Cf; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuBy13Cf"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f00a567cfaso1911310eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245912; x=1778850712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=95h3r9WDN8xYbN8MdzSzqWBs85R0XD938YswTTlP/Fk=;
        b=FuBy13CfrTxB8Ntpgp2HWX5Lbx8dQvTS/dqxpWlnvFPR5RRVw6mAImZa2O3ojwkYdx
         4to2I0SOsBNGlK4MGCrRCa1MF6pYOkcoUJgTgDn7Gg4lzlwdf7GOX2Q2OAlhKUYf6rxp
         r+VXYqj7XyBvCCI2dexku1fpG6PocAjR4Frzbxf4VDAMtmD6YyfVeU2rt8iQmBy1QvWF
         jVxmg3d1sde1SFvbeELucG/QU2OnenmkDBX27mMitXAct8YDGoCjLl68asUUc004ojTp
         2ZLKUYsqTQNm/++I493SMN6sNBJJRzr/6pv+8Dgz0syB+UX4RcrkMtZh/XLonojVufUI
         WSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245912; x=1778850712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95h3r9WDN8xYbN8MdzSzqWBs85R0XD938YswTTlP/Fk=;
        b=MseSfeQu36ueXlYltHbPWmAaHa1+HET1hyxtAgwofXHRmN2GriCeHJVPf349b2R86b
         tMUv20gVX0vHcfmGOCZZpqd3Fy6Yxt6EcZa8+yjEWYGsdReNqK1430eX6Zpx779r0EH2
         f2dFW2t6JqxSXteeC7e+/KzkllqMp69UvuKACxyhreOtKn5w/KRYwvGLdQ8U/GTOoVwp
         rT3DlRheexAXwZ1hnHJaeir9Ewr2BYRDOCmG/rEO5uYKcYfGS6S2EGAxVShHkNKjbJM4
         LrKfMcmOrnykp3ON4wDU7bkBd4FfVXtVUCVK9SgYFYngwU8XbwBoo7+LxEZ30QvWHCcB
         lrrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OqBo56HTA1gr1t9pSdm8G+WyhAJ/5S4chla5tnW8vK21qX+RC/SmUEfrL0enSjQR+6nfTo/TMafIn@vger.kernel.org
X-Gm-Message-State: AOJu0YwFo7vP+sCmKD00ERXa0s6FlInLfZB5D/Ox6BKKlavn1jJdOm7m
	K3vuONqMEkHuYXll8qkD7pdLg11sbY+R+yZo7+y5qarbjNzRjZNxxOx2
X-Gm-Gg: Acq92OF18THSbGzHaNcb3tUcb5pRnCF4LLJpN9uCwc1HrmJ3NyMWAoJjwdonUUdJIlS
	KBWz3kGv8uDuLnMpQqV1TYsP7mXpsaucP/kwUs6KjK/yBWPicX2rAKiACS0fjKKZ1BeH13iJMOv
	CwIuJMG4G4njGnXERszRN4a4dQ58oKebwplexeoMmEOWzbsr68MoCX83iHeM2vxZbHHTPhrGHE2
	Y0RZiQLpzXZvh1w+XqOYnUNoXL6YrT7tNTHHWu1WTLsvZxrog/Vs5xQGqouCZSEqJE1UWDVd9Tj
	Z+QZBI2VV4iolgKuLFolli4s8OT+oBKGYJzVmuFLMSBsj34hA8SFciGRmEtKYeSiw4IWZVGUfgO
	psqUAzQtNF4eYhYdP0gS3QKD3JD8PtMEyTHXU2ezZ5jDRe0Ejr+AbIGcCtGBqa6gZ6gw4krKfpV
	RHs7Lj9Vlr1CzZDX3/+g==
X-Received: by 2002:a05:7300:bc83:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2f6debccf9emr2873444eec.0.1778245911455;
        Fri, 08 May 2026 06:11:51 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:11:51 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v5 0/5] leds: Add powerdown gpio for is31fl32xx
Date: Fri,  8 May 2026 21:11:34 +0800
Message-ID: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series primarily adds the powerdown-gpios support
for the IS31FL32xx controller.It also includes a fix and
dt-bindings updates derived from previous attempts [1].

Patch 1 and patch 2 are based on a previous attempt [1].
The driver-related updates in patch 2 have already been merged.

Patch 3 and Patch 4 add support for the powerdown-gpios property,
which corresponds to the SDB pin of the IS31FL32xx series chips.
This pin is used to enter and exit the hardware powerdown mode.

Patch 5 fixes errors introduced by previous changes. It impacts
the brightness control function of the IS31FL3236.

[1] https://lore.kernel.org/all/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v5:
- Adjust the unit-address in dt-binding to hex addresses, and remove unnecessary if/then constraints.
- Link to v4: https://lore.kernel.org/all/20260505145354.1267095-1-jerrysteve1101@gmail.com/

Changes in v4:
- Fixed compilation build errors due to missing header files
- Link to v3: https://lore.kernel.org/all/20260429154449.730880-1-jerrysteve1101@gmail.com/

Changes in v3:
- Replace shutdown-gpios with powerdown-gpios, follow gpio-consumer-common binding.
- Link to v2: https://lore.kernel.org/all/20260428023401.330308-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/all/20260428003412.322032-1-jerrysteve1101@gmail.com/

Jun Yan (5):
  dt-bindings: leds: is31fl32xx: convert the binding to yaml
  dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: leds-is31fl32xx: Add powerdown-gpios property
  leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
  leds: is31f132xx: Fix missing brightness_steps for is31f13236

 .../bindings/leds/issl,is31fl32xx.yaml        | 187 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |   8 +
 3 files changed, 195 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.53.0

