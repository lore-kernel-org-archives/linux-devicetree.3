Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445263;
	b=NM9dJqkPZk1lBQDVMCMunWtkYyvXXm6keKv4Ee1+PIHajj+47WFR2T2PC468Oc52UMIe
	 UH0o1Xc+tJEOjIMMYS+KjvyijoVgMT25dXEME9Tv3+/6BRr1mUrCSi0e4ZKb4hXpfRbGy
	 n89vryNiiRxhXwRlZJsfkTtfkSN9aDKtus781ghQsbw5uBy8Mi4EeEqAfsXsHgxt6wyHA
	 DlxyfI6QR7B5qUM+nsm+lp/NXcLe5sV8GwRXX61rrQ+fdJ2vTlRPhgxcyqZPEhy6KqXTq
	 noogEyho39Y2gmryVI2bChfqMEXuh16tmWzW9WeiS0US+F8RAgf69Y+NTl1ndOFPE2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445263;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=nItmIVKm3gLDkwdSrhwxPAd/1rgS2tZ6pNgf/bDdxMs=;
	b=N6NkJB9VTapreoXxgylAjgHjmfLUzm2lUl6s/fgJ3UWzLDaASAM5bS1kUOocpowkmESj
	 IySiNYerHGS6gXg2Bi2X+PIcd+SG/MlrQYhjOmHjD+6yOGDX/Q8ARVWL7r/CwL3dXyiH0
	 Iw4BUg/zKSynlT5tij20DSGYl+ycWC6S4zT/xfaHAWu0wkN+SoaTqtDw2clZHH/AbGdl6
	 jHKM97AQb2w1K09169Oyh7Yl8KxMOs8cj2Rb4biGAH6csJ2F7wcdPB85dkA3XZ1YK6DbA
	 07hYVwC4cCjeAcfXL08nF1vRejEww62MshuVsTpXlgKkawkjRifOHX9l15+do3HuDbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZESrvl2k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CD3606A31A;
	Mon, 23 Nov 2026 14:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZESrvl2k
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445263;
	b=slBpmGh5AYwycvx51taQNDJk2o5lWO0TGaHxDdhemK7DpgBp4v0iYjeUtq1G5AaOsZdd
	 j8C/MplGMNoxTLq9Xp83tQBhwGbtWjx6O1dXGcPx3nCCGhsMK7L8DGescJrN6t6krX/xs
	 xbd6+iNBg541bzv4IJxwOVm6MHr67WA5gNxuDLEjtARH+68sAiIbXsVTPXmTCrjuOfZIr
	 ymp0hDK1hQe4+f5TWR4ueiLZ39Wn3dSubC3rB0JgOIq03Vga9V3CK1jPYZ2bgWAQxynHl
	 W/2M71lNd9ZDJ+waoGs7E1KEoSg0Li0qo7/8GQ9Z+koaING734Ktg8Y4jSIDDvhm3LQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445263;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=nItmIVKm3gLDkwdSrhwxPAd/1rgS2tZ6pNgf/bDdxMs=;
	b=wJ1Ur8AOiNEiL+GEgJ7K0xLPNZgz6tyyHBon1TW1Q67sSdUD2OKK5Vaxq+7MBdYHmHea
	 IjjOjqyBG6poY/imDCz5oxTgjRNOiOZsLBu23CCy422NHdL0xyKIdUxhmpqu0N/GYP4CG
	 tIOrg8CrWVD3c4FeRUNRtS+0hUwMp14QoQmY0LCtX/FfMcv2atWf+daTyYctOAMLW0SVm
	 NKp1Wz3YHHKlvcDTeQ5Okw2S0dw0syMPmkC2bi/Z0Py1RR2uNw5HONGkNoRrClKhnA1dC
	 wp8Gg7xqG/bXbvSKgi3JHDNS/dn9tJJFopX2aSN2hvCM87Z3wxvRpXEi+I6LnOv4sdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 924911F00A36;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445263;
	bh=nItmIVKm3gLDkwdSrhwxPAd/1rgS2tZ6pNgf/bDdxMs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ZESrvl2kFhVtYU59GOdCxWn5RNPOW5ia46bj9HEyWJsoOaoRa0zxI8t7xEAzBV/FC
	 3pXtQmCK7kncXAMM06VOvaM6fSmGf4VVZv9ZMYrgj933qC/wiCnuAaQfWBv0rAP+BX
	 IvjQ5QDB7ExarMZpiXK7pufbTZFWIY030i+KXSAGc8cXfmsAGY+XGNe/LK5yRpPH6d
	 bje9FMyblqjmwXsELSTU7k5gRMicRU840UwobsTxHQRuMH88oSQsPpP3mMPKCY/wfc
	 da5ATQAzAp94+B8oswSsHrrQcFHqMHxWt2wy9u+gl/GDxFaJgWGYpFAtawyOAub9VT
	 qzf9ppP/CU69Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E9C744C4FB;
	Mon, 23 Nov 2026 14:47:23 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Subject: [PATCH v4 0/8] Add support for MIPS P8700
