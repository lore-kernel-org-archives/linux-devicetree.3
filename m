Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997160;
	b=Mrn9O4Ogryf6dTcbojyR14DenQ3ayU0OAggAB64uloOVjaVhKwtATpV3hvfH5qdB7+W3
	 Gjec2LpJnKRoHn9C0TbewcA9vIzpDQkBSShYAJirtGmV6UJ9N7ZzMlgmvQawDqc9RZpCd
	 iHLivoCFerpzqwUZQsIr1nUZYRAstRP8YeR/1MuuvqBiQcRExcs7At56oegwUw1sHck8K
	 hAB4zJDXDzHVKutdFhiYWna19Ih9Idr6AFQzh8bjenCeLcy59j33aGyblIH3rTN5SXfT5
	 9qMI9joUTxtBS030bPj+rSqnH5h42rYDF0fGe2IRjpsr/vQI6sLDseu3wyc9UTdELOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yvyTQy7QXUkCqUdPoN6xekhnCdJic/iB4Nnp6WsuGuw=;
	b=qjnHHPHyOBFrIVivLyM7jGTbLyd7JIevIwWiSAhMydElrOI53iLF5m0ZQaFqSGc+WEUC
	 ChpZNF/eAjMCig5zDAJ5b2I3j6LzTKc47vykyDtg+Dz8YkNXzFAsg69a/qdECcZmWwq4R
	 +dBFqm4Nh2xOoqS4odN4ZXaFZC1A0eAj/Yv3UX+F/7JqFAAvADhyU5YCsxOgLwsk+4Sw8
	 DtVxQx/jZ9fesyNMTi1aJjlFBiXPOcrTr9TDvcFAlxv1r/MrRV0j0rndShq/YBGMwBZJA
	 xuzvjAWchD2g6rKhKZtJbrK47MVupXGlywy+d2ndpReArU1kcdtZEJQnEMNQOR+fONA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Af+RmXH4;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3C606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A3C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Af+RmXH4
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde00369ef5so595664a12.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 02:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794997159; x=1795601959; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvyTQy7QXUkCqUdPoN6xekhnCdJic/iB4Nnp6WsuGuw=;
        b=Af+RmXH4lmOl1Zkkgo/zqrNLUdoc6JZg+vynU4oZoEtYIb0XE722BWtdDyLwYymzrD
         rOUsB1J97x7PIrU4RJzBMIj5wlWDw6duluvOWChfes+dM6imoEOUK8gGSiqLC6s+NDOh
         0LwUUxwDNjMn0lE6pXZJlWxYS1FWca0UY7B8y5NqtP2sfquAFdoR6FQW7pSBFgPk7FLa
         lPwsMXd5nekKWpH4aOzP/I97iBRX9btMNKSzJMgZGBFL3BrLQBkCBhctjEs3Nhmd2I5R
         U3iZgcax3NSvIkcI3pms6BSERailwI/xXVV9X5AGBBOzeJ2DTSJh/PfAySwyZuOum5S6
         XmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997159; x=1795601959;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvyTQy7QXUkCqUdPoN6xekhnCdJic/iB4Nnp6WsuGuw=;
        b=YY0Otqk8yl4WrQyuFEPE/RMoN/2g2Qs8r4QYFxy29VmnrvfHWYIXs8X/bfq4Tcl5vK
         ANXd9Ov3y3+cJTfsGFYikcssobRewvliBv+Yg8fePA8+9LmZcHN3ad3hhdfYsSeZ1umW
         BppXFVd3TW4BRAb4gBU+v+NlUAYyXJ6BpBCtsHspyJlTr2hJFrmeYn2TLhaUyEZ2ytZm
         iEXh16nluz5Aw84rKQdcEd3kiHofA45zJwbcf1yzYUiAqSBV2jEUdmfHKIaawxsBGnlm
         ct2H7WQf7CAMGi8aMJucF+IqGmRUWMb3QjaYTRJNxyPc8Fn12yDV6a4e8pGDlc3g+LJj
         4OWg==
X-Forwarded-Encrypted: i=1; AL+hErE41hsv1UdWM9ClwFIybKpquvKHM5r+zLHbindNxT4/HKBNevT1EOK3bSyFClAa2CeNORBF6YCFGlHr@vger.kernel.org
X-Gm-Message-State: APuU4Z9tt+VWhSIks8ZirrdUUugqZ+KqUl4VKQwh6VnWUv4YkfkAuNci
	fyuhO9ZGq0LJF1lOJd1eCusi2pBuKmBI0gWgmLb4UlVJod33r7tJhfddADngookrKWSFVYdZOvM
	XRCsLAF8Qy+z4fo7qVRDYVs4syA==
X-Received: from pjbbx13.prod.google.com ([2002:a17:90a:f48d:b0:3b1:cec2:5b9])
 (user=amitamishra job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b88:b0:3b1:ba59:56a1 with SMTP id 98e67ed59e1d1-3b3d07ca529mr2196929a91.39.1794997158388;
 Wed, 18 Nov 2026 02:19:18 -0800 (PST)
Date: Wed, 18 Nov 2026 10:19:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118101913.3135869-1-amitamishra@google.com>
Subject: [PATCH 0/2] perf/smmuv3: Add runtime PM support
From: Amita Mishra <amitamishra@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	amitamishra@google.com
Content-Type: text/plain; charset="UTF-8"

On some SoCs, SMMUv3 Performance Monitor Counter Groups (PMCGs) reside
in switchable subsystem power domains rather than an always-on domain.
Currently, when such a PMCG is probed, the power domain is attached and
powered on, and remains powered on indefinitely even when no perf events
are active.

This series adds runtime power management support for SMMUv3 PMCG
devices that are attached to a PM domain:

- Patch 1 documents the optional power-domains property in the
  arm,smmu-v3-pmcg devicetree binding.
- Patch 2 adds runtime PM support to the arm_smmuv3_pmu driver, keeping
  the PMCG powered only while probe or at least one perf event is
  active, and guarding post-event perf context and shared IRQ callbacks
  against accessing registers of a suspended PMCG.

Amita Mishra (2):
  dt-bindings: perf: arm,smmu-v3-pmcg: Allow power-domains
  perf/smmuv3: Add runtime PM support

 .../bindings/perf/arm,smmu-v3-pmcg.yaml       |   3 +
 drivers/perf/arm_smmuv3_pmu.c                 | 134 +++++++++++++++---
 2 files changed, 118 insertions(+), 19 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.703.gf848ed807c-goog

