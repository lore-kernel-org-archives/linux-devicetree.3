Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DFD3515C1
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088449; cv=none; b=lsNRes8VUOHEa3cweCixpujeN6mRthK0yTaNpFLNfmE8uILj8Nr1yY19sgRF8lCmPuriC3bbYDAvBa2u9QQ1/qQpmoGCZtxEHUoJIuFbNioiQZ3zNjhHDyuYaNF93UeE1cdsULe/D4u2Zd/GTxJ4raYE/4UoB8Kd689VBMr2ckM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088449; c=relaxed/simple;
	bh=yLlEJtUA4c+lx4MJarEGHOb+L+h2dwEqGLbgGSEeKdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fAoRtQVoKIvbuPLq521o1I5IzYorIQDLOawF0Bpeh9r3lzwuK5rJGh8Y4+PzmXxD3HbmKPfRl3e/UxhF9dVIIytaJoOPx61qCkXKvdgwMrht5wbR1gzcRyLv09FcEx/sbFjqeg9SHGbcCTJtDn/jwjLk18Y4r16nXqZnVOhv5Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=WexycwIf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="WexycwIf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so6834715e9.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088446; x=1786693246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZtlYdzWPfbUjT+3726P4tEkOyWdFs4LizgvGG0WnvQ=;
        b=WexycwIfQb4Vr9e6JAlRE5A2UPYI1M9X/NoURuwfeKuVWMYL8LlolX0gVIx6ipYqxu
         KqVW57YQtHscbnGtBdbujIk7aa/YUqRL+nYhB+o5lBjH0fOTTbqzSm3r28Yr1rKPlrv1
         O2Cn60M87aL2yPL4v7pMLC6uJByQANsZejo+nSCli1u7hv+EXxX8lB4oLIigmcyL9SJB
         1OYglJ+1fCNwvAQsAuJgB5K3BgRhn4KZHKZAd81SFTTDS7Ond6BpdHNJwni/wie1+PAx
         xaxcLEDXKP1Uoadc+3KbDtNiF8+Jepihn1YU0bQwteMr8lT99YSOs3Zn9DWVvRxvmzaS
         mV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088446; x=1786693246;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ZtlYdzWPfbUjT+3726P4tEkOyWdFs4LizgvGG0WnvQ=;
        b=hVebwkHRKeBqN383EfiK9WvlqWLr2fdk+vq+t1FkQkDc0d+g9TOLXlGNIx3hEE0tDJ
         EPFNdAQlwxaNGxX+IH+49isWdu3aRyWGnlqsGcd7iRq+WG+h/T34fR2sWb8l11ReT9Vm
         /4zIRK2UW85eg0KYwjWfWxqjCIx0rgy248uMJOCVDQWIEqxYyWItr5+jI+TjT+/+okqI
         V+ioEuTTQUqN1YbKJ/I/Cz8tLrv40qVjhUOnzwx61NBg/zHQUK9MaAtM/RzAQcydpL7B
         x4whLvF0ndp1RI8iBcixXv3rLPKY6AP5c+IWYDN9UPb4d0MODyv+eDYeUS3tkJfIsrkB
         i7gw==
X-Forwarded-Encrypted: i=1; AHgh+RrV/YnNaltmRzoisaQJidBQwE1KFVV5hjHIUTgDh+SHDcU3XXchZr98tw/j5BPxW8Lq2XyD7yHyVQMn@vger.kernel.org
X-Gm-Message-State: AOJu0YxPV5OwUaxvwfQ2tUPIrg6UQh3kJm+ytZnJ/0lKCHEFJziVjwVP
	4Q/B9Hm/uqCRCbyf9ohpCrtK6jdPxTNg/kKMNmjwOQ8rdIMmZKiKLvuehhHSnIpBwOUK
X-Gm-Gg: AR+sD13oF+sczBxObyBv0zERtFkqgH/1Kt+c0Zzz6pHmoL7RW4eiMG7iZ6SOpDPhiV/
	Uaxn+iZbugdcwxdpiPIX7LJ5hx7KWRSQJs71nkHFUtiIRg7vNvno1s0YM+31bngeswdHcnM6aC9
	6l+ucuvtc455FQPw4MDsUNywJgUWRU3IP+kHdQYrdLCaqnekkdJIbOyuXWbCl5f15+sYUuWlHhA
	kqN6alKzbB+vGUR9fMG8F9TdUD4UqljzadZRdj98y3VPZtFXsJB2F4nz7TOKi4KSHHZDu7LntM5
	6/KBAEveBCrUG/H92m2usJpBc48zztzoKK2GZfhHJ8JjjAQuk2F7d8KUL/e396aYEOFwxJ9f3FK
	eBHBOJfSu4R3RAsuFdtgOZOPyFvyzlJPZ9sjYUTlhTBkMc0FFz3QqRZChHdqUPF9wU/ZVgScLoR
	nELKgulKS5FTfyeSyINqb7vRsV4Yg4JF7ESIvnidZBlJnhZPF1LIZ2f3ChxaYFMBo=
