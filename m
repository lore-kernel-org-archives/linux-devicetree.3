Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4166714A619
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781343588; cv=none; b=Qd21F/28e9Yqwm4SzozagdqU89PhNxTPPT4DMAAwtQ6b1jsOijo0LDgduB2M9TgbsnWUMHPBlnjihTOc+suEOAB3dQ3Y37hoDUnN2pQsDwEomKLetwOvNhG+NT/Y6AjcRUnyG2cOfW66bANbG7697dXVifU+lm5fwie/CVZI57Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781343588; c=relaxed/simple;
	bh=0S6TK3LPErCSFayvbXziaRw3zak6S+hHC3Py82gYe5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y9BbomREaIn5pI6DTxomOx3KdBQCUtqtPBV95bnEZsLNf/Ckoecpurbq/d639dyiz1GN2sBMelYu4V5dD4Fi/c07Fu19ZIrHsrnqInackuNbVu4b09qi+IJyUBMS7QgkuhjiMEWKonfhjmEnTx1wSQiPJhDSqNYXcZ/U5vCGITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrVZpZmo; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrVZpZmo"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c86214eead7so789882a12.0
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 02:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343587; x=1781948387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8ETabvgyXaefxG7MMag31gPiFKWJAnshBNUt1PyL3o=;
        b=LrVZpZmoWjD31ixI2eUdC+jqUiDzxzaWu9vywdpfEdASU3i+sqYP7WfIEID0TvVPvA
         +YBUBe1wudYGqhtauyx9v5S/oh1dE5M6xVc/zzvWhTcQUnjatb7UNUNg0UtUWIX+82UD
         X7Vu5PgztI922u1/P38BHOKOdRr0BreUstMCES2fg0Ikk0cL8WHZX0wUQzijsn2lRoqg
         tW1NcAhhE9aSjdktyv3wOg7bD5lKeeXAhaH03RkTAqx7eSwW3jRINRnU2xACXYuSaRRo
         TOph6JqTl24C24yMgbKf5C3lJMw5cItrABlMftY86L+4IY3PIR9EDRrLcQJrf+4HucGg
         Potg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343587; x=1781948387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8ETabvgyXaefxG7MMag31gPiFKWJAnshBNUt1PyL3o=;
        b=QYQu3o10Y9TjFiuXjqwV6Oxd3G7NQmf6pDU5pT5GQVyrlVC1iTXhuwsGooka3NC50Q
         H+ZpSe/HPtQiJot/+ntoprRG2X8O77is1cvUIl9+R9ru4C7eGs/kG8Nb2IFcdDh1NySm
         SAPobdHUiQQQ0bXUdbxbD3f1QjYkJbqaGpTi0EOkyK0fwmGN/Ii5OTXxgAXgQ1b5hznJ
         MXHbCOwNlVB8jy75j3zHXaX+BwFCQklTlqGyNrNGSndyoem+kioOCndMZj5I5pTZpAG3
         QBmNTVnQHZzghhAu1p6dO4g0uwuH7hhWM0Xw/bBd8Ft1ZNeaeRbrlQtn8w3P6AEeaxAd
         B/1g==
X-Forwarded-Encrypted: i=1; AFNElJ//AX7wtcENjHz3txhgM3aFLIZM5vioUcCUjgBgGvkKSHCUOv2cKPa57S0clWl/r7+wc6gEY2Ym/PpI@vger.kernel.org
X-Gm-Message-State: AOJu0YxiHRMboro15ese1IP+ectP3TMbUAtdurNqXNIayqi+iEZAcq9Y
	oRL2NkyL4oyg6DFn5/789Eqt2K2dk5nS060Yh0zgjYZuTbBeW+7hn4wC
