Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175067;
	b=xMEYkJOIc7VIemMJXKDd8utiXHJiPSA3bKgSemxhxzyxzw4lcdtI2bEUL05YJvKD1uiV
	 8rAcxsQeHqxUbmN+1LnNf6MkucoT/KBbbGFkWzo/rGqnOxPMlcCm7L5OYCFdWTaCPq3v2
	 3n6d77++Asachrhz5VV8d+V6SmAwH8XFygiqUMEo/mJrPundvP2qYRxUt86zNhNvKoq5P
	 mraxxnQABzMTGbpCZ/SMCnc4GQiQNmzFrxDPdmD/2y7zxhhXo7ax1z74LcqOFE/FoFK8u
	 ldJyh6WbKVk1RjFzqasNVBpDjjsoPBbix8eK0qsOzyVGXpESk+Y5aB5bMCGU7sKii6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NEt1lF7lxMBZfEDAydvjStbcmv5IqrrXjrjqRLLY++8=;
	b=D5hd6Po1dOLfXxYnJuUIGgAIlsyN36JoCoupFipmLMlSex3Ci3WgjvLTsBC7Jvkv6l9g
	 6oLvhCS8CTNN7/Mwq9L2q3Vzq81dVFOor2MMun9KDP9YWcCe/J7ZlXD/aKjAFujmab2jk
	 V5q1rZW94HLf62syqT+xSVKkqYFVLfNnFGuGsAX4v71ZpqbRrJeVYlP3LTlHMQZBLydjn
	 l66YesrYcSdBguqEUgVeWlC3eSn5ynPNI7HP5QzzG/rmS5HUiR98rxVp6lsTEZULaXd7z
	 2ORPPlYMn0PqE1TkDaFxLgJFDPdpMdrSWyRz8Z9TjgWJrzn7eGAZJPS+EKxEBZ53oTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIWUbUKR;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B55606A332
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B55606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIWUbUKR
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso163180a91.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175066; x=1794779866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEt1lF7lxMBZfEDAydvjStbcmv5IqrrXjrjqRLLY++8=;
        b=zIWUbUKR/SgteTooNkhndFRULR3qfUVIFJB39sHl4Bcp9kMrSa328FUtlTAFTWESfw
         vn7qL0obvVnpGHrGSnHYn9EwVVvu4sX/QD2favCLrxh3+ZzqzDYsuewcd2e7yimDk+IH
         2YT+Vir3pSmfGuMuxZVDN8/ueMYGuAiflE1AyY5saPVBplx2nzrRSNjEIuANTw20KNf0
         D7uQ4KkPEWd34Xu2PSyqHVQX1PB1MV8r2orhgsNjsGabSE9FG9tQLhW6EWw9CvSiJyNV
         t2PiIGrOgExvCyfjEAcqcxDol9pO/3ItFOuuCb27KyKNxx8dmd5XTPS7QSy22oqahk0d
         zvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175066; x=1794779866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEt1lF7lxMBZfEDAydvjStbcmv5IqrrXjrjqRLLY++8=;
        b=YTAKpiE8+saTclFEBLJS2Vlt/HFQmIFDLSAoYIvB0C686S/9lqGp+tRWB28eGSVzrq
         djVFYyG1zfq6wm+PWikp7MU3DMFElIDOPh8bPR7Koj1UCnJW0Dz5XQxg5Kr0B0hCva89
         ClXVM/vvDxJ7i3Yn7QKbQ8Yrt2v7DkRfcKR99cLYQ3GfQgGpCnJR9DB+k8ekMDDRckx3
         bfEvRKT3U6+Qjo/htN/y2Ie4CChW9rrmDhzyhDc7y/y6dH/uCYkXMlEdCn3SFASd984g
         mEkaM9cKAagI/f+RLt1Tz82/do+FF1ibr+JqqUm2fbR6UOvA5/Ht+ZPH+7VGdLDDm86A
         inpg==
X-Forwarded-Encrypted: i=1; AL+hErEQBFgn9Oulbh4a1sX/VNXkFgYEA5GrpYYq/2heY8CXg4XZTqJgoAWrS28BpprGFSZNBhCcUsrozb5V@vger.kernel.org
X-Gm-Message-State: APuU4Z9KY/fepw8zZPD4YHV4nsVlFJlOMIMPUwbahH0X15oVrweNoV01
	25FOJKHNqFyfchAl1jCI+Ds+NFacLuoxjA6vuDuVh7v+WyvJJ2uhb0dO
