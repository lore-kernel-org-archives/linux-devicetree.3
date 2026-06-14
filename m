Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7251A2D7817
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453719; cv=none; b=gc1Ipl4PnXkML6P7zpPoION3vVcyaGsuPrF2y8qALcBDuyqnJ5ke9L7NATzM5EDJjOZ6eEiCnEnTTvnH+rDXLNdKp66Ep3e+NgpASccTRXBTORtCGm2gQiSY+goaGYeEcTA2TsUMGO2BF5sVqzjABX9W1FgNkA6gXQt7vdl+G7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453719; c=relaxed/simple;
	bh=ZWpS9a7UI+nRWCLynLkdE/5Fa7aQVE9imBBoeHlqO+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tj/hZo68GOm/Lxg6sAXoS1H+8QibKhiV0A4gzLQs6O4M9Wqf4v7A6pJN7xye1CvAHsNDNIT3PgJYq6ZnXZkUHaXdb+oggBlNYHdi3ITgL4f85Woi2tT+wHt2N7ZQxDaphWtD+Fq4k4T0THg9kUkypaiVpV69kh8TOxup32dAafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNl0OsuE; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNl0OsuE"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c859a374903so620760a12.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453718; x=1782058518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQi4xZ/RL1raijUtjAv0u6PGUwcFZ8P5P6g7tVewY3I=;
        b=tNl0OsuEurL2kOA2c8rEaFIGskQlYfo6yZwzBI4P34+RbTUGUQpIrtctsgINcRA4mp
         iLdi+6p2jtzLfN1NYd0ZIpPzjpcq6n6f4eR4JHOsXknpKfP4WxSAM1IeulNc9Nl0Y+j9
         0RWvNUpjsxTKUPY/QDHg3QEt6zBfG0sCfWbZpCjGXeRRU93GEK5kig/khJWG/z+hiEyW
         GSdDroshJg47ONRum9rRncbflJubMMMkdkekMM4wk8J5kGw1JpR/GD47P0tY+QX0gkiS
         HvckdHGiFnjVlcHf5Fz7Bn/GNfsVIIg0iZTP1w+xDe/CJ7enW9M4IoQRAI0qvQHo8c8p
         mqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453718; x=1782058518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQi4xZ/RL1raijUtjAv0u6PGUwcFZ8P5P6g7tVewY3I=;
        b=cf+LufjyiZhH58Yg6QTP0U+rgNyk2c5MU+zXQCvERljf2PU2TffclOOjT8/FmOUkN8
         SvC23WRAIjq7aOCMd8hYEM/BP5EZyjtHbjJyWM46ZRksm7JX5fYI+keDaw6gngeaVxgs
         IH2gV84lMFacHXfdEg8D9UzsXoGxdaYooT7UDq6UwCg2H2y7991i5ly39bg0ziZlN3DN
         2G0pzbTaTcIozYftF7P1q3KOd6y5mctB5KVbjhLMIdaDxENcIro1RXQbQ0jkHlfP8eWN
         xNzrxHxdBCItJ6lJ0X/WvjkMRbN4FjwSb2aM5X5I6p8M+Ni/pjl9jLjmkJre2UKsckj5
         RVvQ==
X-Gm-Message-State: AOJu0YwXNLQWCYGxv62qArNIBIbOS/MduqBwMaVTiFLgCAeM8pYtGYK/
	d0qui/pmBfxMyeG976OVe/dsLkrz2sxeM8YrCTDKYKMgi8PNQDfMlkNf
X-Gm-Gg: Acq92OF6gD51AXJUxbY3AmkyabTv/31jJPYy0Ae/fwDN/xpq2WnH0c0HUz65ItEDtLx
	lJ/N3nSJD4JIm2AKzM0/QFfP60pDFL9/gOLmPDRqsoCJ00uvgnhY2SIul/03NB5liIjFQlkUq73
	alGbIboHrc9ARNzHyccXaqu8cdCJHfaDi9M41gyoPd5j9vDCNgPABBvzl+H1GiepVwG5cO0h2KO
	bJtANp9xzan9mw6zy8c/6dbg7mhwFP3bg78Fgm4ny6uQRuZSgrDyVtGveDEF8mTRg/I8CypvQ3x
	ShBdyqbjHhEi93PVP5djkI9LkR6wE1mGHBU4fNPu9G/r9kCjYDCnN3iKwocJV7WalVq5G8m1dGW
	kwwiLWfihczQYNUKugGOTnJSnKnpI7/vF0CGHoQeZYyAquer5+I+PRICqKLzD95xgl5mclGw5mY
	KkhfV9pemja6k/CBZIEg==
X-Received: by 2002:a05:6a20:2443:b0:3b4:87c0:d7f with SMTP id adf61e73a8af0-3b783fc439cmr12622311637.32.1781453717759;
        Sun, 14 Jun 2026 09:15:17 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:17 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 0/3] of/fdt, LoongArch, MIPS: fix misleading reservation success message
Date: Mon, 15 Jun 2026 01:15:00 +0900
Message-ID: <20260614161503.2219681-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reading the elfcorehdr reservation paths I noticed that
fdt_reserve_elfcorehdr(), LoongArch's arch_reserve_vmcore() and MIPS's
mips_reserve_vmcore() ignore the return value of memblock_reserve() and
print a success message even when the reservation fails.

memblock_reserve() is unlikely to fail this early in boot. However,
printing success on a failed reservation is misleading. I think it is
worth fixing, but feel free to drop it if you disagree.

The three call sites are in different trees, so I split the change into
one patch per arch/subsystem. The patches are independent and can be
applied separately.

Sang-Heon Jeon (3):
  of/fdt: fix misleading elfcorehdr reservation success message
  LoongArch: fix misleading elfcorehdr reservation success message
  MIPS: fix misleading elfcorehdr reservation success message

 arch/loongarch/kernel/setup.c | 5 ++++-
 arch/mips/kernel/setup.c      | 7 +++++--
 drivers/of/fdt.c              | 5 ++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.43.0

