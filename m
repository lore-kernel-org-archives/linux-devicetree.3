Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520683E8C78
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896546; cv=none; b=OUxtGfJUB+ZkQzDo6va53aXurH29TpYcigzeHXAWGrMLrhy6L2jO3AQikeC46i/5k7ALRbVDqk98mnXN7zJXzd82eBJvTDDnif9PyJ3Ak2mwWf+HobtWIngqRdt9OoQ1j183TWKio+h4eAdUG2xFO6YDAYcnZ4qZ/9px59lNujQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896546; c=relaxed/simple;
	bh=3yQCwusPM2SFsjUJl+L+In1OgkFCb7jzGEJa/DftI/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0M9AZixWQD5+P45pPqODqznBwgBoQQHuXVBHYa88K0lzD+bYWqA7ab6iRh9JSMVi2LQSih7iwvMm4vPR5ADVeBGfK9TVeeAiY+0PfqQC3dSRovjbhzlB5hBUOBEu+G051d1qraAQ+BIHeV1J0+WX3m0u9jJ9Aq6SNIdz1/Tc4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlTynOSj; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlTynOSj"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so639548a91.1
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896544; x=1790501344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PUf2wiOoUG9R7t6MRcmAciYWufgeLE7ixeOR2Gw9uJA=;
        b=SlTynOSjtBk4LHlj41DfXo53Jtq92JMWvdmWrpmn8I3cSRYE1kqewZ9VjkVwk5N5Zj
         AQxvGw48heKbkqgF6khn9xxpZkv9ZJLwJQbCMdU6PDDLc6wUcrdAqJ472PzQHhdIHEXU
         7cRpvmkEhpumD7YZmrgLEAbnY0H4cAFv68hCMFWK0uKSRS1ZjnenhE4m7UYk14635hn0
         sV921tmiaLorkP5OLtT2ICRhodhfmdwDVwTlu6O/GttGzay4onAqUjE2+ulbTP++NZFj
         HURtF0nw7qsTt/auH2wOF6K6W8YPZ1m+yzDpJgGSF9SRe7Pf0l7R6yj2/alZmxDLdPbb
         /6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896544; x=1790501344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUf2wiOoUG9R7t6MRcmAciYWufgeLE7ixeOR2Gw9uJA=;
        b=kDWrAx1VyxcDyVKEDHOtP9yxFYlCsEZ2galPYJY9IvjRzoMdLfVOx/LSW33VOtJN1g
         W0ySRMkU1ez99RJLoTRI7bg9zQ+f7DOjBYT9FC0BDEImBEfrhaV905I4q+SazijqDaXk
         B+tCyyOyae+L02kfl1wXWqSz8xbUzzUvqRsAy8uziNALV1YqYw8gKnJghyOlyIY1seu0
         g7Z0rivips1Dl/XCrIof5je+WOF5ISCFALoZlIr789WW0/n1SN9sMlvJwsrOn7xXmGtB
         sUS5a7fCBJvjqn7sKWQ92CNkpZGLGsyqz2WEB25gVy/vS44nmfvpuFu8cPzhcW2FbSli
         2wGg==
X-Forwarded-Encrypted: i=1; AKwUvBwoM7o41yNSD0v7cCopLYg6DCrSZt6Zcph2NQoeyXAZfoq4lreawA8pTOvllpeeFzP/jrEsF1vCSPQf@vger.kernel.org
X-Gm-Message-State: AFuF++lcSrjVB33WWJ46z+/N98FZxWFQnK/thgWcgYzmMBl2900jUdXX
	+oKtUy+jHDvEMFo598bRY0EvBYDWiSC4LgwFUarDF+jxgMt6e3/p9+7w
X-Gm-Gg: AYBFou0DcIkc6RizuuwZ3/ACuFt/reZnUv80fJeMcchJmGcmX90i6/wMlSdlff4zmC7
	jIhZWOcF9LbGrA156qG4PzdPj0+YBX43nY8M+6yCf/gfylSdHg737hyCm4mYv7c4IC0WgqfEc6W
	3NzljdqsjrjzxzoMZsXDhVu8UlGoLVgMQP13Sre8JTbRg6RPpxxSSXMFvpLTi1EVBRZEw+nhyc4
	pe2+1Kn36bFVdDF98d2k+TlD9L0g2o3OZ6E6dZFu58ek3svFpTNTZCtHcricWxPLYBfrRrm9eTh
	EHXf5gvNqfYCQ4KnxbANjOTVA5yLPTqyL3BYUQB5cfj+nTCl55Vdi6gz6dehR4fcRiVXs8WFK10
	QIBWvv3v4RwGUmnY4hrVex6DwPJO2//80rC64quxe4z/MyTifeM2pbpHcuVkpqAtV33rygJZ8tS
	o9bJfyC+JqP6MMNMKz4hqxgVEaCoKDfk0cF18fhoqqEh6BbJAYmARu8gjWPMqF6xdvtwlXYS9eo
	ms33WGgMi0=
X-Received: by 2002:a17:90b:448e:b0:3a0:22bd:6ee5 with SMTP id 98e67ed59e1d1-3a022bd8582mr4720656a91.14.1789896544491;
        Sun, 20 Sep 2026 02:29:04 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c64csm8154917a91.10.2026.09.20.02.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:29:02 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v3 0/5] of: reserved_mem: several fixes about reserved memory
Date: Sun, 20 Sep 2026 17:28:47 +0800
Message-ID: <20260920092852.614973-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

This series fixes several error-handling issues in the reserved-memory
initialization paths.

The first two patches fix cleanup of no-map regions after driver
initialization failure.

Static reserved-memory nodes are reserved during the early DT scan but
initialized later. The third patch tags regions whose early reservation
succeeded, so the late scan can skip the nodes whose early reservation
failed.

The last two patches reject overlapping static regions. Without
these checks, overlapping nodes can be initialized over the same
physical memory, result in data corrupt.

Sashiko reported these issues in [1] [2] [3].

[1] https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kernel.org
[2] https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kernel.org
[3] https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org

v2 --> v3:
1. Rework the mechanism that checks in the late scan whether the early
   reservation succeeded (patches 3-5, suggested by Marek, thanks).

   Patch 3 adds a new memblock flag MEMBLOCK_RSRV_RMEM, which is set when
   the early reservation of a static region succeeds and checked in the
   late scan.

   Patches 4 and 5 are reworked to reject regions that overlap or are
   contained by an existing reservation. The code makes a little different
   from what was acked in v2, so the Acked-by tags for these patches are not
   carried over.

2. Reorder the patches: the two cleanup fixes in v2 now come first.
   In v3, the first patch now introduces the 'dynamic' distinction in
   fdt_init_reserved_mem_node(), which the following patche 3 build on,
   so the series reads more fluently.

v1 --> v2:
1. Rework failed-node tracking in patch 1: do not track zero-sized nodes,
   and keep a reserved_mem slot when tracking overflows.
2. Reject static reserved regions overlapping existing no-map regions.
3. Keep MEMBLOCK_NOMAP flag for static no-map regions when init failure.


Wandun Chen (5):
  of: reserved_mem: release dynamically allocated no-map region on init
    failure
  of: reserved_mem: retain static no-map memory on init failure
  of: reserved_mem: skip init for regions whose early reservation failed
  of: reserved_mem: reject static regions overlapping no-map memory
  of: reserved_mem: reject static mapped regions overlapping existing
    reservations

 drivers/of/of_reserved_mem.c | 86 +++++++++++++++++++++++++-------
 include/linux/memblock.h     |  7 +++
 mm/memblock.c                | 95 ++++++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+), 18 deletions(-)

-- 
2.43.0

