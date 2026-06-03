Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1393CEB92
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442014; cv=none; b=VWukOOq1y9tYKQieGxo6BUZzvrxSm2LXI5dkoTyiFhWyzjo3hut/NPbov2bIFJTYUd2AVjYMKfeSmaf+HxKpGYXb9pfDIQtYX2i17w9DpYE+iib+3HTYpdCNspTNOb2EQeqlJHyO32YTwfqRCXIdASBesb3KmiCqWPK766g6kHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442014; c=relaxed/simple;
	bh=NFhmNvV9DD30X+va7ijI7t1T5dzXyQBPQnD2PSPdR28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKacp0S7xP1FVfi2fpvimsolnLPGqiLkduuK4AlOm19mJ5L7vDF4CcgdB4NWJAx2A8xoKV++HhpTkezbLLHIBKQ8g8btBpW/ju54WzxFuK3ai5LtSNoJ1sty5ubcYEsv+7B/NC4Xit3loeGSSMgZkA4HU4+iZqj/cMaqbIRrVB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRg4gscq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRg4gscq"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf1f074a12so50354205ad.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 16:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442012; x=1781046812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6k1/Inmh2Od2nwTm50g7cFUmPDy1ALLg4fJ2r68DOVo=;
        b=LRg4gscqtgPsbX24bHL5Di9xHpOdOkTUMns3L0PgVR7CWE/8BrLiQ6jOoT/m063/Qz
         zE5PZS2X9E8boBv56gOVQ5jb5IwTylEEp14F9+vEuzt/0hfWSZzGQfGcMKdP4MIslLSa
         zjKzUmqsb6xWWJInjAa5CcpYoTwLyDQv+T45xQH6HZGcjd9Ie2dQPJlaK33kznJy5Gi8
         jtZwQJv3ZLtPoO9JXDQSvlkHWlQ2Bh5U2YgVPPZsEN77j4N4RPUyhpy38e7e2GVHibSA
         /VOFsuJaJCOrcjWH/KScWcxxevmv8ZnSdjtwNM/xRZfwq9zMtCjV5wvVPQ4h1IJirapV
         BEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442012; x=1781046812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6k1/Inmh2Od2nwTm50g7cFUmPDy1ALLg4fJ2r68DOVo=;
        b=nfHMccV5oxDkN8ChYX1c7Kurqw2fDQMsdM5FV8AoClhsuhFQy9Kwg2id6eUT+4j/WB
         esEbXzCn0Y75fC66ggOZxJ0o6IzZUXkEMC0sfjZnaBk1eCuAXxcTWGT3yA6wfB/RU+h7
         FZduWK9owP0MkviTJWBQbo7xHa1Z/n9SR6xAjgJPo11MZY2aGo6klY/nh6RrJUB1SsyW
         vQoXaM4Es7qeVNc/hAzX7E30WEcMG84eTgblE4ItMypDmzDA+2rPmvgn2l/AaOvUfRup
         1Iq5Gt4yGx9kyaoHq73r851vYIwdjqCb9WT0/ZrKXkhS0Xx3T6+DcxyBnWuH+H18hoSF
         74mg==
X-Forwarded-Encrypted: i=1; AFNElJ9Nmc2Gge180awSgh1nybV6Vd6sZdD93DqfMA35ftz7bHjaF2vFpSaqa/N+3bjIU99IXfnCN0cCKz2V@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQLYxW65c2z6AzkVQ7QQytVUHu1cXlcJQFGe2xhnNLTaT0HsH
	oXCsNqQcFxWyuYAxa5fnX5sZeVUWlDJDDOSH/cSh/FrfAU4Hxk5cr9po
X-Gm-Gg: Acq92OGNHVH3Z3Ti5aprRqvVYOsPHYrlkeLdYi9yfs5rGTqxSHDvOxS4WgVDym+YdOt
	E7wQvb40S9olxHRmoSaNuOgZwi2uB0MaWAw0OtQY4wTCVHvrwIfqexB5XOl0dLVWPwEXSnMF2LK
	aORbOz2NHrX0mmy+f8AkNjkgXmHassQYeOAOSaxk/UP62xf1Xxjpqd5IrvBozmTFSGok6pp0gXR
	qhtxfYeIa8sNGWOUHGIOhZsbHPyKXBdZEP+KOz712ZT+P4Xv+ccr1BCvLbTEecFoNn1kkLRvVT4
	Y18T+QUIyI1FeYwfPrlG3TB0ElXJbQOtNu8thncOGeK8mlV28KmOKRCeGqrpvqkONaSlvPS+j0W
	j5nR8i+rexvQUkQFXFpOtv/lTO93RoHWMXYBWy6iAhD3df91IFKObqNsnJ/BUvitdeu32/dzwvs
	pC4RlEdlbNNw==
X-Received: by 2002:a17:903:2344:b0:2c0:b35d:ed54 with SMTP id d9443c01a7336-2c1644a93d1mr7243945ad.35.1780442012288;
        Tue, 02 Jun 2026 16:13:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:13:31 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:11:59 -0400
Subject: [PATCH v3 04/15] riscv: Add Zicclsm to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-4-5529a7b28384@gmail.com>
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
 Guodong Xu <docular.xu@gmail.com>, Jesse Taube <jesse@rivosinc.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4403; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=btdqWDCTYOF/EEFvcKc54moiat+wMaDONmW39rkRzak=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHhYNjbkLtnefubOvT7P+dvl+1coIXY2Gy7btD41j9
 /6wlOPtKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIlUMDP8ZmfITc7YXSG+7Wb/
 Yr3mWK685AN8HfvUalLtPmlnR7/ZzfC/KmfV+tVWOguOVl5autbwHfNsjttiN388NX0+xVfGrfA
 BGwA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Jesse Taube <jesse@rivosinc.com>

Zicclsm requires misaligned support for all regular load and store
instructions, both scalar and vector, but not AMOs or other
specialized forms of memory access, to main memory regions with both
the cacheability and coherence PMAs, as defined in the profiles spec.
Even though mandated, misaligned loads and stores might execute
extremely slowly. Standard software distributions should assume their
existence only for correctness, not for performance.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
[Rebased, rewrote doc text, minor commit message revisions]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>

---
v3:
- Move the hwprobe.rst entry to the IMA_EXT_1 section so its
  documentation matches the IMA_EXT_1 bit it was allocated in v2
  (Sashiko, agreed by Andrew).
v2:
- Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
  allocated a new bit for it
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 3cedaaa53f331..fa2810bfc1477 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -401,3 +401,7 @@ The following keys are defined:
     as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
     extensions specification, ratified in commit ff03d8485a04 ("Update to
     ratified state") of riscv-cfi.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 44bf8c7d8acc5..e8f4a7dd96a93 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,7 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_ZICCLSM		106
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aecb..6819df159c51e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 686dde3ce3b98..1fb595581adcf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index f8f68ba781b45..9cf62266f1890 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

