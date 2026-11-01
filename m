Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559469;
	b=2Z8gxsJD5P9xPiw7hvr6LmTiCNaLtS7G81hdau9ehtFtMCBubgEq/8rRmpoa7ane+dtu
	 P/kRov0N14eI4+O7t6EISr+QLP5JBSRHm2s28xSTuDWmOYf331tS25a1jkxMAoi2hRzSY
	 reXV7jUoJLj8QcHsNNXB2Dwn43NY4RhSAUa1fKmPMwRiJ9yt4mnxcR7eG+oPwQ4aU9f4V
	 nYcnq6xIk/kYYAt+FEjEiANlaT3V59qDy+gsZIhGHKWSGJi+JZHmgOCKl8NFVDJOatAHV
	 lRk1b9P0Xo5YE2Xz7teJu+4xq4hk2grEuZghBVUrBDI+TZtl2p0cFqkrDTJ1RCmF2VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6kZ202AvHWljwqwG04WTTgSqbAzapYvPwFz9uVKHoOo=;
	b=pgI4ylIVz51rRmYpnORBaYnXyibgiZ2KNwYhoFEjgYDRhdZNoR1Z89N9OHikXjtjAPZR
	 TjeEUXB8n+GjhVDYLgtMw0ZKz0tYyhkdAL5qS5jQRVZNYPso73tTGI74oxwZ7HbPURDnx
	 e0aYNv+8/kJy4RHU/yH9ar/aBLCKNQYE7nNeXv0KlwF7BfR9Nl2JY7W2BxZU5wFSerUxX
	 4IsmXgWXuuI6vXD4jOKDF8r+lsipgPsnov4XkH3Zx8LxaILfZS0YVuSFaUN+qTywvDU+3
	 yib9X2t4RLwA4gKPVJAcoZZr+tW7Eq5P/XXBTQLfEAJ6DAlcx8mcDoAv+gt06TjSQQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h9A+PZ/L";
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C671606A327
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 18:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C671606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h9A+PZ/L
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac525c1f05so20815767b3.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 10:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559467; x=1794164267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kZ202AvHWljwqwG04WTTgSqbAzapYvPwFz9uVKHoOo=;
        b=h9A+PZ/LQ198URW6dSoK6a2guMssSUfpdFpkkEprm7czhfcorNgHAuXuja+xq180Gw
         gSMi03N2sU4K6OcGtA5RIY3p44AtM32JbYRC4+vycpaLpT04Cuob51JT/Khg5LATG5Vs
         tuIvIxaV/n6PuBy0sckbVdtbXoKg1p6dsJXuhR0WIylgf3BEDTqqICcHYyXet1O42gEn
         fPECHkvyUovKVrGLgV6Sz6PZ53UMb3Fn1Z7aqX77L7Nh2PDpBpOxJcIAGewFQzbx80xP
         TQQ1deedUeL/g7Fd2gv7Ju/mQLgaPTVZCSjHQROaWk/mbucqlZbE+NscAhExF1INYgvq
         8gOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559467; x=1794164267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kZ202AvHWljwqwG04WTTgSqbAzapYvPwFz9uVKHoOo=;
        b=ECqFMvUdgA7TVqoYr+DhHIunLbfmQrfjbWmeFTVnMd2caBeH2CtJXhbwdO9TXhCSCc
         lZxM5nTsfdAY6S2d5l5572FPtqJaYi5mJ1QlkopdXOGh1Lq4ZGH1Bg0x+/GPfdtZrFu4
         pfHfPoQ7J/IR8mnEZRHKnfJBPyEAM7uhb1yA+BmkxNynOPRazSCSV+IXFJYlXw2+YHbD
         d6v2gwelPSbg0Hs1nn7yumn3NNjVYf944HQkf4fhMwc5rSmbp5cLuwPzWX+kj8JPIRG8
         onluryKui2g9l79Vo+WOX9sCEmAP29JtnCMS9S822xi+Y87SIBTTOVfoLcCJeyKb0p2E
         3aGw==
X-Forwarded-Encrypted: i=1; AKwUvBzDLPrWncqFwcsF51JElcLtAL0zYMQbEhSooQ/+HCgcMnu7HmHS2DDs4CdQGNzYphm1e6sr07HUebmh@vger.kernel.org
X-Gm-Message-State: APuU4Z8dZRFpu13zZTMJKIMautjKosB9OhIn4s36AVoAy1QFzLVfUlC3
	C1BF12HdTBdoZMtMYndVJ4wh+ocT/PZYCXTd5nvsbJ/J37P8A2WCyHkOcMyqpcJ+
