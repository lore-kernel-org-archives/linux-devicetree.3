Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96FD27732
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778433262; cv=none; b=FpJBEXgXJzSZPLMtFn9nhlA7DTZgipUbuFBTh6qqff4Bt/4ImeDB36CMxf18NVGM0Rktu7y2aqfBzwvh7r4y79AD1kknnt2Dari/hUh17T8onWiqT1Q4v1BiT1poHdJvp282Guii7wS82DAD29ClA61SGeEC3LEmMBONtTN11Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778433262; c=relaxed/simple;
	bh=gxsMxa+7bOiJ/lDPJMvUarawGmDnhc42KlrWc5UapPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u29mJ1EkMyMMMsF10/3vi3uWlbW9IEZpyeJEUqt9UCkbnFq5h0DOuGI4c57Hzp+2yuFeC2X4gq710l0eVplphy4chHXZoyy09Xj8qDUzqj7p3GGe3+RtoeOUfi/fHkgykBFq7reCAA9eAyDSDUUeIVIFGcBh3hvvseki66Qms+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZafmxip; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZafmxip"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so1411360b3a.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 10:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778433260; x=1779038060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdiKoqOYaOQxpnoifZq+HXTmHH4BYLymY6DfpNxMI/U=;
        b=QZafmxipHfuRM4jhS/Y6CImomNKb9y2sQE4Mg0vLkQhjeuIUAUEpD9SJmmKpsRvTKs
         +h/IaUn18hZ0g0UkVmzWMbVZk/8AOPF5RwZbcF0kKbRYqhRC71rwUm4j6Iv0XDA+UPtY
         TQwqQvUppGL016lRsz9sRVJ6iTRjE3H02COziGiyYSGyiDKqpAgdKW7H25Dk094CvqhG
         aY7uUR2zQW85maStLAgqlVoc+XpX1zx1PPDVPWliln4BJ3U1cQFjeUeFSzm4IUCEvxWd
         q9vVce3E7snvpebVagt/h3yE0LbQJTb+XUUrsjXpz7YsunnK8YnWJwRs3bbRP1rmhVll
         Rsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778433260; x=1779038060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdiKoqOYaOQxpnoifZq+HXTmHH4BYLymY6DfpNxMI/U=;
        b=BxKHJtRjNP9qetD+RDLFdzGHqeST8Je2DyD5eATLAVQqas46otnknDSDvgLNxTQ2lM
         fcdmCv55ABTK5nROd756kaVA0t66z/7S1wqNjHsq1IpzV81qD9dMQCzk27dQi3Ygz/mo
         iiEQo1oLMsGyzyDU9ho9WKwgbYAzMj6wQcz3IF5433Ix0dWAjxKOoGA9WpxPN1BfZb5t
         9es2lBOJWO+wem4vUWOxF9XWiG8saTiNhdtlQ5cdvuGirTnxfa9dKMdjneNnIWDd93Jg
         FmaZktIPQndri1SXy0ftswD3tKUbB1/7WENzLPuibRlTC+I0AxPJC+fWw/42BpyO7cUa
         k/9A==
X-Forwarded-Encrypted: i=1; AFNElJ+MmWNgyB4ZIbqREZZe7GWPiFbukG9rXRW8sBG5umn/+2WU0mug3ETCjSQlowBhWjjV7rE7lDiFd1gy@vger.kernel.org
X-Gm-Message-State: AOJu0YzkNovXwiq0N0pRmgtFFwbfWEdlvt53LFQz3SQfhsmSvGdbVD4J
	pii3X+v2mMV2EkPRg9MrEFgVV5JlB93nb670knBFjbzoofoCWASKxDm+
X-Gm-Gg: Acq92OHCCgIAhl5slrxtwaFMU0yBRec7NmSnK1ymKNg6V/lMWN6WwaNxm1eXVMd4zY9
	vw/sQ6UETjjqy1nO5fjkTr4U0nZcSir153M8pjTYWBd3X+aZEC/eJ5kkvRYxf04BNDXQNKM9DMH
	0CezHOTLgBJsFGofYodLM+uUV1y+NXAkopHpv7wQPFSIhvW20vVnJaiaGpmygbvFZoMdxW2fcIw
	WXTFjF8ic6CtdPj/JIDLRObeZ0RBvfAAILvVTsOZdrEvIeoxI0Em0a5Mcka+6n9q2/fbgLoLbud
	Fuk2D1iz+rkzjE708Z7IFVvkkc+rhanUiX1XUcq1WGDJqNnuh/T3ugVY3d7udyA7NLo2oTB3fwG
	kZnYR+CPr4GW8BE2HQrK+dqPqEAAQj+Y1VHimdmTDs2ElGB5Puq61Hd+4z/7ITfOMZ4TvWry6Bl
	kOTZNncUUleSWkleaMfw==
