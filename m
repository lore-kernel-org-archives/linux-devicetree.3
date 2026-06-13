Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C87379C4C
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781333920; cv=none; b=mWwmH7tIYSIQSyO2c4wD1Zl48lnRZbNnNpejF+6dp0aEOR7ujNU4MSlwDZvZp8v1H0dFGZp8MYiLua/altmXySVoyo3KKng1E7q38cifqW+SfjCg2i4imrlMCyNOUs5HchXx9/u+T/e3nZna3gEnn5t6HIs6wthCNO5DFGaDdsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781333920; c=relaxed/simple;
	bh=jDvwLKLt9ko7MMPzHKQNkwtiWAgYwLL7BmG6Frw38eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Djp618aAKyCyC0lty2tMk1KToBbzMozQVK4oADUFPCIOMpHUBW44zHzOcj8AVYRQqRTpypakfy0BBb3qTqB/iRRC8O/OKTZOVlRFBHb8aU2kU/PNThtSeoVraq4vpWjYGwCBVDvEb9eRQxYB0umIJs34GJ/5w50cIRL0/bcWK7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H871zvlW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H871zvlW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso12149505e9.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333918; x=1781938718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O65kp4uYeS0m80wrjHhLdSErrpFdma2VMG6AHvedRp8=;
        b=H871zvlWJcbjBcfRHC5fK/VbNRS9f8TP2+dB1dzR8JSIy42/5s07wLMPv/De28CKkJ
         X5WlQqcvyPRFRbg4XJ+WCmFRJ7WcD5VPTWI9DpT00OFCC7yvx2DjurGsv3dqSMqaSMKB
         HuNOKEn/torVNqj+i4JDWxzUQKNikgVl+6a3e0uQmk9Zfh1uHIxYpR9mw4AQnxrQPy3x
         sC1rr5th5A7Bcuc28E3NlQ4t+2en2uS1XVQaMoNL5DnqKCHEYHSZwVEISzrUMCVWYsES
         /d0SmSPABS/+JWlA2blXqA8j38YruU7JrLk7LUZC8uGmRliF/bL3IN0sVOE03zjWUKTz
         tnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333918; x=1781938718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O65kp4uYeS0m80wrjHhLdSErrpFdma2VMG6AHvedRp8=;
        b=hqmSDg/72vws/1tZku9iw5djilGhXvucvpFMc7gkap7OGvNZqm0AjeOo7ZtQvfA2Of
         nGToiaiJNL6hY81+A/4dfjmxBIPgBhdZtZZeq5H0NKcBr5IK46BN/VYExEFdA0xUuocK
         dDj09fsxxJJbMmXNy9oUmWWfTeq6qJ/NGhWVNsr87qwF4eWYyaXJSnZDzcdwe3ORwMOY
         hf09Qsx0irzke+ozThp4bWDneQME2y5I4qvLTaegotpp+KwlKWECi3UNp77uF5vzObqQ
         KUCm27EvpoIvDgyWEjiwI14cwLaHsHiqRK+ITpSh3zn3Zr0a1rG2yEjWuDbGvs4+4EA2
         x93A==
X-Forwarded-Encrypted: i=1; AFNElJ8Kx9wqA2fTb+ZZ9MygFXmv5fuxYGXahMjpkz0mIsSeYhRzXvrczdFw7vcX5niHqIkK0CXL2JaunnFi@vger.kernel.org
X-Gm-Message-State: AOJu0YyWF9VegVokIBO5B1QL4JJLlPEL2mytBR03OZrxCN4METdZ/3+p
	hHRgLQ0lBYawogg/3A8Y7PfX4fufgBfB01nRNnht1rxfxWx8Otv1dZTu
X-Gm-Gg: Acq92OED2vHXIheYde2OWDzGXnBzf46Y3wnVGlK77cayvncgv9naH3pzj6ni0hzCzIo
	eh5ZwIssxd6HAtYoWNVRRwNfMkiKBQjOM0+9ITQopweJ+X4vyWZiPL9KiE47b1k1LOMSc/QHAFK
	0xWA9ygwWQ9AnEvklq46/8IHvGoYAvDD8ZNScoXGvoE2o7gNsAz8xbmd59MCpI+QwIOWnt9EobA
	s63K4ZlyCR2OfJ8bPEiPUv57zB6YggOL31/XDCVHk5y7N8Wusrasx/jD14OeEEH1zRalfP+Eelh
	lMTxLi85b4naA7P7q1g18sLZko/T2GVAW5p7V24h8RsFTdPDxnpegseB3EB5npfzys8+2oetSOe
	B8INLUkUIWw/iMPM6+qGbwtiiCMkvS/phx3ZhHZwmbiCEqNzOYklrny2fdTAOOqbBLq6MfSw/cj
	x+NA0kUbftPAMvJcbC36zNr8y3OAD2n7VCVcGNM6oErQh0ngsSfXAg
X-Received: by 2002:a05:600c:5296:b0:492:1e7f:d426 with SMTP id 5b1f17b1804b1-4921e7fd54bmr38722125e9.2.1781333917619;
        Fri, 12 Jun 2026 23:58:37 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:37 -0700 (PDT)
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
Subject: [RFC PATCH v4 5/9] accel: rocket: Keep the IOMMU domain attached across jobs
Date: Sat, 13 Jun 2026 09:01:12 +0200
Message-Id: <20260613070116.438906-6-midgy971@gmail.com>
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

