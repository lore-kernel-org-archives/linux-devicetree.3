Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649438;
	b=UiATcO9AUceswiNt6miwFhkbfRG0U3zj+BsDwCLWEQNsAw7ndaZGEaG4B34oZ5N6NKW2
	 BEcYKhXpABShyT06lHwLH50BN/Q5VcwLK+w0d/fJkgop1R6a3kEk0SjJrCpvouvmo8N0u
	 sPcBOBuKWzntut8WHgI4US1akPY/eocAzqL5XN1kbRm2IfhJDEZ+jnjclW3FHuiwl1nxJ
	 Nr2Le6tfbeHW+zV26OMe0q+neJcljwpuEuMraa9vvGRyYle4B11X18UGLE20hFE+rr6Sp
	 /XaldZ1VxIT6C7AyxYXslQMjSP85dzASZvSglcD0oKBrb4AWLtPX6FnplrrP/LtZ+rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=I4lPFLfieT6FbOV9CarxN3ibaJh2DCsYwIF1QQUH44s=;
	b=Y+3u8+42SYZr3kuAlILtwU5a7UANNVJLmrTFfWcVtRncCz3VeCYQiFb7TFmCEeTrIH2S
	 RUrJcKGzkCfdAmjaMBQrgwmtZrtKWX3XqfhMoE8QYr9wIsItkAN5lK7n/4WhomeOnSwRs
	 s31Q24lle4hBPNtiGaqALq9lZkJTkEQBVtuCwqp4M/WrGp/mrCHV5aYYMgWz1BYcaMUCS
	 J/wzD9I2/tJv7Mbjl4kGXTgWFifsIuJdUyAjn4xZxY5OWjBBkRVm4UdNmq7ngn30a65Qx
	 BLULRUha1HB5BHwN3i8i/UNxrIx9YZVvwSmRhDZuChxs2tgsxE5hrpDN+/cSalpI0pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTGQiRRF;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB38606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB38606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTGQiRRF
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-497614c95f0so3629488f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649437; x=1796254237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I4lPFLfieT6FbOV9CarxN3ibaJh2DCsYwIF1QQUH44s=;
        b=pTGQiRRFzN76093oJQhpelOIJZWB6JaiGo7CsCslbyUbzSUKe4IAunceq2PZv5Z7Ht
         qbUD/mYL1yuDvJJJ9IGaGqgV4V2aXHHDR5ON1z5zs/KL56d/g6O1Wx4iz8TGQMLk4ivV
         1o8oFE0q2MAyy0jFnQPPuegEmCwYI6N7s4+BTj5WK8x9X+QaZmBy7kjI0fwBm9D6Hi1j
         RVyS2vvBeKXEmGmu0XeI/6tJXcoUzgg/bjFpsvYGpWGFfqKOxOjuGgkYLNLhqYQKl3dT
         uEmRHj+e3ogm2Y9Sn94qqc6ZqiZyw83O6P2Bq8Thxr1D6RCeLe4MrYFmo/xlldVikqof
         hGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649437; x=1796254237;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4lPFLfieT6FbOV9CarxN3ibaJh2DCsYwIF1QQUH44s=;
        b=FC21D5mofHhceH4Vw+7pNI6BFgrSINIgXxUd//usijSaufQ5K7xK9xZAtx910P8vcX
         4wv80CSLGxRiMRRw7pzf857cn9gdnErQhKsFOrUm2+bWTp1WrwNLHfaFlPNUUmhulhxd
         zyz/cqGEHYWqpbrp+IHJ1Hmbx/P/Zp/eeaGyL81xK03uZ0WVa36abrP+GAZiNkswwChM
         OH16iYxV3YFt4YU0TG0ZqgB5zX7onOwY81ZWT8P65S5lugzCNudsFpPyB+XhkngCBzPr
         fWwUUj8rue2KHTPVnwkD89CWkfMMmpE0Tf/1opI+GzH+JYxmuOedCG3h6gVRvRi1zU3j
         b7Xw==
X-Gm-Message-State: APuU4Z9eTEt1Pm7JJb5QWhaGgw9W4r1nz1rcfgeoaTUErPhrzeBjFvGW
	x6uID5QTEHvDjvHGD1ELEfn7mfsfE1KpAQ4ttogjPhCv5it4elGv5ZS0
