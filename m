Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505899;
	b=fxJ5QnVZDp8QsNKqNCuOXeg1nZry1Qou2UxdflhTWZs3jUpDqgMSRbLNBmHJ8Ev99BPZ
	 wE2orz4NU/qowI4M+IJsoUVljY1M832Xo/C1e2elg3Xgb+B8LnNpaWZWlbxNGoZUKvkG+
	 CEUHgKBg3NCDr9uiIqYmUPaamOZRg3BikCx5uc/4kQTBL+HQH1azZrDb0s5PNscTn0j5m
	 iq07DTVBaytv1zfR/5DqDkPA5k1om5qL9fulUvXDFM3FtdBCJq74+R9vaIta3eV0LJHZG
	 Xxa8dbg/xt/HcBlYhCGFa6xAwYGNynfMq5VGYsOppr78BbGfeSatc9GhD0JXVn9RvIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xTM3U6ionLwQwBCZKrKDTUJU3GHvWNey1cmCtm96z1Q=;
	b=WGtsZw3DnJb3994jmnkwxg2wi+FploqVflvA2Eq26itkBLs/Pou2BzZkuyjZgbDAR+vb
	 LQtOAKCB1Y2MXgSKMLRYYFPDT+bbLV0CGfL8U926atXAS5cuep/FjubMsU2PXA129+wjC
	 sKKTCAtEX689CUQBYs2q2QA9fWWpKwFcWSaGyaWhcibGlO01alFZ1yblgXf236JD3uuC8
	 u4LkWsAcTS+1yYqttQP/XsqIRXsxcoOuEWoNmwetaOxwOBKkzpQBdK3BeQZ6ZRJ0W8avu
	 oixUsBtif65/q/dL4RfNV0poXN38dweepcVWL9xJGjV5edtYlW0XT2MQeI57EN0qTcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYGQnnHL;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E33606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E33606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYGQnnHL
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3719e3cb82bso16521eec.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505898; x=1795110698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xTM3U6ionLwQwBCZKrKDTUJU3GHvWNey1cmCtm96z1Q=;
        b=yYGQnnHLNjRjFwShlE2IOVRkXRmHyVnARUO+zC0acUnBWnv3O4iH2uz3OaXdDxBMxx
         Vfu3DADmmwaG0+a2PYRTZiA0cb6Hya5GgZ7PVno5tcog8X5KH8BZypFtYZGQUl0hMmsS
         L/MbTg5TgzSVEoj2S4hRL5SrGjcpiaBCPOP/G3w5P8ivQw7Dn896G0MSUEa8g8BXsqim
         kA5sCS7E0CixFpkXsIhQXmI8meqn6CCeMWD6QDVoZOsOqZuvlqkx6MWf+1NxWQw9Zs8T
         N/4CwmxiPvVIl5uDs7GHz1qZRlAxUq87ua0jOl7bHEmrg3EEwLiW610R5Rtqic17oR74
         YKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505898; x=1795110698;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xTM3U6ionLwQwBCZKrKDTUJU3GHvWNey1cmCtm96z1Q=;
        b=rdA1w84HDF+z3knfSPhFrLv1hVEkTlESx/nFKRq+CIYWTmKRI7BoLA4+Vm8gu0fL4j
         HMFMU3ykscTzJe+GPehLQjNiw30ILhfnNV1A5+fdLcAi50WRyAsZHcEygHAvmNhVO9t/
         q3RfvCqUE1d7pxjJD7W62HpUAdNvEykKjUsDumvstWpDGuGPRHYSyt14t+UMx+2HHTPt
         sZOsSObM8nwUF36+mjLEiJ3LiWmMUIVeNRzCRWLPKvgIMdWVssmq+IAFVob3qW2bEQ20
         Dy0pInx3dYJCOfY7DuGwanLO/dDQmDLORjDQfSrJgIYWNlMYbzeaF5j7b/rRpdyvs9TB
         UHhw==
X-Gm-Message-State: APuU4Z+xZh1fAci88djibIRebRKJK8W80VRW8VXLcPjFmOydh3drnlwV
	7uccimQQuDETQhgo9h4BkXmoJg/plELM/dffIbAIbg7FRjL2t1Rp/kbi
