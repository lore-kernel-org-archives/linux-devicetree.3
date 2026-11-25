Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649442;
	b=12D82e35cinJTrK7mJUW+a3MLw0nGpvump2XC1NBVcjrWV45Ly8fkIlP/8YkYAJLAssi
	 mz5WIAcLKBANFsssgs5IP0HIm2w0Bnv6ugIsjCTBRJ0Y62W55m8xxB0R2txRjQ9VsxR6X
	 M2zFCPF9FAH/yu8f0lGKKnQ6Dchve4tzjxsyW74gifwWNGLHb7PyYsbc75KDveLlJssuM
	 H8rDTWG1n3QyNJTM6307c8E4mJlZiW18bySYqdkqmQI37BmEVOiClgzApD1aTRreUgD0o
	 XEzD20enQ3RBtOw4Ne2/bxkckcMIWjIaVMWjkxjWkFsxg1E8PQ8CO4TDOXITxFVmOJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=k1Ij9HGRNVPxHOypgke3ebIZ/asDfBx2BgBH8YIUh70=;
	b=In3Y9DG+J5KTDn41MR0eFa3wEo/EfIsL3v3b/LttLRp1gJyj15+uRK05sgrk8uMZ1nWm
	 cPxNDQ0OyDkY7k4cjitGJ+8tbPBNrMKWgiofs/ChaATp3mHrgM6Rm0KZEEoCFxXKLIt5+
	 8hB3ni4KcltJwK3b4E2bhElbwXDl05QX9o0TLhlebWFJZxGwlcZFkgu3iDJnlhv9QSCQL
	 S98xOYSQch2AZoCaSipUO0qWowiaQl8jY85GrVqllFjydXEswzFzkma1WZlrvjzOyDiHS
	 tCBNmjPSrH+VB6vZeEF6G4OYhLODm5mCMLv3bvpE9WF9/QDgd/9X4jwXvaKRB12CzfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cRZVjhQV;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD80606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD80606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cRZVjhQV
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5662397f8f.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649440; x=1796254240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1Ij9HGRNVPxHOypgke3ebIZ/asDfBx2BgBH8YIUh70=;
        b=cRZVjhQVJNxnitQ0BaR5Ma8MvwOI/7MtLd8Kx5VJ34jKIWrcFw9QLivdS94GEaW/Ac
         3oyXmhbMUSPtyUdiKFc7EM2DbkAcDSoBFUQxhl+JJn+7qQuykBUVVXBDLLJuwudIDBQw
         UAsWVVlnwKYxflFLp/tRbY3T9fmHoHkqMxPqXWa4kCbOOzWIY/evG+SPz9W5wWlDSWft
         sjuel1QB+B8SgmbTEV9JWjYImuPgTVqFRdcR5R7cDs5mZVUiTNQdH8EhkXXTrzwCwg3D
         +JNfQW5aPrvs+iYQ3uwf6sg2c7Q3oOG//CxU/t9pEpqA2GKbYaZpF5wtvgRwsVMpvhdU
         4q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649440; x=1796254240;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1Ij9HGRNVPxHOypgke3ebIZ/asDfBx2BgBH8YIUh70=;
        b=CNTdiavAsJXNnhtRJdz1gLCnaqlNmKZPJaWKTZPYz4uTvH004fAG56nAWUni+Zzyu0
         2YakVCF+abxjQfk7/YDOrtxbCO8eyAhy2UCMyxQeYAQRu5QeOBAfCeXNe/26YDQA2M6+
         ve5Pi9fb0yQo90afepj0dphVoxcmqmGxeh/nBDfUAg4pmjoQ9lKKbIO31knQrYivmbEu
         uqls2E0dzB5PwhB5BsQ85czvrC3uVjQS6Hbf4U2W3IiXblLJgZF56NjmfOt+bycZ1PD9
         rymwC3PyWA0QsCCh/t0nX6P+K8JJNGwrsA04nY7gMZ/EARI1/347AWCB8kv06Kf7cGqj
         +A6g==
X-Gm-Message-State: APuU4Z8vDredXP+Ub2vOHqWR/O7lvNUM/pTsMzG2v6ea1rP7cnfhaUUj
	EHLs5KkHTYBN4xdyQvP7tIn+YSezooGBx/ZGp0oTeYi3SYnbBBcej4z5
