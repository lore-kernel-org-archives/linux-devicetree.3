Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AC944C4E3
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262149; cv=none; b=Wc5QoHOtT5z4RNrYY95ARxrDP2XZph8oTJDoLN99BXbiJISa6rOeNo+YRwPWH1ZpB5WrGBjW4ZriXcV1/5h8BF3+L+m7r1mfVUNbK69NHtT40BOiXH+CoJT7ADmjGtvY+A+oBLdDQ4wj/qGvdDpU5P6QXt/Oo0zwsZWgjXwlVjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262149; c=relaxed/simple;
	bh=tatPPp9ksq/AKo1fWOy1GCy/kXeBxFyrR4k8B50gV04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0fZVMoSwAQ/jp2xkWflUVR1vI/d8EytSgpglXNYxjbR2n9uCK2E/j6xZAE3oRslKUDUt/gtQcqD6oOsffmkHjLuGpsYzcwUJwbd1sQrJN/8/ARW5mPaeUW7so+nSOpJIjHRly4ZmcXlVZ8o06ZFZqQNCd6s/lckuEFMyLObuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=T29L4Oiz; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="T29L4Oiz"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66fb93aee5eso2327844d50.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790262147; x=1790866947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IDTLFiJl2PPRWbMX82Sp0m0i5ZXEftxTb/TEfVM9Qb8=;
        b=T29L4OizJgWBNyihloBD+DxyCxioeaIfobK7xJXGd7siVu5xqlb4q0JICPw+KO4j3l
         53FHLO15u/zuUnFoqt9XEAHp/9Tegh1z3JLdYogQBcGVryvB/tVpWnq6ECFkiQFZK3Qu
         VivrWznTcO9gPy+QHXJ/MDHGladfm82lHA5x5l75/vJM8Oz3YCNBqZGyZs6RnJZHzmUJ
         5FN/jFH8c4u2BShh+rdgAJ1qq0/1M+Uwfs3WSxa5pq0bRtN7xISF0YRm+aFzJFcMDZxk
         zpd2eGb3sZBtguW9Nd9U/gY+7Q53oSMSYswS2ZHJODuFsBKGkgmBbHexa+ET/9BOAT2T
         HAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262147; x=1790866947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDTLFiJl2PPRWbMX82Sp0m0i5ZXEftxTb/TEfVM9Qb8=;
        b=bpmtQWQUh0xojApS5IBSzPwKSYCjJFl/av+dIYLiQ2ad0AmQjnNf4W4elGuznu4N3P
         FQdH5VObgl3PePOUfLIQvXUOwKU5PxFUusEjjDL5HgJeO6v45xiYGThNvEF3KFJ8n6CJ
         nw0mOV9asAxStFfSZdiRdmOyw9tDdZcOiiWzRDqVatCvtNv6zolzajUAvQe/8F59JCBy
         X9IdmkNAQUeQbbreSk6i6UgkCccbklw5P11Ee6p5E1OPegQ6qPbcnZmnDEhEIf3BaszM
         eEMRFc6mSadK0KyJKr9Ya86ACFPvcgUjqXG2p1VxltFSsNnOhSlY1CAVOs2iQx1JZvU/
         Hx9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwo+BH4QfSVDKqQyNk7OZRH9g6LYcH29RlEdQisG9BoA/ppkiQ0q0TW95MzgiagXzkGTptF7FZmVqo4@vger.kernel.org
X-Gm-Message-State: AFuF++kGSgR7FktKCww0IMoRl8Gwii1j41mQOj7z7UuXIkHY2+9PBXNN
	3WhrxycuYWms3ZtVWtTN8Yd3bb2+j5/n9uBS57D2kqY/m7iPUYwWfrpTXCF/5A5z2to=
