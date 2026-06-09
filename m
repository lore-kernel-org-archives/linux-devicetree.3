Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6540BCD0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010065; cv=none; b=qWmmzHJYclaM+t5R6hst9FTd3aFLoXlKb8OXNOK26NuyJYLTYjjywyMuvtieYHmcvnsCCVrjCvtvHYqaavtcYjBMR5SjFRTBwa6Crq3tBU03i/WFtA0EGdGMa95D2TVSiAYtMVCTRmeIiIEQ043q++Jb5BZVMfPO1l/IfvVvIgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010065; c=relaxed/simple;
	bh=4R5lSyELzS1MZVKrE6fIwHxPO7osaByze53UAsHBca8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=RnFjqZfXmly9so8cV6qJGa4192Dp0qYR1ejv68e/IkLmWyyieyDzm16Nis5LXX5VZIfBc+GO9qxcMhM001NinLYkKqOMift8bBUogzlcdLt6eNupQjBH1sIxZYuIE5Fp0gpUwrJAK2yztFE/oAf/utDGioiiZLW1zv6VQpxDeEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=akK8XGmX; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="akK8XGmX"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so5841691a91.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781010063; x=1781614863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mA+1iToTuolWzR4VNZJJfQmxeczHbXjnH8cwuBOXmUA=;
        b=akK8XGmXubqalUlDvUr6jvJBO/n2QrgekZ9uf2BFVVcSAlonP2wcTfPOG1k32QmwXA
         8mJASFVxCimODmter7HmDxpMtK6RoGVxhISWej6xvJThX5067ekM4S+JcDi4xNytTXBM
         OhPZ3o9iYgcowMwfrZU15h6lGK+3/rfBVdpNRHkxS0gBoWW7hwM/O3Fg6CQhfFenf/b+
         MsBT3b1IWZ5gLOY7D2SGfuOMZDJU28nPi10kDFCTY4fv+iW674m6hRTwbHFnv9XF37Vv
         TGnjYBWcwjhe9c3RnMeWAtH6qeslN/90WH21ec+7i6mObUCkjSYHxkJGeeQM/DiMF59L
         3qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010063; x=1781614863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA+1iToTuolWzR4VNZJJfQmxeczHbXjnH8cwuBOXmUA=;
        b=IaKaPxQHYEScCDlWD5uKAZVa+iiywCw1pk6qfyI8Lsi4yPaft27D3GVMu5ZaePHUki
         jQ21zJVmqqJb7sgf5rWg/AAfZ5yE7nLKsU3geXOjvKT0ZHP4ncnnJ6aZVpAzjv0O+zNz
         MDMBtq9Kjs9Z07O9BLmpQBlxlz88jAd61EY4QMvVjtcgjWo8039dPvQu/LT/a6WXFWty
         Ni9icMFe9Metu2qiNmKKyEwWsnJVUcG31XFVPdAdD3nLsgYeHd1Oe5+NhNB+XmuXEOl/
         +WwlPr/1W8cixJWQ4zpLVS1qiHQ+ULswBmJK26YYq2V4edejb95NwwU02TjSUjyknZZT
         axgA==
X-Forwarded-Encrypted: i=1; AFNElJ8/ECiuKAH7CZSSI9WQW538WrM2Tlj5Riltq7j1/ATyjLqvmt8F/GZHTBTyCJ7GWSFtK4gIulFUCsLh@vger.kernel.org
X-Gm-Message-State: AOJu0Yys1j8vUrwkDHSYR0/WvHGoYieVzs0SJbLTuHj65riwz2Y2mmiF
	fSa+dkcs2vU40nCgpBckUL5/21Pz+TQRe+KFSkvBCfy6/2ezuhDtS6s86RFbmDNp5eQ=
