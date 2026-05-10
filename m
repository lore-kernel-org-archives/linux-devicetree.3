Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1627732
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 17:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778433259; cv=none; b=fKEnGa2kQ+U33s6Twz+wvpIk1RtEvHPWXHQkF1WJn7HWfoqR/q9b9rqDt7y78mJy7CT1cQ4PVepH1mgmYW4ufoVfPiQ/DnPx6RbnwS871oOZMtzKu08but6RqJxAHvvC3Y2dPMy/SOB3LwCqZSt6WsEEQVE1RvY8MDPAhDrSC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778433259; c=relaxed/simple;
	bh=3NDxPAfITfspj0phS5kHFW0hpKZ+gV9rPXD8TSvzIis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bQm71OGdOrStpZKYlgHg6etpUxckIBNrXDXCv1duqSiCr+IS4aR+ZYhQyClyvAsqvPAHfMaRUsZ0D9gOzgwgHm/9u0ZtEIj2p/eLV2Psg/18XOKEsxaOPNY+Z5c/iKLQ+XRaqcwqUv+2utr/+3chxSYvjRVq4IkyT0MUFBBbrNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzEBCKs+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzEBCKs+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-835b78c3797so1422034b3a.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778433257; x=1779038057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ljxyGF0XpRcmphShZNeAA60z8jVSJUpH0HQBwb34PqY=;
        b=fzEBCKs+MvT/UwGL6sFrRbOnPhukES6fcdXxCAyFs7AmUGkfBnbLmQE8NlflT+bcyR
         LujvgPPXyoI2gIGzK2AyGKvAir4LSkCs8fAXsy8OrvTjtQtbafxHVd+mDxWT951+vzHO
         rckAfjnsAn2y5tom1CtmJpgVcKyvv/Bz2aiVQW3V38ldmzipszFhM3y66pWHUzDtbfgi
         li1mWb8O/yp2F/jeQSMeK0lm7ZRtQ43qJTfX7NNVqMAJAlOeChWNdKMBZakBpnq0PneG
         8w8x6ZAcg9SW8DVC9Ygz9kyZigxO1I1Uuh4g8v+4+GsFZJkAaPFhHyrlHkqK01exZZWi
         A1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778433257; x=1779038057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljxyGF0XpRcmphShZNeAA60z8jVSJUpH0HQBwb34PqY=;
        b=JUfrOT+FFStG8G7+HJRjNs5lFA2TLkUWgrJuKybJS43qRWcnF8pML+qOl5hXiKTVC7
         CarjO6AEh5MYPNXJVYjeVjbpwq1qy1KDqfCJnsTsYJHDFzeiDEjJeOMBHy5Bwr/X4pMB
         kcQnJPFhpkosZcKJcgzh7CyU37AsmgPwnvVFg6vvuo7ylgXl3OvU2hH5PbJw3Kz3WH27
         vlhRVYG9ys68E2Des0YzmHyGGvF56OQEGAWyLTObMU6q6V4WAYJAzoooYWvcwXWcIaDu
         uxZH81Dhpbuv6aVG/YL+qGEzknzeO4FYzmne3r8Y4I8RXzaczO1Nh7O3M7ihuuCvvHCQ
         a4Rw==
X-Forwarded-Encrypted: i=1; AFNElJ/1EsUExx41fjYCComNGKc34H8GJh5EBX2Qqe/FvhPVojpHIPp6Y182qm0JuKu6SjVlgyD9+nvNPLtZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFzJ1yd4x+G1RVtMJVLRaM/AIW1rH/xefLKqVjlBI04B/ZELc
	sNPctRTs7H9CDBnLgbTNEeLNK7neYV7uC2Yr40Arj6dLB9X9fmQi+RwP
X-Gm-Gg: Acq92OFHhtFk2SGG4wSZDwsF1VHAsBm6Ayub5utWq2iFYCKMi/Nt5m/D2Nqio4Zs93Y
	lc4YwRMMXyIv0grKlpmXqlBhh8VfqMKnzNAFIGSQ+nrA9cZYzTKb+1gwLPtAuAkWVVzi7fzlYzi
	JFTeSfxxUpuO4KSvjpxagV9hsfb5HRvVx53NwjiEGSpelGCIzojNiGcQt20JfjeN60xr+HiJsWi
	lpHpR5v6Wo+wE88uNgBMJCuhhped7sUN/0apyeCT/H2F+QAZ8UmIhxFwK68AZFAH/h+m+YbUoK7
	nWi749zIDPtC5xOq4z+LyPGbUEXbXIAjWBhc/EqS0wYGP1a6E109RAcsMT5FX2rGms5eW+1SYcB
	YN44kQ1mXyBMxKFYwpLDJ18c2o1R6UJibhliPImlNG2ufwrEQvuksWnHkCb7pVMAqe7g0BSF1Ys
	GMePWERUrzm65gYzQArZPHfMa0gqrU
X-Received: by 2002:a05:6a00:4098:b0:82c:e09b:3f76 with SMTP id d2e1a72fcca58-83cf6e732c9mr11292717b3a.41.1778433256778;
        Sun, 10 May 2026 10:14:16 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f381sm21799778b3a.6.2026.05.10.10.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:14:16 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 0/2] powerpc/prom, of/fdt: fix chosen node handling and cleanup
Date: Mon, 11 May 2026 02:13:51 +0900
Message-ID: <20260510171353.1406018-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

While looking into boot information, I found one bug fix and one
minor cleanup around /chosen node handling.

Patch 1 fixes a bug in powerpc where /chosen properties are read
from the wrong node.

This bug has existed for a while without any report, so I don't
think backporting is necessary and I did not add Cc: stable.
Please let me know if you think otherwise.

Patch 2 is a follow-up cleanup that drops the now-unused return
value of early_init_dt_scan_chosen() and the dead checks at its
callers.

If I missunderstood anything, please feel free to let me know.

Best Regards,
Sang-Heon Jeon

Sang-Heon Jeon (2):
  powerpc/prom: fix /chosen properties read from wrong node
  of/fdt: make early_init_dt_scan_chosen() return void

 arch/powerpc/kernel/prom.c | 20 ++++++++++----------
 drivers/of/fdt.c           | 10 ++--------
 include/linux/of_fdt.h     |  2 +-
 3 files changed, 13 insertions(+), 19 deletions(-)

-- 
2.43.0

