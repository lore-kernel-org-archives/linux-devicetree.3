Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39BE361DBC
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782655122; cv=none; b=pKhB+H8sGbC5VhyWrmAZjenrfBPTzW3PiXwI5TH180cxqdYy4UCSqcXPEkWWrSs4Cl9rmrZeo1b8gBAQd3/dAnl6xI4POzbj0GAPGvEtgCIV0AIPDI8MaKcHGaQltpSEYL0/9YeG2TB4SqUpW/abC4gvndxrMjY/mWurTflQfFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782655122; c=relaxed/simple;
	bh=i43OM9QKvL5rNvINUoEKawD34vomI+7S+PPoUhnrPZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n/mrPPkLI/UmhhF2tm0SxH3/h6V08kKiYvWDVMUs6ngHw3TI0stuOca52Jx2nUJqk157WiNhw5tsVT0aBM0F65szGhO/efRypwAjd5fd9ky8u1PCM5V/ufGKK7XJ8s0Eky2PeJF4+v4MfRtEah5m7RHOlf7yfjpe0SxeOqmnM6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+1ITpIQ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+1ITpIQ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845b733e82cso1502327b3a.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782655120; x=1783259920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij65SijD3TAjZdNPDp/lCaocyGnY8KRthDqQSOYaHw0=;
        b=p+1ITpIQWMweFy6fAXQu2g6Z/FvcJEy3AJmFIq4BtQfnxwsTVI/YJoRhx/Hu/nVJir
         poM7a0nI4LvoovBFflmrBGzPY7cdL72nSLUfAmXilAJkLxfyNMZyGd49X43Dr3REywiW
         qJNj8X3BysnH966yb0zlieAK9j6jIyv26zvc7guSK44mVcGsWLEj9gbkp8mANm44A1Mr
         RGfHlemujsq6QaHWPLwKzPfH3uD9NZLM5VBjauzWx3GPaiaRIwjly0HYZ0VzRaKLyrV4
         /AauR7NnYanU+wvhdJcnCeaUhB7HOJGGe7jjRNo27i2wlcMtlJncz7DBViHGqyqOHapq
         Tjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782655120; x=1783259920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij65SijD3TAjZdNPDp/lCaocyGnY8KRthDqQSOYaHw0=;
        b=mazWZoyg+gJdHfvBjn2VpUIinrgOLuGBqOkyZIK4hg96jR8T8um0vzy8Ds4Qfd0KJF
         /uufq9Q/RB3iltVNzMVORRNFyciByKnNqCB6CH3X0yJsjusKaR2hyMTI4Xe2AKoCXrPh
         WNyNlFXDzb1CpjYcyzYBsckZYn4f3s5VGNNEOsfJ88qMT/xyxp8oecQV8bdkJ3Zx8unq
         ROlroPLEffCUzDPnIWxhIihO29Nf7/a/6prjlP1xhCUOrYQCouYSdnmfCpdcrS8lS3cm
         2Nq0QDxT5iWoGHaOpnEch1Hg2xL6m4x617Y13iFcL7VHWIU7HcL+ANHzEgGbFn4oUie/
         H0LA==
X-Forwarded-Encrypted: i=1; AFNElJ9w0OAjsOyZThqK0K5TJDcQ8Kp3vFxdONVC84g0e5O4Pgkg9wRIjuulChhIqWRGJF7w/GHxinRL9kf8@vger.kernel.org
X-Gm-Message-State: AOJu0YyolWvz4oBAGErPMKXbz3tTDrntaqubP9uumHcxervPOKYHtiNk
	BjxK+AP9KaJsKMC1pLAHnWX5LK4cOVsHg4sS4gg/UWCtiGXYaiqN4Tdj1bOLm8WM
