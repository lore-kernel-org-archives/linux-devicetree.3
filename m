Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AB246F489
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555375; cv=none; b=GRDpX9C/yNPYWLaubeLdCOFGbwzRTTHrfLJIh6VaT8meFLLJ+tVOdDMVlaeb7bWqnHTevenUrYS8SNW9FHmPiGAevyDr1/9ehL2t2wX5ABJJkahtjlnbnEC0LxrheFAFCklvex1AGHxDs5xGkksLkEP8BFJRFY+aVC62NZPoKEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555375; c=relaxed/simple;
	bh=xfBluy7Chl/vLJhCzywHuDMFmQp+P0Rb+La08jMwq8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IlR4qLEbF7TbbjYT+q1laY1JWKZUib550gGVs7eEtVe0raRnbDJfTA/n5SfnWgew6hWB/Ms8t9zNXM83MXogmdeKmODB2saem4dKrDtxk8GVLjGWDtw8VmZLiqKPDBdIkpSV0Ssa1fsMA0G4LiyMabtfH7GxaSg6KDQ4eEg0sSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=q7ons0fd; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="q7ons0fd"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-902fc790cd5so7478346d6.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786555372; x=1787160172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B05U0xMoca4JG8dTYzovZSbd79SZOJKbHErof79XjFA=;
        b=q7ons0fdPFJ7QhEZ5neGMVNUJUTI0NWwzBAqntwdeLedJakPVJJbG/KAdOcKWdcPZr
         XHycFLju3EJeqyk9GRmZwfWrPX1wIz0Wo4biDPGi+28sN3bkQGkRkaNdJCN+REVegK2Q
         OzPWcwppUo38VcrFTCpgZHbcukNuH7dM5xA4pp8QajK+6c3yHicCjP34txf4Zt17GUn/
         40nuXs4qeFMYpkdnTpiamRdjqZKfbTAZt/Pw5CDzZF7HhzqmoGKLcbQy5XLmQm1Chk4k
         tujC/aPtAqdxWS+zd4jzR2hYnGy6NIzCDPZOeX83grkgTzSGqBxOucowc1rYIqcB4Fgd
         j9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786555372; x=1787160172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B05U0xMoca4JG8dTYzovZSbd79SZOJKbHErof79XjFA=;
        b=OGpqJ487br1ll7u3sxpWnW5/IZeuW+98/RcKOgKKBZ73NILrN/0oohdCaKBa94dMv3
         8h5cJY+BkXvUYcEiJ8Po2hj59llgefViNaObyICL049VTREIFDyAxXiBae/6bBuiFf91
         3ARDB8iSe8ahm1IBlYdyHFvW1vQzpFfOGG72mPU8cVS75CGaSrzimGLYgVOtU8Gv5K70
         bBo9EB+x4WDz+ajhkb1wbU5+C2M8peCoYqvQfCTnR77SKAhWI7qq7gW+SHJBT6PZDMOX
         c/aL1o29CCtEjtRq/25Lhy5Z8qx48hiFDrX3dtGGXsdNsiabY5by0FvVBrI/vV8FkKTu
         F/dA==
X-Forwarded-Encrypted: i=1; AHgh+RoU38srXWVwhygT79AO7Q38t+rbEYCKLafoDvqGDWB5lQVfX3Li7QEnyJrXjYroGmQK6ZuQZI6pdrzV@vger.kernel.org
X-Gm-Message-State: AOJu0YwNQBCyqd7Ya50GEEbevWGKjTZlmOCEweHXULYRWnctQCj7+nbW
	w9G6S0kykL5Q3DlQvW4cbhfcMKY4ZUJ2aEGSEPJk7Enlb39iyEpT6ak2TU7wiiNfyuw=
X-Gm-Gg: AR+sD1086dJEBoKTT4LcsySM3QX3MalQ1sUXeuhV2iu1pFOARWOJcA+bCYc/AAIue1z
	NPdJQtANWQmWx11h5FoWTC22mhDFsl3Rn0NHUMqA4t9gmN4dBdoqEirG8wt78Z289dgIf0zYYS6
	ebDEHKRUhvGMFexxBrH5UjPzPjwzI8UJBYt3gom4bIc6z2ZIEXdCE4sjPAejD/hpX9lVReWBMZW
	Z2TFkbwkAScx7H0RvQXmqWEcML5eNuvqy78bsezePU/4B3EFn8aXccDTbn/jFYnXFz5+3gDpJmE
	EgLDEfdwhYF/71vONjELQGLlZjZNSjQhYfKXlQ68u4uG0YiK2YK/x7dmlupqnTDHblQT/57GNxf
	HZ646oQJ17fVQ8gUZYG32bYPQV3ntszZ/tSCzPFh7o1wBqTvSPg67xVjRoFJkQhFeTNvAXhmKB4
	2QyTdrZD8A/Ki4/YV86KPodC18WeBIvK0neEk38X7fEtIU1h6yXOnAWQmd1DbjKSoY
X-Received: by 2002:a05:620a:1a17:b0:92e:59b0:df08 with SMTP id af79cd13be357-936b3a20e6emr569522885a.3.1786555372598;
        Wed, 12 Aug 2026 10:22:52 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936b5f720eesm173587685a.47.2026.08.12.10.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:22:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] PCI: of: warn on bogus device_type property
Date: Wed, 12 Aug 2026 12:22:43 -0500
Message-ID: <20260812172247.276554-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose of this series lies in its final patch, where a new check
is added whenever a PCI devicetree node is found to already exist when
one might otherwise be dynamically created.

PCI has a well-defined bus and device discovery process.  The
PCI_DYNAMIC_OF_NODES Kconfig option allows PCI devices to *also*
have a devicetree node.  This enables certain things that are
not possible with PCI enumeration alone.

While working on a Qualcomm platform, I learned that some PCI
endpoint nodes were defined with device_type = "pci" properties.
Herve Codina pointed out that this was not correct.  Rob Herring
indicated that people seem to have trouble getting the PCI
devicetree nodes right, and asked whether we could warn if this
particular problem occurred.

The last patch in this series implements that check and warning.
The first three patches are fairly trivial changes to clean up
some related code.  This is the only changed patch since v1.

					-Alex

Between version 1 and version 2:
- Check the PCI devicetree node even when PCI_DYNAMIC_OF_NODES is
  not enabled

Version 1 is available here:
  https://lore.kernel.org/lkml/20260807194100.455599-1-elder@riscstar.com/

Alex Elder (4):
  PCI: of: drop the reg_num argument to of_pci_set_address()
  PCI: of: don't zero flags in of_pci_get_addr_flags()
  PCI: of: make a flags argument optional
  PCI: of: introduce of_pci_verify_node()

 drivers/pci/bus.c         |  1 +
 drivers/pci/of.c          | 26 ++++++++++++++++++++++++++
 drivers/pci/of_property.c | 20 ++++++++++----------
 drivers/pci/pci.h         |  3 +++
 4 files changed, 40 insertions(+), 10 deletions(-)


base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
-- 
2.53.0

