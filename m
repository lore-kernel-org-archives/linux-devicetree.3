Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FE037EFE3
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852583; cv=none; b=ERcPBKKfqMyp4jRJbERoVV28A6PrMHqXi1blEiMvE3dj/5pZhwGlAPmC1LlGcaOdNvQrxOqXatfrInlncYXmsT1+OxDfEcuj/rmpJ8e1pUlAEtHtKQwxXY6X8lUfzY6TZItOJg6xiY36CosHdW9IuYrFzHk+h1sUYdtMKCncsrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852583; c=relaxed/simple;
	bh=OetecSVWSHSGXKbVApct5VtDpZdb+yRma6A6pwugszA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkjhDmUzdDb26LSsw1yMJTC6nhn4Lr7TwZIBbH984A+28454TdZiRz1anpaEKmFZCtDK2Y6nWLO4jcAo0bNtcfG81ZDhFDFy79jVX2Y8zCWlC81zaaEgki2RE9KCy0EdsgF1cCYke5r8dhRbbqJdhnXi5+cSb5iVBynbBewWntA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sIiEPFNe; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sIiEPFNe"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-83659d38e38so4603970b3a.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852581; x=1780457381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osub7jqB1KkbojdE6IP/r6iEAlyJyU/eaCe2RQB9Q9c=;
        b=sIiEPFNexRzs7ErkBNDEz4YU0zcgy1n3TH8hKiWWzsQoBZHBGUkF8IudNwUigJ6ymb
         sQ95CiWF1BCeIvGucYji+wECJD/AmYci3Be/BpH8F1kVnzbLGRtkpMW+NK6HoET0L97T
         QM8ADJbkQw+nNB7il2WLmgs23liA0/YHjeog6KhDIxLo/VsrKR165ovaxSEC3vCYrcoS
         jmLMsFRdvZ5BVN3mXeCxiWFIEVIa8EKKCrd5/UYzSyddavZhe+cdoPTYB906RHqyQr2L
         zswaGeCQxYReNSzhc4Qs/fABQqvDhyFCZeeIjt6uSlur8McxhagTkYapKAGK2vN5Ze97
         fXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852581; x=1780457381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=osub7jqB1KkbojdE6IP/r6iEAlyJyU/eaCe2RQB9Q9c=;
        b=cki1ydF2xHE7nwEKeCWPp3EEJe66XcoLxig6EXgClgLXhnYfk0RtGvvES0j5eJhtIS
         0eGZHOx2PvwHhd+0+joEjte5w2aPX1RlmpH+ZqWvlwZXMYdRFTccRxo9z2vb4tLdoEDE
         ECItEW8vIC9cvmpCmI2TqhHt1wujfnSjCUH3xheipqWgZaSSuYbXkuD3sh5Mrt9tdk11
         qOg8MbyhvKn2ijZCicurcdqXh1LLnF2bycqN7EByjjoeopbjLLDm80aAMVMAYFiVf1PK
         y6U4RRrhpi0G+DMzJYX8hp0uorQHYSU+iMGTkvie/qb7yKPGz5MJqApl8ebttoECTfF3
         gAPA==
X-Forwarded-Encrypted: i=1; AFNElJ8JGyGwnL3O/BFGTu8QUGergqe0ekyatgpyKSgj1Ik1Eypztirs/P0ZfC7kR4OWGRXGfPcN/K2Zpr39@vger.kernel.org
X-Gm-Message-State: AOJu0YzLyJMuoernvkN8QY6ITM/RT/w6IruWu6Wm1RIeNeVMSo0SD1Ta
	1Q7vGz68BJ1+0E86bqBONHMv46PdBzUu6/3zfgT4BhXtnGtLS90bYXBA
X-Gm-Gg: Acq92OHnDHlq+rU0lKmTQxkHlD2wg8RIO7BeFQaW9IZunnwlNqD9EmOBHSixxLwJgNC
	wsFKF9SCxNWoEW64FQTC1ymjugb1lHSHDVptFF/MWTBKFi1ZEb5RY5joJwnGrOkjyRrKCjJ/zfc
	8sIOO2Q+DtjUqS4+pJUBm+mk60pG738Z83ZAn6qpeXkXQpk62qOQexWb9osrQ0WfF8cvi8bKZ8C
	asdCZ7zVc5lOmb952nSl51vSHM7nONhIKawVepc7x3tuuvpS86TetWwi9GjtrYGwOQLFnQFtCzv
	UeblVZE2z8JxX30kLgId2fU5OaMGADC2rjKfjI/qRLM0eGzk//4/AGSx+dyLwUjXXtuZSumQCHf
	ZTVrunoPgBpStLXja2uvIX/vj41t5KIwD/hrJr/2qLwEfM1sG5H0Lk9Sde8wlZ3plGggvPi2BUP
	m8IiLbBvjshBSxc4aPtXPUC1urSjZuGcUyZe43
X-Received: by 2002:a05:6a00:7702:b0:841:dc7d:306a with SMTP id d2e1a72fcca58-841dc7d511cmr264256b3a.25.1779852581229;
        Tue, 26 May 2026 20:29:41 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:40 -0700 (PDT)
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
Subject: [PATCH v3 01/11] of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
Date: Wed, 27 May 2026 11:29:07 +0800
Message-ID: <20260527032917.3385849-2-chenwandun1@gmail.com>
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

Prepare for an upcoming change that appends /memreserve/ entries to
reserved_mem[]; such entries have no name.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d5777cb5d1b..313cbc57aa45 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -788,7 +788,8 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 
 	name = kbasename(np->full_name);
 	for (i = 0; i < reserved_mem_count; i++)
-		if (!strcmp(reserved_mem[i].name, name))
+		if (reserved_mem[i].name &&
+		    !strcmp(reserved_mem[i].name, name))
 			return &reserved_mem[i];
 
 	return NULL;
-- 
2.43.0