X-Gm-Gg: AYBFou1aF+tna/Zp8ix5J/oEtp9Ar8PCgolA/TL5oRJxWtZSs0mIGjBslktXN7B25VR
	rr8WpDjHpdTjFYewWO1qdZMC4k377nn0iKTZ2AdXiwzSGzj0LBojlNAgUdIWnaKecIrrSl3ih/X
	dOxXFT5Kf8Y+llVQoXZvYCywIxGsK8F9ACj+4fPtZs51NBgGpHB0qAKPmkE4OKBp/LNn78oKmj7
	gLjZ6I6Eeewqwjfr6Pa3Q9Wto83C08TOpNdHiAaY5feB3oAxPM8IWqYzepQydcPxPDNW2ecIhn/
	vH++XcSB7wy3b9uPuVXtBC4JW0qC8v6VQWhHhifWBW0zKF5YSqeMYRUsUERYOqqEn7fKy1lantS
	GCsynGME929nIUPRj4C7zeXVeG/2O0E3zCcgndEliNUofIoj1mI5QyiPRhiz5F/ScFvU+WWEb+q
	b7ZIBWl87fELnwP2IU6o0FY6WtRCUqQNxkId+bKL3Zn30Fyxu0cVwdYYYv2C5Qd5+I3s/IJ1fjg
	pMXYzykjgrjhZWiQ+jokfHgF2YZWyOGcyPL2GA7UR3nKTA9XsZUgA4ksOMt13Dm1R0SDH8tg41v
	WYUWYa5TB4vUrecJhAKkrb7L29wpB4qes5wGkIHbhFicLDsDG/oi+V5cctKmHkPJFHTC1XegNjc
	IJb21/9m2IV77vzGitNnjoBsXKvArdiwGwtfCq9AMbUqsz9pdnOGapcN8JArnZhK9IrmFTgV5OS
	6UKQ==
X-Received: by 2002:a17:90b:1a82:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3b12d31a3f0mr2278470a91.12.1794175066527;
        Sun, 08 Nov 2026 13:57:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm5692976a91.9.2026.11.08.13.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:57:45 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alban Bedel <albeu@free.fr>
Cc: Radu Rendec <radu@rendec.net>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 0/3] ath79: flush every write buffer of a shared CPU interrupt
Date: Sun,  8 Nov 2026 13:57:35 -0800
Message-ID: <20261108215738.113582-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On AR934x and QCA953x, the WMAC and the PCIe root complex share CPU
interrupt 2, but each writes to DDR through its own write buffer in the
DDR controller. The ath79 CPU interrupt controller flushes one write
buffer per interrupt before running its handlers, so only the buffer
listed last in the device tree gets flushed, and the other device can
read stale descriptors.

Patch 1 documents in the binding that a CPU interrupt may be listed
once per write buffer. Patch 2 keeps a mask of write buffers per CPU
interrupt and flushes all of them, and documents how the interrupt
lines, the write buffers and the flush fit together. Patch 3, suggested
by Thomas, starts the flushes of all the buffers of an interrupt before
waiting for any of them, so they drain in parallel, and replaces the
"It must be run twice" comment with what the AR7100 datasheet says
about it.

Patch 3 changes the signature of ath79_ddr_wb_flush() and its call site
in the irqchip driver, so patches 2 and 3 should go through the same
tree.

Changes since v1:
- Add dt-binding change.
- Add a comment describing the interrupt wiring and the write buffers
  (Thomas)
- New patch 3: flush the write buffers of an interrupt in parallel, and
  document the double flush from the AR7100 datasheet (Thomas)

Build tested with ath79_defconfig (LLVM, W=1).

Claude Code (Claude Opus 5.5) helped write the comments, patch 3 and
the commit messages, and searched the Atheros datasheets for the
double-flush requirement. I reviewed all the changes.

Rosen Penev (3):
  dt-bindings: interrupt-controller: qca,ar7100-cpu-intc: allow shared
    write buffer interrupts
  irqchip/ath79-cpu: flush every write buffer of a shared interrupt
  MIPS: ath79: flush the DDR write buffers of an interrupt in parallel

 .../qca,ar7100-cpu-intc.yaml                  |  5 +-
 arch/mips/ath79/common.c                      | 51 ++++++++++++++-----
 arch/mips/include/asm/mach-ath79/ath79.h      |  2 +-
 drivers/irqchip/irq-ath79-cpu.c               | 44 ++++++++++------
 4 files changed, 73 insertions(+), 29 deletions(-)

-- 
2.56.0

