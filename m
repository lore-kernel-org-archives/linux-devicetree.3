Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6B830214B
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785022441; cv=none; b=NDWBqNb38RysueoPcf+gXUX4y8M3fGZFiN9adCseEMeqBD7dXnhWMDbwR/c0eMP6YkGMuuLesl0MzG55UXz1rUh2wlMRnPDHLzk5sWSGgfWXhlTcJUbr/3NXc+OX9Z1CEl47pwlNId5CqsYDw1VLZTeusKTw4fYZfEme3nv3Dac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785022441; c=relaxed/simple;
	bh=CWuNqTa1Di5xbCXotLCoazjjEqZ0QEGdVNvasAZYVrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z/JLIE1T6KtwqabV+hGrXmcamqhKqvf3tckbQS3XJs7kXvoqlIwbCEafNeEWGdoXH4rVRpMecHePP4rfzlcVSgQX+Afq7TrnNi4A7/h7cqOeDw3crDP18ASlz/QfWjKAliQUH1lC2UCMU02JtLngZSFaO0CI6X0qwk9dHk3GXW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3q0UMgg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3q0UMgg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccf2360620so14546785ad.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 16:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785022440; x=1785627240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZe3o6MEZnJBcnhQqox2Guu7ytbKOYx/UVedKiDOk/8=;
        b=p3q0UMggo4Gy6luZ10AOF86MFKtcnothLmpTuNml9ELkXVePF+BmM3jiSS/mUJYO6f
         9tU9gGPdrJ1+S3/s4tbnumMRL3C09DwISdGOl6YLS0PWKIWuexOUQB32vQk/npQQOZvV
         uYgFC/kK2pLRyGDWA8pYHJaNPBoPHm/Hp6JSEVxPu7EBX/3kcfs84E2+4VMa1qlqrflW
         MyHl5SCr7nwURX2u4oFyyXMAOHj1DIFu4ifMpwZHhk7/KfDNjuUaaKuxbaG81rTCDw7n
         9Kq+ygecFyPkTsp8fjIQtoFiOSGMdUu/WcSANAKvkcnYI3KfhdG7hguEFkEh4D3hGoQF
         AoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785022440; x=1785627240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZe3o6MEZnJBcnhQqox2Guu7ytbKOYx/UVedKiDOk/8=;
        b=ifwPLAmCDTIU+y+cyYJHyg2SBXi1SlxZOTB8pK7SyjFw+2h0TL1T/DcDjHfBjFIM0C
         SAuaIZlzl6GjEXMJn8GBAC2olYDwNXvqVCuDzY4V47g19DACZgLTciMxPcnLBi+xNL8n
         8GquX+T8Mm2XxucYy6++fuwI2mhyMTuMWbMEbDibAAdI4rxcbO/iuZY1MuPvFZFl8yJ2
         8Q2SNzKGrZh8zvDiK714Z4U2C3QJFCQxGETUZ8T/qKA5ZT9UkY0LODcj5r9l0FPqjmIM
         E/O/JDKXklpgt9Zt6PKNxaKhuu/YsFH3XBlvC6+7U5Ib7Yx3ZzWH5s3LHKznIy14lpei
         0NZg==
X-Gm-Message-State: AOJu0YxeSHdxsqjGzfmSPBxgi+s5aojeeE1Rr4saPoFDDwNSPQF+HozD
	WKnyJC6HYpUN4Po9EdifOAU+qLZ6uUvLSBuudnZCYXnm67saPupj1Dlo
X-Gm-Gg: AR+sD11hCkZrlapHi9u3FZfF+FNrWlgto/tiDeNK4+/yMwFAUHmfGSkiToPbehumNTe
	uEnwReC8cGXF/zXmi7wyRzPZ/b7Jg1H2PS8BqSpDDwRrLyiYZuYVCo/89f0EE6Mfm00eZZXvxIT
	Ysc737wqLxaRxn7/LNt3F/CXxzzjBI919FYiKlzzhvN59zJ3vvtFwh3pmCMLM0qpMkTwFFi+LQD
	jp+pzuiP43HLggPfMOgZ8hjjN6GCjk9QzMX3Gs0wFZCbOYA5mVYNevvf8QYocTSJJG76Ed54nsQ
	beqXGkAsDgpSz2pH7rr/waxhwO4McQ7hbn4mke55ARVls9AV5D6mdPTESKrZdgqIgNQytfJbdYD
	sNibpJKX0r5FuyfrE8Kld79qzm4xd3WmRuYM4Si2+6adcfyG87ZV8d7oRttKihKrv93Zc4fNwAS
	ge
X-Received: by 2002:a17:903:3803:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2cfde55df36mr33858585ad.0.1785022439897;
        Sat, 25 Jul 2026 16:33:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bb2asm13811605ad.10.2026.07.25.16.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 16:33:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: Fix phy id check for the phy
Date: Sun, 26 Jul 2026 07:33:48 +0800
Message-ID: <20260725233351.55004-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported, the phy framework can not detected the phy id correctly
when re-initialize this. So add the phy id compatible string to the
etherenet phy, so the phy can be reinit successfully.

Note: separate this patchset as two patch for backport if necessary.

Changed from v1:
- https://lore.kernel.org/spacemit/20260725005804.373698-1-inochiama@gmail.com
1. Remove all the c22 fallback compatible.

Inochi Amaoto (2):
  riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
  riscv: dts: spacemit: Fix phy id check for the phy on com260 board

 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.55.0

