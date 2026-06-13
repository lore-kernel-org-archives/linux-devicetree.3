Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB6037DE98
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781333918; cv=none; b=l3XnSCb/Q7svb+aIHZtqqMjjW0k8dE5JOcSStMqtfXKWsqinDfIW9B+fMpe44JH2MWTUxFihbIBcANnsd3Nlu8PQAiCbKtKrSO57+/NdHi3lGceDnMV0OfWF2W17ZmCn7C61i24HHmB7qVh8ys+JbEMVWQ53mQBLrkxhR/1zQ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781333918; c=relaxed/simple;
	bh=tLGf4/Fx611dZ3uiJyqt+wb9ZRWGswCt3ouClEW4dU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g9eApVWJKtBqUFXS5Kpaut//kOyuspuD0FJ4o4ISvfiG0b4EdiCjFyZhTxq/NUDGOWGaVrRCvWZCjGfq9NKk9QU+yKS4b+xzjTthRIR6CIye/4DePSZ7L+FpjkaXsGftJqrK2+WsaWs2em4PFmRkGhet0fPTPGagp+gvvD0Aq5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDrAHKbS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDrAHKbS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso14412735e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333915; x=1781938715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKXNGySjUJiX6/3GllpQ7O9YCp87EzXF/WJp8p9p0Qc=;
        b=DDrAHKbSPhFe1kYr4Fr7RWEbE6SDb+Knn7PM+PApC6teQFAEXMAv+mwx49hw4z5oY+
         mQqiduUB65p14pdxJZbrvE+6C0K8ywRkJo6M638EOyflrIbFHcPeBdSCxprCOA/QehTU
         gJ3m083C67AgIDpLTKP6D5u7EgXXYnF6UTI9VYwFkA185WZg1d1f9pFqHViRrSvkFOiL
         POVrJLDovIheeY3K5igfGw8Rtzrs86/5WmNVsn6Ecqtzc9+KalghSTRjVdzsuPlGaSnC
         qs8bptfeFjktaqIaxY44h5m59wpEgkhRt3ZaeK0wzgzgrmWd3FQ/s+hspq44DYmDDTIX
         1EMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333916; x=1781938716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKXNGySjUJiX6/3GllpQ7O9YCp87EzXF/WJp8p9p0Qc=;
        b=SkWF9Zj56zXd2Uk9Fr/lsXPnzrTOp642PeJCrtu5wvvan/wE5Y3WjTF/X4Vvy2gQ1J
         CEmAfWVwxCIFIfYx5RwhhOWd7HfTULE+rXXbVWpNHTqm/pfYbfktLiyaASk7kES+sOt8
         Uyquhyd3QHHOZmtKB7PRBJ0BeIy/ZQVs/7A5CQm8fbPq74Bt/hSvPUlF85t17wIPcuzo
         IScnZiejmk42/5MWrevc+bPfpXBeBvVTt6IFhLWpORoJgqVk81N1hkB6Az4d6E2vHcp0
         Wj4Zt8ClDkVW8fxFywaszr6ojYsPOaKTubEWSZBvY5DlzDB1AO6MPRHJDoehDe3ninvQ
         xrwA==
X-Forwarded-Encrypted: i=1; AFNElJ8hhoVSVrctAot45UWriaTN3PxuvmH6F3KeEq/s0MUfNo7+zEpnceizp3pXtEgbzmOf51NF3O/WfeqN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk7Nf1nb+qyQD/xu5UfEUlv8OtvePqLEsDejuSOZR5vZp4G5q4
	tHarkzW/BHkmjKK/jCYf1IaTu6R7JjgBImIxf+6xsupZzIDs7Swh+7CE
X-Gm-Gg: Acq92OH/hFkhR7lh3QSwDoPYxGcCrxpDrfuaEBIJ5Puh8pspkTL7zSY/AI/BL9YuVmn
	EDo7AI8+aKnzK6cys2KzMwt8EavBfU4dVE/gCkNQ2fYvjQGEpkAN9waPXL9c9cVsWl+IceZHSBQ
	RYUKyxb4NjkGegT26+FnCj4Hth0nFou0zf0+NNCFrvSsEXXS0y/qDegTTd/sxovLn+YBAJXsFD7
	e0NmaSa53EvNfpl8ZfqzUVWKcNfhwUoAqTSmOKtprKe4/AAwQ0WNIfaw6PKxVvfkiypimTDa23H
	8TGGzmoyeArAJJyUB5MXwKt5l2hDQ05TtAWIf/uDumvjsdhhsP/QexWyE2IQN9fsJUiN/EXF907
	1skX6K0SKq/SOaHx1sXAOUM1v/+e5HzRtZuggyoaKN/BxiWHVtJPp6wv+DsZtSc9qfOK5fUer8j
	2Zmb0+NvhjKU9rAbV5J/S+rxe/59F0yCOkD6rt2PB0zkk3feausoSv
X-Received: by 2002:a05:600c:6287:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-492200516d4mr27804035e9.8.1781333915366;
        Fri, 12 Jun 2026 23:58:35 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:34 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xxm@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [RFC PATCH v4 4/9] accel: rocket: Reset the NPU before detaching the IOMMU on timeout
Date: Sat, 13 Jun 2026 09:01:11 +0200
Message-Id: <20260613070116.438906-5-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260613070116.438906-1-midgy971@gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Midgy BALON <midgy971@gmail.com>

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

