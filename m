Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FF93A453B
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307348; cv=none; b=WYYXDcdlzqQ6NI7j4L1z4m+bcg+PGSbqjQ46OuLnEuYfibayETt0guA0D1YDpr719H3odvLbKQgwpNqDpS2PrNRptA1pWX7gh5+dg595UhPoioVcgSI2nC2px/R7EbJXb5CgBwHuLkuUYRkhV390FUY1NvgPF+zVxz9qK7fO6VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307348; c=relaxed/simple;
	bh=IzRlEU23yfQQ6x4BYmQXGZqejxD9TteX1wiEO5R8YME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8Oq7eVUvakzXJMkcyZCNo34Tsz4gAyNrELGyGKWcIvbFpkxeXZh+1gLZ1BL9SvjcBGb+MpUyt2ciq8As5XPr10xxDYmofkN/aRIWv8Jy6xvpHo6s21BZIeR6kdD9qai3bAXV3Lk1219d0CNR1we+aiPAiiVWq8Cf1Mos1G7+Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7SfrSMK; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7SfrSMK"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-459281bc13bso661439fac.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307343; x=1786912143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyzPxN0hN+8W2JU9IAdx12pcVnDBJDk0tQrb35djIKE=;
        b=g7SfrSMKNLekcPmr078XrJ2wA+XQzpsrlAONOUPHs7tSKxgc1g7tbb3NtAZcSGCEqS
         yX4XOzQargS1FWzGzOpoZ3WV3JoQUFaOeri23j/moRyReuKZHuIcNtDwJVaCzzvpDB6x
         sao/HJfzy9ANUTBza3rbHxa/1fs8Z1McWVfHsA41YZcx2Rs8EiAX6eXbFo/hPJMG96uq
         RcXJd1IASpJKzXBvaUPcNerDByVs3jUyoUON523YQP1WSyGODjl/PdNfXtYL+ZeiXp0Y
         cK/yqzbmKpiFGcOMcBxvwil0jC33ed7+J6UJkTzmhBDXl1O6oK4HSL8PGMpRZxCZbSTn
         xhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307343; x=1786912143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyzPxN0hN+8W2JU9IAdx12pcVnDBJDk0tQrb35djIKE=;
        b=BZBejU55SVm0iHWOjNu3Bv+JDXrKaBoytuuDEdn93zRX8YyHE6Rnb//2kTzY8SLD7M
         1kD/PSthP2+UbWtxrukUkVJvk8P2JtzrO9ibQzdkU75+QDNR8jESF8lHZxZoh+u8PrKz
         r3KgRGtbJwEv0oJNe+t0u4si52IqnOcNoTKA77QrzJHX82pQIYJpSkbcy8Q7mZ7xw1KC
         SV5vwyU13rb1mzvSprMrvg3fE6LndBRae4IaBhNKBK8qht3AN2iNpCPCS98+wTUSq2fl
         qr9OBA6aEJ4UOWSwrhiaMhby77GLe5tc4Mr8nLrVJmyIZYwqyQQOpfz+Pz9IPctNyckR
         +uMg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2h03dus6I2YQHv1VtUBZLPV6Bj3rtNQbZVfXCHGeXh/JMwwYdSKBth5V/pTKxcw1ZeKWKme6h6IDf@vger.kernel.org
X-Gm-Message-State: AOJu0YwYgjhibIqRMUJYlqsWriVXhgZ2FoknPGaMH4yy0LSXNe9FFJvz
	TnOYNm8KeUmAfvPylj5oEPHlDkIfVs0cJqjGsygWG6Pv77Tgljh+0Lhj
X-Gm-Gg: AR+sD13wzIMEpdf4wkXjrVNvJrvkvGW5gJ59Sy9iGeKs0Fb1sgiBDW4tbqgZifLpEGe
	jhqcC9THJR7raAMs4bV7BfRFpUEVSQoHTs7/K/9m/uLwr4g4wjZ2EzV3C6eFV8EY81cCeZUscJP
	9MLAXlgbdF/P5Q/WOZrObuv46hha24BWSTSi86TQZVHFJPHiw5eBuD4d7ZZkQf8ZbkZW8Il9Fpg
	20lRcfGJjAnjXu2T2ypuh4Jvl5oKlWXhSg4dTwaH2V+12fzfxbfxNKy5Lkq6gKJcK1iKYenKFeL
	ftpvf/jWFY8DgpIbM1LqoIHkX2fDXXDwQeXdKnBvcliYEbdjbShZkjW6AW8zkJOMUtuVSHtyf29
	xOBMbYOEJJgqvS7N3pDjcvY/9InCAmVgJ4isLnWHl5mWtjm6yGQW7oJ7A08eEFbGMFqIAZta24H
	RvERKEN2+hD4vGkIrDQElqqD8ZHNIB8h5axVze30lFrTO0842ZeDau8hisdXawgjX+dbVkJ6de4
	6wd+gk+jduFB2E8R+t004k2sN3WBGu/EGA9wrC/DWBbFPB4uvPiMZcSMrzI9fDPsLV8kDJuw1VJ
	vbkCPZ7/lHgJ47bDXvNkXN/ItkbiFYWKVFsqu100i5/KpuGAM3AajYkVF/84DcZU96ewj2VLBZf
	B5PdWStGFJ1zL9S96
X-Received: by 2002:a05:6870:2482:b0:451:ecac:2c13 with SMTP id 586e51a60fabf-459e2a47b11mr13178902fac.8.1786307343529;
        Sun, 09 Aug 2026 13:29:03 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f19fd31csm6975362fac.1.2026.08.09.13.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:29:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 09 Aug 2026 14:28:32 -0600
