Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E0E3E314A
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509801; cv=none; b=H/xsxAf3aCc+hKbdIu/DpQvrYglzF+iLQuE5qwl9pkB+dL6LDayxhekWGoa+DZ4XoP3bhkrWqYD0/xlgjrnRdvhM9ubVU39cwIpTM1n8SmC2LZQNyjeY95NO31aPHkDhATfZRd1iMQ5wS8nEcIIJprMfwPY0otx4gkMmaut00r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509801; c=relaxed/simple;
	bh=41gFk0UApM7sj3xsEnocBfMxYa2eQMRQZ+9fB8uQVIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hKIiTPPZAOGsQwFTRZExallo7U98ShImlIp3ixN4E8hJS/HL7ZRvkIj6EGfltB3nNCoh2motJPCS1f34PzKn+I45C24PEKtKmiA7pmfLLZ+PPst0aA42szYn7y5jC483CxfmT1LJssl0UkDqb8w1bQeqPnxtCfFmdn6jLlcgT40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=kYOo0Xlg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="kYOo0Xlg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so12055335e9.1
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 04:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1790509797; x=1791114597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tu9vpFECaX1jeiiFhdPQG51U6ZbrKqBUmuowoFSuZ9s=;
        b=kYOo0Xlg9062UpWjmX9XTIec9BSuyTMi36QLOMEVQQWeftghZNPq6VT0JYLyAuUScv
         +K1Z/DlB2IT76N30r7Pb9+wcMnqOkOTzkDVir5YYhh4mowPTkuc+peB0EJKaerLD/Rqz
         CdRYi/IIpgNdr188Y/wi6FjAJQ3d60jJQYVmXtalgnAjI2X29KMqOw/n4/DEoJ5abTNt
         fFNl5QCzN1V7Q9EYwRQdrjfMCREzX+No7IQWVb+P2hg9SXU3rexDOUPSdJAAiunXW2q1
         2vZ6Y7uyLX0hY35/d2J5OA5xSFfSO10KddAex1PyHhfpZ9c1MpSWSW0F9ZkcvLhg5xM8
         UlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509797; x=1791114597;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tu9vpFECaX1jeiiFhdPQG51U6ZbrKqBUmuowoFSuZ9s=;
        b=ttpAgwWPH8Vi0QfeMDoV14ZGVDg0PPQGKnY4NbAdNAw3inB3hD08tyaeHClaqsu/ER
         66BOTsvPf959BFiBJPs/0j58lLybKajgxy6oMUW8DxRRLAo5EG3LLMG3mDkFWLsr+tiy
         rLI6qEkq/1Z1dmHKESChsk3BSUh9kOKD09PYtM66vv5dYrMmQmWvA7xRZcp874aj8uxf
         vhnN1dCgVSiEWLsgUQL/AAAIjp+fxgqQswDdCqzOYnLwU4IBftTo06xqA3ZhFgaWOXYY
         2fViNz3hiseGjY0YLbdxzrwINxBHBasbcp7X0NMc/Nh0tX3TV8TSM7Y8dxUqGTEXaT7I
         /4ug==
X-Forwarded-Encrypted: i=1; AKwUvBxgydTBbi2hEtLhEWBtXcnWPYikH0j1KXFhBU00w9G06RRzsE+R7GZvnaMBBdoP/VaYX+zTBYQyKSkd@vger.kernel.org
X-Gm-Message-State: AFuF++n4DzwgT8kb9W49Z4BgXra+Txrzo30EvtDFAKesxevSP2PnDDiT
	wqR1a0ZKiUJjrJxFr0seDwkvyJllhQgpErw0QW/aYDwNQNpf/MCihL6l+NUzi7mPNX1G
X-Gm-Gg: AYBFou3Pp4SLZd584JQNdaBB5+RTVQsdcqFnULW4i53265YKLDsh8mK6t41iAsX0+8j
	Uc/e50gbzNveHLcyTioZPlNh0E0/5u/pLJhSplvqgoY2duV0pdm9Og6MxT9fYiAgyPOQbwNtZZn
	DoMmJX41JlfokSc3y0u0LMZ/YXOH2842N6FVZ1JGonM42vB411oijYxJHNh6FtkEXy+D5mPndMO
	c3IJKyWreqfeLmd1JcYBXZ4pjVCqYoqMfEK+bGOs05FyqbDBMe0R7gSrNpS9Zbi2tE4R5+nGlK5
	ma6iBe1Y0S/cOa1V7hizt6rYm1wj92Nhr4JOOjhtQgzC6iECnTevf29PgNwHM9ICxaE4bDRveni
	J1RW61d8euLsqzWrPQen4RGl9OA0jjB8YQJZZKxy7iTyOxgGSvlWP7VMM9dVPMqarfnOFzs9QNf
	7fyB3uUYEgTqPbzPCJ9T+V1+d/dXfs9DEFPrMzLctN/n5ID+HMHjpgqElMUE7LEDDi54coSBJLT
	cyGDala3Ut87HtdPIc=
X-Received: by 2002:a05:600c:620f:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-49ffe395d5cmr47873615e9.12.1790509797287;
        Sun, 27 Sep 2026 04:49:57 -0700 (PDT)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:6d6e:8514:ff1c:6c57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm57095935e9.11.2026.09.27.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:49:56 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sun, 27 Sep 2026 12:49:24 +0100
Message-ID: <f8be09ac54f1e0e8a46f077ebadef13301f3d054.1790357735.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790357735.git.jpeixoto@osyx.tech>
References: <cover.1790357735.git.jpeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..fc37a1db1aab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4559,6 +4559,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.43.0

