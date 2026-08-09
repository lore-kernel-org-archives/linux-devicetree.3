Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D270F3D8115
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307501; cv=none; b=BK847wpd2kHDyx48Sm7NZYzINKl0Iq4qjrJsVVrWV7Svx6Q//3GZIsZHps9eKayyO+5fgbcgHpFP0K+4QUtNhQcLr+jEwWio4nbX3HX84IxlREZs2pRrn1NRRcEkXjP0kXGphQjT6m7ueOd7wFS3dpq2kLiKS5g5JrP/LzSTNC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307501; c=relaxed/simple;
	bh=i58R4kUjeEz5vQsCEGJKpa6qurPd9dNL1oGizo9/tjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxuiIbotIQRT/3YcA3KukweXHGCJG+7PRfLfdnQ3sd/N1Dee/E+JGpNj1rCrn84iAbkcfziAj04+/HHZaFmRIpbcJThyXZpr5ex0YK3wenZ+mG1itH2mnWGDhF1pcbERgJh16hcjARM3rJ1KU+QPDDTXNpyRPQbKLzOHi9WSbG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQ8y80OS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQ8y80OS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so14826735e9.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307494; x=1786912294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9sD4qTPMESgOu6T7d7y/Hu1jBnuNoPstxoyL6ZC+RA=;
        b=iQ8y80OSEe6FFWCUKWCKdEydwcb8TFDm2bKkUfR9jZLxB3napH7xk+HiX1UqcxYYwE
         KTDsevbyFn8MEpKDiDXIf0lDwWe2Xbb0O6+aodjAh3fCdNORf39aOVCaQm7QKjeDONyJ
         wfqi48KhLUBXCOeiGDhaJAjmfNmYXj3+N7GRQ+n5YpqyyevGY+JYKDEwkNsv/+xw6KXI
         vrNHWAv4zGb1cO1ap1f9eDwR15ZHuIJ6cqZ+M1h1Sy4/FdDmt+fPwx5FaNO822Udfzy8
         QcS0JfKlvyDwapznxwhwBlQmzaJJuBbVE3pV7dywYp//bC7U8AurtQnoTLXpUfanB8PQ
         fVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307494; x=1786912294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9sD4qTPMESgOu6T7d7y/Hu1jBnuNoPstxoyL6ZC+RA=;
        b=R0jAC8pzqaJIVeT4QDU+Fxze5Nfk6U2hcWqg+PPBIfaa141q00KZ6MypCsplhKM3Cl
         SBb2reMqbheaKafqKUQ681CqGOYlTu7NWGqVt6OcfPSRMhBhc3JSZaPnbXwq7+ri7iFP
         Ze+3DDJlrWX/D6Ao7L7JqiVbjVE+exX970PfrRVk2sQNgl6jiEPSNesFT/V5ThWLPxXJ
         JQTPjZMpl44TZatbwyRlCDXnv7pWwtfQkfm4Nfe9ty68ty66LPcRJbHpk88LCBvj0exf
         4ssbZoH+/eBEOclJQKLBnvz65ZayWAqqjpDMiz82yChAquAacHg8wIbyEuAVkyBnSESF
         415Q==
X-Forwarded-Encrypted: i=1; AHgh+RqCf7i09cAp/qq9lBpBz0rwWtBUL02bgsKKfTukzmEZGmHfKvwRyRqBlypT5Vy6tYPbi/TQ/8eMcQfw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3f+SLfciHisXKIlrytwQFnxOb/++XwreBrayvBbdKKtItlRzK
	+7co1UKF6WlfTerReyU8MuphSzt06Wnvt3iWSqhId/GY1cpN50yRlxgC
X-Gm-Gg: AR+sD12KOS0SxR0GpZbBYJITKF35o3ZytarraKG+yzj4DCNMQ//Bc2jsqYM8ODhFSsC
	zvah29t8XraG+HKl5nBz9p4NIt02mPmq4HB7ryfh8ThBQxV8MXJfIwbA1bKOij/jzi/J0M9qplf
	w+StEer4boyl2naGuKUbdvz/gl4fBhROvZZD8ekxLr3rfmAORt3zCwT1vunR39ALGcixDoYJe/Q
	fZg+85egI87+EvPLl50PPdwUKOSqIJNZSVrrXseeCau0PA7eHyVWqj4vPGH/0cFm3RQbLoWLzRg
	DLXdFu3A+zFFSgl4k5GGQu4o8svT4bzRJF7CV8No+CHzQg+wrgnpK9EMHbZiycFHMSsCnHGIySd
	BG2mxEqtwveEGVZx9YYxqA1rwd/ieJezvnK4aDB9UGlagzF0de/NTuUhc4qj+kUOPi10ffas9+w
	1qsIDEDEvfCN5TTglKMjIY9gkRUOD/aW1XA8Kj6flcbIeYtPiiAP0C9yeZs7ZuMD/yw3DvlCXn6
	bZYsNn4erXiGNCNJ/9vpIHYTvFywbztKZyzQdOvxuF6yXSvDczSoOMTBDk=
