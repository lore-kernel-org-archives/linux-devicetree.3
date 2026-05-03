Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A80381AFE
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777797338; cv=none; b=Zh6lpKror1beOsWvFUaJShNZrxjgIsw2pQQJ8diMICeijM4gMd1ZnUfGAMmgyES0ibPZHoQoR5yXCh7/HAVmkx1vkk2or3peGpHlyDQoaelpl2mLzqEeyev7j0CRKZWRnqidCIvvSPA5wVjcjlVWY45bdopqebLsryb8uQTnVxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777797338; c=relaxed/simple;
	bh=rfeXZdm07QpfRxa1YAJWSQ8/hfqZ6m8JWTZdMmcfNHc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hHcD/6hftwc7PRk+zh2Ta2I/D3f3AybL//9jMqtsGAgQ0hc5MNJAf1FT+08oyY8iCcM4f8ofcP5iQbl0p46FGCl+Gi7Eikyz/tFbtWImCcrFLV6i6VllJE98j+PR2pa2q2mh3jKHmPYubnOPxXLxNqUfxgSIJOAug89r3iukXG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BG2giRhO; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BG2giRhO"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-835b78c3797so63106b3a.2
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 01:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777797336; x=1778402136; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6FZTn1uDz0N1c7PIwvbk3rD0JkNh6yzne9kAdOtgfI=;
        b=BG2giRhOI3d4fnebS+sP7Jo8TbzTvdlrECrfQMacmrJL1VtR2E1tZ4KAzVxSsTzp48
         n9HvHooY+3cir2hlxWZm3in2kps56FwvjDqc7kjsXdjeK9hTnudSKx9p0QFYfbu+MzuS
         aY1TDZhD5LA/G3+RTMZUVzxuN9MjsGCTv4nP+18h7iOL+5Hgq0Vuub6K/wDWsnruKmpa
         oPcQA3EylIDEg+UqsUebtuFChAD+DEoR7JgyOPHZr/exS4cGllgqWpoaWbhTgpr0DVMy
         pFYC/QIYk7qqAjvJjXo889DEbrkXs8i/J8mMWt4TnA7W5s3DUdXW9oVzvD6kHCuoMkgH
         pxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777797336; x=1778402136;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6FZTn1uDz0N1c7PIwvbk3rD0JkNh6yzne9kAdOtgfI=;
        b=L6sSN72ZZkQSo943VMtdHEHVHSI8fHS7yjlZn5mY61/kSTzyfSDLtu9ZxpIrRFJ5mT
         KZLLwUaq4jHxT1yOmQ+w1A9mXtxLe3MFRyjWqjcuwmCTdjjglg9lqg3FYm8PCVK+ueAM
         MQJH+U3xlg7TWzC3QG9EkXVpDMK5Fgey2SnBw/KfVm6t+R6F4+33KGWNHvl+v87KbZvw
         Z1vWxGXBL2vVqCGTR03x8Sfz+pbald0CjQXM70NKol+nOPv0Se58K2zkFFG0G6uXSDA6
         GfohRrJxA67XR5v3+hw+VW2cSbvQpSu4FiivNqdxN22wDLeTCArcRYZFehxjN7KRCY0A
         9Jgw==
X-Forwarded-Encrypted: i=1; AFNElJ8c1AEZ8WhUJxVDaJpSsEgM0kRieE/FVgobwcwC9pw1Z5XL/jEZez3kG4jdDHlpfQriykowpGu1nrgj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr3W0unjMAvVhEwnly2jxJpfFuFh16LpkJuaWGmk79zv5Yvpd2
	v1KS5RFiqmc7kpSJIBRDTh2Lb1so/UB75VhggtfUxcB/Z6C76MZ4k2lMkDWR7g==
X-Gm-Gg: AeBDietuhzlTgMKVf+2sAg7E+Wz0UdFZOFyaac9XqhTpJeu2WCG7/qcY4dmAT7Ze5yR
	j7lS3zttjGda7w4StcO8I0X5w4sXTJjizdRlCQj/wzsB0IQLYdOrV1UfLDE+d7ZPh4EisberKUF
	OfmjySIZ5+xv3/AonsjqEOqDFDeTczQG4lZ+7cz2yDqVQ3NFnHCGejIQPNVUdzqQr6firLadU/D
	2UBsJVjsHNm3BRRNBohrcfQSGAXrn+y7wcce5XBSkPx0m/XLt2a09IKw6UwUGEKK6vh/iahp0kX
	2UPLK1NtHNThQ8yi4etTR+0KsZ0C0K2SpRi7qZvc2NqTwXkywlPXAGilaXSIldHGgd7Lqp8Vjw1
	Qfs/2eI38hzoAdJZVJPqpSLBsgOfUb7YiyRml6Ms9LTAzYNOuGNE05VWHUIl1C9e7vRoN1pJBtj
	4cOCb95c/SyZRR955EgQW+1mfSvsNhEdrFYc7ktsOWw5Cech0MjGQM/hs=
X-Received: by 2002:a05:6a00:a88e:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8352d164430mr5171642b3a.16.1777797336292;
        Sun, 03 May 2026 01:35:36 -0700 (PDT)
Received: from Black-Pearl.localdomain ([60.243.224.75])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-835446b1b0asm1578142b3a.8.2026.05.03.01.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 01:35:35 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
Date: Sun, 03 May 2026 08:35:28 +0000
Message-Id: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANAI92kC/zXMSw7CIBSF4a00dyyGZxVH7sN0QCi0N5HSQEM0D
 XsXaxz+JyffDtkldBlu3Q7JFcwYlxb81IGdzTI5gmNr4JT3VPALyRsJwRKraW9Grby/CmjnNTm
 PrwN6DK1nzFtM78Mt7Lv+CEn1nyiMMCKtkoIzK5RQ9ykYfJ5tDDDUWj93hWQOnAAAAA==
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
Changes in v2:
- Fix node name in DTS for the MMC to match with the estableshed convention.
- st,sdhci: drop unnecessary properties, modify "reg", "reg-names" and
  "clock-names" properties, include an allOf with $ref to mmc-controller.
- Link to v1: https://patch.msgid.link/20260409-st-mmc-v1-1-4c54321c3535@gmail.com

---
Charan Pedumuru (2):
      arm: dts: st: align node patterns with established convention
      dt-bindings: mmc: st,sdhci: convert to DT schema

 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          |  93 +++++++++++++++++
 arch/arm/boot/dts/st/stih407-family.dtsi           |   4 +-
 3 files changed, 95 insertions(+), 112 deletions(-)
---
base-commit: cf2cd8efd046c561191b8541d32a8bfe845bf06b
change-id: 20260327-st-mmc-c906ad95ff83

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>

