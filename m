Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3DC3C13EE
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785685598; cv=none; b=moy8e2tqi+NSH+JmLV/zCS7jhM/uFDBLjIF62YWFkNgueHsjBK9N8XtMiA7Db8hK9bw9czhub0SJLoGklwt3tK+Uj7u6cVVBjxbk2K0nQks7AfREyJ4oxjAKKWEkYASkXB3gMNtTPXwqorYxVy4Nih1483uLuDSLWSfxMHCPGms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785685598; c=relaxed/simple;
	bh=Mv2fB5QTMgzygfKi4oX9eQwPWNNkjLy2vCUnRHb4K0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCcUlBrtrz3o9nW7rggYyMOTncYXczYQRsgUDlJqz9q3tRPLAva5NpolZwkgTa3Ral0xHpEEKJ9TJneU6I99ql/5AGJH4RZJLB2USGbSjI/2KFmmbrcXXlt124T9cUJ46rbzMKnKw7JK998/zIljz3Dmv4C9o4Az/t3PC8PwxbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMFtgvkJ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMFtgvkJ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca12086c06eso2071644a12.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785685592; x=1786290392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXjf3n6y2o2sUp9ziyNWD3SU5x1Q1/QeHjG5pG2QUDY=;
        b=qMFtgvkJilu1Jb47IbDRWK0rgi8TfMB5dhX6YvSrkBWuPak0x9hqM1OXUoYHH4UsXq
         PWsKri8MRpuqN82Zifecsb4yB5xkRHZvS4dQLxWA9or7mtRec92uPOYU2IiAcf+K4lUR
         y7Cq8/W8dlzViTzq2o5GmjYvkg8GGbpF51J46oVLpfIOOgG1zZIQc9AhYs5lqzbIhZcd
         OIrEXtp4MMnfbl7fONSFA04QQ4epgrwWzD1FKLAtYkpCp6+zB6Tu8kLVQpJ8ESlBX5r1
         5T++mjmoN5NNJn6dPlyhAoEaHoHN1Wv/g+3vzJiI+Pn/vRlWDbRQMRtYJHlRCezLX3qk
         QwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785685592; x=1786290392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXjf3n6y2o2sUp9ziyNWD3SU5x1Q1/QeHjG5pG2QUDY=;
        b=ZDw2GQTEkPv5/yDg2WquMra2aUcq5XNzmsT/MFTl3dFJge6iB6ysl+XvXJAdN+uwRz
         Bv6utq6pGjjNfOOiZlpJWQekbP9wX7r6c3Cf3ngKZO1AzW24VJ/PfJAKaqRNnlw3hvvY
         HV9BQwx6vTiT9LggqpyimEApBg8tYV6iVD2/IvBMwKlu8i9zUgm/ywAS5tY55+U1j52u
         nRVNyXQTl0tE5tqcQTLOdlpJ2iquVJiDKZ4+nDBhyPVpZnq7cpGv2IfykHHKKnwy80XB
         7X3Lw3OfZ/j/LDbjvvTTGKssW70F78VVKHlI6iRFDW/gT+UuL3ZKvCe8UFBqh1C0Zixt
         8KDA==
X-Forwarded-Encrypted: i=1; AHgh+RqYQBh+JX7buJpyTcFCuT8vC8t24TQQ4QsNVkIDC6YSm0aW2Nvjy61PW9ju+qYqwleU0w6BlhNKjMrd@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ3h3ZqFxedCFp8OVfQieuu+v/+u8EdxfHuXwInUywjlpPCNK7
	lRxvnhpFaLGQFfIvuVT2HeGw7Y6aMdR51A4xNPjPp0EzWSTj4U+UsZBv
X-Gm-Gg: AR+sD13cYPBXjQJNFmXeOAeoJ0L7YVbCVAhGwxd74hTMJMhbMuQNVzdZHb/svzWf3dI
	n7ODzzIf09U0jl65VXKCy691d6CvjMDj676EUqo7NV6X6EFBQo30ne8JfxxZPRcBjSYaoSsbfVL
	1AnnivFg430W0dL2XfBhLITOxjjb+Gf2LX3KVHGIMUSllC+fK4GGe9r5mtD/UhYdQ6vlZ2GpLdW
	pq1HxCbK7LkXZOu0eE44CVHACzj4gkoOOe0VXRBrfuJ22OdfYy6Sp0SEThhZjqj7APMyxE3xAko
	uopd3X1Mm5T1ZnVd9mYD9WkbMHk+Xwe+A15ef2O9vcVFLRJeL+6rYhr92z5Wk/+AKGMmvdjBFz9
	yzd3BLLYmWDxAd0uANIZq2DrIjl4nfFuLMp5mEIRn3qiRcuvhsKJEcaVIiXNIlDHGuz2KcgNN3g
	cJ7W+hF1OghixcKMRVUpL8p7TqkHx8BTIRmRgtbuVOXprKra0FbrLAzCA0V+QAfSUPD1jkxdpDy
	OSJ/MNQqJTNIx0pLoEtFm/wW8dm+0OlLpWJsKA=