X-Received: by 2002:a05:6a00:4389:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-83e3b2da632mr6556120b3a.24.1778433260105;
        Sun, 10 May 2026 10:14:20 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f381sm21799778b3a.6.2026.05.10.10.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:14:19 -0700 (PDT)
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
Subject: [PATCH 1/2] powerpc/prom: fix /chosen properties read from wrong node
Date: Mon, 11 May 2026 02:13:52 +0900
Message-ID: <20260510171353.1406018-2-ekffu200098@gmail.com>
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

Commit 60f20d84dc81 ("of/fdt: Rework early_init_dt_scan_chosen() to
call directly") changed early_init_dt_scan_chosen() to be called
directly instead of via of_scan_flat_dt(). After this change,
early_init_dt_scan_chosen_ppc() does not behave as intended in either
case below:

- /chosen(or /chosen@0) exists: early_init_dt_scan_chosen() always 
  succeeds, so early_init_dt_scan_chosen_ppc() then reads properties
  from the root node (first iteration) instead of chosen node.

- /chosen does not exist:
  - Until commit 064e32dc5b03 ("of: fdt: Honor CONFIG_CMDLINE* even without
    /chosen node, take 2"), early_init_dt_scan_chosen() returns -ENOENT
    and early_init_dt_scan_chosen_ppc() returns 0. So of_scan_flat_dt()
    iterates over all remaining nodes. Not a bug but unnecessary.
  - After above commit, early_init_dt_scan_chosen() returns 0 and
    early_init_dt_scan_chosen_ppc() returns 1. So it reads properties
    from the root node (first iteration) instead of chosen node, same as
    the chosen node exist case above.

Instead of using of_scan_flat_dt() for chosen node handling, first call
early_init_dt_scan_chosen() directly to handle common chosen node
properties. Then call early_init_dt_scan_chosen_ppc(), which is updated
to handle powerpc-specific chosen node properties.

Both now look up chosen node directly to avoid reading from the wrong node.

Fixes: 60f20d84dc81 ("of/fdt: Rework early_init_dt_scan_chosen() to call directly")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
QEMU-based test results

$ fdtput -t bx chosen.dtb /chosen linux,crashkernel-base 00 00 00 10 00 00 00 00
$ fdtput -t bx chosen.dtb /chosen linux,crashkernel-size 00 00 00 02 00 00 00 00
$ qemu-system-ppc64 -M powernv9,dtb=chosen.dtb ...

1) AS-IS (before fix)
# cat /sys/kernel/kexec_crash_size
0

2) TO-BE (after fix)
# cat /sys/kernel/kexec_crash_size
33554432

---
 arch/powerpc/kernel/prom.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 9ed9dde7d231..34318ddb4a73 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -450,15 +450,17 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	return 0;
 }
 
-static int __init early_init_dt_scan_chosen_ppc(unsigned long node,
-						const char *uname,
-						int depth, void *data)
+static void __init early_init_dt_scan_chosen_ppc(void)
 {
+	const void *fdt = initial_boot_params;
 	const unsigned long *lprop; /* All these set by kernel, so no need to convert endian */
+	int node;
 
-	/* Use common scan routine to determine if this is the chosen node */
-	if (early_init_dt_scan_chosen(data) < 0)
-		return 0;
+	node = fdt_path_offset(fdt, "/chosen");
+	if (node < 0)
+		node = fdt_path_offset(fdt, "/chosen@0");
+	if (node < 0)
+		return;
 
 #ifdef CONFIG_PPC64
 	/* check if iommu is forced on or off */
@@ -491,9 +493,6 @@ static int __init early_init_dt_scan_chosen_ppc(unsigned long node,
 	if (lprop)
 		crashk_res.end = crashk_res.start + *lprop - 1;
 #endif
-
-	/* break now */
-	return 1;
 }
 
 /*
@@ -818,7 +817,8 @@ void __init early_init_devtree(void *params)
 	 * device-tree, including the platform type, initrd location and
 	 * size, TCE reserve, and more ...
 	 */
-	of_scan_flat_dt(early_init_dt_scan_chosen_ppc, boot_command_line);
+	early_init_dt_scan_chosen(boot_command_line);
+	early_init_dt_scan_chosen_ppc();
 
 	/* Append additional parameters passed for fadump capture kernel */
 	fadump_append_bootargs();
-- 
2.43.0

