Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F0B3E16A9
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179075; cv=none; b=gbpNoi15ePioVBSGh3ZNXLx5RFKE78V4OM9oleiTGigHcuzeAVXPxhfj9nVKg+3WYZhHtnxOGAe9IPJxLG9W+K+c2TzEApzu+ly4xcQEi5E8A94Sx+TIEACqYtmgR7NyeZ88FUzdCIrSkMy7kRvwbyNOsBEL5lZnvcqzRZf2xrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179075; c=relaxed/simple;
	bh=kDtAKoSZAdvvvCuPNfvCZPz9EOkX9Y50Ru6JkoNus/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=URZ2bCOgxY9sDG0mWuLcdfcYIJs3Z2a9zX2p3o3SEBPjcPqhW7GzSjZ+pqVXbNQABcnOs7KhDaYIpd+n2dY4JPNurujcL1+V58A2yg7aLjBLVeJh6MEo4FY6P7xZaQOiVXkAqHmF/bC1sXaHsW1ZkewWS1ubJI4kCkyXMyinZhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBmO0yfm; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBmO0yfm"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-835b78c3797so1291865b3a.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779179073; x=1779783873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYoVh0X79SWflcAvyPoj0Y2zZfUmlLpvVu1hj8lPeK4=;
        b=eBmO0yfm4Fc8PlAADjuvaFD04SFWJKXAsLH5p1YuL9o5eDq5M52iZ9qUAZJfI2KDkK
         MTYoVLNfac9A8KSoiawTexXWIKsVxw78qejgi2YzzxYQ6W77OmIXMPb6jKFlShP9x3MJ
         leKk91y10oQGVidow2p4y3dhfUg6fA1vTuGGWif/5NifVIoUwjT509jzWeG2Z1GqvOpB
         SpaxcEXuklMRjwRPe64ticGmKxpbKrXtzNokakiU5lXcILZkwS2gbpIHtJqP3O8KTrT1
         FN3WeXYCpmOeXEtbqxt7HTl2bJpMDtnNPNLp3VHkH7OgOLja8xp/KwQDWIqE+jhKwjNe
         RMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179073; x=1779783873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYoVh0X79SWflcAvyPoj0Y2zZfUmlLpvVu1hj8lPeK4=;
        b=fAQQq3TjsCKJW6vFmeII2UwLllJLSgAw8otve/c4v2MJsleDQsTmiocBLzGxRQ9ZsC
         Bjcks7nwofxxneJYAOcKc4EG2XN3zIzQSToUhx/0J0ezNpJtr46h/AcjryeNnrZdQZpf
         +7hxFtPosq7ovlOuuRbpmcJz167IImtrLSU8zcgOYf4Qq1XLtQh1X03pNtmg43l3jS4/
         2wrHbSDjfoa2t/Oqshb/rWj+opKkEfHKNhcjkrpbl2W1o6riZ0EqY7+Z1U2BW8wT1KzJ
         u2RvSCHYP3pf/JAmLZXEgXUUJJpoXpHSJPVL3rYNvzVaFYCKRpSrRIhXQeiLS9NfWlQI
         gRbw==
X-Gm-Message-State: AOJu0Yy0dvgwguoJEcCqGDrwg83AbXLgPJAmc1qDofzp+w1tDcPjM3jU
	YOC6VPk8sPaolUNA7IHIEmQEyPZncPpqBLYRilUy/0ECzesYV/xw5lnUgrC9n8xf9I101vnn
X-Gm-Gg: Acq92OEqjJ/0tGfPPRABS8oJfGcWEm6I44rjLbrrnkXR3PxccJg/KFJUqbANygpG48S
	rAJoZeBjk9uq57ZJXBFfI/6ouQGoVSGOEtJJy3WT73iRXweEkzCtnRcxZZR9x+06lnxAAFlQjgG
	mFXKxZ2I5Ylm3lnhQRZOOo0VGMG+uKJIjoDoOsiQ2fTHYeOUckVUCncCAU3hPhIr0uJ11x7YRvq
	DsyXBVhopc7r6piD+bOjqxaKHWEOJetiv0MWQuGGoPtxnVyuZxwMKkccmJf9hwWmeZFK5q1I3hE
	dvQ6KqpQjFf3Elbl/cs1k5reOXV6S4ZwJzBd2uwSNC7TMK7dG7zsg+IUINDKxbd/BEFk/9319wU
	ZmAKwuI9yS8bwrKRHPFfP8l7pN45z1FvImTc51NSfSGC6x6S4stfuhDJFAAyQy6xc4FhtmESSXw
	iGP+HAISQwhTJXthy7uF402dJh7WUVGgreH0lMyUEViDF7aT8W
X-Received: by 2002:a05:6a00:2449:b0:82c:21af:a7bf with SMTP id d2e1a72fcca58-83f33c25127mr18468030b3a.13.1779179073586;
        Tue, 19 May 2026 01:24:33 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b4bfsm17822898b3a.28.2026.05.19.01.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:24:33 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhaomeijing@lixiang.com
Cc: robh@kernel.org,
	saravanak@kernel.org
Subject: [PATCH v2 0/3] of: reserved_mem: fixes and cleanups
Date: Tue, 19 May 2026 16:24:24 +0800
Message-ID: <20260519082427.4181476-1-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the OF reserved memory fixes/cleanups series.

The original v1 [1] contains two parts of work:
 - Bug fixes and small cleanups about reserved memory. 
 - A vmcore size optimization that exclude reserved memory out of
   vmcore.

For the convenience of review, I have split it into two independent
patchsets. This patchset only contains bug fixes and cleanups
content, while the content optimized for vmcore size will be in
another patchset.

v1 --> v2:
1. Add new patch 1, to fix unnecessary memory allocation.
2. Support only one entry in reg property in patch 3, suggested by
   Rob Herring [2].
3. Per Rob's review on v1 2/11 [3], drop patch about "rejecting
   reserved memory outside physical memory range" due to potential
   abuse.
4. Drop patch about "of: reserved_mem: avoid unconditional save of
   reg entries in fdt_scan_reserved_mem_late()" due to a
   misunderstanding on my side.
5. Update commit message.

[1] https://lore.kernel.org/lkml/20260429065831.1510858-1-chenwandun@lixiang.com/
[2] https://lore.kernel.org/all/20260429065831.1510858-1-chenwandun@lixiang.com/T/#m29fa0f1c22c23e6343070e70f905c9482f930901
[3] https://lore.kernel.org/all/20260429065831.1510858-1-chenwandun@lixiang.com/T/#m5948f8679540fb361e7f432137babb4609ff154f


Wandun Chen (3):
  of: reserved_mem: avoid unnecessary memory allocation when
    __reserved_mem_check_root() fails
  of: reserved_mem: clean up redundant alloc_reserved_mem_array() call
  of: reserved_mem: only support one <base size> entry in reg property

 drivers/of/of_reserved_mem.c | 48 +++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 20 deletions(-)

-- 
2.43.0

