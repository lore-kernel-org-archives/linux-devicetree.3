Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A876480346
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581184; cv=none; b=nWD2HflXjy3wpDiflrLtgQZ9sMUptYI4EHReozWNMihKXKbtX+7yPdhnJk8wjItnh+7qpG6gTcY91e2wO4IHOxUc7fjrBvwjGCBH9W1qk6kiN5VwYjBhsvZyytQ9rxdFWjDCnfkPtDIUEUijDWnUa4H4sUKCnsrmnNIQmszLH/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581184; c=relaxed/simple;
	bh=KmQHc3v3JVs4EnW94C19ZfoNPOYoCnubmp9LMyZqsGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MJq0H3OlBE61SB5B4bXAGdKWX9HZ2jGNs3h69T86JYJOBsM7hEhL8lJZGjJ7limfgSEnhq1plzvOZLAnC06N+0/h77+sk+tUGJd7UjoPbUjx1jObjxB2MMDvaNygXNNDQg1zil1YEs69jrYlWTBbZmszOczt0ul25thKYKros1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2yIlWch; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2yIlWch"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so533129f8f.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581181; x=1781185981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OH9hQQFNIkDpasnao4boz8/RAiMZ7MOKPgy4BqZR+6c=;
        b=g2yIlWchXL6NYzmukT+J/sICsgBvebfW7FmoqIKk049vPq9fLUIvbWl/JX6UNHLbkP
         uFrHcqDVu+bXLBDm1bJjoZWFk9DN0Tm3IfeKdIftx/65//rcROnpzHaEq+vpjTdCbsuI
         uVTz8iFOJjQuEtRZ4DR+W+33AulqPnCY+Zal808OmncJuaD1aSREVnzJ0DP/+Z0LdRDH
         XAitOxoFd4eB9+nIeGpEPasBfZXuzEzoJwc6WUw2hTViECuEoDqo1vlzHP1tx8AQ3Uwf
         Frtn5tl6+g6OTTBpoQo1ZpXVDBPcW3u1WYJydmGK3h6/fS0nHOgfEbBa3unGPf47Mwiu
         woZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581181; x=1781185981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OH9hQQFNIkDpasnao4boz8/RAiMZ7MOKPgy4BqZR+6c=;
        b=SSYTp5PzPcQoOn1Fjlje5+jFCQaHtzZmzVCUsUtTDYiEPL4cCFdhX60cWxCirsP8pG
         n4Qoy98QcjGcIOhEISAwO9JCgjgrH9RWn9/tMOn7G3LO8vkUXEK0lxti8irkiqNjgam2
         mKrhuJpgBb2X0XDV6M5hWyG0aLUoovGFV/yTE6RaHMhLkcNQ6Y08vxK8w0troqRLfD0H
         Vv3Zi2OJ4ziF/BzRE+g9oBDT2rCpxH+0tBOv345AHs5KegjQ0EFL7ysJa2b60XgfZcw6
         V2FK32Kv6PY/copMsdVgUpAW1CUNwCOu2TYXmgG//t8AQ2ZK0OQxSnL8ToNMCwLUhc3t
         JVYg==
X-Forwarded-Encrypted: i=1; AFNElJ/dKYyG7zlqEieymkCHsOcCHsD+90oeWFb/mIfv+xJKLcdOGrIFh1qAAuXJd3x/qfCQx+eXoHGHyWno@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8TWnHsKvuHrd/wZSdK8FlB/5E6MBlKn5GkdDy6o/pGXflTUQ
	kJiAjo43438ADbXqDUTfY+Priz9LN3EB6Ef72zOoRO6Je6b9FGW9ozxl
X-Gm-Gg: Acq92OEaYfKy2a92LGUBmVbzpaFZ3Irdi1fsESnc/Rbdes7MsWElEUbm4J8XNCKpoNt
	2U1l8wn/vDYg+6rS6bsoKx9fHeh+fWSWYfAXVmuWYl+1txmTjWtFYLtFokU26VeSAsf/+Dojs32
	Wcr8iex3c1x5yhs80K4RbcxkrsvzLhLghvMmShPgQDFULeQ3slcw13s6tH9iz4FS5Cs/hGjyaVI
	+xD85QiQy1QEW/PoGyajyVhlEubFUAibU/Z97F7vXDfVx+uyMcrYKhtoObLG9zbZw3Dtss8PXsX
	Cpe7NEufeqBGeFonFTuVBrw2ip2Uj7GDfpYNRZSw3U1m1x7cepEhyMFzFcPhzFC/jOWus8fGyK8
	94jSIpQDIziEnbqqARuaeVBjyQz3CVcNn5YsXq9xXrOKZJuyhGD9HrFloyP3cW0euLOwU985xso
	DmH0kWqP7tKiXIbm7DkOuM2g+lSTzICN5GZloEpA4FQCLWnTzmKYJjnLfmxcV42gg=
X-Received: by 2002:adf:eed2:0:b0:452:6aaf:76cb with SMTP id ffacd0b85a97d-4602178b717mr9418813f8f.1.1780581180807;
        Thu, 04 Jun 2026 06:53:00 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:00 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 4/9] accel: rocket: Reset the NPU before detaching the IOMMU on timeout
Date: Thu,  4 Jun 2026 13:52:50 +0000
Message-Id: <20260604135255.62682-5-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a job timeout the NPU AXI master can be left wedged with
outstanding transactions. rocket_reset() detached the IOMMU group
before resetting the hardware, so iommu_detach_group() ->
__iommu_group_set_core_domain() asked the rk_iommu to stall and wait
for the in-flight transactions to drain. They never did, the stall
request timed out (-ETIMEDOUT) and the IOMMU core WARNed:

  WARNING: drivers/iommu/iommu.c:157 __iommu_group_set_core_domain
    iommu_detach_group
    rocket_reset
    rocket_job_timedout

Assert the core reset first: it quiesces the AXI master so the
following IOMMU detach completes cleanly. Move the detach after
rocket_core_reset() and out of the job_lock (it does not touch
in_flight_job).

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_job.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index ac51bff39833f..e25234261536b 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -364,14 +364,20 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 		if (core->in_flight_job)
 			pm_runtime_put_noidle(core->dev);
 
-		iommu_detach_group(NULL, core->iommu_group);
-
 		core->in_flight_job = NULL;
 	}
 
-	/* Proceed with reset now. */
+	/*
+	 * Reset the NPU hardware before detaching the IOMMU. A timed-out job
+	 * leaves the NPU AXI master wedged; detaching the IOMMU then issues a
+	 * stall request that never drains and times out (warning in the IOMMU
+	 * core). Asserting the core reset first quiesces the master so the
+	 * detach completes cleanly.
+	 */
 	rocket_core_reset(core);
 
+	iommu_detach_group(NULL, core->iommu_group);
+
 	/* NPU has been reset, we can clear the reset pending bit. */
 	atomic_set(&core->reset.pending, 0);
 
-- 
2.39.5

