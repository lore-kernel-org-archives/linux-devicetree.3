Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F52D37FF41
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852592; cv=none; b=PZzALhcAmzSmUR9qm+7YjO/uNJzVBtqVCMxQHiDUeKQg9th4+UtUuohhIZHYlb2et0x30N1joxblp3ic4KlIWReyak4dvcbaZXgPsBsa27x4P2r7nqv+RUkuf6Sc5j3HFNnZt8okVSkcuCsKDnfa1djucgmgxM/6bGtsTcRi5LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852592; c=relaxed/simple;
	bh=ILe8sZYbhc1aPGHkfBxgnEvKOHpdfl8WUXOCF6YnUmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciKQU+x0S07RXbeCOgIn1EMxMefAcmgtIPUUivTz4SL47ADC21tAf7iprPt5GCOOp9/M9LK4cpnDHYn+XV2fT2yNLHkUUXTGLRo9eZjsnSaNsEemBnYkGwYiXa7rezlQnvClUuY5f7pKnWAioPWSqS1GmOSO8hXzWIXTSCBu1MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOd/IDkG; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOd/IDkG"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-83945063f70so5571452b3a.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852591; x=1780457391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=EOd/IDkGrM7hPkwS2DXiUtSIAy72o1sRBJPS8ugd+FVASvGgnUbORy/mOZDRI5INtM
         DzXrh60O0r36rU7611E4tSriQKz+kjVS3mkk7GyP/93WazhzaRKZaanTYQYoDzqGHxga
         nWGyMO/i1/3H0oy+TypX5NOa284kw+GISmq7ykUzGozv46+LdGFFzav5e72OGxtJJ4EV
         fj0amUqoyHdOfVWci9ksUdurfPHgFVCV0C5LedUvTg2l8Dpm39vJVw2Hbzs63FhDWkcE
         CAoUKRKjlUZMCr+wKbJ9ApFZ/oCz5wPkS9cdGUfjf8H3CHn4ayLExIckxC5DpG+YNSGc
         NoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852591; x=1780457391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=YLigujdgpEK3urXaQmT/jWvxDcvb8pqigI3rKKgDuWfi+y9daM+vj8Ew4Pn+UCCDst
         jwRuMgQAdoA0/ActJzKvnOU6IWY/TsuP2JIwxqpPOP10wuzT9srLSVlV3RagLbwhUxCz
         Ks9OygG6u93gtMmF3/K9S1zC98kCpfoBmBa+yJcqt46nzORkOEwwOEj/iVIktp48xdcP
         t6jumUSX7wqXqG3Y3ahTNbD3R3aqMj7WoU1KAT3dU0heXqo89cHDTabBXaUBrEz8SVmW
         9jEjdi+p3fOE1zbU84vlsWNGHvg1C8E2/jihkxW35CN7W1/IWVwrJPODgB5hJBKejVUG
         457g==
X-Forwarded-Encrypted: i=1; AFNElJ8J9NIrbaaeF/6Ys1LqfivmAttuUDk1jNDhjjIrGgwhcM1btVVimsWuwN8o9LNLMAfJ+1NqoqevOuqe@vger.kernel.org
X-Gm-Message-State: AOJu0YykPOdmWUPFRwr7DbZiGFtw61aOf4hyZJLE6WSDTlvXamkD0aS4
	d8CymJ3wRB6zYfF3ID7YdaGtv0Lkb8pM08F2GU2gCx0DHHB+1eImy1q+
X-Gm-Gg: Acq92OG1tIjxNI0MnSSIei8gUZlCWFDSkUZiCGfZAULztfxpcpAUL1Q4VjfQ5gCPHK3
	9sTAqxOCA/k4ehx5rO1+sfwBdKH+5RKLd/Qse0EOXTmLCQ+7inj33LAPl3QVs5OpaJqX11sa5LC
	CGDH/aqd1jPopIRLBST+Rht3EZtaeDNzhIHPmCQOYzTvXqtrszSGOXTyLOZ5kA5FIW2KVaMl/Fc
	JWpXbHjOlecFwyg1jIjbrvkpmMfE6NIi5SeKzrHq+R76QgC5kUeTNe6Lrsr3Uq7BZtADRndlRz0
	nTsIBctCPJfz1m0l41KsLxkX0ONEhz+jGbSe00IYxI6ujbsnu9OPwmIJHttX3A9VIvVCTmnJvjq
	46Slema+/Wvlq8Py2RD97mFChzvxDclUK0It5Wl/ySvDRdZJS6U4OzwENI90hdrJ62SnoaSD73U
	TR52kijmB4VYqQ7Uo7A5Qc9aPi4U4Z/XtlRzaG
X-Received: by 2002:a05:6a00:b483:b0:82f:6de5:90e1 with SMTP id d2e1a72fcca58-841611e8e64mr16309875b3a.24.1779852590643;
        Tue, 26 May 2026 20:29:50 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:50 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 02/11] kexec/crash: provide crash_exclude_mem_range() stub when CONFIG_CRASH_DUMP=n
Date: Wed, 27 May 2026 11:29:08 +0800
Message-ID: <20260527032917.3385849-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that excludes non-dumpable reserved
regions from the kdump vmcore and will call crash_exclude_mem_range()
from generic, non-arch code.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 include/linux/crash_core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index c1dee3f971a9..0033d4777648 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -87,6 +87,12 @@ static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 static inline int kexec_crash_loaded(void) { return 0; }
 static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
+static inline int crash_exclude_mem_range(struct crash_mem *mem,
+					  unsigned long long mstart,
+					  unsigned long long mend)
+{
+	return 0;
+}
 #endif /* CONFIG_CRASH_DUMP*/
 
 #ifdef CONFIG_CRASH_DM_CRYPT
-- 
2.43.0

