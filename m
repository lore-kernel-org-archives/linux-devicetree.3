Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7274B345734
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303619; cv=none; b=RNLj31KqXjQnfMZiAkXw/b+E2SHye00Uroc/FO8HVKK0CxPfOQhzPTmjN5u5spF1AMGv/8R4jgHN7N0Vg9KDoNGUkr5DDvbYini2CU0dbEL1SXQBFI02VKUol30yZ5KixbUlibybdr3K49hlI1iQUOyGl7aNFC+3i9QQB7Mz19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303619; c=relaxed/simple;
	bh=1qlcY0y259xbjnWTloWIWPE3d0CRfH7ESQKQ/1nYZ34=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M0PbU0jbaelV8+yVYZATmLeZ0pin40jjPM/Zoc2m0ORYFL9N5+oTr5lc0r6lYOM2+FrR/EBi2ZAEcmrZjbnk333HaAEKAbrtQ7UktMyGTcBOUN2ozhnc/5HPMVSBMf21rI8/623gRWEQcGwW7TdXYKgPq92f8IILqJ2WJ9yCPSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XydUxsF+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XydUxsF+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ebafde87cso6412834f8f.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303615; x=1780908415; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYbLJTcyGkPOWhCnzFzJEc5YHySHwwwqyvZml3ki+0w=;
        b=XydUxsF+qi1oNPzgHbYnAmA1E2kcHCT7WyDidfbKj6z1+iCDWtDxA8KRpbSwOpckJK
         2RZ8W8CbIRKinPAqx+tawgxAYu8rlnFajiB4jntHF2gq/o/x8gfHpxdeHBBmIV8d5dCv
         b1Kx2L1DRftOV5X/xNEh55t+cpz047KGiqCRLx0DIpVIDeRK6VatSJ/HTZGfD9GJd0j6
         gv1YMFmbVL6G838fubqrTlMA8VqoEge4Yal+AP2dJ/brl+88fmDyYk0j45pdAuX36yAa
         h2cymaZSpJtISPbfXUXTLCJ037KLgeESeahUVJ+1tJRtVdN4cUimzbj1A4ZNytsXJ1nn
         0Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303615; x=1780908415;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYbLJTcyGkPOWhCnzFzJEc5YHySHwwwqyvZml3ki+0w=;
        b=NqzT9OocXYQfsKdSJ0UaH5zFR7PVD16qH7nMW0Xz7WI03LoE8GerfdYLrw93D4vESy
         23efNQxzujzQGPEAhAdKDHt5QiGVv4OVFQjRka8tgfosn0ZymitkQ3DZcXHYimt8pSsm
         BDfuD9XisUpfGOi7QNFmNkF3Rj1stf+cEKDs13gGtsm6jCFXKd/sAMoAJJlGxoseQD4U
         /SJGikosKFIakuPTtZKNggSCXKGtyPJrHhWuxzKYmv6TyjEgs0oBo9ik6mDrsAwEGE45
         VovQWhKLNrxx1szhbk6NJcYJ/cypA2hAgRysYl15J6fF/KfHI9/2QCKzws5CSPnUpZ+M
         O18g==
X-Forwarded-Encrypted: i=1; AFNElJ/JLnZBRTwHw4o/l/H5p377UXBAxmUf7bLHZE2AwnWfKOeAI7d/2ZC+BApZpOuiWXM6hT8bRdJe8ZmD@vger.kernel.org
X-Gm-Message-State: AOJu0YzURRKokG6JDWq1PtU957xgc35b91h/eLZPPz2oU/ZUisRbFxrg
	mRGhLA+97GTxu31ePg8rOoFEUNQ96nxzf/3M3FN7cScNbr4sN432BcjCoGHtJ9/uOSY=