X-Received: by 2002:a05:600c:3545:b0:499:52dd:c1f0 with SMTP id 5b1f17b1804b1-49952ddd05amr390521785e9.1.1786307493721;
        Sun, 09 Aug 2026 13:31:33 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH net-next v12 03/12] net: pcs: implement Firmware node support for PCS driver
Date: Sun,  9 Aug 2026 22:31:00 +0200
Message-ID: <20260809203116.640271-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the foundation of Firmware node support for PCS driver.

To support this, implement a simple Provider API where a PCS driver can
expose multiple PCS with an xlate .fwnode_xlate function.

PCS driver will have to call fwnode_pcs_add_provider() and pass the
firmware node pointer and a xlate function to return the correct PCS for
the passed #pcs-cells.

This will register the PCS in a global list of providers so that
consumer can access it.

The consumer will then use fwnode_pcs_get() to get the actual PCS by
passing the firmware node pointer and the index for #pcs-cells.

For a simple implementation where #pcs-cells is 0 and the PCS driver
expose a single PCS, the xlate function fwnode_pcs_simple_xlate() is
provided.

For an advanced implementation a custom xlate function is required.

On removal the PCS driver must delete itself from the provider list
using fwnode_pcs_del_provider().

A devm variant devm_fwnode_pcs_add() is provided to automate the release
procedure.

Generic functions fwnode_phylink_pcs_count() and fwnode_phylink_pcs_parse()
are provided for MAC driver that will declare PCS in DT (or ACPI).

Function fwnode_phylink_pcs_count() will parse "pcs-handle" property and
will return the number of PCS entries described in the passed firmware
node.

Function fwnode_phylink_pcs_parse() will parse "pcs-handle" property and
fill the passed available_pcs array with the available PCS found up to
passed num_pcs value. It's worth to mention that this function will ignore
PCS that still needs to be probed (returning -ENODEV) and such PCS won't be
added to the available_pcs array.

Co-developed-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/Kconfig          |   6 +
 drivers/net/pcs/Makefile         |   1 +
 drivers/net/pcs/pcs.c            | 245 +++++++++++++++++++++++++++++++
 include/linux/pcs/pcs-provider.h |  70 +++++++++
 include/linux/pcs/pcs.h          |  74 ++++++++++
 5 files changed, 396 insertions(+)
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
index e417fd66f660..f5c9ca2e992b 100644
--- a/drivers/net/pcs/Kconfig
+++ b/drivers/net/pcs/Kconfig
@@ -5,6 +5,12 @@
 
 menu "PCS device drivers"
 
+config FWNODE_PCS
+	bool "PCS Firmware Node"
+	depends on ACPI || OF || COMPILE_TEST
+	help
+		Firmware node PCS accessors
+
 config PCS_XPCS
 	tristate "Synopsys DesignWare Ethernet XPCS"
 	select PHYLINK
diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index 4f7920618b90..3005cdd89ab7 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
+obj-$(CONFIG_FWNODE_PCS)	+= pcs.o
 pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
 				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
 
diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
new file mode 100644
index 000000000000..c1bb93bc0892
--- /dev/null
+++ b/drivers/net/pcs/pcs.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/phylink.h>
+#include <linux/pcs/pcs.h>
+#include <linux/pcs/pcs-provider.h>
+
+MODULE_DESCRIPTION("PCS library");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
+
+struct fwnode_pcs_provider {
+	struct list_head link;
+
+	struct fwnode_handle *fwnode;
+	struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+					    void *data);
+
+	void *data;
+};
+
+static LIST_HEAD(fwnode_pcs_providers);
+static DEFINE_MUTEX(fwnode_pcs_mutex);
+
+struct phylink_pcs *fwnode_pcs_simple_xlate(struct fwnode_reference_args *pcsspec,
+					    void *data)
+{
+	return data;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_simple_xlate);
+
+struct fwnode_pcs_provider *
+fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
+			struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+							    void *data),
+			void *data)
+{
+	struct fwnode_pcs_provider *pp;
+
+	if (!fwnode)
+		return ERR_PTR(-EINVAL);
+
+	pp = kzalloc_obj(*pp);
+	if (!pp)
+		return ERR_PTR(-ENOMEM);
+
+	pp->fwnode = fwnode_handle_get(fwnode);
+	pp->data = data;
+	pp->fwnode_xlate = fwnode_xlate;
+
+	mutex_lock(&fwnode_pcs_mutex);
+
+	list_add(&pp->link, &fwnode_pcs_providers);
+	fwnode_dev_initialized(fwnode, true);
+
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	pr_debug("Added pcs provider from %pfwf\n", fwnode);
+
+	return pp;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
+
+void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp)
+{
+	if (IS_ERR_OR_NULL(pp))
+		return;
+
+	mutex_lock(&fwnode_pcs_mutex);
+
+	list_del(&pp->link);
+	fwnode_dev_initialized(pp->fwnode, false);
+
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	fwnode_handle_put(pp->fwnode);
+	kfree(pp);
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_del_provider);
+
+static void devm_fwnode_pcs_del(struct device *dev, void *res)
+{
+	struct fwnode_pcs_provider *pp = *(struct fwnode_pcs_provider **)res;
+
+	fwnode_pcs_del_provider(pp);
+}
+
+struct fwnode_pcs_provider *
+devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *fwnode,
+			     struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+								 void *data),
+			     void *data)
+{
+	struct fwnode_pcs_provider **ptr, *pp;
+
+	ptr = devres_alloc(devm_fwnode_pcs_del, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	pp = fwnode_pcs_add_provider(fwnode, fwnode_xlate, data);
+
+	if (!IS_ERR(pp)) {
+		*ptr = pp;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return pp;
+}
+EXPORT_SYMBOL_GPL(devm_fwnode_pcs_add_provider);
+
+static int fwnode_parse_pcsspec(const struct fwnode_handle *fwnode,
+				int index, const char *name,
+				struct fwnode_reference_args *out_args)
+{
+	if (!fwnode)
+		return -EINVAL;
+
+	if (name) {
+		index = fwnode_property_match_string(fwnode, "pcs-names",
+						     name);
+		if (index < 0)
+			return index;
+	}
+
+	return fwnode_property_get_reference_args(fwnode, "pcs-handle",
+						  "#pcs-cells", 0, index,
+						  out_args);
+}
+
+static struct phylink_pcs *
+__fwnode_pcs_get_from_pcsspec_provider(struct fwnode_reference_args *pcsspec,
+				       struct fwnode_pcs_provider *provider)
+{
+	if (provider->fwnode != pcsspec->fwnode)
+		return ERR_PTR(-EINVAL);
+
+	return provider->fwnode_xlate(pcsspec, provider->data);
+}
+
+static struct phylink_pcs *
+fwnode_pcs_get_from_pcsspec(struct fwnode_reference_args *pcsspec)
+{
+	struct fwnode_pcs_provider *provider;
+	struct phylink_pcs *pcs = ERR_PTR(-ENODEV);
+
+	if (!pcsspec)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&fwnode_pcs_mutex);
+	list_for_each_entry(provider, &fwnode_pcs_providers, link) {
+		pcs = __fwnode_pcs_get_from_pcsspec_provider(pcsspec, provider);
+		if (!IS_ERR(pcs))
+			break;
+	}
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	return pcs;
+}
+
+static struct phylink_pcs *__fwnode_pcs_get(const struct fwnode_handle *fwnode,
+					    unsigned int index, const char *con_id)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, con_id, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = fwnode_pcs_get_from_pcsspec(&pcsspec);
+	fwnode_handle_put(pcsspec.fwnode);
+
+	return pcs;
+}
+
+struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned int index)
+{
+	return __fwnode_pcs_get(fwnode, index, NULL);
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get);
+
+unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
+{
+	struct fwnode_reference_args out_args;
+	int index = 0;
+	int ret;
+
+	while (true) {
+		ret = fwnode_property_get_reference_args(fwnode, "pcs-handle",
+							 "#pcs-cells", 0, index,
+							 &out_args);
+		/* We expect to reach an -ENOENT error while counting */
+		if (ret)
+			break;
+
+		fwnode_handle_put(out_args.fwnode);
+		index++;
+	}
+
+	return index;
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_count);
+
+int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+			     struct phylink_pcs **available_pcs,
+			     unsigned int num_pcs)
+{
+	unsigned int i, found = 0;
+
+	if (!available_pcs)
+		return -EINVAL;
+
+	if (!fwnode_property_present(fwnode, "pcs-handle"))
+		return -ENODEV;
+
+	for (i = 0; i < num_pcs; i++) {
+		struct phylink_pcs *pcs;
+
+		pcs = fwnode_pcs_get(fwnode, i);
+		if (IS_ERR(pcs)) {
+			/* Exit early if no PCS remain.*/
+			if (PTR_ERR(pcs) == -ENOENT)
+				break;
+
+			/*
+			 * Ignore -ENODEV error for PCS that still
+			 * needs to probe.
+			 */
+			if (PTR_ERR(pcs) == -ENODEV)
+				continue;
+
+			return PTR_ERR(pcs);
+		}
+
+		available_pcs[found] = pcs;
+		found++;
+	}
+
+	return found;
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_parse);
diff --git a/include/linux/pcs/pcs-provider.h b/include/linux/pcs/pcs-provider.h
new file mode 100644
index 000000000000..15c198ffdd58
--- /dev/null
+++ b/include/linux/pcs/pcs-provider.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __LINUX_PCS_PROVIDER_H
+#define __LINUX_PCS_PROVIDER_H
+
+struct fwnode_pcs_provider;
+
+/**
+ * fwnode_pcs_simple_xlate - Simple xlate function to retrieve PCS
+ * @pcsspec: reference arguments
+ * @data: Context data (assumed assigned to the single PCS)
+ *
+ * Returns: the PCS pointed by data.
+ */
+struct phylink_pcs *fwnode_pcs_simple_xlate(struct fwnode_reference_args *pcsspec,
+					    void *data);
+
+/**
+ * fwnode_pcs_add_provider - Registers a new PCS provider
+ * @fwnode: Firmware node
+ * @fwnode_xlate: xlate function to retrieve the PCS
+ * @data: Context data
+ *
+ * Register and add a new PCS provider to the global providers list
+ * for the firmware node. The relevant PCS from the PCS provider
+ * is retrieved from the passed fwnode_xlate function.
+ *
+ * The xlate function MUST return a pointer to an existing, already-allocated
+ * struct phylink_pcs and MUST NOT dynamically allocate a new PCS.
+ * The same PCS object must be returned for a given firmware reference and args,
+ * as PCS pointer identity is used to associate PCS objects with their provider.
+ *
+ * Returns: A pointer to the registered PCS provider on success, or
+ * an ERR_PTR() encoded error code on failure.
+ */
+struct fwnode_pcs_provider *
+fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
+			struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+							    void *data),
+			void *data);
+
+/**
+ * fwnode_pcs_del_provider - Removes a PCS provider
+ * @pp: PCS provider returned by fwnode_pcs_add_provider()
+ */
+void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp);
+
+/**
+ * devm_fwnode_pcs_add_provider - Registers a new PCS provider
+ * @dev: Device of the PCS provider
+ * @fwnode: Firmware node
+ * @fwnode_xlate: xlate function to retrieve the PCS
+ * @data: Context data
+ *
+ * Register and add a new PCS provider to the global providers list
+ * for the firmware node. The relevant PCS from the PCS provider
+ * is retrieved from the passed fwnode_xlate function. While at that, it
+ * also associates the device with the PCS provider using devres.
+ * On driver detach, release function is invoked on the devres data,
+ * then, devres data is freed.
+ *
+ * Returns: A pointer to the registered PCS provider on success, or
+ * an ERR_PTR() encoded error code on failure.
+ */
+struct fwnode_pcs_provider *
+devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *fwnode,
+			     struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+								 void *data),
+			     void *data);
+
+#endif /* __LINUX_PCS_PROVIDER_H */
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
new file mode 100644
index 000000000000..ef2134c578c7
--- /dev/null
+++ b/include/linux/pcs/pcs.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __LINUX_PCS_H
+#define __LINUX_PCS_H
+
+#include <linux/phylink.h>
+
+#if IS_ENABLED(CONFIG_FWNODE_PCS)
+/**
+ * fwnode_pcs_get - Retrieves a PCS from a firmware node
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative error pointer. Can
+ * return -ENODEV if the PCS is not present in global providers list (either
+ * due to driver still needs to be probed or it failed to probe/removed).
+ */
+struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
+				   unsigned int index);
+
+/**
+ * fwnode_phylink_pcs_count - Count PCS entries described in firmware node
+ * @fwnode: firmware node
+ *
+ * Helper function to count the number of PCS entries referenced by the
+ * "pcs-handle" property in a firmware node.
+ *
+ * Note that this function counts all PCS references in the firmware node,
+ * regardless of whether the corresponding PCS devices are already probed.
+ *
+ * Returns: number of PCS entries described in the firmware node.
+ */
+unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode);
+
+/**
+ * fwnode_phylink_pcs_parse - Parse available PCS from firmware node
+ * @fwnode: firmware node
+ * @available_pcs: pointer to preallocated array of PCS
+ * @num_pcs: maximum number of PCS entries to scan
+ *
+ * Helper function that parses PCS references from the "pcs-handle"
+ * property of a firmware node and fills @available_pcs with PCS that are
+ * currently available up to @num_pcs.
+ *
+ * Only PCS that are currently available are stored in @available_pcs.
+ * PCS that returns -ENODEV are skipped.
+ *
+ * Returns: number of PCS stored in @available_pcs, or negative error code.
+ */
+int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+			     struct phylink_pcs **available_pcs,
+			     unsigned int num_pcs);
+#else
+static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
+						 unsigned int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
+static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
+{
+	return 0;
+}
+
+static inline int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+					   struct phylink_pcs **available_pcs,
+					   unsigned int num_pcs)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* __LINUX_PCS_H */
-- 
2.53.0

