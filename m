Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76A339EF35
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208897; cv=none; b=gorGT/llnQ60fZn5hF7A65EU8Rl3OnrCVpliLbIfbKDrxP6aePRzk9C4elkJcnlvc710ZbuIw/BnGj0/XsBQ39cLixR3HdIwz9BWwgz1e8ZI0FrvAfOae8bjxe9gHRFrK1dEmk0jTcVxKnYM+Qfl+EyEWrHHzyOyN9os4I6HmcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208897; c=relaxed/simple;
	bh=KC+KeP2JowBZu3gamRptd0wuDLOAfNANiP0q+wCsnA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnPpQZRe1e6nnoWSX8VuxtqsVvnB4IODg21YmtQGWXGafOfjv6vfpv6aF/9r/79DXryxVXqXBbQaXVRnS4n7UfxWDyNKkafl0/Zrdvx4GsFAJCwMP12aSuOywgYG/soTIrb6tZNGw4+FCEQ9ul6zOyQde/l/AlrCnuTe1pPbAxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R25zVrp1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R25zVrp1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso2083125ad.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208894; x=1781813694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EvRjKx0eOYE4LeiPY86wRBYHx+SwyyhRAbMXyCGdk8=;
        b=R25zVrp17BCEqRvVoxi8QbpyhsuYRx2YZ5r//Ak6kUxL8XdBJ89lQ2egfQBazBcsZx
         NYwe7G6qlbQ0Dqz5qIPzI384UCHCMGgEpC+KJlAC/R3Xj8TIMME2ogeNhavkjQc5ReAy
         iStnfY/NuPdbhI02oJIey+HkAavNudVe3hwMSFEhpfDuZXDjH06e+9aWhuTXMDQ27U0d
         vhsGGSI23PRlsWFuQxmcCI9XmCORFP/+rc1FVKeWI7sWDi8WrKX7sn2nBR3xuRj0ZOOg
         f42hjcv9cxahcgR9XXgOYOsZcnwe6+Fjk82B2QY6gY+NoRyNEqqpDxADygBntVRSExj4
         4OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208894; x=1781813694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EvRjKx0eOYE4LeiPY86wRBYHx+SwyyhRAbMXyCGdk8=;
        b=B8Lq/L2hB4Z8Gogtvd0WB+qRuBUZEC5kWUAC7alacU5wqRJA7MWpHDJuKYWOjdRbLE
         B9iYnrZ5azU8LPKplnJfolLkT01tDxv+cOEIXBw0FkVMx9otSge3ZC7YnUqjKxCl176y
         6UC08b75e4mTH5fUC8Uh1xBbXs/KCQzUy+2R8vCZC32zR9PZhSht8i+mCEy9aAey+i7a
         AXJ+sdegZFANJQbpg+QDNwumSEupbKjdPRQBhkxF7DRWefOKQDdVwSp4mLicpFhvsy2e
         lZTk7Hm3PHo55IsH0R5wWfiFP6NoiLcySSAdEXhNvA4RGzwS+43InhJgsAFmsbUZZF9F
         sYJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vPIDuLw8RfL6rfeMfkU5euWlhy2EqRFcNgr77rp4EzDl3xYBRgnklcRS2Z+R6Uz/jTbB27zrwraiO@vger.kernel.org
X-Gm-Message-State: AOJu0YywphQXH6D97o5TYUdRJ2iKJBRu0rBqNSisZcOT8y/GSLyX6CJT
	gHwMIkTJwV3jhwQUUMaiZEINJNGxvoKFOexKFqMI3nZ6VirERECMQlKA
X-Gm-Gg: Acq92OHA3JWU5bnvyhQfK9SoWSYjrBspYaq1N08tl+T51jzisO9tplnceCqS2+6ELmB
	Yc0LwNslDBVrBhGW238p/D+04WlXvUbI9uMpeFBTWiwXchm11unY7qw4j2YiRwTjCKGXr5YFcMW
	OwIXfR5ZL/tgxGvZ+vZbCPK6PmW9nFthB75vHv1Mc1FoO7Nh2AFxwirroLSFDj2gGKqi+tEFHw4
	0GqbJ97a/plffnyDs4ky0KIxcdThHqzNb3ROWUdtb3Ir4vgFDX7yHp6B8H32nwo05dVyTn/7BGU
	nDOoeJWeGmO5sfu6eRH0Bpu4sf0uKyVX0WDTo/zWv66UbN9B/CUAqvHQtPlpqsLvroAdmU5gAZM
	D5Uut7bwwBYuUe97K9NmZt6Z0KxCS3c1U0YwfAlocCzESuMOh6wQml090g/1vw9XMjvOrl/z1VA
	==
X-Received: by 2002:a17:902:e78b:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2c2f092ad9dmr52178155ad.9.1781208894311;
        Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:50 -0400
Subject: [PATCH v4 13/16] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-13-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=aIDENBFY4Tz1hqn0W61EOefEH19QM+HExbm6+TQTBeI=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtscO7srcsmPNoumimeNn3glenWfu11coN68yXLxOYZ
 /5uzdfPHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjAReV6G/yUubxnmvF/+6MZL
 l8/SJWbvGHYUuhnHuDRumFUzqUhm+xuG/wlJztWWR8uzsl2qWjYVRu3cF/DJ6M3TP4cnOldPNJr
 zmx0A
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec13..febf51e127f70 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -214,6 +214,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..5d9cb108a6232 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0

