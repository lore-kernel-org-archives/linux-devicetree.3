Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78E437C0F7
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 18:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722528; cv=none; b=q0Z1RpG0baup7YQFAR6cuyS27KgNUEjk+tRyvqR4A78YIfmD6iTFwe8zZz0MgKNOG0yEwVwtSqaAqDfpIXCGyEYOcWefxFLJjGZA9qy/tig2hyIf5iCponGtQJKVqgD9Uc3d//9QJMuWHzzRHP5Bv/ETQ1OwyjABVeIoGByRhOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722528; c=relaxed/simple;
	bh=CdSXcKIWATlie58iJ23y5PpUciojp/Fp2g1FaXk1CAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPwKil63RexQwuX7AcRFpZUPkMUUgyMxFOrDAvTXKT5IQA3rrmw3e5FR6a+HbVsZg+fD93HMfaQ5ocKPEyFogPPq1ladq4pV4K7fh6f+TmbORtUxqGssX1Qx+UcTA4PPX/l8ypR9pWw93fAGG3OS4g0Yhsw5spwA7565KRdJxDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWF7Uyzk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWF7Uyzk"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c6b3f71648so1940885ad.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781722527; x=1782327327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31hgex/xQ9Vy5yb+ah6vc11lBZIcQcmbTLXsVx7fqWg=;
        b=EWF7UyzkTxRh6CL553m9WNYipCCtGJMu0sG48ptW3n0ZkiXuGC1UvSKiPFM8RPENwz
         mnClqE0OMcXmORSPTzMA00sjTyFl9p5LL3jj6caQtC3So3sgPphpwrNlIkHyiA1T8Btl
         ZbRU5KO3Juc4wEVukmJ6bTihDLfafWKX6OFeNJItNMevco8e8QEm2Udns+Y3eF5lDD76
         jYeXSfYWYsGdytcmZs7WsyqtETqjSAPT6bINZw16yIr2/nFKvfD8n15P7rs00Jxp4N3p
         Wz/c54jEQ6cjGs7P1WuGxPVnB5yS/q1c7zy2zDxTXd1mDB54wfiv2oGPp9Ts6jHIxXQb
         7fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781722527; x=1782327327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=31hgex/xQ9Vy5yb+ah6vc11lBZIcQcmbTLXsVx7fqWg=;
        b=aM5Vo/08mSJ+EPyF81X6J6ywAPLtJTqvUxyA75IouXICpStIrmLtXJUoYQUnSbhsWV
         SQB5TXoTHVgXQNcXrGKFiDZjYG9zbKNY3mW8dghvqU/gMBtWRZ/aGCPaDETVDfNE3CXw
         rgFkwaFmjhSrJY/JU7GB/WUwezOrr2IVsHnUFa/cH6PUUHDZQ9fQRZJZ25BJ0wO+coXR
         gIaIt0//jEs+n5eVQvjUCktjX+3b73Za17k9a4e7oBQmKXl+RTgulG9IXq+7/W/Bl/Fw
         3ptk9FiooKjQCcKeWKNj8YidrLNHXs4EXxxkJh+ijwT4J/3OdtXB+oxZL8y0JJwmAi4f
         bvaA==
X-Gm-Message-State: AOJu0YxTEv294Cewdd+7q76iIcdr2rbGecpspidsuLKhgw/D9prUE53y
	vuG95Lo8L/W+HZsmq0IDcBfD4sykr+jqt/sH2TOe7tDt/lkG+gTVoh7NUHNw9Xs0
X-Gm-Gg: AfdE7cmqymkQjo+iFdf8aSBCC+g0zcMNaH3xKNYtMzMPI8EzFktq2ha16bbLx7UOW5J
	yz5FqqJzp/Z5kL0g1qmFqt4MUMfgv6mRVGtO5VYyBvcccrqi6bgIbE6Dvcq+QLYFSwT/cuRCYod
	z68GB6gXuBPoycoTlunVkt3hVbBXjPN9laf2RFyKb9h76ayZ4gzgUjuJPu1Wty4ATprB96fsodM
	F14348NDfNPXo3K6OFJ7k+8emvFTyVGm7tixaRrnK9bIEx5yp8NgbWOBctjvxEGmV0dF5NNibs5
	nmOGI/8uyQ6dUbX25BpWsuS9oGdNPUuNhuM3Hjg8tZuN7CmAqzsb8Xn8cZ08EJSPc3E2Z3q4YkL
	MoOOY5pCM9aJghzo1TUnDsvsY61Mb85sP4f8r7bLx5RYKfU1OsPMLr+RhbGI2+vJ5OGBfDEHjrV
	Yn1x3F8gswJHPeGoJDSj+nWEwAkzLU86wGUw4AXQ==
X-Received: by 2002:a17:903:1b47:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2c6bc2719a5mr58945165ad.36.1781722527074;
        Wed, 17 Jun 2026 11:55:27 -0700 (PDT)
Received: from vbox ([117.215.38.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm177164505ad.9.2026.06.17.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 11:55:26 -0700 (PDT)
From: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sstabellini@kernel.org,
	Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
Subject: [PATCH v4 2/2] arm/xen: Update DT binding documentation reference
Date: Thu, 18 Jun 2026 00:25:18 +0530
Message-ID: <20260617185518.43500-2-tejasmutalikdesai@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617185518.43500-1-tejasmutalikdesai@gmail.com>
References: <20260617185518.43500-1-tejasmutalikdesai@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the comment in xen_early_init() to reference the new xen.yaml
schema after xen.txt was converted to the DT schema format.

Signed-off-by: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
---
New in v4: split out from 1/2 to keep the DT binding conversion separate
from the driver comment fix.

 arch/arm/xen/enlighten.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 25a0ce3b4584..0b7b7e3417e3 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -251,7 +251,7 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 }
 
 /*
- * see Documentation/devicetree/bindings/arm/xen.txt for the
+ * see Documentation/devicetree/bindings/arm/xen.yaml for the
  * documentation of the Xen Device Tree format.
  */
 void __init xen_early_init(void)
-- 
2.54.0

