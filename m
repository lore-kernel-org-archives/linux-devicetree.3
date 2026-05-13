Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595D33469C;
	Wed, 13 May 2026 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686161; cv=none; b=eB5OJamvGqdw/EYQLhSsW0pqc1tl4wpnOgDwqiWEvdacCRkdC6Q3buc2/9xTbeyCfHa//w5Sgen2U+cdqFDXD3RsAh1LsvM1D3Wsteg2bb4PDMp51+Rs9jtwvqMnwNin+J64G9CmPOFcTxW4MQ4DeJZVD9Uz2+cSBLcHidAHn1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686161; c=relaxed/simple;
	bh=ePHchjnhwuY+HtMvCqWbW0nK976smbTfakDyyaKGCPs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p7KkZnIwmVQGTcL31cBQTfbL5ZqOLPGTZL3U/UgPhjN4vgbBWKJuDEia8WRt4V6zlEL3zO+rFz+kWmnuy/WUNHFo/AY+3ZH3C0uX1dIfN3ou9rk3LcMrInLlRE6Y62LqybamTsJ/R+Aj+0Z048didr8Qaeg9xqPeFNtZ1rwc6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3R2UzTu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3R2UzTu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E9F9C19425;
	Wed, 13 May 2026 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778686160;
	bh=ePHchjnhwuY+HtMvCqWbW0nK976smbTfakDyyaKGCPs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=I3R2UzTuNIjO6Ilc1+KJaKqL2E3JRGJuqyugg6YS+K0TxJNTVgGlsQlMk7BDQaj8m
	 p3mSLv2ycyUSE01el8kCqJtH4DBAlAYS7Feghry/uM5ZoghXTQNNvpqHocMQcOmgP5
	 vCNtO2rkW+bFlgSorh0ziU11RQSM0UFzDP99UYnKA9dsIpSVUpR6sgHntVxOmahFos
	 F8U63emFXTrW/S/rMJeXa6448NH1gpUV/3nJnRZkj/0oCH7p4kO9NwLfrK13zbJfQg
	 KwuY1MLGkLMI2ecd5NvF9iRIZVrA1Pgugqqp9cy5CYCNVQu949ug1fESvb7ImEAL0K
	 /H98khUedcPdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B52DCD4F21;
	Wed, 13 May 2026 15:29:20 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Subject: [PATCH RESEND v7 0/3] riscv: Use GCR.U timer device as clocksource
Date: Wed, 13 May 2026 17:29:07 +0200
Message-Id: <20260513-riscv-time-mmio-v7-0-f8925ffc226b@htecgroup.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Chao-ying Fu <cfu@mips.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778686158; l=2879;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=ePHchjnhwuY+HtMvCqWbW0nK976smbTfakDyyaKGCPs=;
 b=DRwgnHWwrSwfSEw/0SDTGvuurI0sp5QwEl0FVn05Jy5bdnIGSmh1xaYASOkbddAcYPWueIr9/
 v1NHBx13zYlCHo8sodGK1FrRikC6SQbYWb8rQnzeLOnyk62KO6l4trp
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

This series adds bindings for the GCR.U timer device and corresponding
driver support. Accessing the memory mapped shadow of the mtime register
in the GCR.U region should be faster
than trapping to M mode each time the timer needs to be read.
The timer device does not implement any interrupts, therefore the
timer-riscv clockevent implementation should suffice.

We tested the patchset both on QEMU and the Boston board with the P8700 bitfile:
- Coremark and timer kselftests on QEMU emulating an 8 core CPU
- Coremark and timer kselftests on the Boston board with a single core CPU.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
Changes in v7:
- Replace the previous implementation with a new timer driver for mips,p8700-gcru
- Add a patch for 64bit reads for timer mmio
- Link to v6: https://lore.kernel.org/r/20250806-riscv-time-mmio-v6-0-2df0e8219998@htecgroup.com

Changes in v6:
- Rename mti,gcru to mips,p8700-gcru
- Link to v5: https://lore.kernel.org/r/20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com

Changes in v5:
- Fixed build issues on 32-bit RISC-V and sparse warnings
- Remove clint_time_val and clint.h, replace with riscv_time_val
- Depend on RISCV_TIMER in Kconfig

Changes in v4:
- Remove "select" from mti,gcru.yaml.
- Refactor the driver to use function pointers instead of static keys.

Previous versions:
v1: https://lore.kernel.org/lkml/20241227150056.191794-1-arikalo@gmail.com/#t
v2: https://lore.kernel.org/linux-riscv/20250409143816.15802-1-aleksa.paunovic@htecgroup.com/
v3: https://lore.kernel.org/linux-riscv/DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com/
v4: https://lore.kernel.org/r/20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com
v5: https://lore.kernel.org/r/20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com
v6: https://lore.kernel.org/r/20250806-riscv-time-mmio-v6-0-2df0e8219998@htecgroup.com

---
Aleksa Paunovic (3):
      dt-bindings: timer: mips,p8700-gcru
      riscv: clocksource: Add readq options to clocksource mmio
      riscv: clocksource: Add p8700-gcru driver

 .../devicetree/bindings/timer/mips,p8700-gcru.yaml | 38 ++++++++++++++++++
 drivers/clocksource/Kconfig                        |  9 +++++
 drivers/clocksource/Makefile                       |  1 +
 drivers/clocksource/mmio.c                         | 14 +++++++
 drivers/clocksource/timer-p8700.c                  | 45 ++++++++++++++++++++++
 include/linux/clocksource.h                        |  4 ++
 6 files changed, 111 insertions(+)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20250424-riscv-time-mmio-5628e0fca8af

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>