X-Received: by 2002:a05:6a21:7a95:b0:3c1:85d:fa2f with SMTP id adf61e73a8af0-3c92a89c7bbmr7671642637.36.1785685592428;
        Sun, 02 Aug 2026 08:46:32 -0700 (PDT)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e29a126sm30602192eec.31.2026.08.02.08.46.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 02 Aug 2026 08:46:31 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ahmad Byagowi <ahmadexp@gmail.com>
Subject: [RFC net-next 3/4] i2c: mux: Propagate software nodes to channel adapters
Date: Sun,  2 Aug 2026 08:46:19 -0700
Message-ID: <3e76f1dc25b104a2c8558142c12e23b297f9c58c.1785684064.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1785684064.git.ahmadexp@gmail.com>
References: <cover.1785684064.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device Tree channel nodes are associated with the adapters created by
i2c-mux, but equivalent software-node descriptions are not.

Find the software-node child whose reg value matches the channel and
assign it to the new adapter. Keep a reference for the adapter lifetime
so downstream clients can find the channel by firmware node.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/i2c/i2c-mux.c | 55 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 681a201c2..1e587ea4e 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -25,6 +25,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
@@ -264,6 +265,49 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
 	.unlock_bus =  i2c_parent_unlock_bus,
 };
 
+static struct fwnode_handle *
+i2c_mux_get_channel_swnode(struct i2c_mux_core *muxc, u32 chan_id)
+{
+	struct fwnode_handle *dev_node = dev_fwnode(muxc->dev);
+	struct fwnode_handle *mux_node, *child = NULL;
+	u32 reg;
+
+	if (!is_software_node(dev_node))
+		return NULL;
+
+	if (muxc->arbitrator)
+		mux_node = fwnode_get_named_child_node(dev_node, "i2c-arb");
+	else if (muxc->gate)
+		mux_node = fwnode_get_named_child_node(dev_node, "i2c-gate");
+	else
+		mux_node = fwnode_get_named_child_node(dev_node, "i2c-mux");
+
+	if (mux_node) {
+		/* A "reg" property indicates an old-style firmware entry. */
+		if (!fwnode_property_read_u32(mux_node, "reg", &reg)) {
+			fwnode_handle_put(mux_node);
+			mux_node = NULL;
+		}
+	}
+
+	if (!mux_node)
+		mux_node = fwnode_handle_get(dev_node);
+	else if (muxc->arbitrator || muxc->gate)
+		child = fwnode_handle_get(mux_node);
+
+	if (!child) {
+		fwnode_for_each_child_node(mux_node, child) {
+			if (fwnode_property_read_u32(child, "reg", &reg))
+				continue;
+			if (chan_id == reg)
+				break;
+		}
+	}
+
+	fwnode_handle_put(mux_node);
+	return child;
+}
+
 int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			u32 force_nr, u32 chan_id)
 {
@@ -364,6 +408,12 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 
 		priv->adap.dev.of_node = child;
 		of_node_put(mux_node);
+	} else {
+		struct fwnode_handle *fwnode;
+
+		fwnode = i2c_mux_get_channel_swnode(muxc, chan_id);
+		if (fwnode)
+			device_set_node(&priv->adap.dev, fwnode);
 	}
 
 	/*
@@ -408,6 +458,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	return 0;
 
 err_free_priv:
+	if (is_software_node(dev_fwnode(&priv->adap.dev)))
+		fwnode_handle_put(dev_fwnode(&priv->adap.dev));
 	kfree(priv);
 	return ret;
 }
@@ -420,6 +472,7 @@ void i2c_mux_del_adapters(struct i2c_mux_core *muxc)
 	while (muxc->num_adapters) {
 		struct i2c_adapter *adap = muxc->adapter[--muxc->num_adapters];
 		struct i2c_mux_priv *priv = adap->algo_data;
+		struct fwnode_handle *fwnode = dev_fwnode(&adap->dev);
 		struct device_node *np = adap->dev.of_node;
 
 		muxc->adapter[muxc->num_adapters] = NULL;
@@ -430,6 +483,8 @@ void i2c_mux_del_adapters(struct i2c_mux_core *muxc)
 
 		sysfs_remove_link(&priv->adap.dev.kobj, "mux_device");
 		i2c_del_adapter(adap);
+		if (is_software_node(fwnode))
+			fwnode_handle_put(fwnode);
 		of_node_put(np);
 		kfree(priv);
 	}
-- 
2.50.1 (Apple Git-155)

