Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF581A3154
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453759; cv=none; b=VbDoplUVXujpoEz56EvXJAUg/1QFTjhKREH5zqQSLs0eT5fmrkayxoH2Ii/q/88LyOfnQz0nfaJgZ71iEd8As2VsfZlmKHV3yM81F0sbpRxAoq+b7gE6wOd7bhvR0ie23z6Oyd8YnJ1k06Lv7tbpNMXcjE3fQWiPOPLfZ8nCi88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453759; c=relaxed/simple;
	bh=ofwx4zf3yY/vPpZiXyWfjiOYKTW2xVZryZrU3kAs4eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPIXGh69p9+R2d8oNp9QgsDK41RSKKyO6GdpHlOXS3Sv+1LfYXlSxZ8+mA3JbRuujx/AB+euXEWJUKf2ERxZeSU8DQlJSku8SCBkMn1K6NWwU59D3KvCfj/nmRsP9OEADbh1K4B9RduxhzlwKnDRC6BbIWEyAk5cG4/RE0tlir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4/uXrgZ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4/uXrgZ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so2572634a91.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453758; x=1782058558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch+S3rbykedr2z6bsw5Hh8zutORUt4eMMB5mYUulTJs=;
        b=e4/uXrgZ2bzPriWGVb6S5iy/wtLOfz9B/JHjf72EFQ9wd3DdsVW/VYTm9pEcjsbFNs
         5oMm/JEN7TOStzi9i45dEdJmOal3iQuR9p4olWejDtd8fvIM+CAHUbjpBJoH2GyZm83H
         baRQENsxyvaILq/Ydeg854ULbHvw+XMSReoVn1fNSH3mmOwWAOOMY4LgwVFmmyCRC8ZP
         6gmqo3VNkDdLc+1oZy8hRTt6dEQriiEXF8K/KnqM/Nl0lNgn5ern0WqY2EB4VRTqNgr/
         fEar+HmUN0rG5dBkVBpgQ6/nS0hnmMFO78fhY6QzSaT6BoMlOh9tBYUuu/p4XucqQjsD
         xrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453758; x=1782058558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ch+S3rbykedr2z6bsw5Hh8zutORUt4eMMB5mYUulTJs=;
        b=WCyPUb6P1g6nQ8vIENTTkxWjlZRcnDgFziJRmT4RpEzxPIptsNF4mBi2MTxEaCz7p/
         HcGA44lLXJX+eferr3CPIJQYXYvXquX/h95pSGkPhwcgn+IELHfwZFZpqb1vdPI/MtHx
         RZjvyBDcdOEPLLQLRFbbDtBDrjN8eySMUhyUh2w0W6lRHE79yieHZnGgjV4f0jyJUvI3
         TpwvySznrN6cqJJyJqoxM+NikNMrdBWX/Tp7hQB5GuZd29UBlx/cb7WBoWHqe5NqcE3i
         hL2ZPh5k0rxld2sgX07CkClQms34WNxRVvPukTogfRhUbFDQo4jn3aZqyC4wuHDHq30x
         UCnA==
X-Gm-Message-State: AOJu0YwRg0gx91HM8Tmash8F0wNBmmxztIOuenWL4M4GG1YsdDxSqdHr
	r9BQJNk1FiHQORTCSoOPmOPfm9HsZkXiRiJErDQXsWsg2jLvelIVDW7Q
X-Gm-Gg: Acq92OGrEHYpQABJaoYZBglTMaXUS8pgoj9iL+pcjNVXvKI6WS3VBSdUSGtC/Br9Pd8
	YivBiShvdOuFKqEz2YSZqJ5/9WmIsYWsr3y/0Ou1uIR6MSQoolpgTg75GedFn5F/+J4bUF9041d
	fddDpmISV9r+Rz+3R3xHYxt6IK6y6M79cy0IzwmQ0SoWq8WYWQboSEP7rf0IpS9mkuKUdjhmuDk
	7KsqMJ97sd0hyMJOhqVteQfARPfGk8iZRyz6F70y37VY1/f0TPa5lIFo9mqCnzt70vf8gtdz7RX
	B5XECxhOK0LYa8/PfF2TEbMhU6l2xiAxPaNB0o7MGVrx4PGiE0/RCwmeTkaJPmTtOWkyZE3ft+2
	A8+Huf3e1kc9tG7617FqavN4j9O1AbvhzjU2WsJzak+DJaAktoj1ReDnMOyn8XbH5WzvFeOKMZr
	vFIrMKDxer82ktll7jPw==
X-Received: by 2002:a17:90b:57ee:b0:36a:d51d:42ef with SMTP id 98e67ed59e1d1-37c2bd033b4mr7411267a91.13.1781453758174;
        Sun, 14 Jun 2026 09:15:58 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:57 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 3/3] MIPS: fix misleading elfcorehdr reservation success message
Date: Mon, 15 Jun 2026 01:15:03 +0900
Message-ID: <20260614161503.2219681-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614161503.2219681-1-ekffu200098@gmail.com>
References: <20260614161503.2219681-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mips_reserve_vmcore() does not check the return value of
memblock_reserve(), so a success message is falsely printed when the
reservation fails.

Reserve before printing the success message. Check the return value and
warn on failure instead.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/mips/kernel/setup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 1ae6d0c0e1d6..c7769ed882e8 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -437,10 +437,13 @@ static void __init mips_reserve_vmcore(void)
 		}
 	}
 
+	if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
+		pr_warn("Failed to reserve memory for kdump\n");
+		return;
+	}
+
 	pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
 		(unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
-
-	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
 #endif
 }
 
-- 
2.43.0

