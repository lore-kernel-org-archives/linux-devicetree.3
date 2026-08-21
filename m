Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E870C39A815
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320643; cv=none; b=sDxN9nKtxCr2JQFwUzAMUr9Ja48tLf9qiOPEUGjltWF4zPRcQ3197b7VrAVv6BmDEDJzU+goIfst9A3Bs58ugMkoAHSoJN64kOLlqblzkh4XUpNObK+e7d9iVFBSmGPuD2xosfNaBvelJE4FzlZadVV40WaUqNnLU6ZZ8ciEMIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320643; c=relaxed/simple;
	bh=uGPIzdxc4KXBsjdGJiahS3bTCttkeJU0jZQMXBJYgIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiRtEPV7P5e2jL3xN7JNs51Ozagi8Lu3ZnSNJc36g7YQqMXXFKXpHsqtmzlmL5zoU+yCBpBaaRVvtU6MlfWfeiNhr98cyWEMFUhOikpS+C+HkZ6ZXtYlNmeuYW8DxGYoJyGEW79KVhgbYctTqfDidoUHhWUc84N/XSoEa2/mZjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV9bhoit; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV9bhoit"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso11302035ad.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320641; x=1787925441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsGnVgZXLIDkEiMG9qEO5rplY3MpoMwwrWWVu2HHkug=;
        b=MV9bhoitF3aUd4fbGnqC/4IX6MoVOL1j0lbyv6jJcAEgmMMzZzOTO4RcMjqAYd1rTY
         qts5lgm9IOGvg6JEiaELZpneB98ZPtuL00e1+98tCuRBOFx4f0X4eI1ihba6rE7s03nf
         0HX/i1Br4CPlv1dL8B2NqE3/elgW8ZoGtC5r98++oezQaub3OUzKjSBxuky0z2b/fU6Q
         ITIblVI7InG2BGDGZz8QYviUaGDDOD5oAgMMe6N7rg5kcARuPwp3yeEWgG4i5e++zUrr
         hKBU7AZdXPkYUfGxT7YUvVkXWWtr4He9MGBoiMfrj9WsDd0YEjsX58rudVTm12Gz5EY4
         A7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320641; x=1787925441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsGnVgZXLIDkEiMG9qEO5rplY3MpoMwwrWWVu2HHkug=;
        b=fLr+5EcFXpzExBEbxzdXCHRVQK4AGzSP+beheEYYKz5867boEhB+1XbhRXw0V5l+g0
         uqfPzlepeccxB9xWz4FNzC8PDawiKZ+RN7VLZBgu96P4Y0LkyvLYcl4hOctL20me/3K6
         sE8NvlWooORaK/H2TPuzIVlQgpfHtXHENJpbySK3F4KN0Lw/uGA8IeE0dPSKL5I7eFfz
         dmmvuxCun3AT204ucz6NVaTV8ZdSFHrOGysmU9+FMuSAScBtixjywu1qDG2yydBIMfdY
         HGYToaY8z0ovV3bLUIS0XJLchbOsMM8b/Xcs8eaOyteKGwBpwrYmayfxv9p4unYFDdZl
         8hdw==
X-Forwarded-Encrypted: i=1; AHgh+RoWRtBR5PLP4pQm5v6ro55sx5VkwhVhn3uAvLezxO149vNT1NU7LjHJpMoucj948eW8ILiVpIcOcWjY@vger.kernel.org
X-Gm-Message-State: AFuF++m1Hr0cUr8KF8F86GxlXY3six8en3fySuQU6ePnU4muRud7GgQy
	BaMhwl4e74yTQKuR99SXXDXC4MtrjNBNXVq+qfmUgXys1kzDI+k5IlfC
X-Gm-Gg: AR+sD121GEc6JMts8VFAy4Rn/pBxGOO7BSCWaGYG+5hDUU/H4oy1rBUOfue3fNrxsrg
	MCRcTPFjURisbr4lFPpB3xU7pucwxVJ0rEo4MkQlMBOJxk0Xj+Cc6zRoA2STJmM11yYGKE0jg7m
	sxcYU/lP8iqfnJsiXdw0NOJDeFaIV7rpIbGkJMTxcCsZM4nlZIyxEYJGEJBrCJZCE/Hv7Y+dTIl
	1/Ms1JayVIK4ursDQcCtqVW16mHJGOHjMx7y6CqOP3+hCR3IjAEi7B+0xAOg6MdZtPoEFqBr0PY
	UCcw4v2DQPmQKXFDRKHTI5PLlUFQ2ZEFzLvqoTqDb+QL9jEHe7AnrpCq1oT6qKr8sCzoeoco8km
	HmZ6CFO0iQBHBjaIGPqf69iJw03hTYAHU3CXB27zlLABCmYF4dPvbQ/IBNA1tX+GCxSGMjDzkfr
	+7K8cpXQiL3rb4X/3wekpiUSjJdk+uIUisgBSUZzxdFKvAoQt2RVL3sKPs8aHVSL2gHnUf73vbV
	12uny4UaGluvQ6gID8UNK1RzuKOOuKZnQJTnKXIpKx4jJpRrt4e9ITFkkZgACjlj3dXVy6pux8Q
	EUi9dBs1Fg==
X-Received: by 2002:a17:902:e785:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d64b0e2c7fmr140267145ad.14.1787320641223;
        Fri, 21 Aug 2026 06:57:21 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 08/17] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Fri, 21 Aug 2026 14:55:59 +0100
Message-ID: <20260821135608.275233-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the ARCH_RZN1 dependency with ARCH_RENESAS for the RTC_DRV_RZN1
config option to make the driver available across both ARM32 and ARM64
Renesas architectures.

The newer RZ/T2H and RZ/N2H ARM64 SoCs integrate a closely related variant
of the RTC IP block found on the RZ/N1 SoCs. Update the build dependency
and expand the Kconfig help text to allow this driver to be selected for
these additional platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- Added Reviewed-by tag from Wolfram.

v2->v3:
- No changes.

v1->v2:
- Updated help text to keep it generic and not specific to RZ/N1 SoCs.
---
 drivers/rtc/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 01def8231873..d23a0fbe8d89 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1635,10 +1635,11 @@ config RTC_DRV_RS5C313
 
 config RTC_DRV_RZN1
 	tristate "Renesas RZ/N1 RTC"
-	depends on ARCH_RZN1 || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
-	  If you say yes here you get support for the Renesas RZ/N1 RTC.
+	  If you say yes here you get support for the RTC initially found on
+	  Renesas RZ/N1 SoCs.
 
 config RTC_DRV_GENERIC
 	tristate "Generic RTC support"
-- 
2.43.0

