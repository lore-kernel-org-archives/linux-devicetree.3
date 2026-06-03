Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F512FDC28
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472575; cv=none; b=I3lz1REVYKUUjkNpaSnzgRgBSHDcoAjPqxqAoE+0e9mdo8ujFulwyJvI0HNlNo2eAVVdAqsZ7WaudFS8NtKoT7KNqnKtZ+DnBp9nipEX3fvO+VnDtvW3OLxIQkoNN45jSUIkStzcqkJOUOp3G6U2I+2g0QwcfLFYft5eCV9vKH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472575; c=relaxed/simple;
	bh=lVwBtt2edsM+1ehwihHjZpx4f/tEXrJc1FI0USge3Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uu+HW0fhzc2WVUdoqBpHAdElB6MwlLqpHKWEEXfIRQEYFiV4gfA903loSVf8mb4x9Jw/iatNkeWaJJuy4L4TmNAVu2g2NvT36a9mRurarOqJXlXaX9ms3ZtQ7wG4ff4g8nei4Odwfkpr4bptKuFn59RVE9k/ypQ6ZjbSX0qMLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFL+k1FX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFL+k1FX"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84230ab8857so1757584b3a.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472573; x=1781077373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Ocb0IlKQtOhGIBO9a9pzudmO73jlwJlFqSOEA/XxvwU=;
        b=oFL+k1FX5/DBFSItg2RVUcli3/cC+SICLd+vTqUxTFfaUZOVrNhg8PK0R7ZwMRiQeM
         6ZPg4tpyGohltuzWJOdHza4oFr9RAadAW+47rsI7QCvuYpBajZI9FLVRbD43uM9+OFit
         /ZAXybVzy/HUpFx19sKHu7EwpWQAJkW9qZEkcq3WchH/IM1nO6TSB6JvqVASsXx79fPW
         KIZx0kYHzisFxGqL2KkF0ymgdqs5LWqiQXDY40rn/viC+Ri8Qhwsaf5ZnXSKo3aiu+yn
         dFOVGCuVPAb1HK32L4jQ5avxl7H6xevWjwuekyGH/1TieCv1HPoAwjF6VVZRboEm6kF6
         /Csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472573; x=1781077373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ocb0IlKQtOhGIBO9a9pzudmO73jlwJlFqSOEA/XxvwU=;
        b=OZfKdUcwUQPRpoVIFn4C1slLn8nxU0Ql6KjXxFHJ0XcP2MXiXl+64bS4xMZOzItuXF
         rnMakYKUfnGYJ/LGWdYyW4mnohVgSkj9pPqMa1N89K9jm9ymZukVO8FCVVkMdql5EO/F
         wpZZk3clTsjoXpl0sR0b8i+G7XHdxVG/X2smKm5RE4Sdu9Q/PvwvvbBVbnXf+rC0rYVV
         7x0MN5JVczHNE4kpa7lH5AWptxoB6nc4yEh5zVlh445B15IKMRSjv4XoVd8cFv7LLaTm
         awoj08Z9Yqw5wF4975csMHortxmsCOyyeMJJ6Q99pc3Z27Lwq3u+RmzGp54scoJYdYKV
         Kj+g==
X-Forwarded-Encrypted: i=1; AFNElJ+PjbRsB6v7KQ+1FhGLNSGKtw/euUIKt2aLybFyZb7kTe3vEI46pklMy7H2E39Wi+xPvpSNw1gRQseg@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUA1fkOio4NhvUiY7k/w09V/Vkwgyr6NtGGBuflVXYw1N0+FU
	MKW1l/gs+KXL+949BtnIPgQcaN/nPFYQEYzOAHpAXw4QN7RlsDrzH3Yg
X-Gm-Gg: Acq92OFGxiQudAKIuM2OEDMY0Q/kdkhJpCo2vB/qWAqPgAkBxaWSnK1zrnRY3HHTg2S
	rqRfvhSy7pAcUBPIJhlfAJ8PhhFc2y5oRkKZ1pYEZ1hqRuvwMpbdH4FRrmdOmBKj/0FsneDQF29
	ubaUElWrTUe/4DiO0uJ+ds0RKg8sn3FiHZDCzhmSij9FSAWIA5mR/GPPbktWzXMBD1bnU9JLM7O
	Rgxw/eH68Uv+AMHKJuDmbhMzR5bJON0yXElaNJ9+80eil3v47o3FPDcAi/EB9JzRzT0qmOvPBOn
	sM9ugnxQVNIQ3IaCy7hotnSBa5/GH31SmFox+6q85xByHIbgq9VS0KK2x2RmUcVN+5fwwWqEbLS
	E+J4qGNnkRmvbn3ZM4cOhHmEWI3QO9Y+fnmoGRHn7ik95YPwAIPSWqbU/j7SGuslXzM0F9GtafO
	hfXZ+V2V/vZ1sEibvu6eWOvuhHMKypMD3mNhKbfVF3v9B47xM58NYqKbdr4xob6yXPBGP8hcjpn
	tp3TqQN6EJzCgph69LDhbLp+wTzhLc2fmF+1DgC5WAlzFnuWsU42TDUXtll+SNj
X-Received: by 2002:a05:6a00:a222:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-84284e932eamr2481464b3a.27.1780472572742;
        Wed, 03 Jun 2026 00:42:52 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:42:52 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/7] riscv: dts: tenstorrent: Add Atlantis platform
Date: Wed,  3 Jun 2026 17:12:12 +0930
Message-ID: <20260603074222.593243-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The series adds a bare bones device tree with the CPU, interrupt
controllers and a UART. This will be replaced in time with a full
featured machine once details are available.

Patches 1, 2, 3, 5, and 6 add compatibles or extensions to existing
bindings.

Patch 4 adds a new binding document for the aclint timer device.

The series has been boot tested on QEMU[1] and internal development
platforms.

[1] https://lore.kernel.org/qemu-riscv/20260603065859.592063-1-joel@jms.id.au/


Drew Fustini (1):
  dt-bindings: riscv: add Smrnmi extension description

Joel Stanley (6):
  dt-bindings: aplic: Add Tenstorrent Atlantis compatible
  dt-bindings: imsics: Add Tenstorrent Atlantis compatible
  dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
  dt-bindings: timer: Add RISC-V ACLINT bindings
  dt-bindings: riscv: Add Tenstorrent Atlantis platform
  riscv: dts: tenstorrent: Add Atlantis platform

 MAINTAINERS                                   |   1 +
 .../interrupt-controller/riscv,aplic.yaml     |   1 +
 .../interrupt-controller/riscv,imsics.yaml    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   5 +
 .../devicetree/bindings/riscv/extensions.yaml |   6 +
 .../bindings/riscv/tenstorrent.yaml           |   4 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   |  52 ++
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  31 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 470 ++++++++++++++++++
 10 files changed, 572 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi

-- 
2.47.3

