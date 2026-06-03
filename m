Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0C3CF952
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 23:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442091; cv=none; b=WVVl0iuG8LOJ4RKdSQEf5h4nNEv+/Le2arg9H7Qov8ldPKm44SzbluXm1DmPUbZuiOlG08a6fXSRLUcUOjcGf+C7p1Pt+jOgOlW1TC4FJwV2TBRnlm9zSqzWF8Ruuj/YZGytHu/+vAi1kTGlXEgv3EM5YSOvx3eAoe+PNiKoYtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442091; c=relaxed/simple;
	bh=nb7NVTLwEPfSfdQZ6GxDJz+A4OB+DaiRTtoN5drlF7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nDGGBZO+a7y8HLV9tZ/MbfZCQey1YFgdTTzK+I6PXh+iLPZ48vTrgOkW6sUFUBIthjAT9Q1ri817vMT1RJofJ4qIhUG5W+3lnW8mcKEafxfMp/grHBTtX6kUP6ZgKPC1lE9JEHAvDAK48m5Bw5ZFqG0Afl2bCkDVdLRkmlZFAUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnCexg56; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnCexg56"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so20683795ad.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 16:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442089; x=1781046889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/ML8+hzJH2M7AcSqLjLBGZwHewuGslxEK4RlYrYBpQ=;
        b=OnCexg56mF4ND7g/tLpDr5QY1e1I0q9ULETwEFABvc6w1xsyH85NKrW6SyRLvKDj9J
         RjhzIgIzgygEPsiTgIkGy+vf/quy4lmStSZvcktSjix3ef6Hx8NX0p9wdmL3Pvsd5r/o
         ZcsO5pimNlN/RkDTCPgvMFDaKzDIkMCd35yTLe+Tco1WtanmZdYar5rx8aXbONT8BafL
         4zIEDIS83oI8AnKFnlOIoh+eACBQyf95eL7PyhbP0qCfABDC6yyfuxMpFkMylFwtu7nT
         8dUqQpFCoonPGQuxq23HXYIF7Txe1Ub6WVIRuy9gmvwAyMzWGVTHQnuZnUpccw0uT2tM
         97bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442089; x=1781046889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/ML8+hzJH2M7AcSqLjLBGZwHewuGslxEK4RlYrYBpQ=;
        b=KuygHm5OKTZlOflOGk/UdP167G72qmupY/uSka76y2+LU7lL/y1J/e8pU706Gb9lez
         hjqXyI+YUlhpSowXDueMTqd1SSNTktUagjM7drZKGS62PxbzSIUrJ2sutiaD2JtMsjF1
         SiBSzdbL+mFZEB2fjaJj/XIiOGsZQ9NlIO54aiDk7UfKo3hrSQrOWJ6aALDTWope9ihB
         HXzPUEhAvnX+z6D9SX7oKqjN8jdwMjgtugbHXj1TIrCfkC0qT9Xb/PrtenfqwN0sZ1Xh
         atZUlvILF4XItTbJ28ifmaUv1i6DIsz90lVuqfEMsUh7ofHYKtjfK6x55w0KBvl4f1MQ
         OLng==
X-Forwarded-Encrypted: i=1; AFNElJ8Tu+85K6gUdA+WDlYLERKXLrZVIZNWlWYqF7M+dKnG0XTRI+b1aVvVVL8B4MBL8kQDMekxjKtAEV4c@vger.kernel.org
X-Gm-Message-State: AOJu0YzdEEqio1YhKCjmIyqyzrYkCo23T9OY443bEQwa/SMbmZrdtpto
	s40K+ArCaB0plYN/p5QigMl1Jz74Nxrx4p84u8oipE1j4uT9le96Owy1
X-Gm-Gg: Acq92OHs3AzUTfullO3NQE+9cSuQ9k/cCwdYKrNHr7q5XuWb/B13ec0FtIxRi1dYCsL
	F1V2OW0IJY9VsTtU113tr2DPWhy2btA1d+TW/oTOgnOu5cq2OQkypP8xpXkIUuouJxjLRp2m9j9
	pwGTq2ljPVrnggCzVeW+S2Ke0JT7itn63IiIMM5q69DabsbGYDa7kZ/Ik+Fye8OlrEXdqiZ0WlB
	dxji1w/ae8j5KQ0il7Gti290fKX18sxlp4ArvFH4zOi7A1/+kyfE+V7UNuCR361bwsko3KL0rax
	cxQSXmouKN9FQegYQUzScTGplGelv+NBNKUKDuirW3jbLGFCsoGAuOevRrVwcP7X5mJT+7kb7hQ
	Vuc2B6735lQiizb6BeBRMQEg8jneLthPRIfEV3XZaTnxc5LFhACvDQaRJqRpT59OfKtY7loeJHn
	I8gqWdHFxOzA==
X-Received: by 2002:a17:903:4b50:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2c1640b772emr6249075ad.34.1780442088632;
        Tue, 02 Jun 2026 16:14:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:48 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:06 -0400