X-Gm-Gg: AZFdTZf04fZD85TEb/F+5SHcnr3+Tm2Ia6ykBupFmh387o7CeXPCVZjWiDr12rLK277
	iMvPuh8W0U0iHmSUJrpJaFsjzITgywB56nyRHyDztQ2OadSpa5zVIDVeq7OOMxBwRwZ2/UxM3k+
	mvwr+0l989VEQyj42YY/AnZE9tfdjcDFMDmr32rrx/FMz+9vIGlZquKnCnynsS89qimGbGlTPoI
	nGxX96qyO3j+jJqrywDMzAXFnXf97Zg6W1Of8Iqm00czWeASbCUx67fIA8CMNGbRKmv645smWuh
	gIGbdACwo2srXYcK4xs7Gw4zioHYiA9o0YQIYN/SzdRnIwE0Hac9795Y4VHNmXSb/1Bs/3979yi
	MpXLsaz37pzZ91JsTctz7JacxzlhDmoGxe8CcGYogMp49uzVh6Yq8W9JtJAmAquTmqBFZpJKPXL
	f7gweP4H894JAiOhfwTgLUdbDNYLe57zQYBct26RjuO45eUqtCxyY/QvgqhMZXV14v0ra5E51vW
	jvTlPRyBewD6raNAsHaE+dHQi+MTsHDJoPUkjJy7IR4TjjIuo8QqJo4Vu3jwKyvI+3k3mQUFrsB
	CG9Sap/6h3j79QOmap7XPIzTmdefebS744i+zBlCpT8kHhWLewDblcqolPsPjZu3L9DGqKNDfaa
	ZOQGnF10Dig==
X-Received: by 2002:a05:6000:4284:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-4abb9edfd7cmr38748071f8f.56.1795649440438;
        Wed, 25 Nov 2026 15:30:40 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm37411248f8f.28.2026.11.25.15.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:40 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH RFC 02/19] riscv: Handle ESP32-P4 CLIC trap context
Date: Wed, 25 Nov 2026 23:30:03 +0000
Message-ID: <20261125233020.1380594-3-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
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

The ESP32-P4 CLIC encodes trap return state alongside the cause
code and interrupt flag in mcause. The RISC-V exception dispatcher
expects only the cause code and interrupt flag.

Save the raw mcause in pt_regs, normalize the cause for dispatch
and translate MPP and MPIE into the saved status layout. Restore
the saved interrupt level and rebuild MPP and MPIE from pt_regs
on the non-vectored trap return path.

The current CLIC level stays active until mret. irq_exit_rcu() can
run softirqs with interrupts enabled, and irqentry_exit() can
schedule before the final mret. Holding the hardirq level across
either path blocks interrupts at that level or below.

Restore the interrupted context's level with an M-mode mret
after the hardirq handler and before irq_exit_rcu(). Keep interrupts
masked across this intermediate return and retain the original
trap frame.

Tested on a Waveshare ESP32-P4-Module-DEV-KIT with revision v3.2
silicon. The kernel booted to a UART shell, completed 20 consecutive
two-process pipelines and continued to receive CLINT timer and UART0
interrupts.

AI assisted with the assembly and JTAG diagnosis.

