Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C0248F73
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940415; cv=none; b=nrh/8q4piOJ9wnKzgVI7f6pE6OV+6XqcBpJG1cq+s26h5qkP/oJiWuGnlb6eBk+UpupKLyXY7S+JK3m+lpYT0/JKOB+/cSek2Jhz7vtqnN9Si+QMxKzFXdLWvUe5hRoZ1ZPiAUwEje+uLbXMgDtM4NQeo3MJ5wo8l37KBlwjnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940415; c=relaxed/simple;
	bh=adCeSaJMskFA6PftRkoSu2YWVqmmCMHkN8FgHHjsiRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftPfpu0hCQCfGl80R2aJmxlB4r0U25JK/Xl+j5mImYSgDF46PJJwicTw8vdoB7MboLej8FGT1LEUIIuK9Ba1iHthtkqAXEehi6EDCMugtuNy93rzdA98gSx1dymt1x7/I24AaSoCzmGLZkZT0krwSeu3LWr63Qc+z7cMsaR87M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=Jdv6tCFI; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="Jdv6tCFI"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8486672f03cso2580468b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940412; x=1784545212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKZoD8N6l+DXHSfFGjdiYdJ2cgnD21M3gDPmDpdt0rQ=;
        b=Jdv6tCFIji1sjF+cafkh4BnaSQwD7RAh2HBKzBYh+REOXzdyZd8ZSGQgqcTFxXImkO
         sKYEQ8IGvIUgGggfQfL/2bamE15vmIMVy6DgSMgP/k8aCalMQFHuPjmiENb977CRTuKW
         Tp5+8raItiXCXOWuu9pMlFndsCcdfbgjI9giw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940412; x=1784545212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKZoD8N6l+DXHSfFGjdiYdJ2cgnD21M3gDPmDpdt0rQ=;
        b=qLYB8WTPCmV4G6BDDb2VnRB+ljPr4GFhqlJ2LiiUaIB0NEPXMfAcr4p0av0YIwALAU
         lVszsTub66fw2bj7t3BnMBurm0cBJ2pAru5VBG6Zb0ptTKzehM2Ck89fzR7pu5S6oRSY
         OgrF9z7EkK1YCh+3TVdKpIsSfu7nyBH7JQYnwwY7k5uBCz3OIjAT1H8UUWiVLRokVVw/
         h5af3vFRiHA/3jPTnWzAU2sUYdAFR0ECzWmBordCzVGUgXFKHiKq0j2Y0d4t/wuFBvla
         RlUmKrSMQCJGCiSX1yj/OAzJ+gSxlA/xwoYJk7fTnl5Rs1ObYEmPG/pX6Wu1cq10ZoH8
         EpgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr80Ndcqs5m3YyprL6njUyh+ZZSobPqFLKW9+JZtuBVLoRN0QswWwfWMWt+bCpSp84tz8FL+UY8osLi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8m0IKB5DBIA9z4507FcNfVTrh0MUoPPPsoNEeglzbkTpNEzMh
	F0eMqHGhT3au7KkcFOUr0GvimTLWOewbB0eZNXUja2zyRQHGgXbCr3spH59QqpUvpiW2PVnTOPy
	eImSS
X-Gm-Gg: AfdE7cn+7jLOMjvUNbxM/H2B4225y0BMeAUAw9XXGBM7sIVpOVTvCNxBdf2sCxaYKM+
	gz/+6EB0bHNMCBBjxwZZj4tyA0eDaWPCAzZW3qlZO67vmNa/o56MHinXsqQya4amUvW4yjhTUUv
	T5CzlyiCjdLF66UAVrAPx9x3QoPGgXvX8e5EbpUf5cdUlt6ClfqPoaM5PhByh/QM3puWVE7wFAg
	ORUAKHSYeNKBS4qsulIXn0f1/HJ0G9o9zdOOmBHE32K99PMAxcsvy+AReln5NYOwuqLFJJobbuJ
	N7jazSkL1L9zP2QHrL82/KmxtU7cXbZ1J582ISlpHaltM51BdHg0Z4YpDGT+XEJ4Sk5920RFd6y
	/XIBaDSSzz/uhK9yRePv+0G1TF5e8uIyHDzUPkEYoX5y9HtNLnl081YY1e/Nzt/1KiysBMWY2U9
	iahnDioz61/nGYQvZDcxhOP3RpjA==
X-Received: by 2002:a05:6a00:a29:b0:838:127d:a167 with SMTP id d2e1a72fcca58-848895dc8e9mr8210673b3a.16.1783940412023;
        Mon, 13 Jul 2026 04:00:12 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:11 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH 0/8] ARM: mstar: Board filling out pt. 1
Date: Mon, 13 Jul 2026 19:59:42 +0900
Message-ID: <20260713105950.1346962-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have had ~700 commits in my own tree for these boards
for a long time now. Display, audio etc work but this stuff
hasn't been mainlined as spliting everything out was a
nightmare and I didn't have the time.

I have an intern called Claude now and we've cleaned up
my tree so I can start pushing parts of it again.

The following are devicetree commits that do not depend
on drivers etc that are not already in mainline so can
be applied now.

Daniel Palmer (8):
  ARM: dts: mstar: unitv2: Wire up LEDs
  ARM: dts: mstar: unitv2: Add regulators
  ARM: dts: mstar: unitv2: Add button
  ARM: dts: mstar: unitv2: Link cpu to core regulator
  ARM: dts: mstar: miyoo-mini: Add vibrator
  ARM: dts: mstar: miyoo-mini: Add vbat switch
  ARM: dts: mstar: sbc2d06: Add regulators
  ARM: dts: mstar: ssd201htv2: Add SD card supply regulator

 .../mstar-infinity2m-ssd202d-miyoo-mini.dts   | 17 +++++
 .../mstar-infinity2m-ssd202d-ssd201htv2.dts   | 10 +++
 .../mstar-infinity2m-ssd202d-unitv2.dts       | 69 +++++++++++++++++++
 ...sd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts | 17 +++++
 4 files changed, 113 insertions(+)

-- 
2.53.0