X-Gm-Gg: AYBFou3USBBMHdsZJ4kVjoD/nqsHDqR7etZUaaJPs3YNJXzql4A0MduXMHV9SG37scT
	xywmvdeBveJmqIgvIS2/6cOKW1ogU+fpxKtqjOcW9UEsSYkJmtt60l+BU4wYbfg380kY73ITMGd
	BqBVvMcJnAlO+5cjk+QaqIA4eetVD0b2roqQfJRSCU+krrS1VlIK1mTP1+AR7Fc9Aj+Q+3tH4uN
	Xh3oEh30XFEdrIgcA5r5qJQh9WUCOwZTJC/GOLvg8ayLk77pXSxaFHp2NiPbcbVSkbbQETO68Ok
	5fUjdi+TF7XHKigrYOCcgFvAnegoMW2xxceqHIf697vmGRDx1g0s7nrHhgPsH1KeDrNCgK0kFIy
	rp3e8fEW7bc18hgaQdFysnx+hhk8vatess7x6J1ZYvDY1troFmGzvfeuoqB9Bz6fqkKH+6/lNV9
	wds3Vrqbow9XYBDvOZvmKAsqQgbWMTEh3lUaW6CJgN0cr3+lPerPkNsAS0IldISNCy28pbVpUm8
	RboLKQgadvg9wQFBXUnvxniVjpssAN+E0+S8bbDnu36oRgaenTGxboX5GgeeNogf2UFwDXESVj1
	IiC0a+u3Gu3vilxTt8qs7xI71srFYf7n+2a3/g==
X-Received: by 2002:a05:693c:20cd:20b0:375:f846:5b3f with SMTP id 5a478bee46e88-3767fe8f34bmr9670635eec.0.1794505890231;
        Thu, 12 Nov 2026 09:51:30 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm237865eec.21.2026.11.12.09.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:51:29 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/3] dt-bindings: bus: omap-l3: Convert to DT schema
Date: Thu, 12 Nov 2026 23:21:20 +0530
Message-Id: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw7CIBQFf6Vh7TU8rAFX/odxQS/QYmoxUImm6
 b9baoxdTnJmzkSSjd4mcqomEm32yYdhAbGrCHZ6aC14szDhlB8ZpRxGD72AISBwaRxqyZzBmiz
 7R7TOv9bW5frl9GxuFscSKIvOpzHE93qWWdn9umLTzQwYqMYwiRqFsOrc3rXv9xjupHQz/5uMq
 q3JgUJNlZUHWWvmxNac5/kDnnpZFe4AAAA=
X-Change-ID: 20261002-ti-l3-noc-28dfca81fdc5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794505884; l=1687;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=TVUUWGiB0r3bg0BiSKSrtHKyzz1fTiSm8J5D5VjMdbM=;
 b=j4ViMz3Xe/DKIXBX0OiFHV3H4AaAeqciPcJf7/6rwiei4dIrMfFiPBGN9AWPQmSXK8+LRpZIJ
 JQUDgNALrsPAVoJ5IGNxcNGCp8KvA/0aNky4nELThs4Ck3/4Za96Jun
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the TI OMAP L3 binding from text to DT schema.

The text binding grouped OMAP3 (SMX IP) and OMAP4+ (Arteris NoC IP)
together. split into two schemas because OMAP3 (SMX) and OMAP4+ (Arteris
NoC) are different hardware IPs.

- patch 1 adds a missing unit address to the ABB regulator node in the
  OMAP36xx devicetree to fix a validation warning. 
- patch 2 converts OMAP3 L3 SMX interconnect.
- patch 3 converts the OMAP4+ L3 NoC interconnect.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Split bidning into two SMX and NOC variants.
- Fix reg maxItems to 2 for ti,dra7-l3-noc L3_MAIN_2 is a submodule of
  L3_MAIN_1.
- Link to v2: https://lore.kernel.org/r/20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com

Changes in v2:
- Move binding to bindings/bus/
- Rebase to latest mainline rc
- Add unit address to regulator-abb-mpu node
- Link to v1: https://lore.kernel.org/r/20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com

---
Bhargav Joshi (3):
      ARM: dts: omap36xx: Add unit address to ABB regulator node
      dt-bindings: bus: ti,omap3-l3-smx: Convert to DT schema
      dt-bindings: bus: ti,omap-l3-noc: Convert to DT schema

 .../devicetree/bindings/arm/omap/l3-noc.txt        | 23 -------
 .../devicetree/bindings/bus/ti,omap-l3-noc.yaml    | 71 ++++++++++++++++++++++
 .../devicetree/bindings/bus/ti,omap3-l3-smx.yaml   | 68 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |  2 +-
 4 files changed, 140 insertions(+), 24 deletions(-)
---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261002-ti-l3-noc-28dfca81fdc5

Best regards,
-- 
Bhargav