X-Gm-Gg: Acq92OHNGxmBuxYkCsaWNWsNfnGyeGkA8BlCJ3pNA7MowSAmh5FM3XhrmauHjPXOD2I
	wdJGOLDXudLBLCSP4keZ0qujSoU3SfG9m1yUrYcOo9GKBPb3Fh7SUjzkwzR8rBc7s223xjdFizM
	rt6CLxnxy21OijwS6Oa+tiQQ7tl93u8/nWJ8at0QCgHEFZr43CrjATKyBjAgQ/k3ao+ZUQA5VEd
	Tk2M+Jbr/fP7Sz21/sbWt2/2ddMhuNt7G0pzhj7F6UdBV0gU4GMKb+9zbqEsuFxD9joSLW0QKyu
	0VTnwGSfJZ/TZxInNJbp5slLYNlAd5XqPex84vvy+rHer60KrkSbDtOOEiHMaEZ7KlQOp9aYiKN
	SG4AQwZGZBheHkiktLdUr9oSSVUzu0q7x3Po9dNONW1A8ll9/WDtUbVdACnTxnNf75IoJ6cH27o
	UVx+UvF6qBx0eoER9K0QjogDecpe4epvJ9MBCpGmc9Fe36aEPFxCdfcJFrtUwhDJm3rvc=
X-Received: by 2002:a17:90b:5906:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-370ee344dc4mr21272633a91.3.1781010061860;
        Tue, 09 Jun 2026 06:01:01 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm23267889a91.4.2026.06.09.06.00.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jun 2026 06:01:01 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	apopple@nvidia.com,
	atishp@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com,
	conor+dt@kernel.org,
	cuiyunhui@bytedance.com,
	debug@rivosinc.com,
	devicetree@vger.kernel.org,
	guodong@riscstar.com,
	hui.wang@canonical.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	namcao@linutronix.de,
	nick.hu@sifive.com,
	palmer@dabbelt.com,
	pincheng.plct@isrc.iscas.ac.cn,
	pjw@kernel.org,
	qingwei.hu@bytedance.com,
	ritesh.list@gmail.com,
	rmclure@linux.ibm.com,
	robh@kernel.org,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn,
	zong.li@sifive.com
Subject: [PATCH v3 0/3] riscv: support effective hardware PTE A/D updates
Date: Tue,  9 Jun 2026 21:00:17 +0800
Message-Id: <20260609130021.99899-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series makes RISC-V track hardware PTE A/D updating by the
effective runtime state instead of treating Svadu discovery alone as
enough.

When both Svade and Svadu are present, Svadu is disabled at boot and
must be enabled through SBI FWFT.  The series enables FWFT PTE A/D
hardware updating on all currently online CPUs before enabling the
global static key, and enables it for later hotplug CPUs early in
smp_callin(), before they are marked online.  If FWFT setup fails, the
kernel falls back to software-managed A/D updates.

It also makes live PTE access/permission updates use cmpxchg-based
merges so that software updates do not lose concurrently
hardware-updated accessed, dirty, or soft-dirty state.

Changes since v2:
- Split the devicetree binding clarification into a separate patch.
- Avoid CPUHP_AP_ONLINE_DYN for FWFT setup; enable FWFT for current
  online CPUs during init and for hotplug CPUs early in smp_callin().
- Export riscv_hw_pte_ad_updating for modular KVM.
- Preserve _PAGE_SOFT_DIRTY together with A/D bits and rename the helper
  variable to avoid implying only hardware bits are preserved.

Yunhui Cui (3):
  dt-bindings: riscv: clarify Svadu boot-time behavior
  riscv: track effective hardware PTE A/D updating
  riscv: preserve A/D and soft-dirty state across PTE updates

 .../devicetree/bindings/riscv/extensions.yaml |  6 +-
 arch/riscv/include/asm/cpufeature.h           |  8 ++
 arch/riscv/include/asm/pgtable.h              | 27 ++++--
 arch/riscv/kernel/cpufeature.c                | 89 +++++++++++++++++--
 arch/riscv/kernel/smpboot.c                   |  4 +
 arch/riscv/mm/pgtable.c                       | 68 +++++++++++---
 6 files changed, 175 insertions(+), 27 deletions(-)

-- 
2.39.5
