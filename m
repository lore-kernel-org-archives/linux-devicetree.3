Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958512F3C37
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027224; cv=none; b=bJmesBH4StN1IBkgQmKp/BInXJeXmWrB9KEb1iqj85HCqR2uFq8vz0QYvu+KXz5GHWTd0bJg5XPuPv/xxacma2FaES1mnskS54p9JSD+HkoDHRzRGeXkHQKtP19vzPIjBbIawwOTktT36kJT2a5ly/nO10HJ3xdEh6k1//oimng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027224; c=relaxed/simple;
	bh=o8Rj7B97yNJ2Oe/RYeivKyw6lYvJtZQ2PPPNuBi53pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y4/uFsBD3fy6MkVjIhFfy2wo/pNQW6AeEjPhJcJiDPjHSF+5x3MOPkKLQ5DEBTO1uD8okkUx4vBI4ikiLFpsDSqNJmR+626f+6MJJYJ9xhZdxqpP3qgI41Z7vFxJpkKA5NkgVriInbN+P5RuqPsm6KlWK8HqubconkMZQ3v1UsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KH3wnxpD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KH3wnxpD"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso1227401b3a.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027222; x=1779632022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yk8HOd3Eg0mugUUA+8CSg5qLF5dL573+VzafG0ZQv/8=;
        b=KH3wnxpDchmOk640OrXMpr2n2PQwbiwSdpMCXeFtAt+c+IFmXLEhLEmgOzTFQMA16l
         Tf7s7A/VAQwgMQtAWwy3N6m2GUClFLPN2UghQkyfg5GEbdTsCnEmnoUxipSW0zHjatpD
         y0/DX/eX0CiGUAjYNPV95MhANZToRCN1dmJkPBYv653QMjr2IsYbqaWAbxK3ym/KtZ8M
         xm2E6PsKEI4wL9b7aFBt2ZH9kSL/SIB66V12edtRz42AumwKue8iSh2H3ZvLVDSnL7zr
         3ysb4S8YjgO1QORbnfzMzIQ1kP+7seEyunlHmtCJVk2Ik9nRlOrKkH6MTlfxyZjvteDF
         w3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027222; x=1779632022;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yk8HOd3Eg0mugUUA+8CSg5qLF5dL573+VzafG0ZQv/8=;
        b=eIj46YBVVNFw/xJTeS2W7O/yi/n5CCakfGbegVIMAtPb/vVdFS8o4+EM+AWl2u9Lnn
         V2+ep4O851q76k32yC/5rfJDaWtULYgq+33cGY5I5vkbfpXXhhNwLkW6s2PXJ4GBoG/I
         kvusAlVAciKWZHwC137i3sMTvGniGn0PByPkiLmbnBsBzwCQVQi6R8w7CcglTKv/gveO
         qDjlXsw2AqhRbGEqC38prhHmCXYy9mmvs5VRK8BUxKOh0+Ump0e/F1JM2RoMVsnx8tWg
         xsGc15Q/L1uQzO6tV7UydSgUtegUuNPlFkZWudOmkn8olIDZILZC/KqBsvFeHb6Ronhr
         lvZw==
X-Forwarded-Encrypted: i=1; AFNElJ+q+8VsYRTGHHeTg6Pw4rj30m6CRNd43AmMxs0igLdG7OZJ9cFeqcA5MjSuGxZ7zCIkw73pCUW1UWKp@vger.kernel.org
X-Gm-Message-State: AOJu0YxNF2fTwiUU4o9Q5rCwpEIw3Zbe+RoVRmxN3c/ccBcNLSNs150l
	kEUmog+QS7ACLSlgCYft7LkD/CLM2vjbnhC3vNpoepELwMRgI2t/IXG3
X-Gm-Gg: Acq92OGqevcGaycNdr0LjnQ4fc7SAsbSKzM+Gb5r1MCnKgMo64dn3SZxx01fcC4G1GD
	pKHg7lRXHh1HcB+i05Y32pEvM5md2D5hP17uf4+ZjoSlZ9mFiDiPQ0gKA5CoCXSkJKofeKBTLyM
	CSwb0nyJZUgWHvf25x8UdC7AyPs4SKzmvqLtUiBeB0Ek+0GoMSMG1rUMTS5TUGsgkg/esaLRLml
	OViLivJ1hOrmMoxF6nJglUL2/ROWg670DJPXCu9Zo3V59FUQcNVATuAwUHvknrj7863IeMhs8lE
	pM31f3c/ccHQKudnuBWw3Wl45qSvBJPUUXhTUXDaSmXOb8/op2DQjegRTY7NamV4Ka99P+pV4LS
	d5Q2gL/0GUMgU4pb1gk6VuhL6C45othkp4hJ+zwbKprr8rfG/2b+ZbhN1FCsJFcBi/mmp53myWG
	TMLw1O6mfSEZ+I8BdRjQViFIjMUvzm
X-Received: by 2002:a05:6a00:4212:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-83f33d0356bmr11819618b3a.21.1779027221951;
        Sun, 17 May 2026 07:13:41 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.163.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa5489sm10252528b3a.60.2026.05.17.07.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:13:41 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/4] clk: add Siflower SF21 topcrm support
Date: Sun, 17 May 2026 22:12:54 +0800
Message-Id: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3eI0I0PdkvyC5KJcXUMLU7NkA9MkM0NjCyWgjoKi1LTMCrBp0bG
 1tQAa2/r4XQAAAA==
X-Change-ID: 20260515-sf21-topcrm-1856c05b6138
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Siflower SF21A6826 and SF21H8898 are RISC-V chips with quad-core
T-Head C908 for home routers and gateways.
This series adds the initial RISC-V Kconfig entry for Siflower SoCs and
support for the toplevel clock and reset module on Siflower SF21 socs.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Chuanhong Guo (4):
      riscv: add Siflower RISC-V SoC family Kconfig support
      dt-bindings: clock: add binding header for sf21-topcrm
      dt-bindings: clock: add doc for Siflower sf21-topcrm
      clk: add support for siflower sf21-topcrm

 .../bindings/clock/siflower,sf21-topcrm.yaml       |   69 ++
 arch/riscv/Kconfig.socs                            |    7 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/siflower/Kconfig                       |   22 +
 drivers/clk/siflower/Makefile                      |    1 +
 drivers/clk/siflower/clk-sf21-topcrm.c             | 1053 ++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf21-topcrm.h   |   63 ++
 8 files changed, 1217 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-sf21-topcrm-1856c05b6138

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>

