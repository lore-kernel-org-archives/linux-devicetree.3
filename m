Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589982;
	b=ZpLKac4tPaqrfIGZFP/2VLnmXODVLQDrujr+f1ANbbWOrgj3akgtXRGarrfnRgjRsq9f
	 0pLdX0s87dZMH6TlPALthRqEjnwpcl1jNmqAFqBhePCX3DWie1OoVZgsF55hEf2xhfXly
	 dPqDYscTUtEsIBHRMaxcPkBdaiJfRfS0wYyHyCFN287qKsGcMt6hY4TfeZ3fSvuwrZBlT
	 x1bmcR03nU9+Rb78UNR8hn8arO7TibAlbKp3Xqc9Vk4r+98bN3P8UVz9cjuhouGf2quYw
	 YESr/ufGnhZV8OAt0kMr+Db/8yeoqXlOE7vvnoU0jyaWNgsSqwKxmfLJNpwTGR2ojHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
	b=pX0n9NXbKfbKd4p+emIBjQ2o7sKcYKVhryHGfRTWttKM7khtj11NWb8xaFwyRWhXIpPA
	 gX7oLfx6GEfoCo6US+l0wtv6cB1s/ABbeBSZ/mv0I/GBTrzYQ1IHfMne6HlFzRYbdNTB8
	 597otEMFMTGaI5GG96zgTHOMZWD4nzzFVNRCm2hqSnyVmttU2XcevBSmC3IR3foSVMlim
	 Jrg5bSrgxEcGcYAyQTJHrcvLxq49q6OAd2WbLLJ5qYyaEaDJOcNsSJ2GWNllH9EMmlS2/
	 gGFpbfLmgmkzbXABbKXjYryqX07IvJP/OZPiAXnqPA4VSqyPU+ynlwT80Em4n+Q3/dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=beWSRsR+;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D07B606A32E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D07B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=beWSRsR+
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so7915875e9.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794589980; x=1795194780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
        b=beWSRsR+VqdJyTYPWdf5XEDSKemjUDvnM8GyfLz2AjmY4trkDUwgg+AY4TcuaB7mOd
         7MUGZxFIns2zJr2PcbWwBH2JoPTPEuzVDGt7+3cNWGw6GhsTp0Z8ORCFT5JwwLebr27m
         Yy0QtYSfOZ1yEMvFUmzeIBHp5Y7DWTmeBB4G/EG07JqvtUr63VJ3Y/FonZbQyT3YxLsO
         of+uJP26OyltPErALHRfC+Dp+Oln95SEFT+eM+c7GLhnPUK2/4xQsVKFrO8kMPP0mQiy
         7Kq33vmXQOHIljyRTa226LliXXqqwRQx3DnT4YGfUT5f563q9Xjeh94pt5zBH6+c5nlQ
         jLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589980; x=1795194780;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
        b=O4VodVhXTGYPPtC7n/OtYR6AxjlMERfQXz86a0PDBdhd+sPJqs+gIgVDdbaslDx+fP
         65NrD4+iab7ybMOkKEb1YaRwlVHwGgn42+SCrBK04NjrG6avJLiTNx1DAd00ZZZCLGl2
         ZkX4I+KCcNI2vAalCUfXBFulzP/O2Nn9DkebRMI+s9ylA/QkBWrNsYm1+0njGIqXNHA6
         07cfvwKsEQ1ydkYtoXuQVt17kNxjJcFx/g5EPluSDIbmL6HRxh/V4mOcBhIEQ07SOj4V
         h2TIZJuZvxp/XEA+gQzX4R1iUHN9AT/CX3tSr/x6Kc35vvKSv+pQpwKDYo/HgBbuk1nO
         x6xw==
X-Forwarded-Encrypted: i=1; AL+hErHPqbHpLtTJBU2h7k1fAJRpY+0YceIRBg0SpdCsxCRh7LwiNxl0wIlV7GKpYvvkrmJqi6lmc0F36AL6@vger.kernel.org
X-Gm-Message-State: APuU4Z/eM5EujHTueBVDoW1e5tRsdPaga7isEuFl3DDReZFO1O/H3O1B
	XKLPZUlfTM2BEpO6JpDcG+W5R0eqYqH+FeCPcggt8P7Q26yQ8kjIvAb6JxMSFgXdiKsG
