Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA84337F8B1
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805685; cv=none; b=WqL29pZI096cFcaDkp5jrf0QIm8ez7oNvmMgD9Ezay2HtmJOim7Ob95b8ALdZvo+ajqRWNTyeunJpI/AAVjejaBTQ9Ecz6rxyIGA4fngIUID080C7RMmtX+KDVEFv62BD1KN4FZ+pg6gPYZYvffmffjn/aVEgx8kp9zgiaUmpDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805685; c=relaxed/simple;
	bh=eRKNOIjCkiF2jF/wqDsLoKJFJ7gQkK71h6q8X23yaLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGwmXSMzLHah33DIF+cj1jAYdP/CXeipojs1T9QcJVdu9LZa89GPiGRcX9Y32kqp+89iS03ll0HN7jJV6QJ+pf/rPmq8jx4GpobO7ey3+JlZoQkHqceUdgGGqdYqElTrvwvPGhc0fF0USKRo9HvLfaSzvg0AOeOFjtuFQTf7bTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1bh5fSB; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1bh5fSB"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-37e4098e920so1720572a91.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805680; x=1783410480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Grclqvhv7nIlB4Htu6FP2QRzAU/Ix2vbgSwcdXfpMs=;
        b=V1bh5fSBSd3Fv9wNBTUqSrjw0VEi7SJx/VaD8TuwCU0p9XnZgiS1Oqgk9I9NUELFbp
         JO/jrt9ckdCtGit+zffgTyCyD6kzrIRb1aOX+p7EdA4torDwdYz0Zybftb3uiZDoQh4N
         YxuEQMHIHWB923rCaQJewQ8tUmRaF+Jun4JbWRWusZe7e27lEs3ORyTGOq2oDHUMEydO
         WjuxVbZMHHRvUqgT3/Fw+1HEKepCugtnEUTBIZaFU5BjOkJ6qp0W00TMw8L+smF9YO4Q
         0gn0zWrbvkWjIRAl23vuWU+ABsuSuqdumGEJxlTlM6d/erip5njOiGvp+2ryFRupa2dy
         tEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805680; x=1783410480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Grclqvhv7nIlB4Htu6FP2QRzAU/Ix2vbgSwcdXfpMs=;
        b=l971KLs8OlRBJpAHlV/mqPxeF/OFpQ7AgISkmQiGIc2i1wLwupAjUTiheHh/AI9IuN
         RYVHPu8jDBuU1MRZk6D1FIpSRpb8JI7EJ2w3lJeJLqpVt5CfgWs5fIIyKO2cLIg5I9ua
         oKwdxbDKXMYfGo94S/rQhCtsPyuD2p/H1wyDITgG48Sse2DwFueVrl2hKnpbhuRlUmzN
         RmneLsz7YJMYm5N7h4t0LM8dvIZsyd7knUWVkNv68zQMvL7q/fFRehrEAsuUs1ten9tC
         4cTzkRbzV2uNdm2aQwYG2Fbh+DiM9lyy0W8pWH15t/ntiFX9wSOiMRhmzj7MD0yfiePR
         vANA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9MTcd6n/SW4prH8g8qXRYJ3Ygynm8lkW3TGmeGU01sINXtwos654WjQ7ypCxmik4t+f1Drbex5gbL@vger.kernel.org
X-Gm-Message-State: AOJu0YwdywTSeU+N3XThFFaQau5LpC84hd3Naegqsivdu7af0MqdDYDl
	NNj4trNkSpw0z8KCZip5NMcnQPWAeoR4MvDwOKbneFp2dUZg42bOu3HO
X-Gm-Gg: AfdE7clzG/Dfjdh+RM17+IIu/OCWWalD5UkhE7hgPf3fXbKAO+z9YAV3WT2zVEP7cgn
	K96VPhj9Dw8DjJlYD3wYirxxnxymwCQFCpn8g98s0kFov9p1Hs+36JS+N7dXTRJx/pbRjKY4oGT
	09ZCku5sY1xoZgQ1JOcnbFDk8tsVCiyk5bOZKYPtFeFXlFZic+4PNy1gsT2Ga6Ol3M78+O2AlU7
	DzMqir5TojDMOsoCq5JgrqQwVZBvt2Vu1NXKoqIMHgHoo/RSJDTrGWQwjaPap+pw7sTha1K0hpY
	opDkwlNMj2vj2BnzkuX+jJoEgwAh8I9zZKqX/eekH2jDO9riT9edbXeX3yHJ3Xqr4/1lcC47ZTy
	dKsrK6m9vytdxITA02XDHEK+e5/PA3REKolHQKZLyGn39fDPMcJ9EuPKC2NDF6SDsYtT/2IAgLR
	5Rti2vhIWG20s4QEXJGbVBsYpuyg==
X-Received: by 2002:a17:90b:3c8e:b0:37f:9ce0:af34 with SMTP id 98e67ed59e1d1-38052826ad9mr1631272a91.31.1782805679897;
        Tue, 30 Jun 2026 00:47:59 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:59 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 03/10] of: reserved_mem: skip late scan when no regions are reserved
Date: Tue, 30 Jun 2026 15:47:07 +0800
Message-ID: <20260630074715.4126796-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

When total_reserved_mem_cnt is 0, there is no /reserved-memory node
so fdt_scan_reserved_mem_late() have nothing to do, so return -ENODEV
directly from alloc_reserved_mem_array() in this case.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 42649dc3613f..e1bd35115cc1 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -76,7 +76,7 @@ static int __init alloc_reserved_mem_array(void)
 	int ret;
 
 	if (!total_reserved_mem_cnt)
-		return 0;
+		return -ENODEV;
 
 	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
 	if (alloc_size == SIZE_MAX) {
-- 
2.43.0

