Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770461;
	b=e0z8RiHAtQmdsaTk0su5WCYz0T4VtT90lE1bY9TDgNbiGWqlBEI8nhcTVZ7z67iJhHN7
	 HOqkd7sade4Gx82kkwzF1RQXhkz7j7CmcX38ChTzICYDQJkuajp9iw6yYL8wsA+t9ip0l
	 GAEA4lKj4TWWZKbD4i9yuj0E9CvapWvOjoQSjIoVImWgb6lp6JGleSbt0+6FnTE17Zcb1
	 IOP0ZmOP5b0XtBiOvRsHgry4JBKXN7HmP9122S0w3EESclRzLMyGr+zr6/Jk7SRQ2RQ4j
	 wVHrXt0lRXFANvEl8p0aUNa35BFrGFvcY8amTPEYnVnQGO9yV9ByRvrzFn5NZyLenDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
	b=IM6N1YnnfujBLQi77nhvj0Jr0K9jgif/YzH//7F3u7C6xrYfG2tFdzHvcn0DN0ChERWc
	 NFvQ6cxIO3IOvXBQLlQwQpmPtuFHnkKdFfY2zwPrMCk1QeA5hRAXXjhJvXRQK+2O8j6q6
	 xEHZnQZ5UkZxOYeul/wC4qu6PbliJ0Q3w7ALuS3yYJ44sp7VMtJ8zRBJgn2xqiFamvS9Y
	 jXN5qwuoTQqbuaOmsRz6FVHbKXrvSqI1iEdDLUgwjx0NGhon5x/xXibxTiBT067wXhUcy
	 P07/GQkTRHfnXec33+Kj+C0tDkIcP40qVTyMeNvIggGQBHpeFkcdJ9CW2tZKqITkbEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KR4o5Ikb;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89993606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89993606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KR4o5Ikb
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3d125637aso1562250a91.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770461; x=1796375261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
        b=KR4o5IkbFqXGQLoyIT1YW7kELm0gIp6fQDtKjiSiV1p3o4dMubtE2rhPaPybBy0ytp
         674uHRbS8W0e+MjvSUR/LUXRedWUaU7lh7RCluwBYMXS+Wjr5sw456/UfD/zAYlFNLpM
         2DzG+BGnxajEpVbWJXbgAIdR1x6AZX/wSC7vB5c83YuhtHmkQF+/42jmMuwtWa7Zz69f
         pgZxTjfNxGDtsk2+uCNdZO5O4KjOLIkz3dEqToxl1EokAhcEdTk4ME82oz3tMUQYZJLb
         T+twsmqpm2zNhh9bS5W2Shbn7iB7jHJLTJBiMHBA0EJIR7mFcf9u1o8ttDDTJIu2zPbq
         ZfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770461; x=1796375261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
        b=tqeoaZbBRv9P5YOTO1xSNHqeKc63hbFmC88UavUyVA62HNzTVXrM7l5h5C/eeADWX/
         FdcgW+O3JLix2bj8OtwpbMjr1sZN6DJhXIbpBc5dyBcBgfMw2OTeZfqhqOM3YMPBDcre
         tMSH0EdHymiGo2Wlala0EM6zsYu1/APAwC7F5wmjCT2FIsoH0OLg85M353Op70rrL04D
         0IwAiZP6g8QnJcAunyHK1dWhpYUq0yOrWbrBWjoDVEHX/TvxKuX0z0gMqy/qAwg+m1eR
         pPlp8BSEKz8+DDvBgWTmbKtVqVcnn9aT16mL+84/eMLCejXCo69Hty67HKcOmV+fFPe3
         qghA==
X-Forwarded-Encrypted: i=1; AL+hErFXmk2wo+hqs5HZn1lg5PDN9IcXVAMteFRpdb7Cjof1GJT0W6Z/0NiMAYej5NAA5MrYd5yXTm7eorA8@vger.kernel.org
X-Gm-Message-State: APuU4Z9383FkDtWdgVj/qHLI7tYC7GXGdxwd8JYlXoJB+BDPfpBfvkgU
	FKz4xnER+kdQ99yRywDeftGxVOEW3xv90PtIV3+94AcZmUJIiTStI5bb
