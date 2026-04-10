Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403DE29E0F6
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 02:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775789409; cv=none; b=hwH5aUEaPYyI2duCrlcDPsotUZwZKGOCSwZ875I7Umj5vdnCLEDIKOVnDI9cqarr2wXN9fJyRbh+MmK7bWw3PPgwHAmvwSAmmfLtHNN402S/L9Ti9MJy/Ev/TFxWX86bSzdTm8pqOW0JXqMQewQgnVUElC3Y2y+XaziVHWHx/tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775789409; c=relaxed/simple;
	bh=GpVtjDzto7je4IqKl1P9K/JwKdNjqTXK9Fand6V8Y3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ty5MIlV0SQ/YTzB531YqdzGSyVxPlDu58wu/IFQ4FSjzXglzssKCM2lp4nrfok82XylNQOtmgO7ln0cct8Z/Np4tz6/x/kzbUvtkJL2m5xWOGwq7sqUXjE38HCWpq8rAV28n0o1jnvIrgB4JhQ43WF+99yjBHY+eGTuOo3LEqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Xc23e2rY; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Xc23e2rY"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79ed2fc6ac7so12720417b3.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 19:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1775789406; x=1776394206; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Rgttfa1m4ZfTGDBdLpI4DYVvSN/lXYcgorvzMEJ+8s=;
        b=Xc23e2rYsqmWlLptP4dRkzQ3kTe/XsQ00PtcvAcVIC1bsgRhX1E0b5j3n97VBje+yg
         S1vYaIlzWDfd3Z+lhv9B6p9E95n47eSFduLHngy3H6gT4ScuTopj/k8Teinip17OGdKr
         83rV/lpmoC+rP2zHViRwoDY47EpxWv7MEtHq5N4B9hM6T/N8hp2djeZNhkmZEjEcFhyL
         +FbKfeKzEvfc+jsPgoN8Dmflh6Lwn7FGAmEhiiZ27dqx6tCvThVSp3mQQ9kHatZuvqW6
         fWaN3QYUgTxa99DjCeHGRVIClEyDI8VsHFon46eaz1YTxfXG3LwUSRc/4riiwbgUodEl
         d9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775789406; x=1776394206;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Rgttfa1m4ZfTGDBdLpI4DYVvSN/lXYcgorvzMEJ+8s=;
        b=SWX+pYrs2FZzTrrIFGaT9k6X9NuKp4fXcGTMZWAASaQ28zLt8FkaFyosZsOSHA1Yjr
         d+FhVQqK/KQD6C6Ox8Kc8mJbX3k34nEanrSphSqeHUrBVZFpDN16y1AbHWtGSBhfMc0W
         d+33aXuoRemYGN/LNskTsoEpxkmbza9KJsBVtuW96smmusKnJPeiI4G+M5QHwtHkzLUJ
         InaqH2cyIe6+Fvv32LfuIbbewq1LbM3qcnvRK41IsIWOPaSUYR3t7pmjj8uW+wUM/zrC
         Lof+X3PhJxYIbD2mT3pgi024CmdD32lO88UB4+d+8/5b8ls6h/PZVXjYBwG4aiC2ku+q
         q4PA==
X-Forwarded-Encrypted: i=1; AJvYcCVP8bUAH9MM9VyFRdEjaV5oLMmgqfz9uX9iZflyWVMl366LLCzK+gT0m7/OtvNCYAhiFNdE9WxJ/8bb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+21u+0xSrIQ5AcWnYpWbKYAIOVfvNIe3k00Pf2xm8FGGF1ESy
	GUTv5S9oEkZnRS+9YhzbccQbDtj4oOssqwFxRPapFDjFxGy+X34OZR5mR8lYHnsYg2g=
X-Gm-Gg: AeBDieuhFL3hun+27WXfxeRJzW+PLmd1MqgEb3d2NCLhkLwvvINV7VbACnG4r2fIrj7
	eIhwRMB0GSCoRERTstE2ejZP2N3Xx8r3j6mLIcg1TY1BYRqlMOoNSPr8RP6hS+8dttjE3y77OUz
	glsgxslHvQ4EEdR+pV1O2lTsPJ16pWT1Fcl4TVwi3JT0eQ0sKjpQn74A9nXbdL7pqgYjJMvsztY
	74leXWRM5qP2vbao+dDEG/IYg9Pl4PutRjZfjkbrbtOzX9sDZEaYCvA6V1tLGr1xtSGJ2JvpWVG
	vk/aSVZhNuq0w2sykMoyvZ6XCAOY4ci8BkzIvfQvQIR+Mot4HqrecmXnIwVDmFY8+S7Q31ykmwF
	EWF58oUeIVpDk9u6cSF/jdXW+ivS+JqEXFaFddqyW6zwBKd4gFCe1MzY/1ncsS3MFBOZiri9+g0
	VsouRYcOfQaxHC+SpuuX6ODKrSRycVQww327XSpOJ06xC1Wa+nJ2V+JPEr3PZVEAgrxQQX+KAU1
	5zeAJU=
