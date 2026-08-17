Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BD33403FF
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 00:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924841; cv=none; b=TwJ+rrdpONiz4LL7psoqCIgplNx/AuogOzlUOxI2x+Q9smPpkwEAwV/qRSwEkifLC83Z3B+8TJCdEMF0p5e3xiVweSTpogRnhAZBMaWqS63cVQyDCQZ4oIZHc9DD4kdcQ6y/Gz5XOHO7kKjt5j1pQmS7/El99NwnnJ1Prl625U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924841; c=relaxed/simple;
	bh=1tIKif3P5fdyg5CZ8dhfBg/gndunLfBUaB/WNclV6oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEk/7erAbGEdta5AtnANJsm6pB99nPPlHaKjaMqEzfQkHp+qN8OeQvLOibLJj8u8xZgI+wQKa7U5SUZ3/hxu9rmgeVwQLjuV9uORKdD4kQbjhNGBZyH3MvLb2aqosjEyqU8X1zG6Ti8C01k6rCROMVn01k6VdaTTLX+2yDQVKi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Juz345jT; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Juz345jT"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a4c6081f9fso689873b6e.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 17:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786924838; x=1787529638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGeTM77wWZWsSK2KW0+uwZ5W8XboIGpTuNX+ISzK3/o=;
        b=Juz345jTYB470+UrWrxqVLX3vzpcnRItbWwR6jWddQJ0kT9ljaKKQ4Lo9wF5gjCAbr
         C4HFlHhs/jkdiaXdtf3GXbqU22nbHW2BxgnESx2Rd0VbUlA68o7e3+51jI7yWxIy1wgW
         /eo8bDUUz6BFfyxHoEgf2WFUGBwl3R7I/u6atP1sDCb+PLM4btaIxpcPR7cvENKtaDJV
         24C/MOyMtMbZKcmPZI4TlnCFIWMoJo+fXkKuDRzguWVpnhgG0YeUvuEpEKmZCuxh+Ips
         XRoRGrcgE1TNHynr/YW8oQrR0cHdAJVukH+/44Zdpd9w8RJk7fmkTfZGrgsHiwGEc2S3
         KePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786924838; x=1787529638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGeTM77wWZWsSK2KW0+uwZ5W8XboIGpTuNX+ISzK3/o=;
        b=iKLsIM/C+ZmqSed3+PElIxgcrTG60jl/Dc2JJaFJ83FW9pd1eyIEPKh3H5TKJp1Q7q
         uK5QwGJJUUJge3gq03NMVWb4zubMcXGBlVrAdKcaBt9ixteMu90FJ7Tk5GBdu17gwo/P
         0lXf9Xuq8Wwl/YoGDXVk92Flbfxp/ow/3pEfWil6o3VUnvWJRDscsAOzfNaQlt4IT/ay
         dDIAHdOxBQ8v6PPygAtjIcb1I8Nf0AtgUoPELWZxKmJlXfe22dJkL5H4GrldmqgMLn94
         LKHJS9+qFZ0rvm7qLJDuMpShWQE78QzdpqlEazFfwW7SETcp3K7ESVKpEEzRAMfhXi4y
         YDcA==
X-Gm-Message-State: AOJu0YyulHL1kJTVMhhXfmLkPyrGQ5Z64kRsWu+732Ej+rsad2IMdTQL
	LFLuXWhQOTpvRzqcZXWsTFuZ3W5EuMlmHOmFZ6K3nTWhVo5tLz69HZaN
X-Gm-Gg: AR+sD10e54hm8O+pBXhq0uaMaUxmZvd7wMTM4aDBJ4owp77kgSm73eY4dNQJh+FW7ei
	UO5rm181COpm/0E+uCt80wzeaP8lWQfgVyDavieyd957vJMgmw0XEqNCzJyw8s79kVpMnI+/sUI
	hg6WptpcH8q/pCtVYSrkf2LBuHjT/jYYmV7Wwx+y95SAro6skc7MXNAayNT/w4Y7f50ebosc9uy
	dkP3AZD317CNdsN/c392DnJickIfk75Uh9d1oWG8fBiGb74zjGkyZWgd3TcXcws62EbnA41h4uK
	tmCDe91R5ABAbouDv1QelzVdFS3ysj37NCrKgcGnw2A+HoYZQ3gEWnMGc5FtO4wcLqivcDEG0oi
	uoBQZu0iFqKUBb+AaqQ1nvYH43BdS2prS5oZ8nn6Zz6KaTMFYQlPP4cBpuVwqZgFX2CruQs6YUh
	caKOxatKEARvLjqvMl5K2rftGjG86O0Vz2lsluMwZy+fE8Uc798k0k/fkSKNMtYFrgWxn0RKFQW
	j2JHQywH2rLhmJDXSAsxmrAPB132rgu/bw/ltLzfNkRTfDXn3hmXK/R57OXiSrgZk+f731ARJ4X
	c7z/SILEm0ih+yV/2sBqGSmc4V8eg9Sk5aentn0DjDkErLUswVjkyWN1HXrrMzVKIH7yEu5hTMH
	Frjxugmce/pzanC5l
X-Received: by 2002:a05:6808:238d:b0:4b1:b037:da8b with SMTP id 5614622812f47-4b241b9d07fmr18056158b6e.11.1786924837907;
        Sun, 16 Aug 2026 17:00:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2714dc18asm2556802b6e.17.2026.08.16.17.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:00:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2026 18:00:29 -0600
Subject: [PATCH net-next v2 2/4] driver core: factor sync-state-only link
 cleanup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-submit-phy-package-fwdevlink-v1-v2-2-23e55dd59fad@gmail.com>
References: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
In-Reply-To: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, netdev@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
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

