Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CDA219301;
	Tue,  7 Apr 2026 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574442; cv=none; b=EMd8i+K9Fhk3+pbqy0RQSq+0WfFhdA2ewnbpqlp4msyuSSltLeT2oOLBVIlkcS8XF2Hj06aR9MTXqCHaCVLp5BVs/C6J11pJ7UH6YURw/ATZinn6Hw1Ao+V1LTEbXpigbyYLVsKus+gi7vgTK2uTbK3O96Yo1tOKa+M359RqIy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574442; c=relaxed/simple;
	bh=1h8TpUTbEwUGCYmA3RpnWj017GPexLaFpXPkEHT4gpY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FTg9+1S8T7tl6RJH/hwUsP+FnkPBDB4wmjhNNT9apiOiE3WdfhIh27V7DlGffMbxlVDqDhCP6oOVCUtA/EBkLYBx9JJvTVe8f5oujOuzYlr325sGwj8xp1MTAGpjBVisD2OgZ5QWmGY9f/RRfeJ+aiFn2BaVgbvexSXBeBsUPa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=EOhDxiBc; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="EOhDxiBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1775574441; x=1807110441;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fwF/+V8vSUXyDGHI+Ez5ilMcTLluahXcPGLTKcZ4SJQ=;
  b=EOhDxiBcN+ZrZYnwE73LyIKzhqRCafNOA+3MiR5h3wKqZKmV2xB4L2oW
   X7r3VGEtonGPPLlhQ5XgVW7nfyB5sGWzw8y0FWHMxoENJqHDq1bpVtjGr
   1pDPXdLioQepOO4rKqfnOmfyr/MabIC5kI3TMrBIZYbelq332qNwPihYL
   K0Y4g8JPrE9CwAY0RI57umRkxG36hR8QgQvFoXsELROFdSMIBWh4ZaU1u
   4tARxmEDdNRfH54Cz2wSfbvaaQ1AGZZ/8jLSns5hibuQWwpo4YFznan0z
   3ftjloryAVXPdxFWqSlkR41PTX/z4ulcCXN97dHDupHb8kRt+YIEl3tHC
   w==;
X-CSE-ConnectionGUID: No09qL5zSY+r3KzHCgll3Q==
X-CSE-MsgGUID: rDHiqfZOR+6EXwRVTo2XtQ==
X-IronPort-AV: E=Sophos;i="6.23,165,1770595200"; 
   d="scan'208";a="16535437"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 15:07:18 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:19288]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.23:2525] with esmtp (Farcaster)
 id 4bfd4df0-b04f-448b-b697-624a06f2ef88; Tue, 7 Apr 2026 15:07:18 +0000 (UTC)
X-Farcaster-Flow-ID: 4bfd4df0-b04f-448b-b697-624a06f2ef88
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 7 Apr 2026 15:07:18 +0000
Received: from dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com
 (10.253.109.105) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Tue, 7 Apr 2026
 15:07:15 +0000
From: Evangelos Petrongonas <epetron@amazon.de>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
CC: Evangelos Petrongonas <epetron@amazon.de>, "Mike Rapoport (Microsoft)"
	<rppt@kernel.org>, Changyuan Lyu <changyuanl@google.com>, Alexander Graf
	<graf@amazon.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav
	<pratyush@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>
Subject: [PATCH] of: fdt: skip KHO when booting as crash kernel
Date: Tue, 7 Apr 2026 15:06:33 +0000
Message-ID: <20260407150639.69923-1-epetron@amazon.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D039UWB004.ant.amazon.com (10.13.138.57) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KHO preserves state across kexec by passing a KHO-specific FDT pointer
and scratch memory region to the incoming kernel. These point to
physical addresses in the outgoing kernel's memory that the incoming
kernel is expected to access and restore from. This falls apart when
the incoming kernel is a crash kernel as the crash kernel can run in a
small reserved memory region. The scratch regions can sit outside this
reservation, so the end result is quite unpleasant.

kho_add_chosen() unconditionally propagates KHO properties into
the device tree for all kexec image types, including crash images. The
crash kernel then discovers these properties during
early_init_dt_check_kho(), records the stale physical addresses via
kho_populate(), and later faults in kho_memory_init() when it tries
phys_to_virt() on the KHO FDT address:

Unable to handle kernel paging request at virtual address xxxxxxxx
...
  fdt_offset_ptr+...
  fdt_check_node_offset_+...
  fdt_first_property_offset+...
  fdt_get_property_namelen_+...
  fdt_getprop+...
  kho_memory_init+...
  mm_core_init+...
  start_kernel+...

kho_locate_mem_hole() already skips KHO logic for KEXEC_TYPE_CRASH
images, but the DT property propagation and the consumer side were both
missing the same guard.

Fix this at both ends. Have kho_add_chosen() skip writing KHO properties
for crash images so the stale pointers never reach the crash kernel's
device tree. Also have early_init_dt_check_kho() bail out when
is_kdump_kernel() is true. This way even if KHO properties end up in
the DT through some other path, the crash kernel will not act on them.

Fixes: 274cdcb1c004 ("arm64: add KHO support")
Signed-off-by: Evangelos Petrongonas <epetron@amazon.de>
---

I think we should backport the fix on KHO compatible versions (6.16+),
hence the "Fixes:" tag. Tested on an arm64 system.

 drivers/of/fdt.c   | 3 +++
 drivers/of/kexec.c | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 43a0944ca462..77018ec99fc8 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -926,6 +926,9 @@ static void __init early_init_dt_check_kho(void)
 	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER) || (long)node < 0)
 		return;
 
+	if (is_kdump_kernel())
+		return;
+
 	if (!of_flat_dt_get_addr_size(node, "linux,kho-fdt",
 				      &fdt_start, &fdt_size))
 		return;
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index c4cf3552c018..b95f0b386684 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -271,7 +271,8 @@ static int kho_add_chosen(const struct kimage *image, void *fdt, int chosen_node
 	if (ret && ret != -FDT_ERR_NOTFOUND)
 		return ret;
 
-	if (!image->kho.fdt || !image->kho.scratch)
+	if (!image->kho.fdt || !image->kho.scratch ||
+	    image->type == KEXEC_TYPE_CRASH)
 		return 0;
 
 	fdt_mem = image->kho.fdt;
-- 
2.43.0




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

