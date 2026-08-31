Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBD34078CB
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219515; cv=none; b=cz2/mCjKcYNtbzeBNH9rcE3RR2OlnTjB66s96lpzECGIxJtOTSykDoNQm+HNU7B6BZJuB5TejSE73aabrSZBxx91tTsn4jPak5Hfa9DMQXGwXZwoPWbm+2Lz3HzFu3Pbj2VuV/ANvyYJDYZHOs5L/vQ2K4+olr4u5TG4vTdm9uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219515; c=relaxed/simple;
	bh=rA4QIuFO1naxnZ7iJUUs/gm+e2xWDF9gudgR2Nn64Gk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dbysEQlgYorPGyV3t2g+VIEWHxSJBj/S1+/Nftm61njKTTIQCr+PglFqS1XTWCVd9geFEgvC6Ke05HSTt0hRtwAPlNHJmr8oTAmJohxSqU8QnJgTJi19bYTEDqTzr48ngK5fDGjxMWQ+o6U6Tv5Npokm2YOF2J8NVgacAgBsygM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjyS/UB3; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjyS/UB3"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384c94c9423so496659a91.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219509; x=1788824309; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hwQVXIa0QHzqYvJgZtRa9WuBPtpZJLxZSfo8Qc932g8=;
        b=SjyS/UB36zVGKY26DiVotw/3B0Ri5BfX6aWtTcHyzNNDEwmCkCB24IftXYX3QoRLNt
         Ie+UFMATWCI95rBEg/+4bMRuGKb9lsKRPO1143In4afQ0jzp3L5nXKwaZBS+MrwYEh8h
         +qDUInUQwI965t1zJaHjaxtIGyxpmrltFPOuokVNwidQpU7zzjKP5YAj2DqUtaeHoRhE
         MxgXSjHpN09g1bD3O0MqV0qSUX4kakcGDhGO22h0AFdJZoTERnaJknCUgCOonDX3TLoe
         tL8b5B48Xbc4QiiOfbInGXilHLzKSp6Z5DAlZ6Cd88sIwW/FKQ9hR/S9Des//D9xWry2
         MRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219509; x=1788824309;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwQVXIa0QHzqYvJgZtRa9WuBPtpZJLxZSfo8Qc932g8=;
        b=WX9eVFJ/beuG0GaUr1nyOm81K6S/BYq8WYIMJngNFCnUaY50MNuNqi31WKEw5exmBO
         XYWRPFgQj2b1s4uOkzYFL+7+5oYL+3mf7Er5y16glm6+SGY0xoq3pqivpXhADH6dgBFR
         XqUDSVH8F9V36l28Gt68Vdmu8WY4nM4/x640bcNXpohWPxv8YVaRALjY4NJkYLRgQUYF
         7VG70K05SYSR+d/Jjm2LV6d1KWopBsemZYclHX41MvHY6x4OfWMVOujSA8GXnbVnjRUA
         NuRFNzyifLUxc6JRprtpsmHZVpWlO210fFT089LDXnsq5/oCQ+pPdKpmLtN8rj1fcQQh
         J0iA==
X-Forwarded-Encrypted: i=1; AKwUvBwojc3wJZ+V79pD1MHYPjxJruD2OA/e0wkP9q7UkV+uB3a2g80dAFq26/EftJ8ie5gmJNneDJzsDGOv@vger.kernel.org
X-Gm-Message-State: AFuF++kl1R+9lBNOJ0Dke6ucJCol87o9wANo+XEsTf+7z9rfT91O/yCd
	mJMMtKYu9672mPQBC/qotsp7LJyhPoOL0ZRWePDKjbUGWGY8u5dgDzl6
X-Gm-Gg: AYBFou2vI8CjU3eYZE2mYpTWLbf0sl8IEmfOCmVDlCWDVAuwKu98rwXS9jrEiYEKVbD
	j0ApPnSpNujLw+WLwDokruGl1NKR53exPdlmN0Z5p4gLC/1X6gamNBnMz2tYhHWz/FdkpL+j3qZ
	XnAlYcJl0x5pZ7p8oV6tSxT15UFfPMU2XC03chaqe38AEqbHqI/3Pyb1BI1prVozd2USbSyBUZ6
	+pAANjoZqvhkxXcO6xZalOhqBI1rdJ1LoNUSHoQlvDZ8W7o/dxviNgC/1yHcXDS1rOpOzDwS0KV
	v7y5GhbEm5k3SYLUportD3Peo9L6tm36H/mx9nIRqybnWjGh74dr0W8FgCcRt6HnR5cacVdtm69
	msWWmCQR3+iu+uzv8EkPutlMfJdf+Pz5L9ip1C+QudjzvqUugt9v9P/ycdZPnoMvotmSa01/M7m
	LN1gXTtD3eSDAOY1hkIHaSbbM8tIu4kkG56KvoiuLITnoe9zjPXfOLuJetrCgI+Rw1AhQcrjc=
X-Received: by 2002:a17:90b:58c8:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-398bab4a682mr15645724a91.2.1788219509209;
        Mon, 31 Aug 2026 16:38:29 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm2143682a91.7.2026.08.31.16.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:38:28 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Tue, 01 Sep 2026 05:08:11 +0530
Message-Id: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NwQ6CMAyA4VchO1uzbjDBk+9hPMyt00YFM8giM
 by70xMa4vFv2q9P0VNk6sW2eIpIiXvu2hzlqhDubNsTAfvcQkllZI0aBoYLjf3QtQSekhviFQy
 VjUIVSFde5Mt7pMCPj7o/5D5z3o/j50nC9/S/lxAQTJDW1hvf2FDvTjfL17XrbuLtJTU3zLKhQ
 EJlj0ioHVYOfw09MzQuGzob0mAZHB2tDF/GNE0vFcnxUT4BAAA=
X-Change-ID: 20260813-ti-keystone-devctrl-6e49212fe35d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219500; l=1991;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=rA4QIuFO1naxnZ7iJUUs/gm+e2xWDF9gudgR2Nn64Gk=;
 b=H4FZ2/dn30PCO3uXPEo/aR1of0PBoI48JMMqoDbWkWPQDQBUKVtcpjEkQ/M0rbwDir4sxD+je
 qH6LYUnKY3LAKQd/JIeAiazlV/rSsSrA8xyw/e+W5KjAUYZrf7+m4E3
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- add compatible as required for child node
- Link to v3: https://lore.kernel.org/r/20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com

Changes in v3:
- Rebased to latest mailine 7.3-rc1
- Removed note in patch 2 as dependency is already merged into mainline
  and there are no more warnings.
- Link to v2: https://lore.kernel.org/r/20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com

Changes in v2:
- Fix legacy node names containing underscores in existing .dtsi files.
- Dropped 'minItems: 2' and the conditional block. Made 'simple-mfd' and
  bus properties strictly required, as all in-tree dts uses it. 
- Updated patternProperties to strictly enforce standard node names
- Link to v1: https://lore.kernel.org/r/20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone: Align devctrl child node names with dtschema
      dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

 .../bindings/mfd/ti,keystone-devctrl.yaml          | 90 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   | 16 ++--
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  8 +-
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |  2 +-
 7 files changed, 106 insertions(+), 35 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav

