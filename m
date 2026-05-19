Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65433E1231
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179082; cv=none; b=nY/q9P0LVP3EJ5/aa1QFwEkW5rDP2LybRtTUV3xlzqN+NFDhuw0gvgvGl8OA2XYchMvaodZtxun52dhe5uZ4fflBsCl14UXbQ4sIXCkEHlGI+pk5XpxFFOQbWwjSEsSXfaEGDq6hvYH1rRPJxMdRNoZFuVidMbjWYw86KGIQNb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179082; c=relaxed/simple;
	bh=fqAFN7dyR+wKqQAqSyaQDBTmVbMV9AvPw9gs4mNuCmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RWaCCS67Z44UP95Uo7nWUdZrUjGBvAgW6oNSvFkOsvbD9t181Ev/SmoiiRN9+mNNhjKgrvcEXZBYadt94QNcwIZcXoqLRgC5temcPxfbZ3cjNSV/cZZ3kiktKuO0oC/KdTmhDgdExFI1PEfZVIKYtR7Ahk1xL0iScugxgS5v+Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsqO2GR6; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsqO2GR6"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so1333768b3a.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779179080; x=1779783880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uXKxPnncRw5Ggb8vAy59S8N718WjW+e/lnMOsiI/io=;
        b=AsqO2GR6vX2yZdXRD/EE33EEi+/Mvu3qehcgWASz2nTbqCOFYubpesz4rT6Xzx3lsV
         5B8b9Yl+A+hO3b0B6gXwHeh0CBzHlywEy1rG+vTE69C1zhYAmb27Pc52Fc+M3FrwAFo1
         sBATMnAe8GIemVBq8WeLb3Ie7MYcD8xVcEDLXI5Yb6ZKlxTtQ11TDo4NqVjMjfta2pRL
         o6Z79DHRmPdgnMibOXZwjjcStyQ58//g+Hs07CBiAbnzFUxx1xgq8oqrjTdIS+93VIir
         SLEfZHm57+xCgIuD03ZTNDhREo/bszXzoVApogPCLUrK3NfmurJ9WrxZtV7cAZFNaMXa
         koog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179080; x=1779783880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7uXKxPnncRw5Ggb8vAy59S8N718WjW+e/lnMOsiI/io=;
        b=p0XgbNKITeCwN2TiADSXsiBtrJxC1J0DMI9XmQ7G22RediH9zig+MinlNxpIB++/1a
         BqM3Y1h5bZRrZuzpp9vZaypZvusWqx9wKnN4Ge7xm+fWZY6+xGm7BSnh4mJhggW30Png
         bcTByfzKIPh5S2YQ7nJqHiEymhvpmqMLYA3zMpjxtw8PpQc65KtbZzQBfvEd/fkKqgBS
         N8IaEbzM7cOzEm8jTipvU1/TuksLxDQVS6pKccO4CSfn4i1QBXEcVdJ+zHL+WviY42n8
         /7E5p5LneruBxaGhmxaveJBCui9f2tGpnk8ychtIyW5PI5VVlJMS8FNzJRvy6uhuMynP
         fkpw==
X-Gm-Message-State: AOJu0YxnaTaNAqgO5vNkyIMrfeR6zVJaGvZeQFCVs+mHJY4CzJBMPeJC
	fRTaxl4NWi0lbz/dqKmPgGusaloIU2wQ2e+S9y/Dh3ODRsjER1OVOy94uTQTfaCrKTdQno4n
X-Gm-Gg: Acq92OHXN5X5VlmzHa7/dQOSPXJcRFQVPrJskedADuKBvDEG+pyisOw+3MoFBUZiVO/
	ZTmCMqkHO1Swn2YsZqwKBMbZibf0jW4YEMhl8SriUgHLWm8RkecTPgMItO75egm+pkWeM7efouC
	3yKdRHwesfvWHhb2gnvt9ZdWJWCGdJj4ixA45qalEY2S9KddvCde9C4De2otx68R8F/Zs84IRUI
	yp1lQ2ykv+Qy+lSz6lpIbKhJamNJ7DIOAICS+S85rg9Sn6GMJ3RU8QEyKdxWt+Pwa3WhMp3ozQs
	Wwf6gj7ijj5VRcCjw983Tq53reU+hLt68uwz7oM2sz9yFQqtd/jRKArguwR/udTstezgwNmmGx6
	oQ4BScNlk+YmcooulhPVo1d6vqcangbQGjHOeE13zcxKcQj6F8fQRI1Yn4CKNOpA07DiAS6oB0y
	ky6ENfpfR5fx7sYvVgg6h5LR93epsy/DFcHw+FISQWabf7opo8
X-Received: by 2002:a05:6a00:ad87:b0:837:d746:8e1a with SMTP id d2e1a72fcca58-83f33ce695amr18963950b3a.22.1779179079824;
        Tue, 19 May 2026 01:24:39 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b4bfsm17822898b3a.28.2026.05.19.01.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:24:39 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhaomeijing@lixiang.com
Cc: robh@kernel.org,
	saravanak@kernel.org
Subject: [PATCH v2 2/3] of: reserved_mem: clean up redundant alloc_reserved_mem_array() call
Date: Tue, 19 May 2026 16:24:26 +0800
Message-ID: <20260519082427.4181476-3-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519082427.4181476-1-chenwandun@lixiang.com>
References: <20260519082427.4181476-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If total_reserved_mem_cnt is 0 after fdt_scan_reserved_mem(), there
is no entry to save, alloc_reserved_mem_array() has nothing to do.
Just skip it.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 7856dc857d65..462e7c3078a3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -270,6 +270,9 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 	}
 
+	if (!total_reserved_mem_cnt)
+		return;
+
 	/* Attempt dynamic allocation of a new reserved_mem array */
 	alloc_reserved_mem_array();
 
-- 
2.43.0

