Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C95415F25
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436869; cv=none; b=nwFc6iJw/SOrGmRaGEbw2v//yfqSBorINjRUmuyuioqXFolBn+E8OY+s7e7lPUD8hVu9EPDjaw00AhJmjRx4JOjo9wV3rHEeK0UMVwqrY2W/LQT+3EyMzx6o+afRsu+4x6xCC24T9S13FCsXC+o+JlvvpUu4xMEL3fml0zrt3dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436869; c=relaxed/simple;
	bh=IzRlEU23yfQQ6x4BYmQXGZqejxD9TteX1wiEO5R8YME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPAn70OLIq/yT9CNDHONLbazpmGj4QRI/wLVOu1UEtk6M8/djlaVYOf8jJI4UxBh/jOu2iitUIT7wUR0AAmAuz9UK0eA+hbfnuiAGoKZ36dPkRAfG27XUjv30FFKQfwD3cWtEPaDt98MmF7vzci13e9Qhq3yGYEgQN1lOIl00N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtdVI2b/; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtdVI2b/"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4af173320f9so1470276b6e.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436867; x=1787041667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyzPxN0hN+8W2JU9IAdx12pcVnDBJDk0tQrb35djIKE=;
        b=EtdVI2b/D3bDM3lFQnz5p2POUYPO36ver9oYtWmCUsd28/gYM2LYR4wPynBeDZfFic
         VfEz1PQiOleHeI+T5RIOcY1V/rR1PDDpF6iY9gr07NDdBXK0IqC5PjiHnBWPpwD6pGW1
         jiNT9hLwOri7RYr/7hZRdoygTZEZOYZ7Mo9nuNCj4mk4tj161O2fzV2aewYjRH75jGbs
         c0d57uSkhlA7YtK/aWz4boEF9WIFsDF3W4eodKs0tzLhkBrIfb7+niVQXmOpdtK5FdrV
         nXAjUJKSSs8yalfrl9gFY+bJzQ8PHyU+SgMW+OYgrhjLowBt4CUGzAS/cSCQ4YTXscra
         DCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436867; x=1787041667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyzPxN0hN+8W2JU9IAdx12pcVnDBJDk0tQrb35djIKE=;
        b=c6qmPHV4Vp1eStKFKHan34NJz1SZcc2lKGc9k9WC7cs1ckqXCuhwj8AOLUXWtOkpyi
         CDEegyTS2AMZpOnNkEX4idsow4WglOjAEw5HoKuF7bmMfdSDLZrj9RyUNHdIZ/kJevmc
         rndIfwaKJ61fUZxgHrcenjC+fusUfx7HAsDkPAw93FvI36Cd1Wmtblcz+aQxXoyBYani
         UCsE1LCMDpcj3rz++Kk0FrMOxjYwYlzxq6CTP6IFtgfKVNd0CTAWRbMmbCS2i4yaci/5
         +5TFdIaGiuW+/k+OP7crhwjkzz+piPUR1PFuiBIM1VpUQuzuLVns9CRvMXLAYpVHFsTV
         e5Jg==
X-Forwarded-Encrypted: i=1; AHgh+RrZi6I6XZk9a5NWOQV2RYpF8T16eHfb19gMzKgMTbqlTTLvvhTStPdamEbWBybZowbqL7/TS3zCs2oz@vger.kernel.org
X-Gm-Message-State: AOJu0YwcarUr1U33nYSfv4vjq35nN/89KG+tPajYK1Rc5rBcLGO3MdzZ
	J8whQde0jf76l7dllKdAmThT6lX1IQyPIG93RgScxTyeETS+byqQ8ivnFNP4R2XT
X-Gm-Gg: AR+sD10dLySjOs7njhyDohQzc49Ma19e1c+oile7uXMPVDAv/jk3t0iGZ5JZVf9J35B
	oblU8nQ1Gg35zmBEVm8bsH0HcgZTuNlWeW38cpiG77w0t9hh4EIM5CCX7sunGFuxVrZYbuj/o8w
	fV5HV4jnQvRTZkeI99I2TZE0VAtsVgXGl0dXgxi+TOh03WGkFdF8fALGojwITqJLJxUZ6kkx4Uu
	Y27ZoW7AqoZSkpI/P7lElVj4uPfifWntCNfM6R+XRflkFQWLoISDAVbNLgWZyIK5IpkqeiihB6N
	7J0974zZ4ltkureOrNtudZQR1NZhowJrr2oxL/FV9shVgaFStuOQWMJ2Ulc0+4GRCWXf4jgHKad
	7BA9BMEWa3A7ktMN/UKOCm3kymdYntjv5on4LgO2DLgF2PCCPQkW+vjBCqvPhmVlKcDt3Au9isJ
	6iT9RJeOPrlURyTXNoJm9OoXEo2Li13A5By7Rzt1yYE/bBuwYUyJOodp5Jw2RlUoWLYJB73nSHY
	6yLy1SDKMCBcRgmhOE96xZV2++54MtdVzokDq1vneOGkIiln9Tna7/Cy4vuZNMpcRq2Vi9Zkaxi
	nr5vz1JiMB08Kl4W6lnz/HyC/Rw5C5M9RLRJ0SRF9s7syvB0wEAP3WSbntC1YALKDD7OROl8YKr
	GagYatoPZubCu6oSG
X-Received: by 2002:a05:6808:bc6:b0:495:da3c:1aa with SMTP id 5614622812f47-4b1fd9af94amr998551b6e.16.1786436866871;
        Tue, 11 Aug 2026 01:27:46 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1fff55fdcsm318095b6e.6.2026.08.11.01.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:27:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 02:27:24 -0600
Subject: [PATCH v6 2/3] mfd: syscon: Add managed registration for external
 regmaps
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-ac200-mfd-v6-2-c5b1292c8498@gmail.com>
References: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
In-Reply-To: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