X-Received: by 2002:a05:600c:1f96:b0:496:c249:dd9a with SMTP id 5b1f17b1804b1-4994e71364fmr248230245e9.3.1786088445905;
        Fri, 07 Aug 2026 00:40:45 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:40:45 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 0/6] virt: bao: Add Bao hypervisor IPC and I/O dispatcher drivers
Date: Fri,  7 Aug 2026 08:39:27 +0100
Message-ID: <cover.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds guest-side drivers for the Bao static-partitioning
hypervisor: an IPC shared-memory driver and an I/O dispatcher, plus their
device-tree bindings, UAPI and MAINTAINERS entry.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems.
- The IPC shared-memory driver lets Bao guests exchange data through a
  shared-memory region split into a read and a write channel.
- The I/O dispatcher lets a backend guest service paravirtualised (VirtIO)
  I/O on behalf of frontend guests.

Sent as RFC: the RISC-V backend uses the SBI experimental extension space
(see "Open items" below), and the device-tree bindings were reworked in this
version and would benefit from another look.

## Changes since v2
- dt-bindings (ipcshmem): describe the two channels through reg/reg-names,
  drop read-channel/write-channel and the "id" property, use a vendor
  "bao,id", and use a generic node name (Krzysztof Kozlowski).
- dt-bindings (io-dispatcher): one node per backend device (single reg +
  interrupt) instead of one node describing many devices, modelled on the
  gunyah/Mediatek Genio bindings (Krzysztof Kozlowski).
- io dispatcher driver: one platform device per device model (/dev/bao-dmX);
  removed the global DM list, the anonymous-inode fd and the dispatcher
  indirection ioctl; fixed a leak and probe error-path bugs; initialise
  virtio_requests_lock and the hypercall context fields.
- ipcshmem driver: derive the two regions from reg; drop the success print;
  do the range arithmetic in u64.
- Kconfig: fix the help-text indentation (Randy Dunlap).
- style: unwrap the few-char line wraps; the IPC hypercall helper now takes a
  single argument and fits on one line (Andrew Jones).
- riscv: use BAO_SBI_EXT_ID consistently, document that it is in the SBI
  experimental extension space, and drop the redundant ecall input
  constraints (Andrew Jones).
- commit messages: rewritten to kernel style; the "consolidate the IPC
  hypercall ID" patch now explains why and covers the signature change
  (Greg KH).
- process: sent as a fresh thread with this changelog, and the mail setup that
  bounced v1/v2 is fixed (Krzysztof Kozlowski, Greg KH).

## Open items / still under discussion
- RISC-V uses the experimental SBI extension ID (0x08000ba0). A permanent
  implementation ID must be registered in the RISC-V SBI spec before RISC-V
  can be non-experimental; hence RFC.
- Whether the Remote I/O hypercall must follow SBI chapter-3 register rules
  (Andrew Jones) — see the reply on patch 4.
- The "bao,id" property and the "bao" vendor prefix (Krzysztof Kozlowski) —
  rationale is in the bindings; alternatives welcome.

Link to v2: https://lore.kernel.org/all/20260107162829.416885-1-joaopeixoto@osyx.tech/

João Peixoto (6):
  dt-bindings: bao: add IPC shared-memory device
  virt: bao: add IPC shared-memory driver
  dt-bindings: bao: add I/O dispatcher device
  virt: bao: add I/O dispatcher driver
  virt: bao: consolidate the IPC hypercall ID in include/linux/bao.h
  MAINTAINERS: add Bao hypervisor entry

 .../bindings/bao/bao,io-dispatcher.yaml       |  58 +++
 .../devicetree/bindings/bao/bao,ipcshmem.yaml |  59 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |  13 +
 arch/arm/include/asm/bao.h                    |  60 +++
 arch/arm64/include/asm/bao.h                  |  60 +++
 arch/riscv/include/asm/bao.h                  |  66 +++
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   2 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/io-dispatcher/Kconfig        |  16 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 349 +++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 316 ++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  95 +++++
 drivers/virt/bao/io-dispatcher/intc.c         |  64 +++
 drivers/virt/bao/io-dispatcher/io_client.c    | 401 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 181 ++++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 323 ++++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 314 ++++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  10 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 228 ++++++++++
 include/linux/bao.h                           |  44 ++
 include/uapi/linux/bao.h                      |  96 +++++
 27 files changed, 2777 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
 create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
 create mode 100644 arch/arm/include/asm/bao.h
 create mode 100644 arch/arm64/include/asm/bao.h
 create mode 100644 arch/riscv/include/asm/bao.h
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/io-dispatcher/Kconfig
 create mode 100644 drivers/virt/bao/io-dispatcher/Makefile
 create mode 100644 drivers/virt/bao/io-dispatcher/bao_drv.h
 create mode 100644 drivers/virt/bao/io-dispatcher/dm.c
 create mode 100644 drivers/virt/bao/io-dispatcher/driver.c
 create mode 100644 drivers/virt/bao/io-dispatcher/intc.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_client.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_dispatcher.c
 create mode 100644 drivers/virt/bao/io-dispatcher/ioeventfd.c
 create mode 100644 drivers/virt/bao/io-dispatcher/irqfd.c
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
 create mode 100644 include/linux/bao.h
 create mode 100644 include/uapi/linux/bao.h


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0