X-Gm-Gg: AfdE7cmw9Nxbf5IpZ6osrCyogqRmp9j0JObKZK5GsehuorupPqDMyXCJvUoJjxl9SKJ
	nIL/PQqdLci11ILXSwYoo7awTB/hCGIfskfMZ8XIQMmZcF4Q0tQztWDrIR4DcJHFyRB6TM8JOu+
	71pR+hau96njd62VhGbNtpHFqhyUqZouz/9AZQcWviD8goyGN7kPriaeOPfxnx86Y9H7IZgW8yc
	Hn6wN65/aGNaTsaX5NWZR15G4JYZBDA1eEEYS+5DofWde3Vd5ntPwSR0dehnG608WP1M8lJ/5fK
	/OVhQpv5QtAR75QXbDf9PGdojunKH3+t66sz2ZeiVk5a+b81CJ66pr1fKHopY0QIPmNt+7u2Hjy
	KyH1i+tsNbv4YwRrRWqzcuUInOhCYeEH+7HS6M07f7UnbbmQ2Cwo1cL7ayV5PmSoocusSqKmrvc
	BmWDYzgWA=
X-Received: by 2002:a05:6a00:3e03:b0:845:d1fe:9cd0 with SMTP id d2e1a72fcca58-845d1fea7c0mr6017737b3a.0.1782655120131;
        Sun, 28 Jun 2026 06:58:40 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm10041108b3a.30.2026.06.28.06.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:58:39 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	devicetree@vger.kernel.org,
	driver-core@lists.linux.dev,
	"H. Peter Anvin" <hpa@zytor.com>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] treewide, numa_memblks: remove redundant work during NUMA init
Date: Sun, 28 Jun 2026 22:58:14 +0900
Message-ID: <20260628135828.1393120-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every existing numa_add_memblk() caller passes a valid node id and
separately marks that node in numa_nodes_parsed with node_set(). In
addition, numa_nodemask_from_meminfo() recomputes the same "nodes that own
memory" set from numa_meminfo, which numa_nodes_parsed already contains.

This redundancy implicitly depends on the callers' node_set(). So, before
removing the redundancy, make numa_add_memblk() set the node in
numa_nodes_parsed explicitly. Then remove the per-caller node_set() and
numa_nodemask_from_meminfo().

Also, since the generic numa_register_meminfo() already sets
node_possible_map to numa_nodes_parsed, remove the duplicate assignment in
arch_numa's numa_register_nodes().

Patch 1 adds the node_set() to numa_add_memblk() itself, so every memblk's
node is set in numa_nodes_parsed on add.

Patches 2-6 depend on patch 1 and remove the redundant per-caller node_set()
from all callers.

Patch 7 removes both numa_nodemask_from_meminfo() call sites and the unused
function itself.

Patch 8 removes the duplicate node_possible_map assignment in arch_numa.

Patch 9 is a minor cleanup, using the existing numa_add_reserved_memblk()
wrapper in numa_cleanup_meminfo().

No functional change.

Sang-Heon Jeon (9):
  mm: numa_memblks: set numa_nodes_parsed in numa_add_memblk()
  ACPI: NUMA: remove redundant numa_nodes_parsed node_set()
  of/numa: remove redundant numa_nodes_parsed node_set()
  x86/numa: remove redundant numa_nodes_parsed node_set()
  arch_numa: remove redundant numa_nodes_parsed node_set()
  LoongArch: remove redundant numa_nodes_parsed node_set()
  mm: numa_memblks: remove redundant numa_nodemask_from_meminfo()
  arch_numa: remove redundant node_possible_map assignment
  mm: numa_memblks: use numa_add_reserved_memblk() in
    numa_cleanup_meminfo()

 arch/loongarch/kernel/numa.c |  1 -
 arch/x86/mm/amdtopology.c    |  1 -
 arch/x86/mm/numa.c           |  1 -
 drivers/acpi/numa/srat.c     |  2 --
 drivers/base/arch_numa.c     |  4 ----
 drivers/of/of_numa.c         |  5 +----
 mm/numa_memblks.c            | 41 +++++++++++++++---------------------
 7 files changed, 18 insertions(+), 37 deletions(-)

-- 
2.43.0