X-Gm-Gg: AZFdTZdFipNXOyhmFJkP2/duzOk9HgJzaUmEntIekRYNh+AZ10VdW6a3/s4nHi/+EWO
	eknFVMIRoMVmFFQH84BdovQNvMRVNSqJvJ2B6GCAKUbJbxa7NBo2sr1nXjR+rRPoGlrkWyv8oVK
	0JlkdnouitcjDBh+sguCl2EPvrCNbhaBMBvbA+3L0FwwbaPMgGLYhx4bjk2+t9HDjMwFKiAy7B0
	plI2d7Ht1/KE6ah5gBCzcwYFs8w+TTVbCnVURP3c8qtETSGHA1PCxo142yk6oU+L3ERHzJOCeUO
	EX51UeWY3txMqR8b1J/g2pIHBVO/L7F35QT/y19XLrTvO+hKeB2a6E/WkhHf+5YmBpXRb3ZKI4x
	butV/UeAEFVIgVziU/2fh+PDgfSMS23H1jeVkz08KLkdm5+aXDwnd+kG6HZGHtynIWE9nkIcsQk
	DXRlv7WkQAublVVO5yZrcp977kp+fEFOnrMP/G8BxzmatMlaGJCF/I+LjVx9HyBiqW236SaUtfW
	3oghNA9NnjYYPsRqWEX0AYtxs4r9RwfIhkR9dN7IDMSlhmFx4wdDikU+715VnbWCNbcjK7D8VP7
	rB6TNjXRQ3VvrD1tV5tcxeez+4GheGIcgaCKR4RAtg==
X-Received: by 2002:a17:90b:5287:b0:3b0:d35d:bb86 with SMTP id 98e67ed59e1d1-3b41c8fe261mr23255612a91.15.1795770460754;
        Fri, 27 Nov 2026 01:07:40 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:07:39 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 0/8] kdump: reduce vmcore size and capture time
Date: Fri, 27 Nov 2026 17:07:15 +0800
Message-ID: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU,
camera ISP, ...), kdump currently dumps those carveouts as part of
system RAM even though their contents are firmware state that is not
useful for kernel crash analysis.

ACPI systems already filter reserved memory out of the vmcore through
their existing path: firmware reports those carveouts as unusable in
the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
(is_usable_memory(), efi-init.c), and the ELF header builder has
always skipped nomap regions; only DT-based systems currently fail
to filter these regions, which is what this series addresses.

This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
memblock to filter reserved memory on DT-based architectures. A new
flag is needed because MEMBLOCK_NOMAP can only express regions without
a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
so kdump omits them; reusable CMA regions are different because their
pages are handed back to the buddy allocator and may carry crash-relevant
data.

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce.

The series is based on linux-next and is organized as follows:

Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
             memblock, fold the duplicated per-arch memblock walks
             into the weak defaults, and serialize crash header
             preparation against memory hotplug.
Patches 4-7: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP
             flag, add a dumpable flag to struct reserved_mem, and
             mark /reserved-memory entries with MEMBLOCK_NODUMP.
Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
             ELF header.


v9 --> v10:
1. Rebased on the latest linux-next, which includes the
   reserved-memory rework.

2. Patch 7: fix two issues found by Sashiko [1], by skipping
   the NODUMP marking entirely when early reservation fail
   and clamping the marked range to page boundaries.

   The changes only tighten the conditions for marking NODUMP
   and the overall logic is unchanged, so the Acked-by and
   Reviewed-by tags are kept -- Marek, Rob, please let me know
   if you disagree and I will drop them.

3. The remaining x86-specific race in patch 3 found by Sashiko [2]
   (Xen balloon inserting a System RAM resource outside
   device_hotplug_lock) is pre-existing, and fixing it depends on
   resolving other pre-existing issues first, so it will be sent
   separately.

[1] https://sashiko.dev/#/message/sashiko-outbox-181183@kernel.org
[2] https://sashiko.dev/#/message/sashiko-outbox-181179@kernel.org

An Ack for patch 1 from the riscv maintainers is still pending:
I have pinged them, but no response yet. The Ack will be added
once received.

v8 --> v9:
1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
   memblock resizing before it is allowed. SH supports neither
   CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when both
   are disabled.

v7: https://lore.kernel.org/lkml/20260922084256.1515554-1-chenwandun1@gmail.com/
v6: https://lore.kernel.org/lkml/20260902073116.802752-1-chenwandun1@gmail.com/
v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/


Wandun Chen (8):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/crash.c                  |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  2 +
 drivers/of/of_private.h                    |  1 +
 drivers/of/of_reserved_mem.c               | 30 ++++++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 53 +++++++++++++++++++++-
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 +++++++
 15 files changed, 116 insertions(+), 94 deletions(-)

-- 
2.43.0