X-Gm-Gg: Acq92OHVIgpyI14lTApQqiRIKt4JkgVQWwBpEsUcJTjaDhI8INsE7YIxf3mxpROlDif
	UPxR421mRfkeGJ6gY97i4/ZcZdqycTsxJdVIUgZ0vWaMczGXEQMgkoR9voqd1n41pkBLkc2gLHb
	8tgSS+K+/GGLiOq2lsFj7NvBx9NTLX/SD2CP2rh+mv0Z8+8F8L8yiJS844vE6tz8LXe6rGwL4W8
	TVoaPWooiHoI1UvN/VaTia5MQJwXiiGde1Bj2Ra8D70blz0qZN9UcdMIWOfYFfNI3VjRSyMkx+2
	xLyRO9ahbj28pP89IlVYIVMOfRNjoNGoLWmEPOr4qXAvAJK+1JeA+W8ns/gXDce4XJJ7KvU+5Ri
	1PhVVDdJN2Ev6GUFBYD4id1Totz7tRfWP2xNB8rdOjL11QwihRYYnM0o5WQNFqts4vTJigYJWP5
	SaO/yHI7mwtDrlFYJvcFOy8VVSUzw17Uc=
X-Received: by 2002:a05:6000:41ee:b0:460:1301:dec3 with SMTP id ffacd0b85a97d-4601311220dmr3151152f8f.3.1780303614676;
        Mon, 01 Jun 2026 01:46:54 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3587072sm24459222f8f.34.2026.06.01.01.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:54 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v5 0/5] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Mon, 01 Jun 2026 10:46:11 +0200
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANNGHWoC/33NQY4CIRCF4asY1tYEChpaV97DuICCHitRMXSHa
 EzffdBZjJmYXv5v8b2HGFPhNIrt6iFKqjxyvrTo1itBR3/5TsCxtUCJVqKSMOUrE/izRQ+cYyw
 QJ6gW1AZk9M4plL2KTjTgWtLAtxe+P7Q+8jjlcn99VfVcf1kt9RJbFUhQOCSHIRgZcRf8/cShp
 C/KZ/GUK75pChc1bJp2FBylRLbrP2j6XesXNd00Mso4TQE16Q+a+dMMbhY107SB0EXryXWa/mn
 zPP8A5wqo57EBAAA=
X-Change-ID: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3394; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1qlcY0y259xbjnWTloWIWPE3d0CRfH7ESQKQ/1nYZ34=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZt+vbzRnXtSc+7J+a+vDBi13nb/e5LTSSVTvivGyHX
 DbTuuXnOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAisrMY/scXB31vnJoa8+nw
 0q/cP0Q/cewL9+x6aZDA5O83N3dn4xVGhu+3iryLH6mY826yWlPUdnWPnPr6+QejpsUtSMsONiw
 0ZQIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

Split the firmware memory region in more specific parts so it is better
described where which information is stored. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data and resume from RAM.

The bindings are already applied. The remaining patches use the new
layout for the platforms that are capable to support IO+DDR. For IO+DDR
the new layout is necessary as it defines the location of the LPM
metadata.

Additionally the two important devicetree nodes for resuming from IO+DDR
have the bootph-pre-ram flag added as this data needs to be read before
the RAM is in use.

The changes in this series were suggested as part of the IO+DDR u-boot series:
  https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Changes in v5:
- Move all changes into k3-am62a/p-ti-ipc-firmware.dtsi
- Dropped the patch that adds bootph-pre-ram to k3-am62a stuff as it is
  already present in k3-am62d2-evm.dts and got moved into the
  firmware.dtsi file which covers am62a as well then.
- Link to v4: https://lore.kernel.org/r/20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com

Changes in v4:
- Rebased to v7.1-rc1
- Dropped all already applied patches that are the bindings and the
  initial introduction of memory-region-names
- Link to v3: https://lore.kernel.org/r/20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com

Changes in v3:
- Squash the enforcement of the memory-region-names requirement in the
  patch adding the memory-region-names, as suggested.
- Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com

Changes in v2:
- Make memory-region-names required if memory-region is present
- Fixup memory-region and memory-region-names conditions. Require either
  2 or 6 regions for memory-region and memory-region-names
- Reword and restructure the binding documentation for memory-region and
  memory-region-names
- Add memory-region-names to all uses of memory-region
- Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com

---
Markus Schneider-Pargmann (TI) (5):
      arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move wkup reserved memory
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move wkup reserved memory
      arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split r5f memory region
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split r5f memory region
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 12 ------
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 12 ------
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 17 --------
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 12 ------
 6 files changed, 92 insertions(+), 57 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

