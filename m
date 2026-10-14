Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F943385B9
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980163; cv=none; b=AUQJ0uiW1pW+kcrGNCK1zgmcyz/to0tcij7GKgudjPQLoTLMwpEzx6w+ZzohpfgDuXm9Opj+yVyklsSlm9vFsP2QV07tr8XN1/I7e2XjTS4PoI87xyjqP+qh0R5GD4Y8knI51ccfS3T7rPcu1vbkyBLs9UY7lkQqFH7o3a6Sjqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980163; c=relaxed/simple;
	bh=l5oEal4VAJKhbsdVKhFkkLQTTN9gxEOa+mODKSDfhF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Swvz+54Iima49ICyXAJRQXwHdlFCNeJ5/ccVHdQW4BIqWRhyjXdzR4S5a5RLYKWDzhTOQC+QD/TnVfmkkm8qR1IE2e545xI9+Xp/GNDqKRbhu5rXMLEkb5IDpgNCVwBevS6TDD2Aqg3Z00vUwLsEJYegsitHHePB5xGv+rxtIeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBa81QDG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBa81QDG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2288144f8f.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791980160; x=1792584960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=QBa81QDGkiVNHB9FucMW+Or2VQh1xMRCVUhT7HhuLwdgoyO24ozI7qIVhA4vAQsOi+
         oOEAhQrgdZ0Pf77vtlpu/C1F2acWGMoXT026ylC0/hZ/s3dPcPC0iW/sy/KZeo/DnDH5
         bWY6KhgUrDE7jFO1giHkMiktxe7Vg/60FLUqhhh5cnC1DgYshKIEsZHnE56IQYJLGtGf
         Y69cEnx5oeVpHWInekH/Yu66Gx8GG4YfD/ivN20JFyG5xWSiLF1+45olsE6t9P7hthsf
         948avonszX/GahWNA7TN4F/k32dPVoDdT7IQnFz8HAqMW1O3nkEcKH1eAWMNo02M+Dpi
         vp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980160; x=1792584960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=f10bWa6AfB86hZFzXk3MlIlgGQH/IvHkr5YjKdXx81GOOG0X69kPGPzyJtza2yHgfm
         RjGz5pW0X6WrEg1bh1LGoD25EogZX/IKJ/4jGVsT5Lhr4IASlVzEV9HaH8vNZrC+lcNl
         5Miclg4zzHLEKFcaqgdk14PZv38sVpDuJoDbVZ4JEzzvKrZsX5uc5M/PpNFFCbGlL28N
         O1u1ONekyOEdamzQqRm98mSUb0I1jQcbRKBvax3qdhHteACiTpaasBiZfVnq8R4RqYZr
         ncR/gIUik5h9GEpV7hdmL1mIPkd/77VNlBmMhyKI4PaJuQ3NUc236N3qMP2Z8GfGzq5d
         4Y1g==
X-Forwarded-Encrypted: i=1; AKwUvBwQ+pLV8TEf775yxTZ6qZO40id5uqJU5W45HVYf1Gq2PjrNpQkkVMgrG/HNw4amAdDAS7tRIav1wO21@vger.kernel.org
X-Gm-Message-State: AFq9FYLqqD6HZsVqNv3DZxDjoB29gGKv6a32Libo37ageNWyb6mGArIT
	LyLXk7WhClEahYAKcmFPjvHoj05BukkCZUNqgWxGo8b/CDrQXpwc2fB+
X-Gm-Gg: AYBFou1EExs1K6NuUF2bq3p38DSDhj8Ydps2GdN3/eHS9iTAWeWyYwlEkQeZm05VFeh
	fGOkidCzHKpFSYH33fTCBddqE0poZ5r05gFtuAWsPEBP6/ipOqSBuEGPf3SzT3+4PRXoFSmtVVi
	jVW97wCGm//pJjQCE9JX3ya8DfgIGLRO0wbekXJUsYJrlXQuJsizTrmrLMjQ1P44NUo/a7xAFU8
	hyRbdhFm3qVUMhzpRdSVJFZid+hCd6scgj/j8p09KfjSjFbpbFa2cH3X7bBbuypfSFNC8+xdh2m
	3cAGhK3gBi9hGTdzxNuXTca3QZwukQF0faY734dB3mOVt4zS9XPAdoa8zLYb3zg8GfweDjul6O/
	VVJFxQS7/cl/17AYQdjA1NFSXUNumNGHwp07dKch5niQ2uHAbJ36JGd7xe/FmXBQMCC6oUouR0u
	3O8Gckb1kEOjZDQeYUd43vQZ+hV9Qq3vB0zOn2DurA3UybbUG8GpNtJwsOEVHY2DfuVeN0we7cE
	Np2HkfpqXr1drwAEehxiiMyQnEM2g==
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr21986456f8f.16.1791980160478;
        Wed, 14 Oct 2026 05:16:00 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm11006660f8f.36.2026.10.14.05.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:15:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 0/3 RESEND] mfd: max8907: Schema, pdata and poweroff
Date: Wed, 14 Oct 2026 15:15:41 +0300
Message-ID: <20261014121544.138958-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return
---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  38 +--
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 309 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

