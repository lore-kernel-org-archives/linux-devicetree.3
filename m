Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227B727732
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 17:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778433265; cv=none; b=MQxojdm8zR1pneq0TllMzZJO0NXz9lPsSwIkldOrJrTkZEGsKRlqr1gYEBGlUZQzbYN4sWJyxRFL369bMrfrIP8N3IvbvDokOa4ey388wu/R9mgOTF3d0vzFeqwawlnnvV3JwaSLdOiOOLNZb9WLVccKv9gXihxGurfPin31hW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778433265; c=relaxed/simple;
	bh=FsVD20XStkH7dQoGgoAT5fw1oW8irCKLqi9Nh+ovXPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWSb6dtrIuylTdzlC1yYVg2Q0Z+kdlFZLIdqW0WeTeNS5iUlorJ3+uPipTkd1VL4D3pHaAWPpRdSVPRMC0sodiWT5/Bd/++//B2D55Ga7o6+/ROMQ8l/dU8a2mUuEAng9BXl/JGDKlGqkFH1lY9sTIv8utiUjF0hbm3dvAkZQE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9/4dbk3; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9/4dbk3"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c82471904fcso1453883a12.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778433263; x=1779038063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuaa/iv38+EpjRtmaMrOBvX+X90TeEo1RpmrNxck1uE=;
        b=a9/4dbk3+KFc8UMexccgpeqicfeGdfQta0XwWrFGEWLucxf7/ktMPY1+QKa6CC7dhH
         D0o9gGXJCqGNxFpO3saILRgVaFGkpkpF1enz0J6gsQA4fd+V99UC3s2608OnN0Sfg9Oy
         9rgHcLsyK1wtLkp50lS30jR4NJVSN3WgoGDyD+fxYPNRDQOgfUFvHQ9R41eZwCZ1dKAV
         KAQTNIxfFBrgAKc6oSq2yVDDF4KKaE8UqDJpkML0rd0PBVEzYc2dPjoRnarx2k8P1fta
         QpdYPM4xqK8aegcvQ0DwdiY9EvxFWSzyh+VzILYbVAzvMlQYJJuJQzzHJ3AHYn41rHju
         QPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778433263; x=1779038063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iuaa/iv38+EpjRtmaMrOBvX+X90TeEo1RpmrNxck1uE=;
        b=hkQjYknjY0Q6Je5YH+1HJl9YibnMZ/3HfN2fiRwtpW8eIOyctJLvWSQyc1TziKk2QF
         70hAy6XMS3G+jWa1AZs5kK0jFMnApJkjLa6sOL3dX471WtceXmCYvKWhOUE8l13umIho
         l/2Fe9vlgkzf8LTrpreZsgl7zkhvBpHpmV7393l3VIfO9SeQgZLlkyveo5MTQc9SW0gL
         sFv4Q9Y6Ahpr6Rtt9pc/Ply/ypSJJxDtJYKNjW/Z+A+NXaECpf0bGddd+9JNzPYPmLTa
         cuqAT2hVSdWZmmS94tAFZbhKI5hSwwq5kHCGIMTL6o9SdcDmyeGkxFstv0r82h3TO6Zy
         KjbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6rmSQP5u4IhAe3m6snpphn15s5XetmNtIMp8pssVIngRzwF8YZhVmtT7iwlN6RvknWUqi54znHshX@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMrEw5iJxnhzluGFVzBnYdEaa4oGfNL0IWgf2JH1FYHlIW3v0
	Byl/vvS+om7YVnmaeXjYvJ/aIhyf+cIx++VGr6gTTqT+or89JAmXjm4R
X-Gm-Gg: Acq92OHjLZAsTa4Bv0Dk3cyhgpFu72Xe7TTCcYvSnR6hhEg+QRa1jAz60QX1pAZMmEZ
	yuKAv+OAZryPt9jJwVthXvaAhZketgFXlrTBLpLrBlFaPucUtNsNZ8jWuXaL90GKCgOISukbnIN
	HYWbzwa+mKrIpNzz+GCaokV0wImcxuPQYfuQVq3w6sPNXDLaC/DKV2E4xwmE+nrS2uifakRFHy7
	Aaym69b7N6SmdaNwo16UYvOhJufbAJYoBMjtK2rqLETdS7Cq1qH7+p/IkBX2qBisV1OKhnUVLhD
	ZXPLksbxhdPkruTphe5P+9zE+QxPvQVOZzoVVVseWxYOWyzhvPnQxTfUAB1f/Qe3f5uyCVNlFqu
	dI5U/zct/gpFUTslcM+du7SMJ5f/aeLXOdW0Jhuish3f7MfHa5GF39wb1gE0XnRcybkatyciM1Z
	cLx6NeKU3S+M777PR6Axz/Xw7KKyv2
