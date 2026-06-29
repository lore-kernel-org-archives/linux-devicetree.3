Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01CD3E558F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750409; cv=none; b=c3+mFwYKCjEEsWZy6DHxPWCKwegvG9OTFyGs0znrN+I7e5r/U0rYME5OJUTc+KZHaFINDLhbGvGsQt92HpbGxbA7iDlzx7KmFvJf1IB150MIpGn1uwN2rTouHU1qirq4kmNHta75Bi5NT2DWS+Lcs/djq2g4Xi5Jj2CL3M6HrSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750409; c=relaxed/simple;
	bh=TwOw7s9yQz7T3DWMV1OdmenyC/HWg7DBnb7vblAMzE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HvUnmssoUvA/tpI2AaBH2iKQP2C786Rmz1Fwz1FHEcMYGPR3gSzpNKMsqxPhXjHlJILkwXlSq8YVZysu35XzIalek4h5T6OtST543rV95YTHBhfsdemxfyArF0/YADV9RP4Wp0jzy83gH7DeW6WAKAI+qevkN2zYLIF9KTU1Ma0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkEFDIR5; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkEFDIR5"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-139aff562e1so5132201c88.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782750407; x=1783355207; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eA3yl5qbMrv9Pl7Gju28idPgTrKUB+D3bsjesOdUayo=;
        b=FkEFDIR5uVQuW+7X+DeDo3Ws++NTvbkiojuFkhfrKlfo0XnNOfo252lsHPiGKWLTm6
         ysUqagDR0fAlxnoE6lXBu3a6rb1v/u39Qy8P6gOp+PlHRJxluBhyFrePhBxnWX82qpZ9
         q4J65YKk+Rv1KDftzBOwLJZJohyDeg5tlnfaR5y04WOyEsw1mDC7zdUeNYkNisA1bVbn
         MSLedeKLaHS16/WMvRWQmEzKT65xn+jys4wD3/OCMDLXhsY6pzc//gCldRvMMKSY9oq1
         +1VmWgKRmv859UQYS8r6YREjS5NBoVRdkTmVV+tCWgp1EN+TFN8goqxPxZZO2XfUD/SY
         dH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782750407; x=1783355207;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA3yl5qbMrv9Pl7Gju28idPgTrKUB+D3bsjesOdUayo=;
        b=NscMJMAx5MsiWdqrW/rwp1ZKaKijOzu+VQdMVYUkSBmPk2nQBIPgoFq0qvM7215xDE
         7zM85BVhHDyaEM3EFds4bh/vEJA5HPSXRi/GpgF/m6rKtdGwW7hfhNnkYi7dkJVoPFcf
         qGFJF1FDLPbKzsKUUF9yaBpTIQrMjllwgQi7D2145XoM/yZ+/y4nqczgGzhbKOR20wuf
         nD+5Br4lBItpiVRWx3FpyC+ktFMS6m1DnZFsj0xgjuvStBXQT+K3fWHmCTMML8gD8JKl
         9pwq8WfDOD4ypucfuYLJ2QR6w1vSIKUQEdEsMKM1Uj3bR0RhwjM4fgg8rtGS3xWbmHJF
         sSkA==
X-Forwarded-Encrypted: i=1; AFNElJ+n9zfa4jZ/qWbQZLcOr4rW7J77FlHpKbOTa6hXp7wTMZii4OrufynudMMb7c/QCongzRZlU+4bBNaO@vger.kernel.org
X-Gm-Message-State: AOJu0YyYu0I1gHtBJ77XVOSkuEAGnpz+sQPqIA9tc2/XKtLEU0Ib5Rhh
	C/iuzj2B4d8oWuNkXFXECtxmmwCeGlubJqyw4gOoSiR6slUepCqQ+zv/
X-Gm-Gg: AfdE7clC7ID6WafUZgPS2oYoe5RBIi9jC2j6iAom1CxQxNmziZtuXgz55X/qBfzlF0m
	IUWlfaSp+ziEYl7RHUL/MUBpi6gBd3w0XOiVsZwiteKpElSnt/opRpYVokSJNQqk3tA70BdFYWx
	DIaMsAFxQadzfTIfSqGIYE3nHQH+l/udY8vDpg4Gfvrk93XWXTWFZ0CsDvmvWP0QVJUSLDgdBz9
	fS17r2XLoqr1i2UUv37lIfeh+o3rD5o1hAywe9Wr3rtP5L/EEcB7nwfKBGW25HkHMKnE7b4pd7f
	mXxh+YMq8bCeYfUdUNtlLfJQlvB5iLHW5Yc6+S563KSbBOgKNGj+iEhHlulvkCrp0JDsnA6zhwr
	NHLtHygwho4Xwkug+4NzmUjl+0Fb0hoYs2t7FrEbE10njMFN5icsRRi99WLOsq7R1W7s8QLRVOr
	MvNvxRqfUslbtupF2FQ19HLme72KgpTb3i/Mw=
X-Received: by 2002:a05:7022:3d10:b0:13a:21:e78a with SMTP id a92af1059eb24-13b2a16109bmr81343c88.16.1782750406983;
        Mon, 29 Jun 2026 09:26:46 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.62.174])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-139d912197bsm80851896c88.15.2026.06.29.09.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:26:46 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v5 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
Date: Mon, 29 Jun 2026 16:26:38 +0000
Message-Id: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL6cQmoC/13NQQrCMBCF4atI1kYyM0lMXXkPcVGnUw1YK40UR
 Xp304pWXL6Q75+nStJFSWqzeKpO+phie8nDLReKT+XlKDpWeSs06A3hWqebbhrWXBhfVoWr60A
 qf752Usf7FNrt8z7FdGu7x9TtYXx9J6wpPokeNGjLzhICkyO3PTZlPK+4bdSY6HFmztCXoTYao
 JTMfIUs/4x+WfgyyizkQ1hIhUHCP7Mz8zBfs5kdiCk4D2sG/8uGYXgBRfkHR0EBAAA=
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
Changes in v5:
- Rename the sdhci@9060000 and sdhci@9080000 device tree nodes to mmc@9060000
  and mmc@9080000, respectively.
- Introduce the max-frequency property and add conditional logic to include
  reg-names when the reg property contains two entries.
- Modify the commit message to explain the changes done for both YAML and DTS files.
- Link to v4: https://patch.msgid.link/20260613-st-mmc-v4-0-b3c385617c16@gmail.com

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
      arm: dts: st: align MMC node names with established convention
      dt-bindings: mmc: st,sdhci: Convert to DT schema

 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          | 105 ++++++++++++++++++++
 arch/arm/boot/dts/st/stih407-family.dtsi           |   4 +-
 arch/arm/boot/dts/st/stih410-b2260.dts             |   4 +-
 arch/arm/boot/dts/st/stih418-b2199.dts             |   4 +-
 arch/arm/boot/dts/st/stih418.dtsi                  |   2 +-
 6 files changed, 112 insertions(+), 117 deletions(-)
---
base-commit: cf2cd8efd046c561191b8541d32a8bfe845bf06b
change-id: 20260327-st-mmc-c906ad95ff83

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>

