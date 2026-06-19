Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586C537267C
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866268; cv=none; b=cOWVYCk6aaJVwgkd6DQzcSqdZ+ismTMR2AgYS8zqgE3QCH3psT7/p3ZJ8+rGZi387sOakcgFoUHOy9zZe24ey6Qtd+tLHmSUhouU1UlUPx9WTyaMlwjR4sdbAS+L6IMZ4eK1LcO2CCpnsr69mRYyMKS84Sj7Q/gPeSeKgZt6XH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866268; c=relaxed/simple;
	bh=EELqn+PHBBQv5Bsn9oSjQF/Cgyke81JR49hsca2eR74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VNQOxyeFwE6qgpL5rhKlGwIZuIWAXCNQaTVmO68X+B02qEQULBwjHbQw9j3MxePtbj6dnW6UzTag0cFDe67shDemqERyddLoq0BLrWbysD5yffNHO2xAPYV3Wmrf1JyTd+PQk0t7Co3ahn/ogzV5IRkAZwbyoXYPdnGozgD6Lzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=RpW+JBMY; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RpW+JBMY"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8452a597afcso1167309b3a.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1781866267; x=1782471067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxFKvuyFF6BTG/rctR0orxCMzNYM7JR4gRpefuX09Jc=;
        b=RpW+JBMYaK6psFjUSlS2Jnd9GaOiR23D7/Xdg6Og6sP4vF6B05xszDUxsA3Sc9pPKX
         DItbAIJUrQ5CbcwwoJPfvN/2J3hxrzkN4IZh81qlyfosSd6Brtls/qLeqo1kqu34+XZL
         HVrzoQbVLxVO/lJ6PANcLQlYLmevcjX0CdjKw2GJjdOoUnEpdyg2VM4Ah+qaSZQWsKZp
         2+KpHsTJ4db0EtnSMNxZY3mbNWHK/pvZdA9kDBoOd1W3TZ8emvMQbc5FxkXvAVUD3c7L
         MvtF3f70+Vdpc4pK3zqOqyfik3gvNb5wNrEwXf3IoTPvMLfOWtfXBn6MAcSdKA+ilSXL
         y3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866267; x=1782471067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxFKvuyFF6BTG/rctR0orxCMzNYM7JR4gRpefuX09Jc=;
        b=d/IIxA7wyC5+R/Um0OiaFRZm2HR4bWTwRDxELSy37kKvn0gtAolOmGZJlTTUrqyg7z
         Z60cOy4vc7bMAXxdvIN8maza/vvFgttLKeRQ9G9z5okkGguZQc3svtABZWvalGO+8FtT
         WW0uneJPg+5F9rBku+MmeW+FDTj2H3PksOJbELWWQHBsAZsVWmDK2XX0eCBCAKWwK9Fu
         iXhCwKVXN7bVGf+E3G29KX18oFin/PBi4UQo+NEiRjm8ujDw152cxLeljS5k5duY/skZ
         Eq12d2uwwnpsdOVcd9dLblStMH54MWJDChaS3EYRTCx+1QpxGQp32rZGYo1skkd3wZsa
         c3yA==
X-Gm-Message-State: AOJu0YxoiX9NB7G8NJjm37WuKAFeRsOnXQsodtqqFvi/qTfuUcwbjyVV
	mva/eaAaMNuz9yqTdkuEbDiw+zKeYKOHpKi6iikEBgW1ZtfWI5lTQP0OAGSa59rdaGsYUGQ+m4o
	dWOLAZhd58a8WW8QApVIoiyL3gWwjLO21BWHE0N2Z4fHqD5TEQhJHe50q8odPF5vQw9yI46bFI1
	NGEgU5nUNIB7b8ESz/prcYkikQOdlnS1Nj7HegtKxzwgWYjRihU9yj
X-Gm-Gg: AfdE7ck1vjH+c9iIPnG+tgD5MZvzkUsJ2+0P4eS8/DUgfihbrXwVqbArGrgpjpD63q5
	3zxTZSOvUaknrUOYLtNL046SJ3aNDGD/+/K0hdhIqeHi7wfFliqpBq7KAprrXLRTaUOKsg0RJjU
	Uw1Ez1GPX6Aqb85n8skBLYE54M9FR+4fXRKTonl3ISJN2FGiI2LGqjoDZ5lPcpa27HFpPwmz7Jp
	Vs+Gs3lZ5UrIJuuR8fV2ASucDdiv+998c+p24gs4NdxGW1JiISR2c10H6zuUWp+PgrWhHQNKDeB
	qCFwMVZDN9OQ7qyaNB/cFoP67NLqz8C6BVMdtqmAI7yNhpw+PHQWpU9OHqvR0gFBhQNctxzv1SA
	mKpsDlbVHehk5pGNvQYP+BJ/ZCoLyp+C1p9yeTWCXSW+bpWxt2hLoOhcqocREU+y7/J3yIcAeYn
	B6YFD4BDn4/eR0GGJoEr46nLfbKFSnghfnGlje
X-Received: by 2002:a05:6a21:4c85:b0:3b4:701f:a0dc with SMTP id adf61e73a8af0-3bb33952d2bmr3655979637.26.1781866266328;
        Fri, 19 Jun 2026 03:51:06 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a84c6eb1bsm1993583a12.2.2026.06.19.03.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:51:05 -0700 (PDT)
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
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 0/3] dt-bindings: riscv: Add RISC-V Worlds and SiFive WorldGuard DT bindings
Date: Fri, 19 Jun 2026 18:58:31 +0800
Message-ID: <20260619105834.1277302-1-peter.lin@sifive.com>
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

The three patches add: Worlds ISA extension properties (riscv,nworlds and
sifive,trustedwid on /cpus), per-hart World ID constraints (riscv,pmwid,
riscv,pmwidlist, riscv,pmlwidlist on cpu@X nodes), and the wgchecker2
binding with access-controller specifiers.

The access-controllers specifier carries range, permission and config fields
to support three use cases: 
1. single range device protection
2. discontiguous range device protection
3. sub-range memory partitioning.

Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf

Yu-Chien Peter Lin (3):
  dt-bindings: riscv: Add Worlds ISA extensions
  dt-bindings: riscv: Add Worlds per-hart properties
  dt-bindings: sifive: Add WorldGuard Checker

 .../devicetree/bindings/riscv/cpus.yaml       |  21 ++
 .../devicetree/bindings/riscv/extensions.yaml |  29 +++
 .../devicetree/bindings/riscv/worlds.yaml     |  86 +++++++
 .../bindings/sifive/sifive,wgchecker2.yaml    | 237 ++++++++++++++++++
 4 files changed, 373 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
 create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml

-- 
2.43.7

