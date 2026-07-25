Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048E3311967
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 00:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784941093; cv=none; b=TiZxlTXxjKLKK0QBWMvGTWqrHzm+WkSuWytZ4IVz6NZZzxsbyPvEE+ALblamAiSBKwfzuiECz1iyVIWudbCYfzo6eTArzbNQKAej+QK/cBGy/5o5ZDLkJNJ/swYsPzNHfyqOo8XItaDpjryLAx05LXGpEcWy0olPH0ptutMlGk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784941093; c=relaxed/simple;
	bh=kuTSarj9ZfJEd/4fshM2vXhKd0SE7Hs9HNHQbQ1dtwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oG0qdfNj+HtTj3Lv6lzhJr36+1oglLyk8ffvtK8UXbJNaZQbkrATvNDYMHpHaLTLFzJpCtjLEvNwXa6DT9tr/8ccz8i2tCTvID2Qfsl53Fxs0NQyXSMKr08425JWXwouXfioFf75QfoVxOMvtV7XVThshd2aDc54hYZU7lSSJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyeFUaVG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyeFUaVG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so1040879b3a.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941091; x=1785545891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RPSKOAGTuMe7DirYFHsiGB/35uTeF1WdVdXjVBBsZg=;
        b=fyeFUaVGEb6c8p+RLJ6dR6egto59MbbQvWXzBF42H9f6TYc5viPCMfz45lA/W8E/9a
         ZkKPimF/+BgGAQnC7/CUF4QQZN81GuhSkHWsLNgTSWfpbZe5/MmCHJ+agFwwsEl0H0kA
         +pswLirVQSeB2P+JqUvGV6NrRl560taQkMvIUgEQPUrBgFdujUlFlcEqZyC2okdbm83Q
         fzguk4b0EZqxr4g/YBpD7fjMRf+G5q0hPeIpOYQuturWpYuzS00glBE45oxWGPBlg/wO
         3O08Gd/3Ti8O5gKiO3nbTQM7ArDpguwemNFz2Mpalttz7ubjUp3CiQSZO257vfDXh8Dy
         OfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941091; x=1785545891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RPSKOAGTuMe7DirYFHsiGB/35uTeF1WdVdXjVBBsZg=;
        b=Pq/4Gixph5d8WCozSIw6+alSoi5wqdOVohCTkurZHmUXuYUhxXmKd/Dsond4rYopJh
         TYpPk8XjU+w+r3KQqciIlVo1u/2QJ3gPBCkxQczlU9MTO4ErrRVcvPLx8fp4xdMRm31S
         YFO+B7JIzi0agzotEWSliuCccMriQH7g4Dl3N1ffeKxByXoNnYfdjJWjlE1/KK/tmKia
         trOY0mv1nPUWE2E8eEEHamgWQLRq3a41ogYYHKVaNldWyKR6WMiiZ3FnTpbNFEz72j6c
         +YitXOFSvZbSq6Q15TY6/aK3hb1ZvGWIPVVIWhgq+2WxOJhOAWVBam1DA1biirML+lMv
         UvCQ==
X-Gm-Message-State: AOJu0Yy3Sf0oUzHzUn+o1sFKtfMhCA2Bm9ShXE8PfosTKMbofDIuBJn9
	IPo0JKvdg/PZMWlmU3BT/ZF47Jmbf9eIGwJYdQ7x2/PgfzjgmM/qbyC8
X-Gm-Gg: AR+sD12fXQhuuKJ+NODeeneDeaPS0IM3EAoulNSHjXNmNoXlTxUxyMH8YiEv3SKNm0S
	DeN4ImD6/exSuYNIJpSfXAVgSgdZaI3LdBOw5t882cBktmbAKQZEYBsfxq93vx7indS4/iIVY0Q
	xKiVyA/3LRDw6tjPVWHs1eiWdBBOCoWhhBIJ4+Xi3cQeIqWwVBdaijqpaxLgBI3WvW0pLk2Xmum
	ITKo/y4Ep0Lr2C43NvCoBMIupVJeYmqmOXTMak/m7Ft/5m4aGozR22VBiyro2nZL80bv3xJ4Fnp
	IRc2moFtXhAFb7rN7mexrT7DfwEyfUFDHdJOtpaqz2CKsD5/xdkgQE89QsIokcvpiC2VyUMyVaX
	YXrPtRLm++i2YVxcjZEsOX4rbfLGpPjlm/yXmsq/EnN3EeJOU0EcuWGW0JtDeqVjGxoSvdL7E
X-Received: by 2002:a05:6a00:4c07:b0:847:df4c:40c9 with SMTP id d2e1a72fcca58-84e595543b9mr406839b3a.46.1784941091167;
        Fri, 24 Jul 2026 17:58:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53254f57sm566254b3a.1.2026.07.24.17.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:58:10 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: Fix phy id check for the phy
Date: Sat, 25 Jul 2026 08:58:01 +0800
Message-ID: <20260725005804.373698-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported, the phy framework can not detected the phy id correctly
when reiniting this. So add the phy id compatible string to the
etherenet phy, so the phy can be reinit successfully.

Note: separate this patchset as two patch for backport if necessary.

Inochi Amaoto (2):
  riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
  riscv: dts: spacemit: Fix phy id check for the phy on com260 board

 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 3 ++-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

--
2.55.0

