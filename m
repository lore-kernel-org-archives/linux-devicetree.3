Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC5D3BADA7
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268743; cv=none; b=fWEb/wkfmOTFq5sFSybY9OhuSxlroc7LPl6Qm7nMVe6aSuP7MvVJU1JT+ao5IMpCZ2pdKRYew6o0hAB5QBGfs2enGdyXdvxISfKvA+GkY3l1S5BPqJBUP9O3wvWUwLx6hdU8+usxOeKFanTmFIHTR36dvuCiOP+NRL+K76RCydM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268743; c=relaxed/simple;
	bh=VdYMZfmdWGinCscf69KLX3fpX4Qe2QiLkBtyEy1U2/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulJ72zR4WTD8S2dBLF3DT0BUkD47QGRfSPMIZKP0MK9GBUMRA+9+5G28mmAwotFYmqauykHBpoC0lhqZRHL9C9dBK6Y9Fu6/JFLQajA3t3ZfGSa9Gli9dwsqh9028jpZ2xXMpyTYHzo+xL/cxIDoh3Q2eo1qvSirX32ApJSz0w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtooWC93; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtooWC93"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82f8893bff3so2117249b3a.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268740; x=1779873540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxzEWL1R2sDou1abx9yR2WoOGdqqnaGEsR/cU7KUoPM=;
        b=BtooWC93+hQlHYWDD6xoXSp5cU10Z4Bo3OLd/OqQBEGxJyR2GEUFsqT1WZYYgLsWny
         64NUzVAnxIp7SCGa9vIKPGD0PiLf6KSHWert9D5coQXC/zibtHOr9pH2gxKWgaLx4avR
         xdO9JUslEEeOMsPqAUIgxA2BUwmpEMiderzC1JqvDJpW/QTQplBMvER4I68LhHcdThrs
         C3gOtTZeJdO4iKGx+y4vbHs2Hy62LWHy20WK+N4TF5Lu/T/5O/eDJSCTD4iTqTM21w25
         dj0xVcU+7gVcJuAgxs7IGSjLo/Skvv0ilG99KoaEPJVAT/iC87d7iDRYoln4/hl0Wu6f
         xV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268740; x=1779873540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxzEWL1R2sDou1abx9yR2WoOGdqqnaGEsR/cU7KUoPM=;
        b=WeaLMf9Vf9ScoDgPcXWScnP1sBbzXgShC3WW0jdcrGFvfpsZQzmRRrSHxiKNI3sP+L
         HfPLILoY45+gKJKMZNfehAtinQ4t8UHvDqunoPGIsXNTXaPWO9sC98aX83WwR6HvYyZy
         uwY8p2mWDXyD7Y+MwC2PM1AfU9Dw7Z3pY6Gmcn+ozcyr4jSPJCUkgCUIGS+4jiuwzlkx
         3WmPns+7M/ewIUeaZR4Dzi5+dUWxDslpcNwGhvf1Fe0klc/znOAlyj3CgXRkwlPNOy+6
         mE7VmzqYGdxSs1p5R5+bt5o3hK6hOespvpqW0vt3LIQhjvh2jIBMVOy0w7lRpqDQii6S
         9dwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FDTc1c8VDxJouQrtNDBu8+mSgqoRQ4dv50plSt2U/8LM2C/RLkiX/HfHoY69Bd8NANfLoJrLfrXlF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07AHR1dPXB/f35brJzfS/42sGZp8UPWbW93+MugM3CEIUEttH
	c/aBbA/gHAPit1BXX9faLsybmWTyftQ9cegL1aulwkNj/qF7NgHkMCyh
X-Gm-Gg: Acq92OEg+N3IwmZ4P/mjWfleQQKMeSVYrZsMOr7Da7WzuArGPRwDTVGZ4BH5mxjcdry
	ZrAQTrAMclyUAhP5dK2aphkiuivV5/M2YzC+BQ1WwPlD4hWXobbmnA/o/73JZqxq3nA6Jtu9C31
	HHl8tm/+yQsoCj4qcrIMDvgdHvg7mTLT74nSM49CbEXSderIXQGZJDyKPqc7zz4fZTsmxkAadVN
	LuaQ0XzLc/L6lsCo2+bR4WPSvnQQqHxPl6OVoZc0t22J22irao0QXBUUNajSeOCIhb8V/0GFkVZ
	88r6BLqinJBQtmSkO8aaVorlsjgxPQUrluNQAlREFtb0EgppnKRQtvRgLLB3Gfl+NRy6stTK1cv
	NLbViicQp4UmSdNeEj1s9t23UZvOb9FpUo+Eh1a78zcSPCYKRPPOLejMD5xUeaOZ4L/mgD4ytY4
	rQ/hV5tfnah93nyLlYIchJ4HyxYE1T6lsclatHBQ==
X-Received: by 2002:a05:6a00:2c95:b0:82c:e816:4135 with SMTP id d2e1a72fcca58-83f33de9724mr22532227b3a.47.1779268740373;
        Wed, 20 May 2026 02:19:00 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:18:59 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 0/8] kdump: reduce vmcore size and capture time
Date: Wed, 20 May 2026 17:18:36 +0800
Message-ID: <20260520091844.592753-1-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the vmcore size optimization series.

The original v1 [1] contains two parts of work:
 - Bug fixes and small cleanups about reserved memory.
 - A vmcore size optimization that excludes reserved memory out of
   vmcore.

For the convenience of review, I have split it into two independent
patchsets. This patchset focuses on the vmcore size optimization.

Motivation
==========

On SoCs that carve out large firmware-owned reserved memory (GPU
firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
those carveouts as part of system RAM even though their contents are
firmware state that is not useful for kernel crash analysis.

This series excludes /reserved-memory regions from vmcore by default,
and also for /memreserve/ firmware regions. The corresponding kdump
time has decreased, and the vmcore size has become smaller.

v1 --> v2:
1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
   feedback [2], v2 drop that property and exclude reserve memory
   by default.
2. Split some prepared patches from the original patches.
3. Address coding-style comments on patch 5 from Rob.

[1] https://lore.kernel.org/lkml/20260429065831.1510858-1-chenwandun@lixiang.com/
[2] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/

Wandun Chen (8):
  of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
  kexec/crash: provide crash_exclude_mem_range() stub when
    CONFIG_CRASH_DUMP=n
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: save /memreserve/ entries into the reserved_mem
    array
  of: reserved_mem: add kdump helpers to exclude non-dumpable regions
  arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
  riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
  loongarch: kdump: exclude non-dumpable reserved memory regions from
    vmcore

 arch/arm64/kernel/machine_kexec_file.c     |  6 ++
 arch/loongarch/kernel/machine_kexec_file.c |  6 ++
 arch/riscv/kernel/machine_kexec_file.c     |  4 +
 drivers/of/fdt.c                           |  5 ++
 drivers/of/of_private.h                    |  2 +
 drivers/of/of_reserved_mem.c               | 92 +++++++++++++++++++++-
 include/linux/crash_core.h                 |  6 ++
 include/linux/of_reserved_mem.h            | 15 ++++
 kernel/dma/contiguous.c                    |  1 +
 9 files changed, 136 insertions(+), 1 deletion(-)

-- 
2.43.0

