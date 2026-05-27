Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B733806B8
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852602; cv=none; b=ohiLz33cc7aAAXvvesqqXfn2ePPfHyxMhOAVFQwNsictie8HAozF/FwL9ajaVB22i/nXtlLC+iQmDclvGfcb7mXSXmdWx3aWphcHVka4dOFtnIz/nuUffV40t+/OuAC3NO6J+zQ/BQL9PfdJPogxbQEod9eKGM/xAoDYPjJoPps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852602; c=relaxed/simple;
	bh=xH1JOzQprSl00bucZAjsEsVNgmNvdSYAgclnF834gwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nlpsx3LZ2ybx0ZidevcJrmGfTqF9eHc7B9SBsgnKgBPIeS9dNPVTm76i1ZURwLBDnopJtUsR9LvsUaxEW/d0VFRpYxVecU0ygijV4jUy44eXJbCb08bfHnl88DqUXODXhc7N3tIxEmW1XX8HOTHnUvLpWccsJx9e9+NB2qxHyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elinQQxP; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elinQQxP"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-83945063f70so5571498b3a.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852600; x=1780457400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nz17AGesBxrxvpMg+ldtjUwMkbrsU+FQ5Omh3mR+f58=;
        b=elinQQxPwTBIPtE9gVNqiRkf8SfeFb353ojg0ZMp8V0+DTrYiBZQvbj9Ups4K5o0iR
         CzQy0L8m3ApJ3chpg5MWBJm/RTBM713H/9cpLNHntGfJZrKxG+Jy0q5x31ye6jJVTs5Q
         ZdooTve6zjHvXp++0Xrf3AcnlFaHJmoyfM8TF6P5MOzPbqh5kOhp1W81Jam7pbiCNAmW
         JSJ25SGzhDYQeat6NnuDHBkWBkas7fBdlcw3naXl++mPYTLKFtOGMNjVsghljpATxlLi
         acE4bEnEOmLenL25v15iBkBMo8exNLOR8Ppp4uDCybkWTg9Fzn8bAIqT5nDVA71mKrKD
         kDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852600; x=1780457400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nz17AGesBxrxvpMg+ldtjUwMkbrsU+FQ5Omh3mR+f58=;
        b=dUtp2k81u3iQj6Qabq+KCdhlXhphdlpVpdlvOR07LgngHEVHnntOGQJvk7xzb5rlUN
         dUrcct9O1OIhs0zz1dgz/tOEsj5a/MIf9DhxkL7RSh6dLrfo6tRyZFDBeoY9KdSc3lnl
         lxwxVFjWyGYBkIed/TPbcj5MCyH8+R2QxbwyvxcEUNfUmEd/qGre73r2HwwhnSvoxtNB
         HVhEniNJVrrOPuGYqrlqI/qEXJFk8Q4uFdrgcmUimq38WMX7b/A5O7H0sLBcTHnxUCoG
         clQ7z6ZpZCbeiXE3MC8h7ahPKkM81614EEBGLSYwXdujg0+tfthUAcCKPu2ZOaGkbRV/
         aBxA==
X-Forwarded-Encrypted: i=1; AFNElJ9erpLOPoh0CHvESwV7kEKw9dRM/GbsP5/a3wyZrRnmShqxQPpCAYsKR2U/gE/g2Z+xNIkNCUq01jx3@vger.kernel.org
X-Gm-Message-State: AOJu0YwYTj8pc1uUTlIW6QWNoYo71IG8kq0bNSaqekGsgG57kVFlAlia
	wr9zRARsaohbtoNxpOMt4C+IEykRgkuE0qErX2vlmi6R4dQrvppPcgRa1ARYSxXSgCBEMA==
X-Gm-Gg: Acq92OGrklJDh4ze1WmlYbEv1+5hKADW657KuDD01jXM5wptkD9dTeVSrjlURjHmc3k
	cy/8oWZ2p9MRgqUOkKyksV13TXVKHwQmDe+78Lueg54OPIj5k26bEcOqkRXAR9WcP6sRSAlecKo
	8j5fEtc43xzfG/CihqAZNyJC4YjFGBp/EL+BdH0m7Aku0MDNodV6oc58SBt0PB0jq3+loow0Sdv
	1c/JjTVrHQXzFh9V9YRznmB1jYbd0r3Hfb1RFrOjCzhLToVOY3AcXYvXrcxO5sbNS5KPb8fwKxG
	FYTgcVsxC/G8+gFrF4z6HCsDECmJrrJxe48SXzq7RPtjOmKXyis/oEd2Mt0eMeSvu7bgZ9906el
	sVzfRk9wmetL88Zafr39gCnHDvAK2MOsx9an2nPhzzINg7iSOHCKCfPgsFT25wKP+JYZsKdyGuo
	JQhCkLab16kAda9qjEfpYXHv7V/fSQI8UIbCPfjQQzcqjkSr4=
X-Received: by 2002:a05:6a00:ab86:b0:82f:7cb7:63c7 with SMTP id d2e1a72fcca58-8414b427c3emr17125755b3a.11.1779852599870;
        Tue, 26 May 2026 20:29:59 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:59 -0700 (PDT)
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
Subject: [PATCH v3 03/11] of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array() fails
Date: Wed, 27 May 2026 11:29:09 +0800
Message-ID: <20260527032917.3385849-4-chenwandun1@gmail.com>
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

The global pointer 'reserved_mem' continues to reference the
reserved_mem_array which lives in __initdata if
alloc_reserved_mem_array() fails. of_reserved_mem_lookup() is
exported for post-init use, that would dereference freed memory
and trigger a use-after-free.

So reset reserved_mem_count to 0 when alloc_reserved_mem_array()
fails.

Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 313cbc57aa45..6d479381ff1f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -69,29 +69,31 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  * the initial static array is copied over to this new array and
  * the new array is used from this point on.
  */
-static void __init alloc_reserved_mem_array(void)
+static bool __init alloc_reserved_mem_array(void)
 {
 	struct reserved_mem *new_array;
 	size_t alloc_size, copy_size, memset_size;
 
+	if (!total_reserved_mem_cnt)
+		return true;
+
 	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
 	if (alloc_size == SIZE_MAX) {
 		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
-		return;
+		goto fail;
 	}
 
 	new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
 	if (!new_array) {
 		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -ENOMEM);
-		return;
+		goto fail;
 	}
 
 	copy_size = array_size(reserved_mem_count, sizeof(*new_array));
 	if (copy_size == SIZE_MAX) {
 		memblock_free(new_array, alloc_size);
-		total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
 		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
-		return;
+		goto fail;
 	}
 
 	memset_size = alloc_size - copy_size;
@@ -100,6 +102,11 @@ static void __init alloc_reserved_mem_array(void)
 	memset(new_array + reserved_mem_count, 0, memset_size);
 
 	reserved_mem = new_array;
+	return true;
+
+fail:
+	reserved_mem_count = 0;
+	return false;
 }
 
 static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
@@ -266,7 +273,8 @@ void __init fdt_scan_reserved_mem_late(void)
 	}
 
 	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
+	if (!alloc_reserved_mem_array())
+		return;
 
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-- 
2.43.0