X-Gm-Gg: Acq92OFsA4EkLbyl5LcsKUDeQqjHnuryklef2BFz8vn3+Jt0O3DuaJNSuGaIH53Iuxb
	Mi+pHXAXwHAUnw3Dmc91KqfIwLl/57RLcL4r8EwKDhHqDF8aFRkFvGvkQ5P2j/B429NYLQLVFWi
	gcwrPYbYA0rd5yZVQUvSMHEaOOfgQj3b7UxOW1m52kvJQTS6GA8eYVozHQ+lyQO8SOPCxAlp3Y4
	gwiZdt/XV+ph8XikUNjfxbKRT21R8RUl9QZe1soxPBdLzajd5cuHMEdi3+6yRtRVJKsvNYwdNqF
	Fbvu2oQza1gkl6xPGBo7U1xo0RYHZdd0qzX/KxjWyi/ozmdhLCuZ61t3E3ppoJiEBDJF5sO9dPj
	oQLSF7HMN+Z8mJzYgIV8/lbKt/ehNiCKqXPlLVR6L/ZuvrPIqFUwuOfTGileELPg8Z05bLwHBZO
	2rZ7DIJxrJFDtb6bHlBdGEhDjIm6amkgK8kgsrbSF98tML
X-Received: by 2002:a05:6300:6690:b0:3b4:640e:f6c7 with SMTP id adf61e73a8af0-3b7857debcdmr5756051637.14.1781343586541;
        Sat, 13 Jun 2026 02:39:46 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.61.84])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm4155826a12.0.2026.06.13.02.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:39:45 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v4 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
Date: Sat, 13 Jun 2026 09:39:38 +0000
Message-Id: <20260613-st-mmc-v4-0-b3c385617c16@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFolLWoC/13N0Q6CIBTG8VdxXHcaHMSgq96jdeHwqGyhDZyrO
 d89tGWuy++M35+JRQqOIjtnEws0uuj6Lo38kDHbll1D4Kq0GXIsuMQTxAG8t2ANL8rKqLrWkqX
 Hj0C1e66h6y3t1sWhD6+1O4rl+knk3HwTowABuVW5RGGlkurS+NLdj7b3bEmM+GOKy40hcBCip
 MSKCi39M7lnemMyMZ0+QkMVatJ7Ns/zG5md3FcKAQAA
X-Change-ID: 20260327-st-mmc-c906ad95ff83
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

This patch series converts the legacy text-based Device Tree binding for
STMicroelectronics SDHCI-ST MMC/SD controller to DT schema (YAML) format.

Note:
The patch "dt-bindings: mmc: st,sdhci: convert to DT schema"
depends on the patch "arm: dts: st: align node patterns with established
convention". If the DT schema patch is applied before the DTS
cleanup patch, `dtbs_check` will fail due to the presence of the removed
properties in the existing DTS.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v4:
- st,sdhci: Add minItems: 1 to clock-names and reg-names to allow single-entry
  configurations, fixing dtbs_check failures on nodes that omit the
  optional 'icn' clock or 'top-mmc-delay' register region.
- st,sdhci: Modify the commit message to explain the changes.
- Link to v3: https://patch.msgid.link/20260508-st-mmc-v3-0-81c329ed28e8@gmail.com

Changes in v3:
- st,sdhci: Edit description of reg property. Modify reg-names. Add
  "minItems" for clocks and clock-names properties.
- Modify the commit message to match with the updated changes.
- Link to v2: https://patch.msgid.link/20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com

Changes in v2:
- Fix node name in DTS for the MMC to match with the estableshed convention.
- st,sdhci: drop unnecessary properties, modify "reg", "reg-names" and
  "clock-names" properties, include an allOf with $ref to mmc-controller.
- Link to v1: https://patch.msgid.link/20260409-st-mmc-v1-1-4c54321c3535@gmail.com

---
Charan Pedumuru (2):
      arm: dts: st: align node patterns with established convention
      dt-bindings: mmc: st,sdhci: Convert to DT schema

 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          |  92 +++++++++++++++++
 arch/arm/boot/dts/st/stih407-family.dtsi           |   4 +-
 3 files changed, 94 insertions(+), 112 deletions(-)
---
base-commit: cf2cd8efd046c561191b8541d32a8bfe845bf06b
change-id: 20260327-st-mmc-c906ad95ff83

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>