rocket attached the job's IOMMU domain in rocket_job_run() and
detached it again on every completion and reset. Each attach/detach
toggles the rk_iommu stall/force-reset/paging handshake, and on
RK3568 the NPU MMU is idle between jobs, so that handshake times out
and logs a burst of "stall/paging request timed out" errors for
every job.

Attach the per-context domain once and keep it: track the attached
domain in the core, swap it only when a job from a different context
runs, and detach it at core teardown. A reference on the attached
domain is held so it outlives the job that first attached it and is
released on swap/teardown.

Because a hardware reset (on job timeout) wipes the IOMMU page-table
base register, drop the attached domain after rocket_core_reset() so
the next job re-attaches and reprograms it. Also tear down the
scheduler before detaching the IOMMU in rocket_core_fini(), so an
in-flight job can no longer reach the domain being detached.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_core.c | 14 +++++++++++-
 drivers/accel/rocket/rocket_core.h |  3 +++
 drivers/accel/rocket/rocket_job.c  | 35 +++++++++++++++++++++++++-----
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index 779e951596a15..6c128f585cff4 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -13,6 +13,7 @@
 #include <linux/reset.h>
 
 #include "rocket_core.h"
+#include "rocket_drv.h"
 #include "rocket_job.h"
 
 int rocket_core_init(struct rocket_core *core)
@@ -112,9 +113,20 @@ void rocket_core_fini(struct rocket_core *core)
 {
 	pm_runtime_dont_use_autosuspend(core->dev);
 	pm_runtime_disable(core->dev);
+
+	/*
+	 * Stop the scheduler before tearing down the IOMMU so an in-flight
+	 * job can no longer touch the (about to be detached) domain.
+	 */
+	rocket_job_fini(core);
+
+	if (core->attached_domain) {
+		iommu_detach_group(NULL, core->iommu_group);
+		rocket_iommu_domain_put(core->attached_domain);
+		core->attached_domain = NULL;
+	}
 	iommu_group_put(core->iommu_group);
 	core->iommu_group = NULL;
-	rocket_job_fini(core);
 }
 
 void rocket_core_reset(struct rocket_core *core)
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index 5a145ba8c5a92..78791ecb32e75 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -42,6 +42,8 @@ struct rocket_soc_data {
 #define rocket_core_writel(core, reg, value) \
 	writel(value, (core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
 
+struct rocket_iommu_domain;
+
 struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
@@ -56,6 +58,7 @@ struct rocket_core {
 	struct reset_control_bulk_data resets[2];
 
 	struct iommu_group *iommu_group;
+	struct rocket_iommu_domain *attached_domain;
 
 	struct mutex job_lock;
 	struct rocket_job *in_flight_job;
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index e25234261536b..368b2ebead1b3 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -9,6 +9,7 @@
 #include <drm/rocket_accel.h>
 #include <linux/interrupt.h>
 #include <linux/iommu.h>
+#include <linux/kref.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
@@ -314,9 +315,26 @@ static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
 	if (ret < 0)
 		return fence;
 
-	ret = iommu_attach_group(job->domain->domain, core->iommu_group);
-	if (ret < 0)
-		return fence;
+	/*
+	 * Attach the job's IOMMU domain only when it differs from the one
+	 * already attached. Re-attaching per job toggles the rk_iommu
+	 * stall/reset handshake on an idle NPU MMU, which is slow and
+	 * noisy; keep the domain attached across jobs instead.
+	 */
+	if (core->attached_domain != job->domain) {
+		if (core->attached_domain) {
+			iommu_detach_group(NULL, core->iommu_group);
+			rocket_iommu_domain_put(core->attached_domain);
+			core->attached_domain = NULL;
+		}
+
+		ret = iommu_attach_group(job->domain->domain, core->iommu_group);
+		if (ret < 0)
+			return fence;
+
+		kref_get(&job->domain->kref);
+		core->attached_domain = job->domain;
+	}
 
 	scoped_guard(mutex, &core->job_lock) {
 		core->in_flight_job = job;
@@ -340,7 +358,6 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 				return;
 			}
 
-			iommu_detach_group(NULL, iommu_group_get(core->dev));
 			dma_fence_signal(core->in_flight_job->done_fence);
 			pm_runtime_put_autosuspend(core->dev);
 			core->in_flight_job = NULL;
@@ -376,7 +393,15 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 	 */
 	rocket_core_reset(core);
 
-	iommu_detach_group(NULL, core->iommu_group);
+	/*
+	 * The reset wipes the IOMMU page-table base, so drop the attached
+	 * domain to force the next job to re-attach and reprogram it.
+	 */
+	if (core->attached_domain) {
+		iommu_detach_group(NULL, core->iommu_group);
+		rocket_iommu_domain_put(core->attached_domain);
+		core->attached_domain = NULL;
+	}
 
 	/* NPU has been reset, we can clear the reset pending bit. */
 	atomic_set(&core->reset.pending, 0);
-- 
2.39.5

