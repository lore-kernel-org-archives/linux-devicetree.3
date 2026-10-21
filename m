Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571517;
	b=sUWVIqXkehiKqK26FUZMjbpUxBp3O0JPQIA9p7X+2daziqSRhE0HynSYagL2M4pSbbSd
	 fRcGJ0znxsIblOn+KxL5KCCvzIzCr0oRm1wXJhKQOJb7AKGhGP+0T0te7OVj560EfXPEg
	 QG0khCZhMa1X20F1FBGiMjOWVrvy5viureqBr823UiYbPvTi7RKMx4YKfVcZj8TmJteal
	 naWIHnqJq/8zrFkQ7d4TjlO2kQucCz/uBtJ8Z3TmtKX2rFV/PgViON8kFFpMtNVlxb7k0
	 VBI57SSal642dp5f4fPPEvCBWuPYMqOPCg//JdiTj1Bgmi13+T6muQA6zsPnZ4bFKEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
	b=SZ8dgfR3SJdLSJWcPJrrvqd7hY3qnGmbM3I5OcQIC01zsgVd9frxyr5lCmq7epmPz/WV
	 4BfauyHaJjZH4tzKxlvzisznUdMJ8pLkRCykBSdbfN2PZW+nZO9yKWTKEjacKz+DxkVHy
	 EGz+xL8jkMmM08wPGpdnKufKzj/DBFEb3zk3YfciMmWouVrtmWw+4f22o35co+Z39eeao
	 GaCAsRcCePv5fDyQnNyfeVogoIo71JfXJM10cXqC0iwazfTlwz8SyzfZ66k219jOdKwok
	 /Ntg6OtAOgCOjdyp9a67u3oCRSjijd5A3bbFq9j2/uK/eLoZkFKpGtKgJ6jUp4ud7iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RfxAPKX4;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822AC606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RfxAPKX4
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd69ca84740so115875a12.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571516; x=1793176316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=RfxAPKX4hl5aHIBy3oFXof9+pDCNo13/d4gZ6i3Xrj4dC3l16eIihKPf9+C5SGQMq8
         ummbtZ8wwSXd6s+KGHxTrbAUHcNvP1jYKB+EqMh3uoeVloOYUGvvTLjPnITpOFcNb9TC
         79kCk38nYiUV/Ragt4271UH2xvhBjMtbux5XHYX7xO1Fm4lyWnoGBVz4mB3zA1IIlqbS
         hCjnl+bXMBGHJRY4Lbfb2gKosbDtp/3LVaUQqbP/4epINmcByOPHPpL/sI5E9cAlQfmz
         PYZoiDmYPOyJjyq1r8yuibxtwhk7vE4vEn4jA9GRvnBjhbzJcpca8TnMrb6n094qAqXY
         Uc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571516; x=1793176316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=tM1EFP4AB6Ur5fsvskBpiHsICFqT5kQRHAIKz0IFsdlwHFE373ETQYhQyZ9gLTfEjX
         i+f3s99MBgBWUnvuq9Bcu8ciY8/S8JxvmiVvL5wraKkt9e0WvfiDqWRApVqW8d1gEj4R
         08Q4fQHmdiEkkyAAd62Tss5DN0WrMnASc3U00oWyUx64sWuhwgYqn2+U0QymBBu4Rcqf
         0t8kE+RThRpdqNSKVVEDhOmXXT/e9maIJzFq73exsq25CVIqPtJUfecb6jOusArcJDlZ
         q5IPsRtdCY8OlzYI9Y5WHY+ubuIHFZqOHB/k5l7xNGdtj5wqfWr7YrgWPcO6vZWyQ3kv
         8Wyg==
X-Forwarded-Encrypted: i=1; AKwUvByGgpDSpYYc9xqKCVZaqECcyOI1Wl3kn/9s8X7JRGkzaScfi6gL/ILHG2BxVRNZhOnW4i4JwbmQFXnm@vger.kernel.org
X-Gm-Message-State: AFq9FYLDXtV5NNTXilM34OSk7ifRlI/QNvFNhqzcKyCbaNaTV1xb02Rl
	l0/qfjMuL3o4j6QyQ1zXO9HM9400n3gQTgvNqjGA6DE5eCndp0NCBi3m3A1mUtUzagU=
X-Gm-Gg: AYBFou3LjCh9CMSr6mc18r2pigIXILzcgE67ahb5dqFZCObqFz9PvwPY7qr76D/IVsc
	ou2hi5CDteZI2Xoz0q9sC80lL7hwYjvQRYnYjVVmh8W03OvoU7QSXijhMqo8921gdlnI+SSPKiP
	ukMovkUU6UER5D/lH31IQvQYceWS96ELzkBrBxgrMWRum6h65Sqs+32t+tkMERrW1iBf7EMe/97
	0Wqf48WjVqBwxLYSWjELQOUTKjjU/CbRcvnoo/YDk9nsUx9SHL95Ce2txPa28mI6tQU7lfO52FJ
	/IC7KL9ST7UjG6SckyZxalHTatcTtCKh+VP7gGzJexmxGW/KWbCEY650KqJnHUUQ11jcRQJeBv6
	DhrnPNGj8q77YspdO0x7M8d4rX9meNXnRcQ75gOOB4cQwNpy7E++Rb/gGuAmmD2I2Nq/ixGdIdq
	mgoCHWE+eyPGFv+qcR6kRXUabWamMohmCHnDaP5jyT4dZ6V95CBXVy791t/EJ2MwnfdHXiXTzYB
	nw61igx9PU5nvwZwI0aFAJaqvPvRl3QWjTns2nb9qUtscnaorjJE9kXFis1YfcAOaGAuA==
X-Received: by 2002:a05:6a00:21d5:b0:876:194e:b8fe with SMTP id d2e1a72fcca58-8a089de73admr1183835b3a.26.1792571515803;
        Wed, 21 Oct 2026 01:31:55 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:54 -0700 (PDT)
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
Subject: [PATCH v9 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 21 Oct 2026 16:30:09 +0800
Message-ID: <20261021083011.2170525-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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