X-Gm-Gg: AZFdTZerHf4IhaTFeb4TFxVgMSpmb98vSNTHVEd9L5qp2+znpN2uBAzB5HDn9aqSocr
	/z3sKOg+Ruwyp9DBBQ2UU0ZNQzZjbMDuH3FcVsaiJaZbyn7hvSsJvci6pLfrLPE9GkqtM5xcL/5
	CtT0QKLobpeRMSnW7bJWYz6zlw4B7LVid94U4OIICfrSTFUJDVRuCn55ZK42tmxEIZDIXBEAUXE
	9vQY+KmXENbjvpmzCQeQkbNEYaZ7/i6EsLKOzr3Opl+jdLwPsyXkZtvy2pBZk69gPbAqGa0cXRB
	dBV8DNoJaQnI6AWH+kwKmWAOZ5XTuhN2+r3LDeqhJwNGjbtFyWsNkNafv4xVtcgXkrTalCTkt66
	Asgaj/GZut02lHlUHQ7iUuM29kymDxIUpJWQdf1M/nB0j5ldYVhOON8k82KjiFAfzcbhE6MheLP
	+IaY2SF0HUCozVRJiFfxvuBXJnZezNA4BarOUtCBNOR3FfxAcVWtQ9+PYi7TL07EBE7fzCE90iA
	SRs4rmqoNgCqmXWrWB9pxZ+y9Bt4F+zkLQQ/DWjTkW9aQkZTCl7EM7fg5vhPH8FhQSN6F/u7tKz
	S/2g8zsuZgFLJ5RmNMFAXlLolMNf7Pf76cnsQz9lfgOHYPC2RQxET/CE7O1tiANPoDnBZ+nOBSf
	aZdaffAZtlw==
X-Received: by 2002:a05:6000:4381:b0:4a6:5a2a:f5a3 with SMTP id ffacd0b85a97d-4abaa9773abmr40225454f8f.3.1795649436500;
        Wed, 25 Nov 2026 15:30:36 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm36661490f8f.42.2026.11.25.15.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:36 -0800 (PST)
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
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 01/19] riscv: Prepare ESP32-P4 early CLIC trap vectors
Date: Wed, 25 Nov 2026 23:30:02 +0000
Message-ID: <20261125233020.1380594-2-vitorhg20080@gmail.com>
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

The ESP32-P4 HP cores run with mtvec.MODE fixed to CLIC. The legacy
mie and mip CSRs cannot mask CLIC interrupts, and mtvec.BASE requires
64-byte alignment.

Add an opt-in configuration for RV32, single-hart M-mode. Mask local
interrupts through mstatus.MIE at kernel entry. Align the early park,
PMP probe and normal exception vectors to 64 bytes.

AI assisted with the trap entry changes and elaborate the help
description.

Link: https://documentation.espressif.com/esp32-p4_technical_reference_manual_en.pdf
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 arch/riscv/Kconfig.socs   |  9 +++++++++
 arch/riscv/kernel/entry.S |  6 ++++++
 arch/riscv/kernel/head.S  | 13 +++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c4983..0272923c7d88 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -12,6 +12,15 @@ config ARCH_ANLOGIC
 	help
 	  This enables support for Anlogic SoC platform hardware.
 
+config RISCV_ESP32P4_CLIC
+	bool "Espressif ESP32-P4 early CLIC setup"
+	depends on ARCH_RV32I && RISCV_M_MODE && !SMP
+	help
+	  Enable early machine-mode trap setup for a single ESP32-P4 hart.
+	  This aligns the trap vectors to 64 bytes as required by the CLIC.
+	  During kernel entry, it clears mstatus.MIE to mask interrupts,
+	  since the legacy mie and mip CSRs do not control the CLIC.
+
 config ARCH_ESWIN
 	bool "ESWIN SoCs"
 	help
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 61b7a7716697..f659bf62bb39 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -125,7 +125,13 @@
 		CONFIG_RISCV_USER_CFI)
 .endm
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/* mtvec.BASE starts at bit 6 in CLIC mode. */
+	.balign 64
+SYM_CODE_START_NOALIGN(handle_exception)
+#else
 SYM_CODE_START(handle_exception)
+#endif
 	/*
 	 * If coming from userspace, preserve the user thread pointer and load
 	 * the kernel thread pointer.  If we came from the kernel, the scratch
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 1631fd6bc786..f266c4238b2f 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -183,7 +183,11 @@ secondary_start_sbi:
 	call smp_callin
 #endif /* CONFIG_SMP */
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+.balign 64
+#else
 .align 2
+#endif
 .Lsecondary_park:
 	/*
 	 * Park this hart if we:
@@ -210,9 +214,14 @@ secondary_start_sbi:
 SYM_CODE_END(_start)
 
 SYM_CODE_START(_start_kernel)
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/* The CLIC uses mstatus.MIE to mask interrupts globally. */
+	csrci CSR_STATUS, SR_IE
+#else
 	/* Mask all interrupts */
 	csrw CSR_IE, zero
 	csrw CSR_IP, zero
+#endif
 
 #ifdef CONFIG_RISCV_M_MODE
 	/* flush the instruction cache */
@@ -233,7 +242,11 @@ SYM_CODE_START(_start_kernel)
 	csrw CSR_PMPADDR0, a0
 	li a0, (PMP_A_NAPOT | PMP_R | PMP_W | PMP_X)
 	csrw CSR_PMPCFG0, a0
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+.balign 64
+#else
 .align 2
+#endif
 .Lpmp_done:
 
 	/*
-- 
2.56.1