X-Received: by 2002:a05:6a21:328e:b0:398:a76e:4ad4 with SMTP id adf61e73a8af0-3aa5a915f0emr23841929637.21.1778433263409;
        Sun, 10 May 2026 10:14:23 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f381sm21799778b3a.6.2026.05.10.10.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:14:23 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 2/2] of/fdt: make early_init_dt_scan_chosen() return void
Date: Mon, 11 May 2026 02:13:53 +0900
Message-ID: <20260510171353.1406018-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510171353.1406018-1-ekffu200098@gmail.com>
References: <20260510171353.1406018-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 064e32dc5b03 ("of: fdt: Honor CONFIG_CMDLINE* even
without /chosen node, take 2"), early_init_dt_scan_chosen() always
returns 0, so the return value checks at its callers have become
dead code.

Drop the return value, change the function to return void, and
update its declaration and callers accordingly. No functional
change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
dt-test result

[    0.684136] ### dt-test ### start of unittest - you will see error messages
[    0.685849] ### dt-test ### EXPECT \ : Duplicate name in testcase-data, renamed to "duplicate-name#1"
[    0.685870] Duplicate name in testcase-data, renamed to "duplicate-name#1"
[    0.689496] ### dt-test ### EXPECT / : Duplicate name in testcase-data, renamed to "duplicate-name#1"

...

[    1.693384] ### dt-test ### EXPECT / : OF: resolver: overlay phandle fixup failed: -22
[    1.693386] ### dt-test ### EXPECT / : OF: resolver: node label 'this_label_does_not_exist' not found in live devicetree symbols table
[    1.694968] ### dt-test ### end of unittest - 405 passed, 0 failed
---
 drivers/of/fdt.c       | 10 ++--------
 include/linux/of_fdt.h |  2 +-
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ba65e36e183c..1b2cf5b29926 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1087,7 +1087,7 @@ int __init early_init_dt_scan_memory(void)
 	return found_memory;
 }
 
-int __init early_init_dt_scan_chosen(char *cmdline)
+void __init early_init_dt_scan_chosen(char *cmdline)
 {
 	int l, node;
 	const char *p;
@@ -1144,8 +1144,6 @@ int __init early_init_dt_scan_chosen(char *cmdline)
 #endif /* CONFIG_CMDLINE */
 
 	pr_debug("Command line is: %s\n", (char *)cmdline);
-
-	return 0;
 }
 
 #ifndef MIN_MEMBLOCK_ADDR
@@ -1226,12 +1224,8 @@ bool __init early_init_dt_verify(void *dt_virt, phys_addr_t dt_phys)
 
 void __init early_init_dt_scan_nodes(void)
 {
-	int rc;
-
 	/* Retrieve various information from the /chosen node */
-	rc = early_init_dt_scan_chosen(boot_command_line);
-	if (rc)
-		pr_warn("No chosen node found, continuing without\n");
+	early_init_dt_scan_chosen(boot_command_line);
 
 	/* Setup memory, calling early_init_dt_add_memory_arch */
 	early_init_dt_scan_memory();
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 51dadbaa3d63..09e9d45f432b 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -68,7 +68,7 @@ extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
 extern unsigned long of_get_flat_dt_root(void);
 extern uint32_t of_get_flat_dt_phandle(unsigned long node);
 
-extern int early_init_dt_scan_chosen(char *cmdline);
+extern void early_init_dt_scan_chosen(char *cmdline);
 extern int early_init_dt_scan_memory(void);
 extern void early_init_dt_check_for_usable_mem_range(void);
 extern int early_init_dt_scan_chosen_stdout(void);
-- 
2.43.0

