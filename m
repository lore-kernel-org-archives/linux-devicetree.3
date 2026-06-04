Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C4F48035A
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581185; cv=none; b=VVJx+HPwh9f4sApJkry+xklqMaRdjNnAx0kZyuwC7iymwX745peVf6tXCylXzlXtk6YI8yhhfAQNSC4+SWJ8PdyrhwsJRwojB34s+Wk4ufLsTPkkGnXRIxoRIsGx9a5WbDtoYBK6CHQNVT+0HbUX0MxhLgLiPEunIP6lutVmtDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581185; c=relaxed/simple;
	bh=J+pt5zvnEKM9VdXyU6yLJevyaM3Qj+rO7ivwmnH2i3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y8vyE7XJxd5LnTcXBl60v/4vaHE+CeFEj0iiO5Pk08HCeV4zfwGUehGvwtH7+28wDtEBd0UPeTB5KLIM1fRzDUlXRKGEVuT9RnzlSCY6GU08Rl+HmzjzB4u03wRkhj/hL2W0g5gBebde0L1EYjzu4zDJ7Uj6IlTfh2uwZMF2xzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKtEEhQw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKtEEhQw"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eec22fab7so412902f8f.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581181; x=1781185981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peByEg9qkw/NuaYmCEAUEFnpiWasS3prWUS+hf7e7ys=;
        b=XKtEEhQwIa8shqrlr+mUWpt2800jsN891/3mf9b5PqsZz2SddWUvnj4mwN1ZZztOnQ
         /LRIN0z6I66coBEsAokCspMRCDG+Aq8gfn2vEB/KtpnE0BJtOG4oyZmU4GHmezZp5HnX
         cgGOwGpzx1cgYjOZmuaO052yR1dv1cH1dkp28RZpLxTPkQhHv8Xw88BleY/NP2LSrixz
         JZCN8gJ8efWW0l+dTVucmOyxblSMvLl7L1NxnCwr8qpz1LzO11IK1wNOqJUXZA8f+uXg
         9i9dUkuqu2ot89qEO+mPX0ynuPF0vYURih52ymrLFLmboK0baeuLBAeJUWgFnC7uQJiE
         C4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581181; x=1781185981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=peByEg9qkw/NuaYmCEAUEFnpiWasS3prWUS+hf7e7ys=;
        b=QeckwcGsPBUZTkh9S1HrkvseYfDU5hIWGjd81DqjHnilqQ6xk1RqKbCZC9tiqSYKoB
         6FVnCfAbE6IFhcosjqA99RsttNNcFP7vilqsUYNNMdukfMlDPSRcl4kcnZsdhSuqLKCy
         T2J3fPkzo++dQOoMGWaKll9OKEkmRbh/cdJJu8y48r/AF5w79TnSpmicv31Z1mK4JVFI
         CcGBydXys/C0+3yzeGrEThqYuu56pnbs+ZOEw+5rl7WnBYZuQVTqVUiudm6/XGQMzGc1
         GWW+xD3483X2MrCcmnHbT3MCiJqItitpY6SYaQNzJBWHlcuM86rIYsi8bqm+iLWb0k1c
         N+Ug==
X-Forwarded-Encrypted: i=1; AFNElJ+PtRWDClmnyd5eOjMCPs7uQAsW0Tign8BTaaIVKF8FSmtxUSph0McOQBVrGByX8aSfc/xrr0Ywg9jw@vger.kernel.org
X-Gm-Message-State: AOJu0YzqI19lQ+UzrymH9MBv2wiFBcD+ULGnUA4GyNP0wFd53DEKbVhB
	PIVsv53vovzDjajLye83w60EcDpfGRf4ZjDwyW4AFB5io61t2TGY9guc
X-Gm-Gg: Acq92OFKArf478xeC+2HWh90js7CkHirLUuZfErrKX+BtvXoGgJa73pifnpiKS+XCkz
	0ZdVHElMO/c15BMOtBdHd9wjaPoRSPsDf5AYjvFqN4jwuS/uEwc9h/sFVXetgXRaBezvoV1baxS
	YAF3OyWHy2RmtXHSxZg+Qs7uuYKbrQ8yPqTHVcdEtCYwATVMd2n2jKIDtbKr06P7hSv4IvWzsgO
	UqEHBfJLd8cZPAL54Hqpr1PomGJWZDEmVdrJuwNRehWJteipOrVwM0pN+BcsJYjel/zGKqidySU
	KpEYymlIfJCvq5z/dY801SY/j+VT+qUjeuzMISkNXGzJvsNjgMKwzJOgWOMy1etAbl+qY9xkh38
	/4lMMlja7OP2vpYa4+vxDQdjvYGyx3gNu+OVBmhxrZkdh+8jAm1XFXkrEmMTnyicfClOF7vpxOk
	gCTAMhWR79IZ8H4NQJ1KnmrWyFqdbqRpNktmKYqaxmkeNy3SX6JJZG/DHFto1mwBY=
X-Received: by 2002:a5d:44d2:0:b0:45e:9431:ee3c with SMTP id ffacd0b85a97d-46021792538mr9334388f8f.10.1780581181471;
        Thu, 04 Jun 2026 06:53:01 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:01 -0700 (PDT)
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
Subject: [RFC PATCH v3 5/9] accel: rocket: Keep the IOMMU domain attached across jobs
Date: Thu,  4 Jun 2026 13:52:51 +0000
Message-Id: <20260604135255.62682-6-midgy971@gmail.com>
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

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_core.c |  6 ++++++
 drivers/accel/rocket/rocket_core.h |  3 +++
 drivers/accel/rocket/rocket_job.c  | 27 +++++++++++++++++++++------
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index a8de876365873..634f78dfe2887 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -13,6 +13,7 @@
 #include <linux/reset.h>
 
 #include "rocket_core.h"
+#include "rocket_drv.h"
 #include "rocket_job.h"
 
 int rocket_core_init(struct rocket_core *core)
@@ -112,6 +113,11 @@ void rocket_core_fini(struct rocket_core *core)
 {
 	pm_runtime_dont_use_autosuspend(core->dev);
 	pm_runtime_disable(core->dev);
+	if (core->attached_domain) {
+		iommu_detach_group(NULL, core->iommu_group);
+		rocket_iommu_domain_put(core->attached_domain);
+		core->attached_domain = NULL;
+	}
 	iommu_group_put(core->iommu_group);
 	core->iommu_group = NULL;
 	rocket_job_fini(core);
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index 66d138a8ed773..05a197a9c0113 100644
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
index e25234261536b..b248371be8a1e 100644
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
@@ -376,8 +393,6 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 	 */
 	rocket_core_reset(core);
 
-	iommu_detach_group(NULL, core->iommu_group);
-
 	/* NPU has been reset, we can clear the reset pending bit. */
 	atomic_set(&core->reset.pending, 0);
 
-- 
2.39.5