Subject: [PATCH net-next v5 2/5] mfd: syscon: Add managed registration for
 external regmaps
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-submit-acx00-of-dynamic-v1-v5-2-bfa1f8518b28@gmail.com>
References: <20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com>
In-Reply-To: <20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2

of_syscon_register_regmap() publishes an externally owned regmap in the
global syscon list, but provides no way for a removable driver to
withdraw it. Registering a devm-managed regmap from such a driver would
therefore leave a stale pointer after unbind.

Factor external registration through an internal helper and add
devm_of_syscon_register_regmap(). The managed action removes the entry
under the syscon list lock before later devres actions release the
regmap. Hold a device-node reference for the lifetime of every
externally registered entry so its lookup key also remains valid.

Consumers of a removable provider remain responsible for ordering
teardown, for example with a managed device link.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mfd/syscon.c       | 87 ++++++++++++++++++++++++++++++++++------------
 include/linux/mfd/syscon.h | 12 +++++++
 2 files changed, 77 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 21a7fcdd2737..448422fe4f21 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -10,6 +10,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hwspinlock.h>
 #include <linux/list.h>
@@ -193,53 +194,95 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
 	return syscon->regmap;
 }
 
-/**
- * of_syscon_register_regmap() - Register regmap for specified device node
- * @np: Device tree node
- * @regmap: Pointer to regmap object
- *
- * Register an externally created regmap object with syscon for the specified
- * device tree node. This regmap will then be returned to client drivers using
- * the syscon_regmap_lookup_by_phandle() API.
- *
- * Return: 0 on success, negative error code on failure.
- */
-int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
+static struct syscon *
+of_syscon_register_regmap_internal(struct device_node *np,
+				   struct regmap *regmap)
 {
 	struct syscon *entry, *syscon = NULL;
-	int ret;
 
 	if (!np || !regmap)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	syscon = kzalloc_obj(*syscon);
 	if (!syscon)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	/* check if syscon entry already exists */
 	mutex_lock(&syscon_list_lock);
 
 	list_for_each_entry(entry, &syscon_list, list)
 		if (entry->np == np) {
-			ret = -EEXIST;
-			goto err_unlock;
+			mutex_unlock(&syscon_list_lock);
+			kfree(syscon);
+			return ERR_PTR(-EEXIST);
 		}
 
 	syscon->regmap = regmap;
-	syscon->np = np;
+	syscon->np = of_node_get(np);
 
 	/* register the regmap in syscon list */
 	list_add_tail(&syscon->list, &syscon_list);
 	mutex_unlock(&syscon_list_lock);
 
-	return 0;
+	return syscon;
+}
+
+/**
+ * of_syscon_register_regmap() - Register regmap for specified device node
+ * @np: Device tree node
+ * @regmap: Pointer to regmap object
+ *
+ * Register an externally created regmap object with syscon for the specified
+ * device tree node. This regmap will then be returned to client drivers using
+ * the syscon_regmap_lookup_by_phandle() API.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
+{
+	return PTR_ERR_OR_ZERO(of_syscon_register_regmap_internal(np, regmap));
+}
+EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
+
+static void devm_of_syscon_register_regmap_release(void *data)
+{
+	struct syscon *syscon = data;
 
-err_unlock:
+	mutex_lock(&syscon_list_lock);
+	list_del(&syscon->list);
 	mutex_unlock(&syscon_list_lock);
+
+	of_node_put(syscon->np);
 	kfree(syscon);
-	return ret;
 }
-EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
+
+/**
+ * devm_of_syscon_register_regmap() - Register a managed external syscon regmap
+ * @dev: Device that owns the regmap
+ * @np: Device tree node associated with the regmap
+ * @regmap: Pointer to the externally created regmap
+ *
+ * Register an externally created regmap object with syscon and remove it when
+ * @dev is unbound. Consumers must stop using the regmap before the provider is
+ * unbound, for example by establishing a managed device link to @dev.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int devm_of_syscon_register_regmap(struct device *dev,
+				   struct device_node *np,
+				   struct regmap *regmap)
+{
+	struct syscon *syscon;
+
+	syscon = of_syscon_register_regmap_internal(np, regmap);
+	if (IS_ERR(syscon))
+		return PTR_ERR(syscon);
+
+	return devm_add_action_or_reset(dev,
+					devm_of_syscon_register_regmap_release,
+					syscon);
+}
+EXPORT_SYMBOL_GPL(devm_of_syscon_register_regmap);
 
 /**
  * device_node_to_regmap() - Get or create a regmap for specified device node
diff --git a/include/linux/mfd/syscon.h b/include/linux/mfd/syscon.h
index aad9c6b50463..3e804fc1b03e 100644
--- a/include/linux/mfd/syscon.h
+++ b/include/linux/mfd/syscon.h
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 
 struct device_node;
+struct device;
 
 #ifdef CONFIG_MFD_SYSCON
 struct regmap *device_node_to_regmap(struct device_node *np);
@@ -30,6 +31,9 @@ struct regmap *syscon_regmap_lookup_by_phandle_optional(struct device_node *np,
 							const char *property);
 int of_syscon_register_regmap(struct device_node *np,
 			      struct regmap *regmap);
+int devm_of_syscon_register_regmap(struct device *dev,
+				   struct device_node *np,
+				   struct regmap *regmap);
 #else
 static inline struct regmap *device_node_to_regmap(struct device_node *np)
 {
@@ -75,6 +79,14 @@ static inline int of_syscon_register_regmap(struct device_node *np,
 	return -EOPNOTSUPP;
 }
 
+static inline int
+devm_of_syscon_register_regmap(struct device *dev,
+			       struct device_node *np,
+			       struct regmap *regmap)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif
 
 #endif /* __LINUX_MFD_SYSCON_H__ */

-- 
2.53.0

