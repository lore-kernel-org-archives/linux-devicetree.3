Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32347391E7F
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442133; cv=none; b=F9BgZsMZkn93FTQrhYxmYOWUMMvM4+ILC0I+Qzc/+xCqF0EBVf6JZ9y9CKz1FUzre0hqZ4Ooh8K/Xdym7TGci7FeQibCLDRyxvlDNiK242O3af3ElRfdrOhW87lUBxl4WR7bnKw3cNOMiiUb6PuJeNbWGGkL6pXtAJAP56Dxw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442133; c=relaxed/simple;
	bh=O+m6esE1h2WCRNa4TSXJ8l0GsbEGYg/n4liKpqmrez8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YtFnuatJ3Zdw4MXEYV75RvpklcpZOOYbvILOn5fr/izsCU0YJppbiSo0Y3Od86Oiz3aktRSV5CaUSnE2MTiBPzE4BN/1bYAcmbJkRyb2btVKveqate+hgtOgJvzXAf/7Dmv1SqfBAGjD7+BEBZDpaLU8QfeK/k3SH+Z4yGpsJ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRC0FYvb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRC0FYvb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c3315c5dso31980605ad.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 16:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442131; x=1781046931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elAeolCTc2IAaRv5GDeM52BjkVLUXqNe1DIyzckEuoM=;
        b=mRC0FYvb7xovNewnjKUYev+3ezw89Fc+sIj+CKpcHlTp95tPq7I5GjbzJwP5CI/UDT
         EOVbiLxQxcFNqfCR5+ILFZ6HGLZMhqu4+Jdm9Ajm9yywZaX4XY8vXh6T1HbgUaj381NE
         VZCjBaMF5/0CqXvybSwcbhRX9VOo6BA9s3BQM7At6vgO2ydF/pmwoxBnjytIbxhdEiUY
         w2SfzuZAaTWUZzy8f6wnki1yYx79KxwEAO4TfoNhaSKA0w0Ycw42jVxb2uqrA/oStUff
         8iao8Yob6pSkzh1sY0yIoIlNi4+crym+HFHHAhevXWRQUKgTe6YN6ZbwRRtabiZUG6yP
         xuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442131; x=1781046931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=elAeolCTc2IAaRv5GDeM52BjkVLUXqNe1DIyzckEuoM=;
        b=ZfRKOdtzkE9WGh8mu9s1IQs+soRB05UgS1gLBftdVOxtx0Zov0Vg9njmQ4o5vII0Q1
         x9G0GVPzlqyF6Q9UXV0H/v5nKJwkCgxFdtvf0KxS5ilQ7BXb2alAxR83WhmnTiID/oZX
         334pNBc8x5uZd9ohjspW//NeY7MObcb/xYe3uVuU477c+oUWDs3E0kaLgtxrVOGjY2Ap
         gt1lEjxpVoUwKxwJ9TLpNe5mlg/e5yx0OxGzpD3iqLhgrgNvIJo20JQ5ZCkhf3NeD6XE
         70V3hRCqE59S2UoB/MbZJ9EYzBl3zrJinvqYVki/OVp6DY5cH0CyGsbrSLKPU/TgHZxP
         /yyA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ce/9aghLKOPU0y0+WGmZ+svUY9P9VqdznghNMPJzyAHYuoPgF0aXoA2Uta4r/xv55/+NuWILFN6tm@vger.kernel.org
X-Gm-Message-State: AOJu0YwjxCCbTv94K6yemu2kY/0GzFsl5/1m2DZDxc+AB2G1ZEy4+AyM
	NYOghoSGWfa2Le+C0xhTBy9ouojdw31dBgKpfdhKJUmqeBviE5XCIdvB
X-Gm-Gg: Acq92OF5NY/5eBImieWP4fXPUvTZUuNf0N2A+VdU9hBX1Mn1FJQMdZvyH4cnG+SyJai
	z9TQlBY/jdN4dDUDf2UOIYBC1ctiKsHEuF2ukZsHtxH3ygbXHR1WOkRNnOKkEX9lm1HcRXqVOcw
	q6XowZDryukQQkSNDCgHABjL4P9koqT+06Os3XnXGyRdad1AgkSEyfSrlxIa5D5+7d+yjndeKpL
	340wSyZc2IoaQgUsLa6YNx8QSe5F0xb/AGwU7+ZjWUlNOOwH4Tu+VaJF6sS9mkcsN9MJDBw4Oj3
	6mGjHFrBPSG5FfnJ1mgyRlCYQ9o+E+i9u6WnpO/p2NAlP7dMK/F7j5eFY9zzmGez6esEZnk5O34
	vbzwWusQZOL+n5yLHMoxcv0ru+RudiH8nRvnfsNSQxuQpfxarh3n9akvhp93xdXrlDsqsJK6gNy
	BzkCeQT7xssg==
X-Received: by 2002:a17:902:f547:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c163a3d1b6mr7203385ad.9.1780442131511;
        Tue, 02 Jun 2026 16:15:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:15:31 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:10 -0400
Subject: [PATCH v3 15/15] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-15-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4827; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=O+m6esE1h2WCRNa4TSXJ8l0GsbEGYg/n4liKpqmrez8=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHvYP001VTd0EX7Jtz/r1fX1MpPDfafPEZD+aHd25Y
 k/yjFD7jlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiIdQkjQ8cd3dI3NxoXfthj
 fUXAwaAgPdVj8ZIbF5tKmY5ZCLtMvsfIsIYrRmnaLyfmpTIiSa2u0svvnnrlZeYgUrt9jafMDDt
 1HgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 601e81f561421..d6712259946e9 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 36ec8ab470423..50733d3db7633 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -21,7 +21,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	(1 << 1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 3e80e5551ae0d..3f66f2e99d41a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -226,6 +226,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!test_bit(base, hart_isa[cpu].isa_bases))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -308,14 +319,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0

