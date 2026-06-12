Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C38379C4A;
	Fri, 12 Jun 2026 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781263113; cv=none; b=r5CLO/YhGkP6Rt1G2VuiUE8u++amcBHxQW0pSH/v1QIh1v4eq71nLNIU/jpuzBxpKYC8IHETr4ywoaoLHQ+4/8qGQ9UPfLgAwJL243Xx3UHqbAys+q7jv24QgS+xTUc/rWWgwND7LU1EiwFWhSm8HXa1tSJOTyQ3U36oJ4rEx4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781263113; c=relaxed/simple;
	bh=u2yuBrojzB0FrgvPDxZ+M4NRuH9femcUDb6hIRGWSTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bnvefbGYeZ7S3Y1D1Uyb03N3QbyiEuOSQ0V6qisM7w54gINkwOY2C2LZAfHWlHyu0ClAu7Qky+aIJcXmh1VZGjZZbrZWX45Wo/pUibG6xrls83ruar8nOg18IJmIrRWs5av7Km45ANjLHzTd6B6UutnrmTLrowBZ6+ADHuVeWV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 744721A06FD;
	Fri, 12 Jun 2026 13:18:24 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3E1311A06ED;
	Fri, 12 Jun 2026 13:18:24 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E2860180004C;
	Fri, 12 Jun 2026 19:18:22 +0800 (+08)
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
Subject: [PATCH v11 1/9] i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked
Date: Fri, 12 Jun 2026 16:48:08 +0530
Message-Id: <20260612111816.3688240-2-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Rename i3c_master_reattach_i3c_dev() to *_locked() to make the locking
requirement explicit and consistent with other I3C core helpers that
require the bus lock to be held by the caller.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes in v11:
 - No change, added Reviewed-By tag

Changes in v10:
 - Rename i3c_master_reattach_i3c_dev() to *_locked to reflect required
   bus locking
---
---
 drivers/i3c/master.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5cd4e5da2233..e89d73508b9a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1652,8 +1652,8 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
-				       u8 old_dyn_addr)
+static int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
+					      u8 old_dyn_addr)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
 	int ret;
@@ -1742,7 +1742,7 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
 		goto err_detach_dev;
 
 	i3cdev->info.dyn_addr = i3cdev->boardinfo->init_dyn_addr;
-	ret = i3c_master_reattach_i3c_dev(i3cdev, 0);
+	ret = i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
 	if (ret)
 		goto err_rstdaa;
 
@@ -2358,7 +2358,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 		if (!ret) {
 			old_dyn_addr = newdev->info.dyn_addr;
 			newdev->info.dyn_addr = expected_dyn_addr;
-			i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
+			i3c_master_reattach_i3c_dev_locked(newdev, old_dyn_addr);
 		} else {
 			dev_err(&master->dev,
 				"Failed to assign reserved/old address to device %d%llx",
-- 
2.25.1