X-Received: by 2002:a05:690c:f04:b0:79a:c40d:b701 with SMTP id 00721157ae682-7af6f9fe059mr16671887b3.13.1775789406232;
        Thu, 09 Apr 2026 19:50:06 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:8dbd:dff7:b592:b476])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65197c4e65fsm624675d50.19.2026.04.09.19.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 19:50:05 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 09 Apr 2026 21:49:59 -0500
Subject: [PATCH] riscv: dts: tenstorrent: Add PMU node to blackhole for
 Linux perf support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-blackhole_pmu-v1-1-01a34bf46a1c@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIAFZl2GkC/yXMWw6DIBRF0akYvkvDS7BOpTENXi6V1FdBTRPj3
 Evr5z7JWTtJGAMmUhc7ibiFFKYxB78UBDo7PpEGl5sIJjRT7Ebb3sKrm3p8zMNKrbNeIWpVSU3
 yZ47ow+fv3ZuzI77XzC7nSGa7QJfRulACkRknS19KgdwIq7QC0UrDHYLRzljglec/t7UJKUzDE
 Ja62MyV0QicNMfxBYFYE0zBAAAA
X-Change-ID: 20260409-blackhole_pmu-adaf4ee64836
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Neuling <mikey@neuling.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1

From: Michael Neuling <mikey@neuling.org>

Add a riscv,pmu device tree node with SBI PMU event mappings for the
SiFive X280 hardware performance counters. This enables OpenSBI to
expose the SBI PMU extension, allowing Linux perf to use the 4
programmable counters (mhpmcounter3-6) across 3 event classes:
instruction commit, microarchitectural, and memory system events.

Event encodings are derived from the SiFive Tenstorrent X280 MC Manual
(21G3.04.00) Table 13, section 3.10.5.

Assisted-by: Claude:claude-opus-4-6[1m]
Signed-off-by: Michael Neuling <mikey@neuling.org>
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
Added a dependency of [1] to b4 so that checkpatch doesn't complain
about the Assisted-by tag

[1] https://lore.kernel.org/all/20260311152039.254244-1-sashal@kernel.org/
---
 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi b/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
index 6408810d8d80d..5f709e45d9b28 100644
--- a/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
+++ b/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
@@ -77,6 +77,54 @@ cpu3_intc: interrupt-controller {
 		};
 	};
 
+	pmu {
+		compatible = "riscv,pmu";
+		riscv,event-to-mhpmevent =
+			/* SBI_PMU_HW_CPU_CYCLES -> CPU cycles */
+			<0x00001 0x00000000 0x0001>,
+			/* SBI_PMU_HW_INSTRUCTIONS -> Instructions executed */
+			<0x00002 0x00000000 0x0004>,
+			/* SBI_PMU_HW_CACHE_REFERENCES -> I-cache/ITIM busy | D-cache/DTIM busy */
+			<0x00003 0x00000000 0x1801>,
+			/* SBI_PMU_HW_CACHE_MISSES -> I-cache miss | D-cache miss */
+			<0x00004 0x00000000 0x0302>,
+			/* SBI_PMU_HW_BRANCH_INSTRUCTIONS -> Conditional branch retired */
+			<0x00005 0x00000000 0x4000>,
+			/*
+			 * SBI_PMU_HW_BRANCH_MISSES ->
+			 * Branch direction misprediction | Branch/jump target misprediction
+			 */
+			<0x00006 0x00000000 0x6001>,
+			/* L1D_READ_MISS -> Data cache miss or MMIO access */
+			<0x10001 0x00000000 0x0202>,
+			/* L1D_WRITE_ACCESS -> Data cache write-back */
+			<0x10002 0x00000000 0x0402>,
+			/* L1I_READ_MISS -> Instruction cache miss */
+			<0x10009 0x00000000 0x0102>,
+			/* LL_READ_MISS -> UTLB miss */
+			<0x10011 0x00000000 0x2002>,
+			/* DTLB_READ_MISS -> Data TLB miss */
+			<0x10019 0x00000000 0x1002>,
+			/* ITLB_READ_MISS -> Instruction TLB miss */
+			<0x10021 0x00000000 0x0802>;
+		riscv,event-to-mhpmcounters =
+			<0x00001 0x00001 0x01>,
+			<0x00002 0x00002 0x04>,
+			<0x00003 0x00006 0x78>,
+			<0x10001 0x10002 0x78>,
+			<0x10009 0x10009 0x78>,
+			<0x10011 0x10011 0x78>,
+			<0x10019 0x10019 0x78>,
+			<0x10021 0x10021 0x78>;
+		riscv,raw-event-to-mhpmcounters =
+			/* Class 0: Instruction Commit Events, bits 8-25 variant */
+			<0x0 0x0 0xffffffff 0xfc0000ff 0x78>,
+			/* Class 1: Microarchitectural Events, bits 8-18 variant */
+			<0x0 0x1 0xffffffff 0xfff800ff 0x78>,
+			/* Class 2: Memory System Events, bits 8-13 variant */
+			<0x0 0x2 0xffffffff 0xffffc0ff 0x78>;
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;

---
base-commit: 559f264e403e4d58d56a17595c60a1de011c5e20
change-id: 20260409-blackhole_pmu-adaf4ee64836
prerequisite-patch-id: 42ee07d35f532e172a464c2b371dec76d7ac18f1

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

