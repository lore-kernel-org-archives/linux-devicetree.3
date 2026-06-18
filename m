Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421DE36A35D
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781765079; cv=none; b=tHCpfmbS/YAmYNBwGVOE90M438KjbAysKR0oad2j8qFvL1yyBy3/sbt8CE52UiGn/TMBBVqpIAUJqYpKiNmriaDJC/az5p7sZIA2zNpivfwsmBPQfTrG0cJFM6e+Ae9bdvxUKDef3ZkUBuZA0p88DMM/Lgz4qGgOMQcTU2PIUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781765079; c=relaxed/simple;
	bh=vb2doOziKNAuF8mUqqYwpJyqSHfSNJs4AeQxHK0WFrQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=aDDbStp6Wt4V61bOXgfIDtHNemYlkoe+JBrL4N9ifR5ZQKb9tuFpZNOki7CwXSyk7gObMjtM5Qk/hdiQUu5alukwpXWGe1cF+lejE11mzzug4JPcrySQC6ll3b5xPSJgyNPkEm8viA8tei3ACGa087lIhez96uAT63S8bA/VFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NPSkXrtY; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NPSkXrtY"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so224794a91.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 23:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781765078; x=1782369878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dbk1I0aDC1Yhxb16E4OBv59pDst3zDysCFUD2EyIEKs=;
        b=NPSkXrtYpq/WK5BdQvihWmb5fsD7OOkLwwpcUuQgyel6KWOjS9IDBAROWHmH8TScbL
         zoC8HCuolyALCJU9ACnyGtpbLj6YRPrOLnL4vGQ7snegt0xoSrfks/hDf92Edp/Ze9h3
         kTvFTsYlwqTSudVrZtC8sGc5BbzrA7UQFHl7KFhgL6TIWTDJBP8vd05qEav5L0NEqgag
         MwVX9aks5QNhxwNVksQsyvypUTb6Ho24klzIZA0TgfwuMVSXj07A/NTFYJXFyRYtRLS/
         wQYx4KQwhgsh740eHiMFc9T0hzU/qKuMfHhXajkOHsda0700KvUKSAmMfXNQA1l4cZwn
         v1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781765078; x=1782369878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbk1I0aDC1Yhxb16E4OBv59pDst3zDysCFUD2EyIEKs=;
        b=peBCF60Guh252ha/5QL46CAju4S+7dVQC2w7T/I/A53BTlJmIAPiFAm+2YkFqSuHIS
         rFMhhl6S2iIeLxquud4xcQ/dS3XkM4ik5yKnQzt3St5dknXydDLpnWkTn0LdGsz2umuX
         fqKLz/eKjkNdL4ysylCGtFXVDDwOAXOy3hvFqjJZ5sjN14zLOTbAbwx0M1FdjBieMYmS
         ZIGMzZDyEbastvgRJqEhNOAGd3Qc3+ljIv2ZpU1qMrQsb6ir0JQBqSSZEZvxUu/nKAcA
         0NWNLfn4aSA9c8Yg4G1u/li4p93xGOAu8i0TgwxtVL5/SzX+mDvIPE1qWQ3bJlo0sUsN
         LhLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dI4Y/0FKZBs2Lj58quUjh/Mf3Z8Q4dqIvcL50qtBy7I2bMrHulIClpRcaHBV842JjlkFdhs6i6aad@vger.kernel.org
X-Gm-Message-State: AOJu0YwwariCL68dRdwQuOfOrlRjtEI1pJ+Lj+jhgtWHiGs4ESivGAn9
	raNFOoi49s4CL/YvXDZDPKNtbNmHn/+ixUhNEzL0JZxEyPXDt/4risJuAvZeQO1IprM=
X-Gm-Gg: AfdE7cm5U6qq3J+1Ow8AAYLfH+kU4b4E2hfht2VCns6ikCK/vJFaB8pFzokcWxyck5w
	Gplb8MVWZag26vRQYWPIDIuDqYeq7tbDB9fy6+WNiAkZDPzgseSgwQ7wRhTtpn6p6cyKhjSHZ7i
	djgOg0qMj9xUaRoGJR5v/UrwKDTqPFtp6Du1VxHIC2h91fAbdNaMxjZLrGNL+PImpBFUdKpZWqC
	Ac52lZuHcGBwc2MIcY4HR1y5p4agxOMlGo6GyZ+PRbzx/i+4bvl8x9yUQ1OUCEGdMuY76ZCbm2M
	Olyhqh3k6dUywTiQjXAMsp7LznDu2QJ15wcE0s6UTADNbxUokxxiZxI2bWpJRsNAm3S8oUdBCen
	aynOeSgapTb0ilDFhoK2AecDj5p4wRmEjFZttW1f2IiLvY+A2xwXdZnCNN3N4fhQfHJVeV4oke6
	6A0StMvQlMIcBAWaPo/YQlYWlNmK6c+fuCqFR/bqeAk/RaPA==
X-Received: by 2002:a17:902:ce07:b0:2c0:cb0e:ac3a with SMTP id d9443c01a7336-2c6bc224f58mr70875945ad.23.1781765077547;
        Wed, 17 Jun 2026 23:44:37 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm185275985ad.53.2026.06.17.23.44.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 23:44:36 -0700 (PDT)
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
Subject: [PATCH v4 0/3] riscv: support effective hardware PTE A/D updates
Date: Thu, 18 Jun 2026 14:44:03 +0800
Message-Id: <20260618064406.14508-1-cuiyunhui@bytedance.com>
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

Changes since v3:
- Keep the only-Svadu binding contract as always enabled, and only
  describe the Svade+Svadu boot state as disabled instead of turned-off.
- Detect the need for FWFT from per-CPU Svade state instead of the global
  ISA intersection, so asymmetric Svade/Svadu systems do not skip FWFT.
- Document the secondary-hart FWFT bringup state flow in the commit log.

Yunhui Cui (3):
  dt-bindings: riscv: describe Svadu as disabled at boot
  riscv: track effective hardware PTE A/D updating
  riscv: preserve A/D and soft-dirty state across PTE updates

 .../devicetree/bindings/riscv/extensions.yaml |   2 +-
 arch/riscv/include/asm/cpufeature.h           |   8 ++
 arch/riscv/include/asm/pgtable.h              |  27 +++--
 arch/riscv/kernel/cpufeature.c                | 101 ++++++++++++++++--
 arch/riscv/kernel/smpboot.c                   |   4 +
 arch/riscv/mm/pgtable.c                       |  68 ++++++++++--
 6 files changed, 185 insertions(+), 25 deletions(-)

-- 
2.39.5