X-Gm-Gg: AYBFou2yjnePBeFgw9op2NeU46nSM1nrtGjctaAYWOJXFinKWkhpFlo8XXQJZ94Awle
	uPlOovzeyw9GwsQqMyvNb2KXqltdmXpUl2/dnKtQYITW9sTkKHnHiSwm0Y9tcmWoPRCP/MOLZQz
	m6qSCXI7BbPNGX2UC4GVfmawQsJd+2XqbxL9gFr9NBwZTBStZ7Q593CRrY5WN1hgIgmDC8kh14u
	+0+wbjSLTmHtzdjCx5yW6VJSRWLSBN7zgZUUvXDQGaI2g2rfmBIbr9zrDGWtjPA/cPKSyT89s09
	/on7nbEuVAwGl64Mlr5PHOdiqYyKa3yhLpoKDCR7NYxgm2ziUxrRFU3ea1wpC0U9m7dmyl9wcsw
	H2lsHVE0CytJveMsmlpupATuE51YoEyGnzoSw0vd0TBkXRhiChc6X7VNFHqOBhAUiXpI2sSuuXH
	nR+4Xnkz5Cqhm02GZBezNRfEArqwz8s2dh8apQ5ZgXerifxgp03Jhv59HqgL3UAUx7bY2cwuLsN
	zU=
X-Received: by 2002:a05:690e:4386:b0:671:1da3:288e with SMTP id 956f58d0204a3-672ed243124mr992877d50.31.1790262146512;
        Thu, 24 Sep 2026 08:02:26 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e24e458sm18438236d6.21.2026.09.24.08.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:02:25 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] PCI: of: warn on bogus device_type property
Date: Thu, 24 Sep 2026 10:02:17 -0500
Message-ID: <20260924150222.1179235-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a check when adding a PCI device to ensure the device_type
property is (or is not) correctly defined when the device has
a non-null devicetree node pointer.

While working on a Qualcomm platform, I learned that some PCI
endpoint nodes were defined with device_type = "pci" properties.
Herve Codina pointed out that this was not correct.  Rob Herring
indicated that people seem to have trouble getting the PCI
devicetree nodes right, and asked whether we could warn if this
particular problem occurred.  During review, Herve Codina also
suggested that bridge nodes be checked to ensure they *do*
have the proper device_type property, and later, Sashiko suggested
that "pciex" (and "cardbus") also be accepted as valid bridge
device_type property values.

The first patch prevents a possible null pointer dereference that
Sashiko pointed out some time back.  This is the only patch that
has changed in this version.  (Last time I neglected to enable the
Kconfig option that ensured this go compiled, and it contained
two obvious compile errors.)

The second and third patches are simple cleanups.  The last adds
the new PCI devicetree node checks and warnings.

At this point we are waiting for (and requesting) an ack from
Rob Herring on the last patch.

					-Alex

Between version 5 and version 6:
- Simplified the patch header on the last patch, as suggested by
  Bjorn
- Rebased on v7.3-rc4; otherwise no code changes

Version 5 is available here:
  https://lore.kernel.org/lkml/20260908213459.2519059-1-elder@riscstar.com/

Between version 4 and version 5:
- Made a local variable (bufp) a pointer type in the first patch
- Eliminated an unused local variable (i) in the first patch

Version 4 is available here:
  https://lore.kernel.org/lkml/20260904134607.1856121-1-elder@riscstar.com/

Between version 3 and version 4:
- Insert a first patch that fixes a Sashiko-reported issue
- Drop the final "duplicate warning" patch from v3
- Include "pciex" as a valid PCI bridge device_type property value
- Add Herve's Reviewed-by tag on the last patch

Version 3 is available here:
  https://lore.kernel.org/lkml/20260901011338.1323243-1-elder@riscstar.com/

Between version 2 and version 3:
- Drop a patch that made a change only needed by a different series
- Switch a function header to use kernel-doc format
- Add a warning if a PCI bridge node has no device_type property
- Added a patch to remove a duplicate warning in the devicetree code

Version 2 is available here:
  https://lore.kernel.org/lkml/20260812172247.276554-1-elder@riscstar.com/

Between version 1 and version 2:
- Check the PCI devicetree node even when PCI_DYNAMIC_OF_NODES is
  not enabled

Version 1 is available here:
  https://lore.kernel.org/lkml/20260807194100.455599-1-elder@riscstar.com/

Alex Elder (4):
  PCI: of: avoid allocations in of_pci_prop_compatible()
  PCI: of: drop the reg_num argument to of_pci_set_address()
  PCI: of: don't zero flags in of_pci_get_addr_flags()
  PCI: of: introduce of_pci_verify_node()

 drivers/pci/bus.c         |  1 +
 drivers/pci/of.c          | 32 ++++++++++++++++++++++++++
 drivers/pci/of_property.c | 47 ++++++++++++++++++++++-----------------
 drivers/pci/pci.h         |  3 +++
 4 files changed, 63 insertions(+), 20 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0