X-Gm-Gg: AYBFou3x9miVHOdaA3hN9hGE8rvxIL8ovACfDV86ig2eTvXUNRU6xcOso0+QFnToCd3
	x2KX2V66yBlPLUpSf63PP2pZiEurq5zAQBJBpGFLzA3xnMY7R6JLacZe5tS0Ve3TRu9W7gkrWZw
	SLjbJJzTGX+HjvAZ1X0GwKAuz8yMro+f0IWATTJ2uypy4CQmssL073DNKVUOVHQh4cxNwIjfQwi
	l1Bzvrltvf7lqWFn4QG4Fn09wlzS9ufiCBvJ+zXOGY37PU5R791rgMKoO+646DRRECNNEMekNR5
	8kQ6hbXGJ5nTOMx3T+eeBoazYgXFx61hJlYr6RUuUvphzKQUQmpcNHNYJjQglXn7NKB2MPOWfuV
	fqstfD8uwRDczxlT0pRZ4ePT06yQPFA9P/0GU/AYzr4HS+pXulJBStN7n9h5CtntphodOkL/UCm
	oIxubuzBMPo6Iue24wVREB+zCm6oKiDreA72QNtwlXRZIZnii/LbED+NXkM5FZYOsufHGJphRqS
	H/P8rXHihZk9iWN7xmj9frSJQsWFXVmnvHTU3YiIw9EoS9r4r32PP7ti6316BqMurxrX9mmuqgX
	5PLsbYcYsEaFhU+7F3TeUW3NBWhWjlKAdQ==
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr77020185e9.0.1794589979643;
        Fri, 13 Nov 2026 09:12:59 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:b5a2:ed52:66a7:3ac7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6001643f8f.12.2026.11.13.09.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:12:58 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Fri, 13 Nov 2026 17:12:52 +0000
