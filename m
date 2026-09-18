Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412943AAF67
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723126; cv=none; b=MVvwMPoiST/zc41IGfR4pyqMikoR3N3tWzr1PpEjxjFnYP4skCQ80OKEnmBhU/kmUKY1/VQxkWVMt58907kr+1CPFCiPwF5jSjjE0NXksqeDzYKSHA3CHDCCyw0atcI2XDIRSq8SXFk2gDqtmkjhnsbWu92PKUvq5XKSTDfuReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723126; c=relaxed/simple;
	bh=ROvZb4xUz6DU189xV6s7Pm/YrJwcTfi3qs6DKqPM7Kw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qorxBE3GhAoUIzfXWVc7yiWpKGJ0DVE7eqMy2YaLDGc1miB7qeyr97ppWWaC7hCs2L/2SbTKr3Ro+dEYJbZHcdhQZD2WdRqNDhL42nnHC9eOwC6wpSEl7UicrrmcPNas0k/SKXLTveyfnzNiUdjzJhWWDpUT9AvXTPSRXl0mKfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=am/CWk9v; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="am/CWk9v"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f63546c5so361187f8f.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723121; x=1790327921; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F++R57QYuDvzUJty6cC3PAkfnW/2M4IN8xpJOMy5r64=;
        b=am/CWk9vgu/RWIQGICQo0SOL14q3dsN+imB65I3WyZSt7f80uEZryGqbuZdbwZ/614
         27PGrg94HpFy41S+nmEEBEfYH8RtouIrT8vYeq9owAWN7fP9R5RprL0UErxi6FkMFg2m
         twPJmEYnvYGTYaD1K1KfFMiisZbnUHA3cgVR7z5NkD5xQS8zMPpa+kprAsW2AoeLAtlP
         CVWPZAUea94DRj2cXFRGpv/6WzpRXBU/9iXvPWhFVBiVH8s8Mj/sq5lY0Qnm0P/bMSCr
         Kmv0cT+KICoEbuEarRBlhY5uD1crJOQshaJ52qAdHLdBIps8a8ci4A2648vn9IiSz3Iu
         Wggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723121; x=1790327921;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F++R57QYuDvzUJty6cC3PAkfnW/2M4IN8xpJOMy5r64=;
        b=gFytb5IVAQJ0k+24s3ScOaT7xSf1Sag0AlVIxxx7wfukCA/7mZg3sJvC3y4aF7/mJE
         NXRYSwSDWQvebn58zmsh6QiLUODSYzpAbPzciyM1LVgpECzhxCOu/2SABnIjp3/yBkFz
         puGDmQ1De19bZ+BAYHGtPfw0T9dbMVHJcQvCVYIKvJFd2NLXhMcQ4hQMYmUASXwZeFQ4
         kxeLuBoDHU6CNgmkBoeBW4qrqiq4DQUiS9V5ewQlnvvoHW6THgW5EGpL6WslyhSUPt6I
         DFurcpIaI66i14TE+7SugpT4Y/PGK6Rp/azVbjBd4k62TTjM+9xk6nkZ5d/nppZPNv/6
         VnYA==
X-Forwarded-Encrypted: i=1; AKwUvBxwQYNNNgy1ylrtiuXCXGNxMLzLL1dS0X0DobPM6uq6WrxbCiXJJKI/hdbeI+mq2nMRlfk7TVuN8c4s@vger.kernel.org
X-Gm-Message-State: AFuF++kGCqZd5DKJtpTzaftaZCEZav6UTZV9u2XGk23hUWzme6L2ciC9
	T6V+3gXU9cQZbOgBK5clNVG9Y7Y/F8/iFEl9/IGcq4Lr4JxguXkmICWETj/h23l2JW0=
X-Gm-Gg: AYBFou2pSwjWGO5Abif6g7kujIjyrxyTqnGSC8H1EKG9fpwr4WGrAn7QSLQN3XZz/oV
	7FKHE7xiou/f14ouMSNpFTxq9fRx9j3uKuif89hwyP7IKS4Ep73rArR3au0XonECHT2n3MRB1cq
	hOgnbFEPWQvA+WkN93ECdJSjW3kALT0wlH0k1wowWlFPvqeIcazXdbzVTaOScGxxo7ZxU2cF1og
	s9Ov+oYvtIAG32dv7wjvTVh4Vgq56a+U0h7yRepCLadsrRMXuU6YbpqYT39Dd4OLaxKkNVgowBQ
	dFFEvuHIrKXwHvB3cTlS8ULadanvAJ5BTYSzsNMmIdOjzlbBAtGtqj5hGUohKyD2AlcWZP12/4x
	b68pttln7vR+qM4GfEN65ORslzNJc+PWb/IEzzHaAMrnug1vpixoqfAYepl8rrinyPAtTtpzRn9
	TH4TIgBoGASp2N6zBtM9yzzw7zUpjoLYGvIfJ7TIM37VupsP/hp76bTBXE+0GOudFKp4g=
