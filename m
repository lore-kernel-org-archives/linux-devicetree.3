Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB8D3F54B3
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161581; cv=none; b=Q88AFxgxUyhOYnPmwpRiQ1WxdBekDPCs3XG+1boV/3kSsEmVUFHrliubGHxBPtm22C/6Nhl2Pg0lq74G6sLmYzcpc9sLiUiDN7+W3j5jDU/5oJnFTgTfdurOxW5vlWcWqdfzKFtwNtd8gbzH91mILVSeiWEB5cprGEdw7SdpRPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161581; c=relaxed/simple;
	bh=MNVSebD0+mDfW5apdNkpjHmTZ7QyrFLsTRHwJtzgd/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PQgDd+BgPjL2YE5/2kbHPZEc13LgAQBhRCzjOQ9KBvKGXiEKwR2d0R9NDQm4iy+pie9pzU7as80Uxd+jGKrd6Ymlwl915eh66xskzT7F2Ft2fjrVJ3apnd5jw2Td4PgBDN2PqGgFnX3oBpNROiUkMBhElqVui58p9ELenx1ay+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMcD/C4i; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMcD/C4i"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so1554165a12.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778161578; x=1778766378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmK4VbMOENlzFgqB5AiS31ODfP6gNlZbQzPOHR6VrIc=;
        b=aMcD/C4iDIBN9W/i86eH4lcw1dCPt7iumK5kkvtFwikcD52MNV/crINTo0U600lKam
         3ulbjmmPsV2Io5hQXaRvPFbGFmNJTJSl2ZPrdflIrlAtiCRm97ZTkoTOOrVuc9R9N4IJ
         0HMx9r6MNTjp6ef9Gok03JFDBGTDl5AUE8SCuxLe/buJZ+WwK09yLh8NqvGUOLS0yYtc
         kGiSqlBNMXZsj5Uv18N1kAoXymO806gSXJYnGVte+zWyZUNcxkClSwwBc/ynAqUH/9he
         +JUIEHexg3CIH8cj1jV6fPoZw1ZzEKCJhyk1vx62+ztXQV0mAPsybt8Xz5eKgfCJa1q7
         2ErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161578; x=1778766378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmK4VbMOENlzFgqB5AiS31ODfP6gNlZbQzPOHR6VrIc=;
        b=mJddOe1lkEXLMY9clSZ0C1GgU8CBHwIkbPW7pLx3WPvhdMVwDXSDbFhrqhrA2flDQq
         RhPhYFQuKypmkj1r1gA3+sABDko7MCWChXukcqkuyk0I1sObB6zPhEdVY0EszvN9ktts
         HRmfWnVcxgc5RKD1wTnKwDfunJGK1eF52ugR7zmJJJ68yp+a3SnR1s3k3CeeoJTthSHw
         y+rYGrG8AP/1JSDf/Tj0UBboWfapU5n1AL5k8vrCUUduGmtdYT1tYUoFAh1te6OWOYHP
         tTOS8TuqJ603yM6DXscY/6X6Xb7YDppkVI8ZR3WUtj7uDTusNfneC2y7NIz70VwwkXRr
         g31A==
X-Gm-Message-State: AOJu0YyDreDEIAdLRlyF8whKfj5BX3Lx98fJYA/uAQofi3JZk5sjj5RE
	//ZGSf2/JJX9euueuyZNWFb+vG+nNNbGKVbUra87rMLrd9oLIQOKU/RbiiNzZg==
X-Gm-Gg: AeBDieuN1MB1DTvGl2z499D2CGjf48CGkrOQs+9VXpGIXdaM2/F9Q7Nzu+0ABHUoU+q
	3XOO+aMVkzrtqbKvX4xM+yKZC99w7Ah0Eg8h0t7ny35VdTCIPQcv53iTu+GWl77LOMG5nS7gUZa
	SRiolC+kXw0P3zqMDz1KTaGe6l6lEO9+A19x/4ZH+m6YsERrsnwHaF11fY2JQYZcDPiBfVm0K9u
	VlSxBfORi5FPPPe3KIQWOUBi9XvJkAmqN+OjXsgVnQHweXJOzvTUJGWDLe89z1waHEPcBbpGLrK
	nC85bskjpiKDof6zE80ypV21kPw7eV2ovIJXKjDw3OVcTX04mckj3ieGKe9N4HLyQ1TTnNDGFXU
	4d1CtXI1w1XAsaTouW593Y4Jv2Kt1ezPLUIqPc50XVJNEm9sCqTfGy14P9L2AyleLPXXP8ZgNZa
	rxJ6tUw/EV3JyrIpRVB1gIaRU=
X-Received: by 2002:a17:907:e152:b0:bc9:e1b1:8edf with SMTP id a640c23a62f3a-bc9e1b192e3mr69894666b.12.1778161577410;
        Thu, 07 May 2026 06:46:17 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-450524833e1sm20701615f8f.2.2026.05.07.06.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:46:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 0/2] power: supply: Add support for Surface RT battery and charger
Date: Thu,  7 May 2026 16:46:05 +0300
Message-ID: <20260507134608.76222-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for Embedded Controller found in the Microsoft Surface RT and
used to monitor battery cell and charger input status and properties.
Controller works both for UEFI and APX booting.

---
Changes in v4:
- fixed REGS_TECHNOLOGY read size

Changes in v3:
- fixed i2c_smbus_read_i2c_block_data read size

Changes in v2:
- srt_bat_get_string > i2c_smbus_read_i2c_block_data
- added devm_kasprintf return check
---

Jonas Schwöbel (1):
  power: supply: Add support for Surface RT battery and charger

Svyatoslav Ryhel (1):
  dt-bindings: embedded-controller: Document Surface RT EC

 .../microsoft,surface-rt-ec.yaml              |  63 +++
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/surface-rt-ec.c          | 389 ++++++++++++++++++
 4 files changed, 464 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml
 create mode 100644 drivers/power/supply/surface-rt-ec.c

-- 
2.51.0

