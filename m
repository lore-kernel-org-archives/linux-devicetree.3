Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593703CD8C5
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442079; cv=none; b=FEvUMBODzFIlLG6k/RoRHQpmlVPwIsr9AJcW8yhSX27SjEWqrFUMXopJpEJB410KPIQVcs0g1PBkNxhLU8BTKzD0jk20Y2PEB3faSJnyu6doyi8G2X5b390k9yt6cr/ObUGvIuswVntWNuwfzlGLfTk4PO+S+lu1fbV1G7Cp3mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442079; c=relaxed/simple;
	bh=Q7RYZju2TF5FEkiS6NU6Z8BhXvcsipUIIAlY+MksXC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgU3zuEGSHO3hkFYepKWJMUgN+kuZQEgTsc4uy4E68twDJ/rvAoRaN2HqVhtQkD29Vk+GLe+kIL0xoBK5qnS5xo0T1cFNnI+ejWed0LsCjEfzWX+xNyJxjpFPOkTqBXFEuW4kLFXaPzOb9oClK7ydVj1+e/ieRd6e/0H+dUKXWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwHzEAxN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwHzEAxN"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c35980fdso31362035ad.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 16:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442078; x=1781046878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8Fuf4QXCppsW5bDsc2WfyDl0yodmONaopvjB2bbG7o=;
        b=gwHzEAxNHqclSV5Z2GJCIj6I8mz//jbFqtFv4010SDrMq8y5dasEYVT+S2nbt3HV5I
         HMviBIPQG9MHO1gjB/KHUjJx/oBs74WWMHH7JDqpujWhMueyUW+RCwwtXiEHIoXKAmmb
         ebIIfkScVF6V66tV7XgzaiFkW/HuQD+S11cRX4BdnsNs9dVGi+bNDl3H1s1S3Hxii7sB
         vKUr9p5/J8XZZTpY6oqyd5G5sUxToPSVYir2kOEYCHnOUDAjFwr9thNMEI//FDU3feUb
         1Lg7ygsBIDUIPerbICktefCOCj6Genk9bBuaPp3JDHIKc2d2nOLxHe729KwyPXPR5yn6
         kgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442078; x=1781046878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8Fuf4QXCppsW5bDsc2WfyDl0yodmONaopvjB2bbG7o=;
        b=aXOEUsC4H93HaTnwwwhAsQdsluso1AT8t2MjS/lK/k3deCSCjQCMAO2ID95PbQ3kNF
         9q1k7ooj3JSpMxprnZ1+PN08SSyzsY/Yz4M8u2jhAKFRmkRNOP0xYRB5FLLpZ6eqUtf3
         XUT2P6mJL9RecdM5Tm2ruhI3LaPl0aZ6C0b9xVGOJXRVKfVHqFMAFhO9uEHa+BS6Br9e
         6chows9DT70zA3cIXDkKyNq+MVEUtckS8vxwzytX2Ch/oZf22JLqzndUuwRVh3RNBjgq
         AJNQQcfSqZcJ9T8+wgJ2MD1VxVZ1Dpt/MGbERLCfgskiXn3tBEB3R+zYuki8NAZMXHSC
         WQLw==
X-Forwarded-Encrypted: i=1; AFNElJ855E9gy989yNSTjiiwRjCz1uap/HHDVDoe51XT0POXuco1P6a+35P2hAnsMazn4rAEtuq/jonhrFbg@vger.kernel.org
X-Gm-Message-State: AOJu0YxzvbyJU/M0+lREVnIH9m9qX1qTHBrU9Lv/qdEtSi0cEB5oti4s
	me4hfflWXBbsgOna6gCeZa/AwNpYdBcQjMj0O1DA7ILwVe36W9eDn7/V
X-Gm-Gg: Acq92OHiOeE8Jv+eUCsTb9eFr1/b9p8VIgE5HnPvjsxIScXpo9oFI931xlm3QFmFQQi
	HnT2RPQW/MjXxHJKRK9wrARY4JrKzfdo9VsIGKzW5OCBY4Rvpd2sZHUY4pBdPzXy2zqUfryrvpX
	U3LcJU4ONuceK+JnM14KCKRgaOEwa1ha8VU0p+054Z5N+PpdV+KC8H3cChgffrtI4xEJgMM5Wax
	iJmWIwC5GWiqY0b/7/QQ1YGNJn5jsWj333Yvvq0Sj3BdKmv1cDNL4FeIqtekRpgwhrka1JASr3k
	BB1kx+7Ej3RXqumGYVRUKz4bOz1ON7DIXMF1D6via4OMhabtZYYxp41pPNwoyqFnU/LOewhS9fR
	x19nDnQHMpCBrUlKxBD2JIHiLAAUiIyDqTECEf4DObTqQWK420D58XfxPP8psMrcISVQA59JXMI
	etL+RP21XSOA==
X-Received: by 2002:a17:902:e78b:b0:2c0:fa4e:9208 with SMTP id d9443c01a7336-2c163a2bb94mr7334255ad.14.1780442077667;
        Tue, 02 Jun 2026 16:14:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:37 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:05 -0400
Subject: [PATCH v3 10/15] riscv: dts: spacemit: k1: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-10-5529a7b28384@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10074; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=Q7RYZju2TF5FEkiS6NU6Z8BhXvcsipUIIAlY+MksXC4=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHtYKyZl+nmwaId+LzlkfeXVeTUokc9GleR9TWLkCm
 ZSm/T3eUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABOpWMnIcHbdlCcKC308t586
 6bTzYMKFtmn5n8wSl74IuC7m/FTgeDzD/7Kvh7K5/p3YE/vWo9extXFm394pDUWNp05MCjtSqjz
 NjBkA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The K1 X60 cores have 64-byte cache blocks, described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b.  Declare it in
each core's riscv,isa-extensions and in the deprecated riscv,isa string.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 80 ++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f0bad6855c970..e6fc684ad3898 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -54,12 +54,12 @@ cpu_0: cpu@0 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <0>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -84,12 +84,12 @@ cpu_1: cpu@1 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <1>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -114,12 +114,12 @@ cpu_2: cpu@2 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <2>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -144,12 +144,12 @@ cpu_3: cpu@3 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <3>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -174,12 +174,12 @@ cpu_4: cpu@4 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <4>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -204,12 +204,12 @@ cpu_5: cpu@5 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <5>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -234,12 +234,12 @@ cpu_6: cpu@6 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <6>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -264,12 +264,12 @@ cpu_7: cpu@7 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <7>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;

-- 
2.43.0

