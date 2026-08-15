Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA62BD0B
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 00:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754920; cv=none; b=S4HyPsm5hIpvX6zrflvItEOYdTxj/K5ZHoxnQqjh5GD9D41fl7c1+2Bo0H/GI8CoI1ZQ3RA7IlR1/TatrUaZ/5I5Zh8LQ4HNvIfRxnG4RZ5TWGHyvaOQQdkr0JtK6v2ldJZN+IurF0eKUDDtKudMLJPUI0bBQrA3PchXeSAAd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754920; c=relaxed/simple;
	bh=1tIKif3P5fdyg5CZ8dhfBg/gndunLfBUaB/WNclV6oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OEmTQQy+5TGzWUObwI63F3LiQsoTZprCexHzDiOyiX/Bt2e9SppIHGxsOxzJLTN5h4VUxZcSpBhyfyy4NRbzh5UwA+E7pWfhuu1Qml2r8w5z/Pj8DIoe1r9+LK4XaAAZXFmJq7z5n9H9P7PQVXZI2aha0IMFtyJYUOE+P9TI3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcIA+0S4; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcIA+0S4"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b04c0b9159so1003169eaf.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 17:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786754917; x=1787359717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGeTM77wWZWsSK2KW0+uwZ5W8XboIGpTuNX+ISzK3/o=;
        b=VcIA+0S409nLOpbs+s3rsUeG/RKoilqxO0u7L8CL+hvZu4oTHVUkCvI/qnEQ2ufzIx
         GtuhUpVGbzRsQ4daaZcu0z+GlidHTX1OKnMH4uFSFJHwJFhFwvGgSyNC4fIbK1eyfwk6
         Unzn7Hv/Hx12NXp1Ii7gn2JdeRZvY/7oUq1Lbw/O+r2gWYbAuaUdrKUZhS5AYnFT49Uf
         0nVM/OV0u2WxXeh6HDuOGVb2JNKJ9+vfl+nQXnD1HOvRs81qC9h8Ko8de+GN3zGUtXkW
         W7ZFUyG5eQKWY+vz3EM3Ewx3A4CwS1clq1LNUTcY8vEbTzFVhrF5bQq/a7z9ybOMvP02
         hPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786754917; x=1787359717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGeTM77wWZWsSK2KW0+uwZ5W8XboIGpTuNX+ISzK3/o=;
        b=JhaOxi7SeUsBL06wlkRT7xBVAgiJh6j4PGCpNJmOkhgPAnz766rtpG8xwcq5/98crW
         jk22VqClrS4vo1p1gQbT0XygOe5btY5jnmdyPnqqTJJjh7OkXE/EIvhPlUZ/eXha43CS
         E9hlcrHGfBGrKta/dAAw/8UE005ynG6DOUbDPMPpYabQ4e35R0TVs+xuNs4KKV4BKxz/
         3KDqB2/MLGc9/NYXRuwbQ4HRCz8BE07Cc8XKAgMrgZcn2ryWDy7FDOBID58FHz8bY+6a
         F4ncOAwCnVHCmsa5RvowYXnhW+u3GZQPMiG/MzCCDvtefV1h3tGtbxxtpmHr2lKVnAfX
         6Trg==
X-Forwarded-Encrypted: i=1; AHgh+Rpw812iG2yl0FcYnseXqS//tC6Mp8C1U10QSSPk8OogJ6jd2uRasiuU+zJvZXNIRzXnDYRt8nUji/UQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxajMV2m0HoWLS85oY3wI5qh7TXYMbuKQ/necAxEZCWvnRtzXQy
	38CjZObg3FD5Lv/F5/GmmpMpq1YAsYulvxAz1pw76efEEgxvBU/JCuRZ
X-Gm-Gg: AR+sD11Qm5oaf2H/OMqaVx7FAmhg20XCH9GHFKh2LfvsSxF4vlM58y6Z0nC3cVIP7+d
	KBJ8YM0RLZ6Z5toNvUFsN/brAsCdg1xYBTHrfXy7Y0nZsMOU5zjD6M1WYgQpYSXdilGK7TMjS91
	70eq+5wI9/WBpHuKXbcmsHy8377GCCQgXLLje88OSd0+ANayqjE71O4HQEqmk524p1WkB3E+4Q2
	K/nMoDOK5ORoRgJEeTLFDfGgjrClHvE4Nn/TAuzDMwnyzIBcTiJBoPkvXUPaXJMEaLBx4uait04
	qayY+Bflcp7mE4Me5/4blmFCcwt38eTlj6TGXVKxW7a8e43ijDVQiAfLxSZUPD6xt6TZdRoNFVg
	arIL5X1GjBQLXOx4P3YWwVQeG66TAv4Zo3VN6DynMlEHdEYTr2uQ7D76KZAZFvDOV0keJL8uPph
	0PyJkrHFnwXftyYkKJxJf1lc+g1L7x5b81tExtA3diQWjEigsoFbZaNkE0kbUhjtzrcu6Lliu6Q
	z7bPPug40IG3VLPdp4I7eHX1QVTj1muyS2xyHBBAcbOne+ESXeWZ0z4/BiHsxiuFADWFvARj7tI
	p0rXQM1YHjKi2lbh474+4U6iLUBaLX5MCysl3tuH3aUQUYg67NM7e93wNgit8XBkohkXiBpoJcT
	qurf51LiqJHKLXNBm
X-Received: by 2002:a05:6820:905:b0:6a3:f597:7552 with SMTP id 006d021491bc7-6b0d7408188mr8771074eaf.35.1786754917253;
        Fri, 14 Aug 2026 17:48:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0d9574d7csm3240730eaf.2.2026.08.14.17.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 17:48:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 14 Aug 2026 18:46:15 -0600
