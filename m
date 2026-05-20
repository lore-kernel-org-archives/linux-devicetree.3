Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CE63BCD3A
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268752; cv=none; b=XBR1Zm0fdayJL+l6nsd9LoXej/dktH3oCY1pXVo0aWXrHrdONR34unRmrYKmqcf78HDQ83yNrcuv0nxfVNTwUFOCSeNGcJUn0v5k41TLj/DXY7bJVZfK+Tx2IQmIEBnI8SdaZ3CZmnXDCKLsgH8faM8Ejd3gee3r64f8eagHcLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268752; c=relaxed/simple;
	bh=hg5xbWLp3AkSvJFbtRJektVz3soiPhwBudcg+chCZNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7zLUbS2hpAkl2mrAZYnJ4GgpIO7iQdJf9zdbrdZ2hP5RGk9NpOMUGmqltpCOYazlkI/N85BeJ6AQVdqrXcfmIBJ9oackASygVfz45COCwVhfAXD89swBEL1E8FaDjoSa4ZOrRFHSXbU968HfNHeC4XqpiIvQraXtt/RGNvHGtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8X7RU3L; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8X7RU3L"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c82a6278a4cso3571314a12.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268751; x=1779873551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlJTNnuSEkuOFcK//QE/3Ty9SdRnFwE8BVFotGGF+Qo=;
        b=B8X7RU3LGCDvangQc9LkyR00ShOVybh/2rn89RSEzVp7VU0jIB3YRVvrM+qucwcJFe
         GEf/nsf6t6Ty2Xo/b5bPmNyeysa3JAAITWWfkzWndxN8tvW0CrLUqgFrNb4Z7U7QVKfz
         pwdjrEdvez7f+N2AnUSoJHQdhF9QfQKqEIXEPllICtzLG7ipqDaBjuS6/njB3SfMu7yF
         gp2wKmMba30eGf76nnIlGnCdbmkgKh5Szl2zQd2sYquOj3jqhxCod9YvV1OY1mAG9xx7
         UPn6dxT2XHDGLAucqjm9ILxMgZnck+1661MgBeuLJ3uAIAiVSU6ng3gZTG/9VvFHpR3t
         HFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268751; x=1779873551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tlJTNnuSEkuOFcK//QE/3Ty9SdRnFwE8BVFotGGF+Qo=;
        b=qlxA/BfEBpKDQEmhNlJ78ekkBMUaGswpD3gLz7AzWtHCYR2c8gcgaU+pTJY7iFYDML
         kdqxkOTLpoc++PfRKO8H8TcObG/IPqTCCRaUXKYHf54zk0suheHIKHlLHP536HOT1Sra
         BZusVwLAaGPPuiH1/9qCKVZmS+4y5iOvj4d/mlVRQmF8/4rWjvopqoON2/lJKBEeifAy
         OGiIcbEqbzKCuxaj8l6gzJIHGrdPfjlgw0kTvmqlx//8eMkxjNxfM1kQ0UwmYypoEV0Z
         wju8IPaRe+Bs9EieFgbcIFjzN7LFOf+ybDrhmDyyAFaHVpjSD6xytECcvnrj1CFq6Qu7
         4nTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E+PXjPvJ2kvUgSKPJDRzRyUlV0DPkbdyZs3qmXVVQVONJ4X0vtWvzIVPYI4FYJVCgiMS834hU44Rw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ercRq8seEguUOPebvfYFDVWflHpLfVDYtXQtGCmZLNHA57P5
	FaKIJlbMOY0M39QvHMu3zPCwQE5hWgXREiVetMuWSUjxVe1qK1Q0ntII
X-Gm-Gg: Acq92OHnQPpekwK6TOkSjdh8la9X+ylBUTSDRkXqcwsfwsf2buLtsaFSaO7uFqLXx9a
	L0trLWdEGCfwYCEU7EqiEkh6GpPnIanpVc+krpqy7eRhX6szpnyr8Wt9TEf4ongjG6KFnM1oOWC
	sh8MB30GjYjVOBkYBXxupNQpOb/YEDmh1QKCNetMVQiNnNIoSqEvs72abP0ybZvSIZl4xFwQ4nU
	luMATL5H4w7U22wNlTQAJqAN1YttztMSRLV+Iwsqyrdc/95Dp7IYcUzSiNYzXF623CS9MqIBXl6
	4LmH0+K3WlYHRGT9zBjRsfaW3aAVZcUPu60Sxzuh+89DbKAvyf57pRMJS1jsp5HPVQqKODrlKxb
	PaUX2luhAFTZ7aQK5z5FR/T8Y8ifhR+6Tev52znaESzncarJkFOA+vNdtW2EOCQXpGjZmOYRkQH
	0SMpPECDFZAr9XMEP6iI5fiTN7djn6Ueik55CPYw==
X-Received: by 2002:a05:6a20:2454:b0:3aa:ec28:edc6 with SMTP id adf61e73a8af0-3b22ec63eaamr26158763637.39.1779268750848;
        Wed, 20 May 2026 02:19:10 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:10 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
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
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 1/8] of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
Date: Wed, 20 May 2026 17:18:37 +0800
Message-ID: <20260520091844.592753-2-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun1@gmail.com>

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