Date: Mon, 23 Nov 2026 15:46:55 +0100
Message-Id: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
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
X-B4-Tracking: v=1; b=H4sIAN9RBGsC/23MQQ6CMBCF4auYrq3pTAsFV97DuIAyhS4E0mKjI
 dzdgokhxuWbzPfPLJB3FNj5MDNP0QU39Gmo44GZrupb4q5Jm6HAXEjM+FhoIXgzBa5AF4UVoBA
 1S/+jJ+ueW+t6S7tzYRr8a0tHWK+fSglqV4nABZeYawuKakNw6SYyrR8e48kMd7aWIn41gJB7j
 auuTNao0qKR+p+WOw35XsukacW1bkiW9lcvy/IGBU5OKSIBAAA=
X-Change-ID: 20260325-p8700-dts-41788f014227
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=4767;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=fk2JShQCzrA8OtTZu8VbzvejSAGg+O0BzIRRDTpGEr4=;
 b=nsH9cdBjPokP8DnwyoNqo9owmGhVw/iboBNhywcntNuIYDvUIDmlbhVx9xQUIzPdDb1F1lDyn
 7nDWGmXN+qICLJRh0O0/x4oizwIn9UW6N+lXlFKeckKNa6vve4Mq9Ai
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

The MIPS P8700 is a multi-core RISC-V microprocessor system, supporting
both single-cluster and multi-cluster configurations. [1]
This series adds full description of the platform,
including the Boston FPGA board configured with a P8700 bitfile.

The P8700 cores support the RV64GCZba_Zbb (G = IMAFD) Standard ISA,
with a caveat: the A extension is only partially supported, and all ZAAMO
extension instructions are emulated on the SBI level. The device tree
intentionally does not reflect this fact. Vladimir Kondratiev's series
improves performance by directly substituting AMO instructions with LR/SC. [4]
The two patchsets do not depend on one another.

The board itself is the same board as 'img,boston', configured with a different
bitfile [3]. The Boston board has been supported since commit 6e62a888029b
("MIPS: generic: Support MIPS Boston development boards") (thanks to Maciej for finding the ref).

I tested this series both on QEMU and a Boston board
configured with a single P8700 CPU,
after applying the necessary U-Boot changes.
We are planning on upstreaming these as well.

Following the discussion in [2], I decided to drop the 'gf' prefix for all compatibles
and to rework the aclint-mtimer binding.

Links:
[1] https://mips.com/wp-content/uploads/2025/11/P8700-F_Programmers_Reference_Manual-TM.pdf
[2] https://lore.kernel.org/linux-riscv/20261109051050.105623-5-joel@jms.id.au/
[3] https://training.mips.com/cps_mips/Examples/MD00901_Boot-MIPS_Example_Boot_Code_for_MIPS_Cores.pdf
[4] https://lore.kernel.org/all/20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com/

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
Changes in v4:
- Add git tree link to the MAINTAINERS entry.
- Require the names of mtimer registers to be 'mtime' and 'mtimecmp', as suggested by Sashiko.
  Update the commit message to reflect the reasoning for changes in v3, suggested by Conor.
- Link to v3: https://lore.kernel.org/r/20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com

Changes in v3:
- Drop the 'gf' vendor prefix patch. The prefix isn't used anywhere.
- Replace 'gf,mips-p8700-*' compatibles with 'mips,p8700-*'
  to match those already present in OpenSBI.
  Other compatibles are also renamed for consistency.
  Match the directory structure and binding names,
  by replacing 'gf' with 'mips' everywhere.
- Add a MAINTAINERS entry.
- Change the `aclint-mtimer` binding, reversing the decision made in v2
  and putting 'mtime' first when both 'mtime' and 'mtimecmp' are present.
- Link to v2: https://lore.kernel.org/r/20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com

Changes in v2:
- Patch 1: Replace "MIPS Technology" with "MIPS Technologies".
- Patch 3: Name the FPGA used and add the versioned bitfile compatible.
- Patch 5: Drop hart indexes from MSWI.
- Patch 6: Swap mtimecmp and mtime, require reg-names both for mtime and mtimecmp on P8700.
- Original patch 7: Dropped.
- Patch 7 (previously 8): Remove additional harts that are not
  present in the bitfile I have. Reflect changes made in patches 3, 5 and 6.
  Remove riscv,cbom-block-size. Drop undocumented compatibles. Other minor changes.
- Link to v1: https://lore.kernel.org/r/20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com

---
Aleksa Paunovic (8):
      dt-bindings: riscv: cpus: add mips,p8700
      dt-bindings: riscv: Add MIPS Boston board compatible
      dt-bindings: interrupt-controller: Add MIPS P8700 APLIC
      dt-bindings: interrupt-controller: Add MIPS P8700 ACLINT MSWI
      dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
      riscv: dts: mips: Initial support for the P8700 Boston board
      MAINTAINERS: Add entry for MIPS RISC-V SoC support
      riscv: defconfig: Enable MIPS SoCs

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../thead,c900-aclint-mswi.yaml                    |  11 ++
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 Documentation/devicetree/bindings/riscv/mips.yaml  |  33 +++++
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  39 ++++++
 MAINTAINERS                                        |   8 ++
 arch/riscv/Kconfig.socs                            |   6 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/mips/Makefile                  |   2 +
 arch/riscv/boot/dts/mips/p8700-boston.dts          | 135 +++++++++++++++++++++
 arch/riscv/boot/dts/mips/p8700.dtsi                |  82 +++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 12 files changed, 320 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260325-p8700-dts-41788f014227

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>