Subject: [PATCH net-next 1/3] driver core: factor sync-state-only link
 cleanup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-submit-phy-package-fwdevlink-v1-v1-1-2319844f057a@gmail.com>
References: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
In-Reply-To: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 netdev@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

device_links_driver_bound() drops managed sync-state-only links after a
consumer successfully probes, then re-evaluates each affected supplier
for a sync_state() callback.

Frameworks which populate child devices below a driverless device need
to complete the same lifecycle step, but cannot rely on a successful
driver probe to trigger it.

Factor the existing cleanup into a lock-held helper and reuse it from
device_links_driver_bound(). Add a public locking wrapper so frameworks
which populate children below driverless devices can retire temporary
fw_devlink proxy links without affecting real dependency or runtime-PM
links.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/base/core.c    | 74 ++++++++++++++++++++++++++++++++++++++------------
 include/linux/device.h |  1 +
 2 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f..627fcfa274f0 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1305,6 +1305,57 @@ static void device_link_drop_managed(struct device_link *link)
 	kref_put(&link->kref, __device_link_del);
 }
 
+/* Caller must hold the device links write lock. */
+static void __device_links_drop_sync_state_only(struct device *dev,
+						struct list_head *sync_list)
+{
+	struct device_link *link, *ln;
+
+	list_for_each_entry_safe(link, ln, &dev->links.suppliers, c_node) {
+		struct device *supplier;
+
+		if (!device_link_test(link, DL_FLAG_MANAGED) ||
+		    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY))
+			continue;
+
+		/*
+		 * DL_FLAG_SYNC_STATE_ONLY excludes all other managed link flags,
+		 * so it is safe to drop the managed link completely.
+		 */
+		supplier = link->supplier;
+		device_link_drop_managed(link);
+
+		if (defer_sync_state_count)
+			__device_links_supplier_defer_sync(supplier);
+		else
+			__device_links_queue_sync_state(supplier, sync_list);
+	}
+}
+
+/**
+ * device_links_drop_sync_state_only - Drop managed sync-state-only links
+ * @dev: Consumer device whose proxy links should be dropped
+ *
+ * Frameworks which populate child devices below a driverless device can call
+ * this after adding all of the children. The children will have acquired their
+ * own links by then, so the temporary links which only prevent suppliers from
+ * receiving sync_state() callbacks are no longer needed.
+ *
+ * Re-evaluate each affected supplier for a sync_state() callback after its
+ * link is dropped.
+ */
+void device_links_drop_sync_state_only(struct device *dev)
+{
+	LIST_HEAD(sync_list);
+
+	device_links_write_lock();
+	__device_links_drop_sync_state_only(dev, &sync_list);
+	device_links_write_unlock();
+
+	device_links_flush_sync_list(&sync_list, NULL);
+}
+EXPORT_SYMBOL_GPL(device_links_drop_sync_state_only);
+
 static ssize_t waiting_for_supplier_show(struct device *dev,
 					 const struct device_attribute *attr,
 					 char *buf)
@@ -1418,6 +1469,8 @@ void device_links_driver_bound(struct device *dev)
 	else
 		__device_links_queue_sync_state(dev, &sync_list);
 
+	__device_links_drop_sync_state_only(dev, &sync_list);
+
 	list_for_each_entry_safe(link, ln, &dev->links.suppliers, c_node) {
 		struct device *supplier;
 
@@ -1425,17 +1478,10 @@ void device_links_driver_bound(struct device *dev)
 			continue;
 
 		supplier = link->supplier;
-		if (device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
-			/*
-			 * When DL_FLAG_SYNC_STATE_ONLY is set, it means no
-			 * other DL_MANAGED_LINK_FLAGS have been set. So, it's
-			 * save to drop the managed link completely.
-			 */
-			device_link_drop_managed(link);
-		} else if (dev_is_best_effort(dev) &&
-			   device_link_test(link, DL_FLAG_INFERRED) &&
-			   link->status != DL_STATE_CONSUMER_PROBE &&
-			   !dev_can_match(link->supplier)) {
+		if (dev_is_best_effort(dev) &&
+		    device_link_test(link, DL_FLAG_INFERRED) &&
+		    link->status != DL_STATE_CONSUMER_PROBE &&
+		    !dev_can_match(link->supplier)) {
 			/*
 			 * When dev_is_best_effort() is true, we ignore device
 			 * links to suppliers that don't have a driver.  If the
@@ -1449,12 +1495,6 @@ void device_links_driver_bound(struct device *dev)
 			WRITE_ONCE(link->status, DL_STATE_ACTIVE);
 		}
 
-		/*
-		 * This needs to be done even for the deleted
-		 * DL_FLAG_SYNC_STATE_ONLY device link in case it was the last
-		 * device link that was preventing the supplier from getting a
-		 * sync_state() call.
-		 */
 		if (defer_sync_state_count)
 			__device_links_supplier_defer_sync(supplier);
 		else
diff --git a/include/linux/device.h b/include/linux/device.h
index aee79fd6b32b..8afb9f2b0d82 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1381,6 +1381,7 @@ struct device_link *device_link_add(struct device *consumer,
 				    struct device *supplier, u32 flags);
 void device_link_del(struct device_link *link);
 void device_link_remove(void *consumer, struct device *supplier);
+void device_links_drop_sync_state_only(struct device *dev);
 void device_links_supplier_sync_state_pause(void);
 void device_links_supplier_sync_state_resume(void);
 void device_link_wait_removal(void);

-- 
2.53.0

