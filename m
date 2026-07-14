Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C5C33DED1
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007303; cv=none; b=r7QY7GGfFT2pdPuX0wEQRWENAbh8hnXmQH8nMVnBJGE7+DdPndFfJ+xbDGGFybjH4jmENplGO8HYMZd54i47jefVZNBwrn8FO5ab3J83lGGKtHeGsf3CBoaqKXepJNNi+HaxGHxt+YvIF98+w7+L3THRUT9GzHhJrMKPw3rqegI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007303; c=relaxed/simple;
	bh=o7ILli8856vsZPe8jN2xevd4Pp9Qm+S5O2msJvUkIqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pt0VdjDnOMIV8qw3ygqziOadXIRs8GKvBzd7j03o+SdLLY6wuiGiL7yJimS+n12qSb1pGTWgNkukDhalGouc6HCMDKIEGwVapVI4BbInvLWHWEplfvbmo2oGEhpHrNfgU5GaMq7Av44gfDGWLBHvjKlPARPXH0oxYrp4Rl5ZKwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QC+zXmls; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QC+zXmls"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cad4170e8eso45546725ad.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784007302; x=1784612102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGDV5fSUPAH2Dhpl1lbzAcq8czvypnTHYvjt3Vuz+wI=;
        b=QC+zXmlsih4OWAc2PoSjrZ0nwe0w0rmUhTQw42kvJZKAhmGNeXYX/JpS8yXes77u5F
         1qcuNxG2nId/h4CuViCb9tr5owlgjYy/Gg1ntdUb09lz59ir0qJtQCizy1NGbi27DPKy
         501NL201g260rxIglyA4LlprUyL2dSdy/ndfeebmOu29fE++kLLgsTupd76W6ViVLfMC
         rt+J7h03f9vEgYc8pOCqnIJd8JUQZi4mxUk6pxaQ8kt6ONS7qFUf1ayEuXJ9VUp8d5pN
         j1zSFX0kM8/mpn29FiOHoNmkmMonHVjFvgcxekW6gb1D1CBd/0DIo3t/ck3bJNBvtkBX
         z7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007302; x=1784612102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGDV5fSUPAH2Dhpl1lbzAcq8czvypnTHYvjt3Vuz+wI=;
        b=fkUp2QgFqEqDy1cFJHlGzILqOdq+hrvDdH+hMKqSTmHJfU2mqfhLNJvToyEkm09BEn
         /kU/pPpj7sRj/njrIP3juW3pmbMFtpsHXStQSFdwA+6Xyjgw37gh/6HfX9OoAOit+fs4
         MM7VlwowgIxxjvyst1UYezaDHSxBQJ8EJLceGZ5kRgLgE5w3OVYxHDxwk1ESmHY4RKnk
         LGmti6mDrIrigyhw7a6Lg7aKzXOGujDFBHfyaxr7KFaeB3nPcguFmHI/55ZV3UW6w3gH
         DG1cjYp4FazxErSib0u6rmkQVQrYx+pC53sSdk/hw6s+Yl2BpPR/4UZm154ObkrQswfr
         mKsg==
X-Forwarded-Encrypted: i=1; AHgh+RrPsfxAMuhsPjpHXDFsPbni3/QxY36otWeJSe4jDbHiyyAVXotNV9KbC3lG4TVqPFG++RHCeR71Zto5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6eQFP8/RLEd/yMfejwKuMdFG1cEqwKqSnDIcRvNDgRnkxWZ78
	PedjIoqsynAzQK2NF7oIeMei2bwcZTcMp1lcxaICgIqO6exOMjeS6v3cbP+wfvOz
X-Gm-Gg: AfdE7cleMBMGyh5THNywG+KuQcmHlzVqvV4ebPdeJQ0gNUg9nq316AOvvli3RtpEXKt
	OyBE7z32lFUIt5/xm3iHPqxoXfRZliVWEQxF8H4q1GRQCfO9qDooNbWi76Zhy2LhyVrJ5MroA4O
	AMZAZ2C/ohq3F1RJ8hLnF9jirVlVBmzWFTpaFTBnQbZiZFlrvPKPk4xZnNCekxWHa44vCwhl/FE
	GzvCKS+HfZsmTz1kYGC4aMxLj5rNgqVMAESIS2PKt4h0Xzy8et8JWNuKY7q9zQbQ7qv9HXNJ5ti
	y2vGN4bU4Y5/0xesrcGpl5dY6G1XcnpRHIWLrdo8gqOd5L9tb2ZRDOcTNaTSkOgNgGF0QYX6QNK
	mKr3LohEFhLKafvGLlo8vOgjHGRmm99nv0/2vL0ScgbJ3JgVMPdAk9MTRe0/LrDTrxYnM+GFwgd
	11lKPEFQi/P9ugwsIFv/DB
X-Received: by 2002:a05:6a20:7284:b0:3c0:9c18:d5ab with SMTP id adf61e73a8af0-3c3572a51f1mr1055366637.72.1784007301547;
        Mon, 13 Jul 2026 22:35:01 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm131882715c88.14.2026.07.13.22.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:35:01 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	syzbot+6c25f4750230faf70be9@syzkaller.appspotmail.com