Subject: [PATCH v3 11/15] riscv: dts: sophgo: sg2044: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-11-5529a7b28384@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=28669; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=nb7NVTLwEPfSfdQZ6GxDJz+A4OB+DaiRTtoN5drlF7k=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHjbN82wJql8S53/eETXVQSYz8Iph3a9p3Bn+Z/s/r
 rVv/tvfUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABMxWczwP+fs3IPRF+9cecnV
 wOkQX1jdtUTg+fMpjEtehjfbxt9/wc3I8N6r4+aBuarOOvIxH/34mCaseraP62Pf3XOKyiE5117
 dYwQA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The SG2044 cores have 64-byte cache blocks, described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b.  Declare it in
each core's riscv,isa-extensions.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: New patch.
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 128 ++++++++++++++--------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 3135409c21492..2ac4a41bbc3a7 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -31,7 +31,7 @@ cpu0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -67,7 +67,7 @@ cpu1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -103,7 +103,7 @@ cpu2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -139,7 +139,7 @@ cpu3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -175,7 +175,7 @@ cpu4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -211,7 +211,7 @@ cpu5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -247,7 +247,7 @@ cpu6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -283,7 +283,7 @@ cpu7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -319,7 +319,7 @@ cpu8: cpu@8 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -355,7 +355,7 @@ cpu9: cpu@9 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -391,7 +391,7 @@ cpu10: cpu@10 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -427,7 +427,7 @@ cpu11: cpu@11 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -463,7 +463,7 @@ cpu12: cpu@12 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -499,7 +499,7 @@ cpu13: cpu@13 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -535,7 +535,7 @@ cpu14: cpu@14 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -571,7 +571,7 @@ cpu15: cpu@15 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -607,7 +607,7 @@ cpu16: cpu@16 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -643,7 +643,7 @@ cpu17: cpu@17 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -679,7 +679,7 @@ cpu18: cpu@18 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -715,7 +715,7 @@ cpu19: cpu@19 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -751,7 +751,7 @@ cpu20: cpu@20 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -787,7 +787,7 @@ cpu21: cpu@21 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -823,7 +823,7 @@ cpu22: cpu@22 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -859,7 +859,7 @@ cpu23: cpu@23 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -895,7 +895,7 @@ cpu24: cpu@24 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -931,7 +931,7 @@ cpu25: cpu@25 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -967,7 +967,7 @@ cpu26: cpu@26 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1003,7 +1003,7 @@ cpu27: cpu@27 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1039,7 +1039,7 @@ cpu28: cpu@28 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1075,7 +1075,7 @@ cpu29: cpu@29 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1111,7 +1111,7 @@ cpu30: cpu@30 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1147,7 +1147,7 @@ cpu31: cpu@31 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1183,7 +1183,7 @@ cpu32: cpu@32 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1219,7 +1219,7 @@ cpu33: cpu@33 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1255,7 +1255,7 @@ cpu34: cpu@34 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1291,7 +1291,7 @@ cpu35: cpu@35 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1327,7 +1327,7 @@ cpu36: cpu@36 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1363,7 +1363,7 @@ cpu37: cpu@37 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1399,7 +1399,7 @@ cpu38: cpu@38 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1435,7 +1435,7 @@ cpu39: cpu@39 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1471,7 +1471,7 @@ cpu40: cpu@40 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1507,7 +1507,7 @@ cpu41: cpu@41 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1543,7 +1543,7 @@ cpu42: cpu@42 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1579,7 +1579,7 @@ cpu43: cpu@43 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1615,7 +1615,7 @@ cpu44: cpu@44 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1651,7 +1651,7 @@ cpu45: cpu@45 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1687,7 +1687,7 @@ cpu46: cpu@46 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1723,7 +1723,7 @@ cpu47: cpu@47 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1759,7 +1759,7 @@ cpu48: cpu@48 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1795,7 +1795,7 @@ cpu49: cpu@49 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1831,7 +1831,7 @@ cpu50: cpu@50 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1867,7 +1867,7 @@ cpu51: cpu@51 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1903,7 +1903,7 @@ cpu52: cpu@52 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1939,7 +1939,7 @@ cpu53: cpu@53 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1975,7 +1975,7 @@ cpu54: cpu@54 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2011,7 +2011,7 @@ cpu55: cpu@55 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2047,7 +2047,7 @@ cpu56: cpu@56 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2083,7 +2083,7 @@ cpu57: cpu@57 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2119,7 +2119,7 @@ cpu58: cpu@58 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2155,7 +2155,7 @@ cpu59: cpu@59 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2191,7 +2191,7 @@ cpu60: cpu@60 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2227,7 +2227,7 @@ cpu61: cpu@61 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2263,7 +2263,7 @@ cpu62: cpu@62 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2299,7 +2299,7 @@ cpu63: cpu@63 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",

-- 
2.43.0

