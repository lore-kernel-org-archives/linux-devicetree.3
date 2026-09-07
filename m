Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B694E1799F
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 01:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788744639; cv=none; b=TLZqwZzPQb6/6Zf5olrwQRuuAci6Mcs+ncyN6BzNWvn8JjV4XRWE2Od+PIdVuvG2jQdT9Of78qfbQK0cZNHM9L0BhtPt8XI8ZyPHdT1XbRR0Adwiv4DAfFILT9EloIlfEdBTWzwbABCnQSO2pnO6vnbQCxlnID42MW0CGK3SSbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788744639; c=relaxed/simple;
	bh=dNNGYguUOLSgqqkfkvjIkkVDaQtxaxTdCgcuFwGgJX8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OJXy/31oG6u46S3EhAVmXdldbwqgM4HGwWPuU2+mI8XbSo+bREs+hiKjNOf6s4vqJtbGh4gb797vnF+nOK/uwvmy1TctNl0d5n6UizpWQqoHyLrS+TFMrh2Sb3br1Le+Rxd/F5nuIK+mI4OEWjOsLIjgP3xbWBf1WtPZq7X6yfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmyZEFC3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmyZEFC3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e067e908so2464123f8f.2
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 18:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788744636; x=1789349436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JUvMkYiTr+t7ea9aRviIs2wiCWDmgBxN3oKZgi8ZnUg=;
        b=DmyZEFC3ZlrfcR7yaFHFgOkINCSL9iwfMA//9Y0owicHCr4IQGJRAJWz9k0aW5ZJ+e
         nf26e8rOHvd8k7cPnxpTVMy61KrP1jadw9RPrgYmR9f1HPGqI/ZfWMD1q4dCtX0Z/9AH
         LubO2cFNnP0NRfUSKSSpoeAVT+54HbdP+jXkIe+yW+qoX1chq9EEHwzgkO9kzBtSrIDg
         64GHl3LvUVp/1n+dAX2R62p9BVEKdhuhMsBsTyHpzKeislgJa8JGUK6n5MAU5+ipuL24
         hYtN+iYfGB2W2YEdlD5IxeXRFSNSd+Ij0HP8BlFOqZ4xreQhEZzQJeJ9XXCXO0DMtlt2
         WUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788744636; x=1789349436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUvMkYiTr+t7ea9aRviIs2wiCWDmgBxN3oKZgi8ZnUg=;
        b=Tr4yNzOe/vs2LlfGMBeqCbS2OlXd9ZFluIcIg5zSYks076EgwHVIeObT2pnXmT8YfQ
         yuPsccCXN/Cau4fASsgPubv2lKZq+n4UYOXoolAi5IJx6VX8//9LkSMJ/qDOW3LixIRI
         Sie2yQtwdfQxpMn9IQhMUnQHkt1nVqVut5CE6OBnELOzTx2v/RADXI1qe8m++Vp5CwQP
         z7zg/+ztp4OZ7h6jfVeHLqLmgtVQDYygHKOTevjF6svSy5W2JiPXqOC0dLGoS+IhcEdn
         LA89MG5nc46gA0wfoc9Aqo+MYc/vxuex4iaM+j5eBhl6OtDLFX7o35OqhOxTdzCBM1if
         8plA==
X-Forwarded-Encrypted: i=1; AKwUvBxggED910Lp/tuY/zSoPdguP4sNhSfFlVx1Q0ZliE5gh3dhwIsYwk17/yvXURN8V3TLM6ajdBV7NwtY@vger.kernel.org
X-Gm-Message-State: AFuF++lZJs4SskA6ePS8iU3JWb6wmMnp9aXHy3ACO8VG8n28p9r12nb8
	OArInGhHOaCugsZpFHj5p6OcxibPVi3wuXgAYrNGT3WULufqa/G53oCC
X-Gm-Gg: AYBFou0pzbOfmQmzatUGortr9PHcoCECvHrCZTHhmkCW2ov/MmaBoY7jfjf8+JrHQ6J
	CFY6mF/znvCa6+/lzLFoV3+3m7RZUsHzljLrs4xHdNP0/0DMu815mM6Ycy5zsOM6pTnYPY7vE1X
	b6raXM+hH6sPXE2ugLRzyS3U5Pxqil6EMYJtuAGog+XPB/2mGZ3527zle91CuJHtT2BqOg6QiDO
	yFfRNIK1d2mWsTRfiKR5WqGjV7GdSjtLBYAgQZPifM5r8o+pTQRuqfeWCHSCtqXCm5qT1yeDL3C
	w45VFL4WrIdKyfyGe7gC2HrsTWQX+BwBN4tVT5U0o179Eg9I6jKt5MLHYPAGKsdgWr0QBdIuGzt
	3smgmxsyc3KXMPfXjVDa0M6kITmHU88pE2sqWGq2x0PkQOZyw4nfwqhiVkAODZCAPshh1iCMwx0
	LQXyEZ9FIhkJdEF6S6Ix0u51sb1XnP40pu0Y18McUW9lRWdAHP+xum6nPW0YH+FF+fZuqaKrXS4
	uZkIVytyKu1oDUwWF7j7zeO0b3oTkDLhK0ixmuQg+tjzoGQOx47strQJhqIjm6MqY+zi+DdN1a4
	tE2jCkhoefVLFSuOXuwNfswsfWbP8BH0LDLnMZ+W2LraI3s+hMnucFTkPHN3xjH5RHA=
X-Received: by 2002:a05:6000:2003:b0:485:8a46:7050 with SMTP id ffacd0b85a97d-4858a467187mr17523667f8f.34.1788744635748;
        Sun, 06 Sep 2026 18:30:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d84-5101-9c80-d25b-14b6-410c.310.pool.telefonica.de. [2a02:3100:9d84:5101:9c80:d25b:14b6:410c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm13291531f8f.37.2026.09.06.18.30.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 18:30:34 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] docs: dt: unittest: Use unittest_data_add()
Date: Mon,  7 Sep 2026 03:30:30 +0200
Message-Id: <20260907013030.22528-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

selftest_data_add() was renamed to unittest_data_add() by
commit 9697a5595ece ("of/unittest: replace 'selftest' with 'unittest'").

Use the new name.

Fixes: 9697a5595ece ("of/unittest: replace 'selftest' with 'unittest'")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/devicetree/of_unittest.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/of_unittest.rst b/Documentation/devicetree/of_unittest.rst
index 6ed6e3291964..5ea8ee0e81ef 100644
--- a/Documentation/devicetree/of_unittest.rst
+++ b/Documentation/devicetree/of_unittest.rst
@@ -125,7 +125,7 @@ Figure 1: Generic structure of un-flattened device tree
 
 
 Before executing OF unittest, it is required to attach the test data to
-machine's device tree (if present). So, when selftest_data_add() is called,
+machine's device tree (if present). So, when unittest_data_add() is called,
 at first it reads the flattened device tree data linked into the kernel image
 via the following kernel symbols::
 

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

