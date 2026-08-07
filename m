Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222DF3115B8
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131666; cv=none; b=L/wT7y/CvYh7oR4gHQLG0CNWaBKPTGH9qTsr1t8eBPaR/uTZXWTG50nKtDGxhK7d/szknbfY7QL4kaP1ekxWSxbiieMeTHEzaR4c5S7SuwJdAMDjbcH3eZEpSGwDWWh325frqBkxg75xY5X7OcK2hKE/zIFVRTdlTP/LXVZOkkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131666; c=relaxed/simple;
	bh=pIxz8es0l7NHVt4rPf5JLNwenGKE6L8ikfko/REfnio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PRNb7H2aWpihuh4HtWIaeiNzi2xZsaMK2IWLh1LKZzKdtCVsXynt+bvIEpZLKaQ2tkYY8wvnPmJHN4MW82hxJkcHaEtqIKn+Ky7sbJZMT11aMQ0AsuzZ9ihj+12Mn/i6t6hIuTcCnWahan5Lb1nzFe0AzXHqZ9imjtc+2ggdfz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=M8lVAZcD; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="M8lVAZcD"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-934974844ffso254604885a.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 12:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786131664; x=1786736464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYmF0A8uqvDVQZglorDtEEMVhUonz1Kois8AmVRMQns=;
        b=M8lVAZcDS8Jdl8lTPm+3L+9GwgI94QLYOIrWCtHJo59erfRfZOQESsBwQ0oj2VqgyA
         NqRarJRQHmIoygGgscWH9XsFKfM2WHzWMGzMLPjelLWVSatxSJOWSoc/EKgUCcKwcevY
         ZY7kV9z4ZBU+IQ7VHrlMzXKq0BFYBSIGa4okaCzwind9l0eKEP9BsFt+NCDi/9CYhgkZ
         ONWFgqepQybUUgeIpWH5rWxkMuZaIb9B5TyL5QhAvKYq3f6spIA9tRYDomb6nZCDjHBf
         k1hMAD1Ak8itTVs7gHn4ggNNMtf2fqLRM04chlGfddBWI45xoG0ZjVHnfDPhIt396ecj
         DGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786131664; x=1786736464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYmF0A8uqvDVQZglorDtEEMVhUonz1Kois8AmVRMQns=;
        b=p0nGcKUiZTpKUo9gbrfMAb/zuw1cJkvCK/kMiBpf30B9feD6u3BKteADls3yroeBjp
         pux4jixnVUbcp9jDj4SyRtL20v5/8TfVD4oI02mPceGcj1TFynSEyNW/CmPXHFiR5rdE
         xa+QqiC3EoiP2XhBBfNAzBg/+T0k968tH7JA3cxnO9H+YRGUiiygcRjLAz6l8/4U910H
         WEDCAH7V4uF2vB/TdBioqhCyIpuczxzeutdhkcLUyUfK6XtDVbYmSZsyS2ROBvmMQCly
         LSXqJTfpFnkO35ToT0WZg3zOoJohXLpgYEZZe+zoNr9oE2baO2LS9UqSLNsbJ9XiludJ
         M5Lg==
X-Forwarded-Encrypted: i=1; AHgh+RrWY273Cb5ic7o6jR2diJqQi841dYd1k4IUXhtpdK+Uq4cyuo17+zYvOU2Sf1tXE6xsS6jGhihagrUP@vger.kernel.org
X-Gm-Message-State: AOJu0YwiP8RuXSSBTeF/M1icwAtbLrFYlxEefDonEyDPvK0rr43Y/fl8
	whbe0Y7DrHpm/1bNJ186DGHuHH3SV64+cDxsbCXXjsRKh072vEMlNwg/xq6JGYLYqYU=
X-Gm-Gg: AR+sD139ZR0mYk5Tg1h6L8MCxDZKXkMZNphM3fI9ILJpuQuJYikfXQpvq/fAAdlkIGX
	HMPbNN96VrMmjxoNQIhmWI9d9MCwcMXMRWC3sTx7S98bRsawCM6mmwOfGQe+ko2LiS1LWFEUkwo
	rBasENrZjJumhMeL5DWICYORmSKbrpSJ/4/e3nFJxTpCidXPMdbx/uBq454Q9MHyB9ClifIQKZi
	hTT2qujvMFA+CRgzXkfvBvwwm2JKfTpr/E9riNIrK81r+anW+nrG2ZALM5Ef3LVmr80QYqCnlUR
	MCeLTEbs+YNuXQBQ42xSrK0KEohOyAArYv0HW1e0E+svP8Fjpz0w3YMtUuri4QFrDkZ6zgKtQ+r
	/APk2S+DsrfcgjWvrHjEfeT4dL/vyXXE4tv2vPafyJ7cUmEmMmEfB4DZNoQ2wrD0qRlUoC4XjPb
	O6S3OUOD0qW5QjgGFiNjnyjf6KNpmVEJ5blCVj95iZjFhTL03jWDKAwzuJNGn5M7oh
X-Received: by 2002:a05:620a:7001:b0:915:a111:86ae with SMTP id af79cd13be357-936798a4868mr319767585a.35.1786131663991;
        Fri, 07 Aug 2026 12:41:03 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e03aeadsm219786585a.3.2026.08.07.12.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:41:03 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] PCI: of: warn on bogus device_type property
Date: Fri,  7 Aug 2026 14:40:54 -0500
Message-ID: <20260807194100.455599-1-elder@riscstar.com>
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
some related code.

					-Alex

Alex Elder (4):
  PCI: of: drop the reg_num argument to of_pci_set_address()
  PCI: of: don't zero flags in of_pci_get_addr_flags()
  PCI: of: make a flags argument optional
  PCI: of: introduce of_pci_verify_node()

 drivers/pci/bus.c         |  1 +
 drivers/pci/of.c          | 27 +++++++++++++++++++++++++++
 drivers/pci/of_property.c | 20 ++++++++++----------
 drivers/pci/pci.h         |  2 ++
 4 files changed, 40 insertions(+), 10 deletions(-)


base-commit: 075b74841bd0065a3bda3440873c747938e69b68
-- 
2.53.0

