Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA96043E9DC;
	Tue, 14 Jul 2026 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021215; cv=none; b=cK6UO7+jj/RoFLlYI1plY8oXnKYgK4cIf6JsyE9ET7ESJ80wLYkBxVPVvkjC9K223F7Rfw7Y6kAV09posdUmTeb9PSxwEG6uyLsRbjVkmr4+1rA8YtGZHubqy2Yvxs+QinoCDp0LepKdMZBQLUK5tk5NQtC4aRVFE/sOWcIlPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021215; c=relaxed/simple;
	bh=e+PnxNrFcZ9v99XHoxtUNVZ+jjac/BrVBw5roYfXrSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pzPlYW0PUqk6WC0bjZG0ZCHmfs9UUNZLWzz0LReOV9A4CI/brmLB4t3dB7f6aCvD3A8d+wobHmGnaVwWYCxHlBsMHO5dV2dYkTvtFoGU7PWS0Jj9tq5m7Gp+KkZaRsCyLoGKyav9vItCFxZ7PGV5+EZUBvK3v5i0IIqPm2CEqSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 92A25200053;
	Tue, 14 Jul 2026 11:21:01 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5ADE320004C;
	Tue, 14 Jul 2026 11:21:01 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 05BDE18000B5;
	Tue, 14 Jul 2026 17:20:59 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v14 2/8] i3c: master: Fix IBI request and free cleanup paths
Date: Tue, 14 Jul 2026 14:50:47 +0530
Message-Id: <20260714092053.2461482-3-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

i3c_dev_request_ibi_locked() allocates the generic IBI object and its
workqueue before calling the controller request_ibi() callback. If the
callback fails, destroy the workqueue before freeing the IBI object.

Also, a controller callback may clear dev->ibi while forwarding the request
or free operation to another controller. Avoid touching dev->ibi after the
callback if it has already been cleared.

This prevents a workqueue leak in the request failure path and avoids NULL
pointer dereference in the free path when the callback has already released
the IBI object.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

---
Changes in v14:
 - Destroy the allocated IBI workqueue when request_ibi() callback fails
 - Avoid touching dev->ibi after request/free callbacks if a forwarding
   controller callback has already cleared it
---
---
 drivers/i3c/master.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2cb94face156..01c6e048485c 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3499,8 +3499,18 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 
 	dev->ibi = ibi;
 	ret = master->ops->request_ibi(dev, req);
-	if (ret) {
-		kfree(ibi);
+
+	/*
+	 * The controller callback may have already released and cleared dev->ibi
+	 * when the request is forwarded by a virtual controller. Only clean up the
+	 * IBI object if the callback left dev->ibi valid.
+	 */
+	if (ret && dev->ibi) {
+		/* Avoid leaking the workqueue allocated for this IBI request. */
+		if (dev->ibi->wq)
+			destroy_workqueue(dev->ibi->wq);
+
+		kfree(dev->ibi);
 		dev->ibi = NULL;
 	}
 
@@ -3540,6 +3550,13 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 
 	master->ops->free_ibi(dev);
 
+	/*
+	 * The controller callback may have already released dev->ibi, for example
+	 * when the request was forwarded by a virtual controller.
+	 */
+	if (!dev->ibi)
+		return;
+
 	if (dev->ibi->wq) {
 		destroy_workqueue(dev->ibi->wq);
 		dev->ibi->wq = NULL;
-- 
2.25.1

