Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA07A39794A
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120230; cv=none; b=iVoZxik62hSkn4n5JUzbadme8/1VgKCtxym3m/FMIlb8kgE9U6WphhKrQg3tl4aBAkBpte9E4QLRV1an2PlglWTiy43Wsvn9QPMJSv/J2ztNvP/OfZJ69hkQUacAJe/y4sqVQT+ZVnHdK252NytLQwwHWMSLdNBunWO4l14LlzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120230; c=relaxed/simple;
	bh=KS2Sad4txxYAPU7Ulhsill0lGwhrig2221eGQ+9zjh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8p8JhLYJaUzswpV1BtOpZPK2KRQMrgWc7HwhO2sM1pWS0PdOjWkui3LMfb6kACIl//nt9tlJ89FtRNCkfWCud+3TiRrO8ZI7RXRT7+MZaW6FNMHd4zb8ZgJ9WTfOC8zZOUl4myLtJexG9laqDXbpHCNcVDLq8b6H+QJE/hES8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IV2Ytxcg; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IV2Ytxcg"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so1652526a91.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120228; x=1792725028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=IV2YtxcgOAoslEI82SjyNA8PfCAR1TnlJ+VuscCAUCNz0Z0oQfDszOQsHtHLEDKw7c
         Ipss62GbmLPgat1FPw6rUuN1UjWCrOX1xceGrvDiOuVGNubEPTHDp9lvykxGGZext7JH
         fhzVM4hhjtlWlnhHSZJiWZhGjgK0aUrJXymVyhTrh/lOoQFPdYVwtU/dHPayhtf1xZ5d
         P94FhMjVPxIIMAjiw7znSVoh7ptxkximV9wmtFw6BdQETgMK09Mp3sRKc7qQnKRk6bFK
         lCR/KSWGcbgdpvmFxKK8RfZx7sC0w3Ua/Cz9cC+C7AJ2CxhRLrBKBMxPXj4gvE4OruJZ
         vwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120228; x=1792725028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=K2H/xEFfVbuangq0dhDcqCDl9lPVkNQKZbwdW9Ai3+s86aEuTNZMKIq2QzwoXVlM1r
         QU08qlTwQHgrsY26SblBLUY98dN1R45Bj/5VsEfS7WsOCwlM+PxvDNwa/2TvAylm/fQX
         IA7YQNGX4xcIpx61ZFRe5DnLmpGljy292kuSCCnkSln7NvKN6sJ1j8JsGoWZUjKtDu2m
         p8ICLis19piUu8vdaj8/P1wyuuzKDaOu3QzoXWa9/KMSYGkWGf1nOoAFcxKc/MrKhhh1
         itVAmBky+IyXzex9+7Zoe9rt6/H0duzQ04SqjIXSfQwczXAhjWtm+77A4kJnrPpUgSTu
         XyNg==
X-Forwarded-Encrypted: i=1; AKwUvBzJWOHQhjhgrk3JdHzd9ocgDrr+Mjiqt3JPSCEyPaPxGESh2aWum+qXpjCGx2OBTP7CNVRq2pRtB5Jm@vger.kernel.org
X-Gm-Message-State: AFq9FYK83wzZgcdNOmKu/asFn9cCgPAM7M+6JEW+BoB3LiNPDlh9e4Pu
	3Lvj7g45gWzSyYPwGipKLUeKNHWKK+4lokwEVpOru6JvdVAtW+FXFtrc
X-Gm-Gg: AYBFou1lLfPB5mB5Q+phOwHKb+GSFfDh1eqezb1SBd0WYFRAkazG8awElckbbyzlxQC
	+nSIJtIY0lj4IW8L9GmRKvuEd5fYXiIoh8sIXKyA0OkJR8y2C+VJIftPwNT25Hr2Pg3s3LMb5Vb
	y45c28J6x1aeFZNrWohvELomnW/0R1+MtXIFnP5uQFjCGhjoOWLQ8/hKEDbdkotHMoRSGhMUUju
	PFwwq7pTv1wEmKKnSMnP78tLh2ACfiXJqHBGoIV7S+DxxEGZSpwviEKP23w9PF1N4G7Vteoo0Q2
	EXngUFmOLNMb8Yt7iHjL/76vG0fjALBR9HUCAvXJAKGz4aj+M2fAUMNAXPYCb2MnqqVrQoOaUEd
	FoNoGL6QFl3dm8dQshsCSIAlys0dP5QtcMNzyJqlbcOD89+8IIOMKE6I8FY/4rZ3RMqtUOLdVRP
	/iuuWk4DosWNv7alq5+LxNdhNC3RjsbJFxkIP5xYmCboMTXqEBtv29kE7gsKEwJwW6uM8+v7bs4
	ir5N0P1c4f/MIIimZM0VA==
X-Received: by 2002:a17:90b:2d86:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ab3a60d1eamr16967413a91.20.1792120228159;
        Thu, 15 Oct 2026 20:10:28 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:10:27 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v8 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 16 Oct 2026 11:08:53 +0800
Message-ID: <20261016030855.4062882-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP; the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 49da515859f2..99c0f3ccc297 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..d7bfc38ac762 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -567,6 +567,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