Message-ID: <cover.1794589639.git.jpeixoto@osyx.tech>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds guest-side drivers for the Bao static-partitioning
hypervisor: an IPC shared-memory driver, an I/O dispatcher that lets a
backend guest service VirtIO I/O for frontend guests, their UAPI and a
MAINTAINERS entry.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems (https://github.com/bao-project).

- The IPC shared-memory driver lets Bao guests exchange data through a
  shared-memory region split into a read and a write channel, exposed
  as a misc character device (read(), write(), mmap()). The channels
  are declared on the kernel command line.
- The I/O dispatcher bridges Bao's Remote I/O mechanism to a userspace
  VMM: the VMM creates each device model from /dev/bao, receives the
  frontend's MMIO accesses and completes them, with ioeventfd/irqfd
  support for the fast paths.

Changes since v5
----------------
All findings of the Sashiko review of v5 are addressed. They are all in
the I/O dispatcher; patches 1 and 3 are unchanged.
- A device model is torn down in order: dispatching stops first, every
  I/O client is stopped before any is destroyed (the ioeventfds are
  released only once their thread is gone), then the queued, in-flight
  and still pending requests are completed. The dispatcher is no longer
  paused and resumed per client, which re-queued dispatch work during
  teardown and issued hypercalls when BAO_IOCTL_CREATE_DM failed.
- IO_CLIENT_ATTACH publishes a request only once it has been copied to
  userspace, so a concurrent IO_REQUEST_COMPLETE cannot complete it
  twice.
- ioeventfds follow KVM: two of them conflict when a write could match
  both, whatever eventfd they use; a request matches only the exact
  length; reads, and writes that no ioeventfd matches, are handed to
  the VMM instead of being answered or dropped by the kernel.
- Matching a request against an I/O range rejects zero or oversized
  access widths and wrap-around.
- An irqfd consumes the eventfd counter when signaled, and deassigning
  an unknown irqfd fails with -ENOENT.
- The I/O dispatcher is 64-bit only: the Remote I/O fields did not fit
  the RV32 hypercall registers.
Also, requests already pending when a device model is created (a
frontend that started first, a VMM that restarted) are picked up at
creation instead of waiting for a notification that does not come
again.

Changes since v4
----------------
- BAO_IOCTL_CREATE_DM requires CAP_SYS_RAWIO, is refused under lockdown
  and claims a non-RAM region with request_mem_region(), mirroring
  /dev/mem. The notification line is checked against the interrupt
  controller and requested exclusively, and its mapping is never
  disposed, since it may be shared with whoever owns the line.
- Requests that cannot be delivered are completed instead of stranded.
  The requests handed to the VMM are tracked: a completion only
  provides the value, and a VMM that exits leaves nothing behind.
- ioeventfds and irqfds are bounded per device model, and a device
  model id is bound to one file descriptor at a time.
- RISC-V: the hypercall status is the SBI value (a1), and both drivers
  depend on RISCV_SBI.
- mmap goes through .mmap_prepare and only allows shared mappings;
  .compat_ioctl is set; the IPC driver never unwinds a registered
  device; bao_ipcshmem.channels= is documented in kernel-parameters.txt;
  rebased on v7.4-rc1.

Changes since v3
----------------
- No device tree (Krzysztof Kozlowski): the IPC channels are declared
  on the kernel command line and, following drivers/virt/acrn, the VMM
  creates each device model through /dev/bao (BAO_IOCTL_CREATE_DM),
  which returns a per-device-model file descriptor.
- No architecture code (Will Deacon): the hypercalls use
  arm_smccc_hvc()/arm_smccc_1_2_hvc() and sbi_ecall() from a
  driver-private header.
- The "consolidate the IPC hypercall ID" patch is folded in (Andrew
  Jones), and the ioctl type is 0xA7.

Testing
-------
Built on v7.4-rc1 with GCC 15 (W=1) for arm64, arm and riscv (RV64 and
RV32), at every commit, and with clang 21 (W=1) for arm64 and riscv.
Run-time tested under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64
virt with the bao-demos demos: the IPC driver exchanging messages in
both directions between a Linux guest and a FreeRTOS guest, and the I/O
dispatcher with a Linux backend serving console, network and block
device models to a FreeRTOS guest and to Linux guests, including
killing and restarting the VMMs, plus a userspace test of the /dev/bao
error paths (privilege, region and line checks, duplicate ids, limits,
completions, ioeventfd and irqfd rules) run next to the live VMMs.
32-bit Arm is compile-tested only.

Open items
----------
- RISC-V: the Bao SBI extension still uses the experimental extension
  space (0x08000ba0), and the Remote I/O hypercall returns the request
  in a2-a7, which does not follow the SBI calling convention (Andrew
  Jones, v2). Changing that means a hypervisor ABI change (status in
  a0/a1, request through shared memory); the RISC-V support is
  experimental until then, or it can be split out of this series if
  preferred.
- Bao does not implement the SMCCC vendor-hypervisor UID call, so the
  drivers cannot detect the hypervisor yet; adding it is planned on the
  hypervisor side.
- The notification line is a line of the interrupt controller the device
  tree's root node points at through interrupt-parent; a guest whose
  root node has none cannot use the I/O dispatcher yet.

v5: https://lore.kernel.org/all/cover.1794038390.git.jpeixoto@osyx.tech/
v4: https://lore.kernel.org/all/cover.1790357735.git.jpeixoto@osyx.tech/
v3: https://lore.kernel.org/all/cover.1786010512.git.jpeixoto@osyx.tech/

João Peixoto (3):
  virt: bao: add IPC shared-memory driver
  virt: bao: add I/O dispatcher driver
  MAINTAINERS: add Bao hypervisor entry

 .../admin-guide/kernel-parameters.txt         |  15 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   8 +
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   1 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/bao_hypercall.h              | 210 ++++++++
 drivers/virt/bao/io-dispatcher/Kconfig        |  20 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 421 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 460 +++++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  71 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 186 +++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 475 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 184 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 359 +++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 330 ++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 421 ++++++++++++++++
 include/uapi/linux/bao.h                      | 126 +++++
 22 files changed, 3323 insertions(+)
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/bao_hypercall.h
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
 create mode 100644 include/uapi/linux/bao.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