X-Gm-Gg: AYBFou3jNmWG0IFZPvDIHH30RHDIruSr8zOGrr7qDFmG9VndMmCj1nRJNLwJIYNIDUC
	sRasNuozEzdW/0jJe5q1E0kyMFRcV1+iHAMldKZOnKxpDrd5EnUgx0h41A82iKxwvVvYrgrCgZV
	eS9IsNsH24f7X75USxi79OxABD4Labujb8EZDRklLsOn6O+i5i+IG8QmncwL+CUJr8HLAAjXLLy
	oda3ZhF39/MXxzmCLHNMhvPWmSbfQTMaeN/qGypUn064hcQIobB6dkBJOQhyWO52i9tWyLU/t0K
	FO4cEG0051Bm844teBvEgHr1hMSJyvfWPb5Ml901xnN4U2THEDeeCo+cIgN88d7saPy+ts2a89e
	1Ex1gb8aTM2H/yExVC6EaB/Ciz7LR0f4cfou7nk/fT7da9A0noSOSr8oAivEkoNHKbG3utkeedz
	qFa0ufojYifw2tw+AVLLyyto6LemSxhBjgX5hAXhYBI5y3EFt7KrtSN4xZO+GTXherMUYmwXB2m
	qpsHXcefJq1dZvdc+yaTEoth+KDvbFPxm1RaFq/Z//jjLZK44lhKD8SVySGTxLi279F2zPvVTPZ
	3qX1Uf7fY9zdw/UNaFqlYfLqTcp4bRQCa12ey1gKr1V27gKF4ReT3HOdQBUoROvH9wI=
X-Received: by 2002:a05:690c:a046:b0:8b0:eab2:f502 with SMTP id 00721157ae682-8b2b67992e6mr47158847b3.61.1793559467403;
        Sun, 01 Nov 2026 10:57:47 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:47 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 0/7] Add Allwinner A523 message box and XuanTie E906 remoteproc support
Date: Sun,  1 Nov 2026 12:57:28 -0600
Message-ID: <20261101185735.762559-1-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a driver for the message box of the Allwinner A523,
A527 and T527 (sun55i) and a remoteproc driver for their T-Head XuanTie
E906 RISC-V core, with bindings, DT nodes and KUnit tests.

v2: https://lore.kernel.org/linux-sunxi/20260927002021.797069-1-tcmichals@gmail.com/

Changes in v3 (details in each patch):
  - Message box: all four banks are clocked and out of reset (an
    unclocked bank drops writes). The FIFO is drained before its pending
    bit is cleared, and messages are delivered after the controller lock
    is dropped. A kick is done once the receiver's FIFO has room; a full
    FIFO is never written, and in poll mode the check and the write are
    under one lock. The shared reset is never asserted, as in
    sun6i-msgbox: the other banks carry traffic between the other
    processors. allwinner,tx-done-irq selects the receiver bank's write
    interrupt instead of the 1 ms poll. OMAP's ti,mbox-send-noirq is the
    same kind of per-mailbox switch, in the other direction: it turns
    the TX interrupt off for the WkupM3.
  - Remoteproc: one mailbox channel; the receive callback is deferred to
    an ordered workqueue; address translation covers only the two SRAM
    windows; debug reset and power domains added; all register regions,
    clocks and resets are required, the mailbox is optional. Carveouts
    and crash dump segments are registered in parse_fw(), and crash
    dumps contain both SRAMs and the carveouts.
  - Bindings: fixed lists for reg, clocks, resets and interrupts;
    "schema" dropped from the subjects (Krzysztof). All four message box
    interrupts are required: every A523 has them. The DSP and CPUS
    message box bank addresses were swapped in v2 and are fixed. The
    SRAMs are named as in the T527 manual (sram-a3-0, sram-a3-1).
  - KUnit patches moved after the drivers. Both suites redirect register
    access with static stubs to mocks, so they run on any architecture,
    UML included. Patches 6 and 7 only add tests and can be dropped or
    taken separately.
  - Rebased on next-20261030.

