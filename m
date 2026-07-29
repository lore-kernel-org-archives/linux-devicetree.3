Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754484C0431
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343173; cv=none; b=jgA80jdyyHCYhPAKqrldpLMO++sPXbRCMx1qpiJjxO3GoOA9hcuJc+EFQkjVbopIUb/mnL4mAb+7UAvBmPj+lpaMSYcDToPBlUuvvRNwomn+Nm6y9vYPS5k06piIFWiQQiEp97F4FKVtsDvJ3/dG4Z81/4ugwHKIu1wYnyR3zuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343173; c=relaxed/simple;
	bh=dFrhT45su+vy5keOmWGK9qEOzKFRMGI4zQn8+kw3vzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aAzk1G5XOu51vrZ0JDBg7qi7kLJttj5mb4K+LfzWeZDjkPSwA3IOX6sy/RaEuXlZU2pUNtZjyYEzxnLEj8Q7WyPGNMpSgRtXQDn+Wc2SPsepJh7j9agDczg1YCZQGggKQTHm9ZcYl+n9MmQLtA7wcDSv3zLspYntcKLmsnZfEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=HNHtP3Nq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HNHtP3Nq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954aff6088so11616805e9.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785343166; x=1785947966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=opojOAysGb4SS0C41Z+S9Q7KC+QECKAFOdrhy1fGtww=;
        b=HNHtP3Nqj7IBnZ3MB2kBpRHlmpt/vXS766nKzWWk8cWjVWbVboSp2MenF45cVjRUgK
         8BQADXEWUE4WzkYHZV/807k1cn5uZ1n3/kTO8q/2EoYDd36Ear/z0bbP2KBDWrK+xlcZ
         vlo8RP42dCEWwFbGEhnsq6mJPsxPegVXSQfXUt92Qhk1LBdaqdVq8DAeppmMK/rWav0s
         2WxLOD87O+BvSiLhq+njcCzJ+wXwdJyVVtOEsbWysUUcY66H4KfizyjlwF0ZT7R7iQXe
         FivtVmHKWsSr27ub+zC7SiDRYoY+SU6ea9EybXInUD3FCNGIfuJxZKyBUb+VKm2eKW4y
         gCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343166; x=1785947966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opojOAysGb4SS0C41Z+S9Q7KC+QECKAFOdrhy1fGtww=;
        b=XH/cHtI/Ai9hQczifKs+1yeNVnDGaS6Ia5ENUjbT/TWalUCuxoCGomjkwcO4lQIvu0
         qH3yozrCVpMc1YYzVJHbmggjHKejv0tJtNY/3mO7ouf7QquSQgobtmx8vZPmsrpD5ehj
         vt3IWhYme1VyAj+4hgCA3E7d2ZwLtn9Lxt6mpVuV544k2mTqHAJ1Ze0nc5JUwHj9hXcx
         3KUeGKNY1lHWy/n7YC0nMn4F0XrB6K66mwyj0mT5lxQ2HWtuDMnRBp/vmBvHQB3xBaz9
         BdUZJu2rraz1zNUqm3kfW6v4wdoiQXva014fGcZyTss/v3EkOkX9FEoQ8z2O67R+FtUj
         xnUg==
X-Gm-Message-State: AOJu0YzBvKmVd1uUXYUfsANM3nWVBRdRB2k2wH1uuHdEseZ0hJ0rK9X1
	Vic+rU+14RyxFWP+BZGy8TLMz1VgjzT70EdDTwxZS/WS/1Bj+GpeHv8Fm+UjLbQaxXYuPdXbsnS
	ZaGcG+XCUZOJCpIZI13aLYGOigH8LNL4Rn8goGolZePLp3VxTcrZWkW5+DyaafgwG98yvVczIot
	M9T13llVkjfTiR6WZ2gXHvBqIOl83sIdcxi5m5WqB+NcuCOuJiUgzG
X-Gm-Gg: AR+sD13nJDzi6skDebzRkUa3loH0VzNN+TWPcXAvTTz084rRL2PvNWWWc90WTkVvY32
	uksF6LOk9S0iE4t0LS0AmR7cwwpdDjYWYNVrEHDLhoDl0/h0cjyaogRJTlnQ79Zg/IYMEiEDKQd
	g8ZkYwUvdKKfr24UCWWciDcbcYJB3t6Jkp1kMUlA+Hkpl20uVX7biPwMydk27codGCS6XsiNcf0
	g2UbBEURhWiumv7XA0J8TVENTUYLOlHDPImhoHx3TcXqBkkDyxEENPOlWRtWKVzAOX28KI0f9h8
	/AFRoIfTbxEBADACp/kPPvwMKMq/MkP/XnokByfMJR9Ad6SHZHXsFZ8JVNGTuTDb7QtFozlHNAI
	I90KpFLJwCzx9Z7PINu8Of7JWDhLIrKdcbGkvl1ZDDzBCIkGxVNX9v2QdhC+ReDzChv65BDLf2d
	khDzRpdXD9dOInJAF1RBuOhvBIfcguQKTe4jNUmh190+zQvjnqLh0qUnZitT+AKH8kr4ABiibD4
	95H7Z+OF8ADkmXne+IbR+8=
X-Received: by 2002:a05:600c:820d:b0:495:5943:b76c with SMTP id 5b1f17b1804b1-496c658f5fcmr82136345e9.34.1785343165663;
        Wed, 29 Jul 2026 09:39:25 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b0535sm164242145e9.4.2026.07.29.09.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:39:25 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	guodong@riscstar.com,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 0/3] dt-bindings: riscv: Add RISC-V Worlds and SiFive WorldGuard DT bindings
Date: Thu, 30 Jul 2026 00:39:05 +0800
Message-ID: <20260729163908.249838-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for RISC-V Worlds, a standard extension that tags
every transaction with a World ID for fine-grained isolation. SiFive's
WorldGuard Checker is a hardware firewall in the system interconnect that
inspects transaction WIDs and enforces per-World access policies on memory
and MMIO devices.

wgChecker specification reference:
https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf

Yu-Chien Peter Lin (3):
  dt-bindings: riscv: Add Worlds ISA extensions
  dt-bindings: riscv: Add Worlds per-hart properties
  dt-bindings: sifive: Add WorldGuard Checker

 .../devicetree/bindings/riscv/cpus.yaml       |  61 +++
 .../devicetree/bindings/riscv/extensions.yaml |  53 +++
 .../devicetree/bindings/riscv/worlds.yaml     |  86 +++++
 .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
 4 files changed, 556 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
 create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml

-- 
2.43.7

