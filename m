Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425EA489881
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963955; cv=none; b=CVG4br6LjJTBhnCUCRUHr61ndPd3loQD0h/pL5wz6FRQ72FhMZHplLdmA0Zkz9WEgT6SvYSsgy3WLnJJHTARG6OAdYaWdVIRt4sOWjHFkGCjEaaz6Tkz/lg9s0UEqmB+VPLXgct8oUpsZfyguKc55ecJXy3z9k32NG2k8s7TETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963955; c=relaxed/simple;
	bh=FG/LJNXH1VUYYc/k/8W7Og7Fpv4MygAGBEKkCvtgcNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MggFpjoVpbCjeoKwjCiQ3sHL6ff6r1L0QTFbCXEsLB5lYAgmx67YsgLtLVxaJUb5UAa5eF7L/OCn6dfDEIN/7cK8ILpr3WlKxeSruJ47Tnrf4mjnrWrbsr9K9Wkm2yopRb9x3YiInuKvhbFWdEU2i/4Qwlpi1xvYFn+CBWBfG5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBGd50BJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBGd50BJ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e940d5d2beso990905ad.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963949; x=1792568749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCKIAVPSYo0vK8WrzKbxMMpR/7Fs8ssXef3I4R/nZQA=;
        b=oBGd50BJWqnpw1RWZLe2K/yPcnVFT1GAS8WukkO+VbH5oj6oqtLg0al0l1BqtuVM6O
         YWxtUL8OmCEMtwfhNFpSkG5I3qRc6tmuScb5YdCAtwGbjP1Jvp2fGMSMCO1WyEKQ0Hva
         k97qnbJUMvmlIXlx4zleGdFg5Jg84tXb78tkhdnkYpP1hHNiGevzU4+yBnw3juQlNUBP
         pT7atz0NOR2Ib62U+bUu91rR39mixyjDb1/Te7d0mqFn4qd3bozW9nYNt+VSb4NwLpUZ
         eeUeHJS8GlS5bx7vOepbRv88kVbS+D9Bc8gFcBZ6TETIxJ/6/PIecJRkDPLI932eq7Oa
         m9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963949; x=1792568749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCKIAVPSYo0vK8WrzKbxMMpR/7Fs8ssXef3I4R/nZQA=;
        b=qRQCR/aP3zuNxtHaxYg0Fjx+8KjdUA2/2blxZrWMf42+oaQswj9g319Dd46NrA8j6u
         WK6Cg4iuuegGIoYFBAST0SSDjQ8YhDfZpthfBfRVt0sY5Ek+XR9b+oK6FzXWC19E0+tj
         WzfejNyK8n7FDT+ep9ZHsbUN223nFsm5z3oKy/r5dhY+DqwkFLogiyiYT3Rm3fXy7pwi
         STUXRH9kz41tZT4RbrKfX08r6lnUBSZRY5QmdSlTnnt5vRlBfcPdAkSScP46ctztCXY3
         oAdl/xCfQoPZCmKRiOt8MjhSyptLDdGLpZIEpvhDtrDYnTb3r95zAQ6xGOr14/FJKtc0
         uq0Q==
X-Gm-Message-State: AFq9FYKqUhTViaWwPXOaWBYwgm+7cZuVAiqZh/VhKIc909a/KXgZ8op4
	TDIivrUEDMCbD450L3mqx1N+R4K0qdje/AbRnxHYmjhdGGWlFzZXcyw1
X-Gm-Gg: AYBFou31ERx4O/V9ed/RMJz0H8QdiB/mPPtkPaD22gXriOda08iC1rhF1v85Aq1F4T6
	yfSiv+alwEjiKHUScxw97zrxOs5lyPWS+hWDEkCwDpszXHgNLNkamgccU40AnMaDmGA/eFSrzlD
	NCGZbw+NMlLHdLakrujz1KpOikkLi3MED+wuztmluYLg3aTNrk2WPgz8+CUpEhG4lb+zm6biKzB
	w+JXoO1I/Eci8B0Q9Gouq/rre8URKsYA+Xth5R0Yv1z5A7QhbIyZkHkmeCFsU1+GXDVpVwguBTs
	uuimcC+flBC+Cw4sQPa+uG1DJfqbOvqsyTWx3AePM+0xZpqwXhbC+2BQVq4gsns2wMm76Q3GOJS
	K6neGfECTGOmAxJmVdU7alFjtZvkPemHFUZCYModTpOc6dHqLMouTjSiCLy2txE24nksGlrR8UY
	Cn/2vk0cmH57/Y8Whq61/Gwp5W6Y1YTkEylJ80FrOEfwAbxbv/fXCeJoJabmiwakGbaC9M
X-Received: by 2002:a17:902:e74d:b0:2e2:cb65:a719 with SMTP id d9443c01a7336-2e842ab6a10mr114098215ad.15.1791963949146;
        Wed, 14 Oct 2026 00:45:49 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1347sm67038615ad.44.2026.10.14.00.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:45:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] Add SG2044 eFUSE driver
Date: Wed, 14 Oct 2026 15:45:12 +0800
Message-ID: <20261014074516.240247-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SG2044 eFUSE driver, The eFUSE contains factory-programmed data,
and it will be auto loaded into shadow registers while startup. So
only MMIO read is needed.

Inochi Amaoto (3):
  dt-bindings: nvmem: Add SG2044 eFuse controller
  nvmem: Add Sophgo SG2044 eFuse driver
  riscv: dts: sophgo: sg2044: Add eFUSE device

 .../bindings/nvmem/sophgo,efuse.yaml          |  61 ++++++
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   4 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |  12 ++
 drivers/nvmem/Kconfig                         |  12 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/sophgo-efuse.c                  | 177 ++++++++++++++++++
 6 files changed, 268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
 create mode 100644 drivers/nvmem/sophgo-efuse.c

--
2.56.0