Subject: [PATCH v3 1/3] netdevsim: fix use-after-free of ethtool debugfs data
Date: Tue, 14 Jul 2026 11:04:39 +0530
Message-ID: <20260714053442.265587-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714053442.265587-1-hrushirajg23@gmail.com>
References: <20260714053442.265587-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs files created by nsim_ethtool_init() store raw pointers
directly into the netdevsim struct, which lives in the net_device
private data kmalloc slab.

If the ethtool subdirectory outlives the netdevsim struct, a concurrent
reader can trigger a slab-use-after-free by passing debugfs_file_get()
(which only checks dentry lifetime) and then dereferencing the freed
data pointer in e.g. debugfs_u32_get().

In __nsim_dev_port_del(), nsim_destroy() is called before
nsim_dev_port_debugfs_exit(). nsim_destroy() ends with free_netdev(),
while nsim_dev_port_debugfs_exit() removes the port's debugfs directory
afterwards. This means the slab is freed before the ethtool debugfs
files that point into it are removed.

The same window exists on nsim_create()'s error path: nsim_ethtool_init()
creates debugfs files under ddir with pointers into ns before
nsim_init_netdevsim()/nsim_init_netdevsim_vf(), which can fail. The
err_free_netdev label then calls free_netdev() while those ethtool
debugfs entries are still live.

All other features that create per-port debugfs files (pp_hold,
queue_reset, vlan) already remove their own entries explicitly in
nsim_destroy() before free_netdev(). ethtool is the only one that does
not. Fix this by saving the ethtool dentry in struct nsim_ethtool and
calling debugfs_remove_recursive() on it before free_netdev() in both
nsim_destroy() and the nsim_create() error path. The port ddir teardown
is left to nsim_dev_port_debugfs_exit() as before.

Reported-by: syzbot+6c25f4750230faf70be9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6c25f4750230faf70be9
Fixes: e05b2d141fef ("netdevsim: move netdev creation/destruction to dev probe")
Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
v3:
- Instead of removing the entire port ddir before free_netdev(), save
  and remove only the ethtool dentry. All other features (pp_hold,
  queue_reset, vlan) already clean up after themselves; ethtool is the
  only exception. This aligns ethtool with how the other features
  behave, as suggested by Jakub Kicinski.
v2:
- Also fix the same use-after-free window on the error path of
  nsim_create() as suggested by Simon Horman.
- Shorten the code comment in nsim_destroy() to be more concise.
---
 drivers/net/netdevsim/ethtool.c   | 1 +
 drivers/net/netdevsim/netdev.c    | 9 +++++++++
 drivers/net/netdevsim/netdevsim.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/netdevsim/ethtool.c b/drivers/net/netdevsim/ethtool.c
index 9350ba48eb81..a465f3220a7c 100644
--- a/drivers/net/netdevsim/ethtool.c
+++ b/drivers/net/netdevsim/ethtool.c
@@ -252,6 +252,7 @@ void nsim_ethtool_init(struct netdevsim *ns)
 	ns->ethtool.channels = ns->nsim_bus_dev->num_queues;
 
 	ethtool = debugfs_create_dir("ethtool", ns->nsim_dev_port->ddir);
+	ns->ethtool.ddir = ethtool;
 
 	debugfs_create_u32("get_err", 0600, ethtool, &ns->ethtool.get_err);
 	debugfs_create_u32("set_err", 0600, ethtool, &ns->ethtool.set_err);
diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index 27e5f109f933..09d86a591fac 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -1165,6 +1165,7 @@ struct netdevsim *nsim_create(struct nsim_dev *nsim_dev,
 	return ns;
 
 err_free_netdev:
+	debugfs_remove_recursive(ns->ethtool.ddir);
 	free_netdev(dev);
 	return ERR_PTR(err);
 }
@@ -1214,6 +1215,14 @@ void nsim_destroy(struct netdevsim *ns)
 		ns->page = NULL;
 	}
 
+	/*
+	 * Remove the ethtool debugfs directory before free_netdev() releases
+	 * the netdevsim struct to prevent use-after-free in concurrent readers.
+	 * Other per-port debugfs files are already removed above, and the port
+	 * ddir itself is cleaned up by nsim_dev_port_debugfs_exit().
+	 */
+	debugfs_remove_recursive(ns->ethtool.ddir);
+
 	free_netdev(dev);
 }
 
diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/netdevsim.h
index 4c9cc96dcec3..c08a01af31e9 100644
--- a/drivers/net/netdevsim/netdevsim.h
+++ b/drivers/net/netdevsim/netdevsim.h
@@ -95,6 +95,7 @@ struct nsim_ethtool {
 	struct ethtool_coalesce coalesce;
 	struct ethtool_ringparam ring;
 	struct ethtool_fecparam fec;
+	struct dentry *ddir;
 };
 
 struct nsim_rq {
-- 
2.47.3