Link: https://documentation.espressif.com/esp32-p4_technical_reference_manual_en.pdf
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  4 ++
 arch/riscv/include/asm/ptrace.h         |  4 ++
 arch/riscv/kernel/asm-offsets.c         |  3 ++
 arch/riscv/kernel/entry.S               | 61 +++++++++++++++++++++++++
 arch/riscv/kernel/traps.c               |  4 ++
 5 files changed, 76 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index a0ca9efff267..e0fec71022f9 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -64,4 +64,8 @@ asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
 asmlinkage void do_irq(struct pt_regs *regs);
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+asmlinkage void esp32p4_clic_restore_irq_level(unsigned long cause);
+#endif
+
 #endif /* _ASM_RISCV_PROTOTYPES_H */
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index addc8188152f..5729fbac0b57 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -53,6 +53,10 @@ struct pt_regs {
 	unsigned long cause;
 	/* a0 value before the syscall */
 	unsigned long orig_a0;
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/* Raw mcause for CLIC trap return */
+	unsigned long clic_mcause;
+#endif
 };
 
 #define PTRACE_SYSEMU			0x1f
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a75f0cfea1e9..9f8310dd0a6e 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -130,6 +130,9 @@ void asm_offsets(void)
 	OFFSET(PT_STATUS, pt_regs, status);
 	OFFSET(PT_BADADDR, pt_regs, badaddr);
 	OFFSET(PT_CAUSE, pt_regs, cause);
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	OFFSET(PT_CLIC_MCAUSE, pt_regs, clic_mcause);
+#endif
 
 	OFFSET(SUSPEND_CONTEXT_REGS, suspend_context, regs);
 
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index f659bf62bb39..91269ab82c60 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -196,6 +196,22 @@ SYM_CODE_START(handle_exception)
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
 	csrr s4, CSR_CAUSE
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	REG_S s4, PT_CLIC_MCAUSE(sp)
+	/* Translate CLIC MPP and MPIE into the saved mstatus layout. */
+	li t0, ~(SR_MPP | SR_MPIE)
+	and s1, s1, t0
+	srli t0, s4, 28 - 11
+	li t1, SR_MPP
+	and t0, t0, t1
+	or s1, s1, t0
+	srli t0, s4, 27 - 7
+	andi t0, t0, SR_MPIE
+	or s1, s1, t0
+	/* Keep the interrupt flag and the six bit CLIC cause code. */
+	li t0, CAUSE_IRQ_FLAG | 0x3f
+	and s4, s4, t0
+#endif
 	csrr s5, CSR_SCRATCH
 	REG_S s0, PT_SP(sp)
 	REG_S s1, PT_STATUS(sp)
@@ -311,6 +327,25 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 
 	csrw CSR_STATUS, a0
 	csrw CSR_EPC, a2
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/*
+	 * Preserve INT, MPIL and CODE from the saved trap.
+	 * Clear MINHV so mret uses mepc as an instruction address.
+	 */
+	REG_L a3, PT_CLIC_MCAUSE(sp)
+	li a4, CAUSE_IRQ_FLAG | (0xff << 16) | 0x3f
+	and a3, a3, a4
+
+	/* Rebuild MPP and MPIE from the current pt_regs status. */
+	li a4, SR_MPP
+	and a4, a0, a4
+	slli a4, a4, 28 - 11
+	or a3, a3, a4
+	andi a4, a0, SR_MPIE
+	slli a4, a4, 27 - 7
+	or a3, a3, a4
+	csrw CSR_CAUSE, a3
+#endif
 
 	REG_L x1,  PT_RA(sp)
 	REG_L x3,  PT_GP(sp)
@@ -329,6 +364,32 @@ SYM_INNER_LABEL(ret_from_exception_end, SYM_L_GLOBAL)
 SYM_CODE_END(ret_from_exception)
 ASM_NOKPROBE(ret_from_exception)
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+/* Restore MPIL from the IRQ frame without leaving M-mode. */
+SYM_FUNC_START(esp32p4_clic_restore_irq_level)
+	csrr t0, CSR_CAUSE
+	csrr t1, CSR_EPC
+	csrrci t2, CSR_STATUS, SR_IE
+
+	li t3, CAUSE_IRQ_FLAG | (0xff << 16) | 0x3f
+	and a0, a0, t3
+	/* MPP=M and MPIE=0 keep interrupts disabled on the synthetic return. */
+	li t3, 3 << 28
+	or a0, a0, t3
+	csrw CSR_CAUSE, a0
+	lla a0, .Lclic_irq_level_restored
+	csrw CSR_EPC, a0
+	mret
+
+.Lclic_irq_level_restored:
+	csrw CSR_CAUSE, t0
+	csrw CSR_EPC, t1
+	csrw CSR_STATUS, t2
+	ret
+SYM_FUNC_END(esp32p4_clic_restore_irq_level)
+ASM_NOKPROBE(esp32p4_clic_restore_irq_level)
+#endif
+
 #ifdef CONFIG_VMAP_STACK
 SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
 	/* we reach here from kernel context, sscratch must be 0 */
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda099..28343a601969 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -428,6 +428,10 @@ static void noinstr handle_riscv_irq(struct pt_regs *regs)
 	old_regs = set_irq_regs(regs);
 	handle_arch_irq(regs);
 	set_irq_regs(old_regs);
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/* Restore the interrupted level before irq_exit_rcu() can run softirqs. */
+	esp32p4_clic_restore_irq_level(regs->clic_mcause);
+#endif
 	irq_exit_rcu();
 }
 
-- 
2.56.1