Notes for review:
  - The remap register (0x07010364, PRCM) is shared with the DSP: bit 1
    shares the 512 KiB SRAM A3_2 with the E906's subsystem, bit 0
    belongs to the DSP. The driver maps only this register and
    read-modify-writes bit 1, which is safe while no other Linux driver
    writes it. I can move it to a syscon or the R-CCU, or describe SRAM
    A3_2 through the sunxi SRAM driver (allwinner,sram), if preferred.
  - memory-region index 0 is the virtio DMA pool, then dram and trace,
    as in the TI K3 and MediaTek SCP bindings.
  - The optional crash interrupt is supported by the driver but not
    wired in any DT and not tested on hardware; the A523 has no
    dedicated line for it and the vendor BSP has none.
  - System suspend is not supported: the E906 runs next to a Linux that
    stays up, so the driver has no PM callbacks.
  - Merging: patches 1, 2 and 6 are for the mailbox tree, 3, 4 and 7
    for remoteproc, and 5 for sunxi. Patch 5 needs the bindings in
    patches 1 and 3.

Testing on a Radxa Cubie A5E (A527), Linux 7.1 PREEMPT_RT and PREEMPT
with the same driver and test files:
  - KUnit: 37/37 message box, 26/26 remoteproc, built in and as
    modules. Under UML on x86_64 one message box test is skipped (it
    needs SMP or spinlock debugging).
  - rpmsg ping (10000 messages, about 167 us round trip) and stress
    (100000 messages, 16 in flight, no loss), with vrings in DRAM and in
    SRAM, TX done by poll and by write interrupt, and message box
    unbind/bind with the remoteproc driver unbound. One interrupt per
    message.
  - The same tests with PROVE_LOCKING and DEBUG_ATOMIC_SLEEP (and
    PROVE_RAW_LOCK_NESTING on PREEMPT): no lockdep or sleep-in-atomic
    report.
  - On next-20261030: W=1 build of each patch with GCC and clang, built
    in and as modules, dt_binding_check and dtbs_check are clean;
    checkpatch --strict reports only "does MAINTAINERS need updating?"
    for the new files, which the entries added in patches 2 and 4 cover.

Tools: I used Claude Code (Anthropic) to help review the code against
the v2 comments, write the KUnit tests, run the board tests and draft
commit messages. I reviewed every change; all tests above ran on my
board.

Thanks to Krzysztof Kozlowski, Chen-Yu Tsai and Rob Herring for
reviewing v1 and v2.

Tim Michals (7):
  dt-bindings: mailbox: Add Allwinner A523 message box
  mailbox: sun55i: Add Allwinner A523 message box driver
  dt-bindings: remoteproc: Add Allwinner A523 RISC-V remote processor
  remoteproc: sunxi: Add Allwinner A523 XuanTie E906 driver
  arm64: dts: allwinner: a523: Add message box and remoteproc nodes
  mailbox: sun55i: Add KUnit tests
  remoteproc: sunxi: Add KUnit tests

 .../mailbox/allwinner,sun55i-a523-msgbox.yaml |  146 ++
 .../allwinner,sun55i-a523-rproc.yaml          |  146 ++
 MAINTAINERS                                   |   15 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |   47 +
 drivers/mailbox/Kconfig                       |   24 +
 drivers/mailbox/Makefile                      |    3 +
 drivers/mailbox/sun55i-msgbox.c               |  613 ++++++++
 drivers/mailbox/sun55i-msgbox.h               |   95 ++
 drivers/mailbox/sun55i_msgbox_kunit.c         | 1387 +++++++++++++++++
 drivers/remoteproc/Kconfig                    |   26 +
 drivers/remoteproc/Makefile                   |    2 +
 drivers/remoteproc/sunxi_rproc.c              |  855 ++++++++++
 drivers/remoteproc/sunxi_rproc.h              |  124 ++
 drivers/remoteproc/sunxi_rproc_kunit.c        | 1314 ++++++++++++++++
 14 files changed, 4797 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
 create mode 100644 drivers/mailbox/sun55i-msgbox.c
 create mode 100644 drivers/mailbox/sun55i-msgbox.h
 create mode 100644 drivers/mailbox/sun55i_msgbox_kunit.c
 create mode 100644 drivers/remoteproc/sunxi_rproc.c
 create mode 100644 drivers/remoteproc/sunxi_rproc.h
 create mode 100644 drivers/remoteproc/sunxi_rproc_kunit.c


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.53.0