X-Received: by 2002:a05:600c:358c:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49fc56b4ebemr26777785e9.9.1789723120709;
        Fri, 18 Sep 2026 02:18:40 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd22dbf2sm135573225e9.10.2026.09.18.02.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:18:40 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v9 0/9] arm64: dts: ti: Split wkup R5F memory region for
 IO+DDR resume
Date: Fri, 18 Sep 2026 11:17:44 +0200
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgBrWoC/4XSzW7DIAwH8FepOI8JDMGw095j2oHPFWltKhJFq
 6q8+0h3SDUhevz78LONuZEplhwn8na4kRKXPOXxXIN5ORB/tOevSHOomQADxYAzOo+X7Kk9KbA
 0jyEUGma6KMoNZcEicmCaByQVuJSY8s8d//is+ZineSzXe6+Fb9U/VjDRYxdOGeWQIoJzkgV4d
 /b6nV2Jr348kU1e4EHj0NWgagK9Qx+jV4NuaOJR011NVM1LLlF4B8KLhiZ3TYLparJqyQMGZT0
 Owje0YdcU411t2DbVg7IMhE2p9W7qUevPprYrKJucNZhcZA0Ndw2fzIZViyY47bjSwG1D07tmn
 vwQXTWU9ZospBCt+qet6/oLR+n0OekCAAA=
X-Change-ID: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, 
 Stefano Radaelli <stefano.r@variscite.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6355; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ROvZb4xUz6DU189xV6s7Pm/YrJwcTfi3qs6DKqPM7Kw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jHtXaHV75GfFrZnotvVfZt4xx7/ClZ/+blHfsMwgg
 0GFYeGZjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhIoAkjw97vYl3ZCv1C97V+
 ifHsviRpozP1YOYyX535h98ZZz7I3sTwP+7BKznNUz3sHYufxoae0w7TcTi316z0cI3x0r32ywJ
 msQAA
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

Note that concerns about uboot fixup of memory region fixups were
discussed here:
  https://lore.kernel.org/r/DJD1Y3G9S1SP.2GHOZ5X4RYJFA@baylibre.com

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Changes in v9:
- Fix scripts/dtc/dt-check-style issues
- Link to v8: https://patch.msgid.link/20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com

Changes in v8:
- Rebase to v7.3-rc1
- Increase the AM62A wkup R5F memory region to end at 0x9e700000 to
  also fit the edgeai DM firmware as requested by Paresh
- Move the memory region definitions back into the base board dts files
  of all AM62A and AM62P boards
- Added bootph-pre-ram to the memory regions are merged into the
  bootph-pre-ram at the end of the series
- Link to v7: https://lore.kernel.org/r/20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com

Changes in v7:
- Rebase to v7.1-rc1
- Fix commit messages
- Link to v6: https://lore.kernel.org/r/20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com

Changes in v6:
- Added fixes for the length of the wkup_r5fss0_core0_memory_region.
  Thanks Francesco for pointing that out. am62a firmware is shorter than
  am62p firmware. I calculated both and fixed all devicetrees using
  them. All patches have different Fixes tags so I kept them separate.
- Fixed the length of the split memory layout as well.
- Removed the double definition of memory regions for the var-som board.
- Link to v5: https://lore.kernel.org/r/20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com

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

To: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Tero Kristo <kristo@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
To: Andrew Davis <afd@ti.com>
To: Judith Mendez <jm@ti.com>
To: Daniel Schultz <d.schultz@phytec.de>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
To: Beleswar Padhi <b-padhi@ti.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
Cc: Hari Nagalla <hnagalla@ti.com>

---
Markus Schneider-Pargmann (TI) (9):
      arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory region size
      arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a: Split r5f memory region
      arm64: dts: ti: k3-am62p: Split r5f memory region
      arm64: dts: ti: Add wkup R5F nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 29 ++++++++++++++++++--
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 11 ++++++--
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 32 ++++++++++++++++++----
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 11 ++++++--
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 29 ++++++++++++++++++--
 8 files changed, 179 insertions(+), 20 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
--  
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

